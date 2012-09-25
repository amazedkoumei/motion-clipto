# -*- coding: utf-8 -*-
class GoogleSearchSettingController < SettingViewController

  def service_name  
    $SERVICE_NAME_GOOGLE_SEARCH
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    1
  end

  def tableView(tableView, titleForHeaderInSection:section)
    "setting"
  end

  def tableView(tableView, titleForFooterInSection:section)
    "blank setting means www.google.com"
  end

  CELLID = "googleSearch"
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.selectionStyle = UITableViewCellSelectionStyleNone
      cell.textLabel.text = "Domain"

      @userDefaults ||= begin
        NSUserDefaults.standardUserDefaults
      end

      @label ||= begin
        label = UILabel.alloc.initWithFrame(CGRectMake(110, 13, 120, 20));
        label.text = "www.google."
        label
      end

      @textField ||= begin
        textField = UITextField.alloc.initWithFrame(CGRectMake(212, 10, 80, 30));
        textField.delegate = self
        textField.borderStyle = UITextBorderStyleRoundedRect
        textField.keyboardType = UIKeyboardTypeURL
        textField.returnKeyType = UIReturnKeyDone
        textField.text = @userDefaults.stringForKey($USER_DEFAULTS_KEY_GOOGLE_DOMAIN) || ""
        textField
      end

      cell.addSubview(@label);
      cell.addSubview(@textField);

      cell
    end

    cell
  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder()
    true
  end

  def addToNotificationCenter(recognizer)
    if(!@textField.text.empty?)
      @userDefaults.setObject(@textField.text, forKey:$USER_DEFAULTS_KEY_GOOGLE_DOMAIN)
    else
      @userDefaults.setObject(nil, forKey:$USER_DEFAULTS_KEY_GOOGLE_DOMAIN)
    end
    super(recognizer)
  end
end
