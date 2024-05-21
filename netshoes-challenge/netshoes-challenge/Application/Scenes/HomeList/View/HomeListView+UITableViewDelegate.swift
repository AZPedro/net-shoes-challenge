//
//  HomeListView+Delegate.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

extension HomeListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.homeListView(self, willDisplay: indexPath.row)
    }
    
}
