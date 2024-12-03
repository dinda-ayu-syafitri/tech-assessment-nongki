//
//  InputView.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftUI

struct InputView: View {
    var body: some View {
        VStack(spacing: 32) {
            VStack(alignment: .leading) {
                Text("Nama")
                TextField("Masukkan nama anda", text: .constant(""))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                    }
            }

            VStack(alignment: .leading) {
                Text("Provinsi")
                SearchableDropdown(selectedOption: "Jawa Barat", options: ["Jawa Barat", "DKI Jakarta"])
            }

            VStack(alignment: .leading) {
                Text("Kota")
                SearchableDropdown(selectedOption: "Depok", options: ["Depok", "Bogor"])
            }

            Button(action: {}, label: {
                Text("Proses")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)

            })
            Spacer()
        }
        .padding(20)
        .onAppear(perform: {
            Task {
                do {
                    let provinsi = try await DaerahRemoteDataSource().getAllProvinsi()
                    print("Ini Provinsi", provinsi)
                } catch DaerahError.invalidURL {
                    print("Invalid URL")
                } catch DaerahError.invalidResponse {
                    print("Invalid Response")
                } catch DaerahError.invalidData {
                    print("Invalid Data")
                }
            }
        })
    }
}

#Preview {
    InputView()
}
