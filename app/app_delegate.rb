# -*- coding: utf-8 -*-
class AppDelegate
  $USER_DEFAULTS_KEY_GOOGLE_DOMAIN = "0"
  $SERVICE_NAME_GOOGLE_SEARCH = "Google Search"
  $SERVICE_NAME_SEND_MAIL = "Send to Mail"


  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # return true if RUBYMOTION_ENV == 'test'
    if(launchOptions == nil || launchOptions[UIApplicationLaunchOptionsLocalNotificationKey] == nil)
      application.setStatusBarStyle(UIStatusBarStyleBlackOpaque)
      @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
      @window.rootViewController = UINavigationController.alloc.initWithRootViewController(MainTableViewController.new)
      @window.makeKeyAndVisible
      true
    elsif(launchOptions[UIApplicationLaunchOptionsLocalNotificationKey].alertBody == $SERVICE_NAME_GOOGLE_SEARCH)
      launchSafariWithGoogle(application)
      true
    elsif(launchOptions[UIApplicationLaunchOptionsLocalNotificationKey].alertBody == $SERVICE_NAME_SEND_MAIL)
      sendToMail(application)
      true
    else
      false
    end
  end

  def application(application, didReceiveLocalNotification:notification)
    now = NSDate.dateWithTimeIntervalSinceNow(-5)
    if(notification == nil)
      # case of uncorrect notification
      alertView = UIAlertView.new
      alertView.message = "Please reMake notification."
      alertView.addButtonWithTitle("OK")
      alertView.show
    elsif(now.compare(notification.fireDate) == NSOrderedDescending)
      if(notification.alertBody == $SERVICE_NAME_GOOGLE_SEARCH)
        launchSafariWithGoogle(application)
      elsif(notification.alertBody == $SERVICE_NAME_SEND_MAIL)
        sendToMail(application)
      end
    end
  end

  def launchSafariWithGoogle(application)
    pasteboard = UIPasteboard.generalPasteboard
    arr = UIPasteboard.generalPasteboard.pasteboardTypes
    if(UIPasteboardTypeListString.include?(arr[0]))
      query = pasteboard.string.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    else
      query = ""
    end

    userDefaults = NSUserDefaults.standardUserDefaults
    domain = userDefaults.stringForKey($USER_DEFAULTS_KEY_GOOGLE_DOMAIN) || "com"

    #UIApplication.sharedApplication.openURL(NSURL.URLWithString("http://www.google." + domain + "/search?q=" + query));
    application.openURL(NSURL.URLWithString("http://www.google." + domain + "/search?q=" + query));
  end

  def sendToMail(application)
    pasteboard = UIPasteboard.generalPasteboard
    arr = UIPasteboard.generalPasteboard.pasteboardTypes
    if(UIPasteboardTypeListString.include?(arr[0]))
      mailBody = pasteboard.string.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    else
      mailBody = ""
    end      

    #UIApplication.sharedApplication.openURL(NSURL.URLWithString("mailto:?body=" + encodedMailBody))
    application.openURL(NSURL.URLWithString("mailto:?body=" + mailBody))
  end

end
