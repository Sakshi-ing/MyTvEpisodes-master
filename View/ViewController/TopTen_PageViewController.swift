
import UIKit
import Foundation

class TopTen_PageViewController: UIViewController {
    var fetchdataVMObj = fetchdataVM()
    var episodeList = [TopTenData]()
    var Season_EpisodeList = [SeasonsData]()
    @IBOutlet var topTenTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdataVMObj.fetchData { [weak self] episodeList in
            // Update the UI with the fetched data
            self?.episodeList = episodeList
            DispatchQueue.main.async {
                self?.topTenTableView.reloadData()
            }
        }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
}

extension UIImageView
{
    func downloadImage(from url:URL)
    {
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url,completionHandler :{
            (data,response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode==200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
                else{
                    return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        })
        dataTask.resume()
    }
}

extension TopTen_PageViewController: UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topTenTableView.dequeueReusableCell(withIdentifier: "topTenCell", for:indexPath)as!TopTen_TableViewCell
        
        
        if episodeList[indexPath.row].image != nil
        {
            //for Add Button
            cell.AddButton.tag = indexPath.row
            cell.AddButton.addTarget(self, action: #selector(addButton), for: .touchUpInside)
            
            let urlImage = URL(string: episodeList[indexPath.row].image.original)
            cell.TTimage.downloadImage(from: urlImage!)
            cell.TTimage.contentMode = .scaleToFill
            cell.TTimage.layer.cornerRadius = 30
            cell.TTid.text = "\(episodeList[indexPath.row].id)."
            cell.TTmovieName.text = episodeList[indexPath.row].name
           
            
            //for genre
            let genres = episodeList[indexPath.row].genres.map { $0.rawValue }
            let genresString = genres.joined(separator: ", ")
            cell.TTgenresName.text = genresString
            
            //for rating
            if let rating = episodeList[indexPath.row].rating.average {
                cell.TTratings.text = String(rating)
            } else {
                cell.TTratings.text = nil
            }
        }
        else{
            cell.TTimage.image = UIImage(named: "no image")
        }
        return cell
    }
    @objc func addButton(sender:UIButton){
        
        let indexpath1 = IndexPath(row: sender.tag, section: 0)
        SelectedEpisode = episodeList[indexpath1.row].name
//        SelectedEpisode = "\(episodeList[indexpath1.row].image)"
//        SelectedEpisode = "\(episodeList[indexpath1.row].schedule.days)"
        
         let home = self.storyboard?.instantiateViewController(withIdentifier: "favoriteSegue")as! FavoritePage_ViewController
        self.navigationController?.pushViewController(home, animated: true)
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Movie_DetailViewController")as? Movie_DetailViewController
        vc?.movieDetail = episodeList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
        }
    
}

