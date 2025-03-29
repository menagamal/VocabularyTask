//
//  EducationViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 29/03/2025.
//

import UIKit

class EducationViewController: UIViewController {

    @IBOutlet weak var continueButton: PrimaryButton!
    @IBOutlet weak var titleLabel: PrimaryLabel!
    private var getStartedActions: VoidClosure?

    init(getStartedActions: @escaping VoidClosure) {
        self.getStartedActions = getStartedActions
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
        titleLabel.text = "Tailor your words recommendations"
        continueButton.configureTitle(title: "Continue")
    }
}
