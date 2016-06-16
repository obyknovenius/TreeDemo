//
//  DetailViewController.h
//  TreeDemo
//
//  Created by Vitaly Dyachkov on 16/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

