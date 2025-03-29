//
//  OptionTableViewCell.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import UIKit

protocol OptionTableViewCellDelegate: AnyObject {
    func didSelectOption(title:String)
}

class OptionTableViewCell: UITableViewCell {
    
    weak var delegate: OptionTableViewCellDelegate?
    static let reuseIdentifier = "OptionTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = SecondaryLabel()
        label.textColor = .black
        return label
    }()
    
    
    private let radioIndicator: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let innerDot: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0 // hidden by default
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245/255, green: 239/255, blue: 229/255, alpha: 1.0)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(radioIndicator)
        radioIndicator.addSubview(innerDot)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 55),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            radioIndicator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            radioIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            radioIndicator.widthAnchor.constraint(equalToConstant: 20),
            radioIndicator.heightAnchor.constraint(equalToConstant: 20),
            
            innerDot.centerXAnchor.constraint(equalTo: radioIndicator.centerXAnchor),
            innerDot.centerYAnchor.constraint(equalTo: radioIndicator.centerYAnchor),
            innerDot.widthAnchor.constraint(equalToConstant: 10),
            innerDot.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        containerView.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap() {
        delegate?.didSelectOption(title: titleLabel.text ?? "")
    }
    
    // MARK: Public
    func configure(with text: String, isSelected: Bool, delegate: OptionTableViewCellDelegate) {
        titleLabel.text = text
        self.delegate = delegate
        animateSelection(isSelected)
    }
    
    private func animateSelection(_ selected: Bool) {
        if selected {
            UIView.animate(withDuration: 0.25) {
                self.innerDot.alpha = selected ? 1 : 0
                self.radioIndicator.layer.borderColor = selected ? UIColor.black.cgColor : UIColor.lightGray.cgColor
            }
        } else {
            self.innerDot.alpha = selected ? 1 : 0
            self.radioIndicator.layer.borderColor = selected ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        }
        
    }
}
