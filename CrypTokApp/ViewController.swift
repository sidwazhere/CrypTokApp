//
//  ViewController.swift
//  CrypTokApp
//
//  Created by Sideeq on 12/15/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btc: UITextField!

    @IBOutlet weak var eth: UITextField!
    
    @IBOutlet weak var doge: UITextField!
    @IBOutlet weak var ada: UITextField!
    @IBOutlet weak var Investment: UILabel!
        
    @IBOutlet weak var BTCPrice: UILabel!
    
    
        
    @IBOutlet weak var ETHPrice: UILabel!
    
    
    @IBOutlet weak var DogePrice: UILabel!
    
    @IBOutlet weak var ADAPrice: UILabel!
    
    
    @IBAction func Crypto(_ sender: Any) {
        
        if let symbol = btc.text {
            
            getData(symbol : "btc")
       }
       if let symbol = eth.text {
            
            getData(symbol : "eth")
       }
       if let symbol = doge.text {
            
            getData(symbol : "doge")
       }
        if let symbol = doge.text {
            
            getData(symbol : "ada")
       }
        
    }
    
    @IBAction func Stocks(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    var url = "https://min-api.cryptocompare.com/data/price?tsyms=USD"
    
    func getData(symbol : String) {
        
        
        url = "\(url)&fsym=\(symbol)"
        //1. Initialize the URL
        guard let url = URL(string: url) else {return}
        
        //2. Initialize task and URL Session
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            //Check Optional
            
            guard let data = data, error == nil else {return}
            
            print("Data Recieved")
            
            do {
                
            let Result = try JSONDecoder().decode(APIResponse.self, from: data)
                
            print(Result.USD)
                

                
                DispatchQueue.main.async{
                    
                    
                self.BTCPrice.text! = "\(Result.USD)"
                self.ETHPrice.text! = "\(Result.USD)"
                self.DogePrice.text! = "\(Result.USD)"
                self.ADAPrice.text! = "\(Result.USD)"
        
    
                }
            }
            catch{
                
                print(error.localizedDescription)
                
            }
        

        }
        
        //Resume Task
        task.resume()
        
                //CLOSURE - create a function with function  with function
    }
    
    
    struct APIResponse : Codable {
        
        let USD : Float

        
}

}
