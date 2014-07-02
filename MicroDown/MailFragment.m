//
//  MailFragment.m
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "MailFragment.h"

@implementation MailFragment

+ (NSString *) pattern
{
    static NSString *_pattern = nil;
    
    if (_pattern == nil) {
        _pattern = @"([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4})";
    }
    
    return _pattern;
}

- (void) toHTML
{
    NSString *format = @"<a href=\"mailto:%@\" target=\"_top\">Send Mail</a>";
    
    [self replaceContextWithPattern:[self.class pattern] withFormat:format];
}

-(void) parse
{
    NSLog(@"Hello World");
}
@end
