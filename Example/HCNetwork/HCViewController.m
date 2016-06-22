//
//  HCViewController.m
//  HCNetworking
//
//  Created by Julien Goudet on 10/20/2015.
//  Copyright (c) 2015 Julien Goudet. All rights reserved.
//

#import "HCViewController.h"

#import "MapsClient.h"

@interface HCViewController ()

@end

@implementation HCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendRequest:(id)sender {
    [self getResultForAddress];
}

#pragma mark - User Interactions -
- (void) getResultForAddress {
    [MapsClient resultsForAddress:@"Paris - FRANCE" WithBlock:^(MapsAddressResponse *response, HCError *error) {
        
        
        
    }];
}

@end
