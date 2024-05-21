//
//  HomeListView+UITableDataSource.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

extension HomeListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeListTableViewCell.Constants.cellIdentifier, for: indexPath) as? HomeListTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }

}
