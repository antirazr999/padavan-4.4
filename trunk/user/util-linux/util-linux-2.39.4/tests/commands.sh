# Misc settings
TS_TESTUSER=${TS_TESTUSER:-"nobody"}

# helpers
TS_HELPER_BYTESWAP="${ts_helpersdir}test_byteswap"
TS_HELPER_CPUSET="${ts_helpersdir}test_cpuset"
TS_HELPER_DMESG="${ts_helpersdir}test_dmesg"
TS_HELPER_ENOSYS="${ts_helpersdir}test_enosys"
TS_HELPER_ISLOCAL="${ts_helpersdir}test_islocal"
TS_HELPER_ISMOUNTED="${ts_helpersdir}test_ismounted"
TS_HELPER_LIBFDISK_GPT="${ts_helpersdir}test_fdisk_gpt"
TS_HELPER_LIBFDISK_MKPART="${ts_helpersdir}sample-fdisk-mkpart"
TS_HELPER_LIBMOUNT_CONTEXT="${ts_helpersdir}test_mount_context"
TS_HELPER_LIBFDISK_MKPART_FULLSPEC="${ts_helpersdir}sample-fdisk-mkpart-fullspec"
TS_HELPER_LIBFDISK_SCRIPT_FUZZ="${ts_helpersdir}test_fdisk_script_fuzz"
TS_HELPER_LIBMOUNT_LOCK="${ts_helpersdir}test_mount_lock"
TS_HELPER_LIBMOUNT_OPTSTR="${ts_helpersdir}test_mount_optstr"
TS_HELPER_LIBMOUNT_TABDIFF="${ts_helpersdir}test_mount_tab_diff"
TS_HELPER_LIBMOUNT_TAB="${ts_helpersdir}test_mount_tab"
TS_HELPER_LIBMOUNT_UPDATE="${ts_helpersdir}test_mount_tab_update"
TS_HELPER_LIBMOUNT_UTILS="${ts_helpersdir}test_mount_utils"
TS_HELPER_LIBMOUNT_DEBUG="${ts_helpersdir}test_mount_debug"
TS_HELPER_LIBMOUNT_FUZZ="${ts_helpersdir}test_mount_fuzz"
TS_HELPER_LIBSMARTCOLS_CONTINUOUS_JSON="${ts_helpersdir}sample-scols-continuous-json"
TS_HELPER_LIBSMARTCOLS_FROMFILE="${ts_helpersdir}sample-scols-fromfile"
TS_HELPER_LIBSMARTCOLS_TITLE="${ts_helpersdir}sample-scols-title"
TS_HELPER_PYLIBMOUNT_CONTEXT="$top_srcdir/libmount/python/test_mount_context.py"
TS_HELPER_PYLIBMOUNT_TAB="$top_srcdir/libmount/python/test_mount_tab.py"
TS_HELPER_PYLIBMOUNT_UPDATE="$top_srcdir/libmount/python/test_mount_tab_update.py"
TS_HELPER_LOGGER="${ts_helpersdir}test_logger"
TS_HELPER_LOGINDEFS="${ts_helpersdir}test_logindefs"
TS_HELPER_MD5="${ts_helpersdir}test_md5"
TS_HELPER_SHA1="${ts_helpersdir}test_sha1"
TS_HELPER_MKFS_MINIX="${ts_helpersdir}test_mkfs_minix"
TS_HELPER_MORE=${TS_HELPER_MORE-"${ts_helpersdir}test_more"}
TS_HELPER_PARTITIONS="${ts_helpersdir}sample-partitions"
TS_HELPER_PATHS="${ts_helpersdir}test_pathnames"
TS_HELPER_SCRIPT="${ts_helpersdir}test_script"
TS_HELPER_SIGRECEIVE="${ts_helpersdir}test_sigreceive"
TS_HELPER_STRERROR="${ts_helpersdir}test_strerror"
TS_HELPER_STRUTILS="${ts_helpersdir}test_strutils"
TS_HELPER_SYSINFO="${ts_helpersdir}test_sysinfo"
TS_HELPER_TIOCSTI="${ts_helpersdir}test_tiocsti"
TS_HELPER_UUID_PARSER="${ts_helpersdir}test_uuid_parser"
TS_HELPER_UUID_NAMESPACE="${ts_helpersdir}test_uuid_namespace"
TS_HELPER_MBSENCODE="${ts_helpersdir}test_mbsencode"
TS_HELPER_CAL="${ts_helpersdir}test_cal"
TS_HELPER_LAST_FUZZ="${ts_helpersdir}test_last_fuzz"
TS_HELPER_MKFDS="${ts_helpersdir}test_mkfds"
TS_HELPER_BLKID_FUZZ="${ts_helpersdir}test_blkid_fuzz"
TS_HELPER_PROCFS="${ts_helpersdir}test_procfs"
TS_HELPER_TIMEUTILS="${ts_helpersdir}test_timeutils"

