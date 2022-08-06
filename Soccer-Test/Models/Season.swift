//
//  Season.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import Foundation

struct DetailLeague:Codable {
    let name:String
    let desc:String
    let abbreviation:String
    let seasons:[Season]
}

struct Season:Codable{
    let year:Int
    let startDate:String
    let endDate:String
    let displayName:String
    let types:[SeasonType]
}

struct SeasonType:Codable{
    let id:String
    let name:String
    let abbreviation:String
    let startDate:String
    let endDate:String
    let hasStandings:Bool
}
