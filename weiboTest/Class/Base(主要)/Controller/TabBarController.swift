//
//  TabBarController.swift
//  weiboTest
//
//  Created by OceanDeep on 15/5/8.
//  Copyright (c) 2015年 OceanDeep. All rights reserved.
//  窗口根控制器


import UIKit

class TabBarController: UITabBarController, TabBarViewDelegate{
    
    /// 自定义TabBar
    var customTabBar = TabBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化tabBar
        self.setupTabBar()
        
        //初始化所有子控制器
        self.setupAllChildViewController()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        for child in self.tabBar.subviews {
            if child.isKindOfClass(UIControl) {
                child.removeFromSuperview()
            }
        }
    }
    /**
    初始化tabBar
    */
    func setupTabBar(){
        var customTabBar = TabBarView()
        customTabBar.frame=self.tabBar.bounds
        customTabBar.delegate=self
        self.tabBar .addSubview(customTabBar)
        self.customTabBar=customTabBar
    }
    /**
    监听tabbar按钮的点击
    
    :param: tabBar                <#tabBar description#>
    :param: didSelectedButtonFrom 原来的位置
    :param: to                    现在的位置
    */
    func tabBar(tabBar: TabBarView, didSelectedButtonFrom: Int, to: Int) {
        println(to)
        println(didSelectedButtonFrom)
    } /**
    初始化所有子控制器
    */
    func setupAllChildViewController(){
        
        //1首页
        var home=HomeViewController()
        self.setupChildViewController(home, title: "首页", imageName:"tabbar_home_os7" , selectedIamgeName: "tabbar_home_selected_os7")
        
        //2.消息
        var message=MessageViewController()
        self.setupChildViewController(message, title: "消息", imageName: "tabbar_message_center_os7", selectedIamgeName: "tabbar_message_center_selected_os7")
        
        //3.广场
        var discover=DiscoverViewController()
        self.setupChildViewController(discover, title: "广场", imageName: "tabbar_discover_os7", selectedIamgeName: "tabbar_discover_selected_os7")
        
        //4.我
        var me=MeViewController()
        self.setupChildViewController(me, title: "我", imageName: "tabbar_profile_os7", selectedIamgeName: "tabbar_profile_selected_os7")
    }
    /**
    初始化一个子控制器
    
    :param: chidView          需要初始化的控制器
    :param: title             标题
    :param: imageName         图标
    :param: selectedIamgeName 选中的图标
    */
    func setupChildViewController(chidView:UIViewController, title:String,imageName:String , selectedIamgeName:String) {
        //设置控制器属性
        chidView.title=title
        //设置图标
        chidView.tabBarItem.image = UIImage(named: imageName)
        //设置选中图标
        chidView.tabBarItem.selectedImage=UIImage(named: selectedIamgeName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        //包装一个导航控制器
        var nav=UINavigationController(rootViewController: chidView)
        self.addChildViewController(nav)
        //添加TabBar内部的按钮
        self.customTabBar.addTabBarButtonWithItem(chidView.tabBarItem)

    }
}
