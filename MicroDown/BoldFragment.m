//
//  BoldFragment.m
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "BoldFragment.h"

@implementation BoldFragment

+(NSString *)pattern
{
    static NSString *_pattern = nil;
    
    if (_pattern == nil) {
        _pattern = @"\\*([^\n\\ ][^\n]+?[^\n\\ ])\\*";
    }
    
    return  _pattern;
}

-(void)toHTML
{
    NSString *format = @"<strong>%@</strong>";
    
    [self replaceContextWithPattern:[self.class pattern] withFormat:format];
}

-(void) parse
{
    NSLog(@"Hello World");
}
@end
