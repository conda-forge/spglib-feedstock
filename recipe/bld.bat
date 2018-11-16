cd python
"%PYTHON%" setup.py install
if errorlevel 1 exit 1

:: No library build on windows!
