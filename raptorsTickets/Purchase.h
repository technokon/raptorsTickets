//
//  Purchase.h
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-17.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Purchase : NSObject

@property (nonatomic, strong) NSString *item;

@property (nonatomic, strong) NSDecimalNumber *total;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, assign) NSInteger quantity;

-(id) initWithItem:(NSString *)item total:(NSDecimalNumber *)total andQuantity:(NSInteger)quantity;

-(NSString *) getFormattedDate;

@end
