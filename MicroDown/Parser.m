//
//  Parser.m
//  MicroDown
//
//  Created by Jingkai He on 02/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "Parser.h"

@implementation Parser

-(instancetype)initWithDocument:(Document *)document
{
    self = [super init];
    
    if (self) {
        self.document = document;
    }
    
    return self;
}

- (void) parse
{
    while (_document.startLine <= _document.endLine) {
        NSInteger currentLine = _document.startLine;
        NSString *lineOfMD = [_document.arrayOfLines objectAtIndex:currentLine];
        NSRange rangeOfLine = NSMakeRange(0, [lineOfMD length]);

        NSInteger countOfBlankLineMatch = [[Fragments blankLineRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];

        NSInteger countOfHeadingMatch = [[Fragments headingRegex] numberOfMatchesInString:lineOfMD options:0 range:rangeOfLine];
        
        // NSLog(@"Line: %ld %@", _document.startLine + 1,lineOfMD);

        if (countOfBlankLineMatch > 0) {
            ++ _document.startLine;

            BlankLineFragment *frag = [[BlankLineFragment alloc] initWithContent: lineOfMD andDocument:_document];

            [frag parse];
        }else if (countOfHeadingMatch > 0){
            ++ _document.startLine;
            
            HeadingFragment *frag = [[HeadingFragment alloc] initWithContent: lineOfMD andDocument:_document];
            [frag parse];
        }else if ([LinedHeadingFragment isHeadingWithLine:lineOfMD andDocument:_document]) {
            ++ _document.startLine;
            
            LinedHeadingFragment *frag = [[LinedHeadingFragment alloc] initWithContent:lineOfMD andDocument:_document];
            [frag parse];
        }else {
            ++ _document.startLine;
            TextFragment *frag = [[TextFragment alloc] initWithContent:lineOfMD andDocument:_document];
            [frag parse];
        }
    }
}

-(NSString *) render
{
    if (_renderedString == nil) {
        NSMutableArray *arrayOfRenderedString = [[NSMutableArray alloc] init];
        for (TextFragment *element in self.document.elements ) {
            [arrayOfRenderedString addObject: [element toHTML]];
        }
        
        _renderedString = [arrayOfRenderedString componentsJoinedByString:@"\n"];
    }
    
    return  _renderedString;
}
@end
