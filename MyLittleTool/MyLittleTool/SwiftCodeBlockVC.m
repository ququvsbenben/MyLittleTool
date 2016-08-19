//
//  SwiftCodeBlockVC.m
//  MyLittleTool
//
//  Created by QUQU on 16/8/19.
//  Copyright © 2016年 QUQU. All rights reserved.
//

#import "SwiftCodeBlockVC.h"

@interface SwiftCodeBlockVC ()<UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UILabel           * ququ_lable;
@property (nonatomic, strong) UIImageView       * ququ_imangeView;
@property (nonatomic, strong) UIButton          * ququ_button;
@property (nonatomic, strong) UITextField       * ququ_textField;
@property (nonatomic, strong) UIScrollView      * ququ_scrollView;
@property (nonatomic, strong) UITableView       * ququ_tableView;


@end

@implementation SwiftCodeBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// vc 方法结构 ***********

#pragma mark - life cycle

#pragma mark - SystemDelegate
#pragma mark UITableViewDataSource

#pragma mark - CustomDelegate

#pragma mark - event response

#pragma mark - private methods

#pragma mark - getters and setters

// **************************

#pragma mark 创建lable
- (void)setup_ququ_Lable{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 100, 300, 30);
    label.text = @"标签";
    label.font = [UIFont boldSystemFontOfSize:20];
    label.backgroundColor = [UIColor yellowColor];
    label.textColor = [UIColor colorWithRed:0.00f green:0.66f blue:1.00f alpha:1.00f];
    label.textAlignment = NSTextAlignmentCenter;
    
//    label.layer.cornerRadius = 20;
//    label.layer.masksToBounds = YES;
    
    _ququ_lable = label;
}
#pragma mark 创建ImageView
- (void)setup_ququ_ImageView{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.png"]];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.backgroundColor = [UIColor yellowColor];
    
//    imageView.layer.cornerRadius = 20;
//    imageView.layer.masksToBounds = YES;
    
    _ququ_imangeView = imageView;
}
#pragma mark 创建btn
- (void)setup_ququ_Button{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 25, 50, 30);
    button.backgroundColor = [UIColor grayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [button setTitle:@"btn" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [button setTitle:@"btn" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1;
    
//    button.layer.cornerRadius = 20;
//    button.layer.masksToBounds = YES;
    
    _ququ_button = button;
}
- (void)ButtonClick:(UIButton *)btn
{
    
}
#pragma mark 创建UITextField
- (void)setup_ququ_UITextField{
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(10, 400, 300, 30);
    // 边框样式
    textField.borderStyle = UITextBorderStyleLine;
    // 设置密文输入
    textField.secureTextEntry = NO;
    // 提示
    textField.placeholder = @"Message";
    // 设置删除按钮
    textField.clearButtonMode = UITextFieldViewModeAlways;
    // 设置键盘样式
    textField.keyboardType = UIKeyboardTypePhonePad;
    // 设置键盘风格(半透明，非半透明)
    textField.keyboardAppearance = UIKeyboardAppearanceDefault;
    textField.delegate = self;
    [self.view addSubview:textField];
}
#pragma mark UITextFieldDelegate & 收放键盘
// 设置键盘
- (void)setup_ququ_keyboard
{
    // 收放键盘
    UIControl *control = [[UIControl alloc] init];
    control.frame = self.view.bounds;
    [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control];
    [self.view sendSubviewToBack:control];
    
    [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
}
// 显示键盘
- (void)keyboardWillShow{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.frame = CGRectMake(0,-226, self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        
    }];
}
// 隐藏键盘
- (void)keyboardWillHide{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.frame = CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        
    }];
}
// 取消第一响应者
- (void)controlClick{
    [_ququ_textField resignFirstResponder];
}

