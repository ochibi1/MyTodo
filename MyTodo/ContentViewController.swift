//
//  ContentViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/02.
//

import UIKit

// プロトコルを２つ追加している
class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        // テーブルに表示させるデータを用意（DBが設計時に漏れていたため、一時的な見た目の確認用）
        var items = ["aa", "bb", "cc", "ee"]

        required init?(coder: NSCoder){
            super.init(coder: <#T##NSCoder#>)
            
            super.viewDidLoad()

            // テーブルを用意して、表示
            let table: UITableView = UITableView(frame: CGRect(x: 50, y: 50 , width: 200, height: 500))
            table.register(UITableViewCell.self, forCellReuseIdentifier: "data")
            table.dataSource = self
            table.delegate = self
            self.view.addSubview(table)
    
        }
    

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            cell.textLabel?.text = items[indexPath.row]
            return cell
        }
        /*
        下の２つのfuncはDataSourceのプロトコルに定められているモノなので、記載しないとエラーになる
        */

        // セルの行数を指定
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }

        // セルの値を設定
        private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath as IndexPath) as UITableViewCell
            cell.textLabel?.text = items[indexPath.row]
            return cell
        }

}
