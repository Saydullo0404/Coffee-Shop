//
//  AppTextField.swift
//  Coffee Shop
//
//  Created by Saydullo on 07/09/22.
//

import UIKit
import SnapKit

class AppTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
    init(text: String, placeholder: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.backgroundColor = .textFiewldColor
        self.textColor = .textColor
        self.text = text
        self.placeholder = placeholder
        self.font = .systemFont(ofSize: fontSize)
        self.layer.borderWidth = 0.1
        self.textAlignment = .left
        self.leftView = UIView(frame: CGRect(x: 14, y: 14, width: 14, height: 14))
        self.leftViewMode = .always
        self.isSecureTextEntry = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

