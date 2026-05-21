//
//  PasswordCheckView.swift
//  PasswordDemo
//
//  Created by Oscar Artemio Brito Ortiz on 21/05/26.
//

import SwiftUI

struct PasswordCheckView: View {
    
    @StateObject private var viewModel:PasswordViewModel = PasswordViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Password Strength Checker")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Type a password to see its strength.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                SecureField("Enter password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Strength")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text(viewModel.passwordStrength.rawValue)
                        .font(.headline)
                        .foregroundStyle(statusColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(24)
            .frame(maxWidth: 420)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
    
    private var statusColor: Color {
        switch viewModel.passwordStrength {
        case .invalid:
            return .secondary
        case .weak:
            return .red
        case .medium:
            return .orange
        case .strong:
            return .green
        }
    }
}

#Preview {
    PasswordCheckView()
}
