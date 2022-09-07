//
//  Label.swift
//  Coffee Shop
//
//  Created by Saydullo on 07/09/22.
//

import UIKit

class Label: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    init(text: String, textColor: UIColor, fontSize: CGFloat, weight: UIFont.Weight = .semibold, style: String) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.font = UIFont(name: style, size: fontSize)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
