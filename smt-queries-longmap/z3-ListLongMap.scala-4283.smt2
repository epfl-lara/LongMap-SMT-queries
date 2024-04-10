; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59608 () Bool)

(assert start!59608)

(declare-fun b!659163 () Bool)

(declare-fun res!427485 () Bool)

(declare-fun e!378690 () Bool)

(assert (=> b!659163 (=> (not res!427485) (not e!378690))))

(declare-datatypes ((array!38766 0))(
  ( (array!38767 (arr!18580 (Array (_ BitVec 32) (_ BitVec 64))) (size!18944 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38766)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!659163 (= res!427485 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!659164 () Bool)

(declare-fun e!378683 () Bool)

(declare-datatypes ((SeekEntryResult!7020 0))(
  ( (MissingZero!7020 (index!30445 (_ BitVec 32))) (Found!7020 (index!30446 (_ BitVec 32))) (Intermediate!7020 (undefined!7832 Bool) (index!30447 (_ BitVec 32)) (x!59231 (_ BitVec 32))) (Undefined!7020) (MissingVacant!7020 (index!30448 (_ BitVec 32))) )
))
(declare-fun lt!308470 () SeekEntryResult!7020)

(declare-fun lt!308487 () SeekEntryResult!7020)

(assert (=> b!659164 (= e!378683 (= lt!308470 lt!308487))))

(declare-fun b!659165 () Bool)

(declare-datatypes ((Unit!22954 0))(
  ( (Unit!22955) )
))
(declare-fun e!378684 () Unit!22954)

(declare-fun Unit!22956 () Unit!22954)

(assert (=> b!659165 (= e!378684 Unit!22956)))

(declare-fun b!659166 () Bool)

(declare-fun res!427486 () Bool)

(declare-fun e!378681 () Bool)

(assert (=> b!659166 (=> (not res!427486) (not e!378681))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38766 (_ BitVec 32)) Bool)

(assert (=> b!659166 (= res!427486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!659167 () Bool)

(declare-fun res!427478 () Bool)

(assert (=> b!659167 (=> (not res!427478) (not e!378681))))

(declare-datatypes ((List!12621 0))(
  ( (Nil!12618) (Cons!12617 (h!13662 (_ BitVec 64)) (t!18849 List!12621)) )
))
(declare-fun arrayNoDuplicates!0 (array!38766 (_ BitVec 32) List!12621) Bool)

(assert (=> b!659167 (= res!427478 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12618))))

(declare-fun b!659168 () Bool)

(declare-fun e!378687 () Unit!22954)

(declare-fun Unit!22957 () Unit!22954)

(assert (=> b!659168 (= e!378687 Unit!22957)))

(declare-fun b!659169 () Bool)

(declare-fun res!427487 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!659169 (= res!427487 (bvsge j!136 index!984))))

(declare-fun e!378688 () Bool)

(assert (=> b!659169 (=> res!427487 e!378688)))

(declare-fun e!378682 () Bool)

(assert (=> b!659169 (= e!378682 e!378688)))

(declare-fun b!659170 () Bool)

(declare-fun res!427479 () Bool)

(declare-fun lt!308479 () array!38766)

(assert (=> b!659170 (= res!427479 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) j!136))))

(declare-fun e!378680 () Bool)

(assert (=> b!659170 (=> (not res!427479) (not e!378680))))

(assert (=> b!659170 (= e!378688 e!378680)))

(declare-fun b!659171 () Bool)

(assert (=> b!659171 (= e!378690 e!378681)))

(declare-fun res!427490 () Bool)

(assert (=> b!659171 (=> (not res!427490) (not e!378681))))

(declare-fun lt!308480 () SeekEntryResult!7020)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!659171 (= res!427490 (or (= lt!308480 (MissingZero!7020 i!1108)) (= lt!308480 (MissingVacant!7020 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38766 (_ BitVec 32)) SeekEntryResult!7020)

(assert (=> b!659171 (= lt!308480 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!659172 () Bool)

(assert (=> b!659172 (= e!378680 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) index!984))))

(declare-fun b!659173 () Bool)

(declare-fun e!378678 () Unit!22954)

(declare-fun Unit!22958 () Unit!22954)

(assert (=> b!659173 (= e!378678 Unit!22958)))

(declare-fun b!659174 () Bool)

(declare-fun Unit!22959 () Unit!22954)

(assert (=> b!659174 (= e!378687 Unit!22959)))

(assert (=> b!659174 false))

(declare-fun b!659175 () Bool)

(assert (=> b!659175 false))

(declare-fun lt!308472 () Unit!22954)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38766 (_ BitVec 64) (_ BitVec 32) List!12621) Unit!22954)

(assert (=> b!659175 (= lt!308472 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308479 (select (arr!18580 a!2986) j!136) j!136 Nil!12618))))

(assert (=> b!659175 (arrayNoDuplicates!0 lt!308479 j!136 Nil!12618)))

(declare-fun lt!308488 () Unit!22954)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38766 (_ BitVec 32) (_ BitVec 32)) Unit!22954)

