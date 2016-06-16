//
//  MasterViewController.h
//  TreeDemo
//
//  Created by Vitaly Dyachkov on 16/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

