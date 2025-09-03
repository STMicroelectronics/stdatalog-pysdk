---
pagetitle: Release Notes for STDATALOG_PYSDK 
lang: en
header-includes: <link rel="icon" type="image/x-icon" href="_htmresc/favicon.png" />
---

::: {.row}
::: {.col-sm-12 .col-lg-4}

<center> 
# Release Notes for <mark>STDATALOG_PYSDK</mark> 
Copyright &copy; 2025 STMicroelectronics
    
[![ST logo](_htmresc/st_logo_2020.png)](https://www.st.com){.logo}
</center>


# Purpose

The **[STDATALOG_PYSDK](https://github.com/STMicroelectronics/stdatalog-pysdk)** is a comprehensive Python framework designed to
facilitate the capture, processing, and visualization of data from a wide range of
sources, including sensors, algorithms, simulated signals, and telemetries from
actuators.

This software development kit is designed with an open and modular architecture,
making it an excellent resource for data scientists and embedded designers.
**STDATALOG-PYSDK** has been developed in **Python 3.13**, but it is compatible also with Python 3.12, 3.11 and 3.10.

It provides a range of tools and utilities designed to simplify the development of
applications that use data from ST system solutions.

It includes Python scripts to create, elaborate, and organize data into structured
datasets. These datasets are compatible with mainstream data science toolchains,
promoting reusability across multiple projects. Additionally, the scripts can be easily
integrated into any data science design workflow.

It is formerly known as **HSDPython_SDK**, previously distributed in **FP-SNS-DATALOG1**, **FP-SNS-DATALOG2**, and **FP-IND-DATALOGMC** function packs

:::

::: {.col-sm-12 .col-lg-8}
# Update History

::: {.collapse}
<input type="checkbox" id="collapse-section4" checked aria-hidden="true">
<label for="collapse-section4" aria-hidden="true">v1.2.1 / 29-Aug-25</label>
<div>


## Main Changes

### Patch Release

- Solved issue #6: accepted proposal from @YumTaha
- Solved issues and accepted pull requests in stdatalog_example and stdatalog_gui
- Fixed to_parquet and h5 converters
- Added stdatalog_API_examples_SerialLink.py example in stdatalog_examples\function_tests
- Refer to each package Release_Notes for the detailed changelog


</div>
:::

::: {.collapse}
<input type="checkbox" id="collapse-section3" checked aria-hidden="true">
<label for="collapse-section3" aria-hidden="true">v1.2.0 / 20-Jun-25</label>
<div>


## Main Changes

### Maintenance Release

- Added support to Python 3.13
- Redesigned USB catalog management: local catalog automatically synched with the online catalog
- Removed dependency from matplotlib: use Parquet + Plotly (wResampler) + Dash as default for HSDatalog_v2 plots
- Updated type_conversion, managing float_t, double_t, int_24_t, uint24_t
- Updated ACTUATOR components and properties management
- Integration of new staiotcraft_sdk library version
- Bug fixing and code cleaning
- Refer to each package Release_Notes for the detailed changelog


</div>
:::

::: {.collapse}
<input type="checkbox" id="collapse-section2" aria-hidden="true">
<label for="collapse-section2" aria-hidden="true">v1.1.0 / 9-Apr-25</label>
<div>


## Main Changes

### Maintenance Release

- **Added macos support.**
- stdatalog_core:
	- Updated libhs_datalog_v2 libraries for all the supported OS.
		- Updated libusb linking and added missing lirbary import for UNIX.
		- Added a new logging system to manage application messages with different levels (NONE, ERROR, WARNING, INFO, DEBUG).
		- Updated cmake_minimum_required version used to recompile libraries.
		- Added new hs_datalog_load_ucf_file_to_mlc API (deprecated old hs_datalog_load_ucf_to_mlc API).
- stdatalog_gui:
	- Optimized TagsInfoWidget creation function.
	- Fixed SpinBoxes arrows icons + QFrame unwanted borders + CommandWidget button name
- Added support for Vanilla and serial datalogger.
- Use the latest PySide6 version compatible w.r.t. architecture (Windows, Linux, macOS; 32bit, 64bit).
- Upgraded package dependencies and versions.


</div>
:::

::: {.collapse}
<input type="checkbox" id="collapse-section1" aria-hidden="true">
<label for="collapse-section1" aria-hidden="true">v1.0.0 / 17-Jan-25</label>
<div>


## Main Changes

### First official release


## Backward Compatibility

- **STDATALOG-PYSDK** is the extension and the evolution of **HSDPython_SDK v3.4.0**. Main changes are:
	- **Complete refactoring of the SDK and of the examples folders**
	- **Reshaped installer scripts and package dependencies**
	- **Removed asciimatic package installation from SDK installer scripts, added a dependency check with automatic setup only when needed**
	- **Add HDF5 file format conversion in stdatalog_data_export.py script**
	- **New feature: upload datasets to ST AIoT Craft online tool**
	- **HSD_datatoolkit package renamed into stdatalog_dtk and moved out from stdatalog_core (former st_datalog), with updated documentation + HSD_DataToolkit class code optimized**
	- Updates and bug fixed in stdatalog_core (former st_datalog)
		- Fixed spectrograms plots when acquisition is tagged + fixed sub-plots legend
		- Added HDF5 converter function
		- Added support for python 3.10, 3.11 and 3.12 in staiotcraft dependencies (different wheel versions) removed old ones
		- DataClass.py moved here from stdatalog_gui.Utils (former st_dtdl_gui)
		- Removed unused code
		- Fixed chunk_time_size value management in get_data_and_timestamp functions
		- Fixed dataset aggregation feature in 'split_per_tags' case
	- Updates and bug fixed in stdatalog_gui (former st_dtdl_gui)
		- Moved here HSD_GUI and HSD_MC_GUI folders from stdatalog_core (former st_datalog)
		- Fixed enum values extraction for Components with HSD constraints
		- Added key shortcut for data tagging
		- Updated telemetries plot widgets with voltage and current scaler and created dedicated controller class for motor control application
		- Fixed motor controller log behavior
		- Updated default rotation for ToF Heatmap widget
	- Updated Device Template models and board catalog in stdatalog_pnpl (former st_pnpl)


</div>
:::

:::
:::

<footer class="sticky">
::: {.columns}
::: {.column width="95%"}
For complete documentation,
visit: [www.st.com](https://github.com/STMicroelectronics/stdatalog-pysdk)
:::
::: {.column width="5%"}
<abbr title="Based on template cx566953 version 2.0">Info</abbr>
:::
:::
</footer>
