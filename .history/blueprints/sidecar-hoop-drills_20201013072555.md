Use the #1 then #2 to write out the steps to complete or at least start the app. then go back to #1 to finish the frontned setup.

# 1 Rails APP w JS Frontend Project Setup
Rails APP w JS Frontend Project Setup[https://github.com/learn-co-curriculum/rails-js-project-setup]
file["1-full-js-rails-project-readme.md"]

# 2 JavaScript Rails API Project Setup
JavaScript Rails API Project Setup[https://github.com/learn-co-curriculum/mod3-project-week-setup-example]
file[2-setup-walkthrough.md]


`rails new hoop-drills --database=postgresql --api`

`cd hoop-drills`

navigate to your gemfile and uncomment
`gem 'rack-cors'`

`gem 'active_model_serializers'`

Run `bundle`


* Inside of `config/initializers/cors.rb` uncomment the following code:

```
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```
The name after module should be whatever you named your project

`rails g controller api/v1/workouts --no-test-framework`

Add our index and create methods to `/app/controllers/api/v1/workouts_controller`:

```rb
# app/controllers/api/v1/workouts_controller

class Api::V1::WorkoutsController < ApplicationController
# before_action :find_workout, only: [:update]
  def index
    @workouts = Workout.all.order(:created_at)
    render json: @workouts, status: 200
  end

  def create
    @workout = Workout.create(workout_params)
    render json: @workout, status: 201
  end

  def destroy
    workout = Workout.find(params[:id])
    if workout.destroy
      render json: {workoutId: workout.id}, status: 200
    end
  end

  def update
    @workout = Workout.find(params[:id])
    # if @workout.update(workout_params)
    #   render json: @workout, status: 200


#  @workout.update(workout_params)
    if @workout.save
      render json: @workout, status: :accepted
    else
      render json: { errors: @workout.errors.full_messages }, status: :unprocessible_entity
    # end
    end
  end

  private
    def workout_params
      params.require(:workout).permit(:type, :name, :duration, :distance)
    end


#   def workout_params
#     params.permit(:title, :content)
#   end

#   def find_workout
#     @workout = Workout.find(params[:id])
#   end
end

### Example Routes
```
The routes we define in `config/routes.rb` need to correspond to the namespaced controller we created. They should be defined as follows:

```ruby
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :workouts #, only: [:index, :update], :routine
    end
  end
end

# end
```


Next let's setup our models:
`rails g model Rotuine name:string`
-name

`rails g model Workout type:string, name:string, distance:int, duration:int`
- type:
- name:
- distance:
- duration:

Then run 
`rails db:create` 
&&
`rails db:migrate`

`rails g serializer routine`
`rails g serializer workout`

`RoutineSerializer` 
```ruby
# routine_serializer.rb
class RoutineSerializer < ActiveModel::Serializer
  # attributes :id
  # has_many :workouts
  attributes :id, :name # , :duration, :distance
end

```


```rb
# workout_serializer.rb
class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :workout_type, :distance, :duration
  # has_many :routines
  # attributes :name
end

```

```zsh
# console error message
ActiveRecord::SubclassNotFound (The single-table inheritance mechanism failed to locate the subclass: 'cardio'. This error is raised because the column 'type' is reserved for storing the class in case of inheritance. Please rename this column if you didn't intend it to be used for storing the inheritance class or overwrite Workout.inheritance_column to use another column for that information.
```

the erro above means that we need to
rename the `type` column to `workout_type` in our `workouts-table`

`rails g migration rename_type_to_workout_type`

edit the migration file

```rb
class RenameTypeToWorkoutType < ActiveRecord::Migration[6.0]
  def change
    rename_column :workouts, :type, :workout_type
  end
end

```

`rails db:migrate`

Now that our model and table is setup, we should be able to create a new workout in the console


Test this by running rails c then 

```rb
Workout.create(workout_type: "cardio", name: "basketball", distance: 3, duration: 2)
```

test api endpoints
`rails s`

http://localhost:3000/api/v1/workouts
http://localhost:3000/api/v1/routines

Add the following to `db/seeds.rb`:

```
Workout.create([
                 { workout_type: 'cardio', name: 'basketball', distance: '1', duration: '1' },
                 { workout_type: 'cardio', name: 'running', distance: '2', duration: '1' },
                 { workout_type: 'cardio', name: 'bike_riding', distance: '1', duration: '1.5' },
                 { workout_type: 'cardio', name: 'basketball', distance: '1', duration: '1.5' },
                 { workout_type: 'cardio', name: 'bike_riding', distance: '1', duration: '1.5' },
                 { workout_type: 'cardio', name: 'jogging', distance: '1', duration: '1' },
                 { workout_type: 'cardio', name: 'sprinting', distance: '1', duration: '2.5' },
                 { workout_type: 'cardio', name: 'bike_riding', distance: '1', duration: '1.5' },
                 { workout_type: 'cardio', name: 'sprinting', distance: '1', duration: '2.5' },
                 { workout_type: 'cardio', name: 'bike_riding', distance: '2', duration: '3.5' }
               ])

Routine.create([
                 { name: 'Weight Training' },
                 { name: 'Cardio Rush' },
                 { name: 'Hoops' },
                 { name: 'Batman Chest' },
                 { name: 'Gym Glutes' }
               ])


```

# reset DB (if needed)
fix any db:seed errors then run `rails db:reset`

Once the reset command is used it will do the following:

Drop the database: `rake db:drop`
Load the schema: `rake db:schema:load`
Seed the data: `rake db:seed`

Why db:schema:load and not db:migrate?
rake db:schema:load is much faster than rake db:migrate, because it loads the schema that we’ve already generated from db/schema.rb instead of going through all the migrations again.


# Setting Up the FRONTED
    JavaScript Rails API Project Setup[https://github.com/learn-co-curriculum/mod3-project-week-setup-example]

    start here=>
        initial-setup[https://github.com/learn-co-curriculum/mod3-project-week-setup-example#initial-setup]


`mkdir fe-hoop-drills && cd $_`

```zsh
mkdir bin src styles
touch index.html src/index.js
```
<!-- `..` -->
<!-- `mkdir styles && cd $_` -->
<!-- `touch index.css` -->

### Example Feature (Updating a workout)

We want to create the following features:

> As a user, when the page loads I should see a list of workouts. Next to the title of each workout will be a button to edit that workout.

> As a user, when I click the edit button, I will see a form with the values of that workout in the input fields. I can make changes, click 'Save Workout' and see the changes reflected in the list of workouts.

Delivering these features will involve several steps and we will want to be sure **to work iteratively**. We will make it work and then make it better.

add code to html
```html
<!-- index.html -->
<!DOCTYPE html>
<html>
  <head>
    <title>Sample JS Project frontend</title>
    <link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles/style.css">
  </head>
  <body>
        <div class="container">
      <div id="new-workout-container">
        <form id="new-workout-form">
          <input type="text" name="workout-type" id="new-workout-type"> 
          <input type="text" name="workout-name" id="new-workout-name">
          <input type="text" name="workout-distance" id="new-workout-distance">
          <input type="text" name="workout-duration" id="new-workout-duration">
          <input type="submit" value="Save workout">
        </form>
      </div>
      <div id="workouts-container">

      </div>
    </div>

    <script type="text/javascript" src="src/components/workout.js"></script>
    <script type="text/javascript" src="src/adapters/workoutsAdapter.js"></script>
    <script type="text/javascript" src="src/components/workouts.js"></script>
    <script type="text/javascript" src="src/components/app.js"></script>
    <script type="text/javascript" src="src/index.js"></script>
  </body>
</html>

```js
// index.js
console.log("testing...")
```
(in `src/index.js`)

## Connecting Rails and JavaScript - Make a Request with `fetch`


In `be-hoop-drills/app/controllers/application_controller.rb`:

```ruby
class ApplicationController < ActionContoller::API
  def test
    render json: { test: "success" }
  end
end
```

In `be-hoop-drills/config/routes.rb`:

```ruby
Rails.application.routes.draw do
  get '/test', to: 'application#test'
end
```

In `fe-hoop-drills/src/index.js`:

```javascript
// index.js
// test that we can get data from the backend
const BACKEND_URL = 'localhost:3000';
fetch(`${BACKEND_URL}/test`)
  .then(response => response.json())
  .then(parsedResponse => console.log(parsedResponse));
```

If you have your Rails server running, and you refresh your html page, you should see the success message logged to the JavaScript console.

`cd` into [src] folder


`mkdir adapters components`

```js
// index.js
const app = new App()

```

`touch adapters/workoutsAdapter.js`

The workoutsAdapter will be responsible for communicating
  with our rails API backend

```js
// workoutsAdapter.js

class workoutsAdapter {
  constructor() {
    this.baseUrl = "http://localhost:3000/api/v1/workouts"
  }

  getworkouts() {
    return fetch(this.baseUrl).then(res => res.json())
  }

  createworkout(body) {
    const workoutCreateParams = {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ body })
    }
    return fetch(this.baseUrl, workoutCreateParams).then(res => res.json())
  }

  deleteworkout(workoutId) {
    const workoutDeleteParams = {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json"
      }
    }
    return fetch(`${this.baseUrl}/${workoutId}`, workoutDeleteParams).then(res =>
      res.json()
    )
  }
}
```

`touch components/app.js components/workout.js components/workouts.js`

update App component

```js
// app.js
class App {
  constructor() {
    this.workouts = new Workouts()
  }
}
```

# Let's review the flow of the app:

`index.js` gets loaded and calls `new App()`
which will run the App constructor function defined above, which will set a
property on that newly created app called workouts that points to a new instance of
our `workouts` object. 

If that was confusing, stop, re-read it and walk through the
app so far until the flow makes sense. Managing all the different files and the
game of catch we're playing with them is key to understanding how this project
works.

# build workouts.js

---
```js
// workouts.js
class Workouts {
  constructor() {
    this.workouts = []
    this.initBindingsAndEventListeners()
    this.adapter = new WorkoutsAdapter()
    this.fetchAndLoadWorkouts()
  }

  initBindingsAndEventListeners() {
    this.workoutsForm = document.getElementById('new-workout-form')
    this.workoutInput = document.getElementById('new-workout-body')
    this.workoutsNode = document.getElementById('workouts-container')
    this.workoutsForm.addEventListener('submit',this.handleAddWorkout.bind(this))
    this.workoutsNode.addEventListener('click',this.handleDeleteWorkout.bind(this))
  }

  fetchAndLoadWorkouts() {
    this.adapter.getWorkouts()
    .then( workoutsJSON => workoutsJSON.forEach( workout => this.workouts.push( new Workout(workout) )))
      .then( this.render.bind(this) )
      .catch( (error) => console.log(error) )
  }

  handleAddWorkout() {
    event.preventDefault()
    const body = this.workoutInput.value
    this.adapter.createWorkout(body)
    .then( (workoutJSON) => this.workouts.push(new Workout(workoutJSON)) )
    .then(  this.render.bind(this) )
    .then( () => this.workoutInput.value = '' )
  }

  handleDeleteWorkout() {
    if (event.target.dataset.action === 'delete-workout' && event.target.parentElement.classList.contains("workout-element")) {
      const workoutId = event.target.parentElement.dataset.workoutid
      this.adapter.deleteWorkout(workoutId)
      .then( resp => this.removeDeletedWorkout(resp) )
    }
  }

  removeDeletedWorkout(deleteResponse) {
    this.workouts = this.workouts.filter( workout => workout.id !== deleteResponse.workoutId )
    this.render()
  }

  workoutsHTML() {
    return this.workouts.map( workout => workout.render() ).join('')
  }

  render() {
    this.workoutsNode.innerHTML = `<ul>${this.workoutsHTML()}</ul>`
  }
}
```


# * Next let's build out the `Workout` class/object in `workout.js`:

```js
class Workout {
  constructor(workoutJSON) {
    this.body = workoutJSON.body
    this.id = workoutJSON.id
  }

  renderShow() {
    return `<h3>${this.body}</h3>`
  }

  render() {
    return `<li data-workoutid='${this.id}' data-props='${JSON.stringify(
      this
    )}' class='workout-element'><a class="show-link" href='#'>${
      this.body
    }</a> <button data-action='edit-workout'>Edit</button> <i data-action='delete-workout' class="em em-scream_cat"></i></li>`
  }
}
```

# * Finally, let's add a little bit of styling.

 `touch styles/style.css`

```
body {
   font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
   font-weight: 300;
   line-height: 1.6em;
   font-size: 1.3em;
}

a {
    color:#97659;
   }

input {
  font-size: 1.5em;
}

.container {
  width: 960px;
  margin:auto;
  margin-top:50px;
}

ul {
  padding-left: 20px;
}

.delete-workout-link {
  color:red;
}
```


## Building the rest of your application

 have a Rails app running and you have a vanilla HTML and JavaScript client app that can talk to the Rails app. You'll want to add features to your project, to match your design. Where to next?

Some things to consider:

- To add _nouns_ to your world, create models in rails
- To _show_ your nouns, you'll need:

  1. A controller action to send the data
  2. A fetch request to ask for the data 
  3. Some JavaScript code to handle DOM-rendering 

- To make your page respond to the user, you'll need _event listeners_
- To keep your code clean, you should use JavaScript _classes_
- To organize your code, you can use multiple JavaScript files (don't forget to add `<script>` tags for each one!)

Good luck, and happy building!
