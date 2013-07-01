//
//  STAppDelegate.h
//  GameFeatSample
//
//  Created by basicinc.jp on 2013/06/28.
//  Copyright (c) 2013年 basicinc.jp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameFeatKit/GFView.h>
#import <GameFeatKit/GFController.h>
#import "STMenuViewController.h"

#define GAME_MEDIA_ID @"管理画面より取得したメディアキーを指定してください"

@interface STAppDelegate : UIResponder <UIApplicationDelegate, GFViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) NSArray *gfAdLists;
@property (strong, nonatomic) STMenuViewController *STMenuViewControllerDelegate;

@end
