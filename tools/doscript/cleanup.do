# cleanup.do
# Safely remove common build/test caches and artifacts (best-effort)
log "== DoScript: Cleaning build artifacts and caches =="

global_variable = removed_count
removed_count = 0

# Remove common ephemeral files (recursive)
for_each file_in deep
    # Skip DoScript scripts themselves
    if_ends_with ".do"
        continue
    end_if

    # compiled Python bytecode
    if_ends_with ".pyc"
        delete file_path
        removed_count = removed_count + 1
        continue
    end_if

    # logs
    if_ends_with ".log"
        delete file_path
        removed_count = removed_count + 1
        continue
    end_if

    # egg-info files (sometimes present as files)
    if endswith(file_name, ".egg-info")
        delete file_path
        removed_count = removed_count + 1
        continue
    end_if
end_for

# Remove known top-level folders if present
if exists("build")
    delete "build"
    removed_count = removed_count + 1
end_if

if exists("dist")
    delete "dist"
    removed_count = removed_count + 1
end_if

if exists(".pytest_cache")
    delete ".pytest_cache"
    removed_count = removed_count + 1
end_if

# Remove nested __pycache__ and other cache directories
for_each dir_in deep
    # dir_name is provided by for_each when prefix starts with 'dir'
    if dir_name == "__pycache__"
        delete dir_path
        removed_count = removed_count + 1
        continue
    end_if

    if dir_name == ".pytest_cache"
        delete dir_path
        removed_count = removed_count + 1
        continue
    end_if

    if endswith(dir_name, ".egg-info")
        delete dir_path
        removed_count = removed_count + 1
        continue
    end_if
end_for

log "Cleanup complete — removed {removed_count} items"
