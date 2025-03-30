//
//  VoiceOptionCell.swift
//  Vocabulary
//
//  Created by Mena Gamal on 30/03/2025.
//
import UIKit
//
//class VoiceOptionCell: UITableViewCell {
//    static let identifier = "VoiceOptionCell"
//    var onPlayTapped: (() -> Void)?
//
//    private let playButton = UIButton()
//    private let nameLabel = UILabel()
//    private let accentLabel = UILabel()
//    private let waveformImage = UIImageView()
//    private let checkmarkView = UIImageView()
//
//    private var waveformAnimationImages: [UIImage] = []
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//        loadWaveformFrames()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    private func setupUI() {
//        backgroundColor = .white
//        layer.cornerRadius = 12
//        selectionStyle = .none
//
//        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
//        playButton.tintColor = .black
//        playButton.addTarget(self, action: #selector(handlePlayTapped), for: .touchUpInside)
//
//        nameLabel.font = .boldSystemFont(ofSize: 16)
//        accentLabel.font = .systemFont(ofSize: 14)
//        accentLabel.textColor = .gray
//
//        waveformImage.contentMode = .scaleAspectFit
//
//        [playButton, nameLabel, accentLabel, waveformImage, checkmarkView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview($0)
//        }
//
//        NSLayoutConstraint.activate([
//            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            playButton.widthAnchor.constraint(equalToConstant: 28),
//            playButton.heightAnchor.constraint(equalToConstant: 28),
//
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//            nameLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 12),
//
//            accentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
//            accentLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//
//            waveformImage.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
//            waveformImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            waveformImage.widthAnchor.constraint(equalToConstant: 100),
//            waveformImage.heightAnchor.constraint(equalToConstant: 24),
//
//            checkmarkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            checkmarkView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            checkmarkView.widthAnchor.constraint(equalToConstant: 24),
//            checkmarkView.heightAnchor.constraint(equalToConstant: 24),
//        ])
//    }
//
//    private func loadWaveformFrames() {
//        waveformAnimationImages = (1...3).compactMap {
//            UIImage(named: "waveform_\($0)")
//        }
//    }
//
//    func configure(with option: VoiceOption, isPlaying: Bool) {
//        nameLabel.text = option.name
//        accentLabel.text = option.accent
//
//        checkmarkView.image = option.isSelected
//        ? UIImage(systemName: "checkmark.circle.fill")
//        : UIImage(systemName: "circle")
//        checkmarkView.tintColor = option.isSelected ? .systemTeal : .systemGray3
//
//        if isPlaying {
//            waveformImage.animationImages = waveformAnimationImages
//            waveformImage.animationDuration = 0.6
//            waveformImage.startAnimating()
//        } else {
//            waveformImage.stopAnimating()
//            waveformImage.image = UIImage(named: "waveform_static")
//        }
//    }
//
//    @objc private func handlePlayTapped() {
//        onPlayTapped?()
//    }
//}


import UIKit

class WaveformView: UIView {

    private let numberOfBars = 20
    private let barWidth: CGFloat = 3
    private let spacing: CGFloat = 3
    private let minHeight: CGFloat = 8
    private let maxHeight: CGFloat = 20

    private let backgroundLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    private func setupLayers() {
        backgroundColor = .clear
        backgroundLayer.fillColor = UIColor.systemGray4.cgColor
        progressLayer.fillColor = UIColor.darkGray.cgColor
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(progressLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        drawWaveform()
    }

    private func drawWaveform() {
        backgroundLayer.path = generateBarsPath(fillUpTo: 1.0).cgPath
        progressLayer.path = generateBarsPath(fillUpTo: 0.0).cgPath
    }

    private func generateBarsPath(fillUpTo progress: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        let totalWidth = CGFloat(numberOfBars) * (barWidth + spacing) - spacing
        let startX = (bounds.width - totalWidth) / 2
        let centerY = bounds.midY

        for i in 0..<numberOfBars {
            let x = startX + CGFloat(i) * (barWidth + spacing)
            let scale = CGFloat.random(in: 0.4...1.0)
            let barHeight = minHeight + (maxHeight - minHeight) * scale
            let y = centerY - barHeight / 2
            let barRect = CGRect(x: x, y: y, width: barWidth, height: barHeight)

            if CGFloat(i) < CGFloat(numberOfBars) * progress {
                path.append(UIBezierPath(roundedRect: barRect, cornerRadius: 1.5))
            }
        }

        return path
    }

    func updateProgress(_ progress: CGFloat) {
        progressLayer.path = generateBarsPath(fillUpTo: progress).cgPath
    }
}

class VoiceOptionCell: UITableViewCell {
    static let identifier = "VoiceOptionCell"
    var onPlayTapped: (() -> Void)?

    private let playButton = UIButton()
    private let nameLabel = UILabel()
    private let accentLabel = UILabel()
    private let waveformView = WaveformView()
    private let checkmarkView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        selectionStyle = .none

        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .black
        playButton.addTarget(self, action: #selector(handlePlayTapped), for: .touchUpInside)

        nameLabel.font = .boldSystemFont(ofSize: 16)
        accentLabel.font = .systemFont(ofSize: 14)
        accentLabel.textColor = .gray

        waveformView.translatesAutoresizingMaskIntoConstraints = false
        waveformView.backgroundColor = .clear

        [playButton, nameLabel, accentLabel, waveformView, checkmarkView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 28),
            playButton.heightAnchor.constraint(equalToConstant: 28),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 12),

            accentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            accentLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

            waveformView.trailingAnchor.constraint(equalTo: checkmarkView.leadingAnchor, constant: -24),
            waveformView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            waveformView.widthAnchor.constraint(equalToConstant: 100),
            waveformView.heightAnchor.constraint(equalToConstant: 24),

            checkmarkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkmarkView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkmarkView.widthAnchor.constraint(equalToConstant: 24),
            checkmarkView.heightAnchor.constraint(equalToConstant: 24),
        ])
    }

    func configure(with option: VoiceOption, isPlaying: Bool) {
        nameLabel.text = option.name
        accentLabel.text = option.accent

        checkmarkView.image = option.isSelected
            ? UIImage(systemName: "checkmark.circle.fill")
            : UIImage(systemName: "circle")
        checkmarkView.tintColor = option.isSelected ? .systemTeal : .systemGray3

        updatePlayState(isPlaying: isPlaying)
        waveformView.updateProgress(isPlaying ? 0.01 : 0.0)
    }

    func updatePlayState(isPlaying: Bool) {
        let iconName = isPlaying ? "pause.fill" : "play.fill"
        playButton.setImage(UIImage(systemName: iconName), for: .normal)
    }

    func updateProgress(_ progress: CGFloat) {
        waveformView.updateProgress(progress)
    }

    @objc private func handlePlayTapped() {
        onPlayTapped?()
    }
}
