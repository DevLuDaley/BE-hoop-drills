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

`rails g controller api/v1/drills --no-test-framework`
`rails g controller api/v1/routines --no-test-framework`

Add our index and create methods to `/app/controllers/api/v1/drills_controller`:

```rb
# app/controllers/api/v1/drills_controller

class Api::V1::DrillsController < ApplicationController
# before_action :find_drill, only: [:update]
  def index
    @drills = Drill.all.order(:created_at)
    render json: @drills, status: 200
  end

  def create
    @drill = Drill.create(drill_params)
    render json: @drill, status: 201
  end

  def destroy
    drill = Drill.find(params[:id])
    if drill.destroy
      render json: {drillId: drill.id}, status: 200
    end
  end

  def update
    @drill = Drill.find(params[:id])
    # if @drill.update(drill_params)
    #   render json: @drill, status: 200


#  @drill.update(drill_params)
    if @drill.save
      render json: @drill, status: :accepted
    else
      render json: { errors: @drill.errors.full_messages }, status: :unprocessible_entity
    # end
    end
  end

  private
    def drill_params
      params.require(:drill).permit(:type, :name, :duration, :distance)
    end


#   def drill_params
#     params.permit(:title, :content)
#   end

#   def find_drill
#     @drill = Drill.find(params[:id])
#   end
end

### Example Routes
```
The routes we define in `config/routes.rb` need to correspond to the namespaced controller we created. They should be defined as follows:

```ruby
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :drills #, only: [:index, :update], :routine
    end
  end
end

# end
```


Next let's setup our models:
`rails g model Routine routine_name:string`
-name

`rails g model Drill type:string, drill_name:string, reps:integer, sets:integer`
- type:
- name:
- reps:
- sets:


`rails g serializer routine`
`rails g serializer drill`

`RoutineSerializer` 
```ruby
# routine_serializer.rb
class RoutineSerializer < ActiveModel::Serializer
  # attributes :id
  # has_many :drills
  attributes :id, :routine_name # , :duration, :distance
end

```


```rb
# drill_serializer.rb
class DrillSerializer < ActiveModel::Serializer
  attributes :id, :drill_name, :drill_type, :sets, :reps
  # has_many :routines
  # attributes :name
end

```

# CREATE & MIGRATE DB
Then run 
`rails db:create` 
&&
`rails db:migrate`

Now that our model and table is setup, we should be able to create a new drill in the console


Test this by running rails c then 

```rb
Drill.create(drill_type: "Guard", drill_name: "dribbles-cross-over", reps: 10, sets: 3)

```

test api endpoints
`rails db:rest && rails s`

http://localhost:3000/api/v1/drills
http://localhost:3000/api/v1/routines

Add the following to `db/seeds.rb`:

```
Drill.create([
                 { drill_type: 'cardio', drill_name: 'basketball', reps: '1', sets: '1' },
                 { drill_type: 'cardio', drill_name: 'running', reps: '2', sets: '1' },
                 { drill_type: 'cardio', drill_name: 'bike_riding', reps: '1', sets: '1.5' },
                 { drill_type: 'cardio', drill_name: 'basketball', reps: '1', sets: '1.5' },
                 { drill_type: 'cardio', drill_name: 'bike_riding', reps: '1', sets: '1.5' },
                 { drill_type: 'cardio', drill_name: 'jogging', reps: '1', sets: '1' },
                 { drill_type: 'cardio', drill_name: 'sprinting', reps: '1', sets: '2.5' },
                 { drill_type: 'cardio', drill_name: 'bike_riding', reps: '1', sets: '1.5' },
                 { drill_type: 'cardio', drill_name: 'sprinting', reps: '1', sets: '2.5' },
                 { drill_type: 'cardio', drill_name: 'bike_riding', reps: '2', sets: '3.5' }
               ])

Routine.create([
                 { routine_name: 'Weight Training' },
                 { routine_name: 'Cardio Rush' },
                 { routine_name: 'Hoops' },
                 { routine_name: 'Batman Chest' },
                 { routine_name: 'Gym Glutes' }
               ])


```

# reset DB (if needed)
fix any db:seed errors then run `rails db:rest && rails s`

Once the reset command is used it will do the following:

Drop the database: `rails db:drop`
Load the schema: `rails db:schema:load`
Seed the data: `rails db:seed`

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

### Example Feature (Updating a drill)

We want to create the following features:

> As a user, when the page loads I should see a list of drills. Next to the title of each drill will be a button to edit that drill.

