//
//  Parser.m
//  importingFromEvernote
//
//  Created by Zulfat on 14.01.14.
//  Copyright (c) 2014 Zulfat. All rights reserved.
//

#import "Parser.h"

@implementation Parser
-(NSMutableDictionary*) parseENNotes:(NSDictionary*) note {
    NSMutableDictionary* SPnote = [[NSMutableDictionary alloc] init];
    if ([[note valueForKey:@"_attributes"] valueForKey:@"_reminderTime"]!=0)
        NSLog(@"4");
    return SPnote;
}
@end
