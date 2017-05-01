//
//  HomeViewController.m
//  wechatBot
//
//  Created by Homosum on 17/3/1.
//  Copyright © 2017年 homosum. All rights reserved.
//

#import "HomeViewController.h"
#import "ImageViewController.h"
@interface HomeViewController ()<NSURLConnectionDataDelegate>
@property(nonatomic,strong)NSString*key;
@property(nonatomic,strong)NSMutableData*receiveData;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.key=@"f2180613aa6f4170a871630dde383d63";
    // Do view setup here.
}
- (IBAction)confirmKey:(id)sender {
//    self.keyTextField.hidden=!self.keyTextField.hidden;
    
//    ImageViewController*imageVC=[[ImageViewController alloc]init];
    NSMutableDictionary*dict=[NSMutableDictionary dictionary];
    NSString*robKey=self.keyTextField.stringValue;
    [dict setObject:robKey forKey:@"key"];
    [dict setObject:@"你妈妈是谁" forKey:@"info"];
    [dict setObject:@"98765" forKey:@"userid"];
    //    [self presentViewControllerAsModalWindow:imageVC];
    NSURL*url=[NSURL URLWithString:URL_BOT];
    NSString*dicStr=[NSString stringWithFormat:@"key=%@&info=你妈妈是谁&userid=973484783",robKey];
    NSData*content=[dicStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest*request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:content];
    NSURLConnection*connection =[[NSURLConnection alloc]initWithRequest:request delegate:self];
    [connection start];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    NSLog(@"%@",[res allHeaderFields]);
    self.receiveData = [NSMutableData data];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *receiveStr = [[NSString alloc]initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",receiveStr);
    self.keyTextField.stringValue=receiveStr;
}
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
}

@end
