//
//  Extensions.swift
//  TableViewCellButtons
//
//  Created by alex on 17/4/2025.
//
import UIKit
import Foundation

extension String {
    func emojiToImage() -> UIImage? {
        let nsString = (self as NSString)
        let font = UIFont.systemFont(ofSize: 1024) // you can change your font size here
        let stringAttributes = [NSAttributedString.Key.font: font]
        let imageSize = nsString.size(withAttributes: stringAttributes)
 
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
        UIColor.clear.set() // clear background
        UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
        nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
        let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
        UIGraphicsEndImageContext() //  end image context
 
        return image
    }
}

extension UITableViewCell {
    func roundBorders(){
     
        contentView.layer.cornerRadius = 5.0
        contentView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        contentView.layer.borderWidth = 0.5

        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: contentView.frame.size.height - width, width:  contentView.frame.size.width, height: contentView.frame.size.height)

        border.borderWidth = width
        contentView.layer.addSublayer(border)
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true


         
    }
}
