//
//  PageInterfaceViewController.swift
//
//  Created by Rudenko Elizabeth on 13/01/2022.
//

import UIKit

class PageInterfaceViewController: UIViewController, PageInterfaceViewInput {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var output: PageInterfaceViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: PageInterfaceViewInput
    func setupInitialState() {
        titleLabel.text = output.getTitle()
    }
}
