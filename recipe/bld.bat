cd python
"%PYTHON%" setup.py install --single-version-externally-managed --record record.txt 
if errorlevel 1 exit 1

:: No library build on windows!