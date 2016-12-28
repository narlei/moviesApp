//
//  Global.m
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import "Global.h"

@implementation Global

+ (instancetype)sharedGlobal {
    static Global *_sharedGlobal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedGlobal = [Global new];
    });
    
    return _sharedGlobal;
}


+ (NSString *)getWordNum:(NSString *)texto indice:(int)indice delimitador:(NSString *)delimitador {
    if (!texto) {
        return @"";
    }
    texto = [delimitador stringByAppendingString:texto];
    texto = [texto stringByAppendingString:delimitador];
    NSArray *substrings = [texto componentsSeparatedByString:delimitador];
    
    if (substrings.count < indice) {
        return @"";
    }
    
    NSString *first = [substrings objectAtIndex:indice];
    return first;
}
+ (int)getWordCount:(NSString *)texto delimitador:(NSString *)delimitador {
    NSArray *substrings = [texto componentsSeparatedByString:delimitador];
    NSString *tamanhoStr = [NSString stringWithFormat:@"%lu", (unsigned long)substrings.count];
    int qtdWord;
    qtdWord = [tamanhoStr intValue];
    return qtdWord;
}


#pragma mark - Filter Helpers

+ (NSPredicate *)predicateWithSearch:(NSString *)pSearch {
    
    pSearch = [pSearch stringByReplacingOccurrencesOfString:@"`" withString:@""];
    pSearch = [pSearch stringByReplacingOccurrencesOfString:@"'" withString:@""];
    pSearch = [pSearch stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    NSString *compareOr = @" OU";
    NSString *searchTerm = @"searchTerm";
    
    NSPredicate *predicate;
    
    NSString *stringWhere = @"(1 == 2)";
    int countOr = [Global getWordCount:pSearch delimitador:compareOr];
    for (int counterA = 1; counterA <= countOr; counterA++) {
        NSString *partSearch = [Global getWordNum:pSearch indice:counterA delimitador:compareOr];
        if (![partSearch stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
            
            int countSpaces = [Global getWordCount:partSearch delimitador:@" "];
            
            NSString *stringWhereSpaces = @"";
            
            for (int counterB = 1; counterB <= countSpaces; counterB++) {
                NSString *partSearchSpaces = [Global getWordNum:partSearch indice:counterB delimitador:@" "];
                if (![partSearchSpaces stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
                    partSearchSpaces = [NSString stringWithFormat:@"*%@*", partSearchSpaces];
                    stringWhereSpaces = [NSString stringWithFormat:@"%@ %@ %@ like[cd] '%@' ", stringWhereSpaces, (stringWhereSpaces.length == 0 ? @"" : @" AND "), searchTerm, partSearchSpaces];
                }
            }
            
            stringWhere = [NSString stringWithFormat:@" %@ OR (%@)", stringWhere, stringWhereSpaces];
        }
    }
    predicate = [NSPredicate predicateWithFormat:stringWhere];
    return predicate;
}


@end
