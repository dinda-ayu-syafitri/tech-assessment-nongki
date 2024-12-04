//
//  InputView.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftUI

struct InputView: View {
    @StateObject var vm = DependencyInjection.shared.inputViewModel()
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 32) {
            VStack(alignment: .leading) {
                Text("Nama")
                TextField("Masukkan nama anda", text: $vm.name)
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

            Button(action: {
                Task {
                    do {
                        try vm.saveUser()
                        router.navigateTo(.weatherPage)
                    } catch {
                        print("Error saving user: \(error)")
                    }
                }
            }, label: {
                Text("Proses")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)

            })
            .alert(isPresented: $vm.latLongNotFound) {
                Alert(
                    title: Text("Perkiraan cuaca untuk lokasi ini belum tersedia"),
                    message: Text("Coba pilih lokasi lain untuk mendapatkan perkiraan cuaca"),
                    dismissButton: .cancel(Text("Pilih lokasi lain"))
                )
            }
            Spacer()
        }
        .padding(20)
        .onAppear(perform: {
            Task {
                try await vm.getProvinsi()
                try vm.getUser()
            }
        })
        .onChange(of: vm.selectedProvinsi) {
            Task {
                vm.selectedKota = nil
                try await vm.getKota(idProvinsi: vm.selectedProvinsi?.id ?? "")
            }
        }
        .onChange(of: vm.selectedKota) {
            Task {
                print(vm.selectedKota)
                try await vm.getKotaLatLong()
            }
        }
    }
}

#Preview {
    RouterView {
        InputView()
    }
}
