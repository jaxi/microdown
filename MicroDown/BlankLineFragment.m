//
//  BlankLineFragment.m
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "BlankLineFragment.h"

@implementation BlankLineFragment

-(void) toHTML
{
    NSString *pattern = @"(\\A\\s*$)";
    
    NSString *format = @"<br />";
    
    [self replaceContextWithPattern:pattern withFormat:format];
}
@end
