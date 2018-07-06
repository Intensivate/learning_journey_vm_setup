## Setting-up environment for the L2$ project

### Virtual Machine

Before running the scripts, please first create a Virtual Machine as explained [here](https://github.com/librecores/riscv-sodor/wiki/Chisel-Environment).

### Running the scripts

Please run the scripts in the following order:

1. `source setup_general.sh`
1. `source setup_L2_cache.sh`

If you face any other issue than what's described below, please make sure you've run the first script with appropriate privileges and that your VM has been correctly set-up. If the error persists, please post it and explain at [User Experiences](https://github.com/librecores/riscv-sodor/wiki/User-Experiences) page and then inform us by writing to `aleksandar [dot] pajkanovic (at) g m a i l`.

### An issue to pay attention to and how to solve it

Towards the end of its operation, the script `setup_L2_cache.sh` might report the following error:

```
Makefrag-verilator:71: recipe for target 'emulator-freechips.rocketchip.system-DefaultConfig' failed
make: *** [emulator-freechips.rocketchip.system-DefaultConfig] Error 2
```

If such an event occures, please `cd learning_journey_rocket_chip` and paste the following into bash:

```
unset VERILATOR_ROOT
export PROJ_NAME=F
export RISCV=$PWD/riscv-tools
export MAKEFLAGS="$MAKEFLAGS -j1"
export PATH=$RISCV/bin:$RISCV/../emulator/verilator/install/bin:$PATH
export VERILATOR_ROOT=$RISCV/../emulator/verilator/install/
```

These lines are part of `set_env.sh`, but for some reason, still unknown, they don't execute in the expected manner. Once these are pasted in this way, the error will go away - please **re-run the second script** from the `learning_journey_vm_setup` directory.

There should be no errors anymore. If any do appear, please double check whether you successfully set the virtual machine settings and correctly installed Mint 18. If yes, please also take a moment to confirm that the first script, `setup_general.sh` run successfully. If strange behavior is met during execution of either of these steps - please use the [User Experiences](https://github.com/librecores/riscv-sodor/wiki/User-Experiences) page to describe your situation and then inform us by writing to `aleksandar [dot] pajkanovic (at) g m a i l`.

### Building the project

Please follow along the instructions given [here](https://github.com/freechipsproject/rocket-chip#building-the-project).

## Resources

For more details please visit [Chisel Learning Journey](https://github.com/librecores/riscv-sodor/wiki) and post any questions in [User Experiences](https://github.com/librecores/riscv-sodor/wiki/User-Experiences) page.

