Pod::Spec.new do |s|
  s.name             = 'AAAlertController'
  s.version          = '0.1.0'
  s.summary          = 'AAAlertController is extension of the UIAlertController, provide custom styles and animations Edit
Add topics'
  s.description      = <<-DESC
`AAAlertController` is a lightweight UI component to present a popup style dialog
                       DESC
  s.homepage         = 'https://github.com/aozhimin/AAAlertController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aozhimin' => 'aozhimin0811@gmail.com' }
  s.source           = { :git => 'https://github.com/aozhimin/AAAlertController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/aozhimin0811'
  s.ios.deployment_target = '7.0'
  s.source_files = 'AAAlertController/Classes/**/*'

end
