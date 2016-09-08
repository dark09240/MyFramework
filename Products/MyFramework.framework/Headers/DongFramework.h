//
//  DongFramework.h
//  MyFramework
//
//  Created by Lycodes_Dong on 9/8/16.
//  Copyright © 2016 Lycodes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DongFramework : NSObject

NS_ASSUME_NONNULL_BEGIN

+ (void)getJsonWithURL:(NSString *)urlstring Completion:(void(^)(NSArray * __nullable array, NSError * __nullable error))completion;

+ (void)getImageWithURL:(NSString *)urlstring Completion:(void(^)(UIImage * __nullable image, NSError * __nullable error))completion;

NS_ASSUME_NONNULL_END

@end
