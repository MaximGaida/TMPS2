## Acest program folosește patru design pattern-uri diferite pentru a implementa un sistem de gestionare a sarcinilor.
## 1.Factory Method Pattern: 
Acest design pattern este folosit pentru a crea obiecte de tip Task (PersonalTask sau BusinessTask) în funcție de un tip dat (personal sau business) prin intermediul metodei createTask a clasei TaskFactory.

## 2.Singleton Pattern: 
Acest design pattern este utilizat pentru a asigura faptul că există doar o singură instanță a clasei TaskManager și pentru a face această instanță accesibilă global prin intermediul proprietății statice shared. Aceasta este o soluție eficientă pentru a gestiona o colecție de sarcini în cadrul întregii aplicații.

## 3.Prototype Pattern:
Acest design pattern este utilizat pentru a crea copii ale obiectelor existente fără a fi necesar să creăm un nou obiect de fiecare dată prin intermediul metodei clone. Clasele PersonalTaskPrototype și BusinessTaskPrototype implementează protocolul TaskPrototype și oferă o metodă pentru a clona obiectul curent într-un nou obiect.

## 4.Builder Pattern: 
Acest design pattern este utilizat pentru a construi obiecte complexe pas cu pas. Clasa TaskBuilder este folosită pentru a construi un obiect Task prin intermediul unei serii de metode de configurare (în cazul acesta doar prin metoda setTitle) și apoi prin intermediul metodei build putem obține obiectul final.
##
În plus, programul definește două liste diferite de sarcini (PersonalTaskList și BusinessTaskList) care implementează protocolul TaskList. Clasa TaskListFactory este utilizată pentru a crea obiecte TaskList (PersonalTaskList sau BusinessTaskList) în funcție de un tip dat (personal sau business) prin intermediul metodei createTaskList.

În final, programul demonstrează cum pot fi folosite aceste design pattern-uri în cadrul unei aplicații de gestionare a sarcinilor. Prin intermediul clasei TaskFactory, programul creează obiecte de tip PersonalTask și BusinessTask în funcție de tipul dat. Aceste obiecte sunt apoi adăugate în lista de sarcini a clasei TaskManager. Pentru fiecare sarcină din listă, programul poate fi marcată ca finalizată prin intermediul metodei complete a clasei corespunzătoare de tip Task.
