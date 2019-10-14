//
//  Ticket.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-10.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

-(id) initWithName:(NSString *)name price:(NSDecimalNumber *)price andQuantity:(NSInteger)quantity {
    self = [super init];
    if (self) {
        self.name = name;
        self.price = price;
        self.quantity = quantity;
    }
    return self;
}

@end
