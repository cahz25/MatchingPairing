//
//  DBHelper.swift
//  DataLayer
//
//  Created by Cesar  Hurtado on 9/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation
import SQLite3


enum DBHelperError: Error {
    case couldNotInsertRow
    case statementCouldNotBePrepared
    case errorOpeningDatabase
}

public struct Scores {
    var id: Int
    var nickname: String
    var score: Int
}

class DBHelper
{
    init()
    {
        db = openDatabase()
        createTable()
    }

    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?

    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS scores(Id INTEGER PRIMARY KEY AUTOINCREMENT, nickname TEXT, score INTEGER);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("scores table created.")
            } else {
                print("scores table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insert(nickname: String, score: Int) throws
    {
        let insertStatementString = "INSERT INTO scores (nickname, score) VALUES (?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (nickname as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 2, Int32(score))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
                throw DBHelperError.couldNotInsertRow
            }
        } else {
            print("INSERT statement could not be prepared.")
            throw DBHelperError.statementCouldNotBePrepared
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read() throws -> [Scores] {
        let queryStatementString = "SELECT * FROM scores;"
        var queryStatement: OpaquePointer? = nil
        var psns : [Scores] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let nickname = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let score = sqlite3_column_int(queryStatement, 2)
                psns.append(Scores(id: Int(id), nickname: nickname, score: Int(score)))
                print("Query Result:")
                print("\(id) | \(nickname) | \(score)")
            }
        } else {
            print("SELECT statement could not be prepared")
            throw DBHelperError.statementCouldNotBePrepared
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM scores WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
}
