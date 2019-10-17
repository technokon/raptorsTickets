//
//  TicketModificationViewController.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-17.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import "TicketModificationViewController.h"
#import "ManagerNavigationViewController.h"
#import "Ticket.h"

@interface TicketModificationViewController ()

@end

@implementation TicketModificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.shouldSave = NO;
    self.picker.dataSource = self;
    self.picker.delegate = self;
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
    
    [self setOriginalValues];
    
    return [NSString stringWithFormat:@"%@ - $%@", t.name, t.price];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"2"] && [self shouldSave]) {
        ManagerNavigationViewController *destination = (ManagerNavigationViewController *)[segue destinationViewController];
        [destination setTicketBase:self.ticketBase];
    }
}

- (IBAction)onPriceChange:(UITextField *)sender {
    Ticket *selected = [self selectedTicket];
    NSString *price = sender.text;
    selected.price = [NSDecimalNumber decimalNumberWithString:price];
    
    [self.picker reloadAllComponents];
}
- (IBAction)onQuantityChange:(UITextField *)sender {
    Ticket *selected = [self selectedTicket];
    NSInteger quantity = [sender.text integerValue];
    selected.quantity = quantity;
    
    [self.picker reloadAllComponents];
}

-(void)setOriginalValues {
    Ticket *selected = [self selectedTicket];
    self.price.text = [NSString stringWithFormat:@"%@", selected.price];
    self.quantity.text = [NSString stringWithFormat:@"%ld", selected.quantity];
}

- (IBAction)onCancel:(UIButton *)sender {
    [self setOriginalValues];
}
- (IBAction)onSave:(UIButton *)sender {
    self.shouldSave = YES;
}
@end
