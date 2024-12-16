import 'dart:io';

List<String> tasks = [];

void main() {
  while (true) {
    print("\n=== To-Do App ===");
    print("1. Add a new task");
    print("2. View all tasks");
    print("3. Update a task");
    print("4. Delete a task");
    print("5. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask();
        break;
      case '2':
        viewTasks();
        break;
      case '3':
        updateTask();
        break;
      case '4':
        deleteTask();
        break;
      case '5':
        print("Exiting the app. Goodbye!");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

void addTask() {
  stdout.write("Enter the new task: ");
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    tasks.add(task);
    print("Task added successfully.");
  } else {
    print("Task cannot be empty.");
  }
}

void viewTasks() {
  if (tasks.isEmpty) {
    print("No tasks available.");
  } else {
    print("\nYour tasks:");
    for (int i = 0; i < tasks.length; i++) {
      print("${i + 1}. ${tasks[i]}");
    }
  }
}

void updateTask() {
  if (tasks.isEmpty) {
    print("No tasks available to update.");
    return;
  }
  viewTasks();
  stdout.write("Enter the task number to update: ");
  String? input = stdin.readLineSync();
  int? taskIndex = int.tryParse(input ?? '') ?? -1;

  if (taskIndex > 0 && taskIndex <= tasks.length) {
    stdout.write("Enter the updated task: ");
    String? updatedTask = stdin.readLineSync();
    if (updatedTask != null && updatedTask.isNotEmpty) {
      tasks[taskIndex - 1] = updatedTask;
      print("Task updated successfully.");
    } else {
      print("Updated task cannot be empty.");
    }
  } else {
    print("Invalid task number.");
  }
}

void deleteTask() {
  if (tasks.isEmpty) {
    print("No tasks available to delete.");
    return;
  }
  viewTasks();
  stdout.write("Enter the task number to delete: ");
  String? input = stdin.readLineSync();
  int? taskIndex = int.tryParse(input ?? '') ?? -1;

  if (taskIndex > 0 && taskIndex <= tasks.length) {
    tasks.removeAt(taskIndex - 1);
    print("Task deleted successfully.");
  } else {
    print("Invalid task number.");
  }
}