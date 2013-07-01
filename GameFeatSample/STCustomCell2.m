//
//  STCustomCell2.m
//  GameFeatSample
//
//  Created by basicinc.jp on 2013/06/28.
//  Copyright (c) 2013年 basicinc.jp. All rights reserved.
//

#import "STCustomCell2.h"

@implementation STCustomCell2

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"STViewOnContentViewOfCustomCell2"
                                                       owner:self
                                                     options:nil];
        UIView *viewOnContentView = [views objectAtIndex:0];
        
        viewOnContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.frame = viewOnContentView.bounds;
        
        [self.contentView addSubview:viewOnContentView];
    }
    return self;
}

@end
