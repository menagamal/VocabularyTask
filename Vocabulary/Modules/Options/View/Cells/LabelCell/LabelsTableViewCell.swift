//
//  LabelsTableViewCell.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import UIKit

class LabelsTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = PrimaryLabel()
        label.text = "How did you hear about Vocabulary?"
        label.textAlignment = .center
        return label
    }()

    let subtitleLabel: UILabel = {
        let label = SecondaryLabel()
        label.text = "Select an option to continue"
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        backgroundColor = UIColor(red: 248/255, green: 243/255, blue: 237/255, alpha: 1) // Match the beige background

        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }

    func configure(title: String, subTitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subTitle
    }
}
