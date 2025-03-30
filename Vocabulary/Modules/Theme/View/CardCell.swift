//
//  CardCell.swift
//  Vocabulary
//
//  Created by Mena Gamal on 30/03/2025.
//
import UIKit

class CardCell: UICollectionViewCell {

    static let identifier = "CardCell"

    let imageView = UIImageView()
    let label = UILabel()
    let checkmark = UIImageView()
    let playIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)

        label.text = "Aa"
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        checkmark.image = UIImage(systemName: "checkmark.circle.fill")
        checkmark.tintColor = UIColor(red: 156/255, green: 192/255, blue: 192/255, alpha: 1.0)
        checkmark.translatesAutoresizingMaskIntoConstraints = false
        checkmark.isHidden = true
        contentView.addSubview(checkmark)

        playIcon.image = UIImage(systemName: "play.circle.fill")
        playIcon.tintColor = .white
        playIcon.translatesAutoresizingMaskIntoConstraints = false
        playIcon.isHidden = true
        contentView.addSubview(playIcon)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            checkmark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            checkmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            checkmark.widthAnchor.constraint(equalToConstant: 24),
            checkmark.heightAnchor.constraint(equalToConstant: 24),

            playIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            playIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            playIcon.widthAnchor.constraint(equalToConstant: 24),
            playIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func configure(image: UIImage?, showsCheckmark: Bool, showsPlayIcon: Bool) {
        imageView.image = image
        checkmark.isHidden = !showsCheckmark
        playIcon.isHidden = !showsPlayIcon
    }
}
