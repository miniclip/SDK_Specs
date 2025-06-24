Pod::Spec.new do |spec|
  spec.name                  = 'Bacon'
  spec.version               = '2.0.0'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/bacon-ios-sdk/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/Bacon/Bacon-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = 'Bacon SDK is an SDK for Consent Management'
  spec.vendored_frameworks   = 'Bacon.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '12.0'
  spec.dependency 'GoogleUserMessagingPlatform', '~>2'
end
