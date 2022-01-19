//
//  MainInterfaceViewController.swift
//
//  Created by Rudenko Elizabeth on 12/01/2022.
//

import UIKit

class MainInterfaceViewController: UIViewController, MainInterfaceViewInput {
    
    @IBOutlet private weak var menuView: UIView!
    @IBOutlet private weak var pageView: UIView!
    
    var orderedViewControllers = [UIViewController]()
    var currentIndex = 0
    let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                  navigationOrientation: .horizontal)
    
    var output: MainInterfaceViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        MainInterfaceModuleConfigurator().configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }
    
    // MARK: MainInterfaceViewInput
    func setupInitialState() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        addChild(viewController: pageViewController, to: pageView)
    }
    
    func setMenu(viewController: UIViewController) {
        addChild(viewController: viewController, to: menuView)
    }
    
    func setViewControllerFor(pageType: ItemType) {
        guard let nextIndex = MainInterfaceConstants.items.firstIndex(where: { $0.type == pageType }) else { return }
        let direction: UIPageViewController.NavigationDirection = currentIndex > nextIndex ? .reverse : .forward
        currentIndex = nextIndex
        let viewController = orderedViewControllers[currentIndex]
        pageViewController.setViewControllers([viewController],
                                              direction: direction,
                                              animated: true,
                                              completion: nil)
    }
    
    func addViewController(_ viewController: UIViewController) {
        orderedViewControllers.append(viewController)
        let items = MainInterfaceConstants.items
        if orderedViewControllers.count == items.count, let type = items.first?.type {
            setViewControllerFor(pageType: type)
        }
    }
}
