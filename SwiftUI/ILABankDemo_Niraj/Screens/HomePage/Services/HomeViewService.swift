//
//  HomeViewService.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

protocol HomeViewServiceDelegate {
    func getVehiclesData(fileName: String, fileType: String, completion: (Result<Vehicles, DemoError>) -> Void)
}

class HomeViewService: HomeViewServiceDelegate {
    private let jsonFileReader: JsonFileReaderProtocol

    init(jsonFileReader: JsonFileReaderProtocol = JsonFileReader()) {
        self.jsonFileReader = jsonFileReader
    }

    func getVehiclesData(fileName: String, fileType: String, completion: (Result<Vehicles, DemoError>) -> Void) {
        jsonFileReader.getJsonFileData(file: "DataResponse", type: "json") { (result: Result<Vehicles, DemoError>) in
            switch result {
            case .success(let vehicles):
                completion(.success(vehicles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

