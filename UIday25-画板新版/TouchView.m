//
//  TouchView.m
//  UIday24-1
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 sit. All rights reserved.
//
#define drawLine 0
#define drawRectangle 1
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#import "TouchView.h"
@interface TouchView ()
//@property (nonatomic,strong) NSMutableArray * paths;
//矩形起始点
@property (nonatomic,assign) CGPoint rectStartPoint;
//矩形终点
@property (nonatomic,assign) CGPoint rectEndPoint;
//存储路径及其颜色的字典，一个字典存一条路径
@property (nonatomic,strong) NSMutableDictionary * pathsDictionary;
//所有路径的数组
@property (nonatomic,strong) NSMutableArray * paths;
@end
@implementation TouchView
//paths数组的懒加载
-(NSMutableArray*)paths{
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //将唯一触点对象从set中抽出
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    //创建路径
    if (self.option == drawLine) {//画线
        UIBezierPath * path = [UIBezierPath bezierPath];
        path.lineWidth = self.lineWidth;
        [path moveToPoint:location];
        NSMutableDictionary * pathDictionary = [NSMutableDictionary dictionary];
        [pathDictionary setObject:self.color forKey:path];
        [self.paths addObject:pathDictionary];
    }else {//画矩形
        self.rectStartPoint = location;
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    if (self.option == drawLine) {//画线
        NSMutableDictionary * pathDict = [self.paths lastObject];
        NSArray * tempArray = [pathDict allKeys];
//        UIBezierPath * currentPath = [tempArray objectAtIndex:(tempArray.count-1)];
        //由于每个字典中只有一条路径，所以上下两句代码等价
        UIBezierPath * currentPath = [tempArray objectAtIndex:(0)];
        [currentPath addLineToPoint:location];
        [self setNeedsDisplay];
    }else {//画矩形
        self.rectEndPoint = location;
        [self setNeedsDisplay];
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.option == drawLine) {
        //画线
    }else {//画矩形
        UITouch * touch = [touches anyObject];
        CGPoint location = [touch locationInView:self];
        self.rectEndPoint = location;
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(self.rectStartPoint.x, self.rectStartPoint.y, self.rectEndPoint.x-self.rectStartPoint.x, self.rectEndPoint.y-self.rectStartPoint.y)];
        path.lineWidth = self.lineWidth;
        NSMutableDictionary * pathDictionary = [NSMutableDictionary dictionary];
        [pathDictionary setObject:self.color forKey:path];
        [self.paths addObject:pathDictionary];
        [self setNeedsDisplay];
    }
    
}

-(void)drawRect:(CGRect)rect{
    for (NSMutableDictionary * pathDict in self.paths) {
        for (UIBezierPath * path in [pathDict allKeys]) {
            UIColor * color = [pathDict objectForKey:path];
            if (self.option == drawRectangle) {
                UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(self.rectStartPoint.x, self.rectStartPoint.y, self.rectEndPoint.x-self.rectStartPoint.x, self.rectEndPoint.y-self.rectStartPoint.y)];
                [self.color setStroke];
                path.lineWidth = self.lineWidth;
                [path stroke];
                
            }
            [color setStroke];
            [path stroke];
            
        }
    }
    
    
    
}


@end
