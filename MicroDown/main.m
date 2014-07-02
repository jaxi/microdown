//
//  main.m
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Document.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
                
        MailFragment *frag = [[MailFragment alloc] initWithContent:@"jaxihe@gmail.com jaxihe@facebook.com"];
        [frag toHTML];
        
        NSLog(@"%@", frag);
        
        LinkFragment *link = [[LinkFragment alloc] initWithContent:@"http://youtube.com"];
        [link toHTML];
        
        NSLog(@"%@", link);

        BlankLineFragment *blank = [[BlankLineFragment alloc] initWithContent:@"    \n   \n"];
        [blank toHTML];
        NSLog(@"%@", blank);

        BoldFragment *bold = [[BoldFragment alloc] initWithContent:@"*abc* * def*"];
        [bold toHTML];
        NSLog(@"%@", bold);

        ItalicFragment *italic = [[ItalicFragment alloc] initWithContent:@"**abcd** **efg hjk**"];
        [italic toHTML];
        NSLog(@"%@", italic);
        
        DelFragment *del = [[DelFragment alloc] initWithContent:@"~~abc ~~ ~~ efg~~"];
        [del toHTML];
        NSLog(@"%@", del);
        
        NSLog(@"==========================");
        
        Document *doc = [[Document alloc] initWithContent:@"line1\nline2\n\nnew paragraph\n    some space\nsame paragraph\n\nnew p"];
        
        [doc parse];
        // NSLog(@"%@", doc);
    }
    
    return 0;
}

