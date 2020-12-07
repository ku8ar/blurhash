# [BlurHash](http://blurha.sh)

BlurHash is a compact representation of a placeholder for an image.

This is a CocoaPods project containing only the BlurHash decoder.
Useful when you don't want (or can't) add a Swift class containing all the BlurHash code to your project.

## Installation

```sh
s.dependency 'BlurHashDecode'
```

## Usage

[BlurHashDecode.swift](BlurHashDecode/BlurHashDecode.swift) implements the following extension on `UIImage`:

	public convenience init?(blurHash: String, size: CGSize, punch: Float = 1)

This creates a UIImage containing the placeholder image decoded from the BlurHash string, or returns nil if decoding failed.
The parameters are:

* `blurHash` - A string containing the BlurHash.
* `size` - The requested output size. You should keep this small, and let UIKit scale it up for you. 32 pixels wide is plenty.
* `punch` - Adjusts the contrast of the output image. Tweak it if you want a different look for your placeholders.

## More Info
* [woltapp/blurhash](https://github.com/woltapp/blurhash)
