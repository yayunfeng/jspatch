//
//  ViewController.m
//  jspatch
//
//  Created by 冯亚运 on 17/1/17.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "ViewController.h"
#import "FYYPerson.h"
#import "JPEngine.h"
NSString *const cellIdentifier = @"cell";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *dataSoure;


@end

@implementation ViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}

- (NSMutableArray *)dataSoure {
    if (!_dataSoure) {
        _dataSoure = [[NSMutableArray alloc]init];
        for (int i=0; i<10; i++) {
            FYYPerson *person = [[FYYPerson alloc] init];
            person.name = [@"xiaoming-" stringByAppendingFormat:@"%zd",i];
            [_dataSoure addObject:person];
        }
    }
    return _dataSoure;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.tableView];
}

#pragma mark -UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSoure.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    FYYPerson *person = self.dataSoure[indexPath.row];
    cell.textLabel.text = person.name;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = @[@1,@2,@3,@4];
    NSInteger row = indexPath.row;
//    if (array.count >row) {
//        id objc = array[row];
//        NSLog(@"%@",objc);
//    }
    id objc = array[row];
    NSLog(@"%@",objc);

}
@end




