//
//  OCViewController.m
//  TestBlock
//
//  Created by Quinn_F on 2017/10/10.
//  Copyright © 2017年 Quinn_F. All rights reserved.
//

#import "OCViewController.h"
typedef int (^defFirstBlock)(int a,int b);
@interface OCViewController ()
@property(nonatomic,assign)defFirstBlock firstBlock;
@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _firstBlock = ^(int a,int b){
        return a+b;
    };
    NSLog(@"file:%s line:%d,%d",__FILE__,__LINE__,_firstBlock(3,5));
    
    int (^secondBlock)(int a, int b) = ^(int a,int b){
        
        return a+b;
    };
    NSLog(@"file:%s line:%d,%d",__FILE__,__LINE__,secondBlock(3,5));
    
    [self doSomething:^int(int a, int b) {
        return  a+b;
    }];
    [self doSomething2:^int(int a, int b) {
        return  a+b;
    }];
}
-(void)doSomething:(defFirstBlock) funcFristBlock{
    NSLog(@"file:%s line:%d,%d",__FILE__,__LINE__,funcFristBlock(3,5));
}
-(void)doSomething2:(int (^)(int a,int b)) funcSecondBlock{
    NSLog(@"file:%s line:%d,%d",__FILE__,__LINE__,funcSecondBlock(3,5));
}
@end
