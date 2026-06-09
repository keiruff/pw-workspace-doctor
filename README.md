# ProjectWise Workspace Doctor

**ProjectWise Workspace Doctor** is a lightweight PowerShell utility designed to audit local engineering workspace directories and generate reports that support Bentley ProjectWise, MicroStation, OpenRoads Designer, CAD management, and infrastructure IT workflows.

---

## Are You Trying to Figure Out...

* Why MicroStation or OpenRoads Designer startup times suddenly increased?
* Which local workspace folders are consuming large amounts of disk space?
* Which Bentley-related files are driving workspace growth?
* Whether outdated workspace files may be contributing to configuration issues?
* Which workspace configuration files changed after a specific date?
* Which folders contain DGNLIBs, CFGs, PCFs, UCFs, DGN files, or other Bentley-related resources?
* How to create a basic audit trail for CAD standards changes across large engineering environments?
* How to give CAD managers or IT support staff a clean CSV report instead of manually digging through folders?

ProjectWise Workspace Doctor helps ProjectWise administrators, CAD managers, and engineering technology teams quickly identify workspace growth, file distribution, and possible configuration drift.

---

## Need Help Troubleshooting a Large ProjectWise Environment?

This tool is provided free as an open-source utility.

If you are preparing for a ProjectWise migration, troubleshooting workstation performance issues, reviewing CAD standards changes, or auditing engineering workspaces across a larger environment, CivicSpan IT Group provides specialized support for infrastructure-focused organizations.

CivicSpan IT Group provides:

* ProjectWise administration support
* Bentley workspace auditing
* Custom PowerShell automation
* CAD standards documentation
* Workflow optimization
* Help desk operations support
* Microsoft 365 and SharePoint support
* Infrastructure-focused IT consulting

**Schedule a Free 15-Minute Technical Assessment:**
https://civicspanitgroup.com/contact.html

---

## The Problem

Engineering workstations and local workspace directories often accumulate CAD files, references, DGNLIBs, configuration files, project resources, copied-out working files, and cached workspace content.

Over time, these folders can create issues such as:

* Slow application startup
* MicroStation lag
* OpenRoads Designer performance issues
* Excessive local disk usage
* Difficulty identifying large or stale workspace files
* Help desk uncertainty during troubleshooting
* Confusion after CAD standards or workspace configuration changes
* Lack of quick reporting for local engineering workspace contents

---

## What This Tool Does

ProjectWise Workspace Doctor scans a selected workspace directory and generates a CSV report containing file inventory data.

Current capabilities include:

* Workspace folder scanning
* Bentley-related file detection
* File count reporting
* Workspace size auditing
* CSV report generation
* Safe cleanup workflow foundation
* Dry-run cleanup option
* Identification of files older than a selected date threshold

---

## Common Use Cases

### Workspace Cleanup Audits

Identify oversized local workspace directories before they impact workstation performance or consume excessive disk space.

### CAD Standards Review

Find Bentley-related files such as DGNLIBs, CFGs, PCFs, UCFs, CEL files, RSC files, and DGN files that may be part of workspace or standards troubleshooting.

### Configuration Change Investigation

Review files modified after a selected date to help identify workspace resources that may have changed before user issues began.

### Help Desk Troubleshooting

Generate a quick CSV report that support staff can review before deleting, repairing, reinstalling, or escalating workspace-related issues.

### Migration Readiness

Inventory local workspace contents before workstation refreshes, user profile migrations, ProjectWise upgrades, or CAD environment changes.

### Engineering Technology Reporting

Provide CAD managers, ProjectWise administrators, and IT support teams with a structured report instead of relying on manual folder inspection.

---

## Intended Users

* ProjectWise administrators
* CAD managers
* Engineering technology teams
* Help desk support staff
* Infrastructure IT support teams
* Transportation and civil engineering organizations
* Public-sector technology support teams

---

## Installation

Download or clone the repository:

```powershell
git clone https://github.com/keiruff/pw-workspace-doctor.git
cd pw-workspace-doctor
```

Or download the ZIP from GitHub:

```text
https://github.com/keiruff/pw-workspace-doctor
```

---

## Usage

Run the script in PowerShell:

```powershell
.\pw-workspace-doctor.ps1
```

Scan a specific folder:

```powershell
.\pw-workspace-doctor.ps1 -Path "C:\PW_Test"
```

Scan files older than a selected number of days:

```powershell
.\pw-workspace-doctor.ps1 -Path "C:\PW_Test" -OlderThanDays 45
```

Dry-run cleanup:

```powershell
.\pw-workspace-doctor.ps1 -Path "C:\PW_Test" -OlderThanDays 45 -Clean -DryRun
```

Run cleanup after confirmation:

```powershell
.\pw-workspace-doctor.ps1 -Path "C:\PW_Test" -OlderThanDays 45 -Clean
```

---

## Output

The tool generates CSV reports in the `reports` folder.

Example report fields include:

* Full file path
* File extension
* File size
* Size in MB
* Last modified date
* Older-than-limit status
* Bentley-related file indicator

---

## Supported File Indicators

The current version identifies common Bentley and engineering workspace file types, including:

* `.dgn`
* `.dgnlib`
* `.cel`
* `.rsc`
* `.pcf`
* `.ucf`
* `.cfg`
* `.pwxml`
* `.dwg`

---

## Safety Notes

This tool does **not** connect to a ProjectWise server.

It does **not** check in, check out, synchronize, or modify ProjectWise metadata.

It does **not** replace Bentley ProjectWise Explorer, Local Document Organizer, or official administrative tools.

Use official Bentley ProjectWise tools for document state management, check-in/check-out operations, synchronization, and server-side administration.

Recommended workflow:

1. Close MicroStation, OpenRoads Designer, ProjectWise Explorer, and ProjectWise Drive.
2. Run scan mode first.
3. Review the CSV report.
4. Use dry-run cleanup before deleting files.
5. Confirm workspace cleanup policies with your organization.
6. Do not delete local files if users may have unsynchronized or checked-out work.

---

## Real-World Impact

This utility helps support teams quickly understand what is stored in local engineering workspace folders before taking action.

It can assist with troubleshooting disk usage, slow application performance, bloated local directories, workspace cleanup planning, and CAD standards review.

For larger environments, the report can support discussions between CAD managers, ProjectWise administrators, IT support teams, and engineering leadership.

---

## Roadmap

Planned enhancements:

* Largest file reporting
* Automatic workspace discovery
* HTML report generation
* Quarantine mode
* Modified configuration file tracking
* Workspace profile detection
* Migration readiness reporting
* Enhanced Bentley workspace analysis
* Optional GUI version

---

## Commercial Support

Need assistance beyond the capabilities of this utility?

CivicSpan IT Group provides specialized support for engineering technology and infrastructure-focused environments, including:

* ProjectWise administration support
* Bentley workspace auditing
* Custom workspace reporting scripts
* CAD standards documentation
* Workflow optimization
* Help desk support process improvement
* Microsoft 365 and SharePoint support
* Infrastructure IT consulting

**Website:**
https://civicspanitgroup.com

**Contact:**
https://civicspanitgroup.com/contact.html

---

## Release

Current release:

```text
v0.1.0
```

Release page:

```text
https://github.com/keiruff/pw-workspace-doctor/releases/tag/v0.1.0
```

---

## Built By

**CivicSpan IT Group**

Practical IT support, documentation, workflow automation, and engineering technology solutions for infrastructure-focused organizations.

Website:
https://civicspanitgroup.com

---

## License

MIT License
