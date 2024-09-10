#!/usr/bin/env bash
{
        UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
        [ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ &&/ -F *arch=b[2346]{2}/ &&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) &&/ -F *auid>=${UID_MIN}/ &&(/ -F *exit=-EACCES/||/ -F *exit=-EPERM/) &&/ -S/ &&/creat/ &&/open/ &&/truncate/ &&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" || printf "ERROR: Variable 'UID_MIN' is unset.\n"
}