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
    }
    
    func setMenu(viewController: UIViewController) {
        addChild(viewController: viewController, to: menuView)
    }
    
    //    func setViewControllerFor(pageType: SubmenuBrowseConstants.BrowsePageType) {
    //        let nextIndex = output.getIndexOf(page: pageType)
    //        let direction: UIPageViewController.NavigationDirection = currentIndex > nextIndex ? .reverse : .forward
    //        currentIndex = nextIndex
    //        let viewController = orderedViewControllers[currentIndex]
    //        setViewControllers([viewController],
    //                           direction: direction,
    //                           animated: true,
    //                           completion: nil)
    //    }
    //
    //    func addViewController(_ viewController: UIViewController) {
    //        orderedViewControllers.append(viewController)
    //        if orderedViewControllers.count == output.pages.count {
    //            setViewControllerFor(pageType: output.pages.first!)
    //        }
    //    }
}
