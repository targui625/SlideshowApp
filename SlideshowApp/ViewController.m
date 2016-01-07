//
//  ViewController.m
//  SlideshowApp
//
//  Created by Norimichi Takagi on 2016/01/06.
//  Copyright © 2016年 NorimichiTakagi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    {
        // 背景画像 //
        UIImageView *imageView;
        // カウント用 //
        NSInteger countNumber;
    }

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // カウント初期化 //
    countNumber = 1;
    
    // 画像表示 //
    [self picView];
    // 進むボタン //
    [self goBt];
    // 戻るボタン //
    [self backBt];
    
}
    // 画像表示 //
- (void)picView {
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,500,800)];
    imageView.image = [UIImage imageNamed:@"pic1.png"];
    [self.view addSubview:imageView];
}

    // 進むボタン //
- (void)goBt {
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeSystem];
    // 位置とサイズ //
    goButton.frame = CGRectMake(0,0,100,50);
    goButton.center = CGPointMake(250,520);
    // スタイル //
    [goButton setTitle:@"進む" forState:UIControlStateNormal];
    [goButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    goButton.titleLabel.font = [UIFont fontWithName:@"HiraKakuProN-w6" size:30 ];
    goButton.backgroundColor = [UIColor orangeColor];
    // アクション //
    [goButton addTarget:self action:@selector(buttonTap:)forControlEvents:UIControlEventTouchDown];
    [goButton addTarget:self action:@selector(goButtonAct:)forControlEvents:UIControlEventTouchUpInside];
    // ボタン表示 //
    [self.view addSubview:goButton];

}

    // 進むボタンアクション //
-(void)goButtonAct:(id)sender{
    if(countNumber < 4){
        countNumber++;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic%ld.png",(long)countNumber]];
    }
    else if(countNumber == 4){
        countNumber = 1;
        imageView.image = [UIImage imageNamed:@"pic1.png"];
    }
}

    // 戻るボタン //
- (void)backBt {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    // 位置とサイズ //
    backButton.frame = CGRectMake(0,0,100,50);
    backButton.center = CGPointMake(70,520);
    // スタイル //
    [backButton setTitle:@"戻る" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont fontWithName:@"HiraKakuProN-w6" size:30 ];
    backButton.backgroundColor = [UIColor blueColor];
    // アクション //
    [backButton addTarget:self action:@selector(buttonTap:)forControlEvents:UIControlEventTouchDown];
    [backButton addTarget:self action:@selector(backButtonAct:)forControlEvents:UIControlEventTouchUpInside];
    // ボタン表示 //
    [self.view addSubview:backButton];
    
}

    // 戻るボタンアクション //
-(void)backButtonAct:(id)sender{
    if(countNumber == 1){
        countNumber = 4;
        imageView.image = [UIImage imageNamed:@"pic4.png"];
    }
    else if(countNumber <= 4){
        countNumber--;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic%ld.png",(long)countNumber]];
    }
}

    // タップアクション //
-(void)buttonTap:(id)sender{
    imageView.image = [UIImage imageNamed:@"tap.png"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
