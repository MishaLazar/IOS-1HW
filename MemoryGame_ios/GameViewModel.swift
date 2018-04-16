//
//  GameViewModel.swift
//  MemoryGame_ios
//
//  Created by admin on 11/04/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//


import Foundation
import UIKit

class GameViewModel{
    
    var imageCount:Int = 0
    var defaultCount:Int = 3
    var defaulMultiplier:Int = 4
    
    var imageArr = [Card]()
    var indexArr:[Int]
    
    init(imageCounter:Int) {
       
        self.imageCount = imageCounter
        
        if imageCount > 0 {
    
            indexArr  = [Int](repeating: -1, count: imageCount  * defaulMultiplier)
            
        } else {
            
            indexArr  = [Int](repeating: -1, count: defaultCount * defaulMultiplier)

        }
        
        setRandomCardIndex()
        setCardImages()
    }
    private func setCardImages(){
        for cardIndex in indexArr { // UIImage(named: "pic_\(cardIndex)"
            imageArr.append(Card(cardIndex: cardIndex, cardId: cardIndex, cardPicName: "pic_\(cardIndex)") )
        }
    }
    private func setRandomCardIndex(){
        let imageNumber:Int = indexArr.count / 2
        let cellNumber:Int = indexArr.count
            while indexArr.contains(Int(-1)) {
                var cardindex = Int(arc4random_uniform(UInt32(imageNumber)))
                let cellindex1 = Int(arc4random_uniform(UInt32(cellNumber)))
                let cellindex2 = Int(arc4random_uniform(UInt32(cellNumber)))
                cardindex += 1
                if (cellindex1 != cellindex2)
                {
                    if (!indexArr.contains(Int(cardindex)) && indexArr[cellindex1] == -1 && indexArr[cellindex2] == -1){
                        indexArr[cellindex1] = cardindex
                        indexArr[cellindex2] = cardindex
                    }
                }
            }
    }
}