# paths to commands
TS_CMD_ADDPART=${TS_CMD_ADDPART:-"${ts_commandsdir}addpart"}
TS_CMD_DELPART=${TS_CMD_DELPART:-"${ts_commandsdir}delpart"}
TS_CMD_BLKDISCARD=${TS_CMD_BLKID-"${ts_commandsdir}blkdiscard"}
TS_CMD_BLKID=${TS_CMD_BLKID-"${ts_commandsdir}blkid"}
TS_CMD_CAL=${TS_CMD_CAL-"${ts_commandsdir}cal"}
TS_CMD_COLCRT=${TS_CMD_COLCRT:-"${ts_commandsdir}colcrt"}
TS_CMD_COLRM=${TS_CMD_COLRM:-"${ts_commandsdir}colrm"}
TS_CMD_COL=${TS_CMD_COL:-"${ts_commandsdir}col"}
TS_CMD_COLUMN=${TS_CMD_COLUMN:-"${ts_commandsdir}column"}
TS_CMD_EJECT=${TS_CMD_EJECT-"${ts_commandsdir}eject"}
TS_CMD_FALLOCATE=${TS_CMD_FALLOCATE-"${ts_commandsdir}fallocate"}
TS_CMD_FDISK=${TS_CMD_FDISK-"${ts_commandsdir}fdisk"}
TS_CMD_FLOCK=${TS_CMD_FLOCK-"${ts_commandsdir}flock"}
TS_CMD_SFDISK=${TS_CMD_SFDISK-"${ts_commandsdir}sfdisk"}
TS_CMD_FADVISE=${TS_CMD_FADVISE-"${ts_commandsdir}fadvise"}
TS_CMD_FINCORE=${TS_CMD_FINCORE-"${ts_commandsdir}fincore"}
TS_CMD_FINDMNT=${TS_CMD_FINDMNT-"${ts_commandsdir}findmnt"}
TS_CMD_FSCKCRAMFS=${TS_CMD_FSCKCRAMFS:-"${ts_commandsdir}fsck.cramfs"}
TS_CMD_FSCKMINIX=${TS_CMD_FSCKMINIX:-"${ts_commandsdir}fsck.minix"}
TS_CMD_GETOPT=${TS_CMD_GETOPT-"${ts_commandsdir}getopt"}
TS_CMD_HARDLINK=${TS_CMD_HARDLINK-"${ts_commandsdir}hardlink"}
TS_CMD_HEXDUMP=${TS_CMD_HEXDUMP-"${ts_commandsdir}hexdump"}
TS_CMD_HWCLOCK=${TS_CMD_HWCLOCK-"${ts_commandsdir}hwclock"}
TS_CMD_IONICE=${TS_CMD_IONICE-"${ts_commandsdir}ionice"}
TS_CMD_IPCMK=${TS_CMD_IPCMK-"${ts_commandsdir}ipcmk"}
TS_CMD_IPCRM=${TS_CMD_IPCRM-"${ts_commandsdir}ipcrm"}
TS_CMD_IPCS=${TS_CMD_IPCS:-"${ts_commandsdir}ipcs"}
TS_CMD_ISOSIZE=${TS_CMD_ISOSIZE-"${ts_commandsdir}isosize"}
TS_CMD_KILL=${TS_CMD_KILL-"${ts_commandsdir}kill"}
TS_CMD_LAST=${TS_CMD_LAST-"${ts_commandsdir}last"}
TS_CMD_LINE=${TS_CMD_LINE-"${ts_commandsdir}line"}
TS_CMD_LOOK=${TS_CMD_LOOK-"${ts_commandsdir}look"}
TS_CMD_LOSETUP=${TS_CMD_LOSETUP:-"${ts_commandsdir}losetup"}
TS_CMD_LSBLK=${TS_CMD_LSBLK-"${ts_commandsdir}lsblk"}
TS_CMD_LSCPU=${TS_CMD_LSCPU-"${ts_commandsdir}lscpu"}
TS_CMD_LSFD=${TS_CMD_LSFD-"${ts_commandsdir}lsfd"}
TS_CMD_LSMEM=${TS_CMD_LSMEM-"${ts_commandsdir}lsmem"}
TS_CMD_LSNS=${TS_CMD_LSNS-"${ts_commandsdir}lsns"}
TS_CMD_MCOOKIE=${TS_CMD_MCOOKIE-"${ts_commandsdir}mcookie"}
TS_CMD_MKCRAMFS=${TS_CMD_MKCRAMFS:-"${ts_commandsdir}mkfs.cramfs"}
TS_CMD_MKMINIX=${TS_CMD_MKMINIX:-"${ts_commandsdir}mkfs.minix"}
TS_CMD_MKSWAP=${TS_CMD_MKSWAP:-"${ts_commandsdir}mkswap"}
TS_CMD_MOUNT=${TS_CMD_MOUNT:-"${ts_commandsdir}mount"}
TS_CMD_MOUNTPOINT=${TS_CMD_MOUNTPOINT:-"${ts_commandsdir}mountpoint"}
TS_CMD_NAMEI=${TS_CMD_NAMEI-"${ts_commandsdir}namei"}
TS_CMD_PARTX=${TS_CMD_PARTX-"${ts_commandsdir}partx"}
TS_CMD_PIPESZ=${TS_CMD_PIPESZ-"${ts_commandsdir}pipesz"}
TS_CMD_RENAME=${TS_CMD_RENAME-"${ts_commandsdir}rename"}
TS_CMD_RUNUSER=${TS_CMD_RUNUSER-"${ts_commandsdir}runuser"}
TS_CMD_REV=${TS_CMD_REV:-"${ts_commandsdir}rev"}
TS_CMD_SCRIPT=${TS_CMD_SCRIPT-"${ts_commandsdir}script"}
TS_CMD_SCRIPTREPLAY=${TS_CMD_SCRIPTREPLAY-"${ts_commandsdir}scriptreplay"}
TS_CMD_SCRIPTLIVE=${TS_CMD_SCRIPTLIVE-"${ts_commandsdir}scriptlive"}
TS_CMD_SETARCH=${TS_CMD_SETARCH-"${ts_commandsdir}setarch"}
TS_CMD_SETSID=${TS_CMD_SETSID-"${ts_commandsdir}setsid"}
TS_CMD_SWAPLABEL=${TS_CMD_SWAPLABEL:-"${ts_commandsdir}swaplabel"}
TS_CMD_SWAPOFF=${TS_CMD_SWAPOFF:-"${ts_commandsdir}swapoff"}
TS_CMD_SWAPON=${TS_CMD_SWAPON:-"${ts_commandsdir}swapon"}
TS_CMD_UL=${TS_CMD_UL-"${ts_commandsdir}ul"}
TS_CMD_UMOUNT=${TS_CMD_UMOUNT:-"${ts_commandsdir}umount"}
TS_CMD_UNSHARE=${TS_CMD_UNSHARE:-"${ts_commandsdir}unshare"}
TS_CMD_UTMPDUMP=${TS_CMD_UTMPDUMP-"${ts_commandsdir}utmpdump"}
TS_CMD_UUIDD=${TS_CMD_UUIDD-"${ts_commandsdir}uuidd"}
TS_CMD_UUIDGEN=${TS_CMD_UUIDGEN-"${ts_commandsdir}uuidgen"}
TS_CMD_UUIDPARSE=${TS_CMD_UUIDPARSE-"${ts_commandsdir}uuidparse"}
TS_CMD_WAITPID=${TS_CMD_WAITPID-"${ts_commandsdir}waitpid"}
TS_CMD_WHEREIS=${TS_CMD_WHEREIS-"${ts_commandsdir}whereis"}
TS_CMD_WIPEFS=${TS_CMD_WIPEFS-"${ts_commandsdir}wipefs"}
TS_CMD_CHRT=${TS_CMD_CHRT-"${ts_commandsdir}chrt"}
TS_CMD_CHFN=${TS_CMD_CHFN-"${ts_commandsdir}chfn"}
