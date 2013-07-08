//
//  SPLoginViewController.m
//  StylePopz
//
//  Created by Thiago Ricieri on 02/07/13.
//  Copyright (c) 2013 Thiago Ricieri. All rights reserved.
//

#import "definitions.h"
#import "StylePopz.h"
#import "SPAppDelegate.h"
#import "SPLoginViewController.h"

@interface SPLoginViewController ()

@end

@implementation SPLoginViewController

#pragma mark -
#pragma mark Init Variables Stack
- (void) initVariables {
    
}

#pragma mark -
#pragma mark Visual Stuff Design
- (void) buildLayout {
    UITextField *emailField = [[UITextField alloc] initWithFrame:frame(30, 30, 260, 40)];
    emailField.placeholder = @"E-mail";
    emailField.layer.borderColor = [preto CGColor];
    emailField.layer.borderWidth = 1;
    [self.view addSubview:emailField];
    UITextField *passwordField = [[UITextField alloc] initWithFrame:bindy(emailField, 10)];
    passwordField.placeholder = @"Password";
    passwordField.layer.borderColor = [preto CGColor];
    passwordField.layer.borderWidth = 1;
    [self.view addSubview:passwordField];
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    botao.frame = bindy(passwordField, 20);
    [botao setTitle:@"Log in" forState:UIControlStateNormal];
    [botao addTarget:self action:@selector(callLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:botao];
}

#pragma mark -
#pragma mark Button Calls
- (void) callLogin {
    SPAppDelegate *appDelegate = (SPAppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate changeViewControllerTo:SPChangeViewControllerToMain];
}

#pragma mark -
#pragma mark View Handle Stuff
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
