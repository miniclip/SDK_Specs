Pod::Spec.new do |spec|
    spec.name         = 'ULAM'
    spec.version      = '0.6.0'
    spec.license      = { :type => 'Private' }
    spec.homepage     = 'https://ulam.cf.miniclip.com/'
    spec.source       = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/ULAM/ULAM-0.5.0.tar.gz" } #delete
    spec.authors      = { 'SDK ULAM team' => 'ulam-team@miniclip.com' }
    spec.summary      = 'Ulam is a sdk to handle ads'
    spec.vendored_frameworks = 'ULAM.xcframework'
    spec.platform = :ios
    spec.static_framework = true
    spec.ios.deployment_target  = '11.0'
    spec.swift_version = '5.0'
  end
