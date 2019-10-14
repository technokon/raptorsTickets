//
//  ViewController.h
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-07.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketBase.h"
#import "Ticket.h"

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *quantityRequired;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UILabel *seatsLeft;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (nonatomic, strong) TicketBase *ticketBase;

@property (nonatomic, strong) Ticket *selectedTicket;
@property (weak, nonatomic) IBOutlet UILabel *confirmationMessage;

@end

