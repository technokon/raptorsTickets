//
//  PurchaseDetailsViewController.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-19.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import "PurchaseDetailsViewController.h"
#import "PurchaseListViewController.h"

@interface PurchaseDetailsViewController ()

@end

@implementation PurchaseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemLabel.text = self.purchase.item;
    self.quantityLabel.text = [NSString stringWithFormat:@"%ld", self.purchase.quantity];
    self.priceLabel.text = [NSString stringWithFormat:@"$%@", self.purchase.total];
    
    self.dateLabel.text = [self.purchase getFormattedDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"9"]) {
        PurchaseListViewController *destination = (PurchaseListViewController *)[segue destinationViewController];
        [destination setTicketBase: self.ticketBase];
    }
    
}


@end
