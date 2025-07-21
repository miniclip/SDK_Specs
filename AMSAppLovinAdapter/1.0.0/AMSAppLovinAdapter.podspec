Pod::Spec.new do |spec|
  spec.name                 = 'AMSAppLovinAdapter'
  spec.version              = '1.0.0'
  spec.summary              = 'AMS Adapter for App Lovin'
  spec.homepage             = 'http://miniclip.com'
  spec.license              = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.source               = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/AMSAppLovinAdapter/AMSAppLovinAdapter-#{spec.version}.tar.gz" }
  spec.authors              = { 'Miniclip' => 'miniclip@miniclip.com' }
  spec.platform             = :ios, '12.0'
  spec.vendored_frameworks  = 'AMSAppLovinAdapter.xcframework'
end
