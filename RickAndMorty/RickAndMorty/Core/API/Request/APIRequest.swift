//
//  CharactersRequest.swift
//  RickAndMorty
//
//  Created by Juhyun Yun on 4/23/24.
//

import Foundation

enum APIRequest: Requestable {
    case getCharacters(page: Int, name: String?)
    case getMulitpleCharacters(ids: [Int])
    case getLocations(page: Int, name: String?)
    case getEpisodes(page: Int, name: String?)
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/api/character"
        case let .getMulitpleCharacters(ids):
            return "/api/character/\(ids)"
        case .getLocations:
            return "/api/location"
        case .getEpisodes:
            return "/api/episode"
        }
    }
    
    var urlParams: [String: String?] {
        switch self {
        case let .getCharacters(page, name):
            let params = ["page" : String(page), "name" : name]
            return params
        case .getMulitpleCharacters:
            return [:]
        case let .getLocations(page, name):
            let params = ["page" : String(page), "name" : name]
            return params
        case let .getEpisodes(page, name):
            let params = ["page" : String(page), "name" : name]
            return params
        }
    }
    
    var requestType: RequestType { .GET }
}
