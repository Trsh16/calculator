//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook Pro on 05/10/23.
//

import UIKit

class ViewController: UIViewController 
{

    @IBOutlet weak var yangdiitung: UILabel!
    @IBOutlet weak var hasilnya: UILabel!
    
    var hitung:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        hitung = ""
        yangdiitung.text = ""
        hasilnya.text = ""
    }
    
    @IBAction func samadengan(_ sender: Any)
    {
        if(validInput())
        {
            let checkHitungPersen = hitung.replacingOccurrences(of: "%", with: "*0,01")
            let expression = NSExpression(format: checkHitungPersen)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            hasilnya.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Input Tidak Valid", message: "Kalkulator tidak dapat menerima inputan", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in hitung
        {
            if(spesialKarakter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            if(index == hitung.count - 1)
            {
                return false
            }
            if(previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func spesialKarakter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }

    @IBAction func hapussemua(_ sender: Any) 
    {
        clearAll()
    }
    
    @IBAction func hapussatu(_ sender: Any) 
    {
        if(!hitung.isEmpty)
        {
            hitung.removeLast()
            yangdiitung.text = hitung
        }
    }
    
    func tambahkehitung(value: String)
    {
        hitung = hitung + value
        yangdiitung.text = hitung
    }
    
    @IBAction func plusmin(_ sender: Any) 
    {
        tambahkehitung(value: "+/-")
    }
    
    @IBAction func persen(_ sender: Any) 
    {
        tambahkehitung(value: "%")
    }
    
    @IBAction func bagi(_ sender: Any) 
    {
        tambahkehitung(value: "/")
    }
    
    @IBAction func kali(_ sender: Any) 
    {
        tambahkehitung(value: "*")
    }
    
    @IBAction func kurang(_ sender: Any) 
    {
        tambahkehitung(value: "-")
    }
    
    @IBAction func tambah(_ sender: Any) 
    {
        tambahkehitung(value: "+")
    }
    
    @IBAction func koma(_ sender: Any) 
    {
        tambahkehitung(value: ",")
    }
    
    @IBAction func angkanol(_ sender: Any) 
    {
        tambahkehitung(value: "0")
    }
    
    @IBAction func angkasatu(_ sender: Any) 
    {
        tambahkehitung(value: "1")
    }
    
    @IBAction func angkadua(_ sender: Any) 
    {
        tambahkehitung(value: "2")
    }
    
    @IBAction func angkatiga(_ sender: Any) 
    {
        tambahkehitung(value: "3")
    }
    
    @IBAction func angkaempat(_ sender: Any) 
    {
        tambahkehitung(value: "4")
    }
    
    @IBAction func angkalima(_ sender: Any) 
    {
        tambahkehitung(value: "5")
    }
    
    @IBAction func angkaenam(_ sender: Any) 
    {
        tambahkehitung(value: "6")
    }
    
    @IBAction func angkatujuh(_ sender: Any) 
    {
        tambahkehitung(value: "7")
    }
    
    @IBAction func angkadelapan(_ sender: Any) 
    {
        tambahkehitung(value: "8")
    }
    
    @IBAction func angkasembilan(_ sender: Any) 
    {
        tambahkehitung(value: "9")
    }
}

