Pod::Spec.new do |spec|
  spec.name                  = 'IronSourceAdSurgeMAdsAdapter'
  spec.module_name           = 'IronSourceAdSurgeMAdsAdapter'
  spec.version               = '5.0.0'
  spec.license               = { :type => 'Commercial', :file => 'LICENSE' }
  spec.homepage              = 'https://github.com/ironsource-mobile/levelplay-ios-adapters'
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/IronSourceAdSurgeMAdsAdapter/IronSourceAdSurgeMAdsAdapter-#{spec.version}.tar.gz",
                                 :sha256 => '48e146c9f0244455eb15ea842a763daa486abb49accd74e2ba32dfefc8ca9fe6' }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.summary               = "Unity LevelPlay's official AdSurge adapter 5.0.0, hosted by M-Ads until Unity publishes it"
  spec.vendored_frameworks   = 'IronSourceAdSurgeMAdsAdapter.xcframework'
  spec.platform              = :ios
  spec.static_framework      = true
  spec.ios.deployment_target = '13.0'
  spec.dependency 'IronSourceSDK/Ads', '~> 9.0'
  spec.dependency 'AdSurgeADN', '~> 2.0.2'
end
