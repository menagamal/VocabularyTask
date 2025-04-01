//
//  BaseViewControlerViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 29/03/2025.
//

import UIKit

class UsernameControlerViewController: UIViewController {

    @IBOutlet weak var subtitileLabel: SecondaryLabel!
    @IBOutlet weak var titleLabel: PrimaryLabel!
    @IBOutlet weak var continueButton: PrimaryButton!
    private let viewModel: UsernameControlerViewModel
    private var getStartedActions: VoidClosure?

    init(viewModel: UsernameControlerViewModel, getStartedActions: @escaping VoidClosure) {
        self.getStartedActions = getStartedActions
        self.viewModel = viewModel
        super.init(nibName: "UsernameControlerViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleKeyboard))
        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    @objc func handleKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    func configureLayout() {
        titleLabel.text = viewModel.titleLabel
        subtitileLabel.text = viewModel.subTitleLabel
        continueButton.configureTitle(title: viewModel.buttonTitle)
    }

    @IBAction func nextPageTapped(_ sender: PrimaryButton) {
        getStartedActions?()
    }
}
