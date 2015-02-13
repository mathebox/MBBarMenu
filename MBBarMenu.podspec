Pod::Spec.new do |s|
  s.name         = "MBBarMenu"
  s.version      = "0.1.5"
  s.summary      = "Simplified arrangement of UIBarButtonItems."
  s.description  = <<-DESC
                   MBBarMenu simplifies the arrangement of multiple UIBarButtonItems in an iOS UINavigationBar. Up to a given count the items will be shown normally. If the number of items exceeds this threshold, all remaining items will be shown in a UIAlertController.
                   DESC
  s.homepage     = "https://github.com/mathebox/MBBarMenu"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Max Bothe"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/mathebox/MBBarMenu.git", :tag => "v0.1.5" }
  s.source_files  = "MBBarMenu", "*.{h,m}"
  s.resources = "MBBarMenu/*.png"
  s.requires_arc = true
end
