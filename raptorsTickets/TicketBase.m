//
//  TicketBase.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-10.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import "TicketBase.h"

@implementation TicketBase

-(NSMutableArray *) db {
    if (!_db) {
        _db = [[NSMutableArray alloc] init];
    }
    return _db;
}

@end
