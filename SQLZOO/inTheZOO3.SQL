/*  This is my answer key to the more joins section
of SQLZOO .  There are likely a variety of answers to
problems that will return the correct dataset, but these 
are mine.  The last three were challenging and took a bit of
time to understand in detail.  
These are all written in MYSQL */ 


/*  http://sqlzoo.net/wiki/More_JOIN_operations */ 


/* 1.  List the films where the yr is 1962 [Show id, title] */ 

SELECT id, title
 FROM movie
 WHERE yr=1962
 
 
/*  2. Give year of 'Citizen Kane'. */ 

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'



/*  3. List all of the Star Trek movies, include the id, title and yr 
(all of these movies include the words Star Trek in the title). Order results by year. */ 


SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%' 
ORDER BY yr



/* 4. What are the titles of the films with id 11768, 11955, 21191 */ 

SELECT title
FROM movie
WHERE id IN ('11768', '11955', '21191')



/*  5. What id number does the actress 'Glenn Close' have? */
 
SELECT id
FROM actor
WHERE name = "Glenn Close"

/*  6.  What is the id of the film 'Casablanca' */

SELECT id
FROM movie
WHERE title = "Casablanca"



/*  7.  Obtain the cast list for 'Casablanca'.
        Use movieid=11768, this is the value that you obtained in the previous question. */
        
SELECT name
FROM actor
JOIN casting on (actor.id = casting.actorid)
WHERE movieid = 11768


/*  8. Obtain the cast list for the film 'Alien'  */


SELECT name
FROM actor
JOIN casting on (actor.id = casting.actorid)
WHERE movieid = 10522


/* 9.  List the films in which 'Harrison Ford' has appeared  */ 

SELECT movie.title, actor.id, casting.movieid, actor. name
FROM movie
INNER JOIN casting on (casting.movieid = movie.id)
INNER JOIN actor on (actor.id = casting.actorid)
WHERE actor.name = 'Harrison Ford' 




/*  10.  List the films where 'Harrison Ford' has appeared - but not in the starring role. 
[Note: the ord field of casting gives the position of the actor. 
If ord=1 then this actor is in the starring role]  */ 

SELECT movie.title
FROM movie
INNER JOIN casting on (casting.movieid = movie.id)
INNER JOIN actor on (actor.id = casting.actorid)
WHERE (actor.name = 'Harrison Ford' AND casting.ord != 1)



/*  11.  List the films together with the leading star for all 1962 films.  */

SELECT movie.title, actor.name
FROM movie
INNER JOIN casting on (movie.id = casting.movieid)
INNER JOIN actor on (actor.id = casting.actorid)
WHERE (movie.yr = 1962 AND casting.ord = 1)



/* 12.  Which were the busiest years for 'John Travolta', show the year and the number of 
movies he made each year for any year in which he made more than 2 movies. */ 

SELECT yr, COUNT(title) 
FROM movie 
    JOIN casting ON (movie.id=movieid)
    JOIN actor ON (actorid=actor.id)
       WHERE name='John Travolta'
         GROUP BY yr
           HAVING COUNT(title) > 2


/* 13.  List the film title and the leading actor for all of the films 'Julie Andrews' 
played in.  */ 


SELECT movie.title, actor.name
FROM movie
JOIN casting ON (movie.id =  casting.movieid)
JOIN actor ON (actor.id = casting.actorid)
WHERE casting.ord = 1 AND movieid IN (
SELECT movieid
FROM casting INNER JOIN actor ON (actor.id = casting.actorid)
WHERE name = "Julie Andrews")



/*  14. Obtain a list, in alphabetical order, of actors who've had at least 30 starring 
roles  */ 

SELECT DISTINCT actor.name
FROM actor
INNER JOIN casting ON (actor.id = casting.actorid)
WHERE actorid IN (
   SELECT actorid
    FROM casting 
    WHERE ord = 1
    GROUP BY actorid
    HAVING COUNT(movieid) >= 30)
ORDER BY actor.name ASC



/* 15.  List the films released in the year 1978 ordered by the number of actors in the 
cast. */ 

SELECT movie.title, count(actorid)
FROM casting 
INNER JOIN movie ON (movie.id = casting.movieid)
WHERE movie.yr = 1978
GROUP BY movieid
ORDER BY COUNT(actorid) DESC



/* 16.  List all the people who have worked with 'Art Garfunkel'. */ 

SELECT DISTINCT name
FROM actor INNER JOIN casting ON (actor.id = casting.actorid)
WHERE name != "Art Garfunkel" AND movieid IN (
SELECT casting.movieid
FROM actor INNER JOIN casting ON (actor.id = casting.actorid)
WHERE name = 'Art Garfunkel')









