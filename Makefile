.PHONY: clean
clean:
	-rm -rf .venv
	-rm -rf .pytest_cache
	find . | grep -E "(/__pycache__$$|\.pyc$$|\.pyo$$)" | xargs rm -rf

.PHONY: init
init: _init_vscode _init_asdf
	echo init completed

.PHONY: test
test: .venv
	poetry run pytest tests

.PHONY: _init_vscode
_init_vscode:
	code --install-extension streetsidesoftware.code-spell-checker ; \
	code --install-extension ms-python.python ; \
	code --install-extension ms-python.vscode-pylance ; \
	code --install-extension donjayamanne.python-extension-pack ; \
	code --install-extension bungcip.better-toml ; \
	code --install-extension foxundermoon.shell-format ; \
	code --install-extension timonwong.shellcheck

.PHONY: _init_asdf
_init_asdf:
	bash -c "asdf plugin add $$(asdf plugin list all | grep 'python ')"; \
	bash -c "asdf plugin add $$(asdf plugin list all | grep 'poetry ')"; \
	bash -c "SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk MACOSX_DEPLOYMENT_TARGET=12.3 asdf install"; \
	poetry install; \
	poetry run pre-commit install

.venv:
	poetry install
