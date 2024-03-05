#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ultron_screenshot_shield.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ultron_screenshot_shield'
  s.version          = '1.1.0'
  s.summary          = 'A new Flutter plugin project for Enable/Disable Screenshot'
  s.description      = <<-DESC
  A new Flutter plugin project for Enable/Disable Screenshot
                       DESC
  s.homepage         = 'http://gtech.digital'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Gtech Digital' => 'ultron@gtech.digital' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*', 'Classes/*.swift'
  s.dependency      'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
