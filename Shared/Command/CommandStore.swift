//
//  CommandReader.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import Foundation

public class CommandStore: ObservableObject {
    private static let filename = "commands.json"
    private static let defaultData = try! Data(contentsOf: Bundle.main.url(forResource: "commands", withExtension: "json")!)
    private static let defaultCommands =  try! JSONDecoder().decode([Command].self, from: CommandStore.defaultData)
    
    private let json = JSONLoader(fileManager: FilesManager(), filename: CommandStore.filename)
    
    @Published var commands: [Command]
    
    func reload() {
        let data: [Command] = json.load(orDefault: CommandStore.defaultCommands)
        self.commands = data
    }
    
    func append(_ command: Command) {
        commands.append(command)
    }
    
    func persist() {
        try? json.persist(data: commands)
    }
    
    init() {
        commands = json.load(orDefault: CommandStore.defaultCommands)
    }
}

private struct JSONLoader {
    let fileManager: FilesManager
    let filename: String
    func load<T: Decodable>(orDefault: T) -> T {
        do {
            let data = try fileManager.load(fileNamed: filename)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            return orDefault
        }
    }
    
    func persist<T: Encodable>(data: T) throws {
        let encoder = JSONEncoder()
        do {
            try fileManager.save(fileNamed: filename, data: encoder.encode(data))
        } catch {
            print(error)
            throw error
        }
    }
}
