//
//  SPAppDelegate.h
//  StylePopz
//
//  Created by Thiago Ricieri on 02/07/13.
//  Copyright (c) 2013 Thiago Ricieri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "definitions.h"

@interface SPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void) changeViewControllerTo: (SPChangeViewControllerTo) changeViewControllerInfo;

@end
