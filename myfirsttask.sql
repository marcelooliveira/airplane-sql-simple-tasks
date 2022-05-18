SELECT name FROM users WHERE
  LOWER(name) LIKE LOWER(:query)
  OR LOWER(email) LIKE LOWER(:query)
  OR LOWER(username) LIKE LOWER(:query);