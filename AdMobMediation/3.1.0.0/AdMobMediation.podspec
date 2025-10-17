Pod::Spec.new do |spec|
  spec.name                  = 'AdMobMediation'
  spec.version               = '3.1.0.0'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://github.com/miniclip/m-ads-ios-admob-mediation'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/AdMobMediation/AdMobMediation-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = 'AdMobMediation for MAds iOS software development kit'
  spec.vendored_frameworks   = 'AdMobMediation.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '13.0'
  spec.frameworks = 'AppTrackingTransparency', 'StoreKit', 'MobileCoreServices', 'WebKit', 'MediaPlayer', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'SystemConfiguration', 'AdSupport', 'CoreMotion', 'Accelerate', 'Security', 'JavaScriptCore', 'AudioToolbox'
  spec.libraries = 'resolv.9', 'c++', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
end
