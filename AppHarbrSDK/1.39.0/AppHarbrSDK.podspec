Pod::Spec.new do |spec|
  spec.name                  = 'AppHarbrSDK'
  spec.version               = '1.39.0'
  spec.summary               = 'AppHarbr by GeoEdge: Secure, High-Quality Ads for Optimal User Experience'
  spec.description           = <<-DESC
  GeoEdge's AppHarbr iOS SDK, hosted on Miniclip's Artifactory. The binary is GeoEdge's release zip, unchanged:
  the same file as the CocoaPods trunk AppHarbrSDK source for this version.
  DESC
  spec.homepage              = 'https://appharbr.com'
  spec.license               = { :type => 'Copyright', :text => 'Copyright 2026 GeoEdge Ltd.' }
  spec.authors               = 'GeoEdge Ltd.'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/AppHarbrSDK/AppHarbrSDK-#{spec.version}.zip",
                                 :sha256 => 'ea7bf25d27531521d1e111ac7d131997d7f7cd744e6c8786b34355167a55af42' }
  spec.platform              = :ios, '12.0'
  spec.swift_versions        = '5.0'
  spec.vendored_frameworks   = 'AppHarbrSDK.xcframework'
end
