#
# Be sure to run `pod lib lint ASRadioGroup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ASRadioGroup'
  s.version          = '1.0.8'
  s.summary          = 'ASRadioGroup for Radio Option Selection'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 ASRadioGroup is an awesome Dependency to Make Your Life Easier
                       DESC

  s.homepage         = 'https://github.com/amitcse6/ASRadioGroup'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Amit Mondol' => 'amitpstu1@gmail.com' }
  s.source           = { :git => 'https://github.com/amitcse6/ASRadioGroup.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "8.0"
  }
  
  # s.resource_bundles = {
  #   'ASRadioGroup' => ['ASRadioGroup/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
