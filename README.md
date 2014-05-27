Flockly 
=============

Current hosted address:
sleepy-cliffs-2411.herokuapp.com


Source:
==========
git@github.com:feigningfigure/flockly.git


Summary
=============
Flockly is a way for anyone to see what others around them are interested in talking about.

How it works:  Users have locations which have messages.



Included gems
============

'awesome_print' <br>
'pry'<br>
'pry-rails'<br>
'gravtastic' (Bundled, but not implemented in current build)<br>
'bcrypt'<br>
'will_paginate' (Bundled, but not implemented in current build)<br>
'faker'<br>
'rails_12factor'<br>
'json' <br>
 'digest <br>
 geocoder
 
Issues
============
 1. User's message and location history are persistent after logging out.
 2. Messages outside of "nearby" range of the user are still displayed in the list.
 3. Gravatar images hash URLs are created using Digest::MD5 but do not properly generate the correct MD5 to display the correct gravatar image.
 4. Displayed results are improperly styled.  Currently using the responsive grid system with custom CSS added at the bottom.  
 5. User should be re-directed to an error page if geocoder times out and is unable to grab the coordinates of the user's address.
 6. CSS background not displaying.
 


