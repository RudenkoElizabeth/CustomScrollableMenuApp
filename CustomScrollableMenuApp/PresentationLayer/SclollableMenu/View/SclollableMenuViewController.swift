//
//  SclollableMenuViewController.swift
//
//  Created by Rudenko Elizabeth on 22/11/2021.
//

import UIKit

class SclollableMenuViewController: UIViewController, SclollableMenuViewInput {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    var output: SclollableMenuViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: SclollableMenuViewInput
    func setupInitialState() {
        // Set selected first item by default
        setSelected(item: 0)
    }
    
    func setSelected(item: Int) {
        let indexPath = IndexPath(item: item, section: 0)
        collectionView.selectItem(at: indexPath,
                                  animated: true,
                                  scrollPosition: .centeredHorizontally)
    }
}

extension SclollableMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        output.getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = SclollableMenuConstants.cellIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                      for: indexPath) as! SclollableMenuCell
        cell.setupTitleLabel(text: output.getTitleFor(item: indexPath.item),
                             fontSize: CGFloat(output.menuItemsSize))
        return cell
    }
}

extension SclollableMenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        output.action(item: indexPath.item)
        collectionView.selectItem(at: indexPath,
                                  animated: true,
                                  scrollPosition: .centeredHorizontally)
    }
}

extension SclollableMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = output.getTitleFor(item: indexPath.item)
        let font = UIFont(name: "Helvetica", size: CGFloat(output.menuItemsSize))!
        let width = text.widthOfString(usingFont: font)
        let height = text.heightOfString(usingFont: font)
        return CGSize(width: width + 10, height: height)
    }
}
