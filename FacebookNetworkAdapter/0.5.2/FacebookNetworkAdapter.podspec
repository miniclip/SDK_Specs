Pod::Spec.new do |spec|
    spec.name                  = 'FacebookNetworkAdapter'
    spec.version               = '0.5.2'
    spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
    spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/ulam-ios-facebook-adapter/'
    spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/FacebookNetworkAdapter/FacebookNetworkAdapter-#{spec.version}.tar.gz" }
    spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary               = 'FacebookNetworkAdapter is an adapter for the Facebook ad network'
    spec.vendored_frameworks   = 'FacebookNetworkAdapter.xcframework'
    spec.platform              = :ios
    spec.static_framework      = true
    spec.ios.deployment_target = '11.0'
    spec.dependency 'ULAM', '>= 0.5', '< 0.6'
    spec.dependency 'FBAudienceNetwork', '6.12.0'
  end
