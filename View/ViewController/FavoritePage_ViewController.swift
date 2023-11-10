
import UIKit

var SelectedEpisodes: [String] = []
class FavoritePage_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var FavfetchdataObj = fetchdataVM()
    var FPEpisodeList = [TopTenData]()
    var Season_EpisodeList = [SeasonsData]()
    var FavoriteListData: TopTenData?
    
   @IBOutlet var Favorite_pageTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavfetchdataObj.FavoritefetchData(id:FavoriteListData?.id) { [weak self] FPEpisodeList in
            self?.FPEpisodeList = FPEpisodeList
            DispatchQueue.main.async {
                self?.Favorite_pageTV.reloadData()
            }
        }
        
}
    @IBOutlet var FavoriteButton: UITabBarItem!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SelectedEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = Favorite_pageTV.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)as!Favorite_pageTableViewCell
            //let urlImage = URL(string: FPEpisodeList[indexPath.row].image.original)
        
        cell.Movie_Name?.text = SelectedEpisodes[indexPath.row]
        cell.movie_Season?.text = SelectedEpisodes[indexPath.row]
        //cell.Movie_Image.downloadImage(from: urlImage!)
        cell.movie_Date?.text=SelectedEpisodes[indexPath.row]
        
        // cell.movie_Date?.text = Season_EpisodeList[indexPath.row].airstamp
        if indexPath.row < FPEpisodeList.count {
            cell.movie_Date?.text = Season_EpisodeList[indexPath.row].airstamp
        } else {
            
            cell.movie_Date?.text = "Tuesday,March 25"
        }
        
        if indexPath.row < FPEpisodeList.count {
            cell.movie_Season?.text = "Season\(Season_EpisodeList[indexPath.row].season) , Episode\(Season_EpisodeList[indexPath.row].number)"
        } else {
            
            cell.movie_Season?.text = "Season 4,Episode 11"
        }
            //cell.movie_Date?.text = "\(FPEpisodeList[indexPath.row].schedule.days)"
//          cell.movie_Season?.text = "\(Season_EpisodeList[indexPath.row].season) , \(Season_EpisodeList[indexPath.row].number)"
        
        return cell
        }
}


