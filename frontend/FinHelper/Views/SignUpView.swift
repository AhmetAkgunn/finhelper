import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Logo
                Image("finhelper_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
                
                // Başlık
                Text("FinHelper")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                // Kayıt formu
                VStack(spacing: 15) {
                    TextField("Kullanıcı Adı", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    TextField("E-posta", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Şifre", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Şifre Tekrar", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: signUp) {
                        Text("Kayıt Ol")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(!isFormValid)
                }
                .padding(.horizontal, 30)
                
                // Giriş yap butonu
                Button(action: { dismiss() }) {
                    Text("Zaten hesabın var mı? Giriş yap")
                        .foregroundColor(.blue)
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
    
    private var isFormValid: Bool {
        !username.isEmpty &&
        !email.isEmpty &&
        !password.isEmpty &&
        !confirmPassword.isEmpty &&
        password == confirmPassword &&
        email.contains("@") &&
        email.contains(".")
    }
    
    private func signUp() {
        // Kayıt işlemleri burada yapılacak
        // TODO: Kayıt başarılı olduğunda ContentView'a yönlendir
    }
}

#Preview {
    SignUpView()
}
