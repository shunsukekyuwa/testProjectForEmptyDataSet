//
//  ViewController.swift
//  test
//
//  Created by 久和俊介 on H28/07/13.
//  Copyright © 平成28年 kyuwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewModel: [contentType] = [contentType.Facebook, contentType.iCloud]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        cell.setCell(viewModel[indexPath.row])
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }

    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = EmptyViewController()
        viewController.type = viewModel[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
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
