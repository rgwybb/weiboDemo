//
//  TabBarViewController.swift
//  weiboTest
//
//  Created by OceanDeep on 15/5/9.
//  Copyright (c) 2015年 OceanDeep. All rights reserved.
//  自定义TabBar

import Foundation
import UIKit

//代理
protocol TabBarViewDelegate:NSObjectProtocol{
    //回调函数
    func tabBar(tabBar:TabBarView, to:Int)
}
class TabBarView: UIView {
    var delegate:TabBarViewDelegate?
    weak var selectedButton=TabBarButton()
    func addTabBarButtonWithItem(item : UITabBarItem){
        //创建一个按钮
        var button = TabBarButton()
        self.addSubview(button)
        //设置数据
        button.setItem(item)
        //设置按钮点击事件
        button.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchDown)
        //设置默认按钮选中第一个
        if self.subviews.count == 1 {
            self.buttonClick(button)
        }
        
    }
    /**
    监听按钮的点击
    */
    func buttonClick(button:TabBarButton) {
        //通知代理
        if((delegate) != nil){
            delegate!.tabBar(self, to: button.tag)
        }
        self.selectedButton?.selected=false
        button.selected=true
        self.selectedButton=button
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonW:CGFloat=CGFloat(self.frame.size.width) / CGFloat(self.subviews.count)
        let buttonY:CGFloat=0
        let buttonH:CGFloat=CGFloat(self.frame.size.height)
        
        for var index=0; index<self.subviews.count;index++ {
            //取出每一个按钮
            var button:TabBarButton = self.subviews[index] as! TabBarButton
            let buttonX:CGFloat=CGFloat(index) * buttonW
            //设置按钮的frame
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH)
            //绑定tag
            button.tag=index
        }
    }
}
