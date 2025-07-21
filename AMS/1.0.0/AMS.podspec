Pod::Spec.new do |spec|
  spec.name                  = 'AMS'
  spec.version               = '1.0.0'
  spec.summary               = 'Miniclip Network for Ads'
  spec.homepage              = 'https://miniclip.com/'
  spec.license              = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/AMS/AMS-#{spec.version}.tar.gz" }
  spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
  spec.platform             = :ios, '12.0'
  spec.vendored_frameworks   = 'AMS.xcframework'
end
