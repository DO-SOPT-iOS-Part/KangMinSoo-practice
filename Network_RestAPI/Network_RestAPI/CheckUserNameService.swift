//
//  CheckUserNameService.swift
//  Network_RestAPI
//
//  Created by 강민수 on 11/11/23.
//

import Foundation

class CheckUserNameService {
    static let shared = CheckUserNameService()
    private init() {}
    
    func makeRequest(userName: String) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members/check?username=\(userName)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func PostRegisterData(userName: String) async throws -> Bool {
        do {
            let request = self.makeRequest(userName: userName)
            let (data, response) = try await URLSession.shared.data(for: request)
            //dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            //dump(response)
            return parseUserInfoData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseUserInfoData(data: Data) -> Bool {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(UserCheckModel.self, from: data)
            return result.isExist
        } catch {
            print(error)
            return false
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}

