//
//  STViewController.m
//  GameFeatSample
//
//  Created by basicinc.jp on 2013/06/28.
//  Copyright (c) 2013年 basicinc.jp. All rights reserved.
//

#import "STAppDelegate.h"
#import "STMenuViewController.h"
#import "STMenuRow.h"
#import "STSubclassingCell2ViewController.h"

#import <GameFeatKit/GFView.h>
#import <GameFeatKit/GFController.h>

@implementation STMenuViewController {
    __unsafe_unretained UITableView *_tableView;
    __strong NSMutableArray *_rows;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"GameFeat";
        
        _rows = [NSMutableArray arrayWithCapacity:10];
        
        STMenuRow *menuRow;
        //
        // SimpleTableView
        //
        menuRow = [[STMenuRow alloc] init];
        menuRow.title = @"通常版GF";
        [_rows addObject:menuRow];
        //
        // SubclassingCell2
        //
        menuRow = [[STMenuRow alloc] init];
        menuRow.title = @"カスタマイズ版GF";
        menuRow.viewControllerClass = [STSubclassingCell2ViewController class];
        [_rows addObject:menuRow];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    UITableView *tableView = [[UITableView alloc] initWithFrame:bounds style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:tableView];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    STMenuRow *row = [_rows objectAtIndex:indexPath.row];
    cell.textLabel.text = row.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        STAppDelegate *appDelegate =(STAppDelegate *)[[UIApplication sharedApplication] delegate];
        [GFController showGF:self site_id:GAME_MEDIA_ID delegate:appDelegate];
        
    } else if (indexPath.row == 1) {
        STAppDelegate *appDelegate =(STAppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.STMenuViewControllerDelegate = self;
        
        BOOL abc = [GFController getGFAds:appDelegate];
        NSLog(@"GFController getGFAds Result::%i", abc);
        
    }   
}

- (void) viewCustom {
    UIViewController *con = [[STSubclassingCell2ViewController alloc] init];
    [self.navigationController pushViewController:con animated:YES];
}

@end
