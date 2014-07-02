//
//  Fragments.m
//  MicroDown
//
//  Created by Jingkai He on 02/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import "Fragments.h"

@implementation Fragments

+(NSRegularExpression *) mailRegex
{
    NSError *error;
    
    static NSRegularExpression *_mailRegex = nil;
    if (_mailRegex == nil) {
        _mailRegex = [[NSRegularExpression alloc] initWithPattern:[MailFragment pattern] options:0 error:&error];
    }
    
    return _mailRegex;
}

+(NSRegularExpression *) linkRegex
{
    NSError *error;
    
    static NSRegularExpression *_linkRegex = nil;
    if (_linkRegex == nil) {
        _linkRegex = [[NSRegularExpression alloc] initWithPattern:[MailFragment pattern] options:0 error:&error];
    }
    
    return _linkRegex;
}

+(NSRegularExpression *) blankLineRegex
{
    NSError *error;
    
    static NSRegularExpression *_blankLineRegex = nil;
    if (_blankLineRegex == nil) {
        _blankLineRegex = [[NSRegularExpression alloc] initWithPattern:[MailFragment pattern] options:0 error:&error];
    }
    
    return _blankLineRegex;
}

+(NSRegularExpression *) headingRegex
{
    NSError *error;
    
    static NSRegularExpression *_headingRegex = nil;
    if (_headingRegex == nil) {
        _headingRegex = [[NSRegularExpression alloc] initWithPattern:[MailFragment pattern] options:0 error:&error];
    }
    
    return _headingRegex;
}

+(NSRegularExpression *) boldRegex
{
    NSError *error;
    
    static NSRegularExpression *_boldRegex = nil;
    if (_boldRegex == nil) {
        _boldRegex = [[NSRegularExpression alloc] initWithPattern:[MailFragment pattern] options:0 error:&error];
    }
    
    return _boldRegex;
}

+(NSRegularExpression *) italicRegex
{
    NSError *error;
    
    static NSRegularExpression *_italicRegex = nil;
    if (_italicRegex == nil) {
        _italicRegex = [[NSRegularExpression alloc] initWithPattern:[MailFragment pattern] options:0 error:&error];
    }
    
    return _italicRegex;
}

+(NSRegularExpression *) delRegex
{
    NSError *error;
    
    static NSRegularExpression *_delRegex = nil;
    if (_delRegex == nil) {
        _delRegex = [[NSRegularExpression alloc] initWithPattern:[MailFragment pattern] options:0 error:&error];
    }
    
    return _delRegex;
}

@end
