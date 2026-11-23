#!/usr/bin/env bash
# Mirrors a GeoEdge AppHarbr SDK release to Miniclip's Artifactory.
#
#   iOS      GeoEdge's zip, unchanged, for CocoaPods (AppHarbrSDK podspec) and Swift Package Manager:
#            sdk-cocoapods-release-local/AppHarbrSDK/AppHarbrSDK-<version>.zip
#   Android  GeoEdge's AAR, with a POM whose dependencies are copied from AppHarbr's JitPack POM:
#            sdk-gradle-release-local/com/miniclip/thirdparty/appharbr-android-sdk/<version>/
#            (Gradle: com.miniclip.thirdparty:appharbr-android-sdk:<version>)
#
# A binary that doesn't match AppHarbr's public release byte for byte (CocoaPods trunk source zip,
# JitPack AAR) is not uploaded. An artifact already on Artifactory is skipped when identical and
# refused when different: a release is never overwritten.
#
# Credentials: ARTIFACTORY_USERNAME / ARTIFACTORY_PASSWORD (as in the publish workflows),
# otherwise a ~/.netrc entry for miniclip.jfrog.io.
#
# Usage: scripts/mirror_appharbr.sh [--dry-run] [--ios AH-SDK-iOS-<version>.zip] [--android AH-SDK-Android-<version>.aar]
set -euo pipefail

ARTIFACTORY=https://miniclip.jfrog.io/artifactory
IOS_REPO=sdk-cocoapods-release-local
ANDROID_REPO=sdk-gradle-release-local
ANDROID_GROUP=com.miniclip.thirdparty
ANDROID_ARTIFACT=appharbr-android-sdk
TRUNK_SPECS=https://cdn.cocoapods.org/Specs/7/2/f/AppHarbrSDK   # shard of md5("AppHarbrSDK")
JITPACK=https://jitpack.io/com/github/appharbr/appharbr-android-sdk

DRY_RUN=""; IOS_ZIP=""; ANDROID_AAR=""
while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --ios) IOS_ZIP=$2; shift ;;
    --android) ANDROID_AAR=$2; shift ;;
    -h|--help) sed -n '2,20p' "$0"; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
  shift
done
[ -n "$IOS_ZIP$ANDROID_AAR" ] || { echo "Nothing to mirror: pass --ios and/or --android." >&2; exit 2; }

WORK=$(mktemp -d); trap 'rm -rf "$WORK"' EXIT

sha256() { shasum -a 256 "$1" | cut -d' ' -f1; }

# The version in a vendor file name: AH-SDK-iOS-1.39.0.zip -> 1.39.0
version_of() { basename "$1" | sed -E 's/^AH-SDK-(iOS|Android)-([0-9][0-9A-Za-z.+-]*)\.(zip|aar)$/\2/'; }

# curl with the deploy credentials; they never appear on the command line.
curl_auth() {
  if [ -n "${ARTIFACTORY_USERNAME:-}" ] && [ -n "${ARTIFACTORY_PASSWORD:-}" ]; then
    curl -K <(printf 'user = "%s:%s"\n' "$ARTIFACTORY_USERNAME" "$ARTIFACTORY_PASSWORD") "$@"
  else
    curl --netrc "$@"
  fi
}

# Uploads $1 to $2 unless an identical artifact is already there, then checks the anonymous download.
deploy() {
  local file=$1 url=$2 sum existing
  sum=$(sha256 "$file")
  local headers="$WORK/deploy.headers" status
  status=$(curl -sS -I -D "$headers" -o /dev/null -w '%{http_code}' "$url") || {
    echo "  REFUSED: unable to check whether $url exists" >&2; return 1;
  }
  case "$status" in
    200)
      existing=$(awk -F': ' 'tolower($1)=="x-checksum-sha256" {print $2}' "$headers" | tr -d '\r')
      [ -n "$existing" ] || { echo "  REFUSED: no SHA-256 checksum returned for $url" >&2; return 1; }
      ;;
    404) existing="" ;;
    *) echo "  REFUSED: could not check $url (HTTP $status)" >&2; return 1 ;;
  esac
  if [ -n "$existing" ]; then
    [ "$existing" = "$sum" ] && { echo "  already published, identical: $url"; return 0; }
    echo "  REFUSED: $url already exists with sha256 $existing (local $sum)" >&2; return 1
  fi
  if [ -n "$DRY_RUN" ]; then echo "  would upload $(basename "$file") ($sum) -> $url"; return 0; fi

  curl_auth --fail -sS -o /dev/null -T "$file" \
    -H "X-Checksum-Sha256: $sum" -H "X-Checksum-Sha1: $(shasum -a 1 "$file" | cut -d' ' -f1)" -H "X-Checksum: $(md5 -q "$file")" \
    "$url"
  curl -sfL -o "$WORK/check" "$url"
  [ "$(sha256 "$WORK/check")" = "$sum" ] || { echo "  FAILED: the download of $url doesn't match" >&2; return 1; }
  echo "  uploaded and verified: $url"
}

