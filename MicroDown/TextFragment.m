//
//  TextFragment.m
//  MicroDown
//
//  Created by Jingkai He on 03/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "TextFragment.h"

static NSString *emailPattern = @"([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4})";
static NSString *emailFormat = @"<a href=\"mailto:%@\" target=\"_top\">Send Mail</a>";

static NSString *autolinkPattern = @"((http|https|ftp)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+)";
static NSString *autolinkFormat = @"<a href=\"%@\" />";


static NSString *linkPattern;
static NSString *linkFormat;

static NSString *imageInlinePattern = @"\\!\\[(.+?)\\]\\s*\\((.+?)\\)";
static NSString *imageInlineFormat = @"<image src=\"%@\" alt=\"%@\" />";

static NSString *imageReferencePattern = @"\\!\\[(.+?)\\]\\s*\\[(.+?)\\]";
static NSString *imageReferenceFormat = @"<image src=\"%@\" alt=\"%@\" />";

static NSString *boldPattern = @"\\*([^\n\\ ][^\n]+?[^\n\\ ])\\*";
static NSString *boldFormat = @"<strong>%@</strong>";

static NSString *italicPattern = @"\\*\\*([^\n\\ ][^\n]+?[^\n\\ ])\\*\\*";
static NSString *italicFormat = @"<em>%@</em>";

static NSString *delPattern = @"\\*\\*([^\n\\ ][^\n]+?[^\n\\ ])\\*\\*";
static NSString *delFormat = @"<del>%@</del>";

@implementation TextFragment

- (void) parse
{
    [self.document.elements addObject:self];
}

- (NSString *) toHTML
{
    [self plainConvert];
    
    return self.content;
}

- (void) plainConvert
{
    [self convertInlineImage];
    [self convertReferenceImage];
//    self.content = [self replaceContextWithPattern:delPattern withFormat:delFormat];
//    self.content = [self replaceContextWithPattern:emailPattern withFormat:emailFormat];
//    self.content = [self replaceContextWithPattern:autolinkPattern withFormat:autolinkFormat];
//    self.content = [self replaceContextWithPattern:boldPattern withFormat:boldFormat];
}

- (void) convertInlineImage
{
    NSError *error = error;
    
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:imageInlinePattern options:0 error:&error];
    
    self.content = [regex stringByReplacingMatchesInString:self.content options:0 range:NSMakeRange(0, [self.content length]) withTemplate:[NSString stringWithFormat:imageInlineFormat, @"$2", @"$1"]];
}

- (void) convertReferenceImage
{
    NSError *error = error;
    
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:imageReferencePattern options:0 error:&error];
    
    self.content = [regex stringByReplacingMatchesInString:self.content options:0 range:NSMakeRange(0, [self.content length]) withTemplate:[NSString stringWithFormat:imageReferenceFormat, @"$2", @"$1"]];
}

@end
