
import UIKit

class Movie_DetailViewController: UIViewController   {
    
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
  
    var movieDetail:TopTenData?
    //var SeasonsData:[SeasonData] = []
    struct SeasonDataList{
        var Opened = Bool()
        var Title = String()
        var SeactionData = [String]()
        }
    var SeasonViewData = [SeasonDataList]()
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        SeasonViewData = [SeasonDataList(Opened: false, Title: "Season 1", SeactionData: ["Episode 1","Episode 2","Episode 3","Episode 4"]),
                          SeasonDataList(Opened: false, Title: "Season 2", SeactionData: ["Episode 1","Episode 2","Episode 3","Episode 4"]),
                          SeasonDataList(Opened: false, Title: "Season 3", SeactionData: ["Episode 1","Episode 2","Episode 3","Episode 4"])]
  
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
        //nextElinkLabel.text = movieDetail?.links.nextepisode
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
    
}
//SeasonView
extension Movie_DetailViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return SeasonViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if SeasonViewData[section].Opened==true{
            return SeasonViewData[section].SeactionData.count + 1
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dataIndex = indexPath.row - 1
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                else {
                    return UITableViewCell()
            }
            cell.textLabel?.text = SeasonViewData[indexPath.section].Title
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                else {
                    return UITableViewCell()
            }
            cell.textLabel?.text = SeasonViewData[indexPath.section].SeactionData[dataIndex]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if SeasonViewData[indexPath.section].Opened == true{
                SeasonViewData[indexPath.section].Opened = false
                let sections = IndexSet.init(integer:indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
            else{
                SeasonViewData[indexPath.section].Opened = true
                let sections = IndexSet.init(integer:indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
}

