//
//  PurchaseListViewController.h
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-19.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketBase.h"
#import "Ticket.h"

@interface PurchaseListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) TicketBase *ticketBase;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, assign) NSInteger selectedRow;

@end
