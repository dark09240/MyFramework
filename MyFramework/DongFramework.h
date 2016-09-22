#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(int,MyItemHeightType) {
    MyStatusBarHeightType = 0,
    MyNavigationBarHeightType,
    MyTabBarHeightType,
    MyAllHeightType
};

@interface DongFramework : NSObject

#pragma mark - Get Item Height
+ (CGFloat)getItemHeight:(MyItemHeightType)type ViewController:(UIViewController *)viewcontroller;

@end

@interface UIView(SetConstraints)

#pragma mark - Set Layout Constraint
- (void)setConstraintsWithFormat:(NSString *)format Views:(NSDictionary<NSString *,id> *)views;

@end

@interface NSURL(GetJsonOrImage)

#pragma mark - Get Json Or Image
- (void)urlGetJsonCompletion:(void(^)(NSArray * __nullable array, NSError * __nullable error))completion;
- (void)urlGetImageCompletion:(void(^)(UIImage * __nullable image, NSError * __nullable error))completion;

@end

NS_ASSUME_NONNULL_END
