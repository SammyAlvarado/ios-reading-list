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


    // Step 3. Persistence Functions
    private var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask) .first else { return nil }
        return documentDirectory.appendingPathComponent("books.plist") // Am I suppose to use ReadingList.plist or books?
    }

    // Step 4. Save
    private func saveToPersistentStore() {
        guard let booksURL = readingListURL else { return }
        
        
        do {
            let booksEncoder = PropertyListEncoder()
            let booksData = try booksEncoder.encode(books)
            try booksData.write(to: booksURL)
        } catch {
            NSLog("Error saving Books List data: \(error)")
        }
    }
    
    // Step 5. Load
    private func loadFromPersistentStore() {
        let booksFileManager = FileManager.default
        guard let booksURL = readingListURL,
            booksFileManager.fileExists(atPath: booksURL.path) else { return }
        
        do {
            let booksData = try Data(contentsOf: booksURL)
            let decodedBooks = PropertyListDecoder()
            books = try decodedBooks.decode([Book].self, from: booksData)
        } catch {
            NSLog("Error saving Books List data: \(error)")
        }
    }
    
    
    
}


