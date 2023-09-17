.PHONY: clean
clean:
	-rm -rf .venv
	-rm -rf .pytest_cache
	find . | grep -E "(/__pycache__$$|\.pyc$$|\.pyo$$)" | xargs rm -rf

.PHONY: init
init:
	-asdf plugin add $$(asdf plugin list all | grep 'python ')
	-asdf plugin add $$(asdf plugin list all | grep 'poetry ')
	poetry install
	poetry run pre-commit install

.PHONY: test
test: .venv
	poetry run pytest tests

.venv:
	poetry install
