# Phonolab Backend - Project-specific aliases for Fish shell

# testing
alias pyt="pytest"                                           # Run all tests
alias pyt-v="pytest -v"                                      # Run tests with verbose output
alias pyt-cov="pytest --cov=src tests/"                      # Run tests with coverage
alias pyt-html="pytest --cov=src --cov-report=html tests/"   # Run tests with HTML coverage report
alias pytb="pytest --cov=src --cov-report=html tests/ && /mnt/c/Program\\ Files/Mozilla\\ Firefox/firefox.exe \"file://///wsl.localhost/Ubuntu$(pwd)/htmlcov/index.html\""


# development
alias clean="find . -type d -name __pycache__ -exec rm -rf {} +; find . -name '*.pyc' -delete; rm -rf .pytest_cache .coverage htmlcov"
alias deps="pip install -e ."                           # Install project dependencies
alias devd="pip install -e '.[dev]'"                    # Install development dependencies

# linting
alias ifix="isort src/ tests/"                          # Sort imports
alias fix="autopep8 --in-place --recursive src/ tests/" # Auto-fix PEP 8 issues
alias fix-aggr="autopep8 --in-place --recursive --aggressive --aggressive src/ tests/"
alias lint="pylint src/"
alias style="pycodestyle src/ tests/"
alias ptree="tree -I '__pycache__|.pytest_cache|*.egg-info|htmlcov|.venv|venv|*.pyc|.mypy_cache|.coverage'"