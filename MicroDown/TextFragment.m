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

static NSString *linkPattern = @"((http|https|ftp)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+)";
static NSString *linkFormat = @"<a href=\"%@\" />";

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
    [self del];
    
    return self.content;
}

- (void) del
{
    self.content = [self replaceContextWithPattern:delPattern withFormat:delFormat];
}

@end
