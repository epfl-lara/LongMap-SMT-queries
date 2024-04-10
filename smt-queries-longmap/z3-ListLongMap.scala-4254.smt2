; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58996 () Bool)

(assert start!58996)

(declare-fun b!651049 () Bool)

(declare-datatypes ((Unit!22224 0))(
  ( (Unit!22225) )
))
(declare-fun e!373558 () Unit!22224)

(declare-fun Unit!22226 () Unit!22224)

(assert (=> b!651049 (= e!373558 Unit!22226)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302654 () Unit!22224)

(declare-datatypes ((array!38577 0))(
  ( (array!38578 (arr!18493 (Array (_ BitVec 32) (_ BitVec 64))) (size!18857 (_ BitVec 32))) )
))
(declare-fun lt!302657 () array!38577)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38577)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22224)

(assert (=> b!651049 (= lt!302654 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302657 (select (arr!18493 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651049 (arrayContainsKey!0 lt!302657 (select (arr!18493 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!302655 () Unit!22224)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12534 0))(
  ( (Nil!12531) (Cons!12530 (h!13575 (_ BitVec 64)) (t!18762 List!12534)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12534) Unit!22224)

(assert (=> b!651049 (= lt!302655 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12531))))

(declare-fun arrayNoDuplicates!0 (array!38577 (_ BitVec 32) List!12534) Bool)

(assert (=> b!651049 (arrayNoDuplicates!0 lt!302657 #b00000000000000000000000000000000 Nil!12531)))

(declare-fun lt!302647 () Unit!22224)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38577 (_ BitVec 32) (_ BitVec 32)) Unit!22224)

(assert (=> b!651049 (= lt!302647 (lemmaNoDuplicateFromThenFromBigger!0 lt!302657 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651049 (arrayNoDuplicates!0 lt!302657 j!136 Nil!12531)))

(declare-fun lt!302652 () Unit!22224)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38577 (_ BitVec 64) (_ BitVec 32) List!12534) Unit!22224)

(assert (=> b!651049 (= lt!302652 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302657 (select (arr!18493 a!2986) j!136) j!136 Nil!12531))))

(assert (=> b!651049 false))

(declare-fun b!651050 () Bool)

(declare-fun e!373565 () Bool)

(declare-fun e!373553 () Bool)

(assert (=> b!651050 (= e!373565 (not e!373553))))

(declare-fun res!422117 () Bool)

(assert (=> b!651050 (=> res!422117 e!373553)))

(declare-datatypes ((SeekEntryResult!6933 0))(
  ( (MissingZero!6933 (index!30082 (_ BitVec 32))) (Found!6933 (index!30083 (_ BitVec 32))) (Intermediate!6933 (undefined!7745 Bool) (index!30084 (_ BitVec 32)) (x!58867 (_ BitVec 32))) (Undefined!6933) (MissingVacant!6933 (index!30085 (_ BitVec 32))) )
))
(declare-fun lt!302662 () SeekEntryResult!6933)

(assert (=> b!651050 (= res!422117 (not (= lt!302662 (Found!6933 index!984))))))

(declare-fun lt!302649 () Unit!22224)

(declare-fun e!373566 () Unit!22224)

(assert (=> b!651050 (= lt!302649 e!373566)))

(declare-fun c!74833 () Bool)

(assert (=> b!651050 (= c!74833 (= lt!302662 Undefined!6933))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!302656 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38577 (_ BitVec 32)) SeekEntryResult!6933)

(assert (=> b!651050 (= lt!302662 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302656 lt!302657 mask!3053))))

(declare-fun e!373559 () Bool)

(assert (=> b!651050 e!373559))

(declare-fun res!422127 () Bool)

(assert (=> b!651050 (=> (not res!422127) (not e!373559))))

(declare-fun lt!302648 () (_ BitVec 32))

(declare-fun lt!302660 () SeekEntryResult!6933)

(assert (=> b!651050 (= res!422127 (= lt!302660 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302648 vacantSpotIndex!68 lt!302656 lt!302657 mask!3053)))))

(assert (=> b!651050 (= lt!302660 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302648 vacantSpotIndex!68 (select (arr!18493 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651050 (= lt!302656 (select (store (arr!18493 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302646 () Unit!22224)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22224)

(assert (=> b!651050 (= lt!302646 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302648 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651050 (= lt!302648 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651051 () Bool)

(declare-fun res!422121 () Bool)

(declare-fun e!373560 () Bool)

(assert (=> b!651051 (=> (not res!422121) (not e!373560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38577 (_ BitVec 32)) Bool)

(assert (=> b!651051 (= res!422121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651052 () Bool)

(declare-fun res!422134 () Bool)

(assert (=> b!651052 (=> (not res!422134) (not e!373560))))

(assert (=> b!651052 (= res!422134 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18493 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!373554 () Bool)

(declare-fun b!651053 () Bool)

(assert (=> b!651053 (= e!373554 (arrayContainsKey!0 lt!302657 (select (arr!18493 a!2986) j!136) index!984))))

(declare-fun b!651054 () Bool)

(declare-fun Unit!22227 () Unit!22224)

(assert (=> b!651054 (= e!373566 Unit!22227)))

(assert (=> b!651054 false))

(declare-fun b!651055 () Bool)

(declare-fun lt!302651 () SeekEntryResult!6933)

(assert (=> b!651055 (= e!373559 (= lt!302651 lt!302660))))

(declare-fun b!651056 () Bool)

(declare-fun Unit!22228 () Unit!22224)

(assert (=> b!651056 (= e!373566 Unit!22228)))

(declare-fun b!651057 () Bool)

(declare-fun res!422129 () Bool)

(assert (=> b!651057 (=> (not res!422129) (not e!373560))))

(assert (=> b!651057 (= res!422129 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12531))))

(declare-fun res!422126 () Bool)

(declare-fun e!373552 () Bool)

(assert (=> start!58996 (=> (not res!422126) (not e!373552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58996 (= res!422126 (validMask!0 mask!3053))))

(assert (=> start!58996 e!373552))

(assert (=> start!58996 true))

(declare-fun array_inv!14289 (array!38577) Bool)

(assert (=> start!58996 (array_inv!14289 a!2986)))

(declare-fun b!651058 () Bool)

(declare-fun e!373562 () Bool)

(assert (=> b!651058 (= e!373560 e!373562)))

(declare-fun res!422132 () Bool)

(assert (=> b!651058 (=> (not res!422132) (not e!373562))))

(assert (=> b!651058 (= res!422132 (= (select (store (arr!18493 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651058 (= lt!302657 (array!38578 (store (arr!18493 a!2986) i!1108 k0!1786) (size!18857 a!2986)))))

(declare-fun b!651059 () Bool)

(declare-fun e!373557 () Bool)

(assert (=> b!651059 (= e!373557 true)))

(assert (=> b!651059 (arrayNoDuplicates!0 lt!302657 #b00000000000000000000000000000000 Nil!12531)))

(declare-fun lt!302661 () Unit!22224)

(assert (=> b!651059 (= lt!302661 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12531))))

(assert (=> b!651059 (arrayContainsKey!0 lt!302657 (select (arr!18493 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302659 () Unit!22224)

(assert (=> b!651059 (= lt!302659 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302657 (select (arr!18493 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373555 () Bool)

(assert (=> b!651059 e!373555))

(declare-fun res!422128 () Bool)

(assert (=> b!651059 (=> (not res!422128) (not e!373555))))

(assert (=> b!651059 (= res!422128 (arrayContainsKey!0 lt!302657 (select (arr!18493 a!2986) j!136) j!136))))

(declare-fun b!651060 () Bool)

(assert (=> b!651060 (= e!373552 e!373560)))

(declare-fun res!422131 () Bool)

(assert (=> b!651060 (=> (not res!422131) (not e!373560))))

(declare-fun lt!302653 () SeekEntryResult!6933)

(assert (=> b!651060 (= res!422131 (or (= lt!302653 (MissingZero!6933 i!1108)) (= lt!302653 (MissingVacant!6933 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38577 (_ BitVec 32)) SeekEntryResult!6933)

(assert (=> b!651060 (= lt!302653 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651061 () Bool)

(declare-fun res!422120 () Bool)

(assert (=> b!651061 (=> (not res!422120) (not e!373552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651061 (= res!422120 (validKeyInArray!0 (select (arr!18493 a!2986) j!136)))))

(declare-fun b!651062 () Bool)

(declare-fun Unit!22229 () Unit!22224)

(assert (=> b!651062 (= e!373558 Unit!22229)))

(declare-fun b!651063 () Bool)

(declare-fun res!422125 () Bool)

(assert (=> b!651063 (=> (not res!422125) (not e!373552))))

(assert (=> b!651063 (= res!422125 (validKeyInArray!0 k0!1786))))

(declare-fun b!651064 () Bool)

(declare-fun e!373561 () Bool)

(declare-fun e!373564 () Bool)

(assert (=> b!651064 (= e!373561 e!373564)))

(declare-fun res!422130 () Bool)

(assert (=> b!651064 (=> res!422130 e!373564)))

(declare-fun lt!302658 () (_ BitVec 64))

(assert (=> b!651064 (= res!422130 (or (not (= (select (arr!18493 a!2986) j!136) lt!302656)) (not (= (select (arr!18493 a!2986) j!136) lt!302658)) (bvsge j!136 index!984)))))

(declare-fun b!651065 () Bool)

(declare-fun res!422123 () Bool)

(assert (=> b!651065 (=> (not res!422123) (not e!373552))))

(assert (=> b!651065 (= res!422123 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651066 () Bool)

(assert (=> b!651066 (= e!373564 e!373554)))

(declare-fun res!422118 () Bool)

(assert (=> b!651066 (=> (not res!422118) (not e!373554))))

(assert (=> b!651066 (= res!422118 (arrayContainsKey!0 lt!302657 (select (arr!18493 a!2986) j!136) j!136))))

(declare-fun b!651067 () Bool)

(assert (=> b!651067 (= e!373562 e!373565)))

(declare-fun res!422135 () Bool)

(assert (=> b!651067 (=> (not res!422135) (not e!373565))))

(assert (=> b!651067 (= res!422135 (and (= lt!302651 (Found!6933 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18493 a!2986) index!984) (select (arr!18493 a!2986) j!136))) (not (= (select (arr!18493 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!651067 (= lt!302651 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18493 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651068 () Bool)

(assert (=> b!651068 (= e!373555 (arrayContainsKey!0 lt!302657 (select (arr!18493 a!2986) j!136) index!984))))

(declare-fun b!651069 () Bool)

(declare-fun res!422122 () Bool)

(assert (=> b!651069 (=> (not res!422122) (not e!373552))))

(assert (=> b!651069 (= res!422122 (and (= (size!18857 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18857 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18857 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651070 () Bool)

(declare-fun e!373556 () Bool)

(assert (=> b!651070 (= e!373556 e!373557)))

(declare-fun res!422133 () Bool)

(assert (=> b!651070 (=> res!422133 e!373557)))

(assert (=> b!651070 (= res!422133 (bvsge index!984 j!136))))

(declare-fun lt!302650 () Unit!22224)

(assert (=> b!651070 (= lt!302650 e!373558)))

(declare-fun c!74834 () Bool)

(assert (=> b!651070 (= c!74834 (bvslt j!136 index!984))))

(declare-fun b!651071 () Bool)

(assert (=> b!651071 (= e!373553 e!373556)))

(declare-fun res!422119 () Bool)

(assert (=> b!651071 (=> res!422119 e!373556)))

(assert (=> b!651071 (= res!422119 (or (not (= (select (arr!18493 a!2986) j!136) lt!302656)) (not (= (select (arr!18493 a!2986) j!136) lt!302658))))))

(assert (=> b!651071 e!373561))

(declare-fun res!422124 () Bool)

(assert (=> b!651071 (=> (not res!422124) (not e!373561))))

(assert (=> b!651071 (= res!422124 (= lt!302658 (select (arr!18493 a!2986) j!136)))))

(assert (=> b!651071 (= lt!302658 (select (store (arr!18493 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!58996 res!422126) b!651069))

(assert (= (and b!651069 res!422122) b!651061))

(assert (= (and b!651061 res!422120) b!651063))

(assert (= (and b!651063 res!422125) b!651065))

(assert (= (and b!651065 res!422123) b!651060))

(assert (= (and b!651060 res!422131) b!651051))

(assert (= (and b!651051 res!422121) b!651057))

(assert (= (and b!651057 res!422129) b!651052))

(assert (= (and b!651052 res!422134) b!651058))

(assert (= (and b!651058 res!422132) b!651067))

(assert (= (and b!651067 res!422135) b!651050))

(assert (= (and b!651050 res!422127) b!651055))

(assert (= (and b!651050 c!74833) b!651054))

(assert (= (and b!651050 (not c!74833)) b!651056))

(assert (= (and b!651050 (not res!422117)) b!651071))

(assert (= (and b!651071 res!422124) b!651064))

(assert (= (and b!651064 (not res!422130)) b!651066))

(assert (= (and b!651066 res!422118) b!651053))

(assert (= (and b!651071 (not res!422119)) b!651070))

(assert (= (and b!651070 c!74834) b!651049))

(assert (= (and b!651070 (not c!74834)) b!651062))

(assert (= (and b!651070 (not res!422133)) b!651059))

(assert (= (and b!651059 res!422128) b!651068))

(declare-fun m!624207 () Bool)

(assert (=> b!651058 m!624207))

(declare-fun m!624209 () Bool)

(assert (=> b!651058 m!624209))

(declare-fun m!624211 () Bool)

(assert (=> b!651065 m!624211))

(declare-fun m!624213 () Bool)

(assert (=> start!58996 m!624213))

(declare-fun m!624215 () Bool)

(assert (=> start!58996 m!624215))

(declare-fun m!624217 () Bool)

(assert (=> b!651071 m!624217))

(assert (=> b!651071 m!624207))

(declare-fun m!624219 () Bool)

(assert (=> b!651071 m!624219))

(declare-fun m!624221 () Bool)

(assert (=> b!651060 m!624221))

(declare-fun m!624223 () Bool)

(assert (=> b!651063 m!624223))

(assert (=> b!651053 m!624217))

(assert (=> b!651053 m!624217))

(declare-fun m!624225 () Bool)

(assert (=> b!651053 m!624225))

(assert (=> b!651068 m!624217))

(assert (=> b!651068 m!624217))

(assert (=> b!651068 m!624225))

(declare-fun m!624227 () Bool)

(assert (=> b!651051 m!624227))

(declare-fun m!624229 () Bool)

(assert (=> b!651067 m!624229))

(assert (=> b!651067 m!624217))

(assert (=> b!651067 m!624217))

(declare-fun m!624231 () Bool)

(assert (=> b!651067 m!624231))

(assert (=> b!651049 m!624217))

(declare-fun m!624233 () Bool)

(assert (=> b!651049 m!624233))

(assert (=> b!651049 m!624217))

(declare-fun m!624235 () Bool)

(assert (=> b!651049 m!624235))

(assert (=> b!651049 m!624217))

(declare-fun m!624237 () Bool)

(assert (=> b!651049 m!624237))

(assert (=> b!651049 m!624217))

(declare-fun m!624239 () Bool)

(assert (=> b!651049 m!624239))

(declare-fun m!624241 () Bool)

(assert (=> b!651049 m!624241))

(declare-fun m!624243 () Bool)

(assert (=> b!651049 m!624243))

(declare-fun m!624245 () Bool)

(assert (=> b!651049 m!624245))

(declare-fun m!624247 () Bool)

(assert (=> b!651057 m!624247))

(assert (=> b!651061 m!624217))

(assert (=> b!651061 m!624217))

(declare-fun m!624249 () Bool)

(assert (=> b!651061 m!624249))

(declare-fun m!624251 () Bool)

(assert (=> b!651050 m!624251))

(declare-fun m!624253 () Bool)

(assert (=> b!651050 m!624253))

(assert (=> b!651050 m!624217))

(assert (=> b!651050 m!624207))

(declare-fun m!624255 () Bool)

(assert (=> b!651050 m!624255))

(assert (=> b!651050 m!624217))

(declare-fun m!624257 () Bool)

(assert (=> b!651050 m!624257))

(declare-fun m!624259 () Bool)

(assert (=> b!651050 m!624259))

(declare-fun m!624261 () Bool)

(assert (=> b!651050 m!624261))

(assert (=> b!651066 m!624217))

(assert (=> b!651066 m!624217))

(declare-fun m!624263 () Bool)

(assert (=> b!651066 m!624263))

(assert (=> b!651064 m!624217))

(declare-fun m!624265 () Bool)

(assert (=> b!651052 m!624265))

(assert (=> b!651059 m!624217))

(assert (=> b!651059 m!624217))

(declare-fun m!624267 () Bool)

(assert (=> b!651059 m!624267))

(assert (=> b!651059 m!624217))

(declare-fun m!624269 () Bool)

(assert (=> b!651059 m!624269))

(assert (=> b!651059 m!624217))

(assert (=> b!651059 m!624263))

(assert (=> b!651059 m!624243))

(assert (=> b!651059 m!624245))

(check-sat (not b!651061) (not b!651067) (not b!651065) (not b!651060) (not b!651059) (not b!651057) (not start!58996) (not b!651066) (not b!651053) (not b!651068) (not b!651063) (not b!651050) (not b!651049) (not b!651051))
(check-sat)
