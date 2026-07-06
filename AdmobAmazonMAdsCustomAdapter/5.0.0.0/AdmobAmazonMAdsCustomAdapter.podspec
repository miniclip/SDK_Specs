Pod::Spec.new do |spec|
  spec.name                  = 'AdmobAmazonMAdsCustomAdapter'
  spec.module_name           = 'AdmobAmazonMAdsCustomAdapter'
  spec.version               = '5.0.0.0'
  spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/m-ads-ios-admob-amazon-custom-adapter/'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/AdmobAmazonMAdsCustomAdapter/AdmobAmazonMAdsCustomAdapter-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = 'Amazon Custom Adapter for AdmobMediation for M-Ads iOS software development kit'
  spec.vendored_frameworks   = 'AdmobAmazonMAdsCustomAdapter.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '13.0'
  spec.frameworks = 'AppTrackingTransparency', 'StoreKit', 'MobileCoreServices', 'WebKit', 'MediaPlayer', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'SystemConfiguration', 'AdSupport', 'CoreMotion', 'Accelerate', 'Security', 'JavaScriptCore', 'AudioToolbox'
  spec.libraries = 'resolv.9', 'c++', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
end
