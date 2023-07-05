Pod::Spec.new do |spec|
    spec.name         = 'ULAM-STAGING'
    spec.version      = '0.5.5'
    spec.license      = { :type => 'CUSTOM', :file => 'LICENSE' }
    spec.homepage     = 'https://ulam.cf.miniclip.com/'
    spec.source       = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-dev-local/ULAM/ULAM-#{spec.version}.tar.gz" }
    spec.authors      = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary      = 'Ulam is a sdk to handle ads'
    spec.vendored_frameworks = 'ULAM.xcframework'
    spec.platform = :ios
    spec.static_framework = true
    spec.ios.deployment_target  = '11.0'
  end
