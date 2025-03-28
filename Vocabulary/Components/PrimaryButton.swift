//
//  PrimaryButton.swift
//  Vocabulary
//
//  Created by Mena Gamal on 27/03/2025.
//

import UIKit

class PrimaryButton: UIButton {
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
        setupActions()

    }

    private func setupStyle() {
        setTitleColor(.black, for: .normal)
        backgroundColor = UIColor(red: 151/255, green: 201/255, blue: 199/255, alpha: 1.0) // #97C9C7
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 28
        layer.masksToBounds = false

        // Bottom shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
    }

    func configureTitle(title:String) {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        setTitleColor(.black, for: .highlighted)
        self.titleLabel!.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }


    private func setupActions() {
           addTarget(self, action: #selector(pressDown), for: [.touchDown, .touchDragEnter])
           addTarget(self, action: #selector(pressUp), for: [.touchUpInside, .touchCancel, .touchDragExit])
       }

       @objc private func pressDown() {
           feedbackGenerator.prepare()
           UIView.animate(withDuration: 0.1, animations: {
               self.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
           })
       }

       @objc private func pressUp() {
           feedbackGenerator.impactOccurred()
           UIView.animate(withDuration: 0.2,
                          delay: 0,
                          usingSpringWithDamping: 0.4,
                          initialSpringVelocity: 6,
                          options: [.allowUserInteraction],
                          animations: {
               self.transform = .identity
           }, completion: nil)
       }
}
