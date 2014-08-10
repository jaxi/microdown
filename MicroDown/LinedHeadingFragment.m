//
//  LinedHeadingFragment.m
//  MicroDown
//
//  Created by Jingkai He on 04/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "LinedHeadingFragment.h"

static NSString *h1Pattern = @"\\A={3,}\\s*";
static NSString *h2Pattern = @"\\A-{3,}\\s*";
static NSRegularExpression *h1Regex;
static NSRegularExpression *h2Regex;

@implementation LinedHeadingFragment

+ (void)initialize
{
    if (!h1Regex) {
        h1Regex = [NSRegularExpression
                   regularExpressionWithPattern:h1Pattern
                   options:0
                   error:nil];
    }
    
    if (!h2Regex) {
        h2Regex = [NSRegularExpression
                   regularExpressionWithPattern:h2Pattern
                   options:0
                   error:nil];
    }
    
}
- (instancetype) init
{
    self = [super init];
    
    if (self) {
        self.parsed = NO;
    }
    
    return self;
}

+ (BOOL) isHeadingWithLine: (NSString *)line andDocument: (Document *) document;
{
    NSError *error1, *error2;
    
    NSRange range = NSMakeRange(0, [line length]);
    
    NSRegularExpression *h1Regex = [[NSRegularExpression alloc]
                                    initWithPattern:h1Pattern
                                    options:0
                                    error:&error1];
    
    NSRegularExpression *h2Regex = [[NSRegularExpression alloc]
                                    initWithPattern:h2Pattern
                                    options:0
                                    error:&error2];
    
    BOOL h1Match = [[h1Regex matchesInString:line options:0 range:range] count] > 0;
    BOOL h2Match = [[h2Regex matchesInString:line options:0 range:range] count] > 0;
    
    BaseFragment *element = document.elements.lastObject;
    
    
    BOOL _isHeading = YES;
    
    _isHeading = (h1Match || h2Match) && (element != nil) &&
    [element isKindOfClass:[ParagraphFragment class]];
    
    return _isHeading;
}

- (NSString *) toHTML
{
    if (self.parsed == YES) {
        return self.content;
    }
    
    ParagraphFragment *paragraph = [self.document.elements lastObject];
    
    TextFragment *element = [paragraph.children lastObject];
    
    [paragraph removeLastChild];
    
    if ([paragraph.children count] == 0) {
        [self.document.elements removeLastObject];
    }
    
    NSError *error1, *error2;
    
    NSRange range = NSMakeRange(0, [self.content length]);
    
    NSRegularExpression *h1Regex = [[NSRegularExpression alloc]
                                    initWithPattern:h1Pattern
                                    options:0
                                    error:&error1];
    
    NSRegularExpression *h2Regex = [[NSRegularExpression alloc]
                                    initWithPattern:h2Pattern
                                    options:0
                                    error:&error2];
    
    BOOL h1Match = [[h1Regex matchesInString:self.content options:0 range:range] count] > 0;
    BOOL h2Match = [[h2Regex matchesInString:self.content options:0 range:range] count] > 0;
    
    if (h1Match) {
        self.content = [NSString stringWithFormat:@"<h1>%@</h1>",
                        [element toHTML]];
    }else if (h2Match){
        self.content = [NSString stringWithFormat:@"<h2>%@</h2>",
                        [element toHTML]];
    }
    
    return self.content;
}

- (void) parse
{
    [self toHTML];
    self.parsed = YES;
    
    [self.document.elements addObject:self];
}
@end
