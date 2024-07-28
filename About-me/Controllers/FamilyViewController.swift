//
//  FamilyViewController.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 28/7/24.
//

import UIKit

class FamilyViewController: UIViewController {

    @IBOutlet weak var familyTableView: UITableView!
    let membersList = MemberList.memberInFam
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        familyTableView.dataSource = self
        familyTableView.register(FamilyTableViewCell.nib(), forCellReuseIdentifier: FamilyTableViewCell.identifier)
        
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FamilyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        membersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = familyTableView.dequeueReusableCell(withIdentifier: FamilyTableViewCell.identifier, for: indexPath) as! FamilyTableViewCell
        
        let image = membersList[indexPath.row].image
        
        cell.memberImageView.image = UIImage(named: image)
        cell.fullNameLabel.text = membersList[indexPath.row].fullName
        cell.jobLabel.text = membersList[indexPath.row].job
        
        let hobbiesStr = membersList[indexPath.row].hobbies.map { $0 }.joined(separator: ", ")
        cell.hobiesLabel.text = hobbiesStr
        
        return cell
    }
    
    
}
