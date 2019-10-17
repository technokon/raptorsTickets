//
//  TicketModificationViewController.h
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-17.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketBase.h"
#import "Ticket.h"

@interface TicketModificationViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, assign) BOOL shouldSave;

@property (weak, nonatomic) IBOutlet UITextField *quantity;
@property (weak, nonatomic) IBOutlet UITextField *price;

@property (nonatomic, strong) TicketBase *ticketBase;
@property (nonatomic, strong) Ticket *selectedTicket;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
