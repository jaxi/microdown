//
//  Parser.h
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextFragment : NSObject

@property NSString *content;

- (instancetype) initWithContent: (NSString *)content;
- (void) replaceContextWithPattern: (NSString *)pattern withFormat: (NSString *)format;

@end
