//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher

-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key {
    
    NSString *encodedMessage = @"";
    NSInteger moduloKey = key % 26;
    
    for (NSUInteger i = 0; i < message.length; i++) {
        unichar charToEncodeASCIICode = [message characterAtIndex:i];
        if (NSLocationInRange(charToEncodeASCIICode, NSMakeRange(97, 26))) {
            charToEncodeASCIICode += moduloKey;
            charToEncodeASCIICode = charToEncodeASCIICode > 97 + 26 ? charToEncodeASCIICode -= 26 : charToEncodeASCIICode;
        } else if (NSLocationInRange(charToEncodeASCIICode, NSMakeRange(65, 26))) {
            charToEncodeASCIICode += moduloKey;
            charToEncodeASCIICode = charToEncodeASCIICode > 65 + 26 ? charToEncodeASCIICode -=26 : charToEncodeASCIICode;
        }
        NSString *encodedCharString = [NSString stringWithFormat:@"%C", charToEncodeASCIICode];
        encodedMessage = [encodedMessage stringByAppendingFormat:@"%@", encodedCharString];
    }
    
    return encodedMessage;
}

-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key {
    
    NSString *decodedMessage = @"";
    NSInteger moduloKey = key % 26;
    
    for (NSUInteger i = 0; i < encodedMessage.length; i++) {
        unichar charToEncodeASCIICode = [encodedMessage characterAtIndex:i];
        if (NSLocationInRange(charToEncodeASCIICode, NSMakeRange(97, 26))) {
            charToEncodeASCIICode -= moduloKey;
            charToEncodeASCIICode = charToEncodeASCIICode < 97 ? charToEncodeASCIICode += 26 : charToEncodeASCIICode;
        } else if (NSLocationInRange(charToEncodeASCIICode, NSMakeRange(65, 26))) {
            charToEncodeASCIICode -= moduloKey;
            charToEncodeASCIICode = charToEncodeASCIICode < 65 ? charToEncodeASCIICode +=26 : charToEncodeASCIICode;
        }
        NSString *encodedCharString = [NSString stringWithFormat:@"%C", charToEncodeASCIICode];
        decodedMessage = [decodedMessage stringByAppendingFormat:@"%@", encodedCharString];
    }
    
    return decodedMessage;
}



@end
