-- CHALLENGE 1

SELECT book_id, book_name, max_reservation_time
FROM books AS table1
WHERE max_reservation_time > (
                                SELECT AVG(max_reservation_time)
                                FROM books
                                GROUP BY library
                                HAVING library = table1.library
                              )

-- ALTERNATIVE SOLUTION

SELECT book_id, book_name, max_reservation_time
FROM books
JOIN (
      SELECT AVG(max_reservation_time), library
      FROM books
      GROUP BY library
) AS table2
ON table2.library = books.library
WHERE books.max_reservation_time > table2.avg

-- CHALLENGE 2

-- PART 1)

SELECT SUM(COUNT), mentor_name
FROM
     (SELECT COUNT (post_num), post_num
      FROM likes GROUP BY post_num
     )
AS likeCount
JOIN posts ON posts.num=likeCount.post_num
GROUP BY mentor_name

-- ALT SOLUTION
SELECT posts.mentor_name, COUNT(likes.post_num)
FROM (
      posts
      JOIN likes ON likes.post_num = posts.num
    )
GROUP BY posts.mentor_name
