//
//  ReceiptListViewModel.swift
//  ChallengeReceipt
//
//  Created by Kaique Lopes de Oliveira on 23/03/24.
//

import Foundation

protocol ReceiptListViewModelDelegate: AnyObject {
    func reloadData()
    func navigateToDetailScreen(with receipt: Receipt)
}

class ReceiptListViewModel {
    
    weak var delegate: ReceiptListViewModelDelegate?
    private var receipts: [Receipt] = []
    
    func fetchReceipts() {
        guard let path = Bundle.main.path(forResource: "mocked_receipts", ofType: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let jsonData = try JSONDecoder().decode(DataObject.self, from: data)
            receipts = jsonData.data.receipts
            delegate?.reloadData()
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func numberOfReceipts() -> Int {
        return receipts.count
    }
    
    func receipt(at index: Int) -> Receipt {
        return receipts[index]
    }
    
    func didSelectReceipt(at index: Int) {
        let receipt = receipts[index]
        delegate?.navigateToDetailScreen(with: receipt)
    }
}

