#
# Be sure to run `pod lib lint UCAppDelegateReduce.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UCAppDelegateReduce'
  s.version          = '1.0.1'
  s.summary          = '一个配合组件化减负appdelegate的小工具'
  s.description      = <<-DESC
一个配合组件化减负appdelegate的小工具
                       DESC

  s.homepage         = 'git@github.com:TryRuntime/UCAppDelegateReduce.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Link913' => 'fanyang_32012@outlook.com' }
  s.source           = { :git => 'https://github.com/TryRuntime/UCAppDelegateReduce.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'UCAppDelegateReduce/Classes/**/*'
  s.dependency "UCRuntimeKit/UCMediatorObjc"
  
  # s.resource_bundles = {
  #   'UCAppDelegateReduce' => ['UCAppDelegateReduce/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
