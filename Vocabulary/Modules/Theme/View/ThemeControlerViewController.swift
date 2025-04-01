//
//  ThemeControlerViewController.swift
//  Vocabulary
//
//  Created by Mena Gamal on 29/03/2025.
//

import UIKit

class ThemeControlerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var continueButton: PrimaryButton!
    @IBOutlet weak var subTitleLabel: SecondaryLabel!
    @IBOutlet weak var titleLabel: PrimaryLabel!

    private var getStartedActions: VoidClosure?
//    let cardImages: [UIImage?] = [
//        UIColor(red: 245/255, green: 239/255, blue: 229/255, alpha: 1.0).image(),    // plain background
//        UIImage(named: "cozy_study"),
//        UIImage(named: "cozy_reading"),
//        UIImage(named: "library"),
//        UIImage(named: "david"),
//        UIColor.black.image() 
//    ]


    let playIconIndexes = [1, 2]
    lazy var themeCollectionView: UICollectionView  = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: 110, height: 175)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        collectionView.isScrollEnabled = false
        return collectionView
    }()


    private let viewModel: ThemeControlerViewModel
    init(viewModel: ThemeControlerViewModel, getStartedActions: @escaping VoidClosure) {
        self.getStartedActions = getStartedActions
        self.viewModel = viewModel
        super.init(nibName: "ThemeControlerViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }

    func configureLayout() {
        contentStackView.addArrangedSubview(themeCollectionView)
        themeCollectionView.heightAnchor.constraint(equalToConstant: 440).isActive = true

        titleLabel.text = viewModel.titleLabel
        subTitleLabel.text = viewModel.subTitleLabel
        continueButton.configureTitle(title: viewModel.buttonTitle)
        themeCollectionView.reloadData()
    }

    func imageAssetFor(index: Int) -> UIImage? {
        let option = viewModel.cardImages[index]
        if option.hasPrefix("#") {
            return UIColor.colorFromHex(option)?.image()
        } else {
            return UIImage(named: option)
        }
    }

    @IBAction func nextPageTapped(_ sender: PrimaryButton) {
        viewModel.setTheUserSelectedTheme()
        getStartedActions?()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cardImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell else {
            return UICollectionViewCell()
        }
        let image = imageAssetFor(index: indexPath.row)
        let showsCheckmark = indexPath.item == viewModel.selectedIndex
        let showsPlayIcon = playIconIndexes.contains(indexPath.item)
        cell.configure(image: image, showsCheckmark: showsCheckmark, showsPlayIcon: showsPlayIcon)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedIndex = indexPath.item
        collectionView.reloadData()
    }
}
extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
