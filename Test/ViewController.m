//
//  ViewController.m
//  Test
//
//  Created by tonyliu on 15/12/6.
//  Copyright © 2015年 shuaiyang. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetRepresentation.h>
#import "EncodeUtil.h"
@interface ViewController ()

#define ORIGINAL_MAX_WIDTH 640

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftCos.constant=100;
//    UIImage * image= [ViewController compressSmallImage:[UIImage imageNamed:@"2"]];
//    UIImage * image=[ViewController reduceImage:[UIImage imageNamed:@"2"] percent:0.5];
//    UIImage * image=[self imageByScalingToMaxSize:[UIImage imageNamed:@"1"]];
//    NSData * data= [self compressImage:[UIImage imageNamed:@"1"] PixelCompress:YES MaxPixel:640 JPEGCompress:YES MaxSize_KB:1024];
//    [self writeImageToShahe:data];
//    [ViewController writeDocumnetImage:image];
    

    //提交第一版
    //提交第二版
    //提交第三版
    //提交第四版
    //分支二
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    int a;
#pragma clang diagnostic pop
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 2秒后执行这里的代码...
//    });
    
    
}
//压缩到特定图片
+(UIImage*)compressSmallImage:(UIImage*)originImage{
    NSData * sendImageData = UIImageJPEGRepresentation(originImage, 1.0);
    NSUInteger sizeOrigin = [sendImageData length];
    NSUInteger sizeOriginKB = sizeOrigin / 1024;
    
    if (sizeOriginKB > 500) {
        float a = 500;
        float b = (float)sizeOriginKB;
        float q = sqrtf(a / b);
        
        CGSize sizeImage = [originImage size];
        NSInteger widthSmall =(NSInteger) sizeImage.width * q;
        NSInteger heighSmall = (NSInteger)sizeImage.height * q;
        CGSize sizeImageSmall = CGSizeMake(widthSmall, heighSmall);
        
        UIGraphicsBeginImageContext(sizeImageSmall);
        CGRect smallImageRect = CGRectMake(0, 0, sizeImageSmall.width, sizeImageSmall.height);
        [originImage drawInRect:smallImageRect];
        UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return smallImage;
    }
    return originImage;
    
}
+(UIImage *)reduceImage:(UIImage *)image percent:(float)percent
{
    NSData *imageData = UIImageJPEGRepresentation(image, percent);
    UIImage *newImage = [UIImage imageWithData:imageData];
    return newImage;
}
+(NSString*)writeDocumnetImage:(UIImage*)image{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    NSDateFormatter *dateformat=[[NSDateFormatter  alloc]init];
    [dateformat setDateFormat:@"yyyyMMddHHmmss"];
    NSString * fileName= [dateformat stringFromDate:[NSDate date]];
    NSString *imagePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",fileName]];
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    NSLog(@"imagPath---%@",imagePath);
    return imagePath;
}


