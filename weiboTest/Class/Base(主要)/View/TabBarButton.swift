//
//  TabBarButton.swift
//  weiboTest
//
//  Created by OceanDeep on 15/5/10.
//  Copyright (c) 2015年 OceanDeep. All rights reserved.
//  自定义TabBar按钮

import UIKit

class TabBarButton: UIButton {
    
    let TabBarButtonRatio:CGFloat=0.6
    required override init(frame: CGRect) {
        super.init(frame: frame)
        //IOS6设置背景图片
        //self.setBackgroundImage(UIImage(named: "tabbar_slider"), forState: UIControlState.Selected)
        //设置字体颜色
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        //设置字体选中时的颜色
        self.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Selected)
        self.adjustsImageWhenHighlighted=false
        //设置图标居中
        self.imageView?.contentMode=UIViewContentMode.Center
        //设置文字居中
        self.titleLabel?.textAlignment=NSTextAlignment.Center
        self.titleLabel?.font=UIFont.systemFontOfSize(11)
        self.highlighted=false
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
    重写图片的Frame
    */
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        
        var imageW = contentRect.size.width
        var imageH = contentRect.size.height * TabBarButtonRatio
        return CGRectMake(0, 0, imageW, imageH)
    }
    /**
    重写title的frame
    */
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        var titleY = contentRect.size.height * TabBarButtonRatio
        var titleH = contentRect.size.height - titleY
        var titleW = contentRect.size.width
        return CGRectMake(0, titleY, titleW, titleH)

    }
    /**
    设置按钮的属性
    */
    func setItem(item : UITabBarItem) {
        self.setTitle(item.title, forState: UIControlState.Normal)
        self.setImage(item.image, forState: UIControlState.Normal)
        self.setImage(item.selectedImage, forState: UIControlState.Selected)
        
    }

}
