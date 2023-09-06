Pod::Spec.new do |spec|
    spec.name                  = 'InMobiNetworkAdapter'
    spec.version               = '10.1.3.0'
    spec.license               = { :type => 'Private' }
    spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/ulam-ios-inmobi-adapter/'
    spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/InMobiNetworkAdapter/InMobiNetworkAdapter-#{spec.version}.tar.gz" }
    spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary               = 'InMobiNetworkAdapter is an adapter for the InMobi ad network'
    spec.vendored_frameworks   = 'InMobiNetworkAdapter.xcframework'
    spec.platform              = :ios
    spec.static_framework      = true
    spec.ios.deployment_target = '11.0'
    spec.dependency 'ULAM', '>= 1.0.0'
    spec.dependency 'InMobiSDK', '10.1.3'
  end
