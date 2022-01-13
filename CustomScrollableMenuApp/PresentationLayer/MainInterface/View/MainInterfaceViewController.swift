//
//  MainInterfaceViewController.swift
//
//  Created by Rudenko Elizabeth on 12/01/2022.
//

import UIKit

class MainInterfaceViewController: UIViewController, MainInterfaceViewInput {
    
    @IBOutlet private weak var menuView: UIView!
    @IBOutlet private weak var pageView: UIView!
    
    private var subtitleMenuView: SclollableMenuViewController?
    private var subtitleMenuModuleInput: SclollableMenuModuleInput?
    
    private var orderedViewControllers = [UIViewController]()
    private var currentIndex = 0
    
    var output: MainInterfaceViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        MainInterfaceModuleConfigurator().configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupMenu()
    }


    // MARK: MainInterfaceViewInput
    func setupInitialState() {
    }
    
    func setupMenu() {
        let identifier = "SclollableMenu"
        let viewController = UIViewController.instantiateFromStoryboard(identifier) as! SclollableMenuViewController
        let submenuItems: [SclollableMenuItem] = {
            var items = [SclollableMenuItem]()
            MainInterfaceConstants.BrowsePageType.allCases.forEach {
                let item = SclollableMenuItem(type: $0.rawValue,
                                              title: MainInterfaceConstants.submenuTitles[$0]!)
                items.append(item)
            }
            return items
        }()
        subtitleMenuModuleInput = SclollableMenuModuleConfigurator()
            .configureModuleForViewInput(viewInput: viewController,
                                         menuItems: submenuItems,
                                         menuItemsSize: 26,
                                         moduleOutput: self)
        addChild(viewController: viewController, to: menuView)
        subtitleMenuView = viewController
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

extension MainInterfaceViewController: SclollableMenuModuleOutput {
    func action(item: Int) {
        print("item \(item)")
    }
}

// MARK: - UIPageViewControllerDataSource
//extension MainViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
//            return nil
//        }
//        let previousIndex = viewControllerIndex - 1
//        guard previousIndex >= 0,
//            orderedViewControllers.count > previousIndex else {
//                return nil
//        }
//        currentIndex = previousIndex
//        return orderedViewControllers[currentIndex]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
//            return nil
//        }
//        let nextIndex = viewControllerIndex + 1
//        guard orderedViewControllers.count != nextIndex,
//            orderedViewControllers.count > nextIndex
//            else {
//                return nil
//        }
//        currentIndex = nextIndex
//        return orderedViewControllers[currentIndex]
//    }
//}
//
//// MARK: - UIPageViewControllerDelegate
//extension ViewController: UIPageViewControllerDelegate {
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            didFinishAnimating finished: Bool,
//                            previousViewControllers: [UIViewController],
//                            transitionCompleted completed: Bool) {
//        guard completed,
//            let currentViewController = pageViewController.viewControllers?[0],
//            let viewControllerIndex = orderedViewControllers.firstIndex(of: currentViewController) else {
//                return
//        }
//        output.changeSelected(item: viewControllerIndex)
//    }
//}
