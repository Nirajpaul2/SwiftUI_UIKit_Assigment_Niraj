//
//  JsonFileReader.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

enum DemoError: Error {
    case badPath
    case noData
    case decodingFailed
}

// Protocol for reading JSON files
protocol JsonFileReaderProtocol {
    func getJsonFileData<T: Decodable>(file: String, type: String, completion: (Result<T, DemoError>) -> Void)
}

// Implementation of the JSON file reader
final class JsonFileReader: JsonFileReaderProtocol {
    let fileReaderProtocol: FileReaderProtocol
    let jsonDecoderProtocol: JsonDecoderProtocol

    init(fileReaderProtocol: FileReaderProtocol = FileReader(), jsonDecoderProtocol: JsonDecoderProtocol = JsonDecoder()) {
        self.fileReaderProtocol = fileReaderProtocol
        self.jsonDecoderProtocol = jsonDecoderProtocol
    }

    func getJsonFileData<T: Decodable>(file: String, type: String, completion: (Result<T, DemoError>) -> Void) {
        fileReaderProtocol.getDataFromJsonFile(file: file, type: type) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try self.jsonDecoderProtocol.decodeData(type: T.self, data: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            case .failure:
                completion(.failure(.noData))
            }
        }
    }
}

// Protocol for file reading
protocol FileReaderProtocol {
    func getDataFromJsonFile(file: String, type: String, completion: (Result<Data, DemoError>) -> Void)
}

// Implementation of the file reader
class FileReader: FileReaderProtocol {
    func getDataFromJsonFile(file: String, type: String, completion: (Result<Data, DemoError>) -> Void) {
        guard let path = Bundle.main.path(forResource: file, ofType: type) else {
            completion(.failure(.badPath))
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            completion(.success(data))
        } catch {
            completion(.failure(.noData))
        }
    }
}

// Protocol for JSON decoding
protocol JsonDecoderProtocol {
    func decodeData<T: Decodable>(type: T.Type, data: Data) throws -> T
}

// Implementation of the JSON decoder
class JsonDecoder: JsonDecoderProtocol {
    func decodeData<T: Decodable>(type: T.Type, data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
