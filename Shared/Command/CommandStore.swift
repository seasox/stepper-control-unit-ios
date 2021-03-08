//
//  CommandReader.swift
//  StepperControl
//
//  Created by Jeremy Boy on 06.03.21.
//

import Foundation

public class CommandStore: ObservableObject {
    private static let filename = Bundle.main.url(forResource: "commands", withExtension: "json")!
    
    private let json = JSONLoader(filename: CommandStore.filename)
    
    @Published var commands: [Command]
    
    func reload() {
        let data: [Command] = json.load(orDefault: [])
        self.commands = data
    }
    
    func append(_ command: Command) {
        commands.append(command)
    }
    
    func persist() {
        try? json.persist(data: commands)
    }
    
    init() {
        commands = json.load(orDefault: [])
    }
}

private struct JSONLoader {
    let filename: URL
    func load<T: Decodable>(orDefault: T) -> T {
        do {
            let data = try Data(contentsOf: filename)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            return orDefault
        }
    }
    
    func persist<T: Encodable>(data: T) throws {
        let encoder = JSONEncoder()
        do {
            try encoder.encode(data).write(to: filename)
        } catch {
            print(error)
            throw error
        }
    }
}
