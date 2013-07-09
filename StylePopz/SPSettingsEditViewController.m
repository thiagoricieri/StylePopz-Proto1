//
//  SPSettingsEditViewController.m
//  StylePopz
//
//  Created by Thiago Ricieri on 02/07/13.
//  Copyright (c) 2013 Thiago Ricieri. All rights reserved.
//

#import "StylePopz.h"
#import "JSONKit.h"
#import "SPSettingsEditViewController.h"

@interface SPSettingsEditViewController ()

@end

@implementation SPSettingsEditViewController

@synthesize option;
@synthesize settingsTable;
@synthesize preferences;

#pragma mark -
#pragma mark Init Variables Stack
- (void) initVariables {
    // Next button
    if(option != SPSettingsOptionSex && option != SPSettingsOptionSaveAndKeep){
        settingsTable = [[UITableView alloc] initWithFrame:frame(0, 0, 320, 416 + IPHONE5_PLUSHEIGHT) style:UITableViewStylePlain];
        settingsTable.delegate = self;
        settingsTable.dataSource = self;
        [self.view addSubview:settingsTable];
        keys = @[@"sex", @"sizes", @"colors", @"prints", @"luxuryBrands", @"hiStreetBrands", @"fastFashionBrands", @"indieDesigners"];
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"preferences" ofType:@"json"];
        NSString *raw = [NSString stringWithContentsOfFile:fullPath encoding:NSUTF8StringEncoding error:nil];
        preferences = [raw objectFromJSONString];
    }
    if(option != SPSettingsOptionSaveAndKeep){
        UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(goToNext)];
        self.navigationItem.rightBarButtonItem = nextButton;
    }
    // Dinamically create
    if(option == SPSettingsOptionSex){
        self.title = @"Sex";
    }
    else if(option == SPSettingsOptionSizes){
        self.title = @"Sizes";
        
    }
    else if(option == SPSettingsOptionColor){
        self.title = @"Colors";
        
    }
    else if(option == SPSettingsOptionPrints){
        self.title = @"Prints";
        
    }
    else if(option == SPSettingsOptionBrandLuxury){
        self.title = @"Luxury Brands";
        
    }
    else if(option == SPSettingsOptionBrandStreet){
        self.title = @"Street Brands";
        
    }
    else if(option == SPSettingsOptionBrandFastFashion){
        self.title = @"Fast Fashion Brands";
        
    }
    else if(option == SPSettingsOptionIndieDesigners){
        self.title = @"Indie Designers";
        
    }
    else if(option == SPSettingsOptionSaveAndKeep) {
        self.title = @"Save";
        
    }
}

#pragma mark -
#pragma mark Visual Stuff Design
- (void) buildLayout {
    if(option == SPSettingsOptionSex){
        [self buildUIforSex];
    }
    else if(option == SPSettingsOptionSizes){
        [self buildUIforSizes];
    }
    else if(option == SPSettingsOptionColor){
        [self buildUIforColor];
    }
    else if(option == SPSettingsOptionPrints){
        [self buildUIforPrints];
    }
    else if(option == SPSettingsOptionBrandLuxury){
        [self buildUIforBrandLuxury];
    }
    else if(option == SPSettingsOptionBrandStreet){
        [self buildUIforBrandStreet];
    }
    else if(option == SPSettingsOptionBrandFastFashion){
        [self buildUIforBrandFastFashion];
    }
    else if(option == SPSettingsOptionIndieDesigners){
        [self buildUIforIndieDesigners];
    }
    else if(option == SPSettingsOptionSaveAndKeep) {
        [self buildUIforSaveAndKeep];
    }
}

#pragma mark -
#pragma mark Visual layouting options
- (void) buildUIforSex {
    male = [UIButton buttonWithType:UIButtonTypeCustom];
    male.alpha = 0.5;
    [male setImage:[UIImage imageNamed:@"male.png"] forState:UIControlStateNormal];
    [male setFrame:frame(10, 10, 140, 350)];
    [male addTarget:self action:@selector(sexMalePressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:male];
    female = [UIButton buttonWithType:UIButtonTypeCustom];
    female.alpha = 0.5;
    [female setImage:[UIImage imageNamed:@"female.png"] forState:UIControlStateNormal];
    [female addTarget:self action:@selector(sexFemalePressed) forControlEvents:UIControlEventTouchUpInside];
    [female setFrame:frame(150, 10, 140, 350)];
    [self.view addSubview:female];
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
#pragma mark UITable View
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    NSString *cellIdentifier = @"StylePopzSettingCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [self configureCell: cell forIndexPath:indexPath];
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[keys objectAtIndex:option] isEqualToString:@"sizes"] ? 6 : [[preferences valueForKey:[keys objectAtIndex:option]] count];
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    cell.accessoryType = cell.accessoryType == UITableViewCellAccessoryNone ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}
- (void) configureCell: (UITableViewCell *) cell forIndexPath: (NSIndexPath *) indexPath {
    if(option == SPSettingsOptionSizes){
        NSArray *akeys = @[@"shirts", @"pants", @"shoes"];
        int k = indexPath.row < 2 ? 0 : indexPath.row < 4 ? 1 : 2;
        NSArray *clothe = [[preferences valueForKey:[keys objectAtIndex:option]] valueForKey:[akeys objectAtIndex:k]];
        NSDictionary *thing = [clothe objectAtIndex:indexPath.row%2];
        cell.imageView.image = [UIImage imageNamed:[thing valueForKey:@"url"]];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [akeys objectAtIndex:k], [thing valueForKey:[akeys objectAtIndex:k]]];
        cell.accessoryType = [[thing valueForKey:@"selected"] isEqualToString:@"Y"] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
    else {
        NSArray *akeys = @[@"sex", @"sizes", @"color", @"print", @"luxbrand", @"hibrand", @"fastfash", @"indie"];
        NSDictionary *thing = [[preferences valueForKey:[keys objectAtIndex:option]] objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[thing valueForKey:@"url"]];
        cell.textLabel.text = [thing valueForKey:[akeys objectAtIndex:option]];
        cell.accessoryType = [[thing valueForKey:@"selected"] isEqualToString:@"Y"] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
}

#pragma mark -
#pragma mark Button Calls
- (void) goToNext {
    SPSettingsEditViewController *newView = [[SPSettingsEditViewController alloc] initWithOption:option+1];
    [self.navigationController pushViewController:newView animated:YES];
}
- (void) sexMalePressed {
    female.alpha = 0.5;
    male.alpha = 1;
}
- (void) sexFemalePressed {
    male.alpha = 0.5;
    female.alpha = 1;
}

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
