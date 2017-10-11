//
//  IFHeader.swift
//  iFoodMacau-Delivery
//
//  Created by nhl on 2017/9/29.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//类似于OC的宏文件，常量的定义

import UIKit

//获取屏幕的高
let IPhone_SCREEN_HEIGHT = UIScreen.main.bounds.height
//获取屏幕宽
let IPhone_SCREEN_WIDTH = UIScreen.main.bounds.width
//iPhone X 宏定义
let iPhoneX = (IPhone_SCREEN_WIDTH == 375.0 && IPhone_SCREEN_HEIGHT == 812.0 ? true : false)
//适配iPhone X 状态栏高度
let IPhone_StatusBarHeight = (iPhoneX ? 44.0 : 20.0)
// 适配iPhone X Tabbar高度
let IPhone_TabbarHeight = (iPhoneX ? (49.0+34.0) : 49.0)
// 适配iPhone X Tabbar距离底部的距离
let IPhone_TabbarSafeBottomMargin = (iPhoneX ? 34.0 : 0.0)
// 适配iPhone X 导航栏高度
let IPhone_NavHeight = (iPhoneX ? 88.0 : 64.0)
