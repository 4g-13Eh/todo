# TaskHub ToDo App

TaskHub is a simple and efficient ToDo app built with Flutter. It helps you manage your tasks effectively, providing features like task addition, deletion, marking tasks as done, searching tasks, and clearing all tasks with a shake of the phone.

## Features

- **Add Tasks**: Easily add new tasks to your list.
- **Delete Tasks**: Remove tasks that are no longer needed.
- **Mark as Done**: Mark tasks as done with a single tap.
- **Search Tasks**: Quickly find tasks using the search functionality.
- **Shake to Clear**: Shake your phone to clear all tasks, with a confirmation dialog.
- **Persistent Storage**: Tasks are saved to the device's storage and are loaded when the app is opened.

## Installation

1. **Clone the repository**:
    
    ```bash
    git clone https://github.com/4g-13Eh/todo.git
    ```
2. **Navigate to the project directory**:

    ```bash
    cd todo
    ```
3. **Install the dependencies**:

    ```bash
    flutter pub get
    ```
4. **Run the app**:

    ```bash
    flutter run
    ```


## Usage

1. **Adding a Task**: Enter a task in the "Neue Aufgabe" text field and press the add button.
2. **Marking a Task as Done**: Tap on a task to mark it as done or undone.
3. **Deleting a Task**: Press the delete icon next to a task to delete it.
4. **Searching Tasks**: Use the search bar at the top to find specific tasks.
5. **Clearing All Tasks**: Shake your phone to trigger a dialog to clear all tasks. Confirm to delete all tasks.

## Project Structure

- `main.dart`: Entry point of the application.
- `alltaskspage.dart`: The main page displaying all tasks and the interface for adding new tasks.
- `todo.dart`: Model class representing a ToDo item.
- `todoservice.dart`: Service class for handling persistent storage of tasks.
- `todoprovider.dart`: Provider class for state management of the ToDo list.
- `todoitem.dart`: Widget for displaying individual ToDo items.
- `widgets/`: Directory containing custom widgets.
- `provider/`: Directory containing provider classes.
- `model/`: Directory containing model classes.
- `service/`: Directory containing service classes.
- `pages/`: Directory containing the main pages of the app.

## Dependencies

- `flutter`: The core Flutter framework.
- `provider`: State management library for Flutter.
- `shake`: Library to detect phone shake gestures.
- `vibration`: Library to trigger phone vibrations.
- `uuid`: Library to generate unique IDs.
- `path_provider`: Library to access the device's file system.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Flutter framework for making app development easy and fun.
- All the open-source libraries used in this project.
- [Ben](https://github.com/BWizard06) for helping develop the search functionality 😭💀.
