//
//  ContentViewCell.swift
//  MyTodo
//
//  Created by RLSUU178449 on 2020/11/05.
//  pulled by lafrola on 2020/11/06.
//

import UIKit
import SnapKit

class ContentViewCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let numberLabel: UILabel = {
       let numberLabel = UILabel()
        numberLabel.numberOfLines = 0
        return numberLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.numberLabel)
        self.contentView.addSubview(self.label)
        
        self.accessoryType = .disclosureIndicator

        self.numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(20.0)
            make.right.equalTo(-300.0)
            make.height.greaterThanOrEqualTo(40.0)
            make.bottom.equalToSuperview()
        }
        self.label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(self.numberLabel.snp.right)
            make.right.equalTo(-20.0)
            make.height.equalTo(self.numberLabel.snp.height)
            make.bottom.equalTo(self.numberLabel.snp.bottom)
        }
        
    }
    
    //ビルドに必要だったため記述。
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ task: Task) {
        self.label.text = task.taskName
        self.numberLabel.text = String(task.taskNumber)
    }
}
