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
            make.left.right.equalTo(60.0).inset(10)
            make.height.equalTo(40.0)
        }
        
        self.contentView.snp.makeConstraints { make in
            make.bottom.equalTo(self.label.snp.bottom)
            make.top.right.equalToSuperview()
            make.left.equalTo(10)
        }
    }
    
    //ビルドに必要だったため記述。
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ text: String) {
        self.label.text = text
    }
}
