# Book Author Search App

A beautiful and responsive Flutter application for searching book authors using the OpenLibrary API. Built with Clean Architecture and modern design principles.

## Features

- 🔍 Real-time author search with debouncing
- 📱 Responsive design for mobile, tablet, and web
- 🎨 Beautiful gradient UI with glassmorphism effects
- 🏗️ Clean Architecture with BLoC pattern
- 🧩 Modular and scalable code structure
- ⚡ Fast and efficient API integration
- 🎯 Type-safe state management
- 🔄 Loading states and error handling

## Architecture

The project follows Clean Architecture principles with three main layers:

### Presentation Layer
- **Pages**: UI screens
- **Widgets**: Reusable UI components
- **BLoC**: Business logic and state management

### Domain Layer
- **Entities**: Core business models
- **Repositories**: Abstract definitions
- **Use Cases**: Business logic operations

### Data Layer
- **Models**: Data transfer objects
- **Repositories**: Concrete implementations
- **Data Sources**: API communication

## Tech Stack

- **Flutter SDK**: 3.0+
- **State Management**: flutter_bloc
- **Networking**: http
- **Dependency Injection**: get_it
- **Responsive UI**: flutter_screenutil
- **Fonts**: google_fonts
- **Image Caching**: cached_network_image

## Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/book_author_search.git
cd book_author_search
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For mobile
flutter run

# For web
flutter run -d chrome
```

## Project Structure
```
lib/
├── common/
│   ├── constants/      # App-wide constants
│   ├── model/          # Shared models (e.g., FailureModel)
│   └── widgets/        # Reusable widgets
├── core/
│   ├── services/       # Shared services (e.g., ThemeService, DI)
│   └── utils/          # Utility functions
├── features/
│   ├── kanban_board/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   ├── models/
│   │   │   └── repository/
│   │   ├── domain/     # Cubits, Services
│   │   └── presentation/
│   └── task_management/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── main.dart           # Entry point of the app
```

## API Integration

This app uses the [OpenLibrary Authors API](https://openlibrary.org/dev/docs/api/search):

- **Endpoint**: `https://openlibrary.org/search/authors.json`
- **No authentication required**
- **Query parameter**: `q` (search term)

## Design System

### Colors
- Primary: `#6C63FF` (Purple)
- Secondary: `#FF6584` (Pink)
- Background: `#F8F9FA` (Light Gray)
- Success: `#48BB78` (Green)
- Error: `#F56565` (Red)

### Typography
- Display: Poppins Bold
- Headlines: Poppins Semi-Bold
- Body: Inter Regular

## Future Enhancements

- [ ] Author details page
- [ ] Favorite authors
- [ ] Filter and sort options
- [ ] Dark mode support
- [ ] Offline caching
- [ ] Author biography
- [ ] Book listings per author
- [ ] Share functionality
- [ ] Advanced search filters

## Testing

Run tests with:
```bash
flutter test
```

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## License

This project is created for educational purposes as part of a technical assignment.

## Contact

For any questions or feedback, please contact the repository owner.