Pod::Spec.new do |spec|
    spec.name                  = 'AdMobNetworkAdapter'
    spec.version               = '0.5.2'
    spec.license               = { :type => 'Private' }
    spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/ulam-ios-admob-adapter/'
    spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/AdMobNetworkAdapter/AdMobNetworkAdapter-#{spec.version}.tar.gz" }
    spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary               = 'AdMobNetworkAdapter is an adapter for the AdMob ad network'
    spec.vendored_frameworks   = 'AdMobNetworkAdapter.xcframework'
    spec.platform              = :ios
    spec.static_framework      = true
    spec.ios.deployment_target = '11.0'
    spec.dependency 'Google-Mobile-Ads-SDK', '10.3.0'
    spec.dependency 'ULAM', '~> 0.5'
  end
