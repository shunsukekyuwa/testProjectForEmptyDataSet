//
//  EmptyViewController.swift
//  test
//
//  Created by 久和俊介 on H28/07/17.
//  Copyright © 平成28年 kyuwa. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class EmptyViewController: UIViewController, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {

    var type: contentType = contentType.Facebook
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        view.addSubview(tableView)
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        navigationItem.title = type.title

        switch type {
        case .Facebook: tableView.backgroundColor = ColorUtil.rgba(236, green: 238, blue: 250)
        case .iCloud: tableView.backgroundColor = UIColor.whiteColor()
        }
    }

    override func viewWillAppear(animated: Bool) {
        switch type {
        case .Facebook:
            navigationController?.navigationBar.barTintColor = ColorUtil.rgba(59, green: 89, blue: 152)
            navigationController?.navigationBar.tintColor = UIColor.whiteColor()
            navigationController?.navigationBar.titleTextAttributes = [
                NSFontAttributeName: UIFont.systemFontOfSize(16.0, weight: 6.0),
                NSForegroundColorAttributeName: UIColor.whiteColor()
            ]
        case .iCloud:
            navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
            navigationController?.navigationBar.tintColor = ColorUtil.rgba(35, green: 133, blue: 255)
            navigationController?.navigationBar.titleTextAttributes = [
                NSFontAttributeName: UIFont.systemFontOfSize(16.0, weight: 1.0),
                NSForegroundColorAttributeName: UIColor.blackColor()
            ]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func emptyDataSetShouldDisplay(scrollView: UIScrollView!) -> Bool {
        return true
    }

    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        let capInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        var rectInsets = UIEdgeInsetsZero
        rectInsets = UIEdgeInsets(top: 100, left: 100, bottom: 50, right: 100)
        let image = UIImage(named: "facebook_image_140×118")!
        return image.resizableImageWithCapInsets(capInsets, resizingMode: UIImageResizingMode.Stretch).imageWithAlignmentRectInsets(rectInsets)
    }

    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.whiteColor()
        shadow.shadowOffset = CGSizeMake(0.0, 1.0)

        return NSAttributedString(
            string: "No friends to show.",
            attributes: [
                NSFontAttributeName: UIFont.systemFontOfSize(22.0),
                NSForegroundColorAttributeName: ColorUtil.rgba(172, green: 175, blue: 189),
                NSShadowAttributeName: shadow
            ]
        )
    }

    func spaceHeightForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return 50.0
    }

    func verticalOffsetForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return -tableView.bounds.origin.y
    }

}
