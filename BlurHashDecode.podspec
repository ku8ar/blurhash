Pod::Spec.new do |s|
  s.name             = "BlurHashDecode"
  s.version          = "1.0.3"
  s.summary          = "BlurHash decoding library."
  s.description      = "BlurHash is a compact representation of a placeholder for an image."
  s.homepage         = "https://github.com/ku8ar/blurhash"
  s.license          = "MIT"
  s.author           = { "Wolt Enterprises" => "support@wolt.com" }
  s.requires_arc  = true
  s.platforms     = { :ios => "12.0" }
  s.source        = { :git => "https://github.com/ku8ar/blurhash.git" }
  s.source_files = "BlurHashDecode/**/*.{h,m,swift}"
  s.public_header_files = 'BlurHashDecode/**/*.h'
  s.frameworks = "UIKit"
  s.swift_version = "5.0"
end
