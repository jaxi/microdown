//
//  BoldFragment.m
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "BoldFragment.h"

@implementation BoldFragment

-(void)toHTML
{
    NSString *pattern = @"\\*([^\n\\ ][^\n]+?[^\n\\ ])\\*";
    NSString *format = @"<strong>%@</strong>";
    
    [self replaceContextWithPattern:pattern withFormat:format];
}

@end
