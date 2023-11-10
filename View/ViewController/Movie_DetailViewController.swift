
import UIKit

class Movie_DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate   {
    
    @IBOutlet var seasonTV: UITableView!
    @IBOutlet var DetailBottomConst: NSLayoutConstraint!
    @IBOutlet var seasonBottomConst: NSLayoutConstraint!
    @IBOutlet var SeasonView: UIView!
    @IBOutlet var DetailView: UIView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var DmovieImage: UIImageView!
    @IBOutlet var Rating_label: UILabel!
    @IBOutlet var RatingImage: UIImageView!
    @IBOutlet var nextElinkLabel: UILabel!
    @IBOutlet var StatusLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var ScheduledLabel: UILabel!
    @IBOutlet var AirsOnLabel: UILabel!
    @IBOutlet var premieredLabel: UILabel!
    @IBOutlet var mDescLabel: UILabel!
    @IBAction func DetailButton(_ sender: Any) {
        DetailView.isHidden = false
        SeasonView.isHidden = true
        DetailBottomConst.constant = 5.0
        seasonBottomConst.constant = 0
    }
    
    @IBAction func SeasonButton(_ sender: Any) {
        DetailView.isHidden = true
        SeasonView.isHidden = false
        DetailBottomConst.constant = 0
        seasonBottomConst.constant = 5.0
        }
    @IBAction func ExpandTapped(_ sender: Any) {
    }
    
    var movieDetail:TopTenData?
    var SeasonViewData=[SeasonsData]()
    var Seasonfetchdata = fetchdataVM()
    var expandedRows = Set<Int>()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        Seasonfetchdata.SeasonfetchData(id: movieDetail?.id) { [weak self] SeasonViewData in
            // Update the UI with the fetched data
            self?.SeasonViewData = SeasonViewData
            DispatchQueue.main.async {
                self?.seasonTV.reloadData()
            }
        }
        if movieDetail?.image != nil
        {
            let urlImage = URL(string: (movieDetail?.image.original)!)
            DmovieImage.downloadImage(from: urlImage!)
            DmovieImage.contentMode = .scaleAspectFill

        }
        else{
            DmovieImage.image = UIImage(named: "no image")
        }
        movieNameLabel.text = movieDetail?.name
        mDescLabel.text = movieDetail?.summary
        StatusLabel.text = (movieDetail?.status).map { $0.rawValue }
        AirsOnLabel.text = movieDetail?.network?.name
        premieredLabel.text = movieDetail?.premiered
        
        //Ratings
        
        if let averageRating = movieDetail?.rating.average {
            Rating_label.text = String(averageRating)
        } else {
            Rating_label.text = nil // Handle the case where the rating is missing or nil
        }
        // Genre
        let genres = movieDetail?.genres.map { $0.rawValue }
        let genresString = genres?.joined(separator: ", ")
        genresLabel.text = genresString
        
        
        if let days = movieDetail?.schedule.days,
            let time = movieDetail?.schedule.time {
            let daysString = days.map { $0.rawValue }.joined(separator: ", ")
            ScheduledLabel.text = "\(daysString) at \(time)"
        } else {
            ScheduledLabel.text = nil
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


    //Season View
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return SeasonViewData.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpandableCell
        let item = SeasonViewData[indexPath.row]
        
        // For Date format
        
        let Episodedate = item.airstamp
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        if let date = dateFormatter.date(from: Episodedate) {
            dateFormatter.dateFormat = "EEEE, yyyy MMM d"
            let formattedDate = dateFormatter.string(from: date)
            cell.DateLabel.text = formattedDate
        } else {
            print("Invalid date format")
        }

        cell.SeasonLabel.text = "Season \(item.season)"
        cell.EpisodeLabel.text = item.name
        cell.SandELabel.text = "S\(item.season)E\(item.number)"
        cell.ExpandButton.tag = indexPath.row
        cell.ExpandButton.addTarget(self, action: #selector(expandButtonTapped), for: .touchUpInside)
        
        if expandedRows.contains(indexPath.row) {
            cell.SeasonLabel.numberOfLines = 0 // Show all lines when expanded
        } else {
            cell.SeasonLabel.numberOfLines = 3
        }
        return cell
    }
    @objc func expandButtonTapped(sender: UIButton) {
        let row = sender.tag

        if expandedRows.contains(row) {
            expandedRows.remove(row)
        } else {
            expandedRows.insert(row)
        }

        DispatchQueue.main.async {
            self.seasonTV.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        }
    }
    }
