//
//  PrimaryLabel.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//
import UIKit

class PrimaryLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }

    private func setupStyle() {
        font = UIFont(name: "Georgia-Bold", size: 24)
        textColor = .black
        numberOfLines = 0
        textAlignment = .center
        adjustsFontForContentSizeCategory = true
    }
}
