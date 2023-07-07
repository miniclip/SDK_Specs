Pod::Spec.new do |spec|
  spec.name                  = 'GoogleAdsNetworkAdapters'
  spec.version               = '0.6.0'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/ulam-ios-admob-adapter/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/GoogleAdsNetworkAdapters/GoogleAdsNetworkAdapters-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
  spec.summary               = 'GoogleAdsNetworkAdapters is a collection of adapter for the Google Ad Manager and AdMob'
  spec.vendored_frameworks   = ['AdmobNetworkAdapter.xcframework','GoogleAdManagerNetworkAdapter.xcframework']
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '11.0'
  spec.dependency 'Google-Mobile-Ads-SDK', '10.3.0'
  spec.dependency 'ULAM', '>= 0.6', '< 0.7'
end