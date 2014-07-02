//
//  Fragments.h
//  MicroDown
//
//  Created by Jingkai He on 01/07/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MailFragment.h"
#import "LinkFragment.h"
#import "BlankLineFragment.h"
#import "BoldFragment.h"
#import "HeadingFragment.h"
#import "ItalicFragment.h"
#import "DelFragment.h"

@interface Fragments : NSObject

//+(NSString *) mailPattern;
//+(NSString *) linkPattern;
//+(NSString *) blankLinePattern;
//+(NSString *) headingPattern;
//+(NSString *) boldPattern;
//+(NSString *) italicPattern;
//+(NSString *) delPattern;

+(NSRegularExpression *) mailRegex;
+(NSRegularExpression *) linkRegex;
+(NSRegularExpression *) blankLineRegex;
+(NSRegularExpression *) headingRegex;
+(NSRegularExpression *) boldRegex;
+(NSRegularExpression *) italicRegex;
+(NSRegularExpression *) delRegex;
@end
