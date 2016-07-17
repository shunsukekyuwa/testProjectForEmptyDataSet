//
//  EmptyViewController.swift
//  test
//
//  Created by 久和俊介 on H28/07/17.
//  Copyright © 平成28年 kyuwa. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

final class EmptyViewController: UIViewController, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {

    var contentType: ContentType = FacebookModel()
    var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.title = contentType.title

        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.backgroundColor = contentType.backgroundColor

        view.addSubview(tableView)
    }

    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBar.barTintColor = contentType.barTintColor
        navigationController?.navigationBar.tintColor = contentType.tintColor
        navigationController?.navigationBar.titleTextAttributes = contentType.titleTextAttributes
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
            string: contentType.titleForEmptyDataSet,
            attributes: [
                NSFontAttributeName: UIFont.systemFontOfSize(22.0),
                NSForegroundColorAttributeName: ColorUtil.rgba(172, green: 175, blue: 189),
                NSShadowAttributeName: shadow
            ]
        )
    }

//    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
//        return NSAttributedString(
//            string: "Share photos and videos with just the people you choose, and let them add photos, videos, and comments.",
//            attributes:  [
//                NSFontAttributeName: UIFont.systemFontOfSize(22.0),
//                NSForegroundColorAttributeName: ColorUtil.rgba(172, green: 175, blue: 189)
////                NSParagraphStyleAttributeName: 2.0
//            ]
//
//        )
//    }

    func spaceHeightForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return 50.0
    }

    func verticalOffsetForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return -tableView.bounds.origin.y
    }
}
