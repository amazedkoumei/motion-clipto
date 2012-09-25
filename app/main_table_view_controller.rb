# -*- coding: utf-8 -*-
class MainTableViewController < UITableViewController
  def viewDidLoad
    view.dataSource = view.delegate = self
    navigationItem.title = "ClipTo"
    navigationController.navigationBar.tintColor = UIColor.redColor

    @guideButton ||=begin
      button = UIBarButtonItem.alloc.initWithTitle("guide", style:UIBarButtonItemStylePlain, target:self, action:"goGuideLineView")
      button
    end

    navigationItem.rightBarButtonItem = @guideButton
  end

  def numberOfSectionsInTableView(tableView)
    sectionCount = 1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    menus.count + 1
  end

  CELLID = "menus"
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell
    end

    if(indexPath.row < menus.count)
      cell.selectionStyle = UITableViewCellSelectionStyleBlue
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
      cell.textLabel.text = menus[indexPath.row]
    else
      cell.textLabel.text = "other services will be available maybe"
      cell.textLabel.textColor = UIColor.grayColor
      cell.textLabel.font = UIFont.italicSystemFontOfSize(UIFont.labelFontSize)
    end

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    if(indexPath.row < menus.count)
      case indexPath.row
        when 0
          @detail_controller = GoogleSearchSettingController.new.initWithStyle(UITableViewStyleGrouped)
        when 1
          @detail_controller = SendMailSettingController.new.initWithStyle(UITableViewStyleGrouped)
        else
      end
    end
    navigationController.pushViewController(@detail_controller, animated:true)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end

  def menus
    @menus = [
      "Google Search",
      "Send to Mail"
    ]
  end

  def goGuideLineView
    view = UINavigationController.alloc.initWithRootViewController(GuideLineViewController.new)
    presentModalViewController(view, animated:true)
  end
end
