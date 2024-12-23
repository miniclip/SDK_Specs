Pod::Spec.new do |spec|
  spec.name                  = 'IronSourceMediation'
  spec.version               = '1.7.0.0'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/m-ads-ios-ironsource-mediation/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/IronSourceMediation/IronSourceMediation-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = 'IronSourceMediation for Miniclip MAds iOS software development kit'
  spec.vendored_frameworks   = 'IronSourceMediation.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '12.0'
end
