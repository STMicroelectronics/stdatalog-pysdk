# STDATALOG-PYSDK Python software development kit (SDK) for data logging

![latest tag](https://img.shields.io/github/v/tag/STMicroelectronics/stdatalog-pysdk.svg?color=brightgreen)

The **[STDATALOG_PYSDK](https://github.com/STMicroelectronics/stdatalog-pysdk)** is a comprehensive Python framework designed to
facilitate the capture, processing, and visualization of data from a wide range of
sources, including sensors, algorithms, simulated signals, and telemetries from
actuators.

This software development kit is designed with an open and modular architecture,
making it an excellent resource for data scientists and embedded designers.
**STDATALOG-PYSDK** has been developed in **Python 3.13**, but it is also compatible with Python 3.12, 3.11 and 3.10.

It provides a range of tools and utilities designed to simplify the development of
applications that use data from ST system solutions.

It includes Python scripts to create, elaborate, and organize data into structured
datasets. These datasets are compatible with mainstream data science toolchains,
promoting reusability across multiple projects. Additionally, the scripts can be easily
integrated into any data science design workflow.

It was formerly known as **HSDPython_SDK**, previously distributed in **FP-SNS-DATALOG1**, **FP-SNS-DATALOG2**, and **FP-IND-DATALOGMC** function packs.

![](_htmresc/STDATALOG-PYSDK_Software_Architecture.svg)

Here is the list of references to user documents:

- [DB5446](https://www.st.com/resource/en/data_brief/stdatalog-pysdk.pdf) : Python software development kit (SDK) for data logging: complete toolkit with
extensive examples for developers.

## How to use

This repository has been created using the `git submodule` command. Please check the instructions below for proper use. Please check also **the notes at the end of this section** for further information.

1. To **clone** this repository along with the linked submodules, option `--recursive` has to be specified as shown below.

```bash
git clone --recursive https://github.com/STMicroelectronics/stdatalog-pysdk.git
```

2. To get the **latest updates**, in case this repository is **already** on your local machine, issue the following **two** commands (with this repository as the **current working directory**).

```bash
git pull
git submodule update --init --recursive
```

3. To clone a specific version issue the command below **after** specifying the targeted `vX.Y.Z` version.

```bash
git clone --recursive  --depth 1 --branch vX.Y.Z https://github.com/STMicroelectronics/stdatalog-pysdk.git
```

> [!NOTE]
> * Option `--depth 1` specified in instruction (3) above is **not** mandatory. It may be useful to skip downloading all previous commits up to the one corresponding to the targeted version.
> * If GitHub "Download ZIP" option is used instead of the `git clone` command, then the different submodules have to be collected and added **manually**.

## How to install STDATALOG-PYSDK 

The STDATALOG-PYSDK provides installer scripts that can be used to properly install the SDK and all the required dependencies.
STDATALOG-PYSDK has been developed in Python 3.13, but it is compatible also with Python 3.12, 3.11 and 3.10.
To properly use it, Python must be already installed on the machine before proceeding with the following procedure.

It is recommended to use a clean virtual environment for configuration. Navigate to the STDATALOG-PYSDK root directory, open a 
terminal, and run:
```sh
# Create the new virtual environment
python -m venv .venv
```
This command will create a new directory named .venv in your project root. This directory will contain a clean Python environment 
with its own installation of Python and pip.

*Using a virtual environment is highly recommended because it allows you to create an isolated environment for your project. 
This isolation ensures that the dependencies and packages required for your project do not interfere with those of other projects 
or the system-wide Python installation. It helps in maintaining a clean and manageable development environment, avoiding potential 
conflicts between different package versions, and making it easier to reproduce and share your project setup with others.*

### On Windows

Open a terminal from STDATALOG-PYSDK folder and activate the virtual environment.
```sh
python -m venv .venv
.\.venv\Scripts\activate
```

Launch the installer, the script will install the SDK with the required dependencies.
```sh
.\STDATALOG-PYSDK_install.bat
```

If you are behind a proxy server, you must specify it in the command, if you have special characters in your password, you will have to replace them with their corresponding hex representation. E.g., '&' --> %26.
```sh
.\STDATALOG-PYSDK_install.bat http://usr_name:password@proxyserver_name:port
```

When the installation is completed you can try one of the example scripts.
```sh
cd stdatalog_examples
python gui_applications/stdatalog/GUI/stdatalog_GUI.py
```

### On Linux

Open a terminal from STDATALOG-PYSDK folder and activate the virtual environment.
```sh
python3 -m venv .venv
source .venv/bin/activate
```

- The SDK has been built in a Windows environment. To avoid any possible issues while executing the script in a Linux environment, we suggest you use dos2unix to reformat the files properly.
```sh
sudo apt-get install dos2unix
dos2unix STDATALOG-PYSDK_install.sh STDATALOG-PYSDK_install_noGUI.sh STDATALOG-PYSDK_uninstall.sh
chmod 777 STDATALOG-PYSDK_install.sh STDATALOG-PYSDK_install_noGUI.sh STDATALOG-PYSDK_uninstall.sh
```

Launch the installer, the script will install the SDK with the required dependencies.
```sh
./STDATALOG-PYSDK_install.sh
```
If you are behind a proxy server, you must specify it in the command, if you have special characters in your password, you will have to replace them with their corresponding hex representation. E.g., '&' --> %26.
```sh
./STDATALOG-PYSDK_install.sh http://usr_name:password@proxyserver_name:port
```

Install the required USB drivers
```sh
cd linux_setup
dos2unix 30-hsdatalog.rules linux_USB_config_setup.sh linux_USB_config_removal.sh
chmod 777 linux_USB_config_setup.sh linux_USB_config_removal.sh
./linux_USB_config_setup.sh
```

Reboot the PC to be sure the new USB udev rules are loaded correctly.

Open a terminal from STDATALOG-PYSDK folder and try one of the example scripts.
```sh
./.venv/bin/activate
cd stdatalog_examples
python3 gui_applications/stdatalog/GUI/stdatalog_GUI.py
```

### On macOS

To run properly STDATALOG-PYSDK on macOS, Homebrew is required.
You must install it before moving on with the next steps.
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
 
Open a terminal from STDATALOG-PYSDK folder and activate the virtual environment.
```sh
python3 -m venv .venv
source .venv/bin/activate
```
- The SDK has been built in a Windows environment. To avoid any possible issues while executing the script in a Linux environment, we suggest you use dos2unix to reformat the files properly.
```sh
brew install dos2unix
dos2unix STDATALOG-PYSDK_install.sh STDATALOG-PYSDK_install_noGUI.sh STDATALOG-PYSDK_uninstall.sh
chmod +x STDATALOG-PYSDK_install.sh STDATALOG-PYSDK_install_noGUI.sh STDATALOG-PYSDK_uninstall.sh
```

Launch the installer, the script will install the SDK with the required dependencies.
```sh
./STDATALOG-PYSDK_install.sh
```
If you are behind a proxy server, you must specify it in the command, if you have special characters in your password, you will have to replace them with their corresponding hex representation. E.g., '&' --> %26.
```sh
./STDATALOG-PYSDK_install.sh http://usr_name:password@proxyserver_name:port
```

When the installation is completed you can try one of the example scripts.
```sh
cd stdatalog_examples
python3 gui_applications/stdatalog/GUI/stdatalog_GUI.py
```

## Known Limitations

- macOS support has been introduced in v1.1.0. Previous versions are not compatible.
- Python 3.13 is not officially supported.

## Development Toolchains and Compilers

- Compatible with Windows, Linux and macOS machines
- Python 3.13, 3.12, 3.11, 3.10

## Supported Devices and Boards

- All devices and boards supported by FP-SNS-DATALOG1, FP-SNS-DATALOG2, FP-IND-DATALOGMC and STSW-SDATALOG

- [B-U585I-IOT02A](https://www.st.com/en/evaluation-tools/b-u585i-iot02a.html)
- [STEVAL-AFCI1](https://www.st.com/en/evaluation-tools/steval-afci1.html)
- [STEVAL-MKBOXPRO](https://www.st.com/sensortileboxpro)
- [STEVAL-NBIOTV1](https://www.st.com/en/evaluation-tools/steval-nbiotv1.html)
- [STEVAL-STWINKT1B](https://www.st.com/stwin)

- [STEVAL-STWINBX1](https://www.st.com/stwinbox)
- [STEVAL-PDETECT1](https://www.st.com/en/evaluation-tools/steval-pdetect1.html)
- [STEVAL-C34KAT1](https://www.st.com/en/evaluation-tools/steval-c34kat1.html)
- [STEVAL-C34KAT2](https://www.st.com/en/evaluation-tools/steval-c34kat2.html)
- [STEVAL-C34KPM1](https://www.st.com/en/evaluation-tools/steval-c34kpm1.html)
- [EVLSPIN32G4-ACT](https://www.st.com/en/evaluation-tools/evlspin32g4-act.html)

- [NUCLEO-F401RE](https://www.st.com/en/evaluation-tools/nucleo-f401re.html)
- [NUCLEO-H7A3ZI-Q](https://www.st.com/en/evaluation-tools/nucleo-h7a3zi-q.html)
- [NUCLEO-L476RG](https://www.st.com/en/evaluation-tools/nucleo-l476rg.html)
- [NUCLEO-U545RE-Q](https://www.st.com/en/evaluation-tools/nucleo-u545re-q.html)
- [NUCLEO-U575ZI-Q](https://www.st.com/en/evaluation-tools/nucleo-u575zi-q.html)

- [X-NUCLEO-IKS02A1](https://www.st.com/en/ecosystems/x-nucleo-iks02a1.html)
- [X-NUCLEO-IKS4A1](https://www.st.com/en/evaluation-tools/x-nucleo-iks4a1.html)
- [X-NUCLEO-IKS5A1](https://www.st.com/en/evaluation-tools/x-nucleo-iks5a1.html)


## Backward Compatibility

- None

## Dependencies

- None
