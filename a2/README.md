# trash - Simple Safe File Deletion Utility

## What this command does

`trash` is a simple utility that provides a safer alternative to the standard `rm` command. Instead of permanently deleting files, it moves them to a hidden trash directory in your home folder (`~/.trash`). This allows you to recover accidentally deleted files and review what you've deleted before permanently removing it.

## Why/When this command is useful

This command is useful in many scenarios:

- **Preventing accidental data loss**: `trash` gives you a safety net when deleting files
- **Working with important data**: When working with critical files, using `trash` adds an extra layer of protection
- **Cleaning up directories**: You can confidently clean up directories knowing you can restore files if needed
- **Consistent workflow**: Provides similar functionality to the GUI trash/recycle bin on the command line

Terminal users often rely on the dangerous `rm` command because a simple CLI trash utility isn't included by default in most Unix/Linux distributions.

## How you can use this command

Basic usage:
```
trash [FILES...]
```

Options:
- `-l, --list` : List files currently in trash
- `-r, --restore FILE` : Restore specific file from trash to current directory
- `-e, --empty` : Empty the trash (permanently delete all files)

## Examples

### Moving files to trash
```
$ trash document.txt old_report.pdf
1 file(s) successfully moved to trash!
```

### Listing files in trash
```
$ trash -l
Files in trash:
document.txt_20250310143522
old_report.pdf_20250310143522
```

### Restoring a file from trash
```
$ trash -r document.txt_20250310143522
Restored: document.txt_20250310143522 to current directory
```

### Emptying the trash completely
```
$ trash -e
Trash emptied.
```
