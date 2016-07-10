//
//  SecondViewController.m
//  PassDataWithUnwindSegue
//
//  Created by Michael Hoffman on 7/9/16.
//  Copyright © 2016 Strong Atomic. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stringLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property NSArray *fruits;
@property NSInteger randomFruit;

- (IBAction)randomTapped:(id)sender;
- (IBAction)backTapped:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fruits = @[@"apple", @"orange", @"pineapple", @"melon", @"cantalope", @"mango", @"pear", @"peach", @"strawberry", @"nectarine"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)labelArray
{
    NSArray *labels = @[self.stringLabel, self.numberLabel];
    return labels;
}

-(void)labelFormat
{
    for (UILabel *label in [self labelArray])
    {
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.layer.borderWidth = 2.0;
    }
}

- (IBAction)randomTapped:(id)sender
{
    self.randomNumber = arc4random_uniform(300);
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)self.randomNumber];
    
    self.randomFruit = arc4random_uniform(9);
    self.fruit = [self.fruits objectAtIndex:self.randomFruit];
    self.stringLabel.text = self.fruit;
}

- (IBAction)backTapped:(id)sender
{
    [self performSegueWithIdentifier:@"unwindVC2Segue" sender:self];
}












@end
