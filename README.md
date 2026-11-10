# Log Archive Tool

## Project page

https://roadmap.sh/projects/log-archive-tool

A command-line Bash script for creating a timestamped `tar.gz` archive from a
log directory. It is intended to help keep log files in a compressed archive
for future reference.

## Requirements

- Bash
- `tar`

## Usage

Run the script with the path to the directory containing the logs:

```bash
bash log-archive.sh <log-directory>
```

For example:

```bash
bash log-archive.sh /var/log
```

The script checks that a directory was provided and that it exists. If either
check fails, it prints an error and exits.

## Output

The archive is created in the current working directory. Its name includes
the date and time in `YYYYMMDD_HHMMSS` format:

```text
log_archive_20240816_100648.tar.gz
```

The script stages the log files in a temporary `log_archive_<timestamp>`
directory, compresses that directory, and then removes the temporary
directory.

## Important behavior

The current script **moves** the contents of the supplied log directory into
the temporary staging directory before archiving them. As a result, the
original log directory is emptied. Run it only when that is intended and when
you have appropriate permissions (for example, archiving `/var/log` may
require elevated permissions).

The timestamp is included in the archive filename. The current script does
not write a separate archive date/time log file.
