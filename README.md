# Boardroom

**Boardroom** is a modern and intuitive app designed for employees to easily manage meeting room bookings within a company. It allows employees to log in, view available rooms, book them, and track their previous reservations. The app also provides real-time updates on room availability and status.

## Key Features:
1. **Employee Login**: Employees must log in to the app using their credentials to access room booking features.
2. **Room Availability**: The app displays a list of available rooms for a selected date, allowing employees to view available options.
3. **Room Booking**: Employees can easily book available rooms by clicking the "Book" button.
4. **View Past Reservations**: Employees can view a list of their previous reservations, along with details like room number and booking date.
5. **Real-time Room Status**: The status of each room is shown, indicating whether the room is "Available" or "Booked."
6. **API Integration**: Data for rooms and reservations is fetched from Airtable's API, ensuring up-to-date information.

## How to Use the App:

### 1. **Login**
   - Employees must first log in with their personal credentials to access the app’s functionalities.

### 2. **View Available Rooms**
   - After logging in, the app presents all available rooms for the selected date (using a `DatePicker` to specify the date).

### 3. **Book Rooms**
   - If a room is available, employees can easily book it by clicking the "Book" button.

### 4. **View Past Reservations**
   - Employees can access a list of their past reservations by tapping the "My Reservations" button in the toolbar.

### 5. **API Integration**:
   - The app communicates with the [Airtable API](https://airtable.com/) to retrieve data about rooms and reservations.
   - **Rooms**: The app fetches details such as room names, floor numbers, seating capacity, available facilities, and room images.
   - **Reservations**: Past bookings for each employee are fetched, including the rooms reserved and booking dates.

## Technologies Used:
- **SwiftUI**: The user interface is built using SwiftUI, providing a smooth and interactive experience.
- **URLSession**: Data is fetched from Airtable's API using URLSession.
- **Airtable**: Airtable is used as the backend service to store room and reservation data.
- **JSONDecoder**: Data from Airtable's API is decoded into Swift objects using JSONDecoder.

## Requirements:
- **Xcode 12 or later**
- **iOS 14 or later**

## Getting Started:
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/boardroom.git
