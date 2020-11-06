//
//  ContentViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/02.
//

import UIKit
import SnapKit

// プロトコルを２つ追加している
class ContentViewController: UIViewController {
        
    // テーブルに表示させるデータを用意（DBが設計時に漏れていたため、一時的な見た目の確認用）
    var items = ["aa", "bb", "cc", "ee"]

    init(){
        super.init(nibName: nil, bundle: nil)

        // テーブルを用意して、表示
        let table: UITableView = UITableView(frame: .zero)
        table.register(ContentViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = items[indexPath.row]
            return cell
        }
        table.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContentViewController: UITableViewDelegate {
    
}

extension ContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContentViewCell
        cell.configure(items[indexPath.row]) 
        return cell
    }

    // セルの行数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
