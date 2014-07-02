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
        
//        NSString *pattern = @"([^\n]+?)\n|\n\r";
//        
//        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
//        
//        NSArray *matches = [regex matchesInString:content options:0 range:NSMakeRange(0, [content length])];
//        
//        // NSLog(@"%ld", (unsigned long)[matches count]);
//        
//        for (NSTextCheckingResult *match in matches ) {
//            NSString *matchedString = [content substringWithRange: [match rangeAtIndex:1]];
//            
//            [self.arrayOfLines addObject:matchedString];
//        }
        
        self.arrayOfLines = [NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"\n"]];
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
        NSString *lineOfMD = [self.arrayOfLines objectAtIndex:currentLine];
        NSRange rangeOfLine = NSMakeRange(0, [lineOfMD length]);

//        NSInteger countOfMailMatch = [[Fragments mailRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
        
//        NSInteger countOfLinkMatch = [[Fragments linkRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
        
        NSInteger countOfBlankLineMatch = [[Fragments blankLineRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
//
//        NSInteger countOfHeadingMatch = [[Fragments headingRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
//        
//        NSInteger countOfBoldMatch = [[Fragments boldRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
//        
//        NSInteger countOfItalicMatch = [[Fragments italicRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
//        
//        NSInteger countOfDelMatch = [[Fragments delRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
        
        NSLog(@"Line: %ld %@", self.startLine + 1,lineOfMD);
        NSLog(@"%ld", countOfBlankLineMatch);
        
        ++ self.startLine;
    }
}

- (NSString *) description
{
    NSString *resultArray = [self.arrayOfLines componentsJoinedByString:@"\n"];
    NSString *result = [NSString stringWithFormat:@"%@\nStartLine: %ld\nEndLine: %ld", resultArray, (long)self.startLine, (long)self.endLine];
    return result;
}


@end
