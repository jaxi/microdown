//
//  Document.h
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fragments.h"
#import "Parser.h"

@interface Document : NSObject

@property NSMutableArray *arrayOfLines;
@property NSMutableArray *elements;

@property NSInteger startLine;
@property NSInteger endLine;


- (instancetype) initWithContent: (NSString *)content;

- (void)parse;
@end
