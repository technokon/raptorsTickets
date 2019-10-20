//
//  PurchaseDetailsViewController.h
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-19.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Purchase.h"
#import "TicketBase.h"

@interface PurchaseDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) Purchase *purchase;
@property (nonatomic, strong) TicketBase *ticketBase;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@end
