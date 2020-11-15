#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bxe_lib:-}" ] ; then
    bxoLib="LOADED" ; TM_trace 7 "bxe_lib :: Loading Library -- /bisos/bsip/bin/bxe_lib.sh"
else
    TM_trace 7 "bxe_lib :: Prviously Loaded -- Skipping /bisos/bsip/bin/bxe_lib.sh" ; return
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
** 
** Creates a REGREQ (Bystar Account Request Container) based on command line.
** E|
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

# PRE parameters

typeset -t privacy=""
typeset -t kind=""
typeset -t type=""

# PRE parameters for bymemory
typeset -t firstName=MANDATORY
typeset -t lastName=MANDATORY

typeset -t corpName=MANDATORY
typeset -t sysName=MANDATORY

typeset -t email=""

typeset -t originationMethod=""

typeset -t name=""

typeset -t parent=""



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_regReqInfoBasePath_obtain {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Check for ~/bisos/sites/selected/bxe/
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local sitePath="$( FN_absolutePathGet ~ )/bisos/sites/selected/bxe/regReq"    
    local sysVarPath="/bisos/var/bxe/regReq"

    if [ -d "${sitePath}" ] ; then
	echo "${sitePath}"
    elif [ -d "${sysVarPath}" ] ; then
	echo "${sysVarPath}"
    else
	EH_problem "Missing ${sitePath} and ${sysVarPath}"
    fi

    lpReturn
}	

function vis_examplesRegReqBases {
    cat  << _EOF_
$( examplesSeperatorChapter "RegReq Bases" )
${G_myName} ${extraInfo} -i regReqInfoBasePath_obtain
_EOF_
}



function vis_examplesBxRealIndiv {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"individual\" -p firstName=\"first\" -p lastName=\"last\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"individual\" -p firstName=\"first\" -p lastName=\"last\" -p email=\"email\" "    
}

function vis_examplesBxRealCorp {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"corp\" -p corpName=\"corpName\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"corp\" -p corpName=\"corpName\" -p email=\"email\" "    
}
    
function vis_examplesBxRealSys {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"bisos\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"bisos\" "
}

function vis_examplesBxRealSysTest {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"test1\" "    
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"real\" -p type=\"system\" -p sysName=\"test1\" -p email=\"git-test1@byname.net\" "
}


function vis_examplesBxInfoRegistrar {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"registrar\" -p parent=\"prs_bisos\" -p name=\"privRegistrar\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"registrar\" -p parent=\"prs_bisos\" -p name=\"privRegistrar\" "
}

function vis_examplesBxInfoSite {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"site\" -p parent=\"prs_bisos\" -p name=\"privSite\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"site\" -p parent=\"prs_bisos\" -p name=\"privSite\" "    
}

function vis_examplesBxInfoSysChar {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"sysChar\" -p parent=\"pis_privSite\" -p name=\"gitlabServer\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"sysChar\" -p parent=\"pis_privSite\" -p name=\"gitlabServer\" "
}

function vis_examplesBxInfoUsage {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"usage\" -p parent=\"pri_firstLast-1\" -p name=\"full\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"usage\" -p parent=\"pri_firstLast-1\" -p name=\"full\" "
}

function vis_examplesBxInfoProject {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"info\" -p type=\"project\" -p parent=\"pri_firstLast-1\" -p name=\"home\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"info\" -p type=\"project\" -p parent=\"pri_firstLast-1\" -p name=\"home\" "
}

function vis_examplesBxInfoVirtGuest {
    bxeParamsMini="-p privacy=\"all\" -p kind=\"info\" -p type=\"virtGuest\" -p parent=\"pis_privSite\" -p name=\"ubCur\" "
    bxeParamsFull="-p privacy=\"all\" -p kind=\"info\" -p type=\"virtGuest\" -p parent=\"pis_privSite\" -p name=\"ubCur\" "
}

function vis_examplesBxSvcByname {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"byname\" -p parent=\"pri_firstLast-1\" -p name=\"first.last\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"byname\" -p parent=\"pri_firstLast-1\" -p name=\"first.last\" "
}

function vis_examplesBxSvcBysmb {
    bxeParamsMini="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"bysmb\" -p parent=\"prc_exampleCom\" -p name=\"exampleCom\" "
    bxeParamsFull="-p privacy=\"priv\" -p kind=\"svc\" -p type=\"bysmb\" -p parent=\"prc_exampleCom\" -p name=\"exampleCom\" "
}


