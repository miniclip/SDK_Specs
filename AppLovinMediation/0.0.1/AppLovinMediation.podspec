Pod::Spec.new do |spec|
  spec.name                  = 'AppLovinMediation'
  spec.version               = '0.0.1'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/m-ads-ios-applovin-mediation/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/AppLovinMediation/AppLovinMediation-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = 'AppLovinMediation for MAds iOS software development kit'
  spec.vendored_frameworks   = 'AppLovinMediation.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '12.0'
end