//
//  AAKPreviewController.m
//  AAKeyboardApp
//
//  Created by sonson on 2014/10/30.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import "AAKPreviewController.h"

#import "AAKShared.h"

@interface AAKPreviewController () {
}

@end

@implementation AAKPreviewController

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)close:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"OpenAAKEditNavigationController"]) {
		UINavigationController *nav = (UINavigationController*)segue.destinationViewController;
		AAKEditViewController *vc = (AAKEditViewController*)nav.topViewController;
		vc.art = self.art;
	}
}

- (void)keyboardDataManagerDidUpdateNotification:(NSNotification*)notification {
	
	
	CGFloat fontSize = 15;
	
	NSParagraphStyle *paragraphStyle = [NSParagraphStyle defaultParagraphStyleWithFontSize:fontSize];
	NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont fontWithName:@"Mona" size:fontSize]};
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:_art.text attributes:attributes];
	
	_textView.attributedString = string;
	_textView.userInteractionEnabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	CGFloat fontSize = 15;
	NSParagraphStyle *paragraphStyle = [NSParagraphStyle defaultParagraphStyleWithFontSize:fontSize];
	NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont fontWithName:@"Mona" size:fontSize]};
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:_art.text attributes:attributes];
	
	_textView.attributedString = string;
	_textView.userInteractionEnabled = NO;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDataManagerDidUpdateNotification:) name:AAKKeyboardDataManagerDidUpdateNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
