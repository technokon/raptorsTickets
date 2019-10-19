//
//  ManagerNavigationViewController.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-14.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//
#import "ManagerNavigationViewController.h"
#import "TicketModificationViewController.h"
#import "PurchaseListViewController.h"
#import "ViewController.h"

@interface ManagerNavigationViewController ()

@end

@implementation ManagerNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"4"]) {
        ViewController *destination = (ViewController *)[segue destinationViewController];
        [destination setTicketBase:self.ticketBase];
    } else if ([[segue identifier] isEqualToString:@"1"]) {
        TicketModificationViewController *destination = (TicketModificationViewController *)[segue destinationViewController];
        [destination setTicketBase:self.ticketBase];
    } else if ([[segue identifier] isEqualToString:@"5"]) {
        PurchaseListViewController *destination = (PurchaseListViewController *)[segue destinationViewController];
        [destination setTicketBase:self.ticketBase];
    }
   
}


@end
