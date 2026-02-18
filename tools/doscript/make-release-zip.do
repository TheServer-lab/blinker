# make-release-zip.do
# Create a zip archive of the src/ folder for quick sharing or review

global_variable = archive_name
archive_name = 'blinker_release_{today}.zip'

log "Creating release archive: {archive_name}"

# Remove existing archive if present
if exists(archive_name)
    delete archive_name
end_if

# Zip the src folder
zip "src" to archive_name

log "Archive created: {archive_name}"
