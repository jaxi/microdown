//
//  LinkFragment.m
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "LinkFragment.h"

@implementation LinkFragment

-(void)toHTML
{
    NSString *pattern = @"((http|https|ftp)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+)";
    
    NSString *format = @"<a href=\"%@\" />";
    
    [self replaceContextWithPattern:pattern withFormat:format];
}

@end
