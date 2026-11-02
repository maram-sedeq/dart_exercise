import 'dart:io';
class Task{
  int id =0;
  String title = '';
  String description = '';
  bool isCompleted = false;
  String dueDate = '';
  int priority = 0;

    Task({
        required this.id,
        required this.title,
        required this.description,
        required this.isCompleted,
        required this.dueDate,
        required this.priority,
    });
     
    void displayTaskInfo(int id, String title, String description, bool isCompleted, String dueDate, int priority) {
        this.id = id;
        this.title = title; 
        this.description = description;
        this.isCompleted = isCompleted;
        this.dueDate = dueDate;
        this.priority = priority;
        print('Task ID: $id');
        print('Title: $title');
        print('Description: $description'); 
        print('Is Completed: $isCompleted');
        print('Due Date: $dueDate');
        print('Priority: $priority');
    }
    void markAsCompleted(bool isCompleted) {
        this.isCompleted = isCompleted;
        if (isCompleted == true) {
            print('Task marked as completed');
        } else {
            print('Task marked as not completed');
        }
    }
}
class PersonalTask extends Task {
  String location = '';

  PersonalTask({
    required int id,
    required String title,
    required String description,
    required bool isCompleted,
    required String dueDate,
    required int priority,
    required this.location,
  }) : super(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
          dueDate: dueDate,
          priority: priority,
        );

  @override
  void displayTaskInfo(int id, String title, String description, bool isCompleted, String dueDate, int priority) {
    super.displayTaskInfo(id, title, description, isCompleted, dueDate, priority);
    print('Location: $location');
  }
}

class WorkTask extends Task {
  String project = '';

  WorkTask({
    required int id,
    required String title,
    required String description,
    required bool isCompleted,
    required String dueDate,
    required int priority,
    required this.project,
  }) : super(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
          dueDate: dueDate,
          priority: priority,
        );

  @override
  void displayTaskInfo(int id, String title, String description, bool isCompleted, String dueDate, int priority) {
    super.displayTaskInfo(id, title, description, isCompleted, dueDate, priority);
    print('Project: $project');
  }
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    print('Task added successfully');
    
  }

  void removeTask(int taskId) {
    tasks.removeWhere((task) => task.id == taskId);
    print('Task removed successfully');
  }

  void displayAllTasks() {
    if (tasks.isEmpty) {
      print('No tasks available');
      return;
    }

    for (Task task in tasks) {
      task.displayTaskInfo(task.id, task.title, task.description, task.isCompleted, task.dueDate, task.priority);
      print('-------------------');
    }
  }
}

Future<TaskManager> fetchTasks() async {
  await Future.delayed(Duration(seconds: 5));

  TaskManager taskdisplay = TaskManager();

  taskdisplay.displayAllTasks();

  return taskdisplay;
}


void main() async {
    TaskManager taskmanager = TaskManager();
    
    while (true){
        print('Task Management System');
        print('1. Add Task');   
        print('2. Remove Task');
        print('3. Display All Tasks');
        print('4. Exit');
        stdout.write('\nChoose an option: ');

       String? choice = stdin.readLineSync();

        switch (choice) {
            case '1':
                stdout.write('Enter Task ID: ');
                int id = int.parse(stdin.readLineSync()!);
                stdout.write('Enter Task Title: ');
                String title = stdin.readLineSync()!;
                stdout.write('Enter Task Description: ');
                String description = stdin.readLineSync()!;
                stdout.write('Is Task Completed? (true/false): ');
                bool isCompleted = stdin.readLineSync()!.toLowerCase() == 'true';
                stdout.write('Enter Task Due Date: ');
                String dueDate = stdin.readLineSync()!;
                stdout.write('Enter Task Priority (1-5): ');
                int priority = int.parse(stdin.readLineSync()!);

                Task task = Task(
                    id: id,
                    title: title,
                    description: description,
                    isCompleted: isCompleted,
                    dueDate: dueDate,
                    priority: priority,
                );

                TaskManager taskManager = await fetchTasks();
                taskManager.addTask(task);
                break;

            case '2':
                stdout.write('Enter Task ID to remove: ');
                int taskIdToRemove = int.parse(stdin.readLineSync()!);
                
                TaskManager taskManagerToRemove = await fetchTasks();
                taskManagerToRemove.removeTask(taskIdToRemove);
                break;

            case '3':
                TaskManager taskManagerToDisplay = await fetchTasks();
                taskManagerToDisplay.displayAllTasks();
                break;

            case '4':
                print('Exiting...');
                return;

            default:
                print('Invalid option. Please try again.');
        }

    }

}