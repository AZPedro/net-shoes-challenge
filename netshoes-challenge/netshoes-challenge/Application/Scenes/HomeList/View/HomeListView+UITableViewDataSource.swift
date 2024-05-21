//
//  HomeListView+UITableDataSource.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

extension HomeListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeListTableViewCell.Constants.cellIdentifier, for: indexPath) as? HomeListTableViewCell else {
            return UITableViewCell()
        }
        
        let model = models[indexPath.row]
        cell.model = .init(name: model.name, 
                           quantity: model.quantity)
        
        return cell
    }

}
