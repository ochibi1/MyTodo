//
//  DetailViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/17.
//

import UIKit

class DetailViewController: UIViewController {
    let label = UILabel()

    init(task: Task) {
        super.init(nibName: nil, bundle: nil)
        self.title = "詳細画面"
        self.view.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.label)
        label.text = task.taskName
        label.backgroundColor = UIColor.white
        
        label.snp.makeConstraints { make in
            make.top.equalTo(150.0)
            make.height.equalTo(80.0)
            make.left.equalTo(40.0)
            make.right.equalTo(-40.0)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
