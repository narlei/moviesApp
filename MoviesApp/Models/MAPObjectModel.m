//
//  MAPObjectModel.m
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//


#import "MAPObjectModel.h"

@implementation MAPObjectModel

#pragma mark - GET


+ (void)callGetWithUrl:(NSString *)pUrl parameters:(NSDictionary *)pParameters onComplete:(void (^)(UNIJsonNode *values))onComplete{

    MAPObjectModel *objectModel = [MAPObjectModel new];
    [objectModel callGetWithUrl:pUrl parameters:pParameters onComplete:onComplete];
}


- (void)callGetWithUrl:(NSString *)pUrl parameters:(NSDictionary *)pParameters onComplete:(void (^)(UNIJsonNode *values))onComplete {
    self.asyncConnectionGet = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:pUrl];
        [request setHeaders:self.headers];
        [request setParameters:pParameters];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@", [NSString stringWithFormat:@"Erro Request [URL: %@] [PARAMETERS: %@] [ERROR: %@]", pUrl, pParameters, [error localizedDescription]]);
        }
        UNIJsonNode *body = response.body;
        onComplete(body);
    }];
}

- (void)cancelGet {
    [self.asyncConnectionGet cancel];
}

-(NSString *)searchTerm{
    return @"";
}

@end
