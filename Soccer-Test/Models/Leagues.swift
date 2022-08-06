//
//  Leagues.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import Foundation

struct League:Codable{
    let id:String
    let name:String
    let slug:String
    let abbr:String
    let logos:LogoStyle
}

struct LogoStyle:Codable {
    let light:String
    let dark:String
}
