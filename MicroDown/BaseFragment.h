//
//  Parser.h
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Document.h"

@interface BaseFragment : NSObject

@property NSString *content;
@property (weak) Document *document;

- (instancetype) initWithContent: (NSString *)content;
- (instancetype) initWithContent: (NSString *)content andDocument: (Document *)document;

- (void) parse;
- (NSString *) toHTML;

- (NSString *) replaceContextWithPattern: (NSString *)pattern withFormat: (NSString *)format;

@end