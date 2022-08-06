//
//  Standings.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import Foundation

//{
//            "team":{
//               "id":"9785",
//               "uid":"s:600~t:9785",
//               "location":"Atlético Tucumán",
//               "name":"Atlético Tucumán",
//               "abbreviation":"CAT",
//               "displayName":"Atlético Tucumán",
//               "shortDisplayName":"Atl Tucumán",
//               "isActive":true,
//               "logos":[
//                  {
//                     "href":"https://a.espncdn.com/i/teamlogos/soccer/500/9785.png",
//                     "width":500,
//                     "height":500,
//                     "alt":"",
//                     "rel":[
//                        "full",
//                        "default"
//                     ],
//                     "lastUpdated":"2019-05-08T16:07Z"
//                  }
//               ]
//            },
//            "stats":[
//               {
//                  "name":"wins",
//                  "displayName":"Wins",
//                  "shortDisplayName":"W",
//                  "description":"Team's current Win-Loss record",
//                  "abbreviation":"W",
//                  "type":"wins",
//                  "value":7,
//                  "displayValue":"7"
//               },
//               {
//                  "name":"losses",
//                  "displayName":"Losses",
//                  "shortDisplayName":"L",
//                  "description":"Losses",
//                  "abbreviation":"L",
//                  "type":"losses",
//                  "value":0,
//                  "displayValue":"0"
//               },
//               {
//                  "name":"ties",
//                  "displayName":"Draws",
//                  "shortDisplayName":"D",
//                  "description":"Draws",
//                  "abbreviation":"D",
//                  "type":"ties",
//                  "value":4,
//                  "displayValue":"4"
//               },
//               {
//                  "name":"gamesPlayed",
//                  "displayName":"Games Played",
//                  "shortDisplayName":"GP",
//                  "description":"Games Played",
//                  "abbreviation":"GP",
//                  "type":"gamesplayed",
//                  "value":11,
//                  "displayValue":"11"
//               },
//               {
//                  "name":"pointsFor",
//                  "displayName":"Goals For",
//                  "shortDisplayName":"F",
//                  "description":"Goals For",
//                  "abbreviation":"F",
//                  "type":"pointsfor",
//                  "value":12,
//                  "displayValue":"12"
//               },
//               {
//                  "name":"pointsAgainst",
//                  "displayName":"Goals Against",
//                  "shortDisplayName":"A",
//                  "description":"Goals Against",
//                  "abbreviation":"A",
//                  "type":"pointsagainst",
//                  "value":3,
//                  "displayValue":"3"
//               },
//               {
//                  "name":"points",
//                  "displayName":"Points",
//                  "shortDisplayName":"P",
//                  "description":"Points",
//                  "abbreviation":"P",
//                  "type":"points",
//                  "value":25,
//                  "displayValue":"25"
//               },
//               {
//                  "name":"rankChange",
//                  "displayName":"Rank Change",
//                  "shortDisplayName":"Rank Change",
//                  "description":"Rank Change",
//                  "abbreviation":"RC",
//                  "type":"rankchange",
//                  "value":0,
//                  "displayValue":"0"
//               },
//               {
//                  "name":"rank",
//                  "displayName":"Rank",
//                  "shortDisplayName":"Rank",
//                  "description":"Rank",
//                  "abbreviation":"R",
//                  "type":"rank",
//                  "value":1,
//                  "displayValue":"1"
//               },
//               {
//                  "name":"pointDifferential",
//                  "displayName":"Goal Difference",
//                  "shortDisplayName":"GD",
//                  "description":"Goal Difference",
//                  "abbreviation":"GD",
//                  "type":"pointdifferential",
//                  "value":9,
//                  "displayValue":"+9"
//               },
//               {
//                  "name":"deductions",
//                  "displayName":"Point Deductions",
//                  "shortDisplayName":"Deductions",
//                  "description":"Point Deductions",
//                  "abbreviation":"PD",
//                  "type":"deductions",
//                  "value":0,
//                  "displayValue":""
//               },
//               {
//                  "name":"ppg",
//                  "displayName":"Points Per Game",
//                  "shortDisplayName":"PPG",
//                  "description":"Points Per Game",
//                  "abbreviation":"PPG",
//                  "type":"ppg",
//                  "value":0,
//                  "displayValue":"0"
//               },
//               {
//                  "id":"0",
//                  "name":"All Splits",
//                  "abbreviation":"Total",
//                  "displayName":"Overall",
//                  "shortDisplayName":"OVER",
//                  "description":"Overall Record",
//                  "type":"total",
//                  "summary":"7-4-0",
//                  "displayValue":"7-4-0"
//               }
//            ]
//         }



struct DetailSeason:Codable{
    let name:String
    let abbreviation:String
    let seasonDisplay:String
    let season:Int
    let standings:[Standing]
}

struct Standing:Codable{
    let team:Team
    let stats:[Stat]
}

struct Team:Codable{
    let id:String
    let uid:String
    let location:String
    let name:String
    let abbreviation:String
    let displayName:String
    let shortDisplayName:String
    let isActive:Bool
    let logos:[Logo]
}

struct Stat:Codable{
    let id:String?
    let summary:String?
    let name:String
    let displayName:String
    let shortDisplayName:String
    let description:String
    let abbreviation:String
    let type:String
    let value:Int?
    let displayValue:String
}

struct Logo:Codable{
    let href:String
    let width:Int
    let height:Int
    let alt:String
    let rel:[String]
    let lastUpdated:String
}
