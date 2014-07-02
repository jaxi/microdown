//
//  Parser.m
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "TextFragment.h"

@implementation TextFragment

- (instancetype) init
{
    self = [super init];
    
    if (self) {
        self.content = @"";
    }
    
    return self;

}

- (instancetype) initWithContent:(NSString *)content andDocument:(Document *)document
{
    self = [super init];
    
    if (self) {
        self.content = content;
        self.document = document;
    }
    
    return self;
}

- (instancetype) initWithContent: (NSString *)content
{
    self = [super init];
 
    if (self) {
        self.content = content;
    }
    
    return self;
}

- (void) replaceContextWithPattern: (NSString *)pattern withFormat: (NSString *)format
{
    NSError *error = error;
    
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
        
    self.content = [regex stringByReplacingMatchesInString:self.content options:0 range:NSMakeRange(0, [self.content length]) withTemplate:[NSString stringWithFormat:format, @"$1"]];
}

-(void) toHTML
{
    [NSException raise:@"Not implemented Error" format:@"toHTML method is not implemented"];
}

-(void) parse
{
   [NSException raise:@"Not implemented Error" format:@"parse method is not implemented"];
}

- (NSString *) description
{
    return self.content;
}
@end
