Pod::Spec.new do |spec|
    spec.name                  = 'IronSourceNetworkAdapter'
    spec.version               = '0.5.4'
    spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
    spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/ulam-ios-ironsource-adapter/'
    spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/IronSourceNetworkAdapter/IronSourceNetworkAdapter-#{spec.version}.tar.gz" }
    spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary               = 'IronSourceNetworkAdapter is an adapter for the IronSource ad network'
    spec.vendored_frameworks   = 'IronSourceNetworkAdapter.xcframework'
    spec.platform              = :ios
    spec.static_framework      = true
    spec.ios.deployment_target = '11.0'
    spec.dependency 'ULAM', '>= 0.5', '< 0.6'
    spec.dependency 'IronSourceSDK','7.3.0.0'
  end
