#import "DongFramework.h"

@implementation DongFramework

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

@end

@implementation UIView(SetConstraints)

- (void)setConstraintsWithFormat:(NSString *)format Views:(NSDictionary<NSString *,id> *)views {
    NSMutableArray *myConstraints = [NSMutableArray array];
    [myConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    [self addConstraints:myConstraints];
}

@end

@implementation NSURL(GetJsonOrImage)

- (void)urlGetJsonCompletion:(void (^)(NSArray * _Nullable, NSError * _Nullable))completion {
    NSURLRequest *request = [NSURLRequest requestWithURL:self];
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

- (void)urlGetImageCompletion:(void (^)(UIImage * _Nullable, NSError * _Nullable))completion {
    NSURLRequest *request = [NSURLRequest requestWithURL:self];
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

@end
