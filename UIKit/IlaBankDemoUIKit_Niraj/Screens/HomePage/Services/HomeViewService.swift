//
//  HomeViewService.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

protocol HomeViewServiceProtocol {
    func getVehiclesData(file: String, type: String, completion: (Result<Vehicles, DemoError>) -> Void)
}

class HomeViewService: HomeViewServiceProtocol {
    private let jsonFileReaderProtocol: JsonFileReaderProtocol

    init(jsonFileReader: JsonFileReaderProtocol = JsonFileReader()) {
        self.jsonFileReaderProtocol = jsonFileReader
    }

    func getVehiclesData(file: String, type: String, completion: (Result<Vehicles, DemoError>) -> Void) {
        jsonFileReaderProtocol.getJsonFileData(file: file, type: type) { (result: Result<Vehicles, DemoError>) in
            switch result {
            case .success(let vehicles):
                completion(.success(vehicles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
