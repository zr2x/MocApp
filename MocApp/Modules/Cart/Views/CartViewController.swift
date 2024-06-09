//
//  CartViewController.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 21.04.2024.
//

import UIKit

class CartViewController: UIViewController {
    
    let viewModel: CartViewModel
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.identifire)
        
        return tableView
    }()
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        setupTableView()
        setupConstraints()
        viewModel.fetchProducts()
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
        viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.identifire, for: indexPath) as? CartProductCell else {
            return UITableViewCell()
        }
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
