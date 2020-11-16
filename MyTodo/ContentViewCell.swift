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
    let label: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.label)

        self.label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(20.0)
            make.right.equalToSuperview().inset(20.0)
            make.height.equalTo(40.0)
        }
        
        self.contentView.snp.makeConstraints { make in
            make.bottom.equalTo(self.label.snp.bottom)
            make.top.left.right.equalToSuperview()
        }
    }
    
    //ビルドに必要だったため記述。
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ task: Task) {
        self.label.text = task.taskName
    }
}
