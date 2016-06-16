//
//  File.m
//  LayoutDemo
//
//  Created by Vitaly Dyachkov on 13/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import "File.h"
#import "Folder.h"

@implementation File

- (nullable instancetype)initWithCoder:(EBFTreeUnarchiver *)aDecoder parentObject:(id)parentObject {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeStringForKey:@"name"];
        _parent = parentObject;
    }
    return self;
}

- (NSString *)path {
    NSMutableString *path = [[NSMutableString alloc] init];
    File *file = self;
    do {
        [path insertString:[NSString stringWithFormat:@"/%@", file.name] atIndex:0];
    } while ((file = file.parent));
    return path;
}

@end
