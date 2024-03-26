//
//  Receipt.swift
//  ChallengeReceipt
//
//  Created by Kaique Lopes de Oliveira on 23/03/24.
//

import Foundation

struct Receipt: Codable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
}

struct DataObject: Codable {
    let data: ReceiptData
}

struct ReceiptData: Codable {
    let receipts: [Receipt]
    let pagination: Pagination
}

struct Pagination: Codable {
    let page: Int
    let pageSize: Int
    let totalElements: Int
    let totalPages: Int
}

