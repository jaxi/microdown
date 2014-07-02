//
//  LinkFragment.m
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "LinkFragment.h"

@implementation LinkFragment

+(NSString *) pattern
{
    static NSString *_pattern = nil;
    
    if (_pattern == nil) {
        _pattern = @"((http|https|ftp)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+)";
    }
    
    return _pattern;
}

-(void)toHTML
{
    NSString *format = @"<a href=\"%@\" />";
    
    [self replaceContextWithPattern:[self.class pattern] withFormat:format];
}

-(void) parse
{
    NSLog(@"Hello World");
}
@end
