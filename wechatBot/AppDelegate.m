//
//  AppDelegate.m
//  wechatBot
//
//  Created by Homosum on 17/3/1.
//  Copyright © 2017年 homosum. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property(nonatomic,strong)IBOutlet HomeViewController*homeVC;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.homeVC=[[HomeViewController alloc]init];
//    [self.window.contentView addSubview:self.homeVC.view];
//    self.homeVC.view.frame=self.window.contentView.bounds;
    self.window.contentViewController=self.homeVC;
    
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
