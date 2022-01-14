#!/bin/bash
# vim: set noexpandtab syntax=bash :

function i_printHelp {
	basename="$(basename "${_SCRIPT}")"
	grep -E '^#//!' "${_SCRIPT}" | sed -E -e 's|^#//! *||g' -e "s|\\\$0|${basename}|g"
}

function e_rawmsg {
	msg_type_raw="${1}"; shift
	msg_fmt="${1}"; shift

	msg_type="???"
	case "${msg_type_raw}" in
		debug) msg_type="DBG" ;;
		info)  msg_type="   " ;;
		warn)  msg_type="WRN" ;;
		error) msg_type="ERR" ;;
		fatal) msg_type="FTL" ;;
	esac

	printf >&2 "[%s%s%s] ${msg_fmt}\n" "" "${msg_type}" "" "$@"
}

function e_debug {
	e_rawmsg debug "$@"
}

function e_info {
	e_rawmsg info "$@"
}

function e_warn {
	e_rawmsg warn "$@"
}

function e_error {
	e_rawmsg error "$@"
}

function e_fatal {
	e_rawmsg fatal "$@"
	exit 1
}
