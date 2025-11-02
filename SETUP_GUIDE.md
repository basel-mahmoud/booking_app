# Saloon App - Setup Guide

Complete authentication system with Flutter frontend and Node.js + Prisma backend.

## Backend Setup

### 1. Install Node.js
Make sure you have Node.js installed (v16 or higher).

### 2. Setup Backend
```bash
cd backend
npm install
```

### 3. Initialize Prisma Database
```bash
npm run prisma:generate
npm run prisma:migrate
```
When prompted for migration name, enter: `init`

### 4. Start Backend Server
```bash
npm run dev
```

The server will run on `http://localhost:3000`

You should see: `🚀 Server is running on http://localhost:3000`

## Flutter Setup

### 1. Install Flutter Dependencies
```bash
flutter pub get
```

### 2. Configure API Endpoint

For testing on different devices:

- **Android Emulator**: Use `http://10.0.2.2:3000/api` in `lib/services/api_service.dart`
- **iOS Simulator**: Use `http://localhost:3000/api`
- **Physical Device**: Use `http://YOUR_COMPUTER_IP:3000/api` (e.g., `http://192.168.1.100:3000/api`)

To find your computer's IP:
- Windows: `ipconfig` (look for IPv4 Address)
- Mac/Linux: `ifconfig` or `ip addr`

### 3. Run Flutter App
```bash
flutter run
```

## Testing the App

### 1. Create an Account
- Open the app
- Click "Sign Up"
- Fill in your details:
  - Name: John Doe
  - Email: john@example.com
  - Password: password123
- Check "I agree to the Terms & Conditions"
- Click "Sign Up"

### 2. Login
- Enter your email and password
- Click "Sign In"
- You'll be redirected to the home page

### 3. View Database (Optional)
```bash
cd backend
npm run prisma:studio
```

This opens Prisma Studio in your browser where you can view all users.

## API Endpoints

### Signup
```
POST http://localhost:3000/api/auth/signup
Content-Type: application/json

{
  "email": "user@example.com",
  "name": "John Doe",
  "password": "password123"
}
```

### Login
```
POST http://localhost:3000/api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

### Verify Token
```
GET http://localhost:3000/api/auth/verify
Authorization: Bearer YOUR_JWT_TOKEN
```

## Troubleshooting

### Backend Issues

**Port already in use:**
```bash
# Change PORT in backend/.env file
PORT=3001
```

**Database errors:**
```bash
cd backend
rm -rf prisma/dev.db
npm run prisma:migrate
```

### Flutter Issues

**Network error:**
- Make sure backend server is running
- Check the API endpoint in `lib/services/api_service.dart`
- For physical devices, ensure phone and computer are on same WiFi

**Package errors:**
```bash
flutter clean
flutter pub get
```

## Project Structure

```
saloon_app/
├── backend/
│   ├── src/
│   │   ├── controllers/
│   │   │   └── authController.js
│   │   ├── routes/
│   │   │   └── auth.js
│   │   └── server.js
│   ├── prisma/
│   │   └── schema.prisma
│   ├── .env
│   └── package.json
├── lib/
│   ├── models/
│   │   ├── auth_response.dart
│   │   └── user_model.dart
│   ├── services/
│   │   └── api_service.dart
│   ├── screens/
│   │   └── home_page.dart
│   ├── User_Data/
│   │   ├── login_page.dart
│   │   └── signup_page.dart
│   └── main.dart
└── pubspec.yaml
```

## Security Notes

- Change `JWT_SECRET` in `backend/.env` for production
- Never commit `.env` file to version control
- Use HTTPS in production
- Implement rate limiting for production
- Add email verification for production

## Next Steps

- Add password reset functionality
- Implement email verification
- Add user profile page
- Create booking system
- Add salon listings
