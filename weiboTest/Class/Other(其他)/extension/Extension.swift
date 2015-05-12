//
//  UiImage+extension.swift
//  weiboTest
//
//  Created by OceanDeep on 15/5/12.
//  Copyright (c) 2015年 OceanDeep. All rights reserved.
//  扩展方法

import UIKit

/**
*  image扩展方法
*/
extension UIImage {
    func resizedImageWithName(name:String)->UIImage {
        var image=UIImage(named: name)
        var leftCapWidth:Int = Int(image!.size.width * 0.5)
        var topCapHeight:Int = Int(image!.size.height * 0.5)
       return image!.stretchableImageWithLeftCapWidth(leftCapWidth, topCapHeight: topCapHeight)
       
    }
    func aa(ss:String)->String {
        return "s"
    }
}
