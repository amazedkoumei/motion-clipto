# -*- coding: utf-8 -*-
class SettingViewController < UITableViewController

  def service_name  
    ""
  end

  def viewDidLoad
    navigationItem.title = service_name

    tapGesture = UITapGestureRecognizer.alloc.initWithTarget(self, action:"addToNotificationCenter:")
    tapGesture.delegate = self
    addToNotificationCenterButton.addGestureRecognizer(tapGesture)
    view.addSubview(addToNotificationCenterButton)
  end

  def numberOfSectionsInTableView(tableView)
    0
  end

  def tableView(tableView, numberOfRowsInSection:section)
    0
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"dummy")
  end

  def addToNotificationCenterButton
    @addToNotificationCenterButton ||= begin
      width = 240
      label = UILabel.alloc.initWithFrame(CGRectMake((self.view.frame.size.width - width) / 2, 180, width, 50))
      label.text = "add to notification center"
      label.textAlignment = NSTextAlignmentCenter
      label.layer.setCornerRadius(10.0)
      label.setClipsToBounds(true)
      label.backgroundColor = UIColor.blueColor
      label.textColor = UIColor.whiteColor
      label.userInteractionEnabled = true;

      label
    end
  end

  def addToNotificationCenter(recognizer)

    notificationList = UIApplication.sharedApplication.scheduledLocalNotifications
    localNotification = UILocalNotification.alloc.init
    localNotification.timeZone = NSTimeZone.defaultTimeZone
    localNotification.fireDate = NSDate.dateWithTimeIntervalSinceNow(1)
    localNotification.alertBody = service_name

    UIApplication.sharedApplication.scheduleLocalNotification(localNotification)

    @completeAlertView ||=begin
      alertView = UIAlertView.new
      alertView.delegate = self
      alertView.message = "Added Menu to Notification Center. Now try copying something ON clipboard and pull notification center and tap it."
      alertView.addButtonWithTitle("OK")
      alertView
    end
    @completeAlertView.show

  end

  def alertView(alertView, clickedButtonAtIndex:buttonIndex)
    if(alertView == @completeAlertView)
      navigationController.popViewControllerAnimated(true)
    end
  end

end