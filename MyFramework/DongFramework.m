//
//  DongFramework.m
//  MyFramework
//
//  Created by Lycodes_Dong on 9/8/16.
//  Copyright © 2016 Lycodes. All rights reserved.
//

#import "DongFramework.h"

@implementation DongFramework

#pragma mark - Set Layout Constraint

+ (void)setConstraintsWithSuperView:(UIView *)superview Format:(NSString *)format Views:(NSDictionary<NSString *, id> *)views {
    NSMutableArray *myConstraints = [NSMutableArray array];
    [myConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    [superview addConstraints:myConstraints];
}

#pragma mark - Get Json

+ (void)getJsonWithURL:(NSString *)urlstring Completion:(void(^)(NSArray * __nullable array, NSError * __nullable error))completion {
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSArray *jsonarray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            completion(jsonarray,nil);
        }else {
            completion(nil,error);
        }
    }];
    [dataTask resume];
}

#pragma mark - Get Image

+ (void)getImageWithURL:(NSString *)urlstring Completion:(void(^)(UIImage * __nullable image, NSError * __nullable error))completion {
    NSURL *url = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSData *data = [NSData dataWithContentsOfURL:location];
            UIImage *image = [UIImage imageWithData:data];
            completion(image,nil);
        }else {
            completion(nil,error);
        }
    }];
    [downloadTask resume];
}

#pragma mark - Get Item Height

+ (CGFloat)getItemHeight:(MyItemHeightType)type ViewController:(UIViewController *)viewcontroller {
    switch (type) {
        case MyStatusBarHeightType:
            return [UIApplication sharedApplication].statusBarFrame.size.height;
            break;
        case MyNavigationBarHeightType:
            return viewcontroller.navigationController.navigationBar.bounds.size.height;
            break;
        case MyTabBarHeightType:
            return viewcontroller.tabBarController.tabBar.bounds.size.height;
            break;
        case MyAllHeightType:
            return [UIApplication sharedApplication].statusBarFrame.size.height + viewcontroller.navigationController.navigationBar.bounds.size.height + viewcontroller.tabBarController.tabBar.bounds.size.height;
            break;
        default:
            break;
    }
}

#pragma mark - Custom RGB Color

+ (UIColor *)customColorWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue Alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

@end
