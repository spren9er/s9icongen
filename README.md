appicongen ・ App icon generator
================================

## Introduction

The Ruby script `appicongen` automatically generates icon files for iPhone and/or iPad apps (iOS 7 and above). It uses `imagemagick` and the gem `rmagick`.

## Installation

Install `imagemagick` and `rmagick` via

```bash
brew install imagemagick
gem install rmagick
```

## Usage

Just run the script 

```bash
./appicongen.rb my_icon.png
```

The first argument is the filename of the icon file. By default only iPhone icon files are generated. 
If one supplies a second argument (`ipad` or `universal`), iPad icon files or iPhone/iPad icon files are generated respectively.