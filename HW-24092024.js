//  1. Найти первых двух сотрудников в списке, отсортированных по имени.
db.employees.find().sort({name: 1}).limit(2)

//  2. Найти сотрудников младше 30 лет и отсортировать их по возрасту в порядке возрастания.
db.employees.find({age: {$lt: 30}}).sort({age: 1})

//  3. Найти сотрудников, начиная с третьего по порядку (пропустив первых двух), и ограничить выборку тремя следующими.
db.employees.find().limit(3).skip(2)

//  4. Найти сотрудников, занимающих должность "Manager" или "HR", и вывести только их имена, ограничив выборку первыми двумя в списке.
db.employees.find({position: {$in: ["Manager", "HR"]}}, {_id: 0, name: 1}).limit(2)

//  5. Найти сотрудников с зарплатой выше 5000, пропустив первого сотрудника из выборки, и вывести только их имена.
db.employees.find({salary : {$gt: 5000}}, {_id:0, name: 1}).skip(1)

//  6. Увеличить зарплату на 2000 для всех сотрудников, занимающих должность "Developer".
db.employees.updateMany({position: "Developer"}, {$inc: {salary: 2000}})

//  7. Добавить новое поле "manager" для всех сотрудников и задать значение "Alice".
db.employees.updateMany({}, {$set: {manager : "Alice"}})

//  8. Изменить значение поля "manager" на "Helen" для сотрудников, занимающих должность "HR".
db.employees.updateMany({position: "HR"}, {$set: {manager : "Helen"}})

//  9. Уменьшить зарплату на 500 для сотрудника по имени "Charlie".
db.employees.updateOne({name: "Charlie"}, {$inc: {salary : -500}})

// 10. Удалить поле "manager" у всех сотрудников.
db.employees.updateMany({}, {$unset: {manager : -1}})