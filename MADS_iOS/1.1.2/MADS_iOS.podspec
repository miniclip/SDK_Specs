Pod::Spec.new do |spec|
  spec.name                  = 'MADS_iOS'
  spec.version               = '1.1.2'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/m-ads-ios-sdk/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/MADS_iOS/MADS_iOS-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = 'M-Ads iOS software development kit, or M-Ads SDK, is code suite that lets mobile apps connect to the M-Ads services and technologies'
  spec.vendored_frameworks   = 'MADS_iOS.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '12.0'
  spec.swift_versions = ['5.6', '5.7', '5.8', '5.9']
end
