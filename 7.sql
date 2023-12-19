use sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated?
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd.
-- These three actors have the same last name. So we do not want to include this last name in our output.
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

-- In the table actor, which are the actors whose last names are not repeated?

select last_name, COUNT(*) as name_count
from actor
group by last_name
having name_count = 1;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

select last_name
from actor
group by  last_name
having COUNT(*) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(*) as rental_counts
from rental 
group by staff_id;

-- 4. Using the film table, find out how many films were released each year

select EXTRACT(year from 2006) as release_year, count(*) as film_count
from film
group by EXTRACT(year from 2006)
order by release_year;

-- 5. Using the film table, find out for each rating how many films were there

select rating, count(*) as film_count
from film
group by  rating;

-- 6.What is the mean length of the film for each rating type. 
-- Round off the average lengths to two decimal places

select rating, ROUND(avg(length), 2) as mean_length
from film
group by rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

select rating
from film
group by rating
having avg(length) > 120;

