//
//  Folder.h
//  LayoutDemo
//
//  Created by Vitaly Dyachkov on 13/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import "File.h"

@class File;

@interface Folder : File

@property (nonatomic, copy) NSArray <File *> *children;

@end
