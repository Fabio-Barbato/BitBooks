//
//  Book.swift
//  Lso_Client
//
//  Created on 12/08/24.
//

import Foundation

struct Book: Identifiable, Codable {
    var id: String { ISBN }
    let title: String
    let ISBN: String
    let author: String
    let genre: String
    let copies: Int
    let given_copies: Int
    let cover: String
}



