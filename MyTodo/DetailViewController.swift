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
        
        label.snp.makeConstraints { make in
            make.top.equalTo(150.0)
            make.height.equalTo(80.0)
            make.left.equalTo(40.0)
            make.right.equalToSuperview().inset(40.0)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
