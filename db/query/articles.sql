-- name: GetArticle :one
SELECT * FROM articles
WHERE id = $1 LIMIT 1;

-- name: ListArticles :many
SELECT * FROM articles
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateArticle :one
INSERT INTO articles (
  title, content
) VALUES (
  $1, $2
)
RETURNING *;

-- name: UpdateArticle :one
UPDATE articles
  set title = $2,
  content = $3
WHERE id = $1
RETURNING *;

-- name: DeleteArticle :exec
DELETE FROM articles
WHERE id = $1;
