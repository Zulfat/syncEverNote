//
//  Parser.h
//  importingFromEvernote
//
//  Created by Zulfat on 14.01.14.
//  Copyright (c) 2014 Zulfat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject
-(NSMutableDictionary*) parseENNotes:(NSDictionary*) note;
@end
