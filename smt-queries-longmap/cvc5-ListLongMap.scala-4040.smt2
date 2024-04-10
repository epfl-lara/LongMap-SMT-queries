; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55114 () Bool)

(assert start!55114)

(declare-fun b!603133 () Bool)

(declare-fun e!345009 () Bool)

(declare-fun e!345014 () Bool)

(assert (=> b!603133 (= e!345009 (not e!345014))))

(declare-fun res!387285 () Bool)

(assert (=> b!603133 (=> res!387285 e!345014)))

(declare-datatypes ((SeekEntryResult!6290 0))(
  ( (MissingZero!6290 (index!27423 (_ BitVec 32))) (Found!6290 (index!27424 (_ BitVec 32))) (Intermediate!6290 (undefined!7102 Bool) (index!27425 (_ BitVec 32)) (x!56227 (_ BitVec 32))) (Undefined!6290) (MissingVacant!6290 (index!27426 (_ BitVec 32))) )
))
(declare-fun lt!274805 () SeekEntryResult!6290)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603133 (= res!387285 (not (= lt!274805 (Found!6290 index!984))))))

(declare-datatypes ((Unit!19120 0))(
  ( (Unit!19121) )
))
(declare-fun lt!274801 () Unit!19120)

(declare-fun e!345008 () Unit!19120)

(assert (=> b!603133 (= lt!274801 e!345008)))

(declare-fun c!68293 () Bool)

(assert (=> b!603133 (= c!68293 (= lt!274805 Undefined!6290))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37187 0))(
  ( (array!37188 (arr!17850 (Array (_ BitVec 32) (_ BitVec 64))) (size!18214 (_ BitVec 32))) )
))
(declare-fun lt!274794 () array!37187)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!274793 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37187 (_ BitVec 32)) SeekEntryResult!6290)

(assert (=> b!603133 (= lt!274805 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274793 lt!274794 mask!3053))))

(declare-fun e!345011 () Bool)

(assert (=> b!603133 e!345011))

(declare-fun res!387283 () Bool)

(assert (=> b!603133 (=> (not res!387283) (not e!345011))))

(declare-fun lt!274798 () (_ BitVec 32))

(declare-fun lt!274795 () SeekEntryResult!6290)

