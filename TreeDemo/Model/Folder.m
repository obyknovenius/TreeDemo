//
//  Folder.m
//  LayoutDemo
//
//  Created by Vitaly Dyachkov on 13/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import "Folder.h"

@implementation Folder

- (nullable instancetype)initWithCoder:(EBFTreeUnarchiver *)aDecoder parentObject:(id)parentObject {
    self = [super initWithCoder:aDecoder parentObject:parentObject];
    if (self) {
        _children = [aDecoder decodeObjectsForKey:@"children" parentObject:self];
    }
    return self;
}

@end
