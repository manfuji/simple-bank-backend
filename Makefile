postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=secret -d postgres
createdb:
	docker exec -it postgres createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres dropdb --username=postgres  simple_bank

migrateup:
	migrate -path db/migration -database "postgres://postgres:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://postgres:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONEY:postgres createdb dropdb migratedown migrateup sql