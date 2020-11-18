//
//  DetailViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/17.
//

import UIKit

class DetailViewController: UIViewController {
    let label = UILabel()

    init() {
        super.init(nibName: nil, bundle: nil)
        print("Detailのイニシャライザが呼ばれました")
        self.title = "詳細画面"
        print("タイトル返すよ")
        self.view.backgroundColor = UIColor.lightGray
        print("背景色決めたよ")
        self.view.addSubview(self.label)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
