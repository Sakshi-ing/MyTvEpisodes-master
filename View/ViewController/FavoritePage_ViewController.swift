
import UIKit
var SelectedEpisode: String=""
class FavoritePage_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var FavfetchdataObj = fetchdataVM()
    var FPEpisodeList = [TopTenData]()
    var FavoriteListData: TopTenData?
    //var favoritelist=[Int:Bool]()
   @IBOutlet var Favorite_pageTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavfetchdataObj.FavoritefetchData(id:FavoriteListData?.id) { [weak self] FPEpisodeList in
            // Update the UI with the fetched data
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
        return SelectedEpisode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = Favorite_pageTV.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)as!Favorite_pageTableViewCell
            //let urlImage = URL(string: FPEpisodeList[indexPath.row].image.original)
            cell.Movie_Name.text=SelectedEpisode
            //cell.Movie_Image.downloadImage(from: urlImage!)
            //cell.movie_Date.text=SelectedEpisode
            //cell.Movie_Image.downloadImage(from: urlImage!)
           // cell.Movie_Name?.text = FPEpisodeList[indexPath.row].name
        
//            cell.movie_Date?.text = "\(FPEpisodeList[indexPath.row].schedule.days)"
          //cell.movie_Season?.text = "\(FPEpisodeList[indexPath.row].number) , \(FPEpisodeList[indexPath.row].episodeOrder)"
        
        return cell
        }
}


