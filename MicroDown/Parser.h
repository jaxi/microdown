//
//  Parser.h
//  MicroDown
//
//  Created by Jingkai He on 02/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fragments.h"

@interface Parser : NSObject

@property Document *document;

-(instancetype) initWithDocument: (Document *) document;

-(void) parse;
-(NSString *) render;

@end
