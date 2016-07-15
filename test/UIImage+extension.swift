//
//  UIImage+extension.swift
//  test
//
//  Created by 久和俊介 on H28/07/14.
//  Copyright © 平成28年 kyuwa. All rights reserved.
//

import UIKit

extension UIImage {

    class func colorImage(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)

        let rect = CGRect(origin: .zero, size: size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
    }
}