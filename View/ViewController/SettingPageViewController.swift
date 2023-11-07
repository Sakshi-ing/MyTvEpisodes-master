
import UIKit

class SettingPageViewController : UIViewController, UITableViewDataSource,UITableViewDelegate{
   
    @IBOutlet var SettingTV: UITableView!
    @IBOutlet var NeverButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let array1 = ["Never","Before 1 hour","Before 15 minutes","Before 5 minutes","After 2 hours","After 6 hours","After 12 hours"]

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array1[indexPath.row]
         return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        NeverButton.setTitle(cell?.textLabel?.text, for: .normal)
        self.SettingTV.isHidden = true
    }

    @IBAction func ButtonPressed(_ sender: Any) {
        //hiding and unhiding
        self.SettingTV.isHidden = !self.SettingTV.isHidden
    }
}
