; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58984 () Bool)

(assert start!58984)

(declare-fun b!650635 () Bool)

(declare-datatypes ((Unit!22188 0))(
  ( (Unit!22189) )
))
(declare-fun e!373283 () Unit!22188)

(declare-fun Unit!22190 () Unit!22188)

(assert (=> b!650635 (= e!373283 Unit!22190)))

(declare-fun b!650636 () Bool)

(declare-fun res!421780 () Bool)

(declare-fun e!373289 () Bool)

(assert (=> b!650636 (=> (not res!421780) (not e!373289))))

(declare-datatypes ((array!38565 0))(
  ( (array!38566 (arr!18487 (Array (_ BitVec 32) (_ BitVec 64))) (size!18851 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38565)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38565 (_ BitVec 32)) Bool)

(assert (=> b!650636 (= res!421780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650637 () Bool)

(declare-fun e!373282 () Bool)

(declare-fun e!373295 () Bool)

(assert (=> b!650637 (= e!373282 e!373295)))

(declare-fun res!421791 () Bool)

(assert (=> b!650637 (=> res!421791 e!373295)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302356 () (_ BitVec 64))

(declare-fun lt!302343 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!650637 (= res!421791 (or (not (= (select (arr!18487 a!2986) j!136) lt!302343)) (not (= (select (arr!18487 a!2986) j!136) lt!302356)) (bvsge j!136 index!984)))))

(declare-fun b!650639 () Bool)

(declare-fun e!373285 () Bool)

(declare-fun e!373291 () Bool)

(assert (=> b!650639 (= e!373285 e!373291)))

(declare-fun res!421779 () Bool)

(assert (=> b!650639 (=> res!421779 e!373291)))

(assert (=> b!650639 (= res!421779 (or (not (= (select (arr!18487 a!2986) j!136) lt!302343)) (not (= (select (arr!18487 a!2986) j!136) lt!302356))))))

(assert (=> b!650639 e!373282))

(declare-fun res!421789 () Bool)

(assert (=> b!650639 (=> (not res!421789) (not e!373282))))

(assert (=> b!650639 (= res!421789 (= lt!302356 (select (arr!18487 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!650639 (= lt!302356 (select (store (arr!18487 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650640 () Bool)

(declare-fun e!373292 () Bool)

(declare-datatypes ((SeekEntryResult!6927 0))(
  ( (MissingZero!6927 (index!30058 (_ BitVec 32))) (Found!6927 (index!30059 (_ BitVec 32))) (Intermediate!6927 (undefined!7739 Bool) (index!30060 (_ BitVec 32)) (x!58845 (_ BitVec 32))) (Undefined!6927) (MissingVacant!6927 (index!30061 (_ BitVec 32))) )
))
(declare-fun lt!302350 () SeekEntryResult!6927)

(declare-fun lt!302348 () SeekEntryResult!6927)

(assert (=> b!650640 (= e!373292 (= lt!302350 lt!302348))))

(declare-fun b!650641 () Bool)

(declare-fun e!373288 () Unit!22188)

(declare-fun Unit!22191 () Unit!22188)

(assert (=> b!650641 (= e!373288 Unit!22191)))

(declare-fun b!650642 () Bool)

(declare-fun e!373290 () Bool)

(assert (=> b!650642 (= e!373290 (or (bvsge (size!18851 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18851 a!2986))))))

(declare-fun lt!302347 () array!38565)

(declare-datatypes ((List!12528 0))(
  ( (Nil!12525) (Cons!12524 (h!13569 (_ BitVec 64)) (t!18756 List!12528)) )
))
(declare-fun arrayNoDuplicates!0 (array!38565 (_ BitVec 32) List!12528) Bool)

(assert (=> b!650642 (arrayNoDuplicates!0 lt!302347 #b00000000000000000000000000000000 Nil!12525)))

(declare-fun lt!302355 () Unit!22188)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12528) Unit!22188)

(assert (=> b!650642 (= lt!302355 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12525))))

(declare-fun arrayContainsKey!0 (array!38565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650642 (arrayContainsKey!0 lt!302347 (select (arr!18487 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302353 () Unit!22188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22188)

(assert (=> b!650642 (= lt!302353 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302347 (select (arr!18487 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373294 () Bool)

(assert (=> b!650642 e!373294))

(declare-fun res!421786 () Bool)

(assert (=> b!650642 (=> (not res!421786) (not e!373294))))

(assert (=> b!650642 (= res!421786 (arrayContainsKey!0 lt!302347 (select (arr!18487 a!2986) j!136) j!136))))

(declare-fun b!650643 () Bool)

(declare-fun e!373296 () Bool)

(assert (=> b!650643 (= e!373295 e!373296)))

(declare-fun res!421776 () Bool)

(assert (=> b!650643 (=> (not res!421776) (not e!373296))))

(assert (=> b!650643 (= res!421776 (arrayContainsKey!0 lt!302347 (select (arr!18487 a!2986) j!136) j!136))))

(declare-fun b!650644 () Bool)

(declare-fun e!373293 () Bool)

(assert (=> b!650644 (= e!373289 e!373293)))

(declare-fun res!421792 () Bool)

(assert (=> b!650644 (=> (not res!421792) (not e!373293))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!650644 (= res!421792 (= (select (store (arr!18487 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650644 (= lt!302347 (array!38566 (store (arr!18487 a!2986) i!1108 k0!1786) (size!18851 a!2986)))))

(declare-fun b!650645 () Bool)

(declare-fun e!373284 () Bool)

(assert (=> b!650645 (= e!373293 e!373284)))

(declare-fun res!421785 () Bool)

(assert (=> b!650645 (=> (not res!421785) (not e!373284))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!650645 (= res!421785 (and (= lt!302350 (Found!6927 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18487 a!2986) index!984) (select (arr!18487 a!2986) j!136))) (not (= (select (arr!18487 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38565 (_ BitVec 32)) SeekEntryResult!6927)

(assert (=> b!650645 (= lt!302350 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18487 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650646 () Bool)

(assert (=> b!650646 (= e!373291 e!373290)))

(declare-fun res!421775 () Bool)

(assert (=> b!650646 (=> res!421775 e!373290)))

(assert (=> b!650646 (= res!421775 (bvsge index!984 j!136))))

(declare-fun lt!302346 () Unit!22188)

(assert (=> b!650646 (= lt!302346 e!373288)))

(declare-fun c!74798 () Bool)

(assert (=> b!650646 (= c!74798 (bvslt j!136 index!984))))

(declare-fun b!650647 () Bool)

(declare-fun res!421784 () Bool)

(assert (=> b!650647 (=> (not res!421784) (not e!373289))))

(assert (=> b!650647 (= res!421784 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18487 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650648 () Bool)

(assert (=> b!650648 (= e!373296 (arrayContainsKey!0 lt!302347 (select (arr!18487 a!2986) j!136) index!984))))

(declare-fun b!650649 () Bool)

(declare-fun res!421782 () Bool)

(assert (=> b!650649 (=> (not res!421782) (not e!373289))))

(assert (=> b!650649 (= res!421782 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12525))))

(declare-fun res!421777 () Bool)

(declare-fun e!373286 () Bool)

(assert (=> start!58984 (=> (not res!421777) (not e!373286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58984 (= res!421777 (validMask!0 mask!3053))))

(assert (=> start!58984 e!373286))

(assert (=> start!58984 true))

(declare-fun array_inv!14283 (array!38565) Bool)

(assert (=> start!58984 (array_inv!14283 a!2986)))

(declare-fun b!650638 () Bool)

(declare-fun Unit!22192 () Unit!22188)

(assert (=> b!650638 (= e!373288 Unit!22192)))

(declare-fun lt!302352 () Unit!22188)

(assert (=> b!650638 (= lt!302352 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302347 (select (arr!18487 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650638 (arrayContainsKey!0 lt!302347 (select (arr!18487 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302344 () Unit!22188)

(assert (=> b!650638 (= lt!302344 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12525))))

(assert (=> b!650638 (arrayNoDuplicates!0 lt!302347 #b00000000000000000000000000000000 Nil!12525)))

(declare-fun lt!302340 () Unit!22188)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38565 (_ BitVec 32) (_ BitVec 32)) Unit!22188)

(assert (=> b!650638 (= lt!302340 (lemmaNoDuplicateFromThenFromBigger!0 lt!302347 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650638 (arrayNoDuplicates!0 lt!302347 j!136 Nil!12525)))

(declare-fun lt!302342 () Unit!22188)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38565 (_ BitVec 64) (_ BitVec 32) List!12528) Unit!22188)

(assert (=> b!650638 (= lt!302342 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302347 (select (arr!18487 a!2986) j!136) j!136 Nil!12525))))

(assert (=> b!650638 false))

(declare-fun b!650650 () Bool)

(declare-fun res!421788 () Bool)

(assert (=> b!650650 (=> (not res!421788) (not e!373286))))

(assert (=> b!650650 (= res!421788 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650651 () Bool)

(declare-fun res!421793 () Bool)

(assert (=> b!650651 (=> (not res!421793) (not e!373286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650651 (= res!421793 (validKeyInArray!0 (select (arr!18487 a!2986) j!136)))))

(declare-fun b!650652 () Bool)

(declare-fun res!421790 () Bool)

(assert (=> b!650652 (=> (not res!421790) (not e!373286))))

(assert (=> b!650652 (= res!421790 (validKeyInArray!0 k0!1786))))

(declare-fun b!650653 () Bool)

(declare-fun res!421787 () Bool)

(assert (=> b!650653 (=> (not res!421787) (not e!373286))))

(assert (=> b!650653 (= res!421787 (and (= (size!18851 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18851 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18851 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650654 () Bool)

(assert (=> b!650654 (= e!373286 e!373289)))

(declare-fun res!421783 () Bool)

(assert (=> b!650654 (=> (not res!421783) (not e!373289))))

(declare-fun lt!302341 () SeekEntryResult!6927)

(assert (=> b!650654 (= res!421783 (or (= lt!302341 (MissingZero!6927 i!1108)) (= lt!302341 (MissingVacant!6927 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38565 (_ BitVec 32)) SeekEntryResult!6927)

(assert (=> b!650654 (= lt!302341 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650655 () Bool)

(declare-fun Unit!22193 () Unit!22188)

(assert (=> b!650655 (= e!373283 Unit!22193)))

(assert (=> b!650655 false))

(declare-fun b!650656 () Bool)

(assert (=> b!650656 (= e!373294 (arrayContainsKey!0 lt!302347 (select (arr!18487 a!2986) j!136) index!984))))

(declare-fun b!650657 () Bool)

(assert (=> b!650657 (= e!373284 (not e!373285))))

(declare-fun res!421778 () Bool)

(assert (=> b!650657 (=> res!421778 e!373285)))

(declare-fun lt!302354 () SeekEntryResult!6927)

(assert (=> b!650657 (= res!421778 (not (= lt!302354 (Found!6927 index!984))))))

(declare-fun lt!302349 () Unit!22188)

(assert (=> b!650657 (= lt!302349 e!373283)))

(declare-fun c!74797 () Bool)

(assert (=> b!650657 (= c!74797 (= lt!302354 Undefined!6927))))

(assert (=> b!650657 (= lt!302354 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302343 lt!302347 mask!3053))))

(assert (=> b!650657 e!373292))

(declare-fun res!421781 () Bool)

(assert (=> b!650657 (=> (not res!421781) (not e!373292))))

(declare-fun lt!302345 () (_ BitVec 32))

(assert (=> b!650657 (= res!421781 (= lt!302348 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302345 vacantSpotIndex!68 lt!302343 lt!302347 mask!3053)))))

(assert (=> b!650657 (= lt!302348 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302345 vacantSpotIndex!68 (select (arr!18487 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650657 (= lt!302343 (select (store (arr!18487 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302351 () Unit!22188)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22188)

(assert (=> b!650657 (= lt!302351 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302345 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650657 (= lt!302345 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!58984 res!421777) b!650653))

(assert (= (and b!650653 res!421787) b!650651))

(assert (= (and b!650651 res!421793) b!650652))

(assert (= (and b!650652 res!421790) b!650650))

(assert (= (and b!650650 res!421788) b!650654))

(assert (= (and b!650654 res!421783) b!650636))

(assert (= (and b!650636 res!421780) b!650649))

(assert (= (and b!650649 res!421782) b!650647))

(assert (= (and b!650647 res!421784) b!650644))

(assert (= (and b!650644 res!421792) b!650645))

(assert (= (and b!650645 res!421785) b!650657))

(assert (= (and b!650657 res!421781) b!650640))

(assert (= (and b!650657 c!74797) b!650655))

(assert (= (and b!650657 (not c!74797)) b!650635))

(assert (= (and b!650657 (not res!421778)) b!650639))

(assert (= (and b!650639 res!421789) b!650637))

(assert (= (and b!650637 (not res!421791)) b!650643))

(assert (= (and b!650643 res!421776) b!650648))

(assert (= (and b!650639 (not res!421779)) b!650646))

(assert (= (and b!650646 c!74798) b!650638))

(assert (= (and b!650646 (not c!74798)) b!650641))

(assert (= (and b!650646 (not res!421775)) b!650642))

(assert (= (and b!650642 res!421786) b!650656))

(declare-fun m!623823 () Bool)

(assert (=> b!650654 m!623823))

(declare-fun m!623825 () Bool)

(assert (=> b!650649 m!623825))

(declare-fun m!623827 () Bool)

(assert (=> b!650642 m!623827))

(declare-fun m!623829 () Bool)

(assert (=> b!650642 m!623829))

(assert (=> b!650642 m!623827))

(declare-fun m!623831 () Bool)

(assert (=> b!650642 m!623831))

(assert (=> b!650642 m!623827))

(declare-fun m!623833 () Bool)

(assert (=> b!650642 m!623833))

(declare-fun m!623835 () Bool)

(assert (=> b!650642 m!623835))

(assert (=> b!650642 m!623827))

(declare-fun m!623837 () Bool)

(assert (=> b!650642 m!623837))

(declare-fun m!623839 () Bool)

(assert (=> b!650644 m!623839))

(declare-fun m!623841 () Bool)

(assert (=> b!650644 m!623841))

(declare-fun m!623843 () Bool)

(assert (=> b!650636 m!623843))

(assert (=> b!650651 m!623827))

(assert (=> b!650651 m!623827))

(declare-fun m!623845 () Bool)

(assert (=> b!650651 m!623845))

(declare-fun m!623847 () Bool)

(assert (=> b!650647 m!623847))

(declare-fun m!623849 () Bool)

(assert (=> b!650638 m!623849))

(assert (=> b!650638 m!623827))

(assert (=> b!650638 m!623827))

(declare-fun m!623851 () Bool)

(assert (=> b!650638 m!623851))

(assert (=> b!650638 m!623827))

(declare-fun m!623853 () Bool)

(assert (=> b!650638 m!623853))

(assert (=> b!650638 m!623833))

(assert (=> b!650638 m!623835))

(declare-fun m!623855 () Bool)

(assert (=> b!650638 m!623855))

(assert (=> b!650638 m!623827))

(declare-fun m!623857 () Bool)

(assert (=> b!650638 m!623857))

(assert (=> b!650643 m!623827))

(assert (=> b!650643 m!623827))

(assert (=> b!650643 m!623829))

(assert (=> b!650639 m!623827))

(assert (=> b!650639 m!623839))

(declare-fun m!623859 () Bool)

(assert (=> b!650639 m!623859))

(assert (=> b!650648 m!623827))

(assert (=> b!650648 m!623827))

(declare-fun m!623861 () Bool)

(assert (=> b!650648 m!623861))

(declare-fun m!623863 () Bool)

(assert (=> b!650650 m!623863))

(declare-fun m!623865 () Bool)

(assert (=> b!650657 m!623865))

(declare-fun m!623867 () Bool)

(assert (=> b!650657 m!623867))

(assert (=> b!650657 m!623827))

(declare-fun m!623869 () Bool)

(assert (=> b!650657 m!623869))

(declare-fun m!623871 () Bool)

(assert (=> b!650657 m!623871))

(assert (=> b!650657 m!623827))

(assert (=> b!650657 m!623839))

(declare-fun m!623873 () Bool)

(assert (=> b!650657 m!623873))

(declare-fun m!623875 () Bool)

(assert (=> b!650657 m!623875))

(declare-fun m!623877 () Bool)

(assert (=> start!58984 m!623877))

(declare-fun m!623879 () Bool)

(assert (=> start!58984 m!623879))

(declare-fun m!623881 () Bool)

(assert (=> b!650652 m!623881))

(assert (=> b!650656 m!623827))

(assert (=> b!650656 m!623827))

(assert (=> b!650656 m!623861))

(declare-fun m!623883 () Bool)

(assert (=> b!650645 m!623883))

(assert (=> b!650645 m!623827))

(assert (=> b!650645 m!623827))

(declare-fun m!623885 () Bool)

(assert (=> b!650645 m!623885))

(assert (=> b!650637 m!623827))

(check-sat (not b!650650) (not b!650645) (not b!650654) (not b!650651) (not b!650638) (not b!650648) (not b!650636) (not b!650657) (not b!650643) (not b!650649) (not b!650652) (not b!650642) (not b!650656) (not start!58984))
(check-sat)
