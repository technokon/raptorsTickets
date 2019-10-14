//
//  Ticket.h
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-10.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSDecimalNumber *price;

@property (nonatomic, assign) NSInteger quantity;

-(id) initWithName:(NSString *)name price:(NSDecimalNumber *)price andQuantity:(NSInteger)quantity;

@end
