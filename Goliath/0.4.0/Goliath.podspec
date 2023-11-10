Pod::Spec.new do |spec|
  spec.name                  = 'Goliath'
  # This version is automatically generated based on the marketing version in the SDK settings file.
  spec.version = '0.4.0'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/goliath-ios-sdk/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-dev-local/Goliath/Goliath-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdkteam@miniclip.com' }
  spec.summary               = 'Goliath - Future painless data'
  spec.vendored_frameworks   = "Goliath.xcframework"
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '12.0'
end

