.PHONY: run-server

run-server:
	uvicorn app.main:app --reload --host 0.0.0.0 --port 8000