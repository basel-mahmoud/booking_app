# Saloon App Backend

Backend API for the Saloon App with Prisma, Express, and JWT authentication.

## Setup Instructions

1. **Install dependencies:**
   ```bash
   cd backend
   npm install
   ```

2. **Generate Prisma Client:**
   ```bash
   npm run prisma:generate
   ```

3. **Run database migrations:**
   ```bash
   npm run prisma:migrate
   ```

4. **Start the server:**
   ```bash
   npm run dev
   ```

The server will run on `http://localhost:3000`

## API Endpoints

### Authentication

- **POST** `/api/auth/signup` - Create new user account
  - Body: `{ "email": "user@example.com", "name": "John Doe", "password": "password123" }`
  
- **POST** `/api/auth/login` - Login user
  - Body: `{ "email": "user@example.com", "password": "password123" }`
  
- **GET** `/api/auth/verify` - Verify JWT token
  - Headers: `Authorization: Bearer <token>`

### Health Check

- **GET** `/health` - Check server status

## Environment Variables

Create a `.env` file in the backend directory:

```
DATABASE_URL="file:./dev.db"
JWT_SECRET="your-super-secret-jwt-key-change-this-in-production"
PORT=3000
NODE_ENV=development
```

## Database

Using SQLite for development. The database file will be created at `backend/prisma/dev.db`.

To view the database with Prisma Studio:
```bash
npm run prisma:studio
```
