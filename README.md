motion-clipto
======================

概要 / Overview
----------
### ja
クリップボードにコピーした文字列をもとに他のサービスにジャンプする[Rubymotion](http://www.rubymotion.com/)製のiOSアプリです。
アプリの詳細はこちらのページをご覧ください。 → [Guideline | ClipTo](http://amazedkoumei.github.com/motion-clipto/guideline.html)

### en
this is ios app for jumping to another service with the content of clipboard written by Rubymotion. Please watch "Guideline | ClipTo" if you'd like to get more information →  [Guideline | ClipTo](http://amazedkoumei.github.com/motion-clipto/guideline.html)

インストール / Install
----------
### ja
1. ルートディレクトリにRakefileを追加してください。
2. ビルドを実行してください。ビルド手順についてはrubymotion.jpの[Welcome to RubyMotion](http://rubymotion.jp/RubyMotionDocumentation/guides/getting-started/index.html)をご覧ください。


### en
1. Add "Rakefile" to root directory
2. do build. if you'd like to know how to build, watch [Welcome to RubyMotion](http://www.rubymotion.com/developer-center/guides/getting-started/) on rubymotion.com



###Rakefile
    # -*- coding: utf-8 -*-
    $:.unshift("/Library/RubyMotion/lib")
    require 'motion/project'

    Motion::Project::App.setup do |app|
      # Use `rake config' to see complete project settings.
     app.name = "clipTo"
     app.deployment_target = "6.0"
     app.device_family = [:iphone]
     app.icons = ["iTunesArtwork", "Icon.png", "Icon@2x.png", "Icon-72.png", "Icon-Small.png", "Icon-Small-50.png", "Icon-Small@2x.png"]
    end
 



ライセンス / License
----------
Copyright &copy; 2012 amazedkoumei
Licensed under the [GPL version 3][gpl]
 
[gpl]: http://opensource.org/licenses/gpl-3.0.html