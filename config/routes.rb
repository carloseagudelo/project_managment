Rails.application.routes.draw do

 # Rutas para el manejor de sesión y autentificacion en plataforma
 Rails.application.routes.draw do
    devise_for :users, controllers: {
      :sessions => 'users/sessions',
      :registrations => "users/registrations",
      :passwords => "users/passwords"
    }
  end

  # Valida si el usuario esta loggeado y dependiendo de eso toma el root
  devise_scope :user do
    authenticated do
      authenticated :user do
        root to: "teams#index"
      end
    end
    unauthenticated do
      root to: 'welcomes#index'
    end
  end

 # Rutas para el controlador Team
  # Ruta que lista todos los teams registrados
  get 'teams', to: 'teams#index'
  # Ruta para crear un nuevo equipo
  post 'teams', to: 'teams#create'
  #Ruta para actualizar la información del team
  patch 'teams/:id', to: 'teams#update'
  # Ruta para visualizar el equipo
  get 'team/:id', to: 'teams#show', as: 'team'
  # Ruta para renderizar el formulario para crear unnuevo equipo
  get 'teams/new', to: 'teams#new', as: 'new_team'
  # Ruta para obtener el formulario de actualización
  get 'teams/:id/edit', to: 'teams#edit', as: 'edit_team'
  
  #resources :teams

 # Rutas para el controlador de Job
  # Lista los jobs
  get 'jobs', to: 'jobs#index'
  # Ruta para crear un nuevo equipo
  post 'jobs', to: 'jobs#create'
  #Ruta para actualizar la información del job
  patch 'jobs/:id', to: 'jobs#update'
  # Ruta para visualizar el Job
  get 'jobs/:id', to: 'jobs#show', as: 'job'
  # Ruta para renderizar el formulario para crear unnuevo equipo
  get 'jobs/new/:team_id', to: 'jobs#new', as: 'new_job'
  # Ruta para obtener el formulario de actualización
  get 'jobs/:id/edit/:team_id', to: 'jobs#edit', as: 'edit_job'
  # Ruta para enviar la notificacion de tiempo
  get 'jobs_noti/:id', to: 'jobs#send_notification', as: 'notification'
  

 # Rutas para el controlador Task
  # Lista todas las tareas registradas
  get 'tasks', to: 'tasks#index'
  # Ruta para crear un nuevo equipo
  post 'tasks', to: 'tasks#create'
  # Ruta para renderizar el formulario para crear una nueva tarea
  get 'tasks/new/:job_id', to: 'tasks#new', as: 'new_task'
  # Ruta que actualia el check en alguna de las tareas
  post 'update_checked', to: 'tasks#update_checked'

 # Rutas para el controlador Customer
  # Ruta para listar la información de los clientes
  get 'customers', to: 'customers#index'
  # Ruta para crear un nuevo cliente
  post 'customers', to: 'customers#create'
  # Ruta para renderizar el formulario para crear un nuevo cliente
  get 'customers/new/', to: 'customers#new', as: 'new_customer'

 end