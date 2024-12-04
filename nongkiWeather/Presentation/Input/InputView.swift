//
//  InputView.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftUI

struct InputView: View {
    @StateObject var vm = DependencyInjection.shared.inputViewModel()

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
                SearchableDropdown(
                    selectedOption: $vm.selectedProvinsi,
                    options: vm.provinsi,
                    displayKey: \.name
                )
            }

            VStack(alignment: .leading) {
                Text("Kota")
                SearchableDropdown(
                    selectedOption: $vm.selectedKota,
                    options: vm.kota,
                    displayKey: \.name
                )
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
                try await vm.getProvinsi()
            }
        })
        .onChange(of: vm.selectedProvinsi) {
            Task {
                vm.selectedKota = nil
                try await vm.getKota(idProvinsi: vm.selectedProvinsi?.id ?? "")
            }
        }
    }
}

#Preview {
    InputView()
}
