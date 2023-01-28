CREATE TABLE "articles" (
  "id" bigserial PRIMARY KEY,
  "title" varchar,
  "content" text,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);
