#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "EGOPhotoViewController.h"
#import "EGOPhotoGlobal.h"
#import "EGOPhotoSource.h"
#import "EGOQuickPhoto.h"
#import "EGOQuickPhotoSource.h"
#import "EGOPhotoCaptionView.h"
#import "EGOPhotoImageView.h"
#import "EGOPhotoScrollView.h"

FOUNDATION_EXPORT double EGOPhotoViewerVersionNumber;
FOUNDATION_EXPORT const unsigned char EGOPhotoViewerVersionString[];

