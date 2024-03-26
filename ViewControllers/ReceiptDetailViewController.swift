//
//  ReceiptDetailViewController.swift
//  ChallengeReceipt
//
//  Created by Kaique Lopes de Oliveira on 23/03/24.
//

import UIKit

class ReceiptDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let receipt: Receipt
    private let detailLabel = UILabel()
    
    // MARK: - Initialization
    
    init(receipt: Receipt) {
        self.receipt = receipt
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes do Comprovante"
        view.backgroundColor = .white
        setupViews()
        configureDetailLabel()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        view.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            detailLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Configuration
    
    private func configureDetailLabel() {
        detailLabel.text = """
        Título: \(receipt.title)
        Nome: \(receipt.name)        
        Nome do favorecido: \(receipt.receiverName)
        Valor: \(receipt.amount)
        Data: \(receipt.date)
        Controle: \(receipt.control)
        ID da transação: \(receipt.receiptId)
        """
    }
}

