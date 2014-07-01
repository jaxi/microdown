//
//  DelFragment.m
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "DelFragment.h"

@implementation DelFragment

-(void) toHTML
{
    NSString *pattern = @"~~([^\n\\ ][^\n]+?[^\n\\ ])~~";
    NSString *format = @"<del>%@</del>";
    
    [self replaceContextWithPattern:pattern withFormat:format];
}

@end
