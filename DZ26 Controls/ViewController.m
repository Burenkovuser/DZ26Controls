//
//  ViewController.m
//  DZ26 Controls
//
//  Created by Vasilii on 01.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    [UIView animateWithDuration:self.changeSpeedSlider.value
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
                     } completion:^(BOOL finished) {
                         [self rotationControl:sender];
                     }];
}

- (IBAction)scaleControl:(UISwitch *)sender {
    [UIView animateWithDuration:self.changeSpeedSlider.value
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         double value = (double)arc4random() / 268435456;
                         self.imageView.transform = CGAffineTransformMakeScale(value, value);
                     } completion:^(BOOL finished) {
                         [self scaleControl:sender];
                     }];
}
- (IBAction)speedSlider:(UISlider *)sender {
}

- (IBAction)selectAnotherControl:(UISegmentedControl *)sender {
    [self changeImage];
}
@end