(assert (=> b!659175 (= lt!308488 (lemmaNoDuplicateFromThenFromBigger!0 lt!308479 #b00000000000000000000000000000000 j!136))))

(assert (=> b!659175 (arrayNoDuplicates!0 lt!308479 #b00000000000000000000000000000000 Nil!12618)))

(declare-fun lt!308485 () Unit!22954)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12621) Unit!22954)

(assert (=> b!659175 (= lt!308485 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12618))))

(assert (=> b!659175 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308483 () Unit!22954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22954)

(assert (=> b!659175 (= lt!308483 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308479 (select (arr!18580 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378686 () Unit!22954)

(declare-fun Unit!22960 () Unit!22954)

(assert (=> b!659175 (= e!378686 Unit!22960)))

(declare-fun b!659176 () Bool)

(declare-fun res!427476 () Bool)

(assert (=> b!659176 (=> (not res!427476) (not e!378690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!659176 (= res!427476 (validKeyInArray!0 k0!1786))))

(declare-fun b!659177 () Bool)

(assert (=> b!659177 false))

(declare-fun lt!308481 () Unit!22954)

(assert (=> b!659177 (= lt!308481 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308479 (select (arr!18580 a!2986) j!136) index!984 Nil!12618))))

(assert (=> b!659177 (arrayNoDuplicates!0 lt!308479 index!984 Nil!12618)))

(declare-fun lt!308471 () Unit!22954)

(assert (=> b!659177 (= lt!308471 (lemmaNoDuplicateFromThenFromBigger!0 lt!308479 #b00000000000000000000000000000000 index!984))))

(assert (=> b!659177 (arrayNoDuplicates!0 lt!308479 #b00000000000000000000000000000000 Nil!12618)))

(declare-fun lt!308469 () Unit!22954)

(assert (=> b!659177 (= lt!308469 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12618))))

(assert (=> b!659177 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308474 () Unit!22954)

(assert (=> b!659177 (= lt!308474 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308479 (select (arr!18580 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378689 () Bool)

(assert (=> b!659177 e!378689))

(declare-fun res!427480 () Bool)

(assert (=> b!659177 (=> (not res!427480) (not e!378689))))

(assert (=> b!659177 (= res!427480 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) j!136))))

(declare-fun Unit!22961 () Unit!22954)

(assert (=> b!659177 (= e!378684 Unit!22961)))

(declare-fun b!659178 () Bool)

(declare-fun res!427484 () Bool)

(assert (=> b!659178 (=> (not res!427484) (not e!378690))))

(assert (=> b!659178 (= res!427484 (validKeyInArray!0 (select (arr!18580 a!2986) j!136)))))

(declare-fun b!659179 () Bool)

(declare-fun e!378685 () Bool)

(assert (=> b!659179 (= e!378681 e!378685)))

(declare-fun res!427488 () Bool)

(assert (=> b!659179 (=> (not res!427488) (not e!378685))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!659179 (= res!427488 (= (select (store (arr!18580 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659179 (= lt!308479 (array!38767 (store (arr!18580 a!2986) i!1108 k0!1786) (size!18944 a!2986)))))

(declare-fun b!659180 () Bool)

(declare-fun Unit!22962 () Unit!22954)

(assert (=> b!659180 (= e!378678 Unit!22962)))

(declare-fun res!427481 () Bool)

(assert (=> b!659180 (= res!427481 (= (select (store (arr!18580 a!2986) i!1108 k0!1786) index!984) (select (arr!18580 a!2986) j!136)))))

(assert (=> b!659180 (=> (not res!427481) (not e!378682))))

(assert (=> b!659180 e!378682))

(declare-fun c!76214 () Bool)

(assert (=> b!659180 (= c!76214 (bvslt j!136 index!984))))

(declare-fun lt!308486 () Unit!22954)

(assert (=> b!659180 (= lt!308486 e!378686)))

(declare-fun c!76213 () Bool)

(assert (=> b!659180 (= c!76213 (bvslt index!984 j!136))))

(declare-fun lt!308482 () Unit!22954)

(assert (=> b!659180 (= lt!308482 e!378684)))

(assert (=> b!659180 false))

(declare-fun b!659181 () Bool)

(declare-fun Unit!22963 () Unit!22954)

(assert (=> b!659181 (= e!378686 Unit!22963)))

(declare-fun b!659182 () Bool)

(declare-fun e!378677 () Bool)

(assert (=> b!659182 (= e!378685 e!378677)))

(declare-fun res!427475 () Bool)

(assert (=> b!659182 (=> (not res!427475) (not e!378677))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!659182 (= res!427475 (and (= lt!308470 (Found!7020 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18580 a!2986) index!984) (select (arr!18580 a!2986) j!136))) (not (= (select (arr!18580 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38766 (_ BitVec 32)) SeekEntryResult!7020)

(assert (=> b!659182 (= lt!308470 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18580 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659183 () Bool)

(declare-fun res!427489 () Bool)

(assert (=> b!659183 (=> (not res!427489) (not e!378690))))

(assert (=> b!659183 (= res!427489 (and (= (size!18944 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18944 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18944 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!308478 () SeekEntryResult!7020)

(declare-fun b!659184 () Bool)

(assert (=> b!659184 (= e!378677 (not (or (= lt!308478 (MissingVacant!7020 vacantSpotIndex!68)) (= lt!308470 lt!308478))))))

(declare-fun lt!308473 () Unit!22954)

(assert (=> b!659184 (= lt!308473 e!378678)))

(declare-fun c!76212 () Bool)

(assert (=> b!659184 (= c!76212 (= lt!308478 (Found!7020 index!984)))))

(declare-fun lt!308476 () Unit!22954)

(assert (=> b!659184 (= lt!308476 e!378687)))

(declare-fun c!76211 () Bool)

(assert (=> b!659184 (= c!76211 (= lt!308478 Undefined!7020))))

(declare-fun lt!308475 () (_ BitVec 64))

(assert (=> b!659184 (= lt!308478 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308475 lt!308479 mask!3053))))

(assert (=> b!659184 e!378683))

(declare-fun res!427483 () Bool)

(assert (=> b!659184 (=> (not res!427483) (not e!378683))))

(declare-fun lt!308477 () (_ BitVec 32))

(assert (=> b!659184 (= res!427483 (= lt!308487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 lt!308475 lt!308479 mask!3053)))))

(assert (=> b!659184 (= lt!308487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 (select (arr!18580 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!659184 (= lt!308475 (select (store (arr!18580 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!308484 () Unit!22954)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38766 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22954)

(assert (=> b!659184 (= lt!308484 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!659184 (= lt!308477 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!427482 () Bool)

(assert (=> start!59608 (=> (not res!427482) (not e!378690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59608 (= res!427482 (validMask!0 mask!3053))))

(assert (=> start!59608 e!378690))

(assert (=> start!59608 true))

(declare-fun array_inv!14376 (array!38766) Bool)

(assert (=> start!59608 (array_inv!14376 a!2986)))

(declare-fun b!659185 () Bool)

(assert (=> b!659185 (= e!378689 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) index!984))))

(declare-fun b!659186 () Bool)

(declare-fun res!427477 () Bool)

(assert (=> b!659186 (=> (not res!427477) (not e!378681))))

(assert (=> b!659186 (= res!427477 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18580 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59608 res!427482) b!659183))

(assert (= (and b!659183 res!427489) b!659178))

(assert (= (and b!659178 res!427484) b!659176))

(assert (= (and b!659176 res!427476) b!659163))

(assert (= (and b!659163 res!427485) b!659171))

(assert (= (and b!659171 res!427490) b!659166))

(assert (= (and b!659166 res!427486) b!659167))

(assert (= (and b!659167 res!427478) b!659186))

(assert (= (and b!659186 res!427477) b!659179))

(assert (= (and b!659179 res!427488) b!659182))

(assert (= (and b!659182 res!427475) b!659184))

(assert (= (and b!659184 res!427483) b!659164))

(assert (= (and b!659184 c!76211) b!659174))

(assert (= (and b!659184 (not c!76211)) b!659168))

(assert (= (and b!659184 c!76212) b!659180))

(assert (= (and b!659184 (not c!76212)) b!659173))

(assert (= (and b!659180 res!427481) b!659169))

(assert (= (and b!659169 (not res!427487)) b!659170))

(assert (= (and b!659170 res!427479) b!659172))

(assert (= (and b!659180 c!76214) b!659175))

(assert (= (and b!659180 (not c!76214)) b!659181))

(assert (= (and b!659180 c!76213) b!659177))

(assert (= (and b!659180 (not c!76213)) b!659165))

(assert (= (and b!659177 res!427480) b!659185))

(declare-fun m!632127 () Bool)

(assert (=> b!659184 m!632127))

(declare-fun m!632129 () Bool)

(assert (=> b!659184 m!632129))

(declare-fun m!632131 () Bool)

(assert (=> b!659184 m!632131))

(declare-fun m!632133 () Bool)

(assert (=> b!659184 m!632133))

(declare-fun m!632135 () Bool)

(assert (=> b!659184 m!632135))

(declare-fun m!632137 () Bool)

(assert (=> b!659184 m!632137))

(declare-fun m!632139 () Bool)

(assert (=> b!659184 m!632139))

(assert (=> b!659184 m!632129))

(declare-fun m!632141 () Bool)

(assert (=> b!659184 m!632141))

(assert (=> b!659178 m!632129))

(assert (=> b!659178 m!632129))

(declare-fun m!632143 () Bool)

(assert (=> b!659178 m!632143))

(assert (=> b!659172 m!632129))

(assert (=> b!659172 m!632129))

(declare-fun m!632145 () Bool)

(assert (=> b!659172 m!632145))

(declare-fun m!632147 () Bool)

(assert (=> b!659176 m!632147))

(declare-fun m!632149 () Bool)

(assert (=> b!659163 m!632149))

(assert (=> b!659180 m!632131))

(declare-fun m!632151 () Bool)

(assert (=> b!659180 m!632151))

(assert (=> b!659180 m!632129))

(assert (=> b!659175 m!632129))

(declare-fun m!632153 () Bool)

(assert (=> b!659175 m!632153))

(declare-fun m!632155 () Bool)

(assert (=> b!659175 m!632155))

(declare-fun m!632157 () Bool)

(assert (=> b!659175 m!632157))

(assert (=> b!659175 m!632129))

(declare-fun m!632159 () Bool)

(assert (=> b!659175 m!632159))

(assert (=> b!659175 m!632129))

(declare-fun m!632161 () Bool)

(assert (=> b!659175 m!632161))

(assert (=> b!659175 m!632129))

(declare-fun m!632163 () Bool)

(assert (=> b!659175 m!632163))

(declare-fun m!632165 () Bool)

(assert (=> b!659175 m!632165))

(declare-fun m!632167 () Bool)

(assert (=> start!59608 m!632167))

(declare-fun m!632169 () Bool)

(assert (=> start!59608 m!632169))

(declare-fun m!632171 () Bool)

(assert (=> b!659166 m!632171))

(assert (=> b!659179 m!632131))

(declare-fun m!632173 () Bool)

(assert (=> b!659179 m!632173))

(declare-fun m!632175 () Bool)

(assert (=> b!659182 m!632175))

(assert (=> b!659182 m!632129))

(assert (=> b!659182 m!632129))

(declare-fun m!632177 () Bool)

(assert (=> b!659182 m!632177))

(declare-fun m!632179 () Bool)

(assert (=> b!659177 m!632179))

(assert (=> b!659177 m!632129))

(declare-fun m!632181 () Bool)

(assert (=> b!659177 m!632181))

(assert (=> b!659177 m!632155))

(assert (=> b!659177 m!632129))

(declare-fun m!632183 () Bool)

(assert (=> b!659177 m!632183))

(assert (=> b!659177 m!632129))

(declare-fun m!632185 () Bool)

(assert (=> b!659177 m!632185))

(assert (=> b!659177 m!632129))

(declare-fun m!632187 () Bool)

(assert (=> b!659177 m!632187))

(assert (=> b!659177 m!632129))

(declare-fun m!632189 () Bool)

(assert (=> b!659177 m!632189))

(assert (=> b!659177 m!632165))

(declare-fun m!632191 () Bool)

(assert (=> b!659186 m!632191))

(assert (=> b!659185 m!632129))

(assert (=> b!659185 m!632129))

(assert (=> b!659185 m!632145))

(assert (=> b!659170 m!632129))

(assert (=> b!659170 m!632129))

(assert (=> b!659170 m!632183))

(declare-fun m!632193 () Bool)

(assert (=> b!659171 m!632193))

(declare-fun m!632195 () Bool)

(assert (=> b!659167 m!632195))

(check-sat (not b!659185) (not b!659170) (not b!659166) (not b!659175) (not b!659177) (not b!659171) (not b!659182) (not b!659172) (not b!659178) (not start!59608) (not b!659163) (not b!659184) (not b!659176) (not b!659167))
(check-sat)
(get-model)

(declare-fun d!92951 () Bool)

(declare-fun res!427543 () Bool)

(declare-fun e!378737 () Bool)

(assert (=> d!92951 (=> res!427543 e!378737)))

(assert (=> d!92951 (= res!427543 (= (select (arr!18580 lt!308479) index!984) (select (arr!18580 a!2986) j!136)))))

(assert (=> d!92951 (= (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) index!984) e!378737)))

(declare-fun b!659263 () Bool)

(declare-fun e!378738 () Bool)

(assert (=> b!659263 (= e!378737 e!378738)))

(declare-fun res!427544 () Bool)

(assert (=> b!659263 (=> (not res!427544) (not e!378738))))

(assert (=> b!659263 (= res!427544 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18944 lt!308479)))))

(declare-fun b!659264 () Bool)

(assert (=> b!659264 (= e!378738 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92951 (not res!427543)) b!659263))

(assert (= (and b!659263 res!427544) b!659264))

(declare-fun m!632267 () Bool)

(assert (=> d!92951 m!632267))

(assert (=> b!659264 m!632129))

(declare-fun m!632269 () Bool)

(assert (=> b!659264 m!632269))

(assert (=> b!659185 d!92951))

(declare-fun d!92953 () Bool)

(assert (=> d!92953 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18944 lt!308479)) (not (= (select (arr!18580 lt!308479) j!136) (select (arr!18580 a!2986) j!136))))))

(declare-fun lt!308551 () Unit!22954)

(declare-fun choose!21 (array!38766 (_ BitVec 64) (_ BitVec 32) List!12621) Unit!22954)

(assert (=> d!92953 (= lt!308551 (choose!21 lt!308479 (select (arr!18580 a!2986) j!136) j!136 Nil!12618))))

(assert (=> d!92953 (bvslt (size!18944 lt!308479) #b01111111111111111111111111111111)))

(assert (=> d!92953 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308479 (select (arr!18580 a!2986) j!136) j!136 Nil!12618) lt!308551)))

(declare-fun bs!19600 () Bool)

(assert (= bs!19600 d!92953))

(declare-fun m!632271 () Bool)

(assert (=> bs!19600 m!632271))

(assert (=> bs!19600 m!632129))

(declare-fun m!632273 () Bool)

(assert (=> bs!19600 m!632273))

(assert (=> b!659175 d!92953))

(declare-fun d!92955 () Bool)

(assert (=> d!92955 (arrayNoDuplicates!0 lt!308479 j!136 Nil!12618)))

(declare-fun lt!308554 () Unit!22954)

(declare-fun choose!39 (array!38766 (_ BitVec 32) (_ BitVec 32)) Unit!22954)

(assert (=> d!92955 (= lt!308554 (choose!39 lt!308479 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92955 (bvslt (size!18944 lt!308479) #b01111111111111111111111111111111)))

(assert (=> d!92955 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308479 #b00000000000000000000000000000000 j!136) lt!308554)))

(declare-fun bs!19601 () Bool)

(assert (= bs!19601 d!92955))

(assert (=> bs!19601 m!632157))

(declare-fun m!632275 () Bool)

(assert (=> bs!19601 m!632275))

(assert (=> b!659175 d!92955))

(declare-fun d!92957 () Bool)

(assert (=> d!92957 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308557 () Unit!22954)

(declare-fun choose!114 (array!38766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22954)

(assert (=> d!92957 (= lt!308557 (choose!114 lt!308479 (select (arr!18580 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92957 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92957 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308479 (select (arr!18580 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!308557)))

(declare-fun bs!19602 () Bool)

(assert (= bs!19602 d!92957))

(assert (=> bs!19602 m!632129))

(assert (=> bs!19602 m!632161))

(assert (=> bs!19602 m!632129))

(declare-fun m!632277 () Bool)

(assert (=> bs!19602 m!632277))

(assert (=> b!659175 d!92957))

(declare-fun b!659275 () Bool)

(declare-fun e!378749 () Bool)

(declare-fun e!378750 () Bool)

(assert (=> b!659275 (= e!378749 e!378750)))

(declare-fun res!427551 () Bool)

(assert (=> b!659275 (=> (not res!427551) (not e!378750))))

(declare-fun e!378748 () Bool)

(assert (=> b!659275 (= res!427551 (not e!378748))))

(declare-fun res!427552 () Bool)

(assert (=> b!659275 (=> (not res!427552) (not e!378748))))

(assert (=> b!659275 (= res!427552 (validKeyInArray!0 (select (arr!18580 lt!308479) #b00000000000000000000000000000000)))))

(declare-fun b!659276 () Bool)

(declare-fun e!378747 () Bool)

(declare-fun call!33890 () Bool)

(assert (=> b!659276 (= e!378747 call!33890)))

(declare-fun bm!33887 () Bool)

(declare-fun c!76229 () Bool)

(assert (=> bm!33887 (= call!33890 (arrayNoDuplicates!0 lt!308479 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76229 (Cons!12617 (select (arr!18580 lt!308479) #b00000000000000000000000000000000) Nil!12618) Nil!12618)))))

(declare-fun b!659278 () Bool)

(declare-fun contains!3197 (List!12621 (_ BitVec 64)) Bool)

(assert (=> b!659278 (= e!378748 (contains!3197 Nil!12618 (select (arr!18580 lt!308479) #b00000000000000000000000000000000)))))

(declare-fun b!659279 () Bool)

(assert (=> b!659279 (= e!378747 call!33890)))

(declare-fun d!92959 () Bool)

(declare-fun res!427553 () Bool)

(assert (=> d!92959 (=> res!427553 e!378749)))

(assert (=> d!92959 (= res!427553 (bvsge #b00000000000000000000000000000000 (size!18944 lt!308479)))))

(assert (=> d!92959 (= (arrayNoDuplicates!0 lt!308479 #b00000000000000000000000000000000 Nil!12618) e!378749)))

(declare-fun b!659277 () Bool)

(assert (=> b!659277 (= e!378750 e!378747)))

(assert (=> b!659277 (= c!76229 (validKeyInArray!0 (select (arr!18580 lt!308479) #b00000000000000000000000000000000)))))

(assert (= (and d!92959 (not res!427553)) b!659275))

(assert (= (and b!659275 res!427552) b!659278))

(assert (= (and b!659275 res!427551) b!659277))

(assert (= (and b!659277 c!76229) b!659279))

(assert (= (and b!659277 (not c!76229)) b!659276))

(assert (= (or b!659279 b!659276) bm!33887))

(declare-fun m!632279 () Bool)

(assert (=> b!659275 m!632279))

(assert (=> b!659275 m!632279))

(declare-fun m!632281 () Bool)

(assert (=> b!659275 m!632281))

(assert (=> bm!33887 m!632279))

(declare-fun m!632283 () Bool)

(assert (=> bm!33887 m!632283))

(assert (=> b!659278 m!632279))

(assert (=> b!659278 m!632279))

(declare-fun m!632285 () Bool)

(assert (=> b!659278 m!632285))

(assert (=> b!659277 m!632279))

(assert (=> b!659277 m!632279))

(assert (=> b!659277 m!632281))

(assert (=> b!659175 d!92959))

(declare-fun b!659280 () Bool)

(declare-fun e!378753 () Bool)

(declare-fun e!378754 () Bool)

(assert (=> b!659280 (= e!378753 e!378754)))

(declare-fun res!427554 () Bool)

(assert (=> b!659280 (=> (not res!427554) (not e!378754))))

(declare-fun e!378752 () Bool)

(assert (=> b!659280 (= res!427554 (not e!378752))))

(declare-fun res!427555 () Bool)

(assert (=> b!659280 (=> (not res!427555) (not e!378752))))

(assert (=> b!659280 (= res!427555 (validKeyInArray!0 (select (arr!18580 lt!308479) j!136)))))

(declare-fun b!659281 () Bool)

(declare-fun e!378751 () Bool)

(declare-fun call!33891 () Bool)

(assert (=> b!659281 (= e!378751 call!33891)))

(declare-fun c!76230 () Bool)

(declare-fun bm!33888 () Bool)

(assert (=> bm!33888 (= call!33891 (arrayNoDuplicates!0 lt!308479 (bvadd j!136 #b00000000000000000000000000000001) (ite c!76230 (Cons!12617 (select (arr!18580 lt!308479) j!136) Nil!12618) Nil!12618)))))

(declare-fun b!659283 () Bool)

(assert (=> b!659283 (= e!378752 (contains!3197 Nil!12618 (select (arr!18580 lt!308479) j!136)))))

(declare-fun b!659284 () Bool)

(assert (=> b!659284 (= e!378751 call!33891)))

(declare-fun d!92961 () Bool)

(declare-fun res!427556 () Bool)

(assert (=> d!92961 (=> res!427556 e!378753)))

(assert (=> d!92961 (= res!427556 (bvsge j!136 (size!18944 lt!308479)))))

(assert (=> d!92961 (= (arrayNoDuplicates!0 lt!308479 j!136 Nil!12618) e!378753)))

(declare-fun b!659282 () Bool)

(assert (=> b!659282 (= e!378754 e!378751)))

(assert (=> b!659282 (= c!76230 (validKeyInArray!0 (select (arr!18580 lt!308479) j!136)))))

(assert (= (and d!92961 (not res!427556)) b!659280))

(assert (= (and b!659280 res!427555) b!659283))

(assert (= (and b!659280 res!427554) b!659282))

(assert (= (and b!659282 c!76230) b!659284))

(assert (= (and b!659282 (not c!76230)) b!659281))

(assert (= (or b!659284 b!659281) bm!33888))

(assert (=> b!659280 m!632271))

(assert (=> b!659280 m!632271))

(declare-fun m!632287 () Bool)

(assert (=> b!659280 m!632287))

(assert (=> bm!33888 m!632271))

(declare-fun m!632289 () Bool)

(assert (=> bm!33888 m!632289))

(assert (=> b!659283 m!632271))

(assert (=> b!659283 m!632271))

(declare-fun m!632291 () Bool)

(assert (=> b!659283 m!632291))

(assert (=> b!659282 m!632271))

(assert (=> b!659282 m!632271))

(assert (=> b!659282 m!632287))

(assert (=> b!659175 d!92961))

(declare-fun d!92963 () Bool)

(declare-fun e!378757 () Bool)

(assert (=> d!92963 e!378757))

(declare-fun res!427559 () Bool)

(assert (=> d!92963 (=> (not res!427559) (not e!378757))))

(assert (=> d!92963 (= res!427559 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18944 a!2986))))))

(declare-fun lt!308560 () Unit!22954)

(declare-fun choose!41 (array!38766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12621) Unit!22954)

(assert (=> d!92963 (= lt!308560 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12618))))

(assert (=> d!92963 (bvslt (size!18944 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92963 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12618) lt!308560)))

(declare-fun b!659287 () Bool)

(assert (=> b!659287 (= e!378757 (arrayNoDuplicates!0 (array!38767 (store (arr!18580 a!2986) i!1108 k0!1786) (size!18944 a!2986)) #b00000000000000000000000000000000 Nil!12618))))

(assert (= (and d!92963 res!427559) b!659287))

(declare-fun m!632293 () Bool)

(assert (=> d!92963 m!632293))

(assert (=> b!659287 m!632131))

(declare-fun m!632295 () Bool)

(assert (=> b!659287 m!632295))

(assert (=> b!659175 d!92963))

(declare-fun d!92965 () Bool)

(declare-fun res!427560 () Bool)

(declare-fun e!378758 () Bool)

(assert (=> d!92965 (=> res!427560 e!378758)))

(assert (=> d!92965 (= res!427560 (= (select (arr!18580 lt!308479) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18580 a!2986) j!136)))))

(assert (=> d!92965 (= (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!378758)))

(declare-fun b!659288 () Bool)

(declare-fun e!378759 () Bool)

(assert (=> b!659288 (= e!378758 e!378759)))

(declare-fun res!427561 () Bool)

(assert (=> b!659288 (=> (not res!427561) (not e!378759))))

(assert (=> b!659288 (= res!427561 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18944 lt!308479)))))

(declare-fun b!659289 () Bool)

(assert (=> b!659289 (= e!378759 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92965 (not res!427560)) b!659288))

(assert (= (and b!659288 res!427561) b!659289))

(declare-fun m!632297 () Bool)

(assert (=> d!92965 m!632297))

(assert (=> b!659289 m!632129))

(declare-fun m!632299 () Bool)

(assert (=> b!659289 m!632299))

(assert (=> b!659175 d!92965))

(declare-fun d!92967 () Bool)

(declare-fun lt!308563 () (_ BitVec 32))

(assert (=> d!92967 (and (bvsge lt!308563 #b00000000000000000000000000000000) (bvslt lt!308563 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92967 (= lt!308563 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92967 (validMask!0 mask!3053)))

(assert (=> d!92967 (= (nextIndex!0 index!984 x!910 mask!3053) lt!308563)))

(declare-fun bs!19603 () Bool)

(assert (= bs!19603 d!92967))

(declare-fun m!632301 () Bool)

(assert (=> bs!19603 m!632301))

(assert (=> bs!19603 m!632167))

(assert (=> b!659184 d!92967))

(declare-fun b!659328 () Bool)

(declare-fun e!378790 () SeekEntryResult!7020)

(assert (=> b!659328 (= e!378790 Undefined!7020)))

(declare-fun d!92969 () Bool)

(declare-fun lt!308571 () SeekEntryResult!7020)

(get-info :version)

(assert (=> d!92969 (and (or ((_ is Undefined!7020) lt!308571) (not ((_ is Found!7020) lt!308571)) (and (bvsge (index!30446 lt!308571) #b00000000000000000000000000000000) (bvslt (index!30446 lt!308571) (size!18944 lt!308479)))) (or ((_ is Undefined!7020) lt!308571) ((_ is Found!7020) lt!308571) (not ((_ is MissingVacant!7020) lt!308571)) (not (= (index!30448 lt!308571) vacantSpotIndex!68)) (and (bvsge (index!30448 lt!308571) #b00000000000000000000000000000000) (bvslt (index!30448 lt!308571) (size!18944 lt!308479)))) (or ((_ is Undefined!7020) lt!308571) (ite ((_ is Found!7020) lt!308571) (= (select (arr!18580 lt!308479) (index!30446 lt!308571)) lt!308475) (and ((_ is MissingVacant!7020) lt!308571) (= (index!30448 lt!308571) vacantSpotIndex!68) (= (select (arr!18580 lt!308479) (index!30448 lt!308571)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92969 (= lt!308571 e!378790)))

(declare-fun c!76242 () Bool)

(assert (=> d!92969 (= c!76242 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!308572 () (_ BitVec 64))

(assert (=> d!92969 (= lt!308572 (select (arr!18580 lt!308479) index!984))))

(assert (=> d!92969 (validMask!0 mask!3053)))

(assert (=> d!92969 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308475 lt!308479 mask!3053) lt!308571)))

(declare-fun b!659329 () Bool)

(declare-fun e!378788 () SeekEntryResult!7020)

(assert (=> b!659329 (= e!378788 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!308475 lt!308479 mask!3053))))

(declare-fun b!659330 () Bool)

(assert (=> b!659330 (= e!378788 (MissingVacant!7020 vacantSpotIndex!68))))

(declare-fun b!659331 () Bool)

(declare-fun e!378789 () SeekEntryResult!7020)

(assert (=> b!659331 (= e!378789 (Found!7020 index!984))))

(declare-fun b!659332 () Bool)

(assert (=> b!659332 (= e!378790 e!378789)))

(declare-fun c!76241 () Bool)

(assert (=> b!659332 (= c!76241 (= lt!308572 lt!308475))))

(declare-fun b!659333 () Bool)

(declare-fun c!76243 () Bool)

(assert (=> b!659333 (= c!76243 (= lt!308572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659333 (= e!378789 e!378788)))

(assert (= (and d!92969 c!76242) b!659328))

(assert (= (and d!92969 (not c!76242)) b!659332))

(assert (= (and b!659332 c!76241) b!659331))

(assert (= (and b!659332 (not c!76241)) b!659333))

(assert (= (and b!659333 c!76243) b!659330))

(assert (= (and b!659333 (not c!76243)) b!659329))

(declare-fun m!632325 () Bool)

(assert (=> d!92969 m!632325))

(declare-fun m!632327 () Bool)

(assert (=> d!92969 m!632327))

(assert (=> d!92969 m!632267))

(assert (=> d!92969 m!632167))

(assert (=> b!659329 m!632127))

(assert (=> b!659329 m!632127))

(declare-fun m!632329 () Bool)

(assert (=> b!659329 m!632329))

(assert (=> b!659184 d!92969))

(declare-fun b!659334 () Bool)

(declare-fun e!378793 () SeekEntryResult!7020)

(assert (=> b!659334 (= e!378793 Undefined!7020)))

(declare-fun d!92983 () Bool)

(declare-fun lt!308573 () SeekEntryResult!7020)

(assert (=> d!92983 (and (or ((_ is Undefined!7020) lt!308573) (not ((_ is Found!7020) lt!308573)) (and (bvsge (index!30446 lt!308573) #b00000000000000000000000000000000) (bvslt (index!30446 lt!308573) (size!18944 a!2986)))) (or ((_ is Undefined!7020) lt!308573) ((_ is Found!7020) lt!308573) (not ((_ is MissingVacant!7020) lt!308573)) (not (= (index!30448 lt!308573) vacantSpotIndex!68)) (and (bvsge (index!30448 lt!308573) #b00000000000000000000000000000000) (bvslt (index!30448 lt!308573) (size!18944 a!2986)))) (or ((_ is Undefined!7020) lt!308573) (ite ((_ is Found!7020) lt!308573) (= (select (arr!18580 a!2986) (index!30446 lt!308573)) (select (arr!18580 a!2986) j!136)) (and ((_ is MissingVacant!7020) lt!308573) (= (index!30448 lt!308573) vacantSpotIndex!68) (= (select (arr!18580 a!2986) (index!30448 lt!308573)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92983 (= lt!308573 e!378793)))

(declare-fun c!76245 () Bool)

(assert (=> d!92983 (= c!76245 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!308574 () (_ BitVec 64))

(assert (=> d!92983 (= lt!308574 (select (arr!18580 a!2986) lt!308477))))

(assert (=> d!92983 (validMask!0 mask!3053)))

(assert (=> d!92983 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 (select (arr!18580 a!2986) j!136) a!2986 mask!3053) lt!308573)))

(declare-fun b!659335 () Bool)

(declare-fun e!378791 () SeekEntryResult!7020)

(assert (=> b!659335 (= e!378791 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308477 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18580 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659336 () Bool)

(assert (=> b!659336 (= e!378791 (MissingVacant!7020 vacantSpotIndex!68))))

(declare-fun b!659337 () Bool)

(declare-fun e!378792 () SeekEntryResult!7020)

(assert (=> b!659337 (= e!378792 (Found!7020 lt!308477))))

(declare-fun b!659338 () Bool)

(assert (=> b!659338 (= e!378793 e!378792)))

(declare-fun c!76244 () Bool)

(assert (=> b!659338 (= c!76244 (= lt!308574 (select (arr!18580 a!2986) j!136)))))

(declare-fun b!659339 () Bool)

(declare-fun c!76246 () Bool)

(assert (=> b!659339 (= c!76246 (= lt!308574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659339 (= e!378792 e!378791)))

(assert (= (and d!92983 c!76245) b!659334))

(assert (= (and d!92983 (not c!76245)) b!659338))

(assert (= (and b!659338 c!76244) b!659337))

(assert (= (and b!659338 (not c!76244)) b!659339))

(assert (= (and b!659339 c!76246) b!659336))

(assert (= (and b!659339 (not c!76246)) b!659335))

(declare-fun m!632331 () Bool)

(assert (=> d!92983 m!632331))

(declare-fun m!632333 () Bool)

(assert (=> d!92983 m!632333))

(declare-fun m!632335 () Bool)

(assert (=> d!92983 m!632335))

(assert (=> d!92983 m!632167))

(declare-fun m!632337 () Bool)

(assert (=> b!659335 m!632337))

(assert (=> b!659335 m!632337))

(assert (=> b!659335 m!632129))

(declare-fun m!632339 () Bool)

(assert (=> b!659335 m!632339))

(assert (=> b!659184 d!92983))

(declare-fun d!92985 () Bool)

(declare-fun e!378814 () Bool)

(assert (=> d!92985 e!378814))

(declare-fun res!427597 () Bool)

(assert (=> d!92985 (=> (not res!427597) (not e!378814))))

(assert (=> d!92985 (= res!427597 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18944 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18944 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18944 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18944 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18944 a!2986))))))

(declare-fun lt!308595 () Unit!22954)

(declare-fun choose!9 (array!38766 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22954)

(assert (=> d!92985 (= lt!308595 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92985 (validMask!0 mask!3053)))

(assert (=> d!92985 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 mask!3053) lt!308595)))

(declare-fun b!659363 () Bool)

(assert (=> b!659363 (= e!378814 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 (select (arr!18580 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 (select (store (arr!18580 a!2986) i!1108 k0!1786) j!136) (array!38767 (store (arr!18580 a!2986) i!1108 k0!1786) (size!18944 a!2986)) mask!3053)))))

(assert (= (and d!92985 res!427597) b!659363))

(declare-fun m!632363 () Bool)

(assert (=> d!92985 m!632363))

(assert (=> d!92985 m!632167))

(assert (=> b!659363 m!632131))

(assert (=> b!659363 m!632139))

(assert (=> b!659363 m!632129))

(assert (=> b!659363 m!632141))

(assert (=> b!659363 m!632139))

(declare-fun m!632365 () Bool)

(assert (=> b!659363 m!632365))

(assert (=> b!659363 m!632129))

(assert (=> b!659184 d!92985))

(declare-fun b!659364 () Bool)

(declare-fun e!378817 () SeekEntryResult!7020)

(assert (=> b!659364 (= e!378817 Undefined!7020)))

(declare-fun lt!308596 () SeekEntryResult!7020)

(declare-fun d!92997 () Bool)

(assert (=> d!92997 (and (or ((_ is Undefined!7020) lt!308596) (not ((_ is Found!7020) lt!308596)) (and (bvsge (index!30446 lt!308596) #b00000000000000000000000000000000) (bvslt (index!30446 lt!308596) (size!18944 lt!308479)))) (or ((_ is Undefined!7020) lt!308596) ((_ is Found!7020) lt!308596) (not ((_ is MissingVacant!7020) lt!308596)) (not (= (index!30448 lt!308596) vacantSpotIndex!68)) (and (bvsge (index!30448 lt!308596) #b00000000000000000000000000000000) (bvslt (index!30448 lt!308596) (size!18944 lt!308479)))) (or ((_ is Undefined!7020) lt!308596) (ite ((_ is Found!7020) lt!308596) (= (select (arr!18580 lt!308479) (index!30446 lt!308596)) lt!308475) (and ((_ is MissingVacant!7020) lt!308596) (= (index!30448 lt!308596) vacantSpotIndex!68) (= (select (arr!18580 lt!308479) (index!30448 lt!308596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92997 (= lt!308596 e!378817)))

(declare-fun c!76251 () Bool)

(assert (=> d!92997 (= c!76251 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!308597 () (_ BitVec 64))

(assert (=> d!92997 (= lt!308597 (select (arr!18580 lt!308479) lt!308477))))

(assert (=> d!92997 (validMask!0 mask!3053)))

(assert (=> d!92997 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308477 vacantSpotIndex!68 lt!308475 lt!308479 mask!3053) lt!308596)))

(declare-fun e!378815 () SeekEntryResult!7020)

(declare-fun b!659365 () Bool)

(assert (=> b!659365 (= e!378815 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308477 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!308475 lt!308479 mask!3053))))

(declare-fun b!659366 () Bool)

(assert (=> b!659366 (= e!378815 (MissingVacant!7020 vacantSpotIndex!68))))

(declare-fun b!659367 () Bool)

(declare-fun e!378816 () SeekEntryResult!7020)

(assert (=> b!659367 (= e!378816 (Found!7020 lt!308477))))

(declare-fun b!659368 () Bool)

(assert (=> b!659368 (= e!378817 e!378816)))

(declare-fun c!76250 () Bool)

(assert (=> b!659368 (= c!76250 (= lt!308597 lt!308475))))

(declare-fun b!659369 () Bool)

(declare-fun c!76252 () Bool)

(assert (=> b!659369 (= c!76252 (= lt!308597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659369 (= e!378816 e!378815)))

(assert (= (and d!92997 c!76251) b!659364))

(assert (= (and d!92997 (not c!76251)) b!659368))

(assert (= (and b!659368 c!76250) b!659367))

(assert (= (and b!659368 (not c!76250)) b!659369))

(assert (= (and b!659369 c!76252) b!659366))

(assert (= (and b!659369 (not c!76252)) b!659365))

(declare-fun m!632367 () Bool)

(assert (=> d!92997 m!632367))

(declare-fun m!632369 () Bool)

(assert (=> d!92997 m!632369))

(declare-fun m!632371 () Bool)

(assert (=> d!92997 m!632371))

(assert (=> d!92997 m!632167))

(assert (=> b!659365 m!632337))

(assert (=> b!659365 m!632337))

(declare-fun m!632373 () Bool)

(assert (=> b!659365 m!632373))

(assert (=> b!659184 d!92997))

(declare-fun d!92999 () Bool)

(declare-fun res!427598 () Bool)

(declare-fun e!378818 () Bool)

(assert (=> d!92999 (=> res!427598 e!378818)))

(assert (=> d!92999 (= res!427598 (= (select (arr!18580 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92999 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!378818)))

(declare-fun b!659370 () Bool)

(declare-fun e!378819 () Bool)

(assert (=> b!659370 (= e!378818 e!378819)))

(declare-fun res!427599 () Bool)

(assert (=> b!659370 (=> (not res!427599) (not e!378819))))

(assert (=> b!659370 (= res!427599 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18944 a!2986)))))

(declare-fun b!659371 () Bool)

(assert (=> b!659371 (= e!378819 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92999 (not res!427598)) b!659370))

(assert (= (and b!659370 res!427599) b!659371))

(declare-fun m!632375 () Bool)

(assert (=> d!92999 m!632375))

(declare-fun m!632377 () Bool)

(assert (=> b!659371 m!632377))

(assert (=> b!659163 d!92999))

(assert (=> b!659172 d!92951))

(declare-fun b!659437 () Bool)

(declare-fun e!378860 () SeekEntryResult!7020)

(declare-fun lt!308620 () SeekEntryResult!7020)

(assert (=> b!659437 (= e!378860 (Found!7020 (index!30447 lt!308620)))))

(declare-fun b!659438 () Bool)

(declare-fun e!378858 () SeekEntryResult!7020)

(assert (=> b!659438 (= e!378858 Undefined!7020)))

(declare-fun b!659440 () Bool)

(assert (=> b!659440 (= e!378858 e!378860)))

(declare-fun lt!308621 () (_ BitVec 64))

(assert (=> b!659440 (= lt!308621 (select (arr!18580 a!2986) (index!30447 lt!308620)))))

(declare-fun c!76280 () Bool)

(assert (=> b!659440 (= c!76280 (= lt!308621 k0!1786))))

(declare-fun b!659441 () Bool)

(declare-fun e!378859 () SeekEntryResult!7020)

(assert (=> b!659441 (= e!378859 (MissingZero!7020 (index!30447 lt!308620)))))

(declare-fun b!659442 () Bool)

(declare-fun c!76282 () Bool)

(assert (=> b!659442 (= c!76282 (= lt!308621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659442 (= e!378860 e!378859)))

(declare-fun d!93001 () Bool)

(declare-fun lt!308619 () SeekEntryResult!7020)

(assert (=> d!93001 (and (or ((_ is Undefined!7020) lt!308619) (not ((_ is Found!7020) lt!308619)) (and (bvsge (index!30446 lt!308619) #b00000000000000000000000000000000) (bvslt (index!30446 lt!308619) (size!18944 a!2986)))) (or ((_ is Undefined!7020) lt!308619) ((_ is Found!7020) lt!308619) (not ((_ is MissingZero!7020) lt!308619)) (and (bvsge (index!30445 lt!308619) #b00000000000000000000000000000000) (bvslt (index!30445 lt!308619) (size!18944 a!2986)))) (or ((_ is Undefined!7020) lt!308619) ((_ is Found!7020) lt!308619) ((_ is MissingZero!7020) lt!308619) (not ((_ is MissingVacant!7020) lt!308619)) (and (bvsge (index!30448 lt!308619) #b00000000000000000000000000000000) (bvslt (index!30448 lt!308619) (size!18944 a!2986)))) (or ((_ is Undefined!7020) lt!308619) (ite ((_ is Found!7020) lt!308619) (= (select (arr!18580 a!2986) (index!30446 lt!308619)) k0!1786) (ite ((_ is MissingZero!7020) lt!308619) (= (select (arr!18580 a!2986) (index!30445 lt!308619)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7020) lt!308619) (= (select (arr!18580 a!2986) (index!30448 lt!308619)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!93001 (= lt!308619 e!378858)))

(declare-fun c!76281 () Bool)

(assert (=> d!93001 (= c!76281 (and ((_ is Intermediate!7020) lt!308620) (undefined!7832 lt!308620)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38766 (_ BitVec 32)) SeekEntryResult!7020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!93001 (= lt!308620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!93001 (validMask!0 mask!3053)))

(assert (=> d!93001 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!308619)))

(declare-fun b!659439 () Bool)

(assert (=> b!659439 (= e!378859 (seekKeyOrZeroReturnVacant!0 (x!59231 lt!308620) (index!30447 lt!308620) (index!30447 lt!308620) k0!1786 a!2986 mask!3053))))

(assert (= (and d!93001 c!76281) b!659438))

(assert (= (and d!93001 (not c!76281)) b!659440))

(assert (= (and b!659440 c!76280) b!659437))

(assert (= (and b!659440 (not c!76280)) b!659442))

(assert (= (and b!659442 c!76282) b!659441))

(assert (= (and b!659442 (not c!76282)) b!659439))

(declare-fun m!632407 () Bool)

(assert (=> b!659440 m!632407))

(declare-fun m!632409 () Bool)

(assert (=> d!93001 m!632409))

(declare-fun m!632411 () Bool)

(assert (=> d!93001 m!632411))

(assert (=> d!93001 m!632167))

(declare-fun m!632413 () Bool)

(assert (=> d!93001 m!632413))

(declare-fun m!632415 () Bool)

(assert (=> d!93001 m!632415))

(assert (=> d!93001 m!632409))

(declare-fun m!632417 () Bool)

(assert (=> d!93001 m!632417))

(declare-fun m!632419 () Bool)

(assert (=> b!659439 m!632419))

(assert (=> b!659171 d!93001))

(declare-fun b!659443 () Bool)

(declare-fun e!378865 () SeekEntryResult!7020)

(assert (=> b!659443 (= e!378865 Undefined!7020)))

(declare-fun lt!308624 () SeekEntryResult!7020)

(declare-fun d!93013 () Bool)

(assert (=> d!93013 (and (or ((_ is Undefined!7020) lt!308624) (not ((_ is Found!7020) lt!308624)) (and (bvsge (index!30446 lt!308624) #b00000000000000000000000000000000) (bvslt (index!30446 lt!308624) (size!18944 a!2986)))) (or ((_ is Undefined!7020) lt!308624) ((_ is Found!7020) lt!308624) (not ((_ is MissingVacant!7020) lt!308624)) (not (= (index!30448 lt!308624) vacantSpotIndex!68)) (and (bvsge (index!30448 lt!308624) #b00000000000000000000000000000000) (bvslt (index!30448 lt!308624) (size!18944 a!2986)))) (or ((_ is Undefined!7020) lt!308624) (ite ((_ is Found!7020) lt!308624) (= (select (arr!18580 a!2986) (index!30446 lt!308624)) (select (arr!18580 a!2986) j!136)) (and ((_ is MissingVacant!7020) lt!308624) (= (index!30448 lt!308624) vacantSpotIndex!68) (= (select (arr!18580 a!2986) (index!30448 lt!308624)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!93013 (= lt!308624 e!378865)))

(declare-fun c!76284 () Bool)

(assert (=> d!93013 (= c!76284 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!308625 () (_ BitVec 64))

(assert (=> d!93013 (= lt!308625 (select (arr!18580 a!2986) index!984))))

(assert (=> d!93013 (validMask!0 mask!3053)))

(assert (=> d!93013 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18580 a!2986) j!136) a!2986 mask!3053) lt!308624)))

(declare-fun e!378863 () SeekEntryResult!7020)

(declare-fun b!659444 () Bool)

(assert (=> b!659444 (= e!378863 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18580 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659445 () Bool)

(assert (=> b!659445 (= e!378863 (MissingVacant!7020 vacantSpotIndex!68))))

(declare-fun b!659446 () Bool)

(declare-fun e!378864 () SeekEntryResult!7020)

(assert (=> b!659446 (= e!378864 (Found!7020 index!984))))

(declare-fun b!659447 () Bool)

(assert (=> b!659447 (= e!378865 e!378864)))

(declare-fun c!76283 () Bool)

(assert (=> b!659447 (= c!76283 (= lt!308625 (select (arr!18580 a!2986) j!136)))))

(declare-fun b!659448 () Bool)

(declare-fun c!76285 () Bool)

(assert (=> b!659448 (= c!76285 (= lt!308625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659448 (= e!378864 e!378863)))

(assert (= (and d!93013 c!76284) b!659443))

(assert (= (and d!93013 (not c!76284)) b!659447))

(assert (= (and b!659447 c!76283) b!659446))

(assert (= (and b!659447 (not c!76283)) b!659448))

(assert (= (and b!659448 c!76285) b!659445))

(assert (= (and b!659448 (not c!76285)) b!659444))

(declare-fun m!632421 () Bool)

(assert (=> d!93013 m!632421))

(declare-fun m!632423 () Bool)

(assert (=> d!93013 m!632423))

(assert (=> d!93013 m!632175))

(assert (=> d!93013 m!632167))

(assert (=> b!659444 m!632127))

(assert (=> b!659444 m!632127))

(assert (=> b!659444 m!632129))

(declare-fun m!632425 () Bool)

(assert (=> b!659444 m!632425))

(assert (=> b!659182 d!93013))

(declare-fun d!93015 () Bool)

(declare-fun res!427613 () Bool)

(declare-fun e!378866 () Bool)

(assert (=> d!93015 (=> res!427613 e!378866)))

(assert (=> d!93015 (= res!427613 (= (select (arr!18580 lt!308479) j!136) (select (arr!18580 a!2986) j!136)))))

(assert (=> d!93015 (= (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) j!136) e!378866)))

(declare-fun b!659451 () Bool)

(declare-fun e!378867 () Bool)

(assert (=> b!659451 (= e!378866 e!378867)))

(declare-fun res!427614 () Bool)

(assert (=> b!659451 (=> (not res!427614) (not e!378867))))

(assert (=> b!659451 (= res!427614 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18944 lt!308479)))))

(declare-fun b!659452 () Bool)

(assert (=> b!659452 (= e!378867 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!93015 (not res!427613)) b!659451))

(assert (= (and b!659451 res!427614) b!659452))

(assert (=> d!93015 m!632271))

(assert (=> b!659452 m!632129))

(declare-fun m!632427 () Bool)

(assert (=> b!659452 m!632427))

(assert (=> b!659170 d!93015))

(assert (=> b!659177 d!93015))

(declare-fun d!93017 () Bool)

(assert (=> d!93017 (arrayNoDuplicates!0 lt!308479 index!984 Nil!12618)))

(declare-fun lt!308628 () Unit!22954)

(assert (=> d!93017 (= lt!308628 (choose!39 lt!308479 #b00000000000000000000000000000000 index!984))))

(assert (=> d!93017 (bvslt (size!18944 lt!308479) #b01111111111111111111111111111111)))

(assert (=> d!93017 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308479 #b00000000000000000000000000000000 index!984) lt!308628)))

(declare-fun bs!19608 () Bool)

(assert (= bs!19608 d!93017))

(assert (=> bs!19608 m!632181))

(declare-fun m!632429 () Bool)

(assert (=> bs!19608 m!632429))

(assert (=> b!659177 d!93017))

(declare-fun d!93019 () Bool)

(declare-fun res!427615 () Bool)

(declare-fun e!378868 () Bool)

(assert (=> d!93019 (=> res!427615 e!378868)))

(assert (=> d!93019 (= res!427615 (= (select (arr!18580 lt!308479) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18580 a!2986) j!136)))))

(assert (=> d!93019 (= (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!378868)))

(declare-fun b!659453 () Bool)

(declare-fun e!378869 () Bool)

(assert (=> b!659453 (= e!378868 e!378869)))

(declare-fun res!427616 () Bool)

(assert (=> b!659453 (=> (not res!427616) (not e!378869))))

(assert (=> b!659453 (= res!427616 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18944 lt!308479)))))

(declare-fun b!659454 () Bool)

(assert (=> b!659454 (= e!378869 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!93019 (not res!427615)) b!659453))

(assert (= (and b!659453 res!427616) b!659454))

(declare-fun m!632433 () Bool)

(assert (=> d!93019 m!632433))

(assert (=> b!659454 m!632129))

(declare-fun m!632435 () Bool)

(assert (=> b!659454 m!632435))

(assert (=> b!659177 d!93019))

(declare-fun b!659458 () Bool)

(declare-fun e!378875 () Bool)

(declare-fun e!378876 () Bool)

(assert (=> b!659458 (= e!378875 e!378876)))

(declare-fun res!427620 () Bool)

(assert (=> b!659458 (=> (not res!427620) (not e!378876))))

(declare-fun e!378874 () Bool)

(assert (=> b!659458 (= res!427620 (not e!378874))))

(declare-fun res!427621 () Bool)

(assert (=> b!659458 (=> (not res!427621) (not e!378874))))

(assert (=> b!659458 (= res!427621 (validKeyInArray!0 (select (arr!18580 lt!308479) index!984)))))

(declare-fun b!659459 () Bool)

(declare-fun e!378873 () Bool)

(declare-fun call!33902 () Bool)

(assert (=> b!659459 (= e!378873 call!33902)))

(declare-fun c!76286 () Bool)

(declare-fun bm!33899 () Bool)

(assert (=> bm!33899 (= call!33902 (arrayNoDuplicates!0 lt!308479 (bvadd index!984 #b00000000000000000000000000000001) (ite c!76286 (Cons!12617 (select (arr!18580 lt!308479) index!984) Nil!12618) Nil!12618)))))

(declare-fun b!659461 () Bool)

(assert (=> b!659461 (= e!378874 (contains!3197 Nil!12618 (select (arr!18580 lt!308479) index!984)))))

(declare-fun b!659462 () Bool)

(assert (=> b!659462 (= e!378873 call!33902)))

(declare-fun d!93023 () Bool)

(declare-fun res!427622 () Bool)

(assert (=> d!93023 (=> res!427622 e!378875)))

(assert (=> d!93023 (= res!427622 (bvsge index!984 (size!18944 lt!308479)))))

(assert (=> d!93023 (= (arrayNoDuplicates!0 lt!308479 index!984 Nil!12618) e!378875)))

(declare-fun b!659460 () Bool)

(assert (=> b!659460 (= e!378876 e!378873)))

(assert (=> b!659460 (= c!76286 (validKeyInArray!0 (select (arr!18580 lt!308479) index!984)))))

(assert (= (and d!93023 (not res!427622)) b!659458))

(assert (= (and b!659458 res!427621) b!659461))

(assert (= (and b!659458 res!427620) b!659460))

(assert (= (and b!659460 c!76286) b!659462))

(assert (= (and b!659460 (not c!76286)) b!659459))

(assert (= (or b!659462 b!659459) bm!33899))

(assert (=> b!659458 m!632267))

(assert (=> b!659458 m!632267))

(declare-fun m!632443 () Bool)

(assert (=> b!659458 m!632443))

(assert (=> bm!33899 m!632267))

(declare-fun m!632447 () Bool)

(assert (=> bm!33899 m!632447))

(assert (=> b!659461 m!632267))

(assert (=> b!659461 m!632267))

(declare-fun m!632449 () Bool)

(assert (=> b!659461 m!632449))

(assert (=> b!659460 m!632267))

(assert (=> b!659460 m!632267))

(assert (=> b!659460 m!632443))

(assert (=> b!659177 d!93023))

(declare-fun d!93029 () Bool)

(assert (=> d!93029 (arrayContainsKey!0 lt!308479 (select (arr!18580 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308633 () Unit!22954)

(assert (=> d!93029 (= lt!308633 (choose!114 lt!308479 (select (arr!18580 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!93029 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!93029 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308479 (select (arr!18580 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!308633)))

(declare-fun bs!19610 () Bool)

(assert (= bs!19610 d!93029))

(assert (=> bs!19610 m!632129))

(assert (=> bs!19610 m!632189))

(assert (=> bs!19610 m!632129))

(declare-fun m!632451 () Bool)

(assert (=> bs!19610 m!632451))

(assert (=> b!659177 d!93029))

(assert (=> b!659177 d!92959))

(assert (=> b!659177 d!92963))

(declare-fun d!93031 () Bool)

(assert (=> d!93031 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18944 lt!308479)) (not (= (select (arr!18580 lt!308479) index!984) (select (arr!18580 a!2986) j!136))))))

(declare-fun lt!308634 () Unit!22954)

(assert (=> d!93031 (= lt!308634 (choose!21 lt!308479 (select (arr!18580 a!2986) j!136) index!984 Nil!12618))))

(assert (=> d!93031 (bvslt (size!18944 lt!308479) #b01111111111111111111111111111111)))

(assert (=> d!93031 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308479 (select (arr!18580 a!2986) j!136) index!984 Nil!12618) lt!308634)))

(declare-fun bs!19611 () Bool)

(assert (= bs!19611 d!93031))

(assert (=> bs!19611 m!632267))

(assert (=> bs!19611 m!632129))

(declare-fun m!632461 () Bool)

(assert (=> bs!19611 m!632461))

(assert (=> b!659177 d!93031))

(declare-fun b!659475 () Bool)

(declare-fun e!378885 () Bool)

(declare-fun e!378886 () Bool)

(assert (=> b!659475 (= e!378885 e!378886)))

(declare-fun res!427623 () Bool)

(assert (=> b!659475 (=> (not res!427623) (not e!378886))))

(declare-fun e!378884 () Bool)

(assert (=> b!659475 (= res!427623 (not e!378884))))

(declare-fun res!427624 () Bool)

(assert (=> b!659475 (=> (not res!427624) (not e!378884))))

(assert (=> b!659475 (= res!427624 (validKeyInArray!0 (select (arr!18580 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!659476 () Bool)

(declare-fun e!378883 () Bool)

(declare-fun call!33903 () Bool)

(assert (=> b!659476 (= e!378883 call!33903)))

(declare-fun bm!33900 () Bool)

(declare-fun c!76293 () Bool)

(assert (=> bm!33900 (= call!33903 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76293 (Cons!12617 (select (arr!18580 a!2986) #b00000000000000000000000000000000) Nil!12618) Nil!12618)))))

(declare-fun b!659478 () Bool)

(assert (=> b!659478 (= e!378884 (contains!3197 Nil!12618 (select (arr!18580 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!659479 () Bool)

(assert (=> b!659479 (= e!378883 call!33903)))

(declare-fun d!93035 () Bool)

(declare-fun res!427625 () Bool)

(assert (=> d!93035 (=> res!427625 e!378885)))

(assert (=> d!93035 (= res!427625 (bvsge #b00000000000000000000000000000000 (size!18944 a!2986)))))

(assert (=> d!93035 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12618) e!378885)))

(declare-fun b!659477 () Bool)

(assert (=> b!659477 (= e!378886 e!378883)))

(assert (=> b!659477 (= c!76293 (validKeyInArray!0 (select (arr!18580 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!93035 (not res!427625)) b!659475))

(assert (= (and b!659475 res!427624) b!659478))

(assert (= (and b!659475 res!427623) b!659477))

(assert (= (and b!659477 c!76293) b!659479))

(assert (= (and b!659477 (not c!76293)) b!659476))

(assert (= (or b!659479 b!659476) bm!33900))

(assert (=> b!659475 m!632375))

(assert (=> b!659475 m!632375))

(declare-fun m!632463 () Bool)

(assert (=> b!659475 m!632463))

(assert (=> bm!33900 m!632375))

(declare-fun m!632471 () Bool)

(assert (=> bm!33900 m!632471))

(assert (=> b!659478 m!632375))

(assert (=> b!659478 m!632375))

(declare-fun m!632473 () Bool)

(assert (=> b!659478 m!632473))

(assert (=> b!659477 m!632375))

(assert (=> b!659477 m!632375))

(assert (=> b!659477 m!632463))

(assert (=> b!659167 d!93035))

(declare-fun d!93041 () Bool)

(assert (=> d!93041 (= (validKeyInArray!0 (select (arr!18580 a!2986) j!136)) (and (not (= (select (arr!18580 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18580 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!659178 d!93041))

(declare-fun d!93043 () Bool)

(assert (=> d!93043 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!659176 d!93043))

(declare-fun d!93047 () Bool)

(assert (=> d!93047 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59608 d!93047))

(declare-fun d!93059 () Bool)

(assert (=> d!93059 (= (array_inv!14376 a!2986) (bvsge (size!18944 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59608 d!93059))

(declare-fun b!659509 () Bool)

(declare-fun e!378910 () Bool)

(declare-fun call!33908 () Bool)

(assert (=> b!659509 (= e!378910 call!33908)))

(declare-fun b!659510 () Bool)

(declare-fun e!378911 () Bool)

(assert (=> b!659510 (= e!378911 call!33908)))

(declare-fun b!659512 () Bool)

(assert (=> b!659512 (= e!378910 e!378911)))

(declare-fun lt!308655 () (_ BitVec 64))

(assert (=> b!659512 (= lt!308655 (select (arr!18580 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!308656 () Unit!22954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38766 (_ BitVec 64) (_ BitVec 32)) Unit!22954)

(assert (=> b!659512 (= lt!308656 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!308655 #b00000000000000000000000000000000))))

(assert (=> b!659512 (arrayContainsKey!0 a!2986 lt!308655 #b00000000000000000000000000000000)))

(declare-fun lt!308654 () Unit!22954)

(assert (=> b!659512 (= lt!308654 lt!308656)))

(declare-fun res!427642 () Bool)

(assert (=> b!659512 (= res!427642 (= (seekEntryOrOpen!0 (select (arr!18580 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!7020 #b00000000000000000000000000000000)))))

(assert (=> b!659512 (=> (not res!427642) (not e!378911))))

(declare-fun bm!33905 () Bool)

(assert (=> bm!33905 (= call!33908 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!93061 () Bool)

(declare-fun res!427641 () Bool)

(declare-fun e!378909 () Bool)

(assert (=> d!93061 (=> res!427641 e!378909)))

(assert (=> d!93061 (= res!427641 (bvsge #b00000000000000000000000000000000 (size!18944 a!2986)))))

(assert (=> d!93061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!378909)))

(declare-fun b!659511 () Bool)

(assert (=> b!659511 (= e!378909 e!378910)))

(declare-fun c!76301 () Bool)

(assert (=> b!659511 (= c!76301 (validKeyInArray!0 (select (arr!18580 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!93061 (not res!427641)) b!659511))

(assert (= (and b!659511 c!76301) b!659512))

(assert (= (and b!659511 (not c!76301)) b!659509))

(assert (= (and b!659512 res!427642) b!659510))

(assert (= (or b!659510 b!659509) bm!33905))

(assert (=> b!659512 m!632375))

(declare-fun m!632509 () Bool)

(assert (=> b!659512 m!632509))

(declare-fun m!632511 () Bool)

(assert (=> b!659512 m!632511))

(assert (=> b!659512 m!632375))

(declare-fun m!632513 () Bool)

(assert (=> b!659512 m!632513))

(declare-fun m!632515 () Bool)

(assert (=> bm!33905 m!632515))

(assert (=> b!659511 m!632375))

(assert (=> b!659511 m!632375))

(assert (=> b!659511 m!632463))

(assert (=> b!659166 d!93061))

(check-sat (not d!92969) (not bm!33905) (not d!92957) (not b!659335) (not b!659280) (not d!93029) (not b!659282) (not b!659461) (not b!659477) (not b!659365) (not b!659275) (not b!659460) (not b!659475) (not b!659458) (not bm!33899) (not b!659371) (not d!93001) (not bm!33900) (not b!659452) (not d!92963) (not d!92967) (not b!659444) (not d!93013) (not b!659511) (not b!659329) (not b!659478) (not d!92955) (not d!92997) (not b!659264) (not b!659287) (not b!659278) (not d!93031) (not b!659454) (not b!659283) (not b!659289) (not b!659439) (not b!659363) (not b!659277) (not d!92985) (not d!93017) (not d!92953) (not d!92983) (not b!659512) (not bm!33887) (not bm!33888))
(check-sat)
