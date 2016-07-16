//
//  ViewController.swift
//  test
//
//  Created by 久和俊介 on H28/07/13.
//  Copyright © 平成28年 kyuwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = UIColor.blackColor()

        let baseImage = UIImage(named: "btn_usersearch_44x44pt_highlight")!
        let capInsets: UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5.0)
        var rectInsets: UIEdgeInsets = UIEdgeInsetsZero
        rectInsets = UIEdgeInsetsMake(0, -80, 0, -20)

        let btn = UIButton(frame: CGRect(x: 126, y: 200, width: 180, height: 88))
        btn.setTitle("hogehoghodddddddddddddddddddd", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.titleLabel!.font = UIFont(name: "System", size: 18.0)

        let resizeImage = baseImage.resizableImageWithCapInsets(capInsets, resizingMode: UIImageResizingMode.Tile).imageWithAlignmentRectInsets(rectInsets)
        btn.setBackgroundImage(resizeImage, forState: UIControlState.Normal)


        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

enum contentType {
    case Facebook
    case iCloud

    var title: String {
        switch self {
        case .Facebook:
            return "Facebook"
        case .iCloud:
            return "iCloud"
        }
    }
}

class TableViewCell: UITableViewCell {
    func setCell(type: contentType){
        textLabel?.text = type.title
    }
}
