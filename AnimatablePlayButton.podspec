Pod::Spec.new do |s|
  s.name         = "AnimatablePlayButton"
  s.version      = "1.0.0"
  s.summary      = "Animated Play and Pause Button written in Swift2.0, using CALayer, CAKeyframeAnimation."
  s.homepage     = "https://github.com/suzuki-0000/AnimatablePlayButton"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "suzuki_keishi" => "keishi.1983@gmail.com" }
  s.source       = { :git => "https://github.com/suzuki-0000/AnimatablePlayButton.git", :tag => "1.0.0" }
  s.platform     = :ios, "8.0"
  s.source_files = "AnimatablePlayButton/**/*.{h,swift}"
  s.requires_arc = true
  s.frameworks   = "UIKit"
end
