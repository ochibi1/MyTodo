//
//  DetailViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/17.
//

import UIKit

class DetailViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "詳細画面"
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
