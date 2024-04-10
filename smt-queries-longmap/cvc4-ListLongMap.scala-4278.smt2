; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59580 () Bool)

(assert start!59580)

(declare-fun b!658154 () Bool)

(declare-fun res!426803 () Bool)

(declare-fun e!378094 () Bool)

(assert (=> b!658154 (=> (not res!426803) (not e!378094))))

(declare-datatypes ((array!38738 0))(
  ( (array!38739 (arr!18566 (Array (_ BitVec 32) (_ BitVec 64))) (size!18930 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38738)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38738 (_ BitVec 32)) Bool)

(assert (=> b!658154 (= res!426803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658155 () Bool)

(declare-fun e!378097 () Bool)

(declare-fun e!378098 () Bool)

(assert (=> b!658155 (= e!378097 (not e!378098))))

(declare-fun res!426815 () Bool)

(assert (=> b!658155 (=> res!426815 e!378098)))

(declare-datatypes ((SeekEntryResult!7006 0))(
  ( (MissingZero!7006 (index!30389 (_ BitVec 32))) (Found!7006 (index!30390 (_ BitVec 32))) (Intermediate!7006 (undefined!7818 Bool) (index!30391 (_ BitVec 32)) (x!59177 (_ BitVec 32))) (Undefined!7006) (MissingVacant!7006 (index!30392 (_ BitVec 32))) )
))
(declare-fun lt!307631 () SeekEntryResult!7006)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!658155 (= res!426815 (not (= lt!307631 (MissingVacant!7006 vacantSpotIndex!68))))))

(declare-datatypes ((Unit!22814 0))(
  ( (Unit!22815) )
))
(declare-fun lt!307642 () Unit!22814)

(declare-fun e!378093 () Unit!22814)

(assert (=> b!658155 (= lt!307642 e!378093)))

(declare-fun c!76046 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658155 (= c!76046 (= lt!307631 (Found!7006 index!984)))))

(declare-fun lt!307634 () Unit!22814)

(declare-fun e!378101 () Unit!22814)

(assert (=> b!658155 (= lt!307634 e!378101)))

(declare-fun c!76044 () Bool)

(assert (=> b!658155 (= c!76044 (= lt!307631 Undefined!7006))))

(declare-fun lt!307636 () (_ BitVec 64))

(declare-fun lt!307644 () array!38738)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38738 (_ BitVec 32)) SeekEntryResult!7006)

(assert (=> b!658155 (= lt!307631 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307636 lt!307644 mask!3053))))

(declare-fun e!378096 () Bool)

(assert (=> b!658155 e!378096))

(declare-fun res!426811 () Bool)

(assert (=> b!658155 (=> (not res!426811) (not e!378096))))

(declare-fun lt!307637 () SeekEntryResult!7006)

(declare-fun lt!307643 () (_ BitVec 32))

