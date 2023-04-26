// Factory Method Pattern
protocol Task {
    var title: String { get set }
    func complete()
}

class PersonalTask: Task {
    var title: String = ""
    func complete() {
        print("Personal task completed: \(title)")
    }
}

class BusinessTask: Task {
    var title: String = ""
    func complete() {
        print("Business task completed: \(title)")
    }
}

class TaskFactory {
    static func createTask(type: String) -> Task? {
        switch type {
        case "personal":
            return PersonalTask()
        case "business":
            return BusinessTask()
        default:
            return nil
        }
    }
}

// Singleton Pattern
class TaskManager {
    static let shared = TaskManager()
    private init() {}
    
    var tasks = [Task]()
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func completeTask(at index: Int) {
        tasks[index].complete()
    }
}

// Prototype Pattern
protocol TaskPrototype {
    func clone() -> Task
}

class PersonalTaskPrototype: Task, TaskPrototype {
    var title: String = ""
    func complete() {
        print("Personal task completed: \(title)")
    }
    
    func clone() -> Task {
        let task = PersonalTask()
        task.title = self.title
        return task
    }
}

class BusinessTaskPrototype: Task, TaskPrototype {
    var title: String = ""
    func complete() {
        print("Business task completed: \(title)")
    }
    
    func clone() -> Task {
        let task = BusinessTask()
        task.title = self.title
        return task
    }
}

// Builder Pattern
class TaskBuilder {
    var task: Task?
    
    func setTitle(title: String) -> TaskBuilder {
        if var task = task {
            task.title = title
        }
        return self
    }
    
    func build() -> Task? {
        return task
    }
}

// Abstract Factory Pattern
protocol TaskList {
    var tasks: [Task] { get set }
    func addTask(task: Task)
    func removeTask(at index: Int)
}

class PersonalTaskList: TaskList {
    var tasks: [Task] = []
    
    
    
    func addTask(task: Task) {
        if let task = task as? PersonalTask {
            tasks.append(task)
        }
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
}

class BusinessTaskList: TaskList {
    var tasks: [Task] = []
    
    
    
    func addTask(task: Task) {
        if let task = task as? BusinessTask {
            tasks.append(task)
        }
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
}

class TaskListFactory {
    static func createTaskList(type: String) -> TaskList? {
        switch type {
        case "personal":
            return PersonalTaskList()
        case "business":
            return BusinessTaskList()
        default:
            return nil
        }
    }
}

// Usage
var personalTask = TaskFactory.createTask(type: "personal")
personalTask?.title = "Buy groceries"
TaskManager.shared.addTask(task: personalTask!)
personalTask?.complete()

var businessTask = TaskFactory.createTask(type: "business")
businessTask?.title = "Call client"
TaskManager.shared.addTask(task: businessTask!)
businessTask?.complete()
