//
//  File.h
//  LayoutDemo
//
//  Created by Vitaly Dyachkov on 13/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EBFArchiveKit.h"

@class Folder;

@interface File : NSObject <EBFTreeCoding>

@property (nonatomic, readonly) NSString *name;

@property (nonatomic, readonly) NSString *path;
@property (nonatomic, weak) Folder *parent;

@end
