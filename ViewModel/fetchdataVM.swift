
import Foundation
class fetchdataVM
{
    var urlSession: URLSession = URLSession.shared
    var episodeList = [TopTenData]()
    var SeasonList = [SeasonsData]()
    var favoriteEpisode = [TopTenData]()
   
    
    func fetchData(completion: @escaping ([TopTenData]) -> Void) {
        let url = URL(string: "https://api.tvmaze.com/shows")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error occurred while accessing data with URL")
                return
            }
            
            do {
                let TTepisodeData = try JSONDecoder().decode([TopTenData].self, from: data)
                print(TTepisodeData)
                self.episodeList = TTepisodeData
                completion(TTepisodeData) // Call the completion handler with the fetched data
            } catch {
                print("Error occurred while decoding JSON into Swift: \(error)")
            }
        })
        dataTask.resume()
    }
    
    //for Season view

    func SeasonfetchData(id:Int?,completion: @escaping ([SeasonsData]) -> Void) {

        
        let url = URL(string: "https://api.tvmaze.com/shows/\(id!)/episodes")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error occurred while accessing data with URL")
                return
            }

            do {
                let SeasonListData = try JSONDecoder().decode([SeasonsData].self, from: data)
                print(SeasonListData)
                self.SeasonList = SeasonListData
                completion(SeasonListData) // Call the completion handler with the fetched data
            } catch {
                print("Error occurred while decoding JSON into Swift: \(error)")
            }
        })
        dataTask.resume()
    }
    
    //for Favorite page
    
    func FavoritefetchData(id:Int?,completion: @escaping ([TopTenData]) -> Void) {
       
        let url = URL(string: "https://api.tvmaze.com/shows/1")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error occurred while accessing data with URL")
                return
            }
            do {
//                 let FavoriteListData = try JSONDecoder().decode([TopTenData].self, from: data)
                let FavoriteListData = try JSONDecoder().decode([TopTenData].self, from: data)

                print(FavoriteListData)
                self.favoriteEpisode = FavoriteListData
                completion(FavoriteListData) // Call the completion handler with the fetched data
            } catch {
                print("Error occurred while decoding JSON into Swift: \(error)")
            }
        })
        dataTask.resume()
    }
    
    
    
    
//    func FavoritefetchData(id: Int?, completion: @escaping ([TopTenData]?) -> Void) {
//
//        guard let Id = id
//
//        else {
//            print("ID is nil")
//            completion(nil)
//            return
//        }
//
//        if let url = URL(string: "https://api.tvmaze.com/shows/\(Id)/seasons") {
//            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let data = data, error == nil else {
//                    print("Error occurred while accessing data with URL")
//                    completion(nil)
//                    return
//                }
//
//                do {
//                    let favoriteListData = try JSONDecoder().decode([TopTenData].self, from: data)
//                    print(favoriteListData)
//                    completion(favoriteListData)
//                } catch {
//                    print("Error occurred while decoding JSON into Swift: \(error)")
//                    completion(nil)
//                }
//            }
//            dataTask.resume()
//        } else {
//            print("Invalid URL")
//            completion(nil)
//        }
//    }

}