> As a user, when I click the edit button, I will see a form with the values of that drill in the input fields. I can make changes, click 'Save Drill' and see the changes reflected in the list of drills.

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
      <div id="new-drill-container">
        <form id="new-drill-form">
          <input type="text" name="drill-type" id="new-drill-type"> 
          <input type="text" name="drill-name" id="new-drill-name">
          <input type="text" name="drill-distance" id="new-drill-distance">
          <input type="text" name="drill-duration" id="new-drill-duration">
          <input type="submit" value="Save drill">
        </form>
      </div>
      <div id="drills-container">

      </div>
    </div>

    <script type="text/javascript" src="src/components/drill.js"></script>
    <script type="text/javascript" src="src/adapters/drillsAdapter.js"></script>
    <script type="text/javascript" src="src/components/drills.js"></script>
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

`touch adapters/drillsAdapter.js`

The drillsAdapter will be responsible for communicating
  with our rails API backend

```js
// drillsAdapter.js

class drillsAdapter {
  constructor() {
    this.baseUrl = "http://localhost:3000/api/v1/drills"
  }

  getdrills() {
    return fetch(this.baseUrl).then(res => res.json())
  }

  createdrill(body) {
    const drillCreateParams = {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ body })
    }
    return fetch(this.baseUrl, drillCreateParams).then(res => res.json())
  }

  deletedrill(drillId) {
    const drillDeleteParams = {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json"
      }
    }
    return fetch(`${this.baseUrl}/${drillId}`, drillDeleteParams).then(res =>
      res.json()
    )
  }
}
```

`touch components/app.js components/drill.js components/drills.js`

update App component

```js
// app.js
class App {
  constructor() {
    this.drills = new Drills()
  }
}
```

# Let's review the flow of the app:

`index.js` gets loaded and calls `new App()`
which will run the App constructor function defined above, which will set a
property on that newly created app called drills that points to a new instance of
our `drills` object. 

If that was confusing, stop, re-read it and walk through the
app so far until the flow makes sense. Managing all the different files and the
game of catch we're playing with them is key to understanding how this project
works.

# build drills.js

---
```js
// drills.js
class Drills {
  constructor() {
    this.drills = []
    this.initBindingsAndEventListeners()
    this.adapter = new DrillsAdapter()
    this.fetchAndLoadDrills()
  }

  initBindingsAndEventListeners() {
    this.drillsForm = document.getElementById('new-drill-form')
    this.drillInput = document.getElementById('new-drill-body')
    this.drillsNode = document.getElementById('drills-container')
    this.drillsForm.addEventListener('submit',this.handleAddDrill.bind(this))
    this.drillsNode.addEventListener('click',this.handleDeleteDrill.bind(this))
  }

  fetchAndLoadDrills() {
    this.adapter.getDrills()
    .then( drillsJSON => drillsJSON.forEach( drill => this.drills.push( new Drill(drill) )))
      .then( this.render.bind(this) )
      .catch( (error) => console.log(error) )
  }

  handleAddDrill() {
    event.preventDefault()
    const body = this.drillInput.value
    this.adapter.createDrill(body)
    .then( (drillJSON) => this.drills.push(new Drill(drillJSON)) )
    .then(  this.render.bind(this) )
    .then( () => this.drillInput.value = '' )
  }

  handleDeleteDrill() {
    if (event.target.dataset.action === 'delete-drill' && event.target.parentElement.classList.contains("drill-element")) {
      const drillId = event.target.parentElement.dataset.drillid
      this.adapter.deleteDrill(drillId)
      .then( resp => this.removeDeletedDrill(resp) )
    }
  }

  removeDeletedDrill(deleteResponse) {
    this.drills = this.drills.filter( drill => drill.id !== deleteResponse.drillId )
    this.render()
  }

  drillsHTML() {
    return this.drills.map( drill => drill.render() ).join('')
  }

  render() {
    this.drillsNode.innerHTML = `<ul>${this.drillsHTML()}</ul>`
  }
}
```


# * Next let's build out the `Drill` class/object in `drill.js`:

```js
class Drill {
  constructor(drillJSON) {
    this.body = drillJSON.body
    this.id = drillJSON.id
  }

  renderShow() {
    return `<h3>${this.body}</h3>`
  }

  render() {
    return `<li data-drillid='${this.id}' data-props='${JSON.stringify(
      this
    )}' class='drill-element'><a class="show-link" href='#'>${
      this.body
    }</a> <button data-action='edit-drill'>Edit</button> <i data-action='delete-drill' class="em em-scream_cat"></i></li>`
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

.delete-drill-link {
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
