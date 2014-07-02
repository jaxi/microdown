//
//  Document.m
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "Document.h"

@implementation Document

- (instancetype) init
{
    self = [super init];
    
    if (self) {
        self.arrayOfLines = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (instancetype) initWithContent: (NSString *)content
{
    self = [super init];
    
    if (self) {
        
        self.arrayOfLines = [[NSMutableArray alloc] init];
        
        NSError *error = error;
        
        NSString *pattern = @"([^\n]+?)\n|\n\r";
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
        
        NSArray *matches = [regex matchesInString:content options:0 range:NSMakeRange(0, [content length])];
        
        // NSLog(@"%ld", (unsigned long)[matches count]);
        
        for (NSTextCheckingResult *match in matches ) {
            NSString *matchedString = [content substringWithRange: [match rangeAtIndex:1]];
            
            [self.arrayOfLines addObject:matchedString];
        }
        
        self.startLine = 0;
        self.endLine = [self.arrayOfLines count] - 1;
        
        self.elements = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) parse
{
    while (self.startLine <= self.endLine) {
        NSInteger currentLine = self.startLine;
        NSString *lineOfMD = [self.elements objectAtIndex:currentLine];
        NSRange rangeOfLine = NSMakeRange(0, [lineOfMD length]);
        
        if ([[Fragments mailRegex] matchesInString:lineOfMD options:0 range:rangeOfLine]) {
            
        }
    }
}

- (NSString *) description
{
    NSString *resultArray = [self.arrayOfLines componentsJoinedByString:@"\n"];
    NSString *result = [NSString stringWithFormat:@"%@\nStartLine: %ld\nEndLine: %ld", resultArray, (long)self.startLine, (long)self.endLine];
    return result;
}


@end
