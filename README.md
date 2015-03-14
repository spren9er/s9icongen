s9icongen - App icon generator
==============================

## Introduction

The Ruby script `s9icongen` automatically generates icon files of all necessary sizes for iPhone and/or iPad apps (iOS 7 and above). It uses `imagemagick` and the gem `rmagick`.

## Installation

Install `imagemagick` and `rmagick` via

```bash
brew install imagemagick
gem install rmagick
```

## Usage

Just run the script 

```bash
./s9icongen.rb my_icon.png
```

The first argument is the filename of the icon image (should be quadratic and at least 1024x1024 in size). By default only iPhone icon files are generated. If one supplies a second argument (`ipad` or `universal`), iPad icon files or iPhone/iPad icon files are generated respectively.

## Example 

The command

```bash
./s9icongen.rb my_icon.png universal
```

will generate

```bash
    29x29: icons/Icon-29.png
    58x58: icons/Icon-29@2x.png
    87x87: icons/Icon-29@3x.png
    80x80: icons/Icon-40@2x.png
  120x120: icons/Icon-40@3x.png
  120x120: icons/Icon-60@2x.png
  180x180: icons/Icon-60@3x.png
    29x29: icons/Icon-29.png
    58x58: icons/Icon-29@2x.png
    40x40: icons/Icon-40.png
    80x80: icons/Icon-40@2x.png
    76x76: icons/Icon-76.png
  152x152: icons/Icon-76@2x.png
  120x120: icons/Icon-120.png
  512x512: icons/iTunesArtwork
1024x1024: icons/iTunesArtwork@2x
```

## RubyMotion

Add the icon files to your resources directory and add the following line to your rakefile

```ruby
app.icons = Dir.glob('resources/Icon*.png').map{|icon| icon.split('/').last}
```