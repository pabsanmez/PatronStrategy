//
//  MainTableViewController.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

  var viewModel = MainTableViewVM()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerCells()
    self.tableView.tableFooterView = UIView()
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
  }
  
  func registerCells() {
    for cellType in MainTableItemType.allValues{
      let nib = UINib(nibName: cellType.idCell, bundle: nil)
      self.tableView.register(nib, forCellReuseIdentifier: cellType.idCell)
    }
  }
}

extension MainTableViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = viewModel.getItems[indexPath.row]
    let cell = item.type.cellType.cellForTableView(tableView, cellForRowAt: indexPath, idCell: item.type.idCell)
    item.type.cellType.drawCell(cell: cell, withItem: item)
    return cell
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getItems.count
  }
}
