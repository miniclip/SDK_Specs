Pod::Spec.new do |spec|
  spec.name                  = 'MADS_iOS'
  spec.version               = '2.1.0'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'http://miniclip.com'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/MADS_iOS/MADS_iOS-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = 'MAds iOS software development kit, or M-Ads SDK, is code suite that lets mobile apps connect to the M-Ads services and technologies'
  spec.vendored_frameworks   = 'MADS_iOS.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '13.0'
  spec.swift_versions = ['5.6', '5.7', '5.8', '5.9']
end
