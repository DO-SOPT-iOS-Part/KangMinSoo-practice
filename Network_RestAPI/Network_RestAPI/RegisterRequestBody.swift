//
//  RegisterRequestBody.swift
//  Network_RestAPI
//
//  Created by 강민수 on 11/11/23.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
