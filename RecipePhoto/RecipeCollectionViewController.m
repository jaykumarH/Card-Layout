//
//  RecipeCollectionViewController.m
//  RecipePhoto
//
//  Created by Simon on 13/1/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RecipeCollectionViewController.h"

@interface RecipeCollectionViewController () {
    NSArray *recipeImages;
    int pageCount;
    UIImageView *leftSlider;
    UIImageView *rightSlider;
    NSTimer *timer;
    UILabel *recipeLabel;
}

@end

@implementation RecipeCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize recipe image array
    self.title=@"Recipe Photo";
    
    recipeImages = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];
    pageCount=0;
    self.collectionViewObj.userInteractionEnabled=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Collection View Data source and delegates
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return recipeImages.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    
    return cell;
}

#pragma mark -Scroll view delegates
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (leftSlider.hidden==YES && rightSlider.hidden==YES) {
        
        [UIView animateWithDuration:1.0 animations:^{
            leftSlider.hidden=NO;
            rightSlider.hidden=NO;
            leftSlider.alpha=1.0;
            rightSlider.alpha=1.0;
        } completion:nil];
    }
    CGFloat pageWidth = self.collectionViewObj.frame.size.width;
    self.pageControl.currentPage = self.collectionViewObj.contentOffset.x / pageWidth;
    pageCount=(int)self.pageControl.currentPage;
    recipeLabel.text=[recipeImages objectAtIndex:self.pageControl.currentPage];
  
}
@end
