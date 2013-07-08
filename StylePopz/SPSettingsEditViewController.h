//
//  SPSettingsEditViewController.h
//  StylePopz
//
//  Created by Thiago Ricieri on 02/07/13.
//  Copyright (c) 2013 Thiago Ricieri. All rights reserved.
//

#import "definitions.h"
#import <UIKit/UIKit.h>

@interface SPSettingsEditViewController : UIViewController

@property (nonatomic) SPSettingsOption option;

- (id) initWithOption: (SPSettingsOption) settingsOption;

@end