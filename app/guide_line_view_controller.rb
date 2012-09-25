# -*- coding: utf-8 -*-
class GuideLineViewController < UIViewController
  
  def viewDidLoad
    super

    navigationItem.title = "Guideline"
    navigationController.navigationBar.tintColor = UIColor.redColor

    @webview = UIWebView.new.tap do |v|
      v.frame = self.view.bounds
      v.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString("http://amazedkoumei.github.com/motion-clipto/guideline.html")))
      v.delegate = self
      view.addSubview(v)
    end

    @doneButton ||=begin
      button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone, target:self, action:"doneButtonTap")
      button
    end
    navigationItem.rightBarButtonItem = @doneButton
  end
  
  def doneButtonTap
    dismissModalViewControllerAnimated(true)
  end
end