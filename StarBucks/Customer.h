//
//  Customer.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Order.h"

@interface Customer : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) Card* card;
@property (strong, nonatomic) Order* order;

- (id)initWithMyInformationPrameters:(NSString*)myName
                                card:(Card*)currentCard;

- (void)pay;
- (void)reloadStoredMoney:(float)reloadMoney;

@end
