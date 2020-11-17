def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  WHERE books.series_id = 1
  ORDER BY books.year;"
end
#show book title and book year from the BOOKS TABLE where the books.series is 1 and order them by year ASC.

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC LIMIT 1;"
end
#show the name and motto from the CHARACTERS TABLE and showe it ordered by length, limit it to 1 motto.

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
  ORDER BY species
  DESC LIMIT 1;"
end
#show the most popular species and the count as well, from the CHARACTERS TABLE

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  JOIN series
  ON authors.id = series.author_id
  JOIN subgenres
  ON subgenres.id = series.subgenre_id;"
end
#show the authors names and their subgenres from the JOINED AUTHORS TABLE and SERIES TABLE, and then in the AUTHORS TABLE look for authors whos .id column matches up with the author_id column in the SERIES TABLE and then in the SERIES TABLE, look for subgenres whose .subgenre_id column matches up with the .id column in the SUBGENRES TABLE?? 

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  LEFT JOIN books
  ON series.id = books.series_id
  JOIN character_books
  ON books.id = character_books.book_id
  JOIN characters
  ON character_books.character_id = characters.id
  WHERE characters.species = \"human\"
  GROUP BY characters.name
  ORDER BY COUNT(characters.name) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name,
  COUNT(characters.name)
  FROM characters
  LEFT JOIN character_books
  ON characters.id = character_books.character_id
  GROUP BY characters.id
  ORDER BY COUNT(characters.name) DESC, characters.name ASC;"
end
