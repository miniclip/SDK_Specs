Pod::Spec.new do |spec|
    spec.name                  = 'UnityAdsNetworkAdapter'
    spec.version               = '4.6.1.0'
    spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
    spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/ulam-ios-unitynetworkadapter-adapter/'
    spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/UnityAdsNetworkAdapter/UnityAdsNetworkAdapter-#{spec.version}.tar.gz" }
    spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary               = 'UnityAdsNetworkAdapter is an adapter for the UnityNetworkAdapter ad network'
    spec.vendored_frameworks   = 'UnityAdsNetworkAdapter.xcframework'
    spec.platform              = :ios
    spec.static_framework      = true
    spec.ios.deployment_target = '11.0'
    spec.dependency 'ULAM', '>= 1.0.0'
    spec.dependency 'UnityAds', '4.6.1'
  end
