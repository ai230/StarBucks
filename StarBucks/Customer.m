//
//  Customer.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (id)initWithMyInformationPrameters:(NSString*) myName card:(Card*)currentCard
{
    self = [super init];
    if(self)
    {
        self.name = myName;
        self.card = currentCard;
    }
    return self;
}

- (void)pay
{
    NSLog(@"Paid:)\n");
}

- (void)reloadStoredMoney:(float)reloadMoney
{
    self.card.storedMoney = self.card.storedMoney + reloadMoney;
}

@end
