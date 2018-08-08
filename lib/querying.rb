def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
    SELECT title, 
           year
    FROM   books
    WHERE  series_id = 1
    ORDER BY year;
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  <<-SQL
    SELECT name AS character_name,
           motto AS longest_motto
    FROM   characters
    ORDER BY LENGTH(motto) DESC
    LIMIT 1;
  SQL
end

def select_value_and_count_of_most_prolific_species
  <<-SQL
    SELECT species,
           COUNT(*) AS quantity
    FROM   characters
    GROUP BY species
    ORDER BY quantity DESC
    LIMIT 1;
  SQL
end

def select_name_and_series_subgenres_of_authors
  <<-SQL
    SELECT a.name AS author_name,
           sg.name AS subgenre_name
    FROM   authors a
    INNER JOIN series s ON a.id = s.author_id
    INNER JOIN subgenres sg ON s.subgenre_id = sg.id;
  SQL
end

def select_series_title_with_most_human_characters
  <<-SQL
    SELECT s.title
    FROM   series s
    INNER JOIN characters c ON c.series_id = s.id
    WHERE  c.species = "human"
    GROUP BY s.title
    ORDER BY COUNT(c.species) DESC
    LIMIT 1;
  SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
    SELECT c.name,
           COUNT(b.book_id) AS number_of_books
    FROM   characters c
    INNER JOIN character_books b ON b.character_id = c.id
    GROUP BY c.name
    ORDER By number_of_books DESC;
  SQL
end
