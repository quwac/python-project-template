#!/bin/bash

# Install Visual Studio Code Extensions
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension donjayamanne.python-extension-pack
code --install-extension himanoa.Python-autopep8
code --install-extension bungcip.better-toml
code --install-extension foxundermoon.shell-format
code --install-extension timonwong.shellcheck

# Install Python
python_version=$(head -1 ".python-version")
installed=$(pyenv versions --bare | grep "$python_version")
if [ "$python_version" != "$installed" ]; then
    LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib" pyenv install "$python_version"
fi

# Install Python modules
if [ -e ".venv" ]; then
    rm -rf .venv
fi
poetry install

# Install Node.js modules for Pyright
if [ -e "node_modules" ]; then
    rm -rf node_modules
fi
npm install
