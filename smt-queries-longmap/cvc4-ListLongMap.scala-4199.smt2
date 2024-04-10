; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57348 () Bool)

(assert start!57348)

(declare-fun b!634802 () Bool)

(declare-fun e!363029 () Bool)

(declare-fun e!363036 () Bool)

(assert (=> b!634802 (= e!363029 e!363036)))

(declare-fun res!410647 () Bool)

(assert (=> b!634802 (=> (not res!410647) (not e!363036))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38201 0))(
  ( (array!38202 (arr!18329 (Array (_ BitVec 32) (_ BitVec 64))) (size!18693 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38201)

(declare-fun lt!293483 () array!38201)

(declare-fun arrayContainsKey!0 (array!38201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634802 (= res!410647 (arrayContainsKey!0 lt!293483 (select (arr!18329 a!2986) j!136) j!136))))

(declare-fun b!634803 () Bool)

(declare-fun e!363033 () Bool)

(assert (=> b!634803 (= e!363033 true)))

(assert (=> b!634803 (arrayContainsKey!0 lt!293483 (select (arr!18329 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21410 0))(
  ( (Unit!21411) )
))
(declare-fun lt!293484 () Unit!21410)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38201 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21410)

(assert (=> b!634803 (= lt!293484 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293483 (select (arr!18329 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634804 () Bool)

(declare-fun res!410646 () Bool)

(declare-fun e!363037 () Bool)

(assert (=> b!634804 (=> (not res!410646) (not e!363037))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!634804 (= res!410646 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18329 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634805 () Bool)

(declare-fun e!363032 () Bool)

(declare-datatypes ((SeekEntryResult!6769 0))(
  ( (MissingZero!6769 (index!29378 (_ BitVec 32))) (Found!6769 (index!29379 (_ BitVec 32))) (Intermediate!6769 (undefined!7581 Bool) (index!29380 (_ BitVec 32)) (x!58119 (_ BitVec 32))) (Undefined!6769) (MissingVacant!6769 (index!29381 (_ BitVec 32))) )
))
(declare-fun lt!293479 () SeekEntryResult!6769)

(declare-fun lt!293487 () SeekEntryResult!6769)

(assert (=> b!634805 (= e!363032 (= lt!293479 lt!293487))))

(declare-fun b!634806 () Bool)

(declare-fun res!410654 () Bool)

(assert (=> b!634806 (=> (not res!410654) (not e!363037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38201 (_ BitVec 32)) Bool)

(assert (=> b!634806 (= res!410654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634807 () Bool)

(declare-fun e!363035 () Bool)

(assert (=> b!634807 (= e!363035 e!363037)))

(declare-fun res!410643 () Bool)

(assert (=> b!634807 (=> (not res!410643) (not e!363037))))

(declare-fun lt!293488 () SeekEntryResult!6769)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634807 (= res!410643 (or (= lt!293488 (MissingZero!6769 i!1108)) (= lt!293488 (MissingVacant!6769 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38201 (_ BitVec 32)) SeekEntryResult!6769)

(assert (=> b!634807 (= lt!293488 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634808 () Bool)

(declare-fun e!363030 () Bool)

(assert (=> b!634808 (= e!363037 e!363030)))

(declare-fun res!410642 () Bool)

(assert (=> b!634808 (=> (not res!410642) (not e!363030))))

(assert (=> b!634808 (= res!410642 (= (select (store (arr!18329 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634808 (= lt!293483 (array!38202 (store (arr!18329 a!2986) i!1108 k!1786) (size!18693 a!2986)))))

(declare-fun b!634809 () Bool)

(declare-fun e!363034 () Bool)

(assert (=> b!634809 (= e!363034 e!363033)))

(declare-fun res!410651 () Bool)

(assert (=> b!634809 (=> res!410651 e!363033)))

(declare-fun lt!293480 () (_ BitVec 64))

(declare-fun lt!293481 () (_ BitVec 64))

(assert (=> b!634809 (= res!410651 (or (not (= (select (arr!18329 a!2986) j!136) lt!293480)) (not (= (select (arr!18329 a!2986) j!136) lt!293481)) (bvsge j!136 index!984)))))

(declare-fun e!363028 () Bool)

(assert (=> b!634809 e!363028))

(declare-fun res!410648 () Bool)

(assert (=> b!634809 (=> (not res!410648) (not e!363028))))

(assert (=> b!634809 (= res!410648 (= lt!293481 (select (arr!18329 a!2986) j!136)))))

(assert (=> b!634809 (= lt!293481 (select (store (arr!18329 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!634810 () Bool)

(assert (=> b!634810 (= e!363036 (arrayContainsKey!0 lt!293483 (select (arr!18329 a!2986) j!136) index!984))))

(declare-fun b!634811 () Bool)

(declare-fun res!410639 () Bool)

(assert (=> b!634811 (=> (not res!410639) (not e!363035))))

(assert (=> b!634811 (= res!410639 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!410645 () Bool)

(assert (=> start!57348 (=> (not res!410645) (not e!363035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57348 (= res!410645 (validMask!0 mask!3053))))

(assert (=> start!57348 e!363035))

(assert (=> start!57348 true))

(declare-fun array_inv!14125 (array!38201) Bool)

(assert (=> start!57348 (array_inv!14125 a!2986)))

(declare-fun b!634812 () Bool)

(declare-fun e!363031 () Unit!21410)

(declare-fun Unit!21412 () Unit!21410)

(assert (=> b!634812 (= e!363031 Unit!21412)))

(declare-fun b!634813 () Bool)

(declare-fun res!410640 () Bool)

(assert (=> b!634813 (=> (not res!410640) (not e!363037))))

(declare-datatypes ((List!12370 0))(
  ( (Nil!12367) (Cons!12366 (h!13411 (_ BitVec 64)) (t!18598 List!12370)) )
))
(declare-fun arrayNoDuplicates!0 (array!38201 (_ BitVec 32) List!12370) Bool)

(assert (=> b!634813 (= res!410640 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12367))))

(declare-fun b!634814 () Bool)

(declare-fun Unit!21413 () Unit!21410)

(assert (=> b!634814 (= e!363031 Unit!21413)))

(assert (=> b!634814 false))

(declare-fun b!634815 () Bool)

(declare-fun res!410650 () Bool)

(assert (=> b!634815 (=> (not res!410650) (not e!363035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634815 (= res!410650 (validKeyInArray!0 (select (arr!18329 a!2986) j!136)))))

(declare-fun b!634816 () Bool)

(declare-fun res!410641 () Bool)

(assert (=> b!634816 (=> (not res!410641) (not e!363035))))

(assert (=> b!634816 (= res!410641 (and (= (size!18693 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18693 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18693 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634817 () Bool)

(assert (=> b!634817 (= e!363028 e!363029)))

(declare-fun res!410644 () Bool)

(assert (=> b!634817 (=> res!410644 e!363029)))

(assert (=> b!634817 (= res!410644 (or (not (= (select (arr!18329 a!2986) j!136) lt!293480)) (not (= (select (arr!18329 a!2986) j!136) lt!293481)) (bvsge j!136 index!984)))))

(declare-fun b!634818 () Bool)

(declare-fun res!410652 () Bool)

(assert (=> b!634818 (=> (not res!410652) (not e!363035))))

(assert (=> b!634818 (= res!410652 (validKeyInArray!0 k!1786))))

(declare-fun b!634819 () Bool)

(declare-fun e!363039 () Bool)

(assert (=> b!634819 (= e!363030 e!363039)))

(declare-fun res!410649 () Bool)

(assert (=> b!634819 (=> (not res!410649) (not e!363039))))

(assert (=> b!634819 (= res!410649 (and (= lt!293479 (Found!6769 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18329 a!2986) index!984) (select (arr!18329 a!2986) j!136))) (not (= (select (arr!18329 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38201 (_ BitVec 32)) SeekEntryResult!6769)

(assert (=> b!634819 (= lt!293479 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18329 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634820 () Bool)

(assert (=> b!634820 (= e!363039 (not e!363034))))

(declare-fun res!410653 () Bool)

(assert (=> b!634820 (=> res!410653 e!363034)))

(declare-fun lt!293478 () SeekEntryResult!6769)

(assert (=> b!634820 (= res!410653 (not (= lt!293478 (Found!6769 index!984))))))

(declare-fun lt!293482 () Unit!21410)

(assert (=> b!634820 (= lt!293482 e!363031)))

(declare-fun c!72449 () Bool)

(assert (=> b!634820 (= c!72449 (= lt!293478 Undefined!6769))))

(assert (=> b!634820 (= lt!293478 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293480 lt!293483 mask!3053))))

(assert (=> b!634820 e!363032))

(declare-fun res!410638 () Bool)

(assert (=> b!634820 (=> (not res!410638) (not e!363032))))

(declare-fun lt!293485 () (_ BitVec 32))

(assert (=> b!634820 (= res!410638 (= lt!293487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293485 vacantSpotIndex!68 lt!293480 lt!293483 mask!3053)))))

(assert (=> b!634820 (= lt!293487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293485 vacantSpotIndex!68 (select (arr!18329 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634820 (= lt!293480 (select (store (arr!18329 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293486 () Unit!21410)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21410)

(assert (=> b!634820 (= lt!293486 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293485 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634820 (= lt!293485 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57348 res!410645) b!634816))

(assert (= (and b!634816 res!410641) b!634815))

(assert (= (and b!634815 res!410650) b!634818))

(assert (= (and b!634818 res!410652) b!634811))

(assert (= (and b!634811 res!410639) b!634807))

(assert (= (and b!634807 res!410643) b!634806))

(assert (= (and b!634806 res!410654) b!634813))

(assert (= (and b!634813 res!410640) b!634804))

(assert (= (and b!634804 res!410646) b!634808))

(assert (= (and b!634808 res!410642) b!634819))

(assert (= (and b!634819 res!410649) b!634820))

(assert (= (and b!634820 res!410638) b!634805))

(assert (= (and b!634820 c!72449) b!634814))

(assert (= (and b!634820 (not c!72449)) b!634812))

(assert (= (and b!634820 (not res!410653)) b!634809))

(assert (= (and b!634809 res!410648) b!634817))

(assert (= (and b!634817 (not res!410644)) b!634802))

(assert (= (and b!634802 res!410647) b!634810))

(assert (= (and b!634809 (not res!410651)) b!634803))

(declare-fun m!609243 () Bool)

(assert (=> b!634802 m!609243))

(assert (=> b!634802 m!609243))

(declare-fun m!609245 () Bool)

(assert (=> b!634802 m!609245))

(declare-fun m!609247 () Bool)

(assert (=> b!634818 m!609247))

(assert (=> b!634810 m!609243))

(assert (=> b!634810 m!609243))

(declare-fun m!609249 () Bool)

(assert (=> b!634810 m!609249))

(declare-fun m!609251 () Bool)

(assert (=> start!57348 m!609251))

(declare-fun m!609253 () Bool)

(assert (=> start!57348 m!609253))

(assert (=> b!634817 m!609243))

(declare-fun m!609255 () Bool)

(assert (=> b!634820 m!609255))

(assert (=> b!634820 m!609243))

(declare-fun m!609257 () Bool)

(assert (=> b!634820 m!609257))

(declare-fun m!609259 () Bool)

(assert (=> b!634820 m!609259))

(assert (=> b!634820 m!609243))

(declare-fun m!609261 () Bool)

(assert (=> b!634820 m!609261))

(declare-fun m!609263 () Bool)

(assert (=> b!634820 m!609263))

(declare-fun m!609265 () Bool)

(assert (=> b!634820 m!609265))

(declare-fun m!609267 () Bool)

(assert (=> b!634820 m!609267))

(declare-fun m!609269 () Bool)

(assert (=> b!634804 m!609269))

(declare-fun m!609271 () Bool)

(assert (=> b!634811 m!609271))

(declare-fun m!609273 () Bool)

(assert (=> b!634806 m!609273))

(assert (=> b!634803 m!609243))

(assert (=> b!634803 m!609243))

(declare-fun m!609275 () Bool)

(assert (=> b!634803 m!609275))

(assert (=> b!634803 m!609243))

(declare-fun m!609277 () Bool)

(assert (=> b!634803 m!609277))

(assert (=> b!634809 m!609243))

(assert (=> b!634809 m!609261))

(declare-fun m!609279 () Bool)

(assert (=> b!634809 m!609279))

(declare-fun m!609281 () Bool)

(assert (=> b!634813 m!609281))

(assert (=> b!634808 m!609261))

(declare-fun m!609283 () Bool)

(assert (=> b!634808 m!609283))

(declare-fun m!609285 () Bool)

(assert (=> b!634819 m!609285))

(assert (=> b!634819 m!609243))

(assert (=> b!634819 m!609243))

(declare-fun m!609287 () Bool)

(assert (=> b!634819 m!609287))

(assert (=> b!634815 m!609243))

(assert (=> b!634815 m!609243))

(declare-fun m!609289 () Bool)

(assert (=> b!634815 m!609289))

(declare-fun m!609291 () Bool)

(assert (=> b!634807 m!609291))

(push 1)

