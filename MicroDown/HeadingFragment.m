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
        _pattern = @"\\A#{1,6} *([^\n]+?) *#* *(?:\n+|$)";
    }
    
    return _pattern;
}

-(NSString *)toHTML
{
    NSString *format = @"<h%d>%@</h%d>";
    
    NSError *error = error;
    
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:[self.class pattern] options:0 error:&error];
    
    NSArray *arrayOfAllMatches = [regex matchesInString:self.content options:0 range:NSMakeRange(0, [self.content length])];
    
    if ([arrayOfAllMatches count] == 0) {
        return @"";
    }
    
    NSTextCheckingResult *match = [arrayOfAllMatches objectAtIndex:0];
    NSString *subStringForMatch = [self.content substringWithRange: match.range];
    
    int hashtagCount = 0;
    for (int i = 0; [subStringForMatch characterAtIndex:i] == '#'; ++ i) {
        ++ hashtagCount;
    }
    
    return [regex stringByReplacingMatchesInString:self.content options:0 range:NSMakeRange(0, [self.content length]) withTemplate:[NSString stringWithFormat:format, hashtagCount, @"$1", hashtagCount]];
}

-(void) parse
{
    NSLog(@"Hello World");
}
@end
