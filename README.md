# newappRoR_postgresql_tailwindcss_devise

This clean Ruby on Rails new app template may be cloned and used to quickly launch new apps with the following pre-installed and configured:
  - PostgreSQL database
  - Tailwind CSS default stylesheet
  - Devise gem (basic User sign-in and registration already programmed)

Ruby version 3.2.2
    
# Here are the commands that created the app, which you may reproduce in shell.

- [ ] **STEP 1: Create new app**

`rails new app_name - d postgresql -css tailwind`

`bundle add devise`

`bundle install`

`rails g devise:install`


- [ ] **STEP 2: Configure Devise following terminal prompts**

Add to config/environment/development.rb (sets development environment host):


`config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`

 
Add to config/routes.rb (defines root):

   
`root "static_pages#index"`

 
Add to app/views/layouts/application.html.erb (activates flash notifications):


`<p class="notice"><%= notice %></p>
 
<p class="alert"><%= alert %></p>`

  
Create views

`rails g devise:views`


- [ ] **STEP 3: Create view for landing page**

`rails g controller StaticPages index`

add route for static_pages#index in routes.rb:

`get 'static_pages#index', to: 'static_pages#index'`
   
create view for static_pages#index

`touch app/views/static_pages/index.html.erb`

Put anything in HTML to test: 

`<h1>static_pages#index</h1>`


- [ ] **STEP 4: Create database and test**

`bin/rails db:create`

Once the preceding steps have been completed, run a rails server to ensure correct installation/config. The page should display: static_pages#index.

`rails s`

- [ ] **STEP 5: Create User via Devise**

`rails g devise User`

`rails g devise:views`

`rails db:migrate`

Paste the following code in app/views/static_page/index.html.erb to display links:

<ul>
	
    <% if user_signed_in? %>
	    
      <li>
        <%= link_to "Sign out", destroy_user_session_path, method: :delete, data: {turbo_method: :delete} %>
      </li>

      <li>
        Voici ton email : <%= current_user.email %>
      </li>

      <li>
        <%= link_to "Secret page", static_pages_secret_path %>
      </li>

      <li>
       <%= link_to "Edit email / password", edit_user_registration_path %>
      </li>

    <% else %>
      <li>    
        <%= link_to "Sign in", new_user_session_path %>
      </li>

      <li>
        <%= link_to "Sign up", new_user_registration_path %>
      </li>

    <% end %>

    <% if user_signed_in? %>
      <p>Welcome, <%= current_user.email %>.</p>
    <% end %>
  </ul>

`touch app/views/static_pages/index.html.erb`

Paste the following codein static_pages#secret

`<h1>StaticPages#secret</h1>`
`<p>Find me in app/views/static_pages/secret.html.erb</p>
<% if user_signed_in? %>
  <p>This is a secret page visible to signed-in users.</p>
<% else %>
  <p>You need to sign in to access this secret page.</p>
<% end %>`

