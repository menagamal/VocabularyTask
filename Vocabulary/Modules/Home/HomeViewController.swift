//
//  HomeViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 01/04/2025.
//
import UIKit
import AVFoundation

enum BackgroundType {
    case video(name: String)
    case image(name: String)
    case color(UIColor)
}

struct WordEntry {
    let word: String
    let pronunciation: String
    let definition: String
    let example: String
}
class HomeViewController: UIViewController {

    // MARK: - Background Elements
    private var backgroundType: BackgroundType = .video(name: "cozy_night")

    private let backgroundImageView = UIImageView()
    private let backgroundColorView = UIView()
    private var playerLayer = AVPlayerLayer()
    private var queuePlayer: AVQueuePlayer?
    private var playerLooper: AVPlayerLooper?

    // MARK: - Overlay and Word UI
    private let overlayView = UIView()
    private let wordLabel = UILabel()
    private let phoneticLabel = UILabel()
    private let speakerButton = UIButton(type: .system)
    private let definitionLabel = UILabel()
    private let exampleLabel = UILabel()
    private var audioPlayer = AVSpeechSynthesizer()

    private var words: [WordEntry] = [
        WordEntry(word: "Lovelorn", pronunciation: "ˈlʌvˌlɔrn", definition: "(adj.) Feeling sad and lonely because of unrequited love", example: "She has been lovelorn ever since her crush started dating someone else."),
        WordEntry(word: "Ethereal", pronunciation: "ɪˈθɪəriəl", definition: "(adj.) Extremely delicate and light in a way that seems too perfect for this world", example: "The sunrise created an ethereal glow over the lake."),
        WordEntry(word: "Halcyon", pronunciation: "ˈhælsiən", definition: "(adj.) Denoting a period of time in the past that was idyllically happy and peaceful", example: "He often spoke of the halcyon days of his youth."),
    ]
    private var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground(type: backgroundType)
        setupOverlay()
        setupLabels()
        setupGesture()
        loadWord()
    }

    // MARK: - Background Handling
    private func setBackground(type: BackgroundType) {
        // Remove all background layers
        backgroundImageView.removeFromSuperview()
        backgroundColorView.removeFromSuperview()
        playerLayer.removeFromSuperlayer()

        switch type {
        case .video(let name):
            guard let path = Bundle.main.path(forResource: name, ofType:"mp4") else {
                print("Video not found.")
                return
            }
            let url = URL(fileURLWithPath: path)
            let playerItem = AVPlayerItem(url: url)
            queuePlayer = AVQueuePlayer(playerItem: playerItem)
            playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)
            playerLayer = AVPlayerLayer(player: queuePlayer)
            playerLayer.frame = view.bounds
            playerLayer.videoGravity = .resizeAspectFill
            view.layer.insertSublayer(playerLayer, at: 0)
            queuePlayer?.isMuted = true
            queuePlayer?.play()

        case .image(let name):
            backgroundImageView.image = UIImage(named: name)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            view.insertSubview(backgroundImageView, at: 0)
            NSLayoutConstraint.activate([
                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])

        case .color(let color):
            backgroundColorView.backgroundColor = color
            backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
            view.insertSubview(backgroundColorView, at: 0)
            NSLayoutConstraint.activate([
                backgroundColorView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                backgroundColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
    }

    // MARK: - Overlay and Labels
    private func setupOverlay() {
        overlayView.backgroundColor = UIColor.clear
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overlayView)
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func setupLabels() {
        [wordLabel, phoneticLabel, speakerButton, definitionLabel, exampleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            overlayView.addSubview($0)
        }

        wordLabel.font = UIFont.boldSystemFont(ofSize: 36)
        wordLabel.textColor = .white
        wordLabel.textAlignment = .center

        phoneticLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        phoneticLabel.textColor = .white

        speakerButton.setImage(UIImage(systemName: "speaker.wave.2.fill"), for: .normal)
        speakerButton.tintColor = .white
        speakerButton.addTarget(self, action: #selector(playPronunciation), for: .touchUpInside)

        definitionLabel.font = UIFont.systemFont(ofSize: 18)
        definitionLabel.textColor = .white
        definitionLabel.textAlignment = .center
        definitionLabel.numberOfLines = 0

        exampleLabel.font = UIFont.italicSystemFont(ofSize: 16)
        exampleLabel.textColor = .white
        exampleLabel.textAlignment = .center
        exampleLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),

            phoneticLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 12),
            phoneticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            speakerButton.leadingAnchor.constraint(equalTo: phoneticLabel.trailingAnchor, constant: 8),
            speakerButton.centerYAnchor.constraint(equalTo: phoneticLabel.centerYAnchor),

            definitionLabel.topAnchor.constraint(equalTo: phoneticLabel.bottomAnchor, constant: 24),
            definitionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            definitionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            exampleLabel.topAnchor.constraint(equalTo: definitionLabel.bottomAnchor, constant: 16),
            exampleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            exampleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }

    // MARK: - Gestures and Word Handling
    private func setupGesture() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUp))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
    }

    private func loadWord() {
        let entry = words[currentIndex % words.count]
        wordLabel.text = entry.word
        phoneticLabel.text = entry.pronunciation
        definitionLabel.text = entry.definition
        exampleLabel.text = entry.example
    }

    @objc private func handleSwipeUp() {
        let feedback = UIImpactFeedbackGenerator(style: .medium)
        feedback.impactOccurred()

        UIView.animate(withDuration: 0.3,
                       animations: {
            self.overlayView.alpha = 0
            self.overlayView.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
        }, completion: { _ in
            self.currentIndex += 1
            self.loadWord()
            self.overlayView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.height)
            UIView.animate(withDuration: 0.3) {
                self.overlayView.transform = .identity
                self.overlayView.alpha = 1
            }
        })
    }

    @objc private func playPronunciation() {
        let entry = words[currentIndex % words.count]
        let utterance = AVSpeechUtterance(string: entry.word)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        audioPlayer.speak(utterance)
    }
}
