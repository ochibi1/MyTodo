//
//  DetailViewController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/17.
//

import UIKit

class DetailViewController: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let deleteBtn: UIButton = {
        let deleteBtn = UIButton(frame: .zero)
        deleteBtn.setTitle("削除", for: .normal)
        deleteBtn.backgroundColor = .red
        return deleteBtn
    }()

    init(task: Task) {
        super.init(nibName: nil, bundle: nil)
        self.title = "詳細画面"
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.label)
        self.label.text = task.taskName
        
        self.label.snp.makeConstraints { make in
            make.top.equalTo(150.0)
            make.height.equalTo(45.0)
            make.left.equalTo(40.0)
            make.right.equalTo(-40.0)
        }
        
        self.view.addSubview(self.deleteBtn)
        self.deleteBtn.snp.makeConstraints { make in
            make.top.equalTo(self.label.snp.bottom).offset(50.0)
            make.height.equalTo(self.label.snp.height)
            make.left.right.equalToSuperview().inset(150.0)
            
        }
        deleteBtn.addTarget(self, action: #selector(self.deleteData), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteData() {
        print("削除ボタンが押されたよ")//動作確認用
        let alert: UIAlertController = UIAlertController(title: "確認", message:  "本当に削除してよろしいですか？", preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action: UIAlertAction!) -> Void in
            let data = Task().delete(self.label.text)
            data.save()
            print("確定")//動作確認用
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("キャンセル")//動作確認用
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

}
