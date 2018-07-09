## Setting-up environment for the L2$ project

### Virtual Machine

Before running the scripts, please first create a Virtual Machine as explained [here](https://github.com/librecores/riscv-sodor/wiki/Chisel-Environment).

### Running the scripts

Kindly first take a moment to check within your home directory wheter you have a directory named `learning-journey`, as a consequence of cloning the Learning Journey repo. If so, please remove it:

`rm -rf ~/learning-journey`

as this is a remnant of the old repo structure. Please don't delete it later on - re-running the scripts is the way to go if any problem occurs.

Once your home directory is clean, please run the scripts in the following order:

1. `source setup_general.sh`
1. `source setup_L2_cache.sh`

If you face any other issue (than the one described below), please make sure you've run the first script with appropriate privileges and that your VM has been correctly set-up. If the error persists, please post it and explain at [User Experiences](https://github.com/librecores/riscv-sodor/wiki/User-Experiences) page and then inform us by writing to `aleksandar [dot] pajkanovic (at) g m a i l`.

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

These lines are part of `set_env.sh`, but for some reason, still unknown, they don't execute in the expected manner (if you see a reason and have a solution, **please do offer** - we gladly consider and accept pull requests). Once these are pasted in this way, the error will go away - please **re-run the second script** from the `learning_journey_vm_setup` directory (**don't delete** the `~/learning-journey` directory!).

There should be no errors anymore. If any do appear, please double check whether you successfully set the virtual machine settings and correctly installed Mint 18. If yes, please also take a moment to confirm that the first script, `setup_general.sh` run successfully. If strange behavior is met during execution of either of these steps - please use the [User Experiences](https://github.com/librecores/riscv-sodor/wiki/User-Experiences) page to describe your situation and then inform us by writing to `aleksandar [dot] pajkanovic (at) g m a i l`.

### Building the project

As given in the [rocket-chip](https://github.com/freechipsproject/rocket-chip#building-the-project) original repo, we first build the C simulator:

```
cd emulator
make
```

To build a C simulator that is capable of VCD waveform generation, please run:

```
cd emulator
make debug
```

They also offer the VCS simulator, but we can not provide the software reqiured, so please **do not** try this while working within this repo.

To run a set of assembly tests or simple benchmarks, please do:

```
make -j1 run-asm-tests
make -j1 run-bmark-tests
```

Finally, to run the assembly tests on the C simulator and generate waveforms:

```
make -j1 run-asm-tests-debug
make -j1 run-bmark-tests-debug
```

Once the scripts finish successfully, please do go through these (no need for waveforms in the first run) and confirm that everything works well. Again, if any issues are met, please do post them at [User Experiences](https://github.com/librecores/riscv-sodor/wiki/User-Experiences) page.

## Resources

For more details please visit [Chisel Learning Journey](https://github.com/librecores/riscv-sodor/wiki) and post any questions in [User Experiences](https://github.com/librecores/riscv-sodor/wiki/User-Experiences) page.