mirror_ios() {
  local zip=$1 version upstream url
  version=$(version_of "$zip")
  echo "iOS AppHarbrSDK $version"
  upstream=$(curl -sfL "$TRUNK_SPECS/$version/AppHarbrSDK.podspec.json" | python3 -c 'import json,sys; print(json.load(sys.stdin)["source"]["http"])') \
    || { echo "  AppHarbrSDK $version is not on CocoaPods trunk" >&2; return 1; }
  curl -sfL -o "$WORK/upstream.zip" "$upstream"
  [ "$(sha256 "$WORK/upstream.zip")" = "$(sha256 "$zip")" ] || { echo "  $zip differs from GeoEdge's release ($upstream)" >&2; return 1; }
  echo "  matches GeoEdge's release: $upstream"

  url="$ARTIFACTORY/$IOS_REPO/AppHarbrSDK/AppHarbrSDK-$version.zip"
  deploy "$zip" "$url"
  echo "  CocoaPods source: { :http => \"$url\", :sha256 => '$(sha256 "$zip")' }"
  echo "  Swift Package:    .binaryTarget(name: \"AppHarbrSDK\", url: \"$url\", checksum: \"$(sha256 "$zip")\")"
}

mirror_android() {
  local aar=$1 version base
  version=$(version_of "$aar")
  echo "Android $ANDROID_GROUP:$ANDROID_ARTIFACT:$version"
  curl -sfL -o "$WORK/upstream.aar" "$JITPACK/$version/appharbr-android-sdk-$version.aar" \
    && curl -sfL -o "$WORK/upstream.pom" "$JITPACK/$version/appharbr-android-sdk-$version.pom" \
    || { echo "  appharbr-android-sdk $version is not on JitPack" >&2; return 1; }
  [ "$(sha256 "$WORK/upstream.aar")" = "$(sha256 "$aar")" ] || { echo "  $aar differs from AppHarbr's JitPack release" >&2; return 1; }
  echo "  matches AppHarbr's JitPack release"

  # Our POM: Miniclip coordinates, AppHarbr's dependencies.
  python3 - "$WORK/upstream.pom" "$WORK/$ANDROID_ARTIFACT-$version.pom" "$ANDROID_GROUP" "$ANDROID_ARTIFACT" "$version" <<'PY'
import sys, xml.etree.ElementTree as ET
src, out, group, artifact, version = sys.argv[1:]
ns = {"m": "http://maven.apache.org/POM/4.0.0"}
deps = []
for d in ET.parse(src).getroot().findall("m:dependencies/m:dependency", ns):
    get = lambda tag: (d.findtext("m:" + tag, default="", namespaces=ns) or "").strip()
    deps.append((get("groupId"), get("artifactId"), get("version"), get("scope") or "compile"))
dep_xml = "".join(
    f"    <dependency>\n      <groupId>{g}</groupId>\n      <artifactId>{a}</artifactId>\n      <version>{v}</version>\n      <scope>{s}</scope>\n    </dependency>\n"
    for g, a, v, s in deps)
open(out, "w").write(f"""<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>{group}</groupId>
  <artifactId>{artifact}</artifactId>
  <version>{version}</version>
  <packaging>aar</packaging>
  <name>AppHarbr Android SDK</name>
  <description>GeoEdge's AppHarbr Android SDK {version}, unchanged (com.github.appharbr:appharbr-android-sdk:{version} on JitPack). Don't use both coordinates in one app.</description>
  <url>https://appharbr.com</url>
  <licenses>
    <license>
      <name>Copyright GeoEdge Ltd.</name>
    </license>
  </licenses>
  <dependencies>
{dep_xml}  </dependencies>
</project>
""")
PY
  echo "  dependencies: $(grep -c '<dependency>' "$WORK/$ANDROID_ARTIFACT-$version.pom")"

  base="$ARTIFACTORY/$ANDROID_REPO/$(echo "$ANDROID_GROUP" | tr . /)/$ANDROID_ARTIFACT/$version/$ANDROID_ARTIFACT-$version"
  deploy "$aar" "$base.aar"
  deploy "$WORK/$ANDROID_ARTIFACT-$version.pom" "$base.pom"
  echo "  Gradle: implementation(\"$ANDROID_GROUP:$ANDROID_ARTIFACT:$version\") from $ARTIFACTORY/sdk-gradle-release"
}

[ -z "$DRY_RUN" ] || echo "Dry run: nothing is uploaded."
[ -z "$IOS_ZIP" ] || mirror_ios "$IOS_ZIP"
[ -z "$ANDROID_AAR" ] || mirror_android "$ANDROID_AAR"
