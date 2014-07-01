//
//  Italic.m
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "ItalicFragment.h"

@implementation ItalicFragment

-(void)toHTML
{
    NSString *pattern = @"\\*\\*([^\n\\ ][^\n]+?[^\n\\ ])\\*\\*";
    NSString *format = @"<em>%@</em>";
    
    [self replaceContextWithPattern:pattern withFormat:format];
}

@end
