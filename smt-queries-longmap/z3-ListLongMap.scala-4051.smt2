; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55422 () Bool)

(assert start!55422)

(declare-fun b!606171 () Bool)

(declare-fun res!389435 () Bool)

(declare-fun e!347041 () Bool)

(assert (=> b!606171 (=> (not res!389435) (not e!347041))))

(declare-datatypes ((array!37260 0))(
  ( (array!37261 (arr!17882 (Array (_ BitVec 32) (_ BitVec 64))) (size!18247 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37260)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37260 (_ BitVec 32)) Bool)

(assert (=> b!606171 (= res!389435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606172 () Bool)

(declare-fun res!389441 () Bool)

(assert (=> b!606172 (=> (not res!389441) (not e!347041))))

(declare-datatypes ((List!11962 0))(
  ( (Nil!11959) (Cons!11958 (h!13003 (_ BitVec 64)) (t!18181 List!11962)) )
))
(declare-fun arrayNoDuplicates!0 (array!37260 (_ BitVec 32) List!11962) Bool)

(assert (=> b!606172 (= res!389441 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11959))))

(declare-fun b!606173 () Bool)

(declare-fun e!347037 () Bool)

(declare-fun contains!2984 (List!11962 (_ BitVec 64)) Bool)

(assert (=> b!606173 (= e!347037 (not (contains!2984 Nil!11959 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606174 () Bool)

(declare-fun res!389452 () Bool)

(declare-fun e!347039 () Bool)

(assert (=> b!606174 (=> (not res!389452) (not e!347039))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606174 (= res!389452 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!606175 () Bool)

(declare-fun e!347027 () Bool)

(declare-fun e!347031 () Bool)

(assert (=> b!606175 (= e!347027 e!347031)))

(declare-fun res!389448 () Bool)

(assert (=> b!606175 (=> res!389448 e!347031)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!276556 () (_ BitVec 64))

(declare-fun lt!276543 () (_ BitVec 64))

(assert (=> b!606175 (= res!389448 (or (not (= (select (arr!17882 a!2986) j!136) lt!276543)) (not (= (select (arr!17882 a!2986) j!136) lt!276556))))))

(declare-fun e!347033 () Bool)

(assert (=> b!606175 e!347033))

(declare-fun res!389454 () Bool)

(assert (=> b!606175 (=> (not res!389454) (not e!347033))))

(assert (=> b!606175 (= res!389454 (= lt!276556 (select (arr!17882 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!606175 (= lt!276556 (select (store (arr!17882 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!606176 () Bool)

(declare-datatypes ((Unit!19296 0))(
  ( (Unit!19297) )
))
(declare-fun e!347034 () Unit!19296)

(declare-fun Unit!19298 () Unit!19296)

(assert (=> b!606176 (= e!347034 Unit!19298)))

(declare-fun lt!276544 () Unit!19296)

(declare-fun lt!276555 () array!37260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37260 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19296)

(assert (=> b!606176 (= lt!276544 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276555 (select (arr!17882 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606176 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276554 () Unit!19296)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37260 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11962) Unit!19296)

(assert (=> b!606176 (= lt!276554 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11959))))

(assert (=> b!606176 (arrayNoDuplicates!0 lt!276555 #b00000000000000000000000000000000 Nil!11959)))

(declare-fun lt!276553 () Unit!19296)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37260 (_ BitVec 32) (_ BitVec 32)) Unit!19296)

(assert (=> b!606176 (= lt!276553 (lemmaNoDuplicateFromThenFromBigger!0 lt!276555 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606176 (arrayNoDuplicates!0 lt!276555 j!136 Nil!11959)))

(declare-fun lt!276550 () Unit!19296)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37260 (_ BitVec 64) (_ BitVec 32) List!11962) Unit!19296)

(assert (=> b!606176 (= lt!276550 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276555 (select (arr!17882 a!2986) j!136) j!136 Nil!11959))))

(assert (=> b!606176 false))

(declare-fun b!606178 () Bool)

(declare-fun res!389440 () Bool)

(declare-fun e!347043 () Bool)

(assert (=> b!606178 (=> res!389440 e!347043)))

(declare-fun noDuplicate!311 (List!11962) Bool)

(assert (=> b!606178 (= res!389440 (not (noDuplicate!311 Nil!11959)))))

(declare-fun b!606179 () Bool)

(declare-fun res!389447 () Bool)

(assert (=> b!606179 (=> (not res!389447) (not e!347041))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!606179 (= res!389447 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17882 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606180 () Bool)

(declare-fun e!347040 () Bool)

(assert (=> b!606180 (= e!347040 e!347043)))

(declare-fun res!389437 () Bool)

(assert (=> b!606180 (=> res!389437 e!347043)))

(assert (=> b!606180 (= res!389437 (or (bvsgt #b00000000000000000000000000000000 (size!18247 a!2986)) (bvsge (size!18247 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!606180 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276551 () Unit!19296)

(assert (=> b!606180 (= lt!276551 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276555 (select (arr!17882 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347036 () Bool)

(assert (=> b!606180 e!347036))

(declare-fun res!389442 () Bool)

(assert (=> b!606180 (=> (not res!389442) (not e!347036))))

(assert (=> b!606180 (= res!389442 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) j!136))))

(declare-fun b!606181 () Bool)

(declare-fun res!389444 () Bool)

(assert (=> b!606181 (=> (not res!389444) (not e!347039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606181 (= res!389444 (validKeyInArray!0 (select (arr!17882 a!2986) j!136)))))

(declare-fun b!606182 () Bool)

(declare-fun res!389455 () Bool)

(assert (=> b!606182 (=> (not res!389455) (not e!347039))))

(assert (=> b!606182 (= res!389455 (and (= (size!18247 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18247 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18247 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606183 () Bool)

(declare-fun e!347030 () Bool)

(assert (=> b!606183 (= e!347030 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) index!984))))

(declare-fun b!606177 () Bool)

(declare-fun Unit!19299 () Unit!19296)

(assert (=> b!606177 (= e!347034 Unit!19299)))

(declare-fun res!389436 () Bool)

(assert (=> start!55422 (=> (not res!389436) (not e!347039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55422 (= res!389436 (validMask!0 mask!3053))))

(assert (=> start!55422 e!347039))

(assert (=> start!55422 true))

(declare-fun array_inv!13765 (array!37260) Bool)

(assert (=> start!55422 (array_inv!13765 a!2986)))

(declare-fun b!606184 () Bool)

(assert (=> b!606184 (= e!347036 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) index!984))))

(declare-fun b!606185 () Bool)

(declare-fun e!347029 () Bool)

(assert (=> b!606185 (= e!347029 (not e!347027))))

(declare-fun res!389451 () Bool)

(assert (=> b!606185 (=> res!389451 e!347027)))

(declare-datatypes ((SeekEntryResult!6319 0))(
  ( (MissingZero!6319 (index!27548 (_ BitVec 32))) (Found!6319 (index!27549 (_ BitVec 32))) (Intermediate!6319 (undefined!7131 Bool) (index!27550 (_ BitVec 32)) (x!56366 (_ BitVec 32))) (Undefined!6319) (MissingVacant!6319 (index!27551 (_ BitVec 32))) )
))
(declare-fun lt!276546 () SeekEntryResult!6319)

(assert (=> b!606185 (= res!389451 (not (= lt!276546 (Found!6319 index!984))))))

(declare-fun lt!276552 () Unit!19296)

(declare-fun e!347038 () Unit!19296)

(assert (=> b!606185 (= lt!276552 e!347038)))

(declare-fun c!68736 () Bool)

(assert (=> b!606185 (= c!68736 (= lt!276546 Undefined!6319))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37260 (_ BitVec 32)) SeekEntryResult!6319)

(assert (=> b!606185 (= lt!276546 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276543 lt!276555 mask!3053))))

(declare-fun e!347032 () Bool)

(assert (=> b!606185 e!347032))

(declare-fun res!389439 () Bool)

(assert (=> b!606185 (=> (not res!389439) (not e!347032))))

(declare-fun lt!276547 () (_ BitVec 32))

(declare-fun lt!276548 () SeekEntryResult!6319)

(assert (=> b!606185 (= res!389439 (= lt!276548 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 lt!276543 lt!276555 mask!3053)))))

(assert (=> b!606185 (= lt!276548 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!606185 (= lt!276543 (select (store (arr!17882 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276542 () Unit!19296)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19296)

(assert (=> b!606185 (= lt!276542 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606185 (= lt!276547 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!606186 () Bool)

(assert (=> b!606186 (= e!347031 e!347040)))

(declare-fun res!389438 () Bool)

(assert (=> b!606186 (=> res!389438 e!347040)))

(assert (=> b!606186 (= res!389438 (bvsge index!984 j!136))))

(declare-fun lt!276545 () Unit!19296)

(assert (=> b!606186 (= lt!276545 e!347034)))

(declare-fun c!68735 () Bool)

(assert (=> b!606186 (= c!68735 (bvslt j!136 index!984))))

(declare-fun b!606187 () Bool)

(declare-fun Unit!19300 () Unit!19296)

(assert (=> b!606187 (= e!347038 Unit!19300)))

(assert (=> b!606187 false))

(declare-fun b!606188 () Bool)

(declare-fun res!389456 () Bool)

(assert (=> b!606188 (=> (not res!389456) (not e!347039))))

(assert (=> b!606188 (= res!389456 (validKeyInArray!0 k0!1786))))

(declare-fun b!606189 () Bool)

(assert (=> b!606189 (= e!347039 e!347041)))

(declare-fun res!389446 () Bool)

(assert (=> b!606189 (=> (not res!389446) (not e!347041))))

(declare-fun lt!276549 () SeekEntryResult!6319)

(assert (=> b!606189 (= res!389446 (or (= lt!276549 (MissingZero!6319 i!1108)) (= lt!276549 (MissingVacant!6319 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37260 (_ BitVec 32)) SeekEntryResult!6319)

(assert (=> b!606189 (= lt!276549 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!606190 () Bool)

(declare-fun Unit!19301 () Unit!19296)

(assert (=> b!606190 (= e!347038 Unit!19301)))

(declare-fun b!606191 () Bool)

(assert (=> b!606191 (= e!347043 e!347037)))

(declare-fun res!389445 () Bool)

(assert (=> b!606191 (=> (not res!389445) (not e!347037))))

(assert (=> b!606191 (= res!389445 (not (contains!2984 Nil!11959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606192 () Bool)

(declare-fun e!347042 () Bool)

(assert (=> b!606192 (= e!347041 e!347042)))

(declare-fun res!389443 () Bool)

(assert (=> b!606192 (=> (not res!389443) (not e!347042))))

(assert (=> b!606192 (= res!389443 (= (select (store (arr!17882 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606192 (= lt!276555 (array!37261 (store (arr!17882 a!2986) i!1108 k0!1786) (size!18247 a!2986)))))

(declare-fun b!606193 () Bool)

(declare-fun lt!276541 () SeekEntryResult!6319)

(assert (=> b!606193 (= e!347032 (= lt!276541 lt!276548))))

(declare-fun b!606194 () Bool)

(declare-fun e!347035 () Bool)

(assert (=> b!606194 (= e!347035 e!347030)))

(declare-fun res!389450 () Bool)

(assert (=> b!606194 (=> (not res!389450) (not e!347030))))

(assert (=> b!606194 (= res!389450 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) j!136))))

(declare-fun b!606195 () Bool)

(assert (=> b!606195 (= e!347042 e!347029)))

(declare-fun res!389453 () Bool)

(assert (=> b!606195 (=> (not res!389453) (not e!347029))))

(assert (=> b!606195 (= res!389453 (and (= lt!276541 (Found!6319 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17882 a!2986) index!984) (select (arr!17882 a!2986) j!136))) (not (= (select (arr!17882 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606195 (= lt!276541 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606196 () Bool)

(assert (=> b!606196 (= e!347033 e!347035)))

(declare-fun res!389449 () Bool)

(assert (=> b!606196 (=> res!389449 e!347035)))

(assert (=> b!606196 (= res!389449 (or (not (= (select (arr!17882 a!2986) j!136) lt!276543)) (not (= (select (arr!17882 a!2986) j!136) lt!276556)) (bvsge j!136 index!984)))))

(assert (= (and start!55422 res!389436) b!606182))

(assert (= (and b!606182 res!389455) b!606181))

(assert (= (and b!606181 res!389444) b!606188))

(assert (= (and b!606188 res!389456) b!606174))

(assert (= (and b!606174 res!389452) b!606189))

(assert (= (and b!606189 res!389446) b!606171))

(assert (= (and b!606171 res!389435) b!606172))

(assert (= (and b!606172 res!389441) b!606179))

(assert (= (and b!606179 res!389447) b!606192))

(assert (= (and b!606192 res!389443) b!606195))

(assert (= (and b!606195 res!389453) b!606185))

(assert (= (and b!606185 res!389439) b!606193))

(assert (= (and b!606185 c!68736) b!606187))

(assert (= (and b!606185 (not c!68736)) b!606190))

(assert (= (and b!606185 (not res!389451)) b!606175))

(assert (= (and b!606175 res!389454) b!606196))

(assert (= (and b!606196 (not res!389449)) b!606194))

(assert (= (and b!606194 res!389450) b!606183))

(assert (= (and b!606175 (not res!389448)) b!606186))

(assert (= (and b!606186 c!68735) b!606176))

(assert (= (and b!606186 (not c!68735)) b!606177))

(assert (= (and b!606186 (not res!389438)) b!606180))

(assert (= (and b!606180 res!389442) b!606184))

(assert (= (and b!606180 (not res!389437)) b!606178))

(assert (= (and b!606178 (not res!389440)) b!606191))

(assert (= (and b!606191 res!389445) b!606173))

(declare-fun m!582481 () Bool)

(assert (=> b!606194 m!582481))

(assert (=> b!606194 m!582481))

(declare-fun m!582483 () Bool)

(assert (=> b!606194 m!582483))

(assert (=> b!606196 m!582481))

(assert (=> b!606183 m!582481))

(assert (=> b!606183 m!582481))

(declare-fun m!582485 () Bool)

(assert (=> b!606183 m!582485))

(declare-fun m!582487 () Bool)

(assert (=> b!606192 m!582487))

(declare-fun m!582489 () Bool)

(assert (=> b!606192 m!582489))

(declare-fun m!582491 () Bool)

(assert (=> b!606172 m!582491))

(assert (=> b!606175 m!582481))

(assert (=> b!606175 m!582487))

(declare-fun m!582493 () Bool)

(assert (=> b!606175 m!582493))

(declare-fun m!582495 () Bool)

(assert (=> start!55422 m!582495))

(declare-fun m!582497 () Bool)

(assert (=> start!55422 m!582497))

(declare-fun m!582499 () Bool)

(assert (=> b!606171 m!582499))

(declare-fun m!582501 () Bool)

(assert (=> b!606174 m!582501))

(declare-fun m!582503 () Bool)

(assert (=> b!606188 m!582503))

(assert (=> b!606180 m!582481))

(assert (=> b!606180 m!582481))

(declare-fun m!582505 () Bool)

(assert (=> b!606180 m!582505))

(assert (=> b!606180 m!582481))

(declare-fun m!582507 () Bool)

(assert (=> b!606180 m!582507))

(assert (=> b!606180 m!582481))

(assert (=> b!606180 m!582483))

(declare-fun m!582509 () Bool)

(assert (=> b!606178 m!582509))

(assert (=> b!606184 m!582481))

(assert (=> b!606184 m!582481))

(assert (=> b!606184 m!582485))

(declare-fun m!582511 () Bool)

(assert (=> b!606195 m!582511))

(assert (=> b!606195 m!582481))

(assert (=> b!606195 m!582481))

(declare-fun m!582513 () Bool)

(assert (=> b!606195 m!582513))

(declare-fun m!582515 () Bool)

(assert (=> b!606191 m!582515))

(declare-fun m!582517 () Bool)

(assert (=> b!606176 m!582517))

(assert (=> b!606176 m!582481))

(assert (=> b!606176 m!582481))

(declare-fun m!582519 () Bool)

(assert (=> b!606176 m!582519))

(declare-fun m!582521 () Bool)

(assert (=> b!606176 m!582521))

(assert (=> b!606176 m!582481))

(declare-fun m!582523 () Bool)

(assert (=> b!606176 m!582523))

(declare-fun m!582525 () Bool)

(assert (=> b!606176 m!582525))

(assert (=> b!606176 m!582481))

(declare-fun m!582527 () Bool)

(assert (=> b!606176 m!582527))

(declare-fun m!582529 () Bool)

(assert (=> b!606176 m!582529))

(declare-fun m!582531 () Bool)

(assert (=> b!606189 m!582531))

(declare-fun m!582533 () Bool)

(assert (=> b!606179 m!582533))

(assert (=> b!606181 m!582481))

(assert (=> b!606181 m!582481))

(declare-fun m!582535 () Bool)

(assert (=> b!606181 m!582535))

(declare-fun m!582537 () Bool)

(assert (=> b!606173 m!582537))

(declare-fun m!582539 () Bool)

(assert (=> b!606185 m!582539))

(assert (=> b!606185 m!582481))

(assert (=> b!606185 m!582487))

(declare-fun m!582541 () Bool)

(assert (=> b!606185 m!582541))

(declare-fun m!582543 () Bool)

(assert (=> b!606185 m!582543))

(declare-fun m!582545 () Bool)

(assert (=> b!606185 m!582545))

(declare-fun m!582547 () Bool)

(assert (=> b!606185 m!582547))

(assert (=> b!606185 m!582481))

(declare-fun m!582549 () Bool)

(assert (=> b!606185 m!582549))

(check-sat (not b!606188) (not b!606173) (not b!606184) (not b!606176) (not b!606174) (not start!55422) (not b!606189) (not b!606185) (not b!606194) (not b!606171) (not b!606183) (not b!606181) (not b!606180) (not b!606191) (not b!606195) (not b!606172) (not b!606178))
(check-sat)
(get-model)

(declare-fun d!87687 () Bool)

(assert (=> d!87687 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18247 lt!276555)) (not (= (select (arr!17882 lt!276555) j!136) (select (arr!17882 a!2986) j!136))))))

(declare-fun lt!276655 () Unit!19296)

(declare-fun choose!21 (array!37260 (_ BitVec 64) (_ BitVec 32) List!11962) Unit!19296)

(assert (=> d!87687 (= lt!276655 (choose!21 lt!276555 (select (arr!17882 a!2986) j!136) j!136 Nil!11959))))

(assert (=> d!87687 (bvslt (size!18247 lt!276555) #b01111111111111111111111111111111)))

(assert (=> d!87687 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276555 (select (arr!17882 a!2986) j!136) j!136 Nil!11959) lt!276655)))

(declare-fun bs!18526 () Bool)

(assert (= bs!18526 d!87687))

(declare-fun m!582691 () Bool)

(assert (=> bs!18526 m!582691))

(assert (=> bs!18526 m!582481))

(declare-fun m!582693 () Bool)

(assert (=> bs!18526 m!582693))

(assert (=> b!606176 d!87687))

(declare-fun d!87689 () Bool)

(assert (=> d!87689 (arrayNoDuplicates!0 lt!276555 j!136 Nil!11959)))

(declare-fun lt!276658 () Unit!19296)

(declare-fun choose!39 (array!37260 (_ BitVec 32) (_ BitVec 32)) Unit!19296)

(assert (=> d!87689 (= lt!276658 (choose!39 lt!276555 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87689 (bvslt (size!18247 lt!276555) #b01111111111111111111111111111111)))

(assert (=> d!87689 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276555 #b00000000000000000000000000000000 j!136) lt!276658)))

(declare-fun bs!18527 () Bool)

(assert (= bs!18527 d!87689))

(assert (=> bs!18527 m!582517))

(declare-fun m!582695 () Bool)

(assert (=> bs!18527 m!582695))

(assert (=> b!606176 d!87689))

(declare-fun d!87691 () Bool)

(assert (=> d!87691 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276661 () Unit!19296)

(declare-fun choose!114 (array!37260 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19296)

(assert (=> d!87691 (= lt!276661 (choose!114 lt!276555 (select (arr!17882 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87691 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87691 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276555 (select (arr!17882 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276661)))

(declare-fun bs!18528 () Bool)

(assert (= bs!18528 d!87691))

(assert (=> bs!18528 m!582481))

(assert (=> bs!18528 m!582523))

(assert (=> bs!18528 m!582481))

(declare-fun m!582697 () Bool)

(assert (=> bs!18528 m!582697))

(assert (=> b!606176 d!87691))

(declare-fun d!87693 () Bool)

(declare-fun res!389593 () Bool)

(declare-fun e!347150 () Bool)

(assert (=> d!87693 (=> res!389593 e!347150)))

(assert (=> d!87693 (= res!389593 (= (select (arr!17882 lt!276555) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87693 (= (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347150)))

(declare-fun b!606357 () Bool)

(declare-fun e!347151 () Bool)

(assert (=> b!606357 (= e!347150 e!347151)))

(declare-fun res!389594 () Bool)

(assert (=> b!606357 (=> (not res!389594) (not e!347151))))

(assert (=> b!606357 (= res!389594 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18247 lt!276555)))))

(declare-fun b!606358 () Bool)

(assert (=> b!606358 (= e!347151 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87693 (not res!389593)) b!606357))

(assert (= (and b!606357 res!389594) b!606358))

(declare-fun m!582699 () Bool)

(assert (=> d!87693 m!582699))

(assert (=> b!606358 m!582481))

(declare-fun m!582701 () Bool)

(assert (=> b!606358 m!582701))

(assert (=> b!606176 d!87693))

(declare-fun b!606369 () Bool)

(declare-fun e!347160 () Bool)

(declare-fun e!347161 () Bool)

(assert (=> b!606369 (= e!347160 e!347161)))

(declare-fun c!68751 () Bool)

(assert (=> b!606369 (= c!68751 (validKeyInArray!0 (select (arr!17882 lt!276555) j!136)))))

(declare-fun bm!33061 () Bool)

(declare-fun call!33064 () Bool)

(assert (=> bm!33061 (= call!33064 (arrayNoDuplicates!0 lt!276555 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68751 (Cons!11958 (select (arr!17882 lt!276555) j!136) Nil!11959) Nil!11959)))))

(declare-fun b!606370 () Bool)

(declare-fun e!347163 () Bool)

(assert (=> b!606370 (= e!347163 (contains!2984 Nil!11959 (select (arr!17882 lt!276555) j!136)))))

(declare-fun b!606371 () Bool)

(declare-fun e!347162 () Bool)

(assert (=> b!606371 (= e!347162 e!347160)))

(declare-fun res!389602 () Bool)

(assert (=> b!606371 (=> (not res!389602) (not e!347160))))

(assert (=> b!606371 (= res!389602 (not e!347163))))

(declare-fun res!389603 () Bool)

(assert (=> b!606371 (=> (not res!389603) (not e!347163))))

(assert (=> b!606371 (= res!389603 (validKeyInArray!0 (select (arr!17882 lt!276555) j!136)))))

(declare-fun b!606372 () Bool)

(assert (=> b!606372 (= e!347161 call!33064)))

(declare-fun d!87695 () Bool)

(declare-fun res!389601 () Bool)

(assert (=> d!87695 (=> res!389601 e!347162)))

(assert (=> d!87695 (= res!389601 (bvsge j!136 (size!18247 lt!276555)))))

(assert (=> d!87695 (= (arrayNoDuplicates!0 lt!276555 j!136 Nil!11959) e!347162)))

(declare-fun b!606373 () Bool)

(assert (=> b!606373 (= e!347161 call!33064)))

(assert (= (and d!87695 (not res!389601)) b!606371))

(assert (= (and b!606371 res!389603) b!606370))

(assert (= (and b!606371 res!389602) b!606369))

(assert (= (and b!606369 c!68751) b!606373))

(assert (= (and b!606369 (not c!68751)) b!606372))

(assert (= (or b!606373 b!606372) bm!33061))

(assert (=> b!606369 m!582691))

(assert (=> b!606369 m!582691))

(declare-fun m!582703 () Bool)

(assert (=> b!606369 m!582703))

(assert (=> bm!33061 m!582691))

(declare-fun m!582705 () Bool)

(assert (=> bm!33061 m!582705))

(assert (=> b!606370 m!582691))

(assert (=> b!606370 m!582691))

(declare-fun m!582707 () Bool)

(assert (=> b!606370 m!582707))

(assert (=> b!606371 m!582691))

(assert (=> b!606371 m!582691))

(assert (=> b!606371 m!582703))

(assert (=> b!606176 d!87695))

(declare-fun d!87697 () Bool)

(declare-fun e!347166 () Bool)

(assert (=> d!87697 e!347166))

(declare-fun res!389606 () Bool)

(assert (=> d!87697 (=> (not res!389606) (not e!347166))))

(assert (=> d!87697 (= res!389606 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18247 a!2986))))))

(declare-fun lt!276664 () Unit!19296)

(declare-fun choose!41 (array!37260 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11962) Unit!19296)

(assert (=> d!87697 (= lt!276664 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11959))))

(assert (=> d!87697 (bvslt (size!18247 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87697 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11959) lt!276664)))

(declare-fun b!606376 () Bool)

(assert (=> b!606376 (= e!347166 (arrayNoDuplicates!0 (array!37261 (store (arr!17882 a!2986) i!1108 k0!1786) (size!18247 a!2986)) #b00000000000000000000000000000000 Nil!11959))))

(assert (= (and d!87697 res!389606) b!606376))

(declare-fun m!582709 () Bool)

(assert (=> d!87697 m!582709))

(assert (=> b!606376 m!582487))

(declare-fun m!582711 () Bool)

(assert (=> b!606376 m!582711))

(assert (=> b!606176 d!87697))

(declare-fun b!606377 () Bool)

(declare-fun e!347167 () Bool)

(declare-fun e!347168 () Bool)

(assert (=> b!606377 (= e!347167 e!347168)))

(declare-fun c!68752 () Bool)

(assert (=> b!606377 (= c!68752 (validKeyInArray!0 (select (arr!17882 lt!276555) #b00000000000000000000000000000000)))))

(declare-fun bm!33062 () Bool)

(declare-fun call!33065 () Bool)

(assert (=> bm!33062 (= call!33065 (arrayNoDuplicates!0 lt!276555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68752 (Cons!11958 (select (arr!17882 lt!276555) #b00000000000000000000000000000000) Nil!11959) Nil!11959)))))

(declare-fun b!606378 () Bool)

(declare-fun e!347170 () Bool)

(assert (=> b!606378 (= e!347170 (contains!2984 Nil!11959 (select (arr!17882 lt!276555) #b00000000000000000000000000000000)))))

(declare-fun b!606379 () Bool)

(declare-fun e!347169 () Bool)

(assert (=> b!606379 (= e!347169 e!347167)))

(declare-fun res!389608 () Bool)

(assert (=> b!606379 (=> (not res!389608) (not e!347167))))

(assert (=> b!606379 (= res!389608 (not e!347170))))

(declare-fun res!389609 () Bool)

(assert (=> b!606379 (=> (not res!389609) (not e!347170))))

(assert (=> b!606379 (= res!389609 (validKeyInArray!0 (select (arr!17882 lt!276555) #b00000000000000000000000000000000)))))

(declare-fun b!606380 () Bool)

(assert (=> b!606380 (= e!347168 call!33065)))

(declare-fun d!87699 () Bool)

(declare-fun res!389607 () Bool)

(assert (=> d!87699 (=> res!389607 e!347169)))

(assert (=> d!87699 (= res!389607 (bvsge #b00000000000000000000000000000000 (size!18247 lt!276555)))))

(assert (=> d!87699 (= (arrayNoDuplicates!0 lt!276555 #b00000000000000000000000000000000 Nil!11959) e!347169)))

(declare-fun b!606381 () Bool)

(assert (=> b!606381 (= e!347168 call!33065)))

(assert (= (and d!87699 (not res!389607)) b!606379))

(assert (= (and b!606379 res!389609) b!606378))

(assert (= (and b!606379 res!389608) b!606377))

(assert (= (and b!606377 c!68752) b!606381))

(assert (= (and b!606377 (not c!68752)) b!606380))

(assert (= (or b!606381 b!606380) bm!33062))

(declare-fun m!582713 () Bool)

(assert (=> b!606377 m!582713))

(assert (=> b!606377 m!582713))

(declare-fun m!582715 () Bool)

(assert (=> b!606377 m!582715))

(assert (=> bm!33062 m!582713))

(declare-fun m!582717 () Bool)

(assert (=> bm!33062 m!582717))

(assert (=> b!606378 m!582713))

(assert (=> b!606378 m!582713))

(declare-fun m!582719 () Bool)

(assert (=> b!606378 m!582719))

(assert (=> b!606379 m!582713))

(assert (=> b!606379 m!582713))

(assert (=> b!606379 m!582715))

(assert (=> b!606176 d!87699))

(declare-fun b!606394 () Bool)

(declare-fun e!347178 () SeekEntryResult!6319)

(declare-fun lt!276673 () SeekEntryResult!6319)

(assert (=> b!606394 (= e!347178 (MissingZero!6319 (index!27550 lt!276673)))))

(declare-fun d!87701 () Bool)

(declare-fun lt!276671 () SeekEntryResult!6319)

(get-info :version)

(assert (=> d!87701 (and (or ((_ is Undefined!6319) lt!276671) (not ((_ is Found!6319) lt!276671)) (and (bvsge (index!27549 lt!276671) #b00000000000000000000000000000000) (bvslt (index!27549 lt!276671) (size!18247 a!2986)))) (or ((_ is Undefined!6319) lt!276671) ((_ is Found!6319) lt!276671) (not ((_ is MissingZero!6319) lt!276671)) (and (bvsge (index!27548 lt!276671) #b00000000000000000000000000000000) (bvslt (index!27548 lt!276671) (size!18247 a!2986)))) (or ((_ is Undefined!6319) lt!276671) ((_ is Found!6319) lt!276671) ((_ is MissingZero!6319) lt!276671) (not ((_ is MissingVacant!6319) lt!276671)) (and (bvsge (index!27551 lt!276671) #b00000000000000000000000000000000) (bvslt (index!27551 lt!276671) (size!18247 a!2986)))) (or ((_ is Undefined!6319) lt!276671) (ite ((_ is Found!6319) lt!276671) (= (select (arr!17882 a!2986) (index!27549 lt!276671)) k0!1786) (ite ((_ is MissingZero!6319) lt!276671) (= (select (arr!17882 a!2986) (index!27548 lt!276671)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6319) lt!276671) (= (select (arr!17882 a!2986) (index!27551 lt!276671)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!347179 () SeekEntryResult!6319)

(assert (=> d!87701 (= lt!276671 e!347179)))

(declare-fun c!68760 () Bool)

(assert (=> d!87701 (= c!68760 (and ((_ is Intermediate!6319) lt!276673) (undefined!7131 lt!276673)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37260 (_ BitVec 32)) SeekEntryResult!6319)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87701 (= lt!276673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87701 (validMask!0 mask!3053)))

(assert (=> d!87701 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276671)))

(declare-fun b!606395 () Bool)

(declare-fun e!347177 () SeekEntryResult!6319)

(assert (=> b!606395 (= e!347179 e!347177)))

(declare-fun lt!276672 () (_ BitVec 64))

(assert (=> b!606395 (= lt!276672 (select (arr!17882 a!2986) (index!27550 lt!276673)))))

(declare-fun c!68759 () Bool)

(assert (=> b!606395 (= c!68759 (= lt!276672 k0!1786))))

(declare-fun b!606396 () Bool)

(assert (=> b!606396 (= e!347177 (Found!6319 (index!27550 lt!276673)))))

(declare-fun b!606397 () Bool)

(assert (=> b!606397 (= e!347178 (seekKeyOrZeroReturnVacant!0 (x!56366 lt!276673) (index!27550 lt!276673) (index!27550 lt!276673) k0!1786 a!2986 mask!3053))))

(declare-fun b!606398 () Bool)

(declare-fun c!68761 () Bool)

(assert (=> b!606398 (= c!68761 (= lt!276672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606398 (= e!347177 e!347178)))

(declare-fun b!606399 () Bool)

(assert (=> b!606399 (= e!347179 Undefined!6319)))

(assert (= (and d!87701 c!68760) b!606399))

(assert (= (and d!87701 (not c!68760)) b!606395))

(assert (= (and b!606395 c!68759) b!606396))

(assert (= (and b!606395 (not c!68759)) b!606398))

(assert (= (and b!606398 c!68761) b!606394))

(assert (= (and b!606398 (not c!68761)) b!606397))

(declare-fun m!582721 () Bool)

(assert (=> d!87701 m!582721))

(assert (=> d!87701 m!582721))

(declare-fun m!582723 () Bool)

(assert (=> d!87701 m!582723))

(declare-fun m!582725 () Bool)

(assert (=> d!87701 m!582725))

(declare-fun m!582727 () Bool)

(assert (=> d!87701 m!582727))

(assert (=> d!87701 m!582495))

(declare-fun m!582729 () Bool)

(assert (=> d!87701 m!582729))

(declare-fun m!582731 () Bool)

(assert (=> b!606395 m!582731))

(declare-fun m!582733 () Bool)

(assert (=> b!606397 m!582733))

(assert (=> b!606189 d!87701))

(declare-fun d!87703 () Bool)

(declare-fun res!389614 () Bool)

(declare-fun e!347184 () Bool)

(assert (=> d!87703 (=> res!389614 e!347184)))

(assert (=> d!87703 (= res!389614 ((_ is Nil!11959) Nil!11959))))

(assert (=> d!87703 (= (noDuplicate!311 Nil!11959) e!347184)))

(declare-fun b!606404 () Bool)

(declare-fun e!347185 () Bool)

(assert (=> b!606404 (= e!347184 e!347185)))

(declare-fun res!389615 () Bool)

(assert (=> b!606404 (=> (not res!389615) (not e!347185))))

(assert (=> b!606404 (= res!389615 (not (contains!2984 (t!18181 Nil!11959) (h!13003 Nil!11959))))))

(declare-fun b!606405 () Bool)

(assert (=> b!606405 (= e!347185 (noDuplicate!311 (t!18181 Nil!11959)))))

(assert (= (and d!87703 (not res!389614)) b!606404))

(assert (= (and b!606404 res!389615) b!606405))

(declare-fun m!582735 () Bool)

(assert (=> b!606404 m!582735))

(declare-fun m!582737 () Bool)

(assert (=> b!606405 m!582737))

(assert (=> b!606178 d!87703))

(declare-fun d!87705 () Bool)

(assert (=> d!87705 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606188 d!87705))

(declare-fun d!87707 () Bool)

(assert (=> d!87707 (= (validKeyInArray!0 (select (arr!17882 a!2986) j!136)) (and (not (= (select (arr!17882 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17882 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606181 d!87707))

(declare-fun d!87709 () Bool)

(declare-fun lt!276676 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!236 (List!11962) (InoxSet (_ BitVec 64)))

(assert (=> d!87709 (= lt!276676 (select (content!236 Nil!11959) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347191 () Bool)

(assert (=> d!87709 (= lt!276676 e!347191)))

(declare-fun res!389620 () Bool)

(assert (=> d!87709 (=> (not res!389620) (not e!347191))))

(assert (=> d!87709 (= res!389620 ((_ is Cons!11958) Nil!11959))))

(assert (=> d!87709 (= (contains!2984 Nil!11959 #b0000000000000000000000000000000000000000000000000000000000000000) lt!276676)))

(declare-fun b!606410 () Bool)

(declare-fun e!347190 () Bool)

(assert (=> b!606410 (= e!347191 e!347190)))

(declare-fun res!389621 () Bool)

(assert (=> b!606410 (=> res!389621 e!347190)))

(assert (=> b!606410 (= res!389621 (= (h!13003 Nil!11959) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606411 () Bool)

(assert (=> b!606411 (= e!347190 (contains!2984 (t!18181 Nil!11959) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87709 res!389620) b!606410))

(assert (= (and b!606410 (not res!389621)) b!606411))

(declare-fun m!582739 () Bool)

(assert (=> d!87709 m!582739))

(declare-fun m!582741 () Bool)

(assert (=> d!87709 m!582741))

(declare-fun m!582743 () Bool)

(assert (=> b!606411 m!582743))

(assert (=> b!606191 d!87709))

(declare-fun d!87711 () Bool)

(declare-fun res!389622 () Bool)

(declare-fun e!347192 () Bool)

(assert (=> d!87711 (=> res!389622 e!347192)))

(assert (=> d!87711 (= res!389622 (= (select (arr!17882 lt!276555) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87711 (= (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!347192)))

(declare-fun b!606412 () Bool)

(declare-fun e!347193 () Bool)

(assert (=> b!606412 (= e!347192 e!347193)))

(declare-fun res!389623 () Bool)

(assert (=> b!606412 (=> (not res!389623) (not e!347193))))

(assert (=> b!606412 (= res!389623 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18247 lt!276555)))))

(declare-fun b!606413 () Bool)

(assert (=> b!606413 (= e!347193 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87711 (not res!389622)) b!606412))

(assert (= (and b!606412 res!389623) b!606413))

(declare-fun m!582745 () Bool)

(assert (=> d!87711 m!582745))

(assert (=> b!606413 m!582481))

(declare-fun m!582747 () Bool)

(assert (=> b!606413 m!582747))

(assert (=> b!606180 d!87711))

(declare-fun d!87715 () Bool)

(assert (=> d!87715 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276677 () Unit!19296)

(assert (=> d!87715 (= lt!276677 (choose!114 lt!276555 (select (arr!17882 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87715 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87715 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276555 (select (arr!17882 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276677)))

(declare-fun bs!18529 () Bool)

(assert (= bs!18529 d!87715))

(assert (=> bs!18529 m!582481))

(assert (=> bs!18529 m!582505))

(assert (=> bs!18529 m!582481))

(declare-fun m!582749 () Bool)

(assert (=> bs!18529 m!582749))

(assert (=> b!606180 d!87715))

(declare-fun d!87717 () Bool)

(declare-fun res!389624 () Bool)

(declare-fun e!347194 () Bool)

(assert (=> d!87717 (=> res!389624 e!347194)))

(assert (=> d!87717 (= res!389624 (= (select (arr!17882 lt!276555) j!136) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87717 (= (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) j!136) e!347194)))

(declare-fun b!606414 () Bool)

(declare-fun e!347195 () Bool)

(assert (=> b!606414 (= e!347194 e!347195)))

(declare-fun res!389625 () Bool)

(assert (=> b!606414 (=> (not res!389625) (not e!347195))))

(assert (=> b!606414 (= res!389625 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18247 lt!276555)))))

(declare-fun b!606415 () Bool)

(assert (=> b!606415 (= e!347195 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87717 (not res!389624)) b!606414))

(assert (= (and b!606414 res!389625) b!606415))

(assert (=> d!87717 m!582691))

(assert (=> b!606415 m!582481))

(declare-fun m!582751 () Bool)

(assert (=> b!606415 m!582751))

(assert (=> b!606180 d!87717))

(declare-fun b!606436 () Bool)

(declare-fun e!347216 () Bool)

(declare-fun e!347214 () Bool)

(assert (=> b!606436 (= e!347216 e!347214)))

(declare-fun c!68764 () Bool)

(assert (=> b!606436 (= c!68764 (validKeyInArray!0 (select (arr!17882 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33065 () Bool)

(declare-fun call!33068 () Bool)

(assert (=> bm!33065 (= call!33068 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!606437 () Bool)

(declare-fun e!347215 () Bool)

(assert (=> b!606437 (= e!347215 call!33068)))

(declare-fun b!606438 () Bool)

(assert (=> b!606438 (= e!347214 call!33068)))

(declare-fun d!87721 () Bool)

(declare-fun res!389643 () Bool)

(assert (=> d!87721 (=> res!389643 e!347216)))

(assert (=> d!87721 (= res!389643 (bvsge #b00000000000000000000000000000000 (size!18247 a!2986)))))

(assert (=> d!87721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!347216)))

(declare-fun b!606439 () Bool)

(assert (=> b!606439 (= e!347214 e!347215)))

(declare-fun lt!276690 () (_ BitVec 64))

(assert (=> b!606439 (= lt!276690 (select (arr!17882 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276689 () Unit!19296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37260 (_ BitVec 64) (_ BitVec 32)) Unit!19296)

(assert (=> b!606439 (= lt!276689 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276690 #b00000000000000000000000000000000))))

(assert (=> b!606439 (arrayContainsKey!0 a!2986 lt!276690 #b00000000000000000000000000000000)))

(declare-fun lt!276691 () Unit!19296)

(assert (=> b!606439 (= lt!276691 lt!276689)))

(declare-fun res!389642 () Bool)

(assert (=> b!606439 (= res!389642 (= (seekEntryOrOpen!0 (select (arr!17882 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6319 #b00000000000000000000000000000000)))))

(assert (=> b!606439 (=> (not res!389642) (not e!347215))))

(assert (= (and d!87721 (not res!389643)) b!606436))

(assert (= (and b!606436 c!68764) b!606439))

(assert (= (and b!606436 (not c!68764)) b!606438))

(assert (= (and b!606439 res!389642) b!606437))

(assert (= (or b!606437 b!606438) bm!33065))

(declare-fun m!582765 () Bool)

(assert (=> b!606436 m!582765))

(assert (=> b!606436 m!582765))

(declare-fun m!582767 () Bool)

(assert (=> b!606436 m!582767))

(declare-fun m!582769 () Bool)

(assert (=> bm!33065 m!582769))

(assert (=> b!606439 m!582765))

(declare-fun m!582771 () Bool)

(assert (=> b!606439 m!582771))

(declare-fun m!582773 () Bool)

(assert (=> b!606439 m!582773))

(assert (=> b!606439 m!582765))

(declare-fun m!582775 () Bool)

(assert (=> b!606439 m!582775))

(assert (=> b!606171 d!87721))

(declare-fun d!87729 () Bool)

(assert (=> d!87729 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55422 d!87729))

(declare-fun d!87743 () Bool)

(assert (=> d!87743 (= (array_inv!13765 a!2986) (bvsge (size!18247 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55422 d!87743))

(declare-fun d!87745 () Bool)

(declare-fun lt!276712 () Bool)

(assert (=> d!87745 (= lt!276712 (select (content!236 Nil!11959) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347241 () Bool)

(assert (=> d!87745 (= lt!276712 e!347241)))

(declare-fun res!389650 () Bool)

(assert (=> d!87745 (=> (not res!389650) (not e!347241))))

(assert (=> d!87745 (= res!389650 ((_ is Cons!11958) Nil!11959))))

(assert (=> d!87745 (= (contains!2984 Nil!11959 #b1000000000000000000000000000000000000000000000000000000000000000) lt!276712)))

(declare-fun b!606480 () Bool)

(declare-fun e!347240 () Bool)

(assert (=> b!606480 (= e!347241 e!347240)))

(declare-fun res!389651 () Bool)

(assert (=> b!606480 (=> res!389651 e!347240)))

(assert (=> b!606480 (= res!389651 (= (h!13003 Nil!11959) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606481 () Bool)

(assert (=> b!606481 (= e!347240 (contains!2984 (t!18181 Nil!11959) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87745 res!389650) b!606480))

(assert (= (and b!606480 (not res!389651)) b!606481))

(assert (=> d!87745 m!582739))

(declare-fun m!582811 () Bool)

(assert (=> d!87745 m!582811))

(declare-fun m!582813 () Bool)

(assert (=> b!606481 m!582813))

(assert (=> b!606173 d!87745))

(assert (=> b!606194 d!87717))

(declare-fun d!87747 () Bool)

(declare-fun res!389652 () Bool)

(declare-fun e!347242 () Bool)

(assert (=> d!87747 (=> res!389652 e!347242)))

(assert (=> d!87747 (= res!389652 (= (select (arr!17882 lt!276555) index!984) (select (arr!17882 a!2986) j!136)))))

(assert (=> d!87747 (= (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) index!984) e!347242)))

(declare-fun b!606482 () Bool)

(declare-fun e!347243 () Bool)

(assert (=> b!606482 (= e!347242 e!347243)))

(declare-fun res!389653 () Bool)

(assert (=> b!606482 (=> (not res!389653) (not e!347243))))

(assert (=> b!606482 (= res!389653 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18247 lt!276555)))))

(declare-fun b!606483 () Bool)

(assert (=> b!606483 (= e!347243 (arrayContainsKey!0 lt!276555 (select (arr!17882 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87747 (not res!389652)) b!606482))

(assert (= (and b!606482 res!389653) b!606483))

(declare-fun m!582815 () Bool)

(assert (=> d!87747 m!582815))

(assert (=> b!606483 m!582481))

(declare-fun m!582817 () Bool)

(assert (=> b!606483 m!582817))

(assert (=> b!606183 d!87747))

(declare-fun b!606489 () Bool)

(declare-fun e!347248 () Bool)

(declare-fun e!347249 () Bool)

(assert (=> b!606489 (= e!347248 e!347249)))

(declare-fun c!68783 () Bool)

(assert (=> b!606489 (= c!68783 (validKeyInArray!0 (select (arr!17882 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33069 () Bool)

(declare-fun call!33072 () Bool)

(assert (=> bm!33069 (= call!33072 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68783 (Cons!11958 (select (arr!17882 a!2986) #b00000000000000000000000000000000) Nil!11959) Nil!11959)))))

(declare-fun b!606490 () Bool)

(declare-fun e!347251 () Bool)

(assert (=> b!606490 (= e!347251 (contains!2984 Nil!11959 (select (arr!17882 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606491 () Bool)

(declare-fun e!347250 () Bool)

(assert (=> b!606491 (= e!347250 e!347248)))

(declare-fun res!389658 () Bool)

(assert (=> b!606491 (=> (not res!389658) (not e!347248))))

(assert (=> b!606491 (= res!389658 (not e!347251))))

(declare-fun res!389659 () Bool)

(assert (=> b!606491 (=> (not res!389659) (not e!347251))))

(assert (=> b!606491 (= res!389659 (validKeyInArray!0 (select (arr!17882 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606492 () Bool)

(assert (=> b!606492 (= e!347249 call!33072)))

(declare-fun d!87749 () Bool)

(declare-fun res!389657 () Bool)

(assert (=> d!87749 (=> res!389657 e!347250)))

(assert (=> d!87749 (= res!389657 (bvsge #b00000000000000000000000000000000 (size!18247 a!2986)))))

(assert (=> d!87749 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11959) e!347250)))

(declare-fun b!606493 () Bool)

(assert (=> b!606493 (= e!347249 call!33072)))

(assert (= (and d!87749 (not res!389657)) b!606491))

(assert (= (and b!606491 res!389659) b!606490))

(assert (= (and b!606491 res!389658) b!606489))

(assert (= (and b!606489 c!68783) b!606493))

(assert (= (and b!606489 (not c!68783)) b!606492))

(assert (= (or b!606493 b!606492) bm!33069))

(assert (=> b!606489 m!582765))

(assert (=> b!606489 m!582765))

(assert (=> b!606489 m!582767))

(assert (=> bm!33069 m!582765))

(declare-fun m!582825 () Bool)

(assert (=> bm!33069 m!582825))

(assert (=> b!606490 m!582765))

(assert (=> b!606490 m!582765))

(declare-fun m!582827 () Bool)

(assert (=> b!606490 m!582827))

(assert (=> b!606491 m!582765))

(assert (=> b!606491 m!582765))

(assert (=> b!606491 m!582767))

(assert (=> b!606172 d!87749))

(declare-fun d!87753 () Bool)

(declare-fun e!347276 () Bool)

(assert (=> d!87753 e!347276))

(declare-fun res!389682 () Bool)

(assert (=> d!87753 (=> (not res!389682) (not e!347276))))

(assert (=> d!87753 (= res!389682 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18247 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18247 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18247 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18247 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18247 a!2986))))))

(declare-fun lt!276721 () Unit!19296)

(declare-fun choose!9 (array!37260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19296)

(assert (=> d!87753 (= lt!276721 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87753 (validMask!0 mask!3053)))

(assert (=> d!87753 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 mask!3053) lt!276721)))

(declare-fun b!606520 () Bool)

(assert (=> b!606520 (= e!347276 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 (select (store (arr!17882 a!2986) i!1108 k0!1786) j!136) (array!37261 (store (arr!17882 a!2986) i!1108 k0!1786) (size!18247 a!2986)) mask!3053)))))

(assert (= (and d!87753 res!389682) b!606520))

(declare-fun m!582861 () Bool)

(assert (=> d!87753 m!582861))

(assert (=> d!87753 m!582495))

(assert (=> b!606520 m!582487))

(assert (=> b!606520 m!582539))

(assert (=> b!606520 m!582539))

(declare-fun m!582863 () Bool)

(assert (=> b!606520 m!582863))

(assert (=> b!606520 m!582481))

(assert (=> b!606520 m!582481))

(assert (=> b!606520 m!582549))

(assert (=> b!606185 d!87753))

(declare-fun b!606580 () Bool)

(declare-fun e!347323 () SeekEntryResult!6319)

(assert (=> b!606580 (= e!347323 Undefined!6319)))

(declare-fun b!606581 () Bool)

(declare-fun e!347324 () SeekEntryResult!6319)

(assert (=> b!606581 (= e!347324 (Found!6319 lt!276547))))

(declare-fun b!606582 () Bool)

(declare-fun c!68800 () Bool)

(declare-fun lt!276742 () (_ BitVec 64))

(assert (=> b!606582 (= c!68800 (= lt!276742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347322 () SeekEntryResult!6319)

(assert (=> b!606582 (= e!347324 e!347322)))

(declare-fun lt!276743 () SeekEntryResult!6319)

(declare-fun d!87767 () Bool)

(assert (=> d!87767 (and (or ((_ is Undefined!6319) lt!276743) (not ((_ is Found!6319) lt!276743)) (and (bvsge (index!27549 lt!276743) #b00000000000000000000000000000000) (bvslt (index!27549 lt!276743) (size!18247 a!2986)))) (or ((_ is Undefined!6319) lt!276743) ((_ is Found!6319) lt!276743) (not ((_ is MissingVacant!6319) lt!276743)) (not (= (index!27551 lt!276743) vacantSpotIndex!68)) (and (bvsge (index!27551 lt!276743) #b00000000000000000000000000000000) (bvslt (index!27551 lt!276743) (size!18247 a!2986)))) (or ((_ is Undefined!6319) lt!276743) (ite ((_ is Found!6319) lt!276743) (= (select (arr!17882 a!2986) (index!27549 lt!276743)) (select (arr!17882 a!2986) j!136)) (and ((_ is MissingVacant!6319) lt!276743) (= (index!27551 lt!276743) vacantSpotIndex!68) (= (select (arr!17882 a!2986) (index!27551 lt!276743)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87767 (= lt!276743 e!347323)))

(declare-fun c!68801 () Bool)

(assert (=> d!87767 (= c!68801 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87767 (= lt!276742 (select (arr!17882 a!2986) lt!276547))))

(assert (=> d!87767 (validMask!0 mask!3053)))

(assert (=> d!87767 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053) lt!276743)))

(declare-fun b!606583 () Bool)

(assert (=> b!606583 (= e!347322 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun b!606584 () Bool)

(assert (=> b!606584 (= e!347323 e!347324)))

(declare-fun c!68802 () Bool)

(assert (=> b!606584 (= c!68802 (= lt!276742 (select (arr!17882 a!2986) j!136)))))

(declare-fun b!606585 () Bool)

(assert (=> b!606585 (= e!347322 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276547 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87767 c!68801) b!606580))

(assert (= (and d!87767 (not c!68801)) b!606584))

(assert (= (and b!606584 c!68802) b!606581))

(assert (= (and b!606584 (not c!68802)) b!606582))

(assert (= (and b!606582 c!68800) b!606583))

(assert (= (and b!606582 (not c!68800)) b!606585))

(declare-fun m!582913 () Bool)

(assert (=> d!87767 m!582913))

(declare-fun m!582915 () Bool)

(assert (=> d!87767 m!582915))

(declare-fun m!582917 () Bool)

(assert (=> d!87767 m!582917))

(assert (=> d!87767 m!582495))

(declare-fun m!582919 () Bool)

(assert (=> b!606585 m!582919))

(assert (=> b!606585 m!582919))

(assert (=> b!606585 m!582481))

(declare-fun m!582921 () Bool)

(assert (=> b!606585 m!582921))

(assert (=> b!606185 d!87767))

(declare-fun d!87791 () Bool)

(declare-fun lt!276749 () (_ BitVec 32))

(assert (=> d!87791 (and (bvsge lt!276749 #b00000000000000000000000000000000) (bvslt lt!276749 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87791 (= lt!276749 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87791 (validMask!0 mask!3053)))

(assert (=> d!87791 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276749)))

(declare-fun bs!18538 () Bool)

(assert (= bs!18538 d!87791))

(declare-fun m!582925 () Bool)

(assert (=> bs!18538 m!582925))

(assert (=> bs!18538 m!582495))

(assert (=> b!606185 d!87791))

(declare-fun b!606586 () Bool)

(declare-fun e!347326 () SeekEntryResult!6319)

(assert (=> b!606586 (= e!347326 Undefined!6319)))

(declare-fun b!606587 () Bool)

(declare-fun e!347327 () SeekEntryResult!6319)

(assert (=> b!606587 (= e!347327 (Found!6319 lt!276547))))

(declare-fun b!606588 () Bool)

(declare-fun c!68803 () Bool)

(declare-fun lt!276750 () (_ BitVec 64))

(assert (=> b!606588 (= c!68803 (= lt!276750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347325 () SeekEntryResult!6319)

(assert (=> b!606588 (= e!347327 e!347325)))

(declare-fun lt!276751 () SeekEntryResult!6319)

(declare-fun d!87797 () Bool)

(assert (=> d!87797 (and (or ((_ is Undefined!6319) lt!276751) (not ((_ is Found!6319) lt!276751)) (and (bvsge (index!27549 lt!276751) #b00000000000000000000000000000000) (bvslt (index!27549 lt!276751) (size!18247 lt!276555)))) (or ((_ is Undefined!6319) lt!276751) ((_ is Found!6319) lt!276751) (not ((_ is MissingVacant!6319) lt!276751)) (not (= (index!27551 lt!276751) vacantSpotIndex!68)) (and (bvsge (index!27551 lt!276751) #b00000000000000000000000000000000) (bvslt (index!27551 lt!276751) (size!18247 lt!276555)))) (or ((_ is Undefined!6319) lt!276751) (ite ((_ is Found!6319) lt!276751) (= (select (arr!17882 lt!276555) (index!27549 lt!276751)) lt!276543) (and ((_ is MissingVacant!6319) lt!276751) (= (index!27551 lt!276751) vacantSpotIndex!68) (= (select (arr!17882 lt!276555) (index!27551 lt!276751)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87797 (= lt!276751 e!347326)))

(declare-fun c!68804 () Bool)

(assert (=> d!87797 (= c!68804 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87797 (= lt!276750 (select (arr!17882 lt!276555) lt!276547))))

(assert (=> d!87797 (validMask!0 mask!3053)))

(assert (=> d!87797 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276547 vacantSpotIndex!68 lt!276543 lt!276555 mask!3053) lt!276751)))

(declare-fun b!606589 () Bool)

(assert (=> b!606589 (= e!347325 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun b!606590 () Bool)

(assert (=> b!606590 (= e!347326 e!347327)))

(declare-fun c!68805 () Bool)

(assert (=> b!606590 (= c!68805 (= lt!276750 lt!276543))))

(declare-fun b!606591 () Bool)

(assert (=> b!606591 (= e!347325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276547 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276543 lt!276555 mask!3053))))

(assert (= (and d!87797 c!68804) b!606586))

(assert (= (and d!87797 (not c!68804)) b!606590))

(assert (= (and b!606590 c!68805) b!606587))

(assert (= (and b!606590 (not c!68805)) b!606588))

(assert (= (and b!606588 c!68803) b!606589))

(assert (= (and b!606588 (not c!68803)) b!606591))

(declare-fun m!582927 () Bool)

(assert (=> d!87797 m!582927))

(declare-fun m!582929 () Bool)

(assert (=> d!87797 m!582929))

(declare-fun m!582931 () Bool)

(assert (=> d!87797 m!582931))

(assert (=> d!87797 m!582495))

(assert (=> b!606591 m!582919))

(assert (=> b!606591 m!582919))

(declare-fun m!582933 () Bool)

(assert (=> b!606591 m!582933))

(assert (=> b!606185 d!87797))

(declare-fun b!606592 () Bool)

(declare-fun e!347329 () SeekEntryResult!6319)

(assert (=> b!606592 (= e!347329 Undefined!6319)))

(declare-fun b!606593 () Bool)

(declare-fun e!347330 () SeekEntryResult!6319)

(assert (=> b!606593 (= e!347330 (Found!6319 index!984))))

(declare-fun b!606594 () Bool)

(declare-fun c!68806 () Bool)

(declare-fun lt!276752 () (_ BitVec 64))

(assert (=> b!606594 (= c!68806 (= lt!276752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347328 () SeekEntryResult!6319)

(assert (=> b!606594 (= e!347330 e!347328)))

(declare-fun d!87799 () Bool)

(declare-fun lt!276753 () SeekEntryResult!6319)

(assert (=> d!87799 (and (or ((_ is Undefined!6319) lt!276753) (not ((_ is Found!6319) lt!276753)) (and (bvsge (index!27549 lt!276753) #b00000000000000000000000000000000) (bvslt (index!27549 lt!276753) (size!18247 lt!276555)))) (or ((_ is Undefined!6319) lt!276753) ((_ is Found!6319) lt!276753) (not ((_ is MissingVacant!6319) lt!276753)) (not (= (index!27551 lt!276753) vacantSpotIndex!68)) (and (bvsge (index!27551 lt!276753) #b00000000000000000000000000000000) (bvslt (index!27551 lt!276753) (size!18247 lt!276555)))) (or ((_ is Undefined!6319) lt!276753) (ite ((_ is Found!6319) lt!276753) (= (select (arr!17882 lt!276555) (index!27549 lt!276753)) lt!276543) (and ((_ is MissingVacant!6319) lt!276753) (= (index!27551 lt!276753) vacantSpotIndex!68) (= (select (arr!17882 lt!276555) (index!27551 lt!276753)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87799 (= lt!276753 e!347329)))

(declare-fun c!68807 () Bool)

(assert (=> d!87799 (= c!68807 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87799 (= lt!276752 (select (arr!17882 lt!276555) index!984))))

(assert (=> d!87799 (validMask!0 mask!3053)))

(assert (=> d!87799 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276543 lt!276555 mask!3053) lt!276753)))

(declare-fun b!606595 () Bool)

(assert (=> b!606595 (= e!347328 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun b!606596 () Bool)

(assert (=> b!606596 (= e!347329 e!347330)))

(declare-fun c!68808 () Bool)

(assert (=> b!606596 (= c!68808 (= lt!276752 lt!276543))))

(declare-fun b!606597 () Bool)

(assert (=> b!606597 (= e!347328 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276543 lt!276555 mask!3053))))

(assert (= (and d!87799 c!68807) b!606592))

(assert (= (and d!87799 (not c!68807)) b!606596))

(assert (= (and b!606596 c!68808) b!606593))

(assert (= (and b!606596 (not c!68808)) b!606594))

(assert (= (and b!606594 c!68806) b!606595))

(assert (= (and b!606594 (not c!68806)) b!606597))

(declare-fun m!582935 () Bool)

(assert (=> d!87799 m!582935))

(declare-fun m!582937 () Bool)

(assert (=> d!87799 m!582937))

(assert (=> d!87799 m!582815))

(assert (=> d!87799 m!582495))

(assert (=> b!606597 m!582547))

(assert (=> b!606597 m!582547))

(declare-fun m!582939 () Bool)

(assert (=> b!606597 m!582939))

(assert (=> b!606185 d!87799))

(declare-fun d!87801 () Bool)

(declare-fun res!389714 () Bool)

(declare-fun e!347331 () Bool)

(assert (=> d!87801 (=> res!389714 e!347331)))

(assert (=> d!87801 (= res!389714 (= (select (arr!17882 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87801 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!347331)))

(declare-fun b!606598 () Bool)

(declare-fun e!347332 () Bool)

(assert (=> b!606598 (= e!347331 e!347332)))

(declare-fun res!389715 () Bool)

(assert (=> b!606598 (=> (not res!389715) (not e!347332))))

(assert (=> b!606598 (= res!389715 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18247 a!2986)))))

(declare-fun b!606599 () Bool)

(assert (=> b!606599 (= e!347332 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87801 (not res!389714)) b!606598))

(assert (= (and b!606598 res!389715) b!606599))

(assert (=> d!87801 m!582765))

(declare-fun m!582941 () Bool)

(assert (=> b!606599 m!582941))

(assert (=> b!606174 d!87801))

(declare-fun b!606602 () Bool)

(declare-fun e!347336 () SeekEntryResult!6319)

(assert (=> b!606602 (= e!347336 Undefined!6319)))

(declare-fun b!606603 () Bool)

(declare-fun e!347337 () SeekEntryResult!6319)

(assert (=> b!606603 (= e!347337 (Found!6319 index!984))))

(declare-fun b!606604 () Bool)

(declare-fun c!68809 () Bool)

(declare-fun lt!276756 () (_ BitVec 64))

(assert (=> b!606604 (= c!68809 (= lt!276756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347335 () SeekEntryResult!6319)

(assert (=> b!606604 (= e!347337 e!347335)))

(declare-fun lt!276757 () SeekEntryResult!6319)

(declare-fun d!87803 () Bool)

(assert (=> d!87803 (and (or ((_ is Undefined!6319) lt!276757) (not ((_ is Found!6319) lt!276757)) (and (bvsge (index!27549 lt!276757) #b00000000000000000000000000000000) (bvslt (index!27549 lt!276757) (size!18247 a!2986)))) (or ((_ is Undefined!6319) lt!276757) ((_ is Found!6319) lt!276757) (not ((_ is MissingVacant!6319) lt!276757)) (not (= (index!27551 lt!276757) vacantSpotIndex!68)) (and (bvsge (index!27551 lt!276757) #b00000000000000000000000000000000) (bvslt (index!27551 lt!276757) (size!18247 a!2986)))) (or ((_ is Undefined!6319) lt!276757) (ite ((_ is Found!6319) lt!276757) (= (select (arr!17882 a!2986) (index!27549 lt!276757)) (select (arr!17882 a!2986) j!136)) (and ((_ is MissingVacant!6319) lt!276757) (= (index!27551 lt!276757) vacantSpotIndex!68) (= (select (arr!17882 a!2986) (index!27551 lt!276757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87803 (= lt!276757 e!347336)))

(declare-fun c!68810 () Bool)

(assert (=> d!87803 (= c!68810 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87803 (= lt!276756 (select (arr!17882 a!2986) index!984))))

(assert (=> d!87803 (validMask!0 mask!3053)))

(assert (=> d!87803 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053) lt!276757)))

(declare-fun b!606605 () Bool)

(assert (=> b!606605 (= e!347335 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun b!606606 () Bool)

(assert (=> b!606606 (= e!347336 e!347337)))

(declare-fun c!68811 () Bool)

(assert (=> b!606606 (= c!68811 (= lt!276756 (select (arr!17882 a!2986) j!136)))))

(declare-fun b!606607 () Bool)

(assert (=> b!606607 (= e!347335 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17882 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87803 c!68810) b!606602))

(assert (= (and d!87803 (not c!68810)) b!606606))

(assert (= (and b!606606 c!68811) b!606603))

(assert (= (and b!606606 (not c!68811)) b!606604))

(assert (= (and b!606604 c!68809) b!606605))

(assert (= (and b!606604 (not c!68809)) b!606607))

(declare-fun m!582943 () Bool)

(assert (=> d!87803 m!582943))

(declare-fun m!582945 () Bool)

(assert (=> d!87803 m!582945))

(assert (=> d!87803 m!582511))

(assert (=> d!87803 m!582495))

(assert (=> b!606607 m!582547))

(assert (=> b!606607 m!582547))

(assert (=> b!606607 m!582481))

(declare-fun m!582947 () Bool)

(assert (=> b!606607 m!582947))

(assert (=> b!606195 d!87803))

(assert (=> b!606184 d!87747))

(check-sat (not b!606378) (not b!606377) (not b!606369) (not b!606411) (not b!606597) (not b!606415) (not b!606358) (not b!606370) (not d!87753) (not b!606490) (not b!606607) (not b!606599) (not b!606436) (not bm!33061) (not b!606413) (not d!87687) (not b!606483) (not b!606491) (not d!87745) (not d!87691) (not d!87697) (not bm!33062) (not b!606520) (not bm!33069) (not d!87797) (not d!87791) (not b!606379) (not d!87767) (not b!606371) (not b!606397) (not b!606481) (not d!87715) (not bm!33065) (not d!87803) (not b!606489) (not b!606591) (not b!606405) (not b!606439) (not d!87799) (not d!87701) (not b!606585) (not d!87709) (not d!87689) (not b!606376) (not b!606404))
(check-sat)
