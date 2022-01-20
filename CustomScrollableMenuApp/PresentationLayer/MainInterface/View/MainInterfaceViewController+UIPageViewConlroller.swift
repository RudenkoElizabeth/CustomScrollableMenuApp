//
//  MainInterfaceViewController+UIPageViewConlroller.swift
//  CustomScrollableMenuApp
//
//  Created by Elizaveta Rudenko on 14.01.2022.
//

import UIKit

// MARK: - UIPageViewControllerDataSource
extension MainInterfaceViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0, orderedViewControllers.count > previousIndex else { return nil }
        currentIndex = previousIndex
        return orderedViewControllers[currentIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard orderedViewControllers.count > nextIndex else { return nil }
        currentIndex = nextIndex
        return orderedViewControllers[currentIndex]
    }
}

// MARK: - UIPageViewControllerDelegate
extension MainInterfaceViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        let currentViewController = pageViewController.viewControllers?[0]
        guard completed, let viewContreller = currentViewController,
              let index = orderedViewControllers.firstIndex(of: viewContreller) else { return }
        output.changeSelected(item: index)
    }
}
