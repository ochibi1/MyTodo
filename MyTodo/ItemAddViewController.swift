//
//  ItemAddViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/09.
//

import UIKit
import SnapKit
import CoreData

class ItemAddViewController: UIViewController {
    let inputField: UITextField! = UITextField(frame: .zero)
    let saveBtn = UIButton(frame: .zero)

    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "新規項目追加画面"
        self.view.backgroundColor = UIColor.lightGray
        
        inputField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(inputField)
        inputField.snp.makeConstraints { make in
            make.top.equalTo(150.0)
            make.height.equalTo(30.0)
            make.left.equalTo(40.0)
            make.right.equalTo(-40.0)
        }
        inputField.placeholder = "今日のやることを入力"
        
        saveBtn.setTitle("保存", for: UIControl.State.normal)
        saveBtn.backgroundColor = UIColor.magenta
        self.view.addSubview(saveBtn)
        saveBtn.inputField.snp.makeConstraints { make in
            make.top.equalTo(150.0)
            make.height.equalToSuperview()
            make.left.right.equalToSuperview().inset(50.0)
            
        saveBtn.addTarget(self, action: Selector(("saveData")), for: UIControl.Event.touchUpInside)
        }
    
    }
    
     //saveBtnを押した時に、CoreDataに保存されるメソッド。
    func saveData() {
        //DataControllerの変数contextを介して、createとinsertアクションを使う。（余力があれば・・・・使えたら、入力値消す？か、キーボード隠れる系の何かしらの変化が合った方がよさそう。）
        let data :DataController = DataController.shared
        data.create(entityName: "task")
        data.insert()//ここのカッコに何を入れるのか分からない・・
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
