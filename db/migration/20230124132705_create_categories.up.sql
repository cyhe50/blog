CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "description" text,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);
