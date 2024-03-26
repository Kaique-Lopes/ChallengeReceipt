//
//  ReceiptListViewController.swift
//  ChallengeReceipt
//
//  Created by Kaique Lopes de Oliveira on 23/03/24.
//

import UIKit

class ReceiptListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: ReceiptListViewModel!
    private let tableView = UITableView()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel = ReceiptListViewModel()
        viewModel.delegate = self
        viewModel.fetchReceipts()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        title = "Comprovantes"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReceiptTableViewCell.self, forCellReuseIdentifier: "ReceiptTableViewCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - TableView Delegate & DataSource

extension ReceiptListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfReceipts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTableViewCell", for: indexPath) as! ReceiptTableViewCell
        let receipt = viewModel.receipt(at: indexPath.row)
        cell.configure(with: receipt)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectReceipt(at: indexPath.row)
    }
}

// MARK: - Receipt List ViewModel Delegate

extension ReceiptListViewController: ReceiptListViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
    
    func navigateToDetailScreen(with receipt: Receipt) {
        let detailVC = ReceiptDetailViewController(receipt: receipt)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

