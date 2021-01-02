#
# Be sure to run `pod lib lint LayoutSugar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UILayoutSugar'
  s.version          = '1.0.0'
  s.summary          = '快速创建约束的语法糖'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  快速创建约束的语法糖
                       DESC

  s.homepage         = 'https://github.com/ChaselAn/UILayoutSugar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChaselAn' => '865770853@qq.com' }
  s.source           = { :git => 'https://github.com/ChaselAn/UILayoutSugar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'LayoutSugar/LayoutSugar/Classes/*.swift'
  s.swift_versions = ['4.0', '4.1', '4.2', '5.0', '5.1', '5.2', '5.3']
end
