//
//  Purchase.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-17.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import "Purchase.h"

@implementation Purchase

-(id) initWithItem:(NSString *)item total:(NSDecimalNumber *)total andQuantity:(NSInteger)quantity {
    self = [super init];
    if (self) {
        self.item = item;
        self.quantity = quantity;
        self.total = total;
        self.date = [NSDate date];
    }
    return self;
    
}

-(NSString *) getFormattedDate {
    if (self.date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterMediumStyle];
        NSString *result = [formatter stringFromDate:self.date];
        return result;
    }
    return @"";
}

@end
