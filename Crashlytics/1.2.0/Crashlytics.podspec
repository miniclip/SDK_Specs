Pod::Spec.new do |spec|
    spec.name                  = 'Crashlytics'
    spec.version               = '1.2.0'
    spec.license               = { :type => 'CUSTOM', :file => 'LICENSE' }
    spec.homepage              = 'https://stash.miniclip.com/projects/SDK/repos/crashlytics-ios-sdk/'
    spec.source                = { :http => "https://miniclip.jfrog.io/artifactory/sdk-cocoapods-release-local/Crashlytics/Crashlytics-#{spec.version}.tar.gz" }
    spec.authors               = { 'SDK team' => 'sdk.engineering@miniclip.com' }
    spec.summary               = 'Crashlytics SDK is an SDK for crashes & analytics'
    spec.vendored_frameworks   = 'Crashlytics.xcframework'
    spec.platform              = :ios
    spec.static_framework      = true
    spec.ios.deployment_target = '12.0'
  end
