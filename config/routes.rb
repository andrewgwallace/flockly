Rails.application.routes.draw do


root :to => 'users#new'

# resources :users
# resources :messages
# resources :location



#----USERS----

# Index page of all users (Admin User Only)
# get '/users' => 'users#index', as: :users
# Get page for new user creation (i.e. 'Sign-Up')

get    'signup' => 'users#new', as: :signup
# get    '/users/new' => 'users#new', as: :new_user
# Process form data on new user page and add user to db.
post   '/users' => 'users#create'
# show LOGIN form
get "/users/login" => "users#login", as: :user_login
# process login form
post "/users/login" => "users#process_login"
#Delete the user from the database (User or Admin only)
delete '/users/:id' => 'users#destroy'



# # Get the edit user data.
# # get    '/users/:id/edit' => 'users#edit', as: :edit_user
# # Show an individual user's information (optional)
# ## get    '/users/:id'  =>        'users#show', as: :user
# # Make udpates from the edit user page.
# #patch  '/users/:id' => 'users#update'


# #------SESSION----

# # Login a pre-existing user form
get '/logout' => 'sessions#destroy', :as => 'logout'
get '/login' => 'sessions#new', :as => 'login'
# # Process the login of an existing user
resources :sessions


# #----MESSAGES----

# Get all messages
get    '/messages' => 'messages#index', as: :messages
# Display message by a particular user
# get    '/messages/:id' => 'messages#show', as: :message
#Get page to create a new message by user
get    '/messages/new' => 'messages#new', as: :new_message
# Enter the message from the form into the database
post   '/messages/new' => 'messages#create'
# Get the page with the message for editing.
get    '/messages/:id/edit' => 'messages#edit', as: :edit_message
# Update the page from the edit form in the database.
patch  '/messages/:id' => 'messages#update'
# Remove the message from the database (ie. 'User checkout')
delete '/messages/:id' => 'messages#destroy'
resources :messages


#----LOCATIONS----

#List of currently checked-in locations (Admin only -- Optional)
get    '/locations' => 'locations#index', as: :locations

# Form for user's location
get    '/locations/new' => 'locations#new', as: :new_location
# Post geocoder location data into db for user.
post   '/locations' => 'locations#create'

#Used to display current location to each user
get    '/locations/:id' => 'locations#show', as: :location

# Remove the user's location when they have checked out.
delete '/locations/:id' => 'locations#destroy'

resources :locations

end
