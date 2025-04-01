//
//  OptionsViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import UIKit

class OptionsViewController: UIViewController {

    private  enum Sections: Int, CaseIterable {
        case tableTitles, options
    }

    @IBOutlet weak var tableView: UITableView!
    private let viewModel: OptionsViewModel
    private var getStartedActions: VoidClosure?


    init(viewModel: OptionsViewModel, getStartedActions: @escaping VoidClosure) {
        self.viewModel = viewModel
        self.getStartedActions = getStartedActions
        super.init(nibName: "OptionsViewController", bundle: nil)
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
        tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: "OptionTableViewCell")
        tableView.register(LabelsTableViewCell.self, forCellReuseIdentifier: "LabelsTableViewCell")

        tableView.dataSource = self
        tableView.delegate = self
        self.view.backgroundColor = UIColor(red: 245/255, green: 239/255, blue: 229/255, alpha: 1.0) // Approx background
    }
    
}


extension OptionsViewController: UITableViewDataSource, UITableViewDelegate {


    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionRawValue = Sections(rawValue: section)
        switch sectionRawValue {
        case .tableTitles:
            return 1
        case .options:
            return viewModel.options.count
        case .none:
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionRawValue = Sections(rawValue: indexPath.section)
        switch sectionRawValue {
        case .tableTitles:
            return getLabelsCell(tableView, cellForRowAt: indexPath)
        case .options:
            return getOptionCell(tableView, cellForRowAt: indexPath)
        case .none:
            return UITableViewCell()
        }
    }
}


// MARK: TableView Cells
private extension OptionsViewController {
    func getLabelsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LabelsTableViewCell", for: indexPath) as? LabelsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(
            title: viewModel.titleLabel,
            subTitle: viewModel.subTitleLabel
        )
        return cell
    }

    func getOptionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as? OptionTableViewCell else {
            return UITableViewCell()
        }
        let isSelected = viewModel.options[indexPath.row] == viewModel.selectedTitle
        cell.configure(with: viewModel.options[indexPath.row], isSelected: isSelected, delegate: self)
        return cell
    }
}

extension OptionsViewController: OptionTableViewCellDelegate {
    func didSelectOption(title: String) {
        viewModel.selectedTitle = title
        tableView.reloadData()
        tableView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.getStartedActions?()
        }
    }
}
