# ProjectWise Workspace Doctor

ProjectWise Workspace Doctor is a lightweight PowerShell utility designed to audit local engineering workspace directories and generate reports that support Bentley ProjectWise, MicroStation, OpenRoads, CAD management, and infrastructure IT workflows.

## The Problem

Engineering workstations often accumulate large local workspace folders containing CAD files, references, DGNLIBs, configuration files, project resources, and copied-out working files.

Over time, these folders can create issues such as:

- Slow application startup
- MicroStation lag
- OpenRoads performance issues
- Excessive local disk usage
- Difficulty identifying large or stale workspace files
- Help desk uncertainty during troubleshooting

## What This Tool Does

ProjectWise Workspace Doctor scans a selected workspace directory and generates a CSV report containing file inventory data.

Current capabilities include:

- Workspace folder scanning
- Bentley-related file detection
- File count reporting
- Workspace size auditing
- CSV report generation
- Safe cleanup workflow foundation
- Dry-run cleanup option

## Intended Users

- ProjectWise administrators
- CAD managers
- Engineering technology teams
- Help desk support staff
- Infrastructure IT support teams
- Transportation and civil engineering organizations

## Installation

Download or clone the repository:

```powershell
git clone https://github.com/keiruff/pw-workspace-doctor.git
cd pw-workspace-doctor
