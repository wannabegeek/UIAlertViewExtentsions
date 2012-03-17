//
//  UIAlertView+BlockExtensions.m
//
//  Created by Tom Fewster on 07/10/2011.
//

#import "UIAlertView+BlockExtensions.h"
#import <objc/runtime.h>

@implementation UIAlertView (BlockExtensions)

- (id)initWithTitle:(NSString *)title message:(NSString *)message completionBlock:(void (^)(NSUInteger buttonIndex, UIAlertView *alertView))block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
	objc_setAssociatedObject(self, "blockCallback", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	
	if (self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil]) {
		
		if (cancelButtonTitle) {
			[self addButtonWithTitle:cancelButtonTitle];
			self.cancelButtonIndex = [self numberOfButtons] - 1;
		}
		
		id eachObject;
		va_list argumentList;
		if (otherButtonTitles) {
			[self addButtonWithTitle:otherButtonTitles];
			va_start(argumentList, otherButtonTitles);
			while ((eachObject = va_arg(argumentList, id))) {
				[self addButtonWithTitle:eachObject];
			}
			va_end(argumentList);
		}
	}	
	return self;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	void (^block)(NSUInteger buttonIndex, UIAlertView *alertView) = objc_getAssociatedObject(self, "blockCallback");
	block(buttonIndex, self);
}

@end