(assert (=> b!603133 (= res!387283 (= lt!274795 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274798 vacantSpotIndex!68 lt!274793 lt!274794 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37187)

(assert (=> b!603133 (= lt!274795 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274798 vacantSpotIndex!68 (select (arr!17850 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!603133 (= lt!274793 (select (store (arr!17850 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274802 () Unit!19120)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19120)

(assert (=> b!603133 (= lt!274802 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274798 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603133 (= lt!274798 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603134 () Bool)

(declare-fun e!345006 () Bool)

(assert (=> b!603134 (= e!345006 e!345009)))

(declare-fun res!387284 () Bool)

(assert (=> b!603134 (=> (not res!387284) (not e!345009))))

(declare-fun lt!274806 () SeekEntryResult!6290)

(assert (=> b!603134 (= res!387284 (and (= lt!274806 (Found!6290 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17850 a!2986) index!984) (select (arr!17850 a!2986) j!136))) (not (= (select (arr!17850 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603134 (= lt!274806 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17850 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!345002 () Bool)

(declare-fun b!603135 () Bool)

(declare-fun arrayContainsKey!0 (array!37187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603135 (= e!345002 (arrayContainsKey!0 lt!274794 (select (arr!17850 a!2986) j!136) index!984))))

(declare-fun b!603136 () Bool)

(declare-fun res!387281 () Bool)

(declare-fun e!345005 () Bool)

(assert (=> b!603136 (=> (not res!387281) (not e!345005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603136 (= res!387281 (validKeyInArray!0 (select (arr!17850 a!2986) j!136)))))

(declare-fun b!603137 () Bool)

(declare-fun e!345015 () Unit!19120)

(declare-fun Unit!19122 () Unit!19120)

(assert (=> b!603137 (= e!345015 Unit!19122)))

(declare-fun e!345007 () Bool)

(declare-fun b!603138 () Bool)

(assert (=> b!603138 (= e!345007 (arrayContainsKey!0 lt!274794 (select (arr!17850 a!2986) j!136) index!984))))

(declare-fun b!603139 () Bool)

(declare-fun e!345003 () Bool)

(assert (=> b!603139 (= e!345005 e!345003)))

(declare-fun res!387293 () Bool)

(assert (=> b!603139 (=> (not res!387293) (not e!345003))))

(declare-fun lt!274799 () SeekEntryResult!6290)

(assert (=> b!603139 (= res!387293 (or (= lt!274799 (MissingZero!6290 i!1108)) (= lt!274799 (MissingVacant!6290 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37187 (_ BitVec 32)) SeekEntryResult!6290)

(assert (=> b!603139 (= lt!274799 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!387297 () Bool)

(assert (=> start!55114 (=> (not res!387297) (not e!345005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55114 (= res!387297 (validMask!0 mask!3053))))

(assert (=> start!55114 e!345005))

(assert (=> start!55114 true))

(declare-fun array_inv!13646 (array!37187) Bool)

(assert (=> start!55114 (array_inv!13646 a!2986)))

(declare-fun b!603140 () Bool)

(declare-fun res!387288 () Bool)

(assert (=> b!603140 (=> (not res!387288) (not e!345005))))

(assert (=> b!603140 (= res!387288 (validKeyInArray!0 k!1786))))

(declare-fun b!603141 () Bool)

(declare-fun e!345013 () Bool)

(assert (=> b!603141 (= e!345013 e!345007)))

(declare-fun res!387296 () Bool)

(assert (=> b!603141 (=> (not res!387296) (not e!345007))))

(assert (=> b!603141 (= res!387296 (arrayContainsKey!0 lt!274794 (select (arr!17850 a!2986) j!136) j!136))))

(declare-fun b!603142 () Bool)

(declare-fun Unit!19123 () Unit!19120)

(assert (=> b!603142 (= e!345008 Unit!19123)))

(assert (=> b!603142 false))

(declare-fun b!603143 () Bool)

(assert (=> b!603143 (= e!345003 e!345006)))

(declare-fun res!387295 () Bool)

(assert (=> b!603143 (=> (not res!387295) (not e!345006))))

(assert (=> b!603143 (= res!387295 (= (select (store (arr!17850 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603143 (= lt!274794 (array!37188 (store (arr!17850 a!2986) i!1108 k!1786) (size!18214 a!2986)))))

(declare-fun b!603144 () Bool)

(declare-fun e!345004 () Bool)

(declare-fun e!345001 () Bool)

(assert (=> b!603144 (= e!345004 e!345001)))

(declare-fun res!387291 () Bool)

(assert (=> b!603144 (=> res!387291 e!345001)))

(assert (=> b!603144 (= res!387291 (bvsge index!984 j!136))))

(declare-fun lt!274797 () Unit!19120)

(assert (=> b!603144 (= lt!274797 e!345015)))

(declare-fun c!68294 () Bool)

(assert (=> b!603144 (= c!68294 (bvslt j!136 index!984))))

(declare-fun b!603145 () Bool)

(declare-fun Unit!19124 () Unit!19120)

(assert (=> b!603145 (= e!345008 Unit!19124)))

(declare-fun b!603146 () Bool)

(declare-fun res!387292 () Bool)

(assert (=> b!603146 (=> (not res!387292) (not e!345003))))

(assert (=> b!603146 (= res!387292 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17850 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603147 () Bool)

(declare-fun Unit!19125 () Unit!19120)

(assert (=> b!603147 (= e!345015 Unit!19125)))

(declare-fun lt!274800 () Unit!19120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37187 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19120)

(assert (=> b!603147 (= lt!274800 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274794 (select (arr!17850 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603147 (arrayContainsKey!0 lt!274794 (select (arr!17850 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274807 () Unit!19120)

(declare-datatypes ((List!11891 0))(
  ( (Nil!11888) (Cons!11887 (h!12932 (_ BitVec 64)) (t!18119 List!11891)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37187 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11891) Unit!19120)

(assert (=> b!603147 (= lt!274807 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11888))))

(declare-fun arrayNoDuplicates!0 (array!37187 (_ BitVec 32) List!11891) Bool)

(assert (=> b!603147 (arrayNoDuplicates!0 lt!274794 #b00000000000000000000000000000000 Nil!11888)))

(declare-fun lt!274796 () Unit!19120)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37187 (_ BitVec 32) (_ BitVec 32)) Unit!19120)

(assert (=> b!603147 (= lt!274796 (lemmaNoDuplicateFromThenFromBigger!0 lt!274794 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603147 (arrayNoDuplicates!0 lt!274794 j!136 Nil!11888)))

(declare-fun lt!274803 () Unit!19120)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37187 (_ BitVec 64) (_ BitVec 32) List!11891) Unit!19120)

(assert (=> b!603147 (= lt!274803 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274794 (select (arr!17850 a!2986) j!136) j!136 Nil!11888))))

(assert (=> b!603147 false))

(declare-fun b!603148 () Bool)

(declare-fun res!387290 () Bool)

(assert (=> b!603148 (=> (not res!387290) (not e!345005))))

(assert (=> b!603148 (= res!387290 (and (= (size!18214 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18214 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18214 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603149 () Bool)

(assert (=> b!603149 (= e!345014 e!345004)))

(declare-fun res!387282 () Bool)

(assert (=> b!603149 (=> res!387282 e!345004)))

(declare-fun lt!274804 () (_ BitVec 64))

(assert (=> b!603149 (= res!387282 (or (not (= (select (arr!17850 a!2986) j!136) lt!274793)) (not (= (select (arr!17850 a!2986) j!136) lt!274804))))))

(declare-fun e!345012 () Bool)

(assert (=> b!603149 e!345012))

(declare-fun res!387298 () Bool)

(assert (=> b!603149 (=> (not res!387298) (not e!345012))))

(assert (=> b!603149 (= res!387298 (= lt!274804 (select (arr!17850 a!2986) j!136)))))

(assert (=> b!603149 (= lt!274804 (select (store (arr!17850 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603150 () Bool)

(declare-fun res!387287 () Bool)

(assert (=> b!603150 (=> (not res!387287) (not e!345003))))

(assert (=> b!603150 (= res!387287 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11888))))

(declare-fun b!603151 () Bool)

(declare-fun res!387289 () Bool)

(assert (=> b!603151 (=> (not res!387289) (not e!345005))))

(assert (=> b!603151 (= res!387289 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603152 () Bool)

(assert (=> b!603152 (= e!345012 e!345013)))

(declare-fun res!387294 () Bool)

(assert (=> b!603152 (=> res!387294 e!345013)))

(assert (=> b!603152 (= res!387294 (or (not (= (select (arr!17850 a!2986) j!136) lt!274793)) (not (= (select (arr!17850 a!2986) j!136) lt!274804)) (bvsge j!136 index!984)))))

(declare-fun b!603153 () Bool)

(assert (=> b!603153 (= e!345011 (= lt!274806 lt!274795))))

(declare-fun b!603154 () Bool)

(declare-fun res!387286 () Bool)

(assert (=> b!603154 (=> (not res!387286) (not e!345003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37187 (_ BitVec 32)) Bool)

(assert (=> b!603154 (= res!387286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603155 () Bool)

(assert (=> b!603155 (= e!345001 true)))

(assert (=> b!603155 e!345002))

(declare-fun res!387299 () Bool)

(assert (=> b!603155 (=> (not res!387299) (not e!345002))))

(assert (=> b!603155 (= res!387299 (arrayContainsKey!0 lt!274794 (select (arr!17850 a!2986) j!136) j!136))))

(assert (= (and start!55114 res!387297) b!603148))

(assert (= (and b!603148 res!387290) b!603136))

(assert (= (and b!603136 res!387281) b!603140))

(assert (= (and b!603140 res!387288) b!603151))

(assert (= (and b!603151 res!387289) b!603139))

(assert (= (and b!603139 res!387293) b!603154))

(assert (= (and b!603154 res!387286) b!603150))

(assert (= (and b!603150 res!387287) b!603146))

(assert (= (and b!603146 res!387292) b!603143))

(assert (= (and b!603143 res!387295) b!603134))

(assert (= (and b!603134 res!387284) b!603133))

(assert (= (and b!603133 res!387283) b!603153))

(assert (= (and b!603133 c!68293) b!603142))

(assert (= (and b!603133 (not c!68293)) b!603145))

(assert (= (and b!603133 (not res!387285)) b!603149))

(assert (= (and b!603149 res!387298) b!603152))

(assert (= (and b!603152 (not res!387294)) b!603141))

(assert (= (and b!603141 res!387296) b!603138))

(assert (= (and b!603149 (not res!387282)) b!603144))

(assert (= (and b!603144 c!68294) b!603147))

(assert (= (and b!603144 (not c!68294)) b!603137))

(assert (= (and b!603144 (not res!387291)) b!603155))

(assert (= (and b!603155 res!387299) b!603135))

(declare-fun m!580193 () Bool)

(assert (=> b!603152 m!580193))

(assert (=> b!603136 m!580193))

(assert (=> b!603136 m!580193))

(declare-fun m!580195 () Bool)

(assert (=> b!603136 m!580195))

(assert (=> b!603155 m!580193))

(assert (=> b!603155 m!580193))

(declare-fun m!580197 () Bool)

(assert (=> b!603155 m!580197))

(assert (=> b!603135 m!580193))

(assert (=> b!603135 m!580193))

(declare-fun m!580199 () Bool)

(assert (=> b!603135 m!580199))

(declare-fun m!580201 () Bool)

(assert (=> b!603134 m!580201))

(assert (=> b!603134 m!580193))

(assert (=> b!603134 m!580193))

(declare-fun m!580203 () Bool)

(assert (=> b!603134 m!580203))

(declare-fun m!580205 () Bool)

(assert (=> b!603133 m!580205))

(declare-fun m!580207 () Bool)

(assert (=> b!603133 m!580207))

(declare-fun m!580209 () Bool)

(assert (=> b!603133 m!580209))

(assert (=> b!603133 m!580193))

(declare-fun m!580211 () Bool)

(assert (=> b!603133 m!580211))

(assert (=> b!603133 m!580193))

(declare-fun m!580213 () Bool)

(assert (=> b!603133 m!580213))

(declare-fun m!580215 () Bool)

(assert (=> b!603133 m!580215))

(declare-fun m!580217 () Bool)

(assert (=> b!603133 m!580217))

(declare-fun m!580219 () Bool)

(assert (=> b!603154 m!580219))

(declare-fun m!580221 () Bool)

(assert (=> b!603150 m!580221))

(assert (=> b!603143 m!580211))

(declare-fun m!580223 () Bool)

(assert (=> b!603143 m!580223))

(declare-fun m!580225 () Bool)

(assert (=> b!603151 m!580225))

(declare-fun m!580227 () Bool)

(assert (=> b!603146 m!580227))

(declare-fun m!580229 () Bool)

(assert (=> b!603139 m!580229))

(assert (=> b!603147 m!580193))

(declare-fun m!580231 () Bool)

(assert (=> b!603147 m!580231))

(assert (=> b!603147 m!580193))

(declare-fun m!580233 () Bool)

(assert (=> b!603147 m!580233))

(declare-fun m!580235 () Bool)

(assert (=> b!603147 m!580235))

(declare-fun m!580237 () Bool)

(assert (=> b!603147 m!580237))

(assert (=> b!603147 m!580193))

(declare-fun m!580239 () Bool)

(assert (=> b!603147 m!580239))

(assert (=> b!603147 m!580193))

(declare-fun m!580241 () Bool)

(assert (=> b!603147 m!580241))

(declare-fun m!580243 () Bool)

(assert (=> b!603147 m!580243))

(assert (=> b!603138 m!580193))

(assert (=> b!603138 m!580193))

(assert (=> b!603138 m!580199))

(assert (=> b!603149 m!580193))

(assert (=> b!603149 m!580211))

(declare-fun m!580245 () Bool)

(assert (=> b!603149 m!580245))

(assert (=> b!603141 m!580193))

(assert (=> b!603141 m!580193))

(assert (=> b!603141 m!580197))

(declare-fun m!580247 () Bool)

(assert (=> b!603140 m!580247))

(declare-fun m!580249 () Bool)

(assert (=> start!55114 m!580249))

(declare-fun m!580251 () Bool)

(assert (=> start!55114 m!580251))

(push 1)

