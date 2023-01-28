package db

import (
  "context"
  "testing"
  "database/sql"
  "time"

  "github.com/cyhe50/blog/util"
  "github.com/stretchr/testify/require"
)

func CreateRandomArticle(t *testing.T) Article {
  arg := CreateArticleParams{
    Title: sql.NullString{String: util.RandomString(10), Valid: true},
    Content: sql.NullString{ String: util.RandomString(10), Valid: true},
  }

  article, err := testQueries.CreateArticle(context.Background(), arg)
  require.NoError(t, err)
  require.NotEmpty(t, article)

  return article
}

func TestCreateArticle(t *testing.T){
  article := CreateRandomArticle(t)

  require.NotZero(t, article.ID)
  require.NotZero(t, article.CreatedAt)
  require.NotZero(t, article.UpdatedAt)
}

func TestGetArticle( t *testing.T){
  article := CreateRandomArticle(t)

  queryResult, err := testQueries.GetArticle(context.Background(), article.ID)
  require.NoError(t, err)
  require.NotEmpty(t, queryResult)

  require.Equal(t, article.ID, queryResult.ID)
  require.Equal(t, article.Title, queryResult.Title)
  require.Equal(t, article.Content, queryResult.Content)

  require.WithinDuration(t, article.CreatedAt, queryResult.CreatedAt, time.Second)
}
