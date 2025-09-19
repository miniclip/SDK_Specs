Pod::Spec.new do |spec|
  spec.name                 = 'ODCAdapter'
  spec.version              = '1.2.0'
  spec.summary              = 'Miniclip Network Adapter for App Lovin'
  spec.homepage             = 'http://miniclip.com'
  spec.license              = { :type => 'CUSTOM', :file => 'LICENSE' }
  spec.source               = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/ODCAdapter/ODCAdapter-#{spec.version}.tar.gz" }
  spec.authors              = { 'Miniclip' => 'miniclip@miniclip.com' }
  spec.platform             = :ios, '12.0'
  spec.vendored_frameworks  = 'ODCAdapter.xcframework'
end
