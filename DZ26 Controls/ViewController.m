//
//  ViewController.m
//  DZ26 Controls
//
//  Created by Vasilii on 01.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) changeImage {
    
    if (self.imageControl.selectedSegmentIndex == 0) {
        self.imageView.image = [UIImage imageNamed:@"barren-charred.png"];
    }else if (self.imageControl.selectedSegmentIndex == 1) {
        self.imageView.image = [UIImage imageNamed:@"Stars_01_256x256_025.png"];
    }else if (self.imageControl.selectedSegmentIndex == 2) {
        self.imageView.image = [UIImage imageNamed:@"kick1-upgraded.png"];
    }
}
//включаем поворот картинки
- (IBAction)rotationControl:(UISwitch *)sender {
    if (sender.isOn) {
    [UIView animateWithDuration:self.changeSpeedSlider.value
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
                     } completion:^(BOOL finished) {
                         [self rotationControl:sender];
                     }];
    }
}

- (IBAction)scaleControl:(UISwitch *)sender {
     if (sender.isOn) {
    [UIView animateWithDuration:self.changeSpeedSlider.value
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         double value = (double)arc4random() / 868435456;//чудесный делитель!!
                         self.imageView.transform = CGAffineTransformMakeScale(value, value);
                     } completion:^(BOOL finished) {
                         [self scaleControl:sender];
                     }];
     }
}

- (IBAction)translationControl:(UISwitch *)sender {
    if (sender.isOn) {
        [UIView animateWithDuration:self.changeSpeedSlider.value
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             CGFloat randX = (arc4random() % (int)CGRectGetMaxX(self.backView.bounds) -self.imageView.frame.size.width) + self.imageView.frame.size.width;
                             CGFloat randY = (arc4random() % (int)CGRectGetMaxY(self.backView.bounds) - self.imageView.frame.size.height) + self.imageView.frame.size.height;
                             
                             self.imageView.center = CGPointMake(randX, randY);
                             
                         } completion:^(BOOL finished) {
                             [self translationControl:sender];
                         }];
    }
}
- (IBAction)speedSlider:(UISlider *)sender {
}

- (IBAction)selectAnotherControl:(UISegmentedControl *)sender {
    [self changeImage];
}
@end
