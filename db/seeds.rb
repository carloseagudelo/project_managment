# crea usuarios
User.create(name: 'admin', email: 'admin@gmail.com', password: '12345678', role: 'ADMIN')
User.create(name: 'sergio', email: 'sergio@gmail.com', password: '12345678', role: 'WORKER')
User.create(name: 'sebastian', email: 'sebastian@gmail.com', password: '12345678', role: 'WORKER')
User.create(name: 'carlos', email: 'carlos@gmail.com', password: '12345678', role: 'WORKER')

# Crea Equipo
Team.create(name: 'DESARROLLO', description: 'GRUPO DE DESARROLLO')
Team.create(name: 'DISEÑO', description: 'GRUPO DE DISEÑO')

# Crea usuarios por equipo
UsersTeam.create(user_id: 2, team_id: 1, lead: true)
UsersTeam.create(user_id: 3, team_id: 1)

UsersTeam.create(user_id: 3, team_id: 2, lead: true)
UsersTeam.create(user_id: 2, team_id: 2)

# Crea los clientes
Customer.create(name: 'NICOJOYAS', description: 'NEGOCIAMOS CON JOYERIA')
Customer.create(name: 'TODO DIA', description: 'INVIERTA BIEN SU DINERO')
Customer.create(name: 'CUSTOM', description: 'VESTIENTA Y MARROQUINERIA')
Customer.create(name: 'FABIAN HURTADO', description: 'FOTOGRAFIA')

# Crea los Trabajos
Job.create(name: 'DESARROLLAR VISTA DE EQUIPOS', description: 'DESARROLLAR LA VISTA QUE PERMITE CREAR EQUIPOS', team_id: 1, user_id: 2, customer_id: 1)
Job.create(name: 'DESARROLLAR VISTA DE TAREAS', description: 'DESARROLLAR LA VISTA QUE PERMITE CREAR TAREAS', team_id: 1, user_id: 3, customer_id: 2)

Job.create(name: 'AGREGAR ESTILOS A LA VISTA EQUIPOS', description: 'AGREGAR ESTILOS NECESARIOS A LA VISTA EQUIPOS', team_id: 2, user_id: 2, customer_id: 3)
Job.create(name: 'AGREGAR ESTILOS A LA VISTA TAREAS', description: 'AGREGAR ESTILOS NECESARIOS A LA VISTA TAREAS', team_id: 2, user_id: 3, customer_id: 4)

# Crea las tareas
Task.create(name: 'CREAR MODELO EQUIPO', description: 'CREAR EL MODELO DE LA FUNCIONALIDAD EQUIPOS')
Task.create(name: 'CREAR CONTROLADOR EQUIPO', description: 'CREAR EL CONTROLADOR DE LA FUNCIONALIDAD EQUIPOS')
Task.create(name: 'CREAR VISTA EQUIPO', description: 'CREAR LA VISTA DE LA FUNCIONALIDAD EQUIPOS')

Task.create(name: 'CREAR MODELO TAREA', description: 'CREAR EL MODELO DE LA FUNCIONALIDAD TAREA')
Task.create(name: 'CREAR CONTROLADOR TAREA', description: 'CREAR EL CONTROLADOR DE LA FUNCIONALIDAD TAREA')
Task.create(name: 'CREAR VISTA TAREA', description: 'CREAR LA VISTA DE LA FUNCIONALIDAD TAREA')

# Crea las tareas por trabajo
TaksJob.create(job_id: 1, task_id: 1)
TaksJob.create(job_id: 1, task_id: 2)
TaksJob.create(job_id: 1, task_id: 3)
TaksJob.create(job_id: 2, task_id: 4)
TaksJob.create(job_id: 2, task_id: 5)
TaksJob.create(job_id: 2, task_id: 6)