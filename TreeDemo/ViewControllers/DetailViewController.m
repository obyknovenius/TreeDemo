//
//  DetailViewController.m
//  TreeDemo
//
//  Created by Vitaly Dyachkov on 16/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import "DetailViewController.h"

#import "File.h"

@implementation DetailViewController

#pragma mark - Accessors

- (void)setFile:(File *)file {
    if (![_file isEqual:file]) {
        _file = file;
        
        [self configureView];
    }
}

#pragma mark - UI

- (void)configureView {
    if (self.file) {
        self.title = [NSString stringWithFormat:@"GET %@", self.file.path];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

@end
