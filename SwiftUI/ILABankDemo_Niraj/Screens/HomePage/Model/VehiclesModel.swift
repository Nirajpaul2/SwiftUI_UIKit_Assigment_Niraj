//
//  VehiclesModel.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//


// MARK: - Vehicles
struct Vehicles: Decodable {
    let vehicles: [Vehicle]
}

// MARK: - Vehicle
struct Vehicle: Decodable {
    let vehicleType, img: String
    let brands: [Brand]
}

// MARK: - Brand
struct Brand: Decodable {
    let brandName: String
}
