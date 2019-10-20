//
//  ViewController.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-07.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import "ViewController.h"
#import "TicketBase.h"
#import "Ticket.h"
#import "Purchase.h"
#import "ManagerNavigationViewController.h";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    self.quantityRequired.text = @"1";
    // setup the db and load some data into it
    if (!self.ticketBase) {
        self.ticketBase = [TicketBase alloc];
        Ticket *t1 = [Ticket alloc];
        t1 = [
              t1 initWithName:@"First Row"
              price: [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithDouble:200.99]decimalValue]]
              andQuantity:40
              ];
        [self.ticketBase.db addObject:t1];
        Ticket *t2 = [Ticket alloc];
        t2 = [
              t2 initWithName:@"Second Row"
              price: [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithDouble:100.99]decimalValue]]
              andQuantity:300
              ];
        [self.ticketBase.db addObject:t2];
    }
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.ticketBase.db count];
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Ticket *t = [self.ticketBase.db objectAtIndex:row];
    self.selectedTicket = t;
    
    [self calculateAndSetTotal];
    
    self.confirmationMessage.text = @"";
    
    return [NSString stringWithFormat:@"%@ - $%@", t.name, t.price];
}

- (IBAction)onQuantityEdit:(UITextField *)sender {
    [self calculateAndSetTotal];
    self.confirmationMessage.text = @"";
}

-(void) calculateAndSetTotal {
    NSDecimalNumber *total = [self calculateTotal];
    self.total.text = [NSString stringWithFormat:@"$%@", total];
}

-(NSDecimalNumber *) calculateTotal {
    Ticket *t = self.selectedTicket;
    self.seatsLeft.text = [NSString stringWithFormat:@"%ld", t.quantity];
    
    NSDecimalNumber *q;
    if ([self.quantityRequired.text length] > 0) {
        q = [[NSDecimalNumber alloc] initWithString:self.quantityRequired.text];
    } else {
        q = [NSDecimalNumber zero];
    }
    
    NSDecimalNumber *total = [t.price decimalNumberByMultiplyingBy:q];
    
    return total;
}

- (IBAction)onBuy:(UIButton *)sender {
    // update confirmation message and change quantity
    int qRequired = [self.quantityRequired.text intValue];
    if (qRequired <= self.selectedTicket.quantity) {
        self.selectedTicket.quantity = self.selectedTicket.quantity -  [self.quantityRequired.text integerValue];
        
        self.seatsLeft.text = [NSString stringWithFormat:@"%ld", self.selectedTicket.quantity];
        
        NSString *seatName = self.selectedTicket.name;
        self.confirmationMessage.text = [NSString stringWithFormat:@"You have successfully purchased %d tickets for %@", qRequired, seatName];
        Purchase *purchase = [Purchase alloc];
        NSDecimalNumber *total = [self calculateTotal];
        purchase = [purchase initWithItem:seatName total:total andQuantity:qRequired];
        [self.ticketBase.purchases addObject:purchase];
    } else {
        self.confirmationMessage.text = [NSString stringWithFormat:@"There is only %ld available for this seat", self.selectedTicket.quantity];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onManagerClick:(UIButton *)sender {
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ManagerNavigationViewController *managerNavigation = (ManagerNavigationViewController *)[segue destinationViewController];
    [managerNavigation setTicketBase:self.ticketBase];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
