## Cookbook MODFLOW 2005

A TAPIS application for running MODFLOW-2005 groundwater flow simulations with flexible input file support.

### Sample Data

Data available from BARTON SPRINGS (2001 and 2010) [link](https://data.mint.isi.edu/files/sample-inputs-outputs/modflowInputs/)

### Supported Input Files

#### Required Files
- **BAS6** (`input.ba6`) - Basic Package Input for the Groundwater Flow Process
- **DIS** (`input.dis`) - Discretization file
- **OC** (`input.oc`) - Output control file

#### Optional Flow Packages (use one)
- **LPF** (`input.lpf`) - Layer Property Flow package file
- **BCF6** (`input.bc6`) - Block Centered Flow package file

#### Optional Stress Packages
- **ZONE** (`input.zone`) - Zone budget file
- **WEL** (`input.wel`) - Well package file
- **DRN** (`input.drn`) - Drain package file
- **RIV** (`input.riv`) - River package file
- **EVT** (`input.evt`) - Evapotranspiration package file
- **GHB** (`input.ghb`) - General Head Boundary package file
- **RCH** (`input.rch`) - Recharge package file
- **HFB6** (`input.hf6`) - Horizontal Flow Barrier package file

#### Optional Solver Packages (use one)
- **PCG** (`input.pcg`) - Preconditioned Conjugate Gradient package file
- **SIP** (`input.sip`) - Strongly Implicit Procedure package file

### Output Files

The application generates the following output files:
- **LST** - List file with model output and diagnostics
- **CBB** - Cell-by-cell flow file (binary)
- **HDS** - Head file (binary)
- **DDN** - Drawdown file (binary)

### Usage

1. Upload your MODFLOW input files with the appropriate naming convention (e.g., `input.ba6`, `input.dis`, etc.)
2. Submit the job through TAPIS
3. The application will automatically detect which files are present and generate the appropriate NAM (name file)
4. MODFLOW-2005 will run with the provided configuration
5. Output files will be available in the job output directory

### File Requirements

- Only the basic required files (BAS6, DIS, OC) are mandatory
- All other files are optional and will be included in the simulation only if provided
- For flow packages, provide either LPF or BCF6, not both
- For solver packages, provide either PCG or SIP; if neither is provided, MODFLOW will use its default solver
