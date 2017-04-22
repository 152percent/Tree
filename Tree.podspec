Pod::Spec.new do |s|
  s.name             = 'Tree'
  s.version          = '1.0'
  s.summary          = 'Provides a Swift structure for representing tree nodes.'
  s.homepage         = 'https://github.com/152percent/Tree'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Shaps Benkau' => 'shaps@152percent.com' }
  s.source           = { :git => 'https://github.com/152percent/Tree.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/152percent'
  s.ios.deployment_target = '9.0'
  s.source_files = 'Tree/Classes/**/*'
end
