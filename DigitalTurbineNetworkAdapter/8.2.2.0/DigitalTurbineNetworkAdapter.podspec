Pod::Spec.new do |spec|
    spec.name                  = 'DigitalTurbineNetworkAdapter'
    spec.version               = '8.2.2.0'
    spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
    spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/ulam-ios-digitalturbine-adapter/'
    spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/DigitalTurbineNetworkAdapter/DigitalTurbineNetworkAdapter-#{spec.version}.tar.gz" }
    spec.authors               = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary               = 'DigitalTurbineNetworkAdapter is an adapter for the DigitalTurbine ad network'
    spec.vendored_frameworks   = 'DigitalTurbineNetworkAdapter.xcframework'
    spec.platform              = :ios
    spec.static_framework      = true
    spec.ios.deployment_target = '11.0'
    spec.dependency 'ULAM', '>= 1.0.0'
    spec.dependency 'Fyber_Marketplace_SDK', '8.2.2'
  end
