//
//  DongFramework.h
//  MyFramework
//
//  Created by Lycodes_Dong on 9/8/16.
//  Copyright © 2016 Lycodes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(int,MyItemHeightType) {
    
    MyStatusBarHeightType = 0,
    MyNavigationBarHeightType,
    MyTabBarHeightType,
    MyAllHeightType
    
};

@interface DongFramework : NSObject

NS_ASSUME_NONNULL_BEGIN

+ (void)setConstraintsWithSuperView:(UIView *)superview Format:(NSString *)format Views:(NSDictionary<NSString *, id> *)views;
// views = NSDictionaryOfVariableBindings(...)

+ (void)getJsonWithURL:(NSString *)urlstring Completion:(void(^)(NSArray * __nullable array, NSError * __nullable error))completion;

+ (void)getImageWithURL:(NSString *)urlstring Completion:(void(^)(UIImage * __nullable image, NSError * __nullable error))completion;

+ (CGFloat)getItemHeight:(MyItemHeightType)type ViewController:(UIViewController *)viewcontroller;

+ (UIColor *)customColorWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue Alpha:(CGFloat)alpha;

NS_ASSUME_NONNULL_END

@end
