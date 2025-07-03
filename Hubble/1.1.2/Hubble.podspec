Pod::Spec.new do |spec|
  spec.name = 'Hubble'
  # This version is automatically generated based on the marketing version in the SDK settings file.
  spec.version = '1.1.2'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/hubble-ios-sdk/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/Hubble/Hubble-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdkteam@miniclip.com' }
  spec.summary               = 'Hubble - Future painless data'
  spec.vendored_frameworks   = "Hubble.xcframework"
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '12.0'
end

