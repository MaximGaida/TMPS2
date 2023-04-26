# Acest program folosește patru design pattern-uri diferite pentru a implementa un sistem de gestionare a sarcinilor:

 ### 1.Factory Method Pattern: 
#### Acest design pattern este folosit pentru a crea obiecte de tip Task (PersonalTask sau BusinessTask) în funcție de un tip dat (personal sau business) prin intermediul metodei createTask a clasei TaskFactory.
     •Defineste un protocol numit 'Task' cu o proprietate title și o metodă complete.
     
     •Defineste două clase, 'PersonalTask' și 'BusinessTask', care se conformează protocolului Task și 
     implementează respectivele metode complete.
     
     •Defineste o clasă 'TaskFactory' cu o metodă createTask care returnează o instanță de 'PersonalTask' sau 'BusinessTask', 
     în funcție de parametrul de intrare type.

 ### 2.Singleton Pattern: 
#### Acest design pattern este utilizat pentru a asigura faptul că există doar o singură instanță a clasei TaskManager și pentru a face această instanță accesibilă global prin intermediul proprietății statice shared. Aceasta este o soluție eficientă pentru a gestiona o colecție de sarcini în cadrul întregii aplicații.

     •Defineste o clasă 'TaskManager' cu o proprietate statică shared care returnează o instanță singleton a 'TaskManager'.
     
     •Defineste un constructor gol pentru a asigura că clasa 'TaskManager' poate fi instantiata doar o singura data.
     
     •Defineste o proprietate tasks ca un tablou de obiecte 'Task'.
     
     •Defineste metode pentru a adăuga, elimina și completa sarcini în tabloul tasks.
  
 ### 3.Prototype Pattern:
#### Acest design pattern este utilizat pentru a crea copii ale obiectelor existente fără a fi necesar să creăm un nou obiect de fiecare dată prin intermediul metodei clone. Clasele PersonalTaskPrototype și BusinessTaskPrototype implementează protocolul TaskPrototype și oferă o metodă pentru a clona obiectul curent într-un nou obiect.

      •Defineste un protocol numit 'TaskPrototype' cu o metodă clone care returnează o copie a unui obiect 'Task'.
      
      •Defineste două clase, 'PersonalTaskPrototype' și 'BusinessTaskPrototype', care se conformează atât protocolului 'Task', cât și 
      'TaskPrototype' și implementează respectivele metode clone.
      
      
 ### 4.Builder Pattern: 
#### Acest design pattern este utilizat pentru a construi obiecte complexe pas cu pas. Clasa TaskBuilder este folosită pentru a construi un obiect Task prin intermediul unei serii de metode de configurare (în cazul acesta doar prin metoda setTitle) și apoi prin intermediul metodei build putem obține obiectul final.

      •Defineste o clasă 'TaskBuilder' cu o proprietate task care poate conține un obiect 'Task'.
      
      •Defineste o metodă setTitle care setează proprietatea title a obiectului 'Task', dacă acesta există.
      
      •Defineste o metodă build care returnează obiectul 'Task'.

##
##
În plus, programul definește două liste diferite de sarcini (PersonalTaskList și BusinessTaskList) care implementează protocolul TaskList. Clasa TaskListFactory este utilizată pentru a crea obiecte TaskList (PersonalTaskList sau BusinessTaskList) în funcție de un tip dat (personal sau business) prin intermediul metodei createTaskList.

În final, programul demonstrează cum pot fi folosite aceste design pattern-uri în cadrul unei aplicații de gestionare a sarcinilor. Prin intermediul clasei TaskFactory, programul creează obiecte de tip PersonalTask și BusinessTask în funcție de tipul dat. Aceste obiecte sunt apoi adăugate în lista de sarcini a clasei TaskManager. Pentru fiecare sarcină din listă, programul poate fi marcată ca finalizată prin intermediul metodei complete a clasei corespunzătoare de tip Task.


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