//- (NSData*) compressImage:(UIImage*)originImage PixelCompress:(BOOL)pc MaxPixel:(CGFloat)maxPixel JPEGCompress:(BOOL)jc MaxSize_KB: (CGFloat)maxKB
//{
//    /*
//     压缩策略： 支持最多921600个像素点
//     像素压缩：（调整像素点个数）
//     当图片长宽比小于3:1 or 1:3时，图片长和宽最多为maxPixel像素；
//     当图片长宽比在3:1 和 1:3之间时，会保证图片像素压缩到921600像素以内；
//     JPEG压缩：（调整每个像素点的存储体积）
//     默认压缩比0.99;
//     如果压缩后的数据仍大于IMAGE_MAX_BYTES，那么将调整压缩比将图片压缩至IMAGE_MAX_BYTES以下。
//     策略调整：
//     不进行像素压缩，或者增大maxPixel，像素损失越小。
//     使用无损压缩，或者增大IMAGE_MAX_BYTES.
//     注意：
//     jepg压缩比为0.99时，图像体积就能压缩到原来的0.40倍了。
//     */
//    UIImage * scopedImage = nil;
//    NSData * data = nil;
//    //CGFloat maxbytes = maxKB * 1024;
//    
//    if (originImage == nil) {
//        return nil;
//    }
//    
//    if ( pc == YES ) {    //像素压缩
//        // 像素数最多为maxPixel*maxPixel个
//        CGFloat photoRatio = originImage.size.height / originImage.size.width;
//        if ( photoRatio < 0.3333f )
//        {                           //解决宽长图的问题
//            CGFloat FinalWidth = sqrt ( maxPixel*maxPixel/photoRatio );
//            scopedImage = [EncodeUtil convertImage:originImage scope:MAX(FinalWidth, maxPixel)];
//        }
//        else if ( photoRatio <= 3.0f )
//        {                           //解决高长图问题
//            scopedImage = [EncodeUtil convertImage:originImage scope: maxPixel];
//        }
//        else
//        {                           //一般图片
//            CGFloat FinalHeight = sqrt ( maxPixel*maxPixel*photoRatio );
//            scopedImage = [EncodeUtil convertImage:originImage scope:MAX(FinalHeight, maxPixel)];
//        }
//    }
//    else {          //不进行像素压缩
//        scopedImage = originImage;
//    }
//    
//    if ( jc == YES ) {     //JPEG压缩
//        data = UIImageJPEGRepresentation(scopedImage, 0.8);
//        //        NSLog(@"data compress with ratio (0.9) : %d KB", data.length/1024);
//    }
//    else {
//        data = UIImageJPEGRepresentation(scopedImage, 1.0);
//        //        NSLog(@"data compress : %d KB", data.length/1024);
//    }
//    
//    return data;
//}
-(void)writeImageToShahe:(NSData*)data{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    NSFileManager *nfm = [NSFileManager defaultManager];
    
   NSString * jpegScopedPhotoName = [NSString stringWithFormat:@"%@.jpg", date];
   NSString * jpegScopedPhotoPath = [NSString stringWithFormat:@"%@/%@", [self getBasePath], jpegScopedPhotoName];
    NSLog(@"path---%@",jpegScopedPhotoPath);
    [nfm createFileAtPath:jpegScopedPhotoPath contents:data attributes:nil];
//    [self setViewPhoto: jpegScopedPhotoPath];


}
- (NSString *)getBasePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

//#pragma mark image scale utility
//- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
//    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
//    CGFloat btWidth = 0.0f;
//    CGFloat btHeight = 0.0f;
//    if (sourceImage.size.width > sourceImage.size.height) {
//        btHeight = ORIGINAL_MAX_WIDTH;
//        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
//    } else {
//        btWidth = ORIGINAL_MAX_WIDTH;
//        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
//    }
//    CGSize targetSize = CGSizeMake(btWidth, btHeight);
//    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
//}
//
//- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
//    UIImage *newImage = nil;
//    CGSize imageSize = sourceImage.size;
//    CGFloat width = imageSize.width;
//    CGFloat height = imageSize.height;
//    CGFloat targetWidth = targetSize.width;
//    CGFloat targetHeight = targetSize.height;
//    CGFloat scaleFactor = 0.0;
//    CGFloat scaledWidth = targetWidth;
//    CGFloat scaledHeight = targetHeight;
//    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
//    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
//    {
//        CGFloat widthFactor = targetWidth / width;
//        CGFloat heightFactor = targetHeight / height;
//        
//        if (widthFactor > heightFactor)
//            scaleFactor = widthFactor; // scale to fit height
//        else
//            scaleFactor = heightFactor; // scale to fit width
//        scaledWidth  = width * scaleFactor;
//        scaledHeight = height * scaleFactor;
//        
//        // center the image
//        if (widthFactor > heightFactor)
//        {
//            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
//        }
//        else
//            if (widthFactor < heightFactor)
//            {
//                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
//            }
//    }
//    UIGraphicsBeginImageContext(targetSize); // this will crop
//    CGRect thumbnailRect = CGRectZero;
//    thumbnailRect.origin = thumbnailPoint;
//    thumbnailRect.size.width  = scaledWidth;
//    thumbnailRect.size.height = scaledHeight;
//    
//    [sourceImage drawInRect:thumbnailRect];
//    
//    newImage = UIGraphicsGetImageFromCurrentImageContext();
//    if(newImage == nil) NSLog(@"could not scale image");
//    
//    //pop the context to get back to the default
//    UIGraphicsEndImageContext();
//    return newImage;
//}
@end