function vis_regReqStdout {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    # ANT_raw "creating a RegReq Container"
    
    bxeKindTypeHookParamsSet ${kind} ${type}
 
    if [ "${originationMethod}" == "" ] ; then
	originationMethod="cmdLine"
    fi

    if [ -z "${email}" ] ; then
	email="NA"
    fi
    
 
 cat  << _EOF_
function regReqContainer {
    function regReqContainerCommon {
      bc_privacy="${privacy}"
      bc_kind="${kind}"
      bc_type="${type}"

      bc_parentBxoId="${parent}"

      bc_email="${email}"

      bc_originationDate="${dateTag}"
      bc_originationMethod="${originationMethod}"
      bc_originatorHost="${opRunHostName}"
      bc_originatorId="${opRunAcctName}"
    }
_EOF_


  bxeKindTypeHookRun regReqContainerStdoutSpecific "active"


  cat  << _EOF_
  regReqContainerCommon
  regReqContainer_${kind}_${type}
}
_EOF_
}


regReqContainerStdoutSpecific_real_individual () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${lastName}_${firstName}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_firstName="${firstName}"
      bc_lastName="${lastName}"
    }
_EOF_
}

regReqContainerStdoutSpecific_real_corp () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${corpName}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_corpName="${corpName}"
    }
_EOF_
}


regReqContainerStdoutSpecific_real_system () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${sysName}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_sysName="${sysName}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_registrar () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_site () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_sysChar () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_usage () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"		     
    }
_EOF_
}

regReqContainerStdoutSpecific_info_project () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_info_virtGuest () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_svc_byname () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

regReqContainerStdoutSpecific_svc_bysmb () {
    EH_assert [[ $# -eq 1 ]]

    if [ "$1" = "passive" ] ; then
	regReqTag="${kind}_${type}_${name}"
	return
    fi

    cat  << _EOF_
    function regReqContainer_${kind}_${type} {
      bc_name="${name}"
    }
_EOF_
}

function vis_regReqFileName {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bxoHome=""
    local subBxeDir=""
    local regReqBaseDir=""    

    if [ -z "${parent}" ] ; then
	local regReqInfoBasePath=$(vis_regReqInfoBasePath_obtain)
    
	opDo mkdir -p ${regReqInfoBasePath}

	regReqBaseDir="${regReqInfoBasePath}/${kind}/${type}"
    else
	if ! unisosAccts.sh -i userAcctExists "${parent}" ; then
	    EH_problem "Missing bxoId -- parent=${parent}"
	    lpReturn 101
	fi
	bxoHome=$( FN_absolutePathGet ~${parent} )
	if [ -z "${bxoHome}" ] ; then
	    EH_problem "Missing bxoHome -- parent=${parent}"
	    lpReturn 101
	fi
	subBxeDir="${bxoHome}/subBxe"
	if [ ! -d "${subBxeDir}" ] ; then
	    EH_problem "Missing subBxeDir=${subBxeDir}"
	    lpReturn 101
	fi
	regReqBaseDir="${subBxeDir}/regReq/${kind}/${type}"
    fi

    bxeKindTypeHookParamsSet ${kind} ${type}

    bxeKindTypeHookRun regReqContainerStdoutSpecific "passive"  # sets up regReqTag based on kind+type
    
    lpDo FN_dirCreatePathIfNotThere "${regReqBaseDir}"

    local regReqFileName=${regReqTag}.${dateTag}.REGREQ
    local regReqFilePath="${regReqBaseDir}/${regReqFileName}"
 
    echo ${regReqFilePath}
}

function vis_regReqFileCreate {
    EH_assert [[ $# -eq 0 ]]

    local regReqFilePath=$( vis_regReqFileName )

    if [ -z "${regReqFilePath}" ] ; then
	EH_problem "Missing regReqFilePath=${regReqFilePath}"
	lpReturn 101
    fi
   
    echo regReqFileName=${regReqFilePath} > ${regReqFilePath}

    vis_regReqStdout 1>> ${regReqFilePath}

    opDo ls -l ${regReqFilePath} 1>&2

    echo ${regReqFilePath}
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
