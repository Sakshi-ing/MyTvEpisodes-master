//
//  FavoriteData.swift
//  MyTvEpisodes
//
//  Created by mac os on 03/11/23.
//  Copyright © 2023 AtosSyntel. All rights reserved.
//

import Foundation
struct FavoriteData : Codable,String{
    
    let id: Int
    let url: String
    let number: Int
    let name: String
    let episodeOrder: Int
    let premiereDate, endDate: String
//    let network: Network
    let webChannel: NSNull
//    let image: Image
    let summary: String
//    let links: Links
}


//struct Image {
//    let medium, original: String
//}


//struct Links {
//    let linksSelf: SelfClass
//}


struct SelfClass {
    let href: String
}


//struct Network {
//    let id: Int
//    let name: String
//    let country: Country
//    let officialSite: String
//}


//struct Country {
//    let name, code, timezone: String
//}


