//
//  EducationViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 29/03/2025.
//

import UIKit

class EducationViewController: UIViewController {

    @IBOutlet weak var educationImageView: UIImageView!
    @IBOutlet weak var continueButton: PrimaryButton!
    @IBOutlet weak var titleLabel: PrimaryLabel!
    private var getStartedActions: VoidClosure?
    private let viewModel: EducationViewModel
    init(viewModel: EducationViewModel, getStartedActions: @escaping VoidClosure) {
        self.getStartedActions = getStartedActions
        self.viewModel = viewModel
        super.init(nibName: "EducationViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }

    func configureLayout() {
        educationImageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.titleLabel
        continueButton.configureTitle(title: viewModel.buttonTitle)
    }

    @IBAction func nextPageTapped(_ sender: PrimaryButton) {
        getStartedActions?()
    }
}
