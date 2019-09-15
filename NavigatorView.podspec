
Pod::Spec.new do |spec|

  spec.name         = "NavigatorView"
  spec.version      = "0.0.4"
  spec.summary      = "A short description of NavigatorView."

  spec.description  = <<-DESC
  custom navigator view,support config left and right items,title,and a custom title view
                   DESC

  spec.homepage     = "https://github.com/18338626994/NavigatorView.git"


  spec.license      = "MIT"

  spec.author             = { "yyf" => "https://github.com/18338626994" }

  spec.platform     = :ios, "8.0"

  spec.source       = { :git => "https://github.com/18338626994/NavigatorView.git", :tag => spec.version.to_s }

  spec.source_files  = "NavigatorView/NavigatorView/*.{h,m}"
  spec.resources = "NavigatorView/Resources/*.png"

  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
