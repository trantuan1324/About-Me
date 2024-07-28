//
//  AstronomyViewController.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 29/7/24.
//

import UIKit

class AstronomyViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var dayInfoTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func onAcceptClicked(_ sender: Any) {
        let date: String? = dayInfoTextView.text
        
        Task {
            do {
                let photoInfo = try await fetchPhotoInfo(data: date!)
                print("Successful!")
                resultTextView.text = String(describing: photoInfo?.description)
            } catch {
                print("Failed, error: \(error)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchPhotoInfo(data date: String) async throws -> PhotoInfo? {
        let url = URL(string: "https://api.nasa.gov/planetary/apod")!
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [
            "api_key": "ZU1RUvtii7GsCDYobocyTKCtLbqtZKOTCyjW0NHW",
            "date" : date
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data)
            
        return photoInfo
    }

}

enum PhotoInfoError: Error, LocalizedError {
    case itemNotFound
}
