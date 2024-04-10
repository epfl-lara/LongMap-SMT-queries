; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59344 () Bool)

(assert start!59344)

(declare-fun b!654957 () Bool)

(declare-fun e!376135 () Bool)

(declare-fun e!376138 () Bool)

(assert (=> b!654957 (= e!376135 e!376138)))

(declare-fun res!424859 () Bool)

(assert (=> b!654957 (=> (not res!424859) (not e!376138))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38664 0))(
  ( (array!38665 (arr!18532 (Array (_ BitVec 32) (_ BitVec 64))) (size!18896 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38664)

(assert (=> b!654957 (= res!424859 (= (select (store (arr!18532 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!305294 () array!38664)

(assert (=> b!654957 (= lt!305294 (array!38665 (store (arr!18532 a!2986) i!1108 k0!1786) (size!18896 a!2986)))))

(declare-fun b!654958 () Bool)

(declare-fun res!424858 () Bool)

(assert (=> b!654958 (=> (not res!424858) (not e!376135))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38664 (_ BitVec 32)) Bool)

(assert (=> b!654958 (= res!424858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654959 () Bool)

(declare-fun e!376139 () Bool)

(assert (=> b!654959 (= e!376138 e!376139)))

(declare-fun res!424860 () Bool)

(assert (=> b!654959 (=> (not res!424860) (not e!376139))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6972 0))(
  ( (MissingZero!6972 (index!30247 (_ BitVec 32))) (Found!6972 (index!30248 (_ BitVec 32))) (Intermediate!6972 (undefined!7784 Bool) (index!30249 (_ BitVec 32)) (x!59037 (_ BitVec 32))) (Undefined!6972) (MissingVacant!6972 (index!30250 (_ BitVec 32))) )
))
(declare-fun lt!305299 () SeekEntryResult!6972)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654959 (= res!424860 (and (= lt!305299 (Found!6972 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18532 a!2986) index!984) (select (arr!18532 a!2986) j!136))) (not (= (select (arr!18532 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38664 (_ BitVec 32)) SeekEntryResult!6972)

(assert (=> b!654959 (= lt!305299 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18532 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654960 () Bool)

(declare-datatypes ((Unit!22474 0))(
  ( (Unit!22475) )
))
(declare-fun e!376129 () Unit!22474)

(declare-fun Unit!22476 () Unit!22474)

(assert (=> b!654960 (= e!376129 Unit!22476)))

(declare-fun b!654962 () Bool)

(declare-fun e!376140 () Bool)

(assert (=> b!654962 (= e!376140 e!376135)))

(declare-fun res!424863 () Bool)

(assert (=> b!654962 (=> (not res!424863) (not e!376135))))

(declare-fun lt!305283 () SeekEntryResult!6972)

(assert (=> b!654962 (= res!424863 (or (= lt!305283 (MissingZero!6972 i!1108)) (= lt!305283 (MissingVacant!6972 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38664 (_ BitVec 32)) SeekEntryResult!6972)

(assert (=> b!654962 (= lt!305283 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654963 () Bool)

(assert (=> b!654963 false))

(declare-fun lt!305302 () Unit!22474)

(declare-datatypes ((List!12573 0))(
  ( (Nil!12570) (Cons!12569 (h!13614 (_ BitVec 64)) (t!18801 List!12573)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38664 (_ BitVec 64) (_ BitVec 32) List!12573) Unit!22474)

(assert (=> b!654963 (= lt!305302 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305294 (select (arr!18532 a!2986) j!136) j!136 Nil!12570))))

(declare-fun arrayNoDuplicates!0 (array!38664 (_ BitVec 32) List!12573) Bool)

(assert (=> b!654963 (arrayNoDuplicates!0 lt!305294 j!136 Nil!12570)))

(declare-fun lt!305296 () Unit!22474)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38664 (_ BitVec 32) (_ BitVec 32)) Unit!22474)

(assert (=> b!654963 (= lt!305296 (lemmaNoDuplicateFromThenFromBigger!0 lt!305294 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654963 (arrayNoDuplicates!0 lt!305294 #b00000000000000000000000000000000 Nil!12570)))

(declare-fun lt!305288 () Unit!22474)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12573) Unit!22474)

(assert (=> b!654963 (= lt!305288 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12570))))

(declare-fun arrayContainsKey!0 (array!38664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654963 (arrayContainsKey!0 lt!305294 (select (arr!18532 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305292 () Unit!22474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22474)

(assert (=> b!654963 (= lt!305292 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305294 (select (arr!18532 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376130 () Unit!22474)

(declare-fun Unit!22477 () Unit!22474)

(assert (=> b!654963 (= e!376130 Unit!22477)))

(declare-fun b!654964 () Bool)

(assert (=> b!654964 false))

(declare-fun lt!305287 () Unit!22474)

(assert (=> b!654964 (= lt!305287 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305294 (select (arr!18532 a!2986) j!136) index!984 Nil!12570))))

(assert (=> b!654964 (arrayNoDuplicates!0 lt!305294 index!984 Nil!12570)))

(declare-fun lt!305284 () Unit!22474)

(assert (=> b!654964 (= lt!305284 (lemmaNoDuplicateFromThenFromBigger!0 lt!305294 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654964 (arrayNoDuplicates!0 lt!305294 #b00000000000000000000000000000000 Nil!12570)))

(declare-fun lt!305291 () Unit!22474)

(assert (=> b!654964 (= lt!305291 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12570))))

(assert (=> b!654964 (arrayContainsKey!0 lt!305294 (select (arr!18532 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305286 () Unit!22474)

(assert (=> b!654964 (= lt!305286 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305294 (select (arr!18532 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376128 () Bool)

(assert (=> b!654964 e!376128))

(declare-fun res!424864 () Bool)

(assert (=> b!654964 (=> (not res!424864) (not e!376128))))

(assert (=> b!654964 (= res!424864 (arrayContainsKey!0 lt!305294 (select (arr!18532 a!2986) j!136) j!136))))

(declare-fun e!376131 () Unit!22474)

(declare-fun Unit!22478 () Unit!22474)

(assert (=> b!654964 (= e!376131 Unit!22478)))

(declare-fun b!654965 () Bool)

(declare-fun e!376127 () Unit!22474)

(declare-fun Unit!22479 () Unit!22474)

(assert (=> b!654965 (= e!376127 Unit!22479)))

(declare-fun b!654966 () Bool)

(declare-fun res!424854 () Bool)

(assert (=> b!654966 (=> (not res!424854) (not e!376135))))

(assert (=> b!654966 (= res!424854 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12570))))

(declare-fun b!654967 () Bool)

(declare-fun res!424856 () Bool)

(assert (=> b!654967 (=> (not res!424856) (not e!376140))))

(assert (=> b!654967 (= res!424856 (and (= (size!18896 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18896 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18896 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654968 () Bool)

(declare-fun res!424862 () Bool)

(assert (=> b!654968 (=> (not res!424862) (not e!376140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654968 (= res!424862 (validKeyInArray!0 k0!1786))))

(declare-fun b!654969 () Bool)

(declare-fun res!424865 () Bool)

(assert (=> b!654969 (= res!424865 (arrayContainsKey!0 lt!305294 (select (arr!18532 a!2986) j!136) j!136))))

(declare-fun e!376136 () Bool)

(assert (=> b!654969 (=> (not res!424865) (not e!376136))))

(declare-fun e!376137 () Bool)

(assert (=> b!654969 (= e!376137 e!376136)))

(declare-fun b!654970 () Bool)

(assert (=> b!654970 (= e!376128 (arrayContainsKey!0 lt!305294 (select (arr!18532 a!2986) j!136) index!984))))

(declare-fun b!654971 () Bool)

(declare-fun res!424855 () Bool)

(assert (=> b!654971 (=> (not res!424855) (not e!376140))))

(assert (=> b!654971 (= res!424855 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654972 () Bool)

(assert (=> b!654972 (= e!376139 (not true))))

(declare-fun lt!305293 () Unit!22474)

(assert (=> b!654972 (= lt!305293 e!376129)))

(declare-fun c!75419 () Bool)

(declare-fun lt!305295 () SeekEntryResult!6972)

(assert (=> b!654972 (= c!75419 (= lt!305295 (Found!6972 index!984)))))

(declare-fun lt!305290 () Unit!22474)

(assert (=> b!654972 (= lt!305290 e!376127)))

(declare-fun c!75422 () Bool)

(assert (=> b!654972 (= c!75422 (= lt!305295 Undefined!6972))))

(declare-fun lt!305300 () (_ BitVec 64))

(assert (=> b!654972 (= lt!305295 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305300 lt!305294 mask!3053))))

(declare-fun e!376134 () Bool)

(assert (=> b!654972 e!376134))

(declare-fun res!424857 () Bool)

(assert (=> b!654972 (=> (not res!424857) (not e!376134))))

(declare-fun lt!305301 () (_ BitVec 32))

(declare-fun lt!305297 () SeekEntryResult!6972)

(assert (=> b!654972 (= res!424857 (= lt!305297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305301 vacantSpotIndex!68 lt!305300 lt!305294 mask!3053)))))

(assert (=> b!654972 (= lt!305297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305301 vacantSpotIndex!68 (select (arr!18532 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654972 (= lt!305300 (select (store (arr!18532 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305285 () Unit!22474)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38664 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22474)

(assert (=> b!654972 (= lt!305285 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305301 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654972 (= lt!305301 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654973 () Bool)

(declare-fun Unit!22480 () Unit!22474)

(assert (=> b!654973 (= e!376131 Unit!22480)))

(declare-fun res!424867 () Bool)

(assert (=> start!59344 (=> (not res!424867) (not e!376140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59344 (= res!424867 (validMask!0 mask!3053))))

(assert (=> start!59344 e!376140))

(assert (=> start!59344 true))

(declare-fun array_inv!14328 (array!38664) Bool)

(assert (=> start!59344 (array_inv!14328 a!2986)))

(declare-fun b!654961 () Bool)

(declare-fun res!424866 () Bool)

(assert (=> b!654961 (=> (not res!424866) (not e!376140))))

(assert (=> b!654961 (= res!424866 (validKeyInArray!0 (select (arr!18532 a!2986) j!136)))))

(declare-fun b!654974 () Bool)

(declare-fun Unit!22481 () Unit!22474)

(assert (=> b!654974 (= e!376127 Unit!22481)))

(assert (=> b!654974 false))

(declare-fun b!654975 () Bool)

(declare-fun Unit!22482 () Unit!22474)

(assert (=> b!654975 (= e!376130 Unit!22482)))

(declare-fun b!654976 () Bool)

(assert (=> b!654976 (= e!376136 (arrayContainsKey!0 lt!305294 (select (arr!18532 a!2986) j!136) index!984))))

(declare-fun b!654977 () Bool)

(declare-fun res!424861 () Bool)

(assert (=> b!654977 (=> (not res!424861) (not e!376135))))

(assert (=> b!654977 (= res!424861 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18532 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654978 () Bool)

(assert (=> b!654978 (= e!376134 (= lt!305299 lt!305297))))

(declare-fun b!654979 () Bool)

(declare-fun res!424868 () Bool)

(assert (=> b!654979 (= res!424868 (bvsge j!136 index!984))))

(assert (=> b!654979 (=> res!424868 e!376137)))

(declare-fun e!376133 () Bool)

(assert (=> b!654979 (= e!376133 e!376137)))

(declare-fun b!654980 () Bool)

(declare-fun Unit!22483 () Unit!22474)

(assert (=> b!654980 (= e!376129 Unit!22483)))

(declare-fun res!424853 () Bool)

(assert (=> b!654980 (= res!424853 (= (select (store (arr!18532 a!2986) i!1108 k0!1786) index!984) (select (arr!18532 a!2986) j!136)))))

(assert (=> b!654980 (=> (not res!424853) (not e!376133))))

(assert (=> b!654980 e!376133))

(declare-fun c!75420 () Bool)

(assert (=> b!654980 (= c!75420 (bvslt j!136 index!984))))

(declare-fun lt!305298 () Unit!22474)

(assert (=> b!654980 (= lt!305298 e!376130)))

(declare-fun c!75421 () Bool)

(assert (=> b!654980 (= c!75421 (bvslt index!984 j!136))))

(declare-fun lt!305289 () Unit!22474)

(assert (=> b!654980 (= lt!305289 e!376131)))

(assert (=> b!654980 false))

(assert (= (and start!59344 res!424867) b!654967))

(assert (= (and b!654967 res!424856) b!654961))

(assert (= (and b!654961 res!424866) b!654968))

(assert (= (and b!654968 res!424862) b!654971))

(assert (= (and b!654971 res!424855) b!654962))

(assert (= (and b!654962 res!424863) b!654958))

(assert (= (and b!654958 res!424858) b!654966))

(assert (= (and b!654966 res!424854) b!654977))

(assert (= (and b!654977 res!424861) b!654957))

(assert (= (and b!654957 res!424859) b!654959))

(assert (= (and b!654959 res!424860) b!654972))

(assert (= (and b!654972 res!424857) b!654978))

(assert (= (and b!654972 c!75422) b!654974))

(assert (= (and b!654972 (not c!75422)) b!654965))

(assert (= (and b!654972 c!75419) b!654980))

(assert (= (and b!654972 (not c!75419)) b!654960))

(assert (= (and b!654980 res!424853) b!654979))

(assert (= (and b!654979 (not res!424868)) b!654969))

(assert (= (and b!654969 res!424865) b!654976))

(assert (= (and b!654980 c!75420) b!654963))

(assert (= (and b!654980 (not c!75420)) b!654975))

(assert (= (and b!654980 c!75421) b!654964))

(assert (= (and b!654980 (not c!75421)) b!654973))

(assert (= (and b!654964 res!424864) b!654970))

(declare-fun m!628047 () Bool)

(assert (=> b!654957 m!628047))

(declare-fun m!628049 () Bool)

(assert (=> b!654957 m!628049))

(declare-fun m!628051 () Bool)

(assert (=> b!654959 m!628051))

(declare-fun m!628053 () Bool)

(assert (=> b!654959 m!628053))

(assert (=> b!654959 m!628053))

(declare-fun m!628055 () Bool)

(assert (=> b!654959 m!628055))

(declare-fun m!628057 () Bool)

(assert (=> b!654971 m!628057))

(declare-fun m!628059 () Bool)

(assert (=> start!59344 m!628059))

(declare-fun m!628061 () Bool)

(assert (=> start!59344 m!628061))

(declare-fun m!628063 () Bool)

(assert (=> b!654962 m!628063))

(declare-fun m!628065 () Bool)

(assert (=> b!654963 m!628065))

(assert (=> b!654963 m!628053))

(assert (=> b!654963 m!628053))

(declare-fun m!628067 () Bool)

(assert (=> b!654963 m!628067))

(declare-fun m!628069 () Bool)

(assert (=> b!654963 m!628069))

(declare-fun m!628071 () Bool)

(assert (=> b!654963 m!628071))

(declare-fun m!628073 () Bool)

(assert (=> b!654963 m!628073))

(assert (=> b!654963 m!628053))

(declare-fun m!628075 () Bool)

(assert (=> b!654963 m!628075))

(assert (=> b!654963 m!628053))

(declare-fun m!628077 () Bool)

(assert (=> b!654963 m!628077))

(declare-fun m!628079 () Bool)

(assert (=> b!654958 m!628079))

(declare-fun m!628081 () Bool)

(assert (=> b!654968 m!628081))

(assert (=> b!654964 m!628065))

(declare-fun m!628083 () Bool)

(assert (=> b!654964 m!628083))

(assert (=> b!654964 m!628053))

(assert (=> b!654964 m!628053))

(declare-fun m!628085 () Bool)

(assert (=> b!654964 m!628085))

(declare-fun m!628087 () Bool)

(assert (=> b!654964 m!628087))

(assert (=> b!654964 m!628053))

(declare-fun m!628089 () Bool)

(assert (=> b!654964 m!628089))

(assert (=> b!654964 m!628053))

(declare-fun m!628091 () Bool)

(assert (=> b!654964 m!628091))

(assert (=> b!654964 m!628053))

(declare-fun m!628093 () Bool)

(assert (=> b!654964 m!628093))

(assert (=> b!654964 m!628073))

(declare-fun m!628095 () Bool)

(assert (=> b!654977 m!628095))

(declare-fun m!628097 () Bool)

(assert (=> b!654972 m!628097))

(declare-fun m!628099 () Bool)

(assert (=> b!654972 m!628099))

(assert (=> b!654972 m!628053))

(assert (=> b!654972 m!628047))

(declare-fun m!628101 () Bool)

(assert (=> b!654972 m!628101))

(assert (=> b!654972 m!628053))

(declare-fun m!628103 () Bool)

(assert (=> b!654972 m!628103))

(declare-fun m!628105 () Bool)

(assert (=> b!654972 m!628105))

(declare-fun m!628107 () Bool)

(assert (=> b!654972 m!628107))

(declare-fun m!628109 () Bool)

(assert (=> b!654966 m!628109))

(assert (=> b!654970 m!628053))

(assert (=> b!654970 m!628053))

(declare-fun m!628111 () Bool)

(assert (=> b!654970 m!628111))

(assert (=> b!654961 m!628053))

(assert (=> b!654961 m!628053))

(declare-fun m!628113 () Bool)

(assert (=> b!654961 m!628113))

(assert (=> b!654969 m!628053))

(assert (=> b!654969 m!628053))

(assert (=> b!654969 m!628085))

(assert (=> b!654980 m!628047))

(declare-fun m!628115 () Bool)

(assert (=> b!654980 m!628115))

(assert (=> b!654980 m!628053))

(assert (=> b!654976 m!628053))

(assert (=> b!654976 m!628053))

(assert (=> b!654976 m!628111))

(check-sat (not b!654976) (not b!654968) (not b!654958) (not b!654966) (not b!654963) (not b!654959) (not b!654969) (not b!654971) (not b!654970) (not b!654964) (not b!654962) (not b!654961) (not b!654972) (not start!59344))
(check-sat)
