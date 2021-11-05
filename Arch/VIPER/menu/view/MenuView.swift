//
//  MenuView.swift
//  Arch
//
//  Created by specktro on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import UIKit

// MARK: MenuView class
final class MenuView: UIViewController {
  // MARK: - Properties
  var presenter: MenuPresenterProtocol?
  fileprivate var options: [String]?
  fileprivate weak var tableView: UITableView?
  
  // MARK: - Lifecycle nethods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
    presenter?.getMenuOptions()
  }
  
  // MARK: - Private methods
  private func setup() {
    title = "Patterns"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let tableView: UITableView = UITableView(frame: .zero)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
    self.tableView = tableView
    
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
}

// MARK: - MenuViewProtocol protocols
extension MenuView: MenuViewProtocol {
  func showMenu(_ options: [String]) {
    self.options = options
    tableView?.reloadData()
  }
}

// MARK: - UITableViewDataSource methods
extension MenuView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return options?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    var content = cell.defaultContentConfiguration()
    content.text = options?[indexPath.row]
    content.image = UIImage(systemName: "text.book.closed.fill")
    
    if let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title3)
        .withSymbolicTraits([.traitBold])?.withDesign(.rounded) {
      content.textProperties.font = UIFont(descriptor: descriptor, size: 0)
    }
    
    content.imageProperties.tintColor = .systemOrange
    
    cell.contentConfiguration = content
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let option: String = options?[indexPath.row] else {
      return
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
    presenter?.selected(option)
  }
}
