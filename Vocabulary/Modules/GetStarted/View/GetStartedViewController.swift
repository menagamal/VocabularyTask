//
//  GetStartedViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var getStartedButton: PrimaryButton!


    init() {
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
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 24)
        subTitleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        titleLabel.numberOfLines = 0
        titleLabel.text = "Expand your Vocabulary in 1 minute a day"
        subTitleLabel.text = "Learn 10,000+ new words with a new daily habit that takes just 1 minute"
        subTitleLabel.numberOfLines = 0
    }

    @IBAction func getStartedClicked(_ sender: PrimaryButton) {
    }



}
