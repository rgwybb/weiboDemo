//
//  BadgeButton.swift
//  weiboTest
//
//  Created by OceanDeep on 15/5/13.
//  Copyright (c) 2015年 OceanDeep. All rights reserved.
//

import UIKit


class BadgeButton: UIButton {

//    var badgeValue:String{
//        didSet{
//            if(!badgeValue.isEmpty){
//                self.hidden=false
//                self.setTitle(badgeValue, forState: UIControlState.Normal)
//                
//                //设置frame
//                 CGRect.self thisFrame=self.frame
//                CGFloat badgeH = self.currentBackgroundImage?.size.height
//                CGFloat badgeW = self.currentBackgroundImage?.size.width
//                if (count(badgeValue)>0){
//                    // 文字的尺寸
//                    CGSize badgeSize = [badgeValue sizeWithFont:self.titleLabel.font];
//                    badgeW = badgeSize.width + 10;
//                    frame.size.width = badgeW;
//                    frame.size.height = badgeH;
//                    self.frame = frame;
//
//                }else {
//                    self.hidden=true
//                }
//            }
//            
//        }
//    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.hidden=true
        self.userInteractionEnabled=false
        self.setBackgroundImage(UIImage.aa())), forState: UIControlState.Normal)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    func setBadgeValue(badgeValue:String){
//            self.badgeValue=badgeValue
//        
//    }
}
