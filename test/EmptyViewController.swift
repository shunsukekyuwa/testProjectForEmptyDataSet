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
    private var titleSize: CGFloat = 0.0
        
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
        if contentType is FacebookModel {
            let capInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            var rectInsets = UIEdgeInsetsZero
            rectInsets = UIEdgeInsets(top: 100, left: 100, bottom: 50, right: 100)
            let image = UIImage(named: "facebook_image_140×118")!
            return image.resizableImageWithCapInsets(capInsets, resizingMode: UIImageResizingMode.Stretch).imageWithAlignmentRectInsets(rectInsets)
        } else {
            return nil
        }
    }

    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.whiteColor()
        shadow.shadowOffset = CGSizeMake(0.0, 1.0)

        return NSAttributedString(
            string: contentType.titleForEmptyDataSet,
            attributes: [
                NSFontAttributeName: UIFont.systemFontOfSize(24.0),
                NSForegroundColorAttributeName: ColorUtil.rgba(172, green: 175, blue: 189),
                NSShadowAttributeName: shadow
            ]
        )
    }

    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        if contentType is FacebookModel { return nil }
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = NSLineBreakMode.ByWordWrapping
        paragraph.alignment = NSTextAlignment.Center
        paragraph.lineSpacing = 6.0
        return NSAttributedString(
            string: "Share photos and videos with just the people you choose, and let them add photos, videos, and comments.",
            attributes:  [
                NSFontAttributeName: UIFont.systemFontOfSize(16.0),
                NSForegroundColorAttributeName: ColorUtil.rgba(172, green: 175, blue: 189),
                NSParagraphStyleAttributeName: paragraph
            ]
        )
    }

    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        if contentType is FacebookModel { return nil }
        let str = "Create New Stream"
        let font = UIFont.systemFontOfSize(14.0, weight: 2.0)
        titleSize = str.widthWithConstrainedHeight(44, font: font)

        return NSAttributedString(
            string: str,
            attributes: [
                NSFontAttributeName: font,
                NSForegroundColorAttributeName: ColorUtil.rgba(172, green: 175, blue: 189)
            ]
        )
    }

    func buttonBackgroundImageForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> UIImage! {
        if contentType is FacebookModel { return nil }
        let baseImage = (state == UIControlState.Highlighted) ? UIImage(named: "btn_highlight")! : UIImage(named: "btn")!
        let capInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        var rectInsets = UIEdgeInsetsZero
        let ratioViewBoundsWidthAndButton: CGFloat = 0.88
        let messageSizeForEmptyDataSet: CGFloat = titleSize
        let widthBetweenBackgroundAndLabel = (view.bounds.size.width * ratioViewBoundsWidthAndButton - messageSizeForEmptyDataSet)/2
        let padding: CGFloat = 20
        let width = widthBetweenBackgroundAndLabel - padding
        rectInsets = UIEdgeInsets(top: 0, left: -width, bottom: 0, right: -width)

        return baseImage.resizableImageWithCapInsets(capInsets, resizingMode: UIImageResizingMode.Stretch).imageWithAlignmentRectInsets(rectInsets)
    }


    func spaceHeightForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        if contentType is FacebookModel {
            return 50.0
        } else {
            return 25.0
        }
    }

    func verticalOffsetForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        if contentType is FacebookModel {
            return -tableView.bounds.origin.y
        } else {
            return 0
        }
    }
}
