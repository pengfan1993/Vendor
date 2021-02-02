#
# Be sure to run `pod lib lint ZZVendor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZZVendor'
  s.version          = '0.1.4'
  s.summary          = 'an easy package based on thrid library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: an easy package collections based on Alamofire, Toast, snapkit,SVProgressHUD.
                       DESC

  s.homepage         = 'https://github.com/pengfan1993/ZZVendor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pengfan' => 'pf18186362568@163.com' }
  s.source           = { :git => 'https://github.com/pengfan1993/ZZVendor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.platform     = :ios, '10.0' # 支持的平台及版本

  s.source_files = 'ZZVendor/Classes/ZZVendor.h'
  
   s.resource_bundles = {
     'ZZVendor' => ['ZZVendor/Assets/*.{mp3}']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  
  #subspec:文件子层级
  s.subspec 'HUD' do |ss|
      ss.source_files = 'ZZVendor/Classes/HUD/*'
  end
  
  s.subspec 'Network' do |ss|
      ss.source_files = 'ZZVendor/Classes/Network/*'
  end
  
  s.subspec 'Toast' do |ss|
      ss.source_files = 'ZZVendor/Classes/Toast/*'
  end
  
  s.subspec 'KeepAlive' do |ss|
      ss.source_files = 'ZZVendor/Classes/KeepAlive/*'
  end
  
   s.dependency 'Alamofire', '~> 4.8.2'
   s.dependency 'SnapKit', '~> 5.0.1'
   s.dependency 'SVProgressHUD', '~> 2.2.5'
   s.dependency 'Toast', '~> 3.1.0'
   
   s.swift_version = '5.0'
end
