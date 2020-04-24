//
//  BookController.swift
//  Reading List
//
//  Created by Sammy Alvarado on 4/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
class BookController: Codable {
    var books: [Book] = []
    
    
    // CRUD


    // #3 Create a filename string for the plist, such as "ReadingList.plist" -- Not understading this task? 
    private var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask) .first else { return nil }
        return documentDirectory.appendingPathComponent("books.plist") // Am I suppose to use ReadingList.plist or books?
    }


    func saveToPersistentStore() {
        
    }
    
    
}


