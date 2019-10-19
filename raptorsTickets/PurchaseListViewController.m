//
//  PurchaseListViewController.m
//  raptorsTickets
//
//  Created by Emil Iakoupov on 2019-10-19.
//  Copyright © 2019 Emil Iakoupov. All rights reserved.
//

#import "PurchaseListViewController.h"
#import "Purchase.h"

@interface PurchaseListViewController ()

@end

@implementation PurchaseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table.delegate = self;
    self.table.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [self.ticketBase.purchases count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"test123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSArray *purchases = [self.ticketBase purchases];
    NSInteger row = indexPath.row;
    Purchase *purchase = [purchases objectAtIndex:row];
    NSString *name = purchase.item;
    NSInteger quantity = purchase.quantity;
    NSString *cellData = [NSString stringWithFormat:@"%@ is %ld", name, (long)quantity];
    [cell.textLabel setText:cellData];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
