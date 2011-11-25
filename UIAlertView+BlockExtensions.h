//
//  UIAlertView+BlockExtensions.h
//  ShootStudio
//
//  Created by Tom Fewster on 07/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//



@interface UIAlertView (BlockExtensions) <UIAlertViewDelegate>

- (id)initWithTitle:(NSString *)title message:(NSString *)message completionBlock:(void (^)(NSUInteger buttonIndex))block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
