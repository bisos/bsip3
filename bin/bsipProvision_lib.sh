#!/bin/bash

#
# This file is shared between ./provisionBisos.sh and /usr/local/bin/bisosProvision.sh
#

_CommentBegin_
_CommentEnd_


function bisosBinBaseGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local provisionersBinBase=""

    if [ -z "${bxp_rootDir_bisos}" ] ; then
	EH_problem "Blank bxp_rootDir_bisos"
	lpReturn 101
    elif [ -d "${bxp_rootDir_bisos}/core/bsip/bin" ] ; then
	provisionersBinBase="${bxp_rootDir_bisos}/core/bsip/bin"
    else
	EH_problem "Missing ${bxp_rootDir_bisos}/core/bsip/bin"
	lpReturn 101
    fi

    echo ${provisionersBinBase}
}

export export PATH="$( bisosBinBaseGet ):${PATH}"

function vis_bisosProvisionExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local extraInfo="$1"
    local bisosBinBase="$( bisosBinBaseGet )"
    
    cat  << _EOF_
$( examplesSeperatorChapter "BISOS Provisioning:: From /bisos/core/bsip/bin/bsipProvision_lib.sh" )
$( examplesSeperatorSection "BSIP Provision Targets" )
${G_myName} ${extraInfo} -i bsipProvision_sysBasePlatform    # Minimal Host or Guest plus Blee
$( examplesSeperatorSection "BISOS Accounts" )
${G_myName} ${extraInfo} -i provisionBisosAccts
$( examplesSeperatorSection "USG Account Bases" )
${G_myName} ${extraInfo} -i provisionUsgAcctBases
$( examplesSeperatorSection "Sys Essentials" )
${G_myName} ${extraInfo} -i provisionEssentials
$( examplesSeperatorSection "Emacs, Blee, PyEnv and VirtSys" )
${G_myName} ${extraInfo} -i provisionPySysSetup
${G_myName} ${extraInfo} -i provisionPyVenvSetup
${G_myName} ${extraInfo} -i provisionBasicBlee
${G_myName} ${extraInfo} -i provisionEmacsFromSrc
${G_myName} ${extraInfo} -i provisionBasicBlee
_EOF_

    vis_fromBsipProvisionExamplesList
}


function vis_fromBsipProvisionExamplesList {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    local bisosBinBase="$( bisosBinBaseGet )"
    local bisosProg="${bisosBinBase}/bsipProvision.sh"

    ${bisosProg} -i postSysBaseExamples
    
}




function vis_bsipProvision_sysBasePlatform {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_provisionBisosAccts
    
    lpDo vis_provisionUsgAcctBases

    lpDo vis_provisionEssentials

    lpDo vis_provisionPySysSetup

    lpDo vis_provisionPyVenvSetup

    lpDo vis_provisionBasicBlee

    lpDo vis_provisionEmacsFromSrc

    lpDo vis_provisionVirtSysSetup
}


function vis_provisionBisosAccts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/bisosAccounts.sh
    local bisosProg="${bisosBinBase}/bisosAccounts.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun -i bisosAcctsProvisionSetup
    fi
    
    lpReturn
}

function vis_provisionUsgAcctBases {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/usgAcctManage.sh
    local bisosProg="${bisosBinBase}/usgAcctManage.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun -i provisionSetup
    fi
    
    lpReturn
}


function vis_provisionEssentials {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/bisosSysEssentialsBinsPrep.sh
    local bisosProg="${bisosBinBase}/bisosSysEssentialsBinsPrep.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun -i fullUpdate
    fi
    
    lpReturn
}

function vis_provisionBasicBlee {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/bleeBinsPrep.sh
    local bisosProg="${bisosBinBase}/bleeBinsPrep.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun -i fullUpdate
    fi
    
    lpReturn
}

function vis_provisionPySysSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/bisosPySysSetup.sh
    local bisosProg="${bisosBinBase}/bisosPySysSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun  -i pySys_provisionSetup
    fi
    
    lpReturn
}

function vis_provisionPyVenvSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/bisosPyVenvSetup.sh
    local bisosProg="${bisosBinBase}/bisosPyVenvSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun  -i pyVenv_provisionSetup
    fi
    
    lpReturn
}

function vis_provisionVirtSysSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bisosBinBase="$( bisosBinBaseGet )"
	
    # /bisos/core/bsip/bin/bisosVirtSysSetup.sh
    local bisosProg="${bisosBinBase}/bisosVirtSysSetup.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else	
    	opDo "${bisosProg}" -h -v -n showRun  -i virtSys_provisionSetup
    fi
    
    lpReturn
}


function vis_osmtGenesis {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    local icmArgs="$@"

    local provisionersBinBase="$( provisionersBinBaseGet )"
	
    # /opt/bisosProvisioner/gitRepos/provisioners/bin/osmtBx2GenesisSelfcontained.sh
    local bisosProg="${provisionersBinBase}/osmtBx2GenesisSelfcontained.sh"

    if [ ! -x "${bisosProg}" ] ; then
	EH_problem "Missing ${bisosProg}"
	lpReturn 1
    else
	osmtBx2GenesisSelfcontained.sh -h -v -n showRun -r basic -i baseIoC            # Blee + Ability To Import Io
    	opDo sudo "${bisosProg}"  -h -v -n showRun -r basic -i $@
    fi
    
    lpReturn
}

function vis_provisionEmacsFromSrc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo lcaEmacsSrcBinsPrep.sh -v -n showRun -i srcFullBuild emacs27
	
    lpReturn
}
