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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
