Pod::Spec.new do |spec|
  spec.name                   = 'OneRing'
  spec.version                = '1.3.1'
  spec.license                = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.source                 = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/OneRing/OneRing-#{spec.version}.tar.gz" }
  spec.summary                = 'Shared modules for SDK Engineering projects'
  spec.homepage               = 'https://stash.miniclip.com/scm/sdk/one-ring-ios.git'
  spec.authors                = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary                = 'OneRing SDK is an SDK for shared codebase'
  spec.description            = <<-DESC
  OneRing holds the codebase for the modules which will be shared between the various SDK Engineering projects.
  DESC
  spec.ios.deployment_target  = '11.0'
  spec.static_framework       = true
  spec.platform               = :ios
  spec.vendored_frameworks    = 'OneRing.xcframework'

end
