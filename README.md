# 🛒 ShoppingCart – Flutter E-commerce Application

A **feature-rich e-commerce mobile app** built with **Flutter**, leveraging **Firebase** for authentication and database management, and **Stripe** for secure card payments.  
The app follows the **MVC (Model-View-Controller)** architecture, ensuring clean code separation and maintainability.

---

## ✨ Features

- **User Authentication:** Secure sign up and login using **Firebase**  
- **User Database:** Store and manage user data with **Firebase Firestore**  
- **Product Management:** View and manage products in the store  
- **Shopping Cart:** Add, remove, and update items in the cart  
- **Stripe Payments:** Integrated card payments using Stripe (test keys)  
- **MVC Architecture:** Organized codebase for scalability and maintainability

---

## 🛠️ Getting Started

### Prerequisites

Before running the project, ensure you have:

- **Flutter SDK** installed  
- **Dart SDK** installed  
- A configured **Firebase project**  
- **Stripe test keys** (replace with your own)

---

### Installation

1. **Clone the repository**

    ```bash
    git clone https://github.com/qotoofG/ShopingCart.git
    cd ShopingCart
    ```

2. **Install dependencies**

    ```bash
    flutter pub get
    ```

3. **Configure Firebase**

    - Create a Firebase project
    - Add your Android/iOS apps in Firebase Console
    - Download `google-services.json` (Android) and/or `GoogleService-Info.plist` (iOS)
    - Place the files in the appropriate platform directories

4. **Run the app**

    ```bash
    flutter run
    ```

---

### Note

- This project is intended for training purposes; Stripe uses test keys only.
- Firebase is used for basic authentication and user data storage.
- **Do not include sensitive/production keys in public repositories**—use test or dummy values.

---

## 📄 License

This project is open source and available for learning and educational use.
