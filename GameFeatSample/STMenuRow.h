//
//  STMenuRow.h
//  GameFeatSample
//
//  Created by basicinc.jp on 2013/06/28.
//  Copyright (c) 2013年 basicinc.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMenuRow : NSObject

@property (strong, nonatomic) NSString *title;
@property (unsafe_unretained, nonatomic) Class viewControllerClass;

@end
