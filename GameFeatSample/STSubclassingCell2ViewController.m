//
//  STSubclassingCell2ViewController.m
//  GameFeatSample
//
//  Created by basicinc.jp on 2013/06/28.
//  Copyright (c) 2013年 basicinc.jp. All rights reserved.
//

#import "STAppDelegate.h"
#import "STSubclassingCell2ViewController.h"
#import "STCustomCell2.h"

#import <GameFeatKit/GFView.h>
#import <GameFeatKit/GFController.h>
//#import "JSONKit.h"


@implementation STSubclassingCell2ViewController {
    __unsafe_unretained IBOutlet UITableView *_tableView;
    __strong NSMutableArray *_rows;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"カスタム版GF";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 84;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //行数
    STAppDelegate *appDelegate =(STAppDelegate *)[[UIApplication sharedApplication] delegate];
    return [appDelegate.gfAdLists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"CellID";
    STCustomCell2 *cell = (STCustomCell2 *)[_tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[STCustomCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    STAppDelegate *appDelegate =(STAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSDictionary *d = [appDelegate.gfAdLists objectAtIndex:indexPath.row];
    
    //cell.photoImageView.image = [[UIImage alloc] initWithData:data];
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    cell.photoImageView.image = nil;
    dispatch_async(q_global, ^{
        NSString *imageURL = [d objectForKey:@"icon"];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString: imageURL]]];
        dispatch_async(q_main, ^{
            cell.photoImageView.image = image;
            [cell layoutSubviews];
        });
    });
    
    
    
    
    cell.titleLabel.text = [d objectForKey:@"title"];
    cell.descLabel.text = [d objectForKey:@"description"];
    NSString *entry = [NSString stringWithFormat:@"%@",[d objectForKey:@"entry"]];
    BOOL entrySt = [entry isEqualToString:@"1"];
    if (entrySt == YES) {
        cell.revewBtn.hidden = NO;
    } else {
        cell.revewBtn.hidden = YES;
    }
    
    cell.revewBtn.tag = indexPath.row;
    cell.dlBtn.tag = indexPath.row;
    
    [cell setNeedsDisplay];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[_rows removeObjectAtIndex:indexPath.row];
        //[_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(IBAction)showReview:(id)button
{
    UIButton* btn = button;
    int row = btn.tag;
    
    STAppDelegate *appDelegate =(STAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSDictionary *d = [appDelegate.gfAdLists objectAtIndex:row];
    [GFController showGFEntry:self ad:d delegate:appDelegate];
}

-(IBAction)appDownLoad:(id)button
{
    UIButton* btn = button;
    int row = btn.tag;
    
    STAppDelegate *appDelegate =(STAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSDictionary *d = [appDelegate.gfAdLists objectAtIndex:row];
    [GFController showGFDL:self ad:d];
}

@end
