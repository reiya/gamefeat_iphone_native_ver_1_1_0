//
//  STCustomCell2.h
//  GameFeatSample
//
//  Created by basicinc.jp on 2013/06/28.
//  Copyright (c) 2013年 basicinc.jp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCustomCell2 : UITableViewCell

@property(unsafe_unretained, nonatomic) IBOutlet UILabel *titleLabel;
@property(unsafe_unretained, nonatomic) IBOutlet UILabel *descLabel;
@property(unsafe_unretained, nonatomic) IBOutlet UIImageView *photoImageView;
@property(unsafe_unretained, nonatomic) IBOutlet UIButton *revewBtn;
@property(unsafe_unretained, nonatomic) IBOutlet UIButton *dlBtn;

@end
