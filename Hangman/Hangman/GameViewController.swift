//
//  GameViewController.swift
//  Hangman
//
//  Created by marek on 11.03.2017.
//  Copyright © 2017 marek. All rights reserved.
//

import UIKit
import Alamofire

class GameViewController: UIViewController {
    
    //group
    var selectedGroup : String = "";
    //category
    var selectedCategory : String = "";
    //answer
    var riddleWord : String = "";
    //array with riddle
    var unknownLetter : [String]?
    //used letters
    var usedLetters: [String] = []
    //count of found letters
    var foundCorrectLetter : Int = 0
    
    
    @IBOutlet weak var used: UILabel!
    @IBOutlet weak var inputLetter: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBAction func checkLetter(_ sender: Any) {
        checkMyLetter(inputLetter.text!.uppercased())
    }
    
    func checkMyLetter(_ letter: String){
        var checkedLetter: String
        var countOfTypeLetter: Int = 0
        var inputWordLength: Int = 0
        
        inputWordLength = letter.characters.count
        inputLetter.text = ""
        
        //jesli wpisalem wiecej znakow niz 1 to sprawdza pierwszy
        if(inputWordLength > 1){
            checkedLetter = String(letter[letter.startIndex])
        //jesli wpisalem mniej znakow niz 1 to nic nie rob
        }else if(inputWordLength < 1){
            return
        }else{
            checkedLetter = letter
        }
        
        //jesli wpisana litera jest w tablicy uzytych liter - nic nie rob
        if(usedLetters.contains(checkedLetter)){
            return
        //w przeciwnym wypadku dodaj wpisana litere do tablicy uzytych liter
        }else{
            usedLetters.append(checkedLetter)
        }
        
        for i in 0..<riddleWord.characters.count{
            let currentIndex = riddleWord.characters.index(riddleWord.startIndex, offsetBy: i)
            //szukanie litery w zagadce
            if(String(riddleWord.uppercased()[currentIndex]) == checkedLetter){
                foundCorrectLetter += 1
                unknownLetter![i] = checkedLetter
                countOfTypeLetter += 1
                
            }
        }
    }
    
    override func viewDidLoad() {
        print(selectedGroup, selectedCategory)
        getWord()
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getWord(){
        let parameters = [
            "group": self.selectedGroup,
            "category": self.selectedCategory
        ]
        Alamofire.request("http://hayuna.pl/hangman/index.php", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseString { (response) in
            self.riddleWord = response.result.value!.uppercased()
            print(self.riddleWord)
            self.startUnknownLetters()
            
        }
    }

    func startUnknownLetters(){
        unknownLetter = [String](repeating: "_", count: riddleWord.characters.count);
        for letter in unknownLetter! {
            wordLabel.text?.append(letter+" ")
        }
    }
    
}
