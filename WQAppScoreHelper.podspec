#
# Be sure to run `pod lib lint WQAppScoreHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WQAppScoreHelper'
  s.version          = '0.1.3'
  s.summary          = '提示用户评分的简单功能'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  提示用户前往appStore评分的功能
                       DESC

  s.homepage         = 'https://github.com/hapiii/WQAppScoreHelper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hapiii' => '869932084@qq.com' }
  s.source           = { :git => 'https://github.com/hapiii/WQAppScoreHelper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'WQAppScoreHelper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WQAppScoreHelper' => ['WQAppScoreHelper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
