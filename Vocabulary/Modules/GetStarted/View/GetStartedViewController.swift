//
//  GetStartedViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import UIKit


typealias VoidClosure = () -> Void

class GetStartedViewController: UIViewController {

    @IBOutlet weak var subTitleLabel: SecondaryLabel!
    @IBOutlet weak var titleLabel: PrimaryLabel!
    @IBOutlet weak var getStartedButton: PrimaryButton!

    private var getStartedActions: VoidClosure?

    init(getStartedActions: @escaping VoidClosure) {
        self.getStartedActions = getStartedActions
        super.init(nibName: "GetStartedViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    func setupLayout() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        getStartedButton.configureTitle(title: "Get Started")
        titleLabel.text = "Expand your Vocabulary in 1 minute a day"
        subTitleLabel.text = "Learn 10,000+ new words with a new daily habit that takes just 1 minute"
    }

    @IBAction func getStartedClicked(_ sender: PrimaryButton) {
        getStartedActions?()
    }
}
