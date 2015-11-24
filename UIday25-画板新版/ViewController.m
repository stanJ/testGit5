//
//  ViewController.m
//  UIday25-画板新版
//
//  Created by apple on 15/9/12.
//  Copyright (c) 2015年 sit. All rights reserved.
//
#define drawLine 0
#define drawRectangle 1
#import "ViewController.h"
#import "TouchView.h"

@interface ViewController ()
//touchView
@property (strong, nonatomic) IBOutlet TouchView *touchView;
//调色板颜色展示用的label
@property (strong, nonatomic) IBOutlet UILabel *color;
//改变RGB中的R值
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
//改变G值
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
//改变B值
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
//改变alpha值
@property (strong, nonatomic) IBOutlet UISlider *alphaSlider;

//用来显示与修改RGB中的R值的textField
@property (strong, nonatomic) IBOutlet UITextField *redValue2;
//用来显示与修改RGB中的G值的textField
@property (strong, nonatomic) IBOutlet UITextField *greenValue2;
//用来显示与修改RGB中的B值的textField
@property (strong, nonatomic) IBOutlet UITextField *blueValue2;
//用来显示与修改alpha的textField
@property (strong, nonatomic) IBOutlet UITextField *alphaValue2;
//用来改变线宽
@property (strong, nonatomic) IBOutlet UISlider *lineWidth;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //分别设置4个slider的初始值
    self.redSlider.value = 0;
    self.greenSlider.value = 0;
    self.blueSlider.value = 0;
    self.alphaSlider.value = 1;

    //分别设置4个文本框的文本
    self.redValue2.text = [NSString stringWithFormat:@"%.1f",self.redSlider.value*255];

    self.greenValue2.text = [NSString stringWithFormat:@"%.1f",self.greenSlider.value*255];
    self.blueValue2.text = [NSString stringWithFormat:@"%.1f",self.blueSlider.value*255];
    self.alphaValue2.text = [NSString stringWithFormat:@"%.1f",self.alphaSlider.value];
    //设置线宽slider的初始值
    self.lineWidth.value = 0.1;
    //将初始操作设为画线
    self.touchView.option = drawLine;
    //设置展示颜色label的背景色，并将文本设为空
    self.color.text = nil;
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    //设置touchView的颜色
    self.touchView.color = self.color.backgroundColor;
    //设置touchView的线宽
    self.touchView.lineWidth = self.lineWidth.value*20;
    

}
//画线按钮
- (IBAction)Line:(UIButton *)sender {
    self.touchView.option = drawLine;
    self.touchView.color = self.color.backgroundColor;
}
//画矩形按钮
- (IBAction)drawRect:(UIButton *)sender {
    self.touchView.option = drawRectangle;
    self.touchView.color = self.color.backgroundColor;
}
//橡皮按钮
- (IBAction)eraser:(UIButton *)sender {
    self.touchView.option = drawLine;
    self.touchView.color = self.touchView.backgroundColor;
}
//改变redSlider的值
- (IBAction)changeRedValue:(UISlider *)sender {
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
    self.redValue2.text = [NSString stringWithFormat:@"%.1f",self.redSlider.value*255];
}
//改变greenSlider的值
- (IBAction)changeGreenValue:(UISlider *)sender {
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
    self.greenValue2.text = [NSString stringWithFormat:@"%.1f",self.greenSlider.value*255];
}
//改变blueSlider的值
- (IBAction)changeBlueValue:(UISlider *)sender {
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
    self.blueValue2.text = [NSString stringWithFormat:@"%.1f",self.blueSlider.value*255];
}
//改变alphaSlider的值
- (IBAction)changeAlphaValue:(UISlider *)sender {
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
    self.alphaValue2.text = [NSString stringWithFormat:@"%.1f",self.alphaSlider.value];
}
//设置redSlider的值
- (IBAction)setRedValue1:(UITextField *)sender {

    self.redSlider.value = [sender.text floatValue]/255;
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
//    NSLog(@"-----redValue");
}
//设置greenSlider的值
- (IBAction)setGreenValue:(UITextField *)sender {
    self.greenSlider.value = [sender.text floatValue]/255;
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
//    NSLog(@"-----greenValue");
}
//设置blueSlider的值
- (IBAction)setBlueValue:(UITextField *)sender {
    self.blueSlider.value = [sender.text floatValue]/255;
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
//    NSLog(@"-----blueValue");
}
//设置alphaSlider的值
- (IBAction)setAlphaValue:(UITextField *)sender {
    self.alphaSlider.value = [sender.text floatValue];
    self.color.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value];
    self.touchView.color = self.color.backgroundColor;
//    NSLog(@"-----alphaValue");
}
//改变线宽
- (IBAction)changeLineWidth:(UISlider *)sender {
    self.touchView.lineWidth = self.lineWidth.value*20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
