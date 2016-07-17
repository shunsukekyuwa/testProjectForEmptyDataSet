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
    }

    override func viewWillAppear(animated: Bool) {
        switch type {
        case .Facebook:
            (red: 59, green: 89, blue: 152, alpha: 1)
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

    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(
            string: "hoge",
            attributes: [NSFontAttributeName: UIFont.systemFontOfSize(24.0)]
        )
    }

}
