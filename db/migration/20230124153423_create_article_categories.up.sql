CREATE TABLE "article_categories" (
  "id" int PRIMARY KEY,
  "category_id" int NOT NULL,
  "article_id" int NOT NULL
);

ALTER TABLE "article_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");
ALTER TABLE "article_categories" ADD FOREIGN KEY ("article_id") REFERENCES "articles" ("id");
