Stock Investment Portfolio App

A Flutter mobile application that allows users to track stock investments, view real-time prices, monitor CO₂ emissions, ESG scores, and sustainability impact, with support for light & dark themes.
The app is built using BLoC state management and follows a clean architecture approach.

**Features**
**1.Dashboard**
1.     Displays total portfolio value
2.     Shows total CO₂ impact (tons/year)
3.     Calculates overall green score

**Lists all added stocks with:**
*     Stock symbol
*     Shares owned
*     Total value
*     CO₂ impact
*     ESG score

**2.Add Stock**
    Search stocks using real-time stock API
    **Auto-populate:**
*         tock symbol
*         Current stock price
*         Enter number of shares
    **Automatically calculate:**
*        Total investment value
    **Fetch and display:**
*         CO₂ emissions
*         ESG score
*         Sustainability rating (High / Medium / Low)
    **Actions:**
*        Add to Portfolio → saves stock
*        Cancel → discards changes

**3.Stock Details**
    **Navigate by tapping any stock in the dashboard
        Displays:**
*             Stock symbol & price
*             Shares owned
*             Total value
*             CO₂ emissions per year
*             Emissions trend visualization
*             Includes charts for better insights

**Sustainability Logic**
        **ESG Rating	Sustainability Level**
*         AAA, AA, A	High    
*         BBB, BB, B	Medium
*         CCC, CC, C	Low

**Theme Support**
1.     Light Mode
2.     Dark Mode
3.     Theme toggle available from the dashboard

**Managed via ThemeCubit**

 **Architecture & State Management**
*     Flutter + Dart
*     BLoC (flutter_bloc)
*     Clean Architecture
*     presentation → UI & BLoC
*     domain → entities & use cases
*     data → API services & models
    **Centralized state handling for:**
*         Dashboard data
*         Stock add flow
*         Theme management
    **APIs Used:**
*         Stock Price API – Fetches real-time stock prices
*         ESG & CO₂ API – Fetches:
*         ESG score
*         CO₂ emissions
*         Sustainability rating

⚠️ API keys or endpoints can be configured inside the data layer.

**Architecture**

The application follows Clean Architecture with a clear separation of concerns:

**Presentation Layer**
Handles UI, navigation, user interaction, and state management using BLoC/Cubit.

**Domain Layer**
Contains business logic, entities, use cases, and repository contracts.

**Data Layer**
Manages API calls, models, data mapping, and repository implementations.

This architecture improves scalability, maintainability, and testability.

**Getting Started**
1.Clone this repository to your local machine:
    git clone <your-repo-url>
    cd stock_investments

2.Install Dependencies
    flutter pub get

Run App
    flutter run

Build Release APK   
   flutter build apk --release

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
