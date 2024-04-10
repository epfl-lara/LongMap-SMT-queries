; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57268 () Bool)

(assert start!57268)

(declare-fun b!633972 () Bool)

(declare-fun res!410076 () Bool)

(declare-fun e!362511 () Bool)

(assert (=> b!633972 (=> (not res!410076) (not e!362511))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38178 0))(
  ( (array!38179 (arr!18319 (Array (_ BitVec 32) (_ BitVec 64))) (size!18683 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38178)

(assert (=> b!633972 (= res!410076 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18319 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633973 () Bool)

(declare-fun res!410067 () Bool)

(declare-fun e!362508 () Bool)

(assert (=> b!633973 (=> (not res!410067) (not e!362508))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633973 (= res!410067 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633974 () Bool)

(declare-datatypes ((Unit!21370 0))(
  ( (Unit!21371) )
))
(declare-fun e!362517 () Unit!21370)

(declare-fun Unit!21372 () Unit!21370)

(assert (=> b!633974 (= e!362517 Unit!21372)))

(assert (=> b!633974 false))

(declare-fun b!633975 () Bool)

(declare-fun e!362513 () Bool)

(assert (=> b!633975 (= e!362513 true)))

(declare-fun e!362507 () Bool)

(assert (=> b!633975 e!362507))

(declare-fun res!410081 () Bool)

(assert (=> b!633975 (=> (not res!410081) (not e!362507))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293063 () (_ BitVec 64))

(assert (=> b!633975 (= res!410081 (= lt!293063 (select (arr!18319 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633975 (= lt!293063 (select (store (arr!18319 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633976 () Bool)

(assert (=> b!633976 (= e!362508 e!362511)))

(declare-fun res!410066 () Bool)

(assert (=> b!633976 (=> (not res!410066) (not e!362511))))

(declare-datatypes ((SeekEntryResult!6759 0))(
  ( (MissingZero!6759 (index!29335 (_ BitVec 32))) (Found!6759 (index!29336 (_ BitVec 32))) (Intermediate!6759 (undefined!7571 Bool) (index!29337 (_ BitVec 32)) (x!58076 (_ BitVec 32))) (Undefined!6759) (MissingVacant!6759 (index!29338 (_ BitVec 32))) )
))
(declare-fun lt!293062 () SeekEntryResult!6759)

(assert (=> b!633976 (= res!410066 (or (= lt!293062 (MissingZero!6759 i!1108)) (= lt!293062 (MissingVacant!6759 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38178 (_ BitVec 32)) SeekEntryResult!6759)

(assert (=> b!633976 (= lt!293062 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633977 () Bool)

(declare-fun res!410074 () Bool)

(assert (=> b!633977 (=> (not res!410074) (not e!362508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633977 (= res!410074 (validKeyInArray!0 k0!1786))))

(declare-fun b!633978 () Bool)

(declare-fun e!362515 () Bool)

(declare-fun lt!293064 () SeekEntryResult!6759)

(declare-fun lt!293066 () SeekEntryResult!6759)

(assert (=> b!633978 (= e!362515 (= lt!293064 lt!293066))))

(declare-fun e!362512 () Bool)

(declare-fun lt!293067 () array!38178)

(declare-fun b!633979 () Bool)

(assert (=> b!633979 (= e!362512 (arrayContainsKey!0 lt!293067 (select (arr!18319 a!2986) j!136) index!984))))

(declare-fun b!633980 () Bool)

(declare-fun Unit!21373 () Unit!21370)

(assert (=> b!633980 (= e!362517 Unit!21373)))

(declare-fun b!633981 () Bool)

(declare-fun e!362514 () Bool)

(assert (=> b!633981 (= e!362507 e!362514)))

(declare-fun res!410068 () Bool)

(assert (=> b!633981 (=> res!410068 e!362514)))

(declare-fun lt!293069 () (_ BitVec 64))

(assert (=> b!633981 (= res!410068 (or (not (= (select (arr!18319 a!2986) j!136) lt!293069)) (not (= (select (arr!18319 a!2986) j!136) lt!293063)) (bvsge j!136 index!984)))))

(declare-fun b!633982 () Bool)

(declare-fun e!362516 () Bool)

(assert (=> b!633982 (= e!362516 (not e!362513))))

(declare-fun res!410070 () Bool)

(assert (=> b!633982 (=> res!410070 e!362513)))

(declare-fun lt!293068 () SeekEntryResult!6759)

(assert (=> b!633982 (= res!410070 (not (= lt!293068 (Found!6759 index!984))))))

(declare-fun lt!293065 () Unit!21370)

(assert (=> b!633982 (= lt!293065 e!362517)))

(declare-fun c!72320 () Bool)

(assert (=> b!633982 (= c!72320 (= lt!293068 Undefined!6759))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38178 (_ BitVec 32)) SeekEntryResult!6759)

(assert (=> b!633982 (= lt!293068 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293069 lt!293067 mask!3053))))

(assert (=> b!633982 e!362515))

(declare-fun res!410071 () Bool)

(assert (=> b!633982 (=> (not res!410071) (not e!362515))))

(declare-fun lt!293071 () (_ BitVec 32))

(assert (=> b!633982 (= res!410071 (= lt!293066 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293071 vacantSpotIndex!68 lt!293069 lt!293067 mask!3053)))))

(assert (=> b!633982 (= lt!293066 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293071 vacantSpotIndex!68 (select (arr!18319 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633982 (= lt!293069 (select (store (arr!18319 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293070 () Unit!21370)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21370)

(assert (=> b!633982 (= lt!293070 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293071 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633982 (= lt!293071 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633983 () Bool)

(declare-fun e!362510 () Bool)

(assert (=> b!633983 (= e!362510 e!362516)))

(declare-fun res!410069 () Bool)

(assert (=> b!633983 (=> (not res!410069) (not e!362516))))

(assert (=> b!633983 (= res!410069 (and (= lt!293064 (Found!6759 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18319 a!2986) index!984) (select (arr!18319 a!2986) j!136))) (not (= (select (arr!18319 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633983 (= lt!293064 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18319 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!410079 () Bool)

(assert (=> start!57268 (=> (not res!410079) (not e!362508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57268 (= res!410079 (validMask!0 mask!3053))))

(assert (=> start!57268 e!362508))

(assert (=> start!57268 true))

(declare-fun array_inv!14115 (array!38178) Bool)

(assert (=> start!57268 (array_inv!14115 a!2986)))

(declare-fun b!633984 () Bool)

(declare-fun res!410073 () Bool)

(assert (=> b!633984 (=> (not res!410073) (not e!362511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38178 (_ BitVec 32)) Bool)

(assert (=> b!633984 (= res!410073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633985 () Bool)

(declare-fun res!410080 () Bool)

(assert (=> b!633985 (=> (not res!410080) (not e!362508))))

(assert (=> b!633985 (= res!410080 (and (= (size!18683 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18683 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18683 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633986 () Bool)

(declare-fun res!410072 () Bool)

(assert (=> b!633986 (=> (not res!410072) (not e!362508))))

(assert (=> b!633986 (= res!410072 (validKeyInArray!0 (select (arr!18319 a!2986) j!136)))))

(declare-fun b!633987 () Bool)

(assert (=> b!633987 (= e!362511 e!362510)))

(declare-fun res!410078 () Bool)

(assert (=> b!633987 (=> (not res!410078) (not e!362510))))

(assert (=> b!633987 (= res!410078 (= (select (store (arr!18319 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633987 (= lt!293067 (array!38179 (store (arr!18319 a!2986) i!1108 k0!1786) (size!18683 a!2986)))))

(declare-fun b!633988 () Bool)

(assert (=> b!633988 (= e!362514 e!362512)))

(declare-fun res!410075 () Bool)

(assert (=> b!633988 (=> (not res!410075) (not e!362512))))

(assert (=> b!633988 (= res!410075 (arrayContainsKey!0 lt!293067 (select (arr!18319 a!2986) j!136) j!136))))

(declare-fun b!633989 () Bool)

(declare-fun res!410077 () Bool)

(assert (=> b!633989 (=> (not res!410077) (not e!362511))))

(declare-datatypes ((List!12360 0))(
  ( (Nil!12357) (Cons!12356 (h!13401 (_ BitVec 64)) (t!18588 List!12360)) )
))
(declare-fun arrayNoDuplicates!0 (array!38178 (_ BitVec 32) List!12360) Bool)

(assert (=> b!633989 (= res!410077 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12357))))

(assert (= (and start!57268 res!410079) b!633985))

(assert (= (and b!633985 res!410080) b!633986))

(assert (= (and b!633986 res!410072) b!633977))

(assert (= (and b!633977 res!410074) b!633973))

(assert (= (and b!633973 res!410067) b!633976))

(assert (= (and b!633976 res!410066) b!633984))

(assert (= (and b!633984 res!410073) b!633989))

(assert (= (and b!633989 res!410077) b!633972))

(assert (= (and b!633972 res!410076) b!633987))

(assert (= (and b!633987 res!410078) b!633983))

(assert (= (and b!633983 res!410069) b!633982))

(assert (= (and b!633982 res!410071) b!633978))

(assert (= (and b!633982 c!72320) b!633974))

(assert (= (and b!633982 (not c!72320)) b!633980))

(assert (= (and b!633982 (not res!410070)) b!633975))

(assert (= (and b!633975 res!410081) b!633981))

(assert (= (and b!633981 (not res!410068)) b!633988))

(assert (= (and b!633988 res!410075) b!633979))

(declare-fun m!608547 () Bool)

(assert (=> b!633976 m!608547))

(declare-fun m!608549 () Bool)

(assert (=> b!633977 m!608549))

(declare-fun m!608551 () Bool)

(assert (=> b!633983 m!608551))

(declare-fun m!608553 () Bool)

(assert (=> b!633983 m!608553))

(assert (=> b!633983 m!608553))

(declare-fun m!608555 () Bool)

(assert (=> b!633983 m!608555))

(declare-fun m!608557 () Bool)

(assert (=> b!633973 m!608557))

(declare-fun m!608559 () Bool)

(assert (=> b!633987 m!608559))

(declare-fun m!608561 () Bool)

(assert (=> b!633987 m!608561))

(declare-fun m!608563 () Bool)

(assert (=> b!633982 m!608563))

(declare-fun m!608565 () Bool)

(assert (=> b!633982 m!608565))

(declare-fun m!608567 () Bool)

(assert (=> b!633982 m!608567))

(declare-fun m!608569 () Bool)

(assert (=> b!633982 m!608569))

(assert (=> b!633982 m!608553))

(assert (=> b!633982 m!608559))

(declare-fun m!608571 () Bool)

(assert (=> b!633982 m!608571))

(assert (=> b!633982 m!608553))

(declare-fun m!608573 () Bool)

(assert (=> b!633982 m!608573))

(assert (=> b!633986 m!608553))

(assert (=> b!633986 m!608553))

(declare-fun m!608575 () Bool)

(assert (=> b!633986 m!608575))

(declare-fun m!608577 () Bool)

(assert (=> b!633989 m!608577))

(assert (=> b!633979 m!608553))

(assert (=> b!633979 m!608553))

(declare-fun m!608579 () Bool)

(assert (=> b!633979 m!608579))

(assert (=> b!633988 m!608553))

(assert (=> b!633988 m!608553))

(declare-fun m!608581 () Bool)

(assert (=> b!633988 m!608581))

(assert (=> b!633975 m!608553))

(assert (=> b!633975 m!608559))

(declare-fun m!608583 () Bool)

(assert (=> b!633975 m!608583))

(assert (=> b!633981 m!608553))

(declare-fun m!608585 () Bool)

(assert (=> b!633972 m!608585))

(declare-fun m!608587 () Bool)

(assert (=> start!57268 m!608587))

(declare-fun m!608589 () Bool)

(assert (=> start!57268 m!608589))

(declare-fun m!608591 () Bool)

(assert (=> b!633984 m!608591))

(check-sat (not b!633986) (not b!633988) (not b!633983) (not b!633976) (not start!57268) (not b!633979) (not b!633982) (not b!633984) (not b!633989) (not b!633977) (not b!633973))
(check-sat)
