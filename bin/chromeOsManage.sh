#!/bin/bash

IimBriefDescription="Self Contained Internet Service"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/scsRealize.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/panels/bisos/core/bxeAndBxo/_nodeBase_/fullUsagePanel-en.org::Panel][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/l3_lib.sh
. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/box_lib.sh

# PRE parameters

typeset -t bxoId=""

typeset -t correspondingBxo=""


function G_postParamHook {
    lpReturn
    bxoIdPrepValidate    

    if [ ! -z "${bxoId}" ] ; then
     	bxoHome=$( FN_absolutePathGet ~${bxoId} )
    fi
    
    bisosCurrentsGet
}


noArgsHook() {
  vis_examples
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    oneBxoId="${currentBxoId}"
    cat  << _EOF_
$( examplesSeperatorChapter "Chrome OS Specific Facilities" )
$( examplesSeperatorSection "Identify ChromeOs" )
${G_myName} ${extraInfo} -i runningInChromeOsContainer # are we running in ChromeOs
${G_myName} ${extraInfo} -i sshd_runAt3333
sudo service sshd restart
sudo service sshd status
ssh -X -p 3333 bystar@localhost
${G_myName} ${extraInfo} -i functionKeys
_EOF_

}


function vis_sshd_runAt3333 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Capture all details. During install automate as much as possible
** TODO Port forward 3333 for sshd
** TODO mv /etc/ssh/sshd/dontRun to dontRun.orig
** TODO edit sshd.config from Port 22 to Port 3333
** TODO Restart sshd -- sudo service sshd restart
** ssh -X -p 3333 bystar@localhost
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    EH_assert [ vis_runningInChromeOsContainer ]

    lpDo sudo apt-get -y install ssh


    if [ -f /etc/ssh/sshd_not_to_be_run ] ; then
	lpDo mv /etc/ssh/sshd_not_to_be_run /etc/ssh/sshd_not_to_be_run.orig
    else
	ANT_raw "/etc/ssh/sshd_not_to_be_run not found -- moving skipped"
    fi

    local sshdConfigFile="/etc/ssh/sshd_config"

    local port22=$(lpDo egrep '^#Port' "${sshdConfigFile}")
    local restartNeeded=""

    if [ -z "${port22}" ] ; then
	ANT_raw "Port Nu Already Changed To:"
	egrep '^Port' "${sshdConfigFile}"
    else
	lpDo cp "${sshdConfigFile}" "${sshdConfigFile}.orig"
	lpDo FN_textReplace "^#Port .*" "Port 3333" "${sshdConfigFile}"
	restartNeeded="true"
    fi

    if [ -n "${restartNeeded}" ] ; then
	lpDo sudo service sshd restart
    fi
    
    lpDo sudo service sshd status

    lpDo vis_sshd_portForwardTo3333
    
    lpReturn
}


function vis_sshd_portForwardTo3333 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** TODO Port forward 3333 for sshd
** ssh -X -p 3333 bystar@localhost
_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    lpDo describeF
    
    lpReturn
}


function vis_sshd_portForwardTo3333 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Function Keys

If you have a need for F-keys, don’t fret, you can convert your Chromebook’s shortcut keys
into F-keys by following these steps:

*** Click the Settings panel in the bottom right corner of your Chromebook screen.

*** In the resulting Settings menu, choose Settings.

This loads your Chromebook settings into a Chrome browser window.

*** Scroll down to the Device section and click Keyboard Settings.

This loads the Keyboard Settings overlay.

*** Check the Treat Top-Row Keys as Function Keys checkbox.

*** Click OK.

This disables the shortcut functionality of your Chromebook’s shortcut keys and enables
their function as F-keys.

_EOF_
		       }
    EH_assert [[ $# -eq 0 ]]

    lpDo describeF
    
    lpReturn
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
