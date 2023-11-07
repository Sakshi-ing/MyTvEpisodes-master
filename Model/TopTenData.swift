import Foundation

struct TopTenData : Codable {
    let id: Int
    let url: String
    let name: String
    let type: TypeEnum
    let language: Language
    let genres: [Genre]
    let status: Status
    let runtime: Int?
    let averageRuntime: Int
    let premiered: String
    let ended: String?
    let officialSite: String?
    let schedule: Schedule
    let rating: Rating
    let weight: Int
    let network, webChannel: Network?
    let dvdCountry: Country?
    let externals: Externals
    let image: Image
    let summary: String
    let updated: Int
    
//    let number : Int
//    let episodeOrder : Int
}
struct Country :Codable{
    let name: String
    let code: Code
    let timezone: Timezone
}

enum Code : String, Codable{
    case ca
    case de
    case fr
    case gb
    case jp
    case us
    case US
    case CA
    case DE
    case FR
    case GB
    case JP
}

enum Timezone : String, Codable{
    case americaHalifax
    case americaNewYork
    case asiaTokyo
    case europeBusingen
    case europeLondon
    case europeParis
   
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        if let matchingCase = Timezone(rawValue: rawValue) {
            self = matchingCase
        } else {
            self = .americaHalifax
        }
    }
}

struct Externals :  Codable {
    let tvrage: Int
    let thetvdb: Int?
    let imdb: String?
}

enum Genre : String, Codable{
    case action
    case adventure
    case anime
    case comedy
    case crime
    case drama
    case espionage
    case family
    case fantasy
    case history
    case horror
    case legal
    case medical
    case music
    case mystery
    case romance
    case scienceFiction
    case sports
    case supernatural
    case thriller
    case war
    case western

    static let caseInsensitiveMapping: [String: Genre] = [
        "action": .action,
        "adventure": .adventure,
        "anime": .anime,
        "comedy": .comedy,
        "crime": .crime,
        "drama": .drama,
        "espionage": .espionage,
        "family": .family,
        "fantasy": .fantasy,
        "history": .history,
        "horror": .horror,
        "legal": .legal,
        "medical": .medical,
        "music": .music,
        "mystery": .mystery,
        "romance": .romance,
        "science-fiction": .scienceFiction,
        "sports": .sports,
        "supernatural": .supernatural,
        "thriller": .thriller,
        "war": .war,
        "western": .western
    ]

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)

        // Perform a case-insensitive comparison to match enum cases
        if let matchingCase = Genre.caseInsensitiveMapping[rawValue.lowercased()] {
            self = matchingCase
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid Genre value: \(rawValue)")
        }
    }
}
struct Image: Codable {
    let medium, original: String
}

enum Language : String, Codable {
    case english
    case japanese
    case English
    case Japanese
}
struct Links:  Codable{
    let linksSelf, previousepisode: Nextepisode?
    let nextepisode: Nextepisode?
}

struct Nextepisode:  Codable {
    let href: String
}

struct Network :Codable{
    let id: Int?
    let name: String?
    let country: Country?
    let officialSite: String?
}

struct Rating : Codable{
    let average: Double?
}

struct Schedule : Codable{
    let time: String
    let days: [Day]
}

enum Day : String, Codable {
    case friday
    case monday
    case saturday
    case sunday
    case thursday
    case tuesday
    case wednesday
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        // Perform a case-insensitive comparison to match enum cases
        if let matchingCase = Day(rawValue: rawValue.lowercased()) {
            self = matchingCase
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid Day value: \(rawValue)")
        }
    }
}

enum Status : String, Codable {
    case ended
    case running
    case Ended
    case Running
}

enum TypeEnum : String, Codable{
    case animation
    case documentary
    case reality
    case scripted
    case talkShow
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let rawValue = try? container.decode(String.self), let value = TypeEnum(rawValue: rawValue) {
            self = value
        } else {
            self = .scripted
        }
}

}

//struct SeasonData : Codable {
//    let id: Int
//    let url: String
//    let number: Int
//    let name: String
//    let episodeOrder: Int
//    let premiereDate, endDate: String
//}
