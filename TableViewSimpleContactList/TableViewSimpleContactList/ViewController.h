//
//  ViewController.h
//  TableViewSimpleContactList
//
//  Created by Anderson Uchôa on 20/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController: UIViewController<UITableViewDataSource,
UITableViewDelegate> {
    
    NSMutableArray *contatos;
}

@property (weak, nonatomic) IBOutlet UITableView *tabelaContatos;
@property (weak, nonatomic) IBOutlet UIButton *botaoEditar;
- (IBAction)botaoEditarTap:(id)sender;


@end

