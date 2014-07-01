//
//  HeadingFragment.m
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "HeadingFragment.h"

@implementation HeadingFragment

-(void)toHTML
{
    NSString *pattern = @"\\A#{1,6} *([^\n]+?) *#* *(?:\n+|$)";
    NSString *format = @"<h%d>%@</h%d>";
    
    NSError *error = error;
    
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    NSArray *arrayOfAllMatches = [regex matchesInString:self.content options:0 range:NSMakeRange(0, [self.content length])];
    
    if ([arrayOfAllMatches count] == 0) {
        return;
    }
    
    NSTextCheckingResult *match = [arrayOfAllMatches objectAtIndex:0];
    NSString *subStringForMatch = [self.content substringWithRange: match.range];
    
    int hashtagCount = 0;
    for (int i = 0; [subStringForMatch characterAtIndex:i] == '#'; ++ i) {
        ++ hashtagCount;
    }
    
    self.content = [regex stringByReplacingMatchesInString:self.content options:0 range:NSMakeRange(0, [self.content length]) withTemplate:[NSString stringWithFormat:format, hashtagCount, @"$1", hashtagCount]];
}

@end
