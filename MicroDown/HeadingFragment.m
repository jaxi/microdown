//
//  HeadingFragment.m
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "HeadingFragment.h"

@implementation HeadingFragment

+(NSString *) pattern
{
    static NSString *_pattern;
    
    if (_pattern == nil) {
        _pattern = @"\\A(#{1,6}) ([^\n]+?) *#* *(?:\n+|$)";
    }
    
    return _pattern;
}

-(NSString *)toHTML
{
    NSString *format = @"<h%d>%@</h%d>";
    
    NSError *error = error;
    
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:[self.class pattern] options:0 error:&error];
    
    self.content = [regex
                    stringByReplacingMatchesInString:self.content
                    options:0
                    range:NSMakeRange(0, [self.content length])
                    withTemplate:[NSString stringWithFormat:format,
                                  [@"$1" length],
                                  [[[TextFragment alloc] initWithContent:@"$2"] toHTML],
                                  [@"$1" length]]];
    
    return self.content;
}

-(void) parse
{
    [self.document.elements addObject:self];
}
@end
