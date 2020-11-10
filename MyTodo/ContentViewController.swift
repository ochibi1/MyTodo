//
//  ContentViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/02.
//

import UIKit
import SnapKit

// プロトコルはextensionで下に分けて記述。
class ContentViewController: UIViewController {
        
    // テーブルに表示させるデータを用意（DBが設計時に漏れていたため、一時的な見た目の確認用）
    var items = ["aa", "bb", "cc", "ee"]

    init(){
        //self　を使うために必要な親のイニシャライザ呼び出し
        super.init(nibName: nil, bundle: nil)
        //ボタンの設置
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: Selector(("onClick")))
        self.title = "今日やること"

        // テーブルを用意して、表示
        let table: UITableView = UITableView(frame: .zero)
        // cellを作成する時に、UITableViewのインスタンス（ここではtable）をcellのテンプレートにするよ
        table.register(ContentViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)

        //親クラスのビュー に上下左右合わせるよー
        table.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
    }
    
    //addBtnをクリックした時のアクション
    @objc func onClick() {
        let second = ItemAddViewController()
        self.navigationController?.pushViewController(second, animated: true)
    }

//IBを使わない分、「ここを呼び出したらエラーにしますよ」のお約束
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContentViewController: UITableViewDelegate {
    
}

extension ContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContentViewCell
        //「このcell作るときは、必ず（!で指定。認識できなかったらエラーにする役割）ContentViewCellとして作られるものとしますからねー！」と先に記述しているから、ContentViewCellクラスのconfigreメソッド（string型のテキスト）が使えているよー
        cell.configure(items[indexPath.row]) 
        return cell
    }

    // セルの行数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
