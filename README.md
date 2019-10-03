# README

Following [this great tutorial](https://groundberry.github.io/development/2017/03/18/build-an-app-with-rails-and-react-the-back-end.html) I could acomplish this workaround to access the GitHub API without
any related Gem.

Basically there's a service dedicated to authenticate user. It redirects
to the autorization page on Github, once the user autorizes the Rails
app to access his GitHub profile it get the _**autorization code**_ and
uses it to get an _**access token**_ and finally we can claim users
information from GitHub using that token.

Then, we persist the user in the database using the gotten data from
GitHub and right away we create a JWT to be returned to the client
application which in this case is a ReactJS one.

Finally we redirect the user to the app client app URL `ENV['FLASHCARDS_CLIENT_URL']`.

> We need to find a way to pass down the token when redirecting to the client
> URL so we can keep the user logged in and use the toke for further
> request.

- This is the endpoint to access the authentication service.
  ```ruby
  get '/auth/github', to: 'authentication#github', format: false
  ```
