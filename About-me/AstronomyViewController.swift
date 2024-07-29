//
//  AstronomyViewController.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 29/7/24.
//

import UIKit

class AstronomyViewController: UIViewController {

    @IBOutlet weak var astroImageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTextView.isHidden = true
        astroImageView.isHidden = true
        titleLabel.isHidden = true
        
        datePicker.maximumDate = Date()
        
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func onAcceptClicked(_ sender: Any) {
        
        let date = datePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFormatter.string(from: date)
        print(dateStr)

        
        Task {
            do {
                guard let photoInfo = try await fetchPhotoInfo(data: dateStr) else {
                    return
                }
                
                resultTextView.isHidden = false
                titleLabel.isHidden = false
                
                downloadImage(from: photoInfo.url)
        
                print("Successful!")
                resultTextView.text = String(describing: photoInfo.description)
                titleLabel.text = String(describing: photoInfo.title)
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
            self.astroImageView.isHidden = false
            self.astroImageView.image = UIImage(named: "load_error")
            resultTextView.text = "Không tìm được dữ liệu :(("
            titleLabel.text = "Có gì đó sai sai"
            throw PhotoInfoError.itemNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data)
            
        return photoInfo
    }
    
    func downloadImage(from imgURL: URL) {
        let task = URLSession.shared.dataTask(with: imgURL) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "No error description")")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.astroImageView.isHidden = false
                    self.astroImageView.image = image
                }
            }
        }
        
        task.resume()
    }

}

enum PhotoInfoError: Error, LocalizedError {
    case itemNotFound
}