#pragma mark UITextFieldDelegate
// 取消第一响应者
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // 取消第一响应者
    [_ququ_textField resignFirstResponder];
    return YES;
}
#pragma mark 创建UIScrollView
- (void)setup_ququ_scrollView{
    // 滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, 320, 480);
    scrollView.backgroundColor = [UIColor redColor];
    // 设置内容大小
    // 想让ScrollView可以滚动，ScrollView的内容大小必须要大于frame的宽高
    scrollView.contentSize = CGSizeMake(320*5, 480);
    // 关闭弹性效果
    scrollView.bounces = NO;
    // 关闭横向位置条
    scrollView.showsHorizontalScrollIndicator = NO;
    // 关闭纵向位置条
    scrollView.showsVerticalScrollIndicator = NO;
    // 设置按页翻滚(一页的大小就是frame的宽高)
    //scrollView.pagingEnabled = YES;
    // 设置偏移量(内容0，0点到可视范围0，0点得距离)
    //[scrollView setContentOffset:CGPointMake(image.size.width, 0) animated:YES];
    scrollView.delegate = self;
    // 缩放 - 2 设置放大和缩小倍数
    scrollView.maximumZoomScale = 3.0f;
    scrollView.minimumZoomScale = 1.0f;
    // 设置默认放大倍数(1.必须要实现协议方法并且设置最大最小缩放倍数。1.不能超过最大最小缩放倍数范围)
    scrollView.zoomScale = 2.0f;
    
    _ququ_scrollView = scrollView;
}
#pragma mark UIScrollViewDelegate
// 当ScrollView滚动时调用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
}
// 当开始拖动时调用此方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
}
// 当停止拖动图片时调用此方法(decelerate参数为是否有减速运动)
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
    if(decelerate)
        NSLog(@"有减速运动");
    else
        NSLog(@"无减速运动");
}
// 当减速运动开始时调用此方法
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
}
// 当减速运动停止时调用此方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
}
#pragma mark 创建TabelView
- (void)setup_ququ_TableView{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.height, self.view.bounds.size.height-64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    // 去掉滚动条
    tableView.showsVerticalScrollIndicator = NO;
    // 隐藏分割线
    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    // 删除多余分割线
    //[tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    // 设置分割线颜色
    [tableView setSeparatorColor:[UIColor blueColor]];
    // 设置行高
    tableView.rowHeight = 90;
    
    // 每个tableView都有自己的一组头脚标
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    headerView.backgroundColor = [UIColor orangeColor];
    tableView.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    footerView.backgroundColor = [UIColor yellowColor];
    tableView.tableFooterView = footerView;
    
    // 上下拉刷新
//    [tableView addHeaderWithTarget:self action:@selector(headerRefreshing)];
//    [tableView addFooterWithTarget:self action:@selector(footerRefreshing)];
    
    _ququ_tableView = tableView;
}
#pragma mark UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellName = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil)
    {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"第 -- %ld -- 行",indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中cell
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
/***************辅助功能***********************
// 功能按钮事件
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // indexPath - 用来定位某一行或者某一个section
    NSLog(@"点击了 %ld section中 %ld row的功能按钮",indexPath.section,indexPath.row);
}

// 设置section的头标标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[NSString alloc] initWithFormat:@"Section -Header- %ld",section];
}
// 设置section的脚标标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [[NSString alloc] initWithFormat:@"Section -Footer- %ld",section];
}
//设置头标视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"112.png"]];
    imageView.backgroundColor = [UIColor greenColor];
    imageView.frame = CGRectMake(0, 0, 320, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    label.text = [[NSString alloc] initWithFormat:@"Section -Header- %ld",section];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:label];
    return imageView;
}
// 设置头标高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}
// 设置脚标视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"112.png"]];
    imageView.backgroundColor = [UIColor purpleColor];
    imageView.frame = CGRectMake(0, 0, 320, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    label.text = [[NSString alloc] initWithFormat:@"Section -Footer- %ld",section];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:label];
    return imageView;
}
// 设置脚标高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40.0f;
}
*******************************************/



@end
