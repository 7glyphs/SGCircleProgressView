Pod::Spec.new do |s|
  s.name = "SGCircleProgressView"
  s.summary = "Circle progress view"
  
  s.version = "1.0.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.homepage = "https://github.com/7glyphs/SGCircleProgressView"
  s.author = { "7 glyphs Ltd." => "dev@7glyphs.com" }
  s.platform = :ios, "6.0"
  s.source = { :git => "https://github.com/7glyphs/SGCircleProgressView.git", :tag => "1.0.0" }
  s.requires_arc = true
  s.source_files = "SGCircleProgressView.{h,m}"
  s.frameworks = "UIKit"
  
end