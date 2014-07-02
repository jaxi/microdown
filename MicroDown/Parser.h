//
//  Parser.h
//  MicroDown
//
//  Created by Jingkai He on 02/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject

@property NSArray *lines;

- (instancetype) initWithLines: (NSArray *)lines;

@end
