#!/bin/bash

IcmBriefDescription="Assignment Remote Operation For AAIS-ByStar"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh


. ${opBinBase}/bxo_lib.sh
. ${opBinBase}/bxoId_lib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

# ./bystarInfoBase.libSh
#. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/box_lib.sh

. ${opBinBase}/aaisByStarAssign_lib.sh


# PRE parameters
typeset -t serviceType=""     # one of [HPV]
typeset -t correspondingBxo=""     # one of [MAPIS]

function G_postParamHook {

    lpCurrentsGet

    lpReturn 0
}

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""

    local oneId=$(vis_thisBoxUUID)

    typeset examplesInfo="${extraInfo}"

    local assignsBase=$(vis_aabis_registrarAssignBaseObtain)
    EH_assert [ ! -z "${assignsBase}" ]

    local boxId=$( siteBoxAssign.sh -i thisBoxFindId )
    #local containerBase=$( vis_withBoxIdFindContainerBase "${boxId}" )
    local containerBase=$( vis_forThisSysFindContainerBase )
    local containerNu=$( vis_fromContainerBaseGetContainerNu "${containerBase}" )    

    local oneRealIndiv=$(cat /bxo/usg/bystar/bpos/real/realIndiv.bpoFp/value)
    
    visLibExamplesOutput ${G_myName}
    # ${doLibExamples} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Assignment Bases Information" )
${G_myName} ${extraInfo} -i aabis_registrarBaseObtain
${G_myName} ${extraInfo} -i aabis_registrarAssignBaseObtain
ls -ld ${assignsBase}/*
find ${assignsBase} -print
$( examplesSeperatorChapter "Containers Bases Initializations" )
${G_myName} ${extraInfo} -i aabis_registrarBaseDirsCreate    # INITIALIZATION -- create basis for nu assignments
$( examplesSeperatorChapter "ServiceInitial To ServiceType Mapping" )
${G_myName} ${extraInfo} -i aabis_withServiceInitialGetServiceType N # [NBF]
${G_myName} ${extraInfo} -i aabis_withIdGetAssignedBase BN-1001 # [NBF]
${G_myName} ${extraInfo} -i aabis_withNuGetAssignedBase 1001
${G_myName} ${extraInfo} -i fromContainerBaseGetContainerNu "${containerBase}"
$( examplesSeperatorChapter "SET -- Container Box Assignment -- Primary Commands" )
${G_myName} ${extraInfo} -p serviceType=Host -p correspondingBxo=Shield -p function=Server -i containerBoxAssignAndPush  # PRIMARY COMMAND
${G_myName} ${extraInfo} -p serviceType=Host -p correspondingBxo=Shield -p function=Server -i containerBoxAssign  # PRIMARY COMMAND
${G_myName} ${extraInfo} -i forThisSysContainerAssignBasePush
${G_myName} ${extraInfo} -i containersAssignBasePull
${G_myName} ${extraInfo} -p serviceType=Host -p correspondingBxo=Shield -p function=Server -i containerUpdate_atNu "${containerNu}"
$( examplesSeperatorChapter "UNSET -- Container Box Un Assignment" )
${G_myName} ${extraInfo} -i withBoxIdFindContainerBase "${boxId}"
${G_myName} ${extraInfo} -i containerBoxUnAssignAndPush "${boxId}"
${G_myName} ${extraInfo} -i containerBoxUnAssign "${boxId}"
$( examplesSeperatorChapter "SET -- Container Virt Assignment -- Primary Commands" )
${G_myName} ${extraInfo} -p serviceType=Virt -p correspondingBxo=Shield -p function=Server -i containerAssignAndPush  # PRIMARY COMMAND
${G_myName} ${extraInfo} -p serviceType=Virt -p correspondingBxo=Shield -p function=Server -i containerAssign  # PRIMARY COMMAND
echo ${containerBase} | bx-gitRepos -i addCommitPush all
${G_myName} ${extraInfo} -i containersAssignBasePull
${G_myName} ${extraInfo} -p serviceType=Virt -p correspondingBxo=Shield -p function=Server -i containerUpdate_atNu "${containerNu}"
$( examplesSeperatorChapter "GET -- Container Nu" )
${G_myName} ${extraInfo} -p serviceType=Host -p correspondingBxo=Shield -p function=Server -i containerNuGetNext
$( examplesSeperatorChapter "Assigned Containers Report" )
${G_myName} ${extraInfo} -p serviceType=Host -p correspondingBxo=Shield -p function=Server -i containerReport_atNu "${containerNu}"
${G_myName} -i containerReport_atBase "${containerBase}"
$( examplesSeperatorChapter "GET -- General Assignment Facilities" )
${G_myName} ${extraInfo} -p serviceType=Host -p correspondingBxo=Shield -p function=Server -i containerId "${containerNu}"
${G_myName} ${extraInfo} -p serviceType=Host -p correspondingBxo=Shield -p function=Server -i assignedContainerBase "${containerNu}"
${G_myName} ${extraInfo} -i withContainerIdGetBase "HSS-1001"
${G_myName} ${extraInfo} -i withInitialGetServiceType "H"     # one of: [HPV]
${G_myName} ${extraInfo} -i withInitialGetAbode "S"     # one of: [AMPSI]
${G_myName} ${extraInfo} -i withInitialGetFunction "S"  # one of: [LASD]
$( examplesSeperatorChapter "Container Assignment List Examples" )
${G_myName} ${extraInfo} -i serviceTypeAbodeFunction_listExamples containerBoxAssign   # Examples for all container serviceTypes
${G_myName} ${extraInfo} -p serviceType=Virt -i serviceTypeAbodeFunction_listExamples containerBoxAssign
${G_myName} ${extraInfo} -p serviceType=ByName -i aabis_withNuGetId 10001 # Internal
${G_myName} ${extraInfo} -p serviceType=ByName -p correspondingBxo=${oneRealIndiv} -i aabis_assignUpdate_atNu 100001
_EOF_
}


noArgsHook() {
  vis_examples
}