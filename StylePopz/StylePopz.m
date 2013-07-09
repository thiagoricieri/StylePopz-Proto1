//
//  StylePopz.m
//  StylePopz
//
//  Created by Thiago Ricieri on 02/07/13.
//  Copyright (c) 2013 Thiago Ricieri. All rights reserved.
//

#import "StylePopz.h"

@implementation StylePopz

+ (NSDictionary *) JSONWithRawData: (NSData *) rawData {
    NSError* error;
    NSDictionary *json;
    @try {
        json = [NSJSONSerialization
                JSONObjectWithData:rawData
                options:kNilOptions
                error:&error];
    }
    @catch (NSException *exception) {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@":(" message:exception.reason delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
    }
    return json;
}

@end
