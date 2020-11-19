//
//  ItemAddViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/09.
//

import UIKit
import SnapKit

class ItemAddViewController: UIViewController {
    let inputField: UITextField! = UITextField(frame: .zero)
    let saveBtn = UIButton(frame: .zero)

    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "新規項目追加画面"
        self.view.backgroundColor = UIColor.lightGray
        
        self.inputField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(inputField)
        self.inputField.snp.makeConstraints { make in
            make.top.equalTo(150.0)
            make.height.equalTo(45.0)
            make.left.equalTo(40.0)
            make.right.equalTo(-40.0)
        }
        self.inputField.placeholder = "今日のやることを入力"
        
        self.saveBtn.setTitle("保存", for: UIControl.State.normal)
        self.saveBtn.backgroundColor = UIColor.green
        self.view.addSubview(saveBtn)
        self.saveBtn.snp.makeConstraints { make in
            make.top.equalTo(self.inputField.snp.bottom).offset(50.0)
            make.height.equalTo(self.inputField.snp.height)
            make.left.right.equalToSuperview().inset(150.0)
            
        }
        saveBtn.addTarget(self, action: #selector(self.saveData), for: UIControl.Event.touchUpInside)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //saveBtnを押した時に、CoreDataに保存されるメソッド。
    //データが反映されたら、画面に変更を表示させて欲しいから@objc必要
    @objc func saveData() {
        //inputFieldに入力されていないのに、saveDataが呼び出された場合、この処理を返して終了にするためのguard節。
        guard let taskTitle = self.inputField.text,
              !taskTitle.isEmpty else {
            let alert = UIAlertController(title: "エラー", message: "入力してから保存ボタンを押してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let data = Task.create()
        data.taskName = taskTitle
        data.insert()
        let isSuccess = data.save()
        if isSuccess {
            self.navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "エラー", message: "保存できませんでした。やり直してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
       
    }
    

}
