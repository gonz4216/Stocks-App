//
//  ViewController.swift
//  Stocks App
//
//  Created by Ethan Gonsalves on 2023-01-11.
//

import UIKit

class WatchListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpSeachController()
        setUpTitleView()
    }
    
    
    //MARK: Private
    private func setUpTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width-20, height: titleView.height))
        label.text = "Stocks"
        label.font = .systemFont(ofSize: 32)
        titleView.addSubview(label)
        navigationItem.titleView = titleView
    }
    private func setUpSeachController() {
        let resultVC = SearchResultsViewController()
        resultVC.delegate = self
        let searchVC = UISearchController(searchResultsController: resultVC)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
   
}


extension WatchListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultsVC = searchController.searchResultsController as?
                SearchResultsViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        //optimize to reduce number of searchers for when user stops typing
        
        // Call API to search
        APICaller.shared.search(query: query, completion: {result in
            switch result {
            case.success(let response):
                DispatchQueue.main.async {
                    resultsVC.update(with: response.result)
 
                }
            case .failure(let error):
                print(error)
            }
        })
        //update results controller
      
    }
}
extension WatchListViewController: SearchResultsViewControllerDelegate {
    func searchResultsViewControllerDidSelect(searchResults: SearchResult) {
        // Present Stock Details for given selection
        print("Did select: \(searchResults.displaySymbol)")
    }
}