(assert (=> b!658155 (= res!426811 (= lt!307637 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307643 vacantSpotIndex!68 lt!307636 lt!307644 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!658155 (= lt!307637 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307643 vacantSpotIndex!68 (select (arr!18566 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!658155 (= lt!307636 (select (store (arr!18566 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307638 () Unit!22814)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38738 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22814)

(assert (=> b!658155 (= lt!307638 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307643 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658155 (= lt!307643 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658156 () Bool)

(assert (=> b!658156 false))

(declare-fun lt!307635 () Unit!22814)

(declare-datatypes ((List!12607 0))(
  ( (Nil!12604) (Cons!12603 (h!13648 (_ BitVec 64)) (t!18835 List!12607)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38738 (_ BitVec 64) (_ BitVec 32) List!12607) Unit!22814)

(assert (=> b!658156 (= lt!307635 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307644 (select (arr!18566 a!2986) j!136) j!136 Nil!12604))))

(declare-fun arrayNoDuplicates!0 (array!38738 (_ BitVec 32) List!12607) Bool)

(assert (=> b!658156 (arrayNoDuplicates!0 lt!307644 j!136 Nil!12604)))

(declare-fun lt!307641 () Unit!22814)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38738 (_ BitVec 32) (_ BitVec 32)) Unit!22814)

(assert (=> b!658156 (= lt!307641 (lemmaNoDuplicateFromThenFromBigger!0 lt!307644 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658156 (arrayNoDuplicates!0 lt!307644 #b00000000000000000000000000000000 Nil!12604)))

(declare-fun lt!307645 () Unit!22814)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38738 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12607) Unit!22814)

(assert (=> b!658156 (= lt!307645 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12604))))

(declare-fun arrayContainsKey!0 (array!38738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658156 (arrayContainsKey!0 lt!307644 (select (arr!18566 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307633 () Unit!22814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38738 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22814)

(assert (=> b!658156 (= lt!307633 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307644 (select (arr!18566 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378100 () Unit!22814)

(declare-fun Unit!22816 () Unit!22814)

(assert (=> b!658156 (= e!378100 Unit!22816)))

(declare-fun e!378092 () Bool)

(declare-fun b!658158 () Bool)

(assert (=> b!658158 (= e!378092 (arrayContainsKey!0 lt!307644 (select (arr!18566 a!2986) j!136) index!984))))

(declare-fun b!658159 () Bool)

(declare-fun e!378095 () Bool)

(assert (=> b!658159 (= e!378094 e!378095)))

(declare-fun res!426802 () Bool)

(assert (=> b!658159 (=> (not res!426802) (not e!378095))))

(assert (=> b!658159 (= res!426802 (= (select (store (arr!18566 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658159 (= lt!307644 (array!38739 (store (arr!18566 a!2986) i!1108 k!1786) (size!18930 a!2986)))))

(declare-fun b!658160 () Bool)

(declare-fun e!378091 () Unit!22814)

(declare-fun Unit!22817 () Unit!22814)

(assert (=> b!658160 (= e!378091 Unit!22817)))

(declare-fun e!378089 () Bool)

(declare-fun b!658161 () Bool)

(assert (=> b!658161 (= e!378089 (arrayContainsKey!0 lt!307644 (select (arr!18566 a!2986) j!136) index!984))))

(declare-fun b!658162 () Bool)

(assert (=> b!658162 (= e!378098 true)))

(assert (=> b!658162 (= (select (store (arr!18566 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!658163 () Bool)

(assert (=> b!658163 (= e!378095 e!378097)))

(declare-fun res!426818 () Bool)

(assert (=> b!658163 (=> (not res!426818) (not e!378097))))

(declare-fun lt!307639 () SeekEntryResult!7006)

(assert (=> b!658163 (= res!426818 (and (= lt!307639 (Found!7006 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18566 a!2986) index!984) (select (arr!18566 a!2986) j!136))) (not (= (select (arr!18566 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658163 (= lt!307639 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18566 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658164 () Bool)

(declare-fun Unit!22818 () Unit!22814)

(assert (=> b!658164 (= e!378101 Unit!22818)))

(declare-fun b!658165 () Bool)

(declare-fun Unit!22819 () Unit!22814)

(assert (=> b!658165 (= e!378093 Unit!22819)))

(declare-fun res!426805 () Bool)

(assert (=> b!658165 (= res!426805 (= (select (store (arr!18566 a!2986) i!1108 k!1786) index!984) (select (arr!18566 a!2986) j!136)))))

(declare-fun e!378102 () Bool)

(assert (=> b!658165 (=> (not res!426805) (not e!378102))))

(assert (=> b!658165 e!378102))

(declare-fun c!76043 () Bool)

(assert (=> b!658165 (= c!76043 (bvslt j!136 index!984))))

(declare-fun lt!307630 () Unit!22814)

(assert (=> b!658165 (= lt!307630 e!378100)))

(declare-fun c!76045 () Bool)

(assert (=> b!658165 (= c!76045 (bvslt index!984 j!136))))

(declare-fun lt!307629 () Unit!22814)

(assert (=> b!658165 (= lt!307629 e!378091)))

(assert (=> b!658165 false))

(declare-fun b!658166 () Bool)

(declare-fun res!426812 () Bool)

(declare-fun e!378088 () Bool)

(assert (=> b!658166 (=> (not res!426812) (not e!378088))))

(assert (=> b!658166 (= res!426812 (and (= (size!18930 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18930 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18930 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658167 () Bool)

(declare-fun res!426806 () Bool)

(assert (=> b!658167 (=> (not res!426806) (not e!378088))))

(assert (=> b!658167 (= res!426806 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658168 () Bool)

(assert (=> b!658168 (= e!378096 (= lt!307639 lt!307637))))

(declare-fun b!658157 () Bool)

(declare-fun res!426817 () Bool)

(assert (=> b!658157 (=> (not res!426817) (not e!378094))))

(assert (=> b!658157 (= res!426817 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12604))))

(declare-fun res!426814 () Bool)

(assert (=> start!59580 (=> (not res!426814) (not e!378088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59580 (= res!426814 (validMask!0 mask!3053))))

(assert (=> start!59580 e!378088))

(assert (=> start!59580 true))

(declare-fun array_inv!14362 (array!38738) Bool)

(assert (=> start!59580 (array_inv!14362 a!2986)))

(declare-fun b!658169 () Bool)

(declare-fun Unit!22820 () Unit!22814)

(assert (=> b!658169 (= e!378101 Unit!22820)))

(assert (=> b!658169 false))

(declare-fun b!658170 () Bool)

(declare-fun res!426810 () Bool)

(assert (=> b!658170 (=> (not res!426810) (not e!378088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658170 (= res!426810 (validKeyInArray!0 k!1786))))

(declare-fun b!658171 () Bool)

(declare-fun res!426807 () Bool)

(assert (=> b!658171 (= res!426807 (bvsge j!136 index!984))))

(declare-fun e!378090 () Bool)

(assert (=> b!658171 (=> res!426807 e!378090)))

(assert (=> b!658171 (= e!378102 e!378090)))

(declare-fun b!658172 () Bool)

(declare-fun res!426808 () Bool)

(assert (=> b!658172 (=> (not res!426808) (not e!378088))))

(assert (=> b!658172 (= res!426808 (validKeyInArray!0 (select (arr!18566 a!2986) j!136)))))

(declare-fun b!658173 () Bool)

(declare-fun Unit!22821 () Unit!22814)

(assert (=> b!658173 (= e!378093 Unit!22821)))

(declare-fun b!658174 () Bool)

(declare-fun res!426804 () Bool)

(assert (=> b!658174 (= res!426804 (arrayContainsKey!0 lt!307644 (select (arr!18566 a!2986) j!136) j!136))))

(assert (=> b!658174 (=> (not res!426804) (not e!378089))))

(assert (=> b!658174 (= e!378090 e!378089)))

(declare-fun b!658175 () Bool)

(declare-fun Unit!22822 () Unit!22814)

(assert (=> b!658175 (= e!378100 Unit!22822)))

(declare-fun b!658176 () Bool)

(assert (=> b!658176 false))

(declare-fun lt!307648 () Unit!22814)

(assert (=> b!658176 (= lt!307648 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307644 (select (arr!18566 a!2986) j!136) index!984 Nil!12604))))

(assert (=> b!658176 (arrayNoDuplicates!0 lt!307644 index!984 Nil!12604)))

(declare-fun lt!307640 () Unit!22814)

(assert (=> b!658176 (= lt!307640 (lemmaNoDuplicateFromThenFromBigger!0 lt!307644 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658176 (arrayNoDuplicates!0 lt!307644 #b00000000000000000000000000000000 Nil!12604)))

(declare-fun lt!307647 () Unit!22814)

(assert (=> b!658176 (= lt!307647 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12604))))

(assert (=> b!658176 (arrayContainsKey!0 lt!307644 (select (arr!18566 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307646 () Unit!22814)

(assert (=> b!658176 (= lt!307646 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307644 (select (arr!18566 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658176 e!378092))

(declare-fun res!426809 () Bool)

(assert (=> b!658176 (=> (not res!426809) (not e!378092))))

(assert (=> b!658176 (= res!426809 (arrayContainsKey!0 lt!307644 (select (arr!18566 a!2986) j!136) j!136))))

(declare-fun Unit!22823 () Unit!22814)

(assert (=> b!658176 (= e!378091 Unit!22823)))

(declare-fun b!658177 () Bool)

(assert (=> b!658177 (= e!378088 e!378094)))

(declare-fun res!426816 () Bool)

(assert (=> b!658177 (=> (not res!426816) (not e!378094))))

(declare-fun lt!307632 () SeekEntryResult!7006)

(assert (=> b!658177 (= res!426816 (or (= lt!307632 (MissingZero!7006 i!1108)) (= lt!307632 (MissingVacant!7006 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38738 (_ BitVec 32)) SeekEntryResult!7006)

(assert (=> b!658177 (= lt!307632 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!658178 () Bool)

(declare-fun res!426813 () Bool)

(assert (=> b!658178 (=> (not res!426813) (not e!378094))))

(assert (=> b!658178 (= res!426813 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18566 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59580 res!426814) b!658166))

(assert (= (and b!658166 res!426812) b!658172))

(assert (= (and b!658172 res!426808) b!658170))

(assert (= (and b!658170 res!426810) b!658167))

(assert (= (and b!658167 res!426806) b!658177))

(assert (= (and b!658177 res!426816) b!658154))

(assert (= (and b!658154 res!426803) b!658157))

(assert (= (and b!658157 res!426817) b!658178))

(assert (= (and b!658178 res!426813) b!658159))

(assert (= (and b!658159 res!426802) b!658163))

(assert (= (and b!658163 res!426818) b!658155))

(assert (= (and b!658155 res!426811) b!658168))

(assert (= (and b!658155 c!76044) b!658169))

(assert (= (and b!658155 (not c!76044)) b!658164))

(assert (= (and b!658155 c!76046) b!658165))

(assert (= (and b!658155 (not c!76046)) b!658173))

(assert (= (and b!658165 res!426805) b!658171))

(assert (= (and b!658171 (not res!426807)) b!658174))

(assert (= (and b!658174 res!426804) b!658161))

(assert (= (and b!658165 c!76043) b!658156))

(assert (= (and b!658165 (not c!76043)) b!658175))

(assert (= (and b!658165 c!76045) b!658176))

(assert (= (and b!658165 (not c!76045)) b!658160))

(assert (= (and b!658176 res!426809) b!658158))

(assert (= (and b!658155 (not res!426815)) b!658162))

(declare-fun m!631147 () Bool)

(assert (=> b!658163 m!631147))

(declare-fun m!631149 () Bool)

(assert (=> b!658163 m!631149))

(assert (=> b!658163 m!631149))

(declare-fun m!631151 () Bool)

(assert (=> b!658163 m!631151))

(assert (=> b!658172 m!631149))

(assert (=> b!658172 m!631149))

(declare-fun m!631153 () Bool)

(assert (=> b!658172 m!631153))

(assert (=> b!658156 m!631149))

(declare-fun m!631155 () Bool)

(assert (=> b!658156 m!631155))

(declare-fun m!631157 () Bool)

(assert (=> b!658156 m!631157))

(assert (=> b!658156 m!631149))

(declare-fun m!631159 () Bool)

(assert (=> b!658156 m!631159))

(assert (=> b!658156 m!631149))

(declare-fun m!631161 () Bool)

(assert (=> b!658156 m!631161))

(declare-fun m!631163 () Bool)

(assert (=> b!658156 m!631163))

(assert (=> b!658156 m!631149))

(declare-fun m!631165 () Bool)

(assert (=> b!658156 m!631165))

(declare-fun m!631167 () Bool)

(assert (=> b!658156 m!631167))

(declare-fun m!631169 () Bool)

(assert (=> b!658165 m!631169))

(declare-fun m!631171 () Bool)

(assert (=> b!658165 m!631171))

(assert (=> b!658165 m!631149))

(declare-fun m!631173 () Bool)

(assert (=> start!59580 m!631173))

(declare-fun m!631175 () Bool)

(assert (=> start!59580 m!631175))

(declare-fun m!631177 () Bool)

(assert (=> b!658157 m!631177))

(declare-fun m!631179 () Bool)

(assert (=> b!658154 m!631179))

(assert (=> b!658176 m!631149))

(declare-fun m!631181 () Bool)

(assert (=> b!658176 m!631181))

(assert (=> b!658176 m!631149))

(assert (=> b!658176 m!631149))

(declare-fun m!631183 () Bool)

(assert (=> b!658176 m!631183))

(assert (=> b!658176 m!631149))

(declare-fun m!631185 () Bool)

(assert (=> b!658176 m!631185))

(declare-fun m!631187 () Bool)

(assert (=> b!658176 m!631187))

(declare-fun m!631189 () Bool)

(assert (=> b!658176 m!631189))

(assert (=> b!658176 m!631167))

(assert (=> b!658176 m!631149))

(declare-fun m!631191 () Bool)

(assert (=> b!658176 m!631191))

(assert (=> b!658176 m!631163))

(declare-fun m!631193 () Bool)

(assert (=> b!658170 m!631193))

(assert (=> b!658159 m!631169))

(declare-fun m!631195 () Bool)

(assert (=> b!658159 m!631195))

(assert (=> b!658158 m!631149))

(assert (=> b!658158 m!631149))

(declare-fun m!631197 () Bool)

(assert (=> b!658158 m!631197))

(assert (=> b!658161 m!631149))

(assert (=> b!658161 m!631149))

(assert (=> b!658161 m!631197))

(assert (=> b!658162 m!631169))

(assert (=> b!658162 m!631171))

(declare-fun m!631199 () Bool)

(assert (=> b!658167 m!631199))

(declare-fun m!631201 () Bool)

(assert (=> b!658155 m!631201))

(assert (=> b!658155 m!631149))

(assert (=> b!658155 m!631169))

(assert (=> b!658155 m!631149))

(declare-fun m!631203 () Bool)

(assert (=> b!658155 m!631203))

(declare-fun m!631205 () Bool)

(assert (=> b!658155 m!631205))

(declare-fun m!631207 () Bool)

(assert (=> b!658155 m!631207))

(declare-fun m!631209 () Bool)

(assert (=> b!658155 m!631209))

(declare-fun m!631211 () Bool)

(assert (=> b!658155 m!631211))

(declare-fun m!631213 () Bool)

(assert (=> b!658177 m!631213))

(assert (=> b!658174 m!631149))

(assert (=> b!658174 m!631149))

(assert (=> b!658174 m!631183))

(declare-fun m!631215 () Bool)

(assert (=> b!658178 m!631215))

(push 1)

