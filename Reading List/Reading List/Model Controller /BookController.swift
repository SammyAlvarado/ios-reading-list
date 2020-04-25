//
//  BookController.swift
//  Reading List
//
//  Created by Sammy Alvarado on 4/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
class BookController: Codable {
    init() {
        self.loadFromPersistentStore()
    }
    
    
    var books: [Book] = []
    
    
    // CRUD
    // Step 6. Create
    @discardableResult func createBook(with title: String, reasonToRead: String, hasBeenRead: Bool = false) -> Book {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        self.saveToPersistentStore()
        return book
    }
    
//    func bookDataUpdate() {
//        guard let bookDelegate = b
//    }
    
    /*
     Add a "Delete" method that passes in a Book object as a parameter, and removes it from the books array.
     We'll need two "Update" methods:
     One is to update a Book object's hasBeenRead property. Call it updateHasBeenRead(for book: Book). It should simply swap the hasBeenRead value from false to true and vice-versa.
     The other is to edit the Book's title and/or reasonToRead properties.
     */
    
    

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


