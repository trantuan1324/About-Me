//
//  HobbyViewController.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 29/7/24.
//

import UIKit

class HobbyViewController: UIViewController {
    
    let hobbiesList = HobbyList.hobbies
    @IBOutlet weak var hobbyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
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

extension HobbyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hobbiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = hobbyTableView.dequeueReusableCell(withIdentifier: HobbyTableViewCell.identifier, for: indexPath) as? HobbyTableViewCell else {
            return UITableViewCell()
        }
        
        let hobby = hobbiesList[indexPath.row]
        cell.binding(data: hobby)
        
        return cell
    }
    
    
}
