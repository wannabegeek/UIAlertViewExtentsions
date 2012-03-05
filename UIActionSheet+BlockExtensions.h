//
//  UIActionSheet+BlockExtensions.h
//
//  Created by Tom Fewster on 25/10/2011.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (BlockExtensions) <UIActionSheetDelegate>

- (id)initWithTitle:(NSString *)title completionBlock:(void (^)(NSUInteger buttonIndex, UIActionSheet *actionSheet))block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
