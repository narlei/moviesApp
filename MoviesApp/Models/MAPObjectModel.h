//
//  MAPObjectModel.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unirest.h"

@interface MAPObjectModel : NSObject


#pragma mark - Default Properties
// Used By Search in ViewControllers
@property (strong, nonatomic) NSString *searchTerm;

#pragma mark - Request Methods

// Header to send in Rest
@property (nonatomic, strong) NSDictionary *headers;
// Connection Object (Unirest)
@property (nonatomic, strong) UNIUrlConnection *asyncConnectionGet;

// Method called to request GET
+ (void)callGetWithUrl:(NSString *)pUrl parameters:(NSDictionary *)pParameters onComplete:(void (^)(UNIJsonNode *values))onComplete;
@end
