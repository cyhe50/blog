postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root blog

dropdb:
	docker exec -it postgres12 dropdb blog

migrate_up:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/blog?sslmode=disable" -verbose up

migrate_down:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/blog?sslmode=disable" -verbose down

sqlc_g:
	sqlc generate

.PHONY: postgres createdb dropdb migrate_up migrate_down sqlc_g

