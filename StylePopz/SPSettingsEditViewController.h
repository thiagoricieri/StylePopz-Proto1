//
//  SPSettingsEditViewController.h
//  StylePopz
//
//  Created by Thiago Ricieri on 02/07/13.
//  Copyright (c) 2013 Thiago Ricieri. All rights reserved.
//

#import "definitions.h"
#import <UIKit/UIKit.h>

@interface SPSettingsEditViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UIButton *male;
    UIButton *female;
    NSArray *keys;
}

@property (nonatomic) SPSettingsOption option;
@property (nonatomic, strong) UITableView *settingsTable;
@property (nonatomic, strong) NSDictionary *preferences;

- (id) initWithOption: (SPSettingsOption) settingsOption;

@end