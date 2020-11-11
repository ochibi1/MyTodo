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

    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "新規項目追加画面"
        self.view.backgroundColor = UIColor.lightGray
        
        let inputField = UITextField(frame: .zero)
        inputField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(inputField)
        inputField.snp.makeConstraints { make in
            make.top.equalTo(150.0)
            make.height.equalTo(30.0)
            make.left.equalTo(40.0)
            make.right.equalToSuperview().inset(40.0)
        }
        inputField.placeholder = "今日のやることを入力"
        
        let saveBtn = UIButton(frame: .zero)
        saveBtn.setTitle("保存", for: UIControl.State.normal)
        saveBtn.backgroundColor = UIColor.magenta
        self.view.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { make in
            make.top.equalTo(250.0)
            make.height.equalTo(30.0)
            make.left.equalTo(100.0)
            make.right.equalToSuperview().inset(100.0)
            
        saveBtn.addTarget(self, action: Selector(("saveData")), for: UIControl.Event.touchUpInside)
        }
    
    }
    
     //saveBtnを押した時に、CoreDataに保存されるメソッド。モデルに書いた方がよいかも・・・？
    func saveData() {
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let toDoEntity: NSEntityDescription! = NSEntityDescription.entity(forEntityName: "Task", in: toDoContext)
        var newData = TaskStore(entity: task, insertIntoManagedObjectContext: toDoContext)
        newData.input = inputField.text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
