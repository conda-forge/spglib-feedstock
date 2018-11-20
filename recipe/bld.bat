md python\src
copy src\*.* python\src
cd python
"%PYTHON%" -m pip install .
if errorlevel 1 exit 1

:: No library build on windows!
