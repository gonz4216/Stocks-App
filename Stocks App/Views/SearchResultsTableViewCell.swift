//
//  SearchResultsTableViewCell.swift
//  Stocks App
//
//  Created by Ethan Gonsalves on 2023-01-11.
//

import UIKit


class SearchResultsTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier:reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
