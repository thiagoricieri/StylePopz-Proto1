//
//  SPSettingsEditViewController.m
//  StylePopz
//
//  Created by Thiago Ricieri on 02/07/13.
//  Copyright (c) 2013 Thiago Ricieri. All rights reserved.
//

#import "SPSettingsEditViewController.h"

@interface SPSettingsEditViewController ()

@end

@implementation SPSettingsEditViewController

@synthesize option;

#pragma mark -
#pragma mark Init Variables Stack
- (void) initVariables {
    self.title = @"Settings";
    // Dinamically create
    if(option == SPSettingsOptionSex){
        self.title = @"Settings";
    }
    else if(option == SPSettingsOptionSizes){
        
    }
    else if(option == SPSettingsOptionColor){
        
    }
    else if(option == SPSettingsOptionPrints){
        
    }
    else if(option == SPSettingsOptionBrandLuxury){
        
    }
    else if(option == SPSettingsOptionBrandStreet){
        
    }
    else if(option == SPSettingsOptionBrandFastFashion){
        
    }
    else if(option == SPSettingsOptionIndieDesigners){
        
    }
    else if(option == SPSettingsOptionSaveAndKeep) {
        
    }
}

#pragma mark -
#pragma mark Visual Stuff Design
- (void) buildLayout {
    if(option == SPSettingsOptionSex){
        [self buildUIforSex];
    }
    else if(option == SPSettingsOptionSizes){
        
    }
    else if(option == SPSettingsOptionColor){
        
    }
    else if(option == SPSettingsOptionPrints){
        
    }
    else if(option == SPSettingsOptionBrandLuxury){
        
    }
    else if(option == SPSettingsOptionBrandStreet){
        
    }
    else if(option == SPSettingsOptionBrandFastFashion){
        
    }
    else if(option == SPSettingsOptionIndieDesigners){
        
    }
    else if(option == SPSettingsOptionSaveAndKeep) {
        
    }
}

#pragma mark -
#pragma mark Visual layouting options
- (void) buildUIforSex {
    
}
- (void) buildUIforSizes {
    
}
- (void) buildUIforColor {
    
}
- (void) buildUIforPrints {
    
}
- (void) buildUIforBrandLuxury {
    
}
- (void) buildUIforBrandStreet {
    
}
- (void) buildUIforBrandFastFashion {
    
}
- (void) buildUIforIndieDesigners {
    
}
- (void) buildUIforSaveAndKeep {
    
}

#pragma mark -
#pragma mark Button Calls



#pragma mark -
#pragma mark View Handle Stuff
- (id) initWithOption: (SPSettingsOption) settingsOption  {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        option= settingsOption;
        // Custom initialization
        [self initVariables];
        [self buildLayout];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
