# qubic-public
Public artifacts for Qubic crypto coin project

# Windows
- Install CUDA for Windows
- Install Docker Desktop for Windows
- Follow https://docs.nvidia.com/cuda/wsl-user-guide/index.html to configure CUDA for WSL2, particularly, `wsl --install Ubuntu22.04` and `wsl --update`
- Inside WSL2, install Nvidia Container Toolkit: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html (section "Installing with Apt")
- Put the miner downloaded from the pool ( https://github.com/qubic-li/client ) into `Volume` subdirectory and adjust the config to your personal mining settings
- Run build `build-docker.bat`
- Run `run-docker.bat` - you'll get a Bash shell into the Ubuntu 22.04 inside the container
- Go to `/app/work` (`cd /app/work`) and run your miner
