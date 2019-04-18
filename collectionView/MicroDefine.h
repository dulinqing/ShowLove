//
//  MicroDefine.h
//  collectionView
//
//  Created by du-lq on 2019/3/11.
//  Copyright © 2019 du-lq. All rights reserved.
//

#ifndef MicroDefine_h
#define MicroDefine_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define H_RATE [UIScreen mainScreen].bounds.size.height/667.f
#define W_RATE [UIScreen mainScreen].bounds.size.width/375.f

#define ColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define NAVIGATION_TOTAL_HEIGHT (NAVIGATIONBAR_HEIGHT+STATUSBAR_HEIGHT) //电池栏+导航  高度

#define NAVIGATIONBAR_HEIGHT  self.navigationController.navigationBar.frame.size.height //44 //导航高度

#define STATUSBAR_HEIGHT (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)) //电池栏高度
#endif /* MicroDefine_h */
