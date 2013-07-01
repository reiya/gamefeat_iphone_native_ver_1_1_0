//
//  STAppDelegate.m
//  GameFeatSample
//
//  Created by basicinc.jp on 2013/06/28.
//  Copyright (c) 2013年 basicinc.jp. All rights reserved.
//

#import "STAppDelegate.h"
#import "STMenuViewController.h"
#import "STSubclassingCell2ViewController.h"

@implementation STAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    STMenuViewController *con = [[STMenuViewController alloc] init];
    UINavigationController *naviCon = [[UINavigationController alloc] initWithRootViewController:con];
    self.viewController = naviCon;
    self.window.rootViewController = naviCon;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    UIDevice *device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)]) {
        backgroundSupported = device.multitaskingSupported;
    }
    if (backgroundSupported) {
        [GFController backgroundTask];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [GFController conversionCheckStop];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [GFController activateGF:GAME_MEDIA_ID custom:YES];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//=======================================================
// GFViewDelegate
//=======================================================
- (void)didShowGameFeat{
    // GameFeatが表示されたタイミングで呼び出されるdelegateメソッド
    NSLog(@"didShowGameFeat");
}
- (void)didCloseGameFeat{
    // GameFeatが閉じられたタイミングで呼び出されるdelegateメソッド
    NSLog(@"didCloseGameFeat");
    
    
}
- (void)didGetGfAds:(NSArray *)lists {
    
    NSLog(@"didGetGfAds");
    self.gfAdLists = lists;
    
    UIViewController *con = [[STSubclassingCell2ViewController alloc] init];
    [self.STMenuViewControllerDelegate.navigationController pushViewController:con animated:YES];
    
}
- (void)failGetGfAds {
    NSLog(@"failGetGfAds");
}

@end
