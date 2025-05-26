import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showingSignUp = false
    @State private var showingMainView = false
    @State private var showingError = false
    
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
                
                // Giriş formu
                VStack(spacing: 15) {
                    TextField("Kullanıcı Adı", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Şifre", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: login) {
                        Text("Giriş Yap")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(username.isEmpty || password.isEmpty)
                }
                .padding(.horizontal, 30)
                
                // Kayıt ol butonu
                Button(action: { showingSignUp = true }) {
                    Text("Hesabın yok mu? Kayıt ol")
                        .foregroundColor(.blue)
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationBarHidden(true)
            .alert("Hata", isPresented: $showingError) {
                Button("Tamam", role: .cancel) { }
            } message: {
                Text("Kullanıcı adı veya şifre hatalı!")
            }
        }
        .fullScreenCover(isPresented: $showingSignUp) {
            SignUpView()
        }
        .fullScreenCover(isPresented: $showingMainView) {
            ContentView()
        }
    }
    
    private func login() {
        if User.validateUser(username: username, password: password) {
            showingMainView = true
        } else {
            showingError = true
        }
    }
}

#Preview {
    LoginView()
}
