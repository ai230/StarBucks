//
//  ViewController.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (IBAction)segmentValueChanged:(id)sender {

    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;


        if (selectedSegment == 0) {
            // short
            self.size = @"Short";
        }
        else if (selectedSegment == 1) {
            // tall
            self.size = @"Tall";
        } else if (selectedSegment == 2) {
            // grande
            self.size = @"Grande";
        }

}


- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    switch(row) {
        case 0:
            title = @"1";
            self.amount = 1;
            break;
        case 1:
            title = @"2";
            self.amount = 2;
            break;
        case 2:
            title = @"3";
            self.amount = 3;
            break;
        case 3:
            title = @"4";
            self.amount = 4;
            break;
        case 4:
            title = @"5";
            self.amount = 5;
            break;
        case 5:
            title = @"6";
            self.amount = 6;
            break;
        case 6:
            title = @"7";
            self.amount = 7;
            break;
        case 7:
            title = @"8";
            self.amount = 8;
            break;
        case 8:
            title = @"9";
            self.amount = 9;
            break;
        case 9:
            title = @"10";
            self.amount = 10;
            break;
    }
    return title;
}

- (IBAction)getOrderFromButton:(id)sender {
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *date = [[NSDateComponents alloc]init];
    date.year = 1;
    NSDate *myExpiredDate = [calendar dateByAddingComponents:date toDate:today options:0];
    
    NSLog(@"Start!!!!!\n");
    NSNumber *myUniqueID = [[NSNumber alloc] initWithInt:12345];
    NSInteger currentStars = self.starLabel.text.integerValue;
    NSString *cardLevel;
    if (0 < currentStars && currentStars < 300) {
        cardLevel = @"Green";
    } else {
        cardLevel = @"Gold";
    }


    Card * card = [[Card alloc] initWithMyParameters:self.moneyLabel.text.floatValue currentStars:currentStars uniquId:myUniqueID expiredDate:myExpiredDate cardLevel:cardLevel];
    Customer * customer = [[Customer alloc] initWithMyInformationPrameters:@"AI" card:card];
    
    Staff * staff = [[Staff alloc]initWithStaffParameters:@"staff1" perHourWage:10 workingHours:nil workingDays:nil];
    Coffee * coffee = [[Coffee alloc] initWithCoffeeParameters:self.size addIns:nil serveOptions:nil shotOptions:nil flavours:nil toppings:nil];
    
    Order * order = [[Order alloc] initWithOrderPrameters:self.amount coffee:coffee];
  
    customer.order = order;
    customer.order.coffee = coffee;
    customer.card = card;
    
    if(customer.order.coffee.size == nil)
    {
        order.coffee.size = @"Tall";
    }
    
    [order printMyOrderInfo];
    [card printMyCardInfo];
    [staff takeOrder:customer];

    
    [staff takeOrder:customer];
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f", customer.card.storedMoney];
    self.starLabel.text = [NSString stringWithFormat:@"%ld", customer.card.currentStars];
}

@end
