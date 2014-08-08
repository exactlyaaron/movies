## Features

  * Allows users to get movie recommendations based on:
    * Genres
    * Actors
    * Directors
    * Previously 'liked' movies

## User Stories

### Add a Movie (with name and plot)
As a user looking for future movie suggestions,
I want to add movies to a database,
in order to have a larger group to get suggestions from.

Usage:
  - `./movies` *starts the application*
  - `4` *Selects "Add a movie" from the main menu*
  - `Speed Racer` *User is prompted to type the name of the movie*
  - `...plot synopsis...` *User is then prompted to enter a plot synopsis*
  - `y` *User is shown details and asked to confirm*

---
### Add a Movie (with genres)
As a user looking for future movie suggestions,
I want to add movies with specified genres to a database,
in order to have a better collection to get suggestions from.

Usage:
  - `./movies` *starts the application*
  - `4` *Selects "Add a Movie" from the main menu*
  - `Lord of the Rings: The Fellowship of the Ring` *User is prompted to type the name of the movie*
  - `...plot synopsis...` *User is then prompted to enter a plot synopsis*
  - `fantasy, action` *User is shown details and asked to confirm*
  - `y` *User is shown details and asked to confirm*

---
### Add a Movie (with director)
As a user looking for future movie suggestions,
I want to add movies with specified director(s) to a database,
in order to have a better collection to get suggestions from.

Usage:
  - `./movies` *starts the application*
  - `4` *Selects "Add a Movie" from the main menu*
  - `Lord of the Rings: Fellowship of the Ring` *User is prompted to type the name of the movie*
  - `...plot synopsis...` *User is then prompted to enter a plot synopsis*
  - `fantasy, action` *User is shown details and asked to confirm*
  - `Peter Jackson` *User is prompted to specify the director*
  - `y` *User is shown details and asked to confirm*

---
### Add a Movie (with actors)
As a user looking for future movie suggestions,
I want to add movies with specified actors(s) to a database,
in order to have a better collection to get suggestions from.

Usage:
  - `./movies` *starts the application*
  - `4` *Selects "Add a Movie" from the main menu*
  - `Lord of the Rings: Fellowship of the Ring` *User is prompted to type the name of the movie*
  - `...plot synopsis...` *User is then prompted to enter a plot synopsis*
  - `fantasy, action` *User is shown details and asked to confirm*
  - `Peter Jackson` *User is prompted to specify the director*
  - `Elijah Wood, Orlando Bloom, Sean Bean` *User is prompted to enter actors from the movie*
  - `y` *User is shown details and asked to confirm*

---
### Genre Parameter

As a user looking for a movie suggestion,
I want to specify a genre I enjoy,
in order to find a movie with similar genres.

Usage:
  - `./movies` *starts the terminal application*
  - `2` *Selects "Get Suggestions" from the main menu*
  - `1` *Selects "Genres" from the parameters list*
  - `Horror` *Specifies a genre to get suggestions*

Acceptance Criteria: Prints out a list of movies that share the specified genre (or error message if no movies match)

---
### Director Parameter

As a user looking for a movie suggestion,
I want to specify a director I enjoy,
in order to find movies from the same director.

Usage:
  - `./movies` *starts the terminal application*
  - `2` *Selects "Get Suggestions" from the main menu*
  - `2` *Selects "Directors" from the parameters list*
  - `Guy Ritchie` *Specifies a director to get suggestions*

Acceptance Criteria: Prints out a list of movies that share the specified director (or error message if no movies match)

---
### Movie Detail Page

As a user looking for a movie suggestion,
I want to see details about a movie,
in order to learn about it and specify if I liked it or not.

Usage:
  - `....` *commands to get to a movie listing (suggestions or browse list)*
  - `[num]` *Specifies the [num] movie from the list*

Acceptance Criteria: Prints a detail of the movie including title, genres, actors, director, and a short plot synopsis.

---
### 'Like' a Movie

As a user looking for a movie suggestion,
I want to specify a movies I enjoy,
in order to reference this list in the future.

Usage:
  - `....` *commands to get to a movie detail page*
  - `y` *Specifies that I liked this movie upon the y/n prompt*

Acceptance Criteria: Prints a confirmation message that the movie was added to the 'liked' list
