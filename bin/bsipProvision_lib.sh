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



function vis_bisosProvisionExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local extraInfo="$1"
    local bisosBinBase="$( bisosBinBaseGet )"
    
    cat  << _EOF_
$( examplesSeperatorChapter "BISOS Provisioning:: From /bisos/core/bsip" )
$( examplesSeperatorSection "BSIP Provision Targets" )
${G_myName} ${extraInfo} -i bsipProvision_baseBisosPlatform
$( examplesSeperatorSection "BISOS Accounts" )
${G_myName} ${extraInfo} -i provisionBisosAccts
$( examplesSeperatorSection "USG Account Bases" )
${G_myName} ${extraInfo} -i provisionUsgAcctBases
_EOF_
}


function osmtTmpExamples {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local extraInfo="$1"
    local provisionersBinBase="$( provisionersBinBaseGet )"

    cat  << _EOF_    
$( examplesSeperatorChapter "Temporary OSMT Setup" )
$( examplesSeperatorSection "Run OSMT Genesis" )
${provisionersBinBase}/osmtBx2GenesisSelfcontained.sh
${G_myName} ${extraInfo} -i osmtGenesis baseIoC
${G_myName} ${extraInfo} -i osmtGenesis baseIoC atNeda
$( examplesSeperatorChapter "BISOS Bases Administration (/bisos/core)" )
$( examplesSeperatorSection "bisosBasesAdmin" )
_EOF_
}


function vis_bsipProvision_baseBisosPlatform {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_provisionBisosAccts
    
    lpDo vis_provisionUsgAcctBases
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