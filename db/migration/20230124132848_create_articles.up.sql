CREATE TABLE "articles" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "content" text,
  "created_at" timestamptz DEFAULT (now()),
  "updated_at" timestamptz DEFAULT (now())
);
