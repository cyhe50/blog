package db

import (
  "context"
  "testing"
  "database/sql"

  "github.com/stretchr/testify/require"
)

func TestCreateArticle(t *testing.T){
  arg := CreateArticleParams{
    Title: sql.NullString{String: "test1", Valid: true},
    Content: sql.NullString{ String: "test of content", Valid: true},
  }

  article, err := testQueries.CreateArticle(context.Background(), arg)

  require.NoError(t, err)
  require.NotEmpty(t, article)
  require.Equal(t, arg.Title, article.Title)
  require.Equal(t, arg.Content, article.Content)

  require.NotZero(t, article.ID)
  require.NotZero(t, article.CreatedAt)
  require.NotZero(t, article.UpdatedAt)
}
