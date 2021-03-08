//
//  FileManager.swift
//  StepperControl
//
//  Created by Jeremy Boy on 08.03.21.
//

import Foundation

class FilesManager {
    enum Error: Swift.Error {
        case fileDoesNotExist
        case invalidDirectory
        case readFailed(reason: Swift.Error)
        case writeFailed(reason: Swift.Error)
    }
    
    let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    func load(fileNamed: String) throws -> Data {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            throw Error.invalidDirectory
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            debugPrint(error)
            throw Error.readFailed(reason: error)
        }
    }
    
    func save(fileNamed: String, data: Data) throws {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            throw Error.invalidDirectory
        }
        do {
            try data.write(to: url)
        } catch {
            debugPrint(error)
            throw Error.writeFailed(reason: error)
        }
    }
    private func makeURL(forFileNamed fileName: String) -> URL? {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(fileName)
    }
    
}
