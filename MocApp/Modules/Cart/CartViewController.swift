//
//  CartViewController.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 21.04.2024.
//

import UIKit

class CartViewController: UIViewController {
    
    let viewModel: CartViewModel = CartViewModelImp()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.identifire)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.identifire, for: indexPath) as? CartProductCell else {
            return UITableViewCell()
        }
        
        
        return cell
    }
    
    
    
}
