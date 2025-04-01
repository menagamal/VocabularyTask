//
//  AccentViewControler.swift
//  Vocabulary
//
//  Created by Mena Gamal on 29/03/2025.
//
import UIKit
import AVKit

class AccentViewControler: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var continueButton: PrimaryButton!
    @IBOutlet weak var subtitleLabel: SecondaryLabel!
    @IBOutlet weak var titleLabel: PrimaryLabel!
    private var getStartedActions: VoidClosure?

    var audioPlayer: AVAudioPlayer?
    var currentlyPlayingIndex: IndexPath?
    var playbackTimer: Timer?

    var options: [VoiceOption] = [
        VoiceOption(name: "Brian", accent: "American", isSelected: true),
        VoiceOption(name: "Mia", accent: "American", isSelected: false),
        VoiceOption(name: "Amelia", accent: "British", isSelected: false),
        VoiceOption(name: "Frederick", accent: "British", isSelected: false),
        VoiceOption(name: "Paul", accent: "Australian", isSelected: false),
        VoiceOption(name: "Miriam", accent: "Australian", isSelected: false)
    ]

    private let viewModel: AccentViewModel

    init(viewModel: AccentViewModel, getStartedActions: @escaping VoidClosure) {
        self.getStartedActions = getStartedActions
        self.viewModel = viewModel
        super.init(nibName: "AccentViewControler", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }

    @IBAction func nextPageTapped(_ sender: PrimaryButton) {
        getStartedActions?()
    }

    func configureLayout() {
        titleLabel.text = viewModel.titleLabel
        subtitleLabel.text = viewModel.subTitleLabel
        continueButton.configureTitle(title: viewModel.buttonTitle)

        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = .none
        tableview.register(VoiceOptionCell.self, forCellReuseIdentifier: VoiceOptionCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.rowHeight = 72
    }

    func playOrPauseAudio(for name: String, at indexPath: IndexPath) {
        if let current = currentlyPlayingIndex, current == indexPath {
            if audioPlayer?.isPlaying == true {
                audioPlayer?.pause()
                stopPlaybackTimer()
            } else {
                audioPlayer?.play()
                startPlaybackTimer()
            }
            tableview.reloadRows(at: [indexPath], with: .none)
            return
        }

        audioPlayer?.stop()
        stopPlaybackTimer()

        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Missing file for \(name)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            currentlyPlayingIndex = indexPath
            tableview.reloadData()
            startPlaybackTimer()
        } catch {
            print("Audio error: \(error)")
        }
    }

    func startPlaybackTimer() {
        stopPlaybackTimer()
        playbackTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updatePlaybackProgress), userInfo: nil, repeats: true)
    }

    func stopPlaybackTimer() {
        playbackTimer?.invalidate()
        playbackTimer = nil
    }

    @objc func updatePlaybackProgress() {
        guard let indexPath = currentlyPlayingIndex,
              let player = audioPlayer,
              let cell = tableview.cellForRow(at: indexPath) as? VoiceOptionCell else {
            return
        }

        let progress = CGFloat(player.currentTime / player.duration)
        cell.updateProgress(progress)
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopPlaybackTimer()
        if let indexPath = currentlyPlayingIndex {
            currentlyPlayingIndex = nil
            tableview.reloadRows(at: [indexPath], with: .none)
        }
    }
}

extension AccentViewControler: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VoiceOptionCell.identifier, for: indexPath) as? VoiceOptionCell else {
            return UITableViewCell()
        }
        let isPlaying = (indexPath == currentlyPlayingIndex) && audioPlayer?.isPlaying == true

        cell.configure(with: options[indexPath.section], isPlaying: isPlaying)
        cell.onPlayTapped = { [weak self] in
            self?.playOrPauseAudio(for: self?.options[indexPath.section].name ?? "", at: indexPath)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<options.count {
            options[i].isSelected = (i == indexPath.section)
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacer = UIView()
        spacer.backgroundColor = .clear
        return spacer
    }
}
