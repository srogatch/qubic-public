set "RELATIVE_PATH=Volume"
for %%i in ("%RELATIVE_PATH%") do set "ABSOLUTE_PATH=%%~fi"
@echo Will store Docker volume in: %ABSOLUTE_PATH%

mkdir "%ABSOLUTE_PATH%"
docker run --gpus all -v "%ABSOLUTE_PATH%":/app/work -it qubic-pool-gpu-miner /bin/bash
