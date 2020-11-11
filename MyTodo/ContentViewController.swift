//
//  ContentViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/02.
//

import UIKit
import SnapKit
import CoreData

// プロトコルはextensionで下に分けて記述。
class ContentViewController: UIViewController {
        
    // テーブルに表示させるデータの配列
    var items: [NSString] = []

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
    
    override func viewWillAppear(_ animated: Bool) {
        // CoreDataからデータを読み込んで配列itemsに格納する
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let toDoRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        var results = toDoContext.executeFetchRequest(toDoRequest, error: nil) as [Task]?
         items = []
         for data in results {
             items.append(data.memo)
         }

         // テーブル情報を更新する
         self.table.reloadData()

        
    }
    
    //addBtnをクリックした時のアクション
    @objc func onClick() {
        self.navigationController?.pushViewController(ItemAddViewController(), animated: true)
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
        cell.configure(items[indexPath.row] as String)
        return cell
    }

    // セルの行数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
