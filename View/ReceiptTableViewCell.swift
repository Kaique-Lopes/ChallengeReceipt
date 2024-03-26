//
//  ReceiptTableViewCell.swift
//  ChallengeReceipt
//
//  Created by Kaique Lopes de Oliveira on 23/03/24.
//

import UIKit

class ReceiptTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let titleLabel = UILabel()
    private let receiverNameLabel = UILabel()
    private let amountLabel = UILabel()
    private let dateLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(receiverNameLabel)
        addSubview(amountLabel)
        addSubview(dateLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        receiverNameLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            receiverNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            receiverNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            amountLabel.topAnchor.constraint(equalTo: receiverNameLabel.bottomAnchor, constant: 8),
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            dateLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        amountLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        titleLabel.numberOfLines = 1
        receiverNameLabel.numberOfLines = 1
        amountLabel.numberOfLines = 1
        dateLabel.numberOfLines = 1
    }
    
    // MARK: - Configuration
    
    func configure(with receipt: Receipt) {
        titleLabel.text = receipt.title
        receiverNameLabel.text = "Nome do favorecido: \(receipt.receiverName)"
        amountLabel.text = "Valor: \(receipt.amount)"
        dateLabel.text = "Data: \(receipt.date)"
    }
}

