//
//  ContentType.swift
//  test
//
//  Created by 久和俊介 on H28/07/17.
//  Copyright © 平成28年 kyuwa. All rights reserved.
//

import UIKit

protocol ContentType {
    var title: String { get set }
    var backgroundColor: UIColor { get set }
    var barTintColor: UIColor { get set }
    var tintColor: UIColor { get set }
    var titleTextAttributes: [String : AnyObject]? { get set }
    var titleForEmptyDataSet: String { get set }
}

final class FacebookModel: ContentType {
    var title: String
    var backgroundColor: UIColor
    var barTintColor: UIColor
    var tintColor: UIColor
    var titleTextAttributes = [String : AnyObject]?()
    var titleForEmptyDataSet: String

    init(){
        title = "Facebook"
        backgroundColor = ColorUtil.rgba(236, green: 238, blue: 250)
        barTintColor = ColorUtil.rgba(59, green: 89, blue: 152)
        tintColor = UIColor.whiteColor()
        titleTextAttributes = [
            NSFontAttributeName: UIFont.systemFontOfSize(16.0, weight: 6.0),
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        titleForEmptyDataSet = "No friends to show."
    }

}

final class ICloudModel: ContentType {
    var title: String
    var backgroundColor: UIColor
    var barTintColor: UIColor
    var tintColor: UIColor
    var titleTextAttributes = [String : AnyObject]?()
    var titleForEmptyDataSet: String

    init(){
        title = "iCloud"
        backgroundColor = UIColor.whiteColor()
        barTintColor = UIColor.whiteColor()
        tintColor = ColorUtil.rgba(35, green: 133, blue: 255)
        titleTextAttributes = [
            NSFontAttributeName: UIFont.systemFontOfSize(16.0, weight: 1.0),
            NSForegroundColorAttributeName: UIColor.blackColor()
        ]
        titleForEmptyDataSet = "iCloud Photo Sharing"
    }
}
