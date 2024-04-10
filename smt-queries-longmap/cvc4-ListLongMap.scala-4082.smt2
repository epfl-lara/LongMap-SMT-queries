; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55994 () Bool)

(assert start!55994)

(declare-fun b!615144 () Bool)

(declare-fun e!352695 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!615144 (= e!352695 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!19908 0))(
  ( (Unit!19909) )
))
(declare-fun lt!282440 () Unit!19908)

(declare-fun e!352702 () Unit!19908)

(assert (=> b!615144 (= lt!282440 e!352702)))

(declare-fun c!69832 () Bool)

(declare-datatypes ((SeekEntryResult!6418 0))(
  ( (MissingZero!6418 (index!27956 (_ BitVec 32))) (Found!6418 (index!27957 (_ BitVec 32))) (Intermediate!6418 (undefined!7230 Bool) (index!27958 (_ BitVec 32)) (x!56754 (_ BitVec 32))) (Undefined!6418) (MissingVacant!6418 (index!27959 (_ BitVec 32))) )
))
(declare-fun lt!282454 () SeekEntryResult!6418)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615144 (= c!69832 (= lt!282454 (Found!6418 index!984)))))

(declare-fun lt!282438 () Unit!19908)

(declare-fun e!352697 () Unit!19908)

(assert (=> b!615144 (= lt!282438 e!352697)))

(declare-fun c!69830 () Bool)

(assert (=> b!615144 (= c!69830 (= lt!282454 Undefined!6418))))

(declare-fun lt!282453 () (_ BitVec 64))

(declare-datatypes ((array!37464 0))(
  ( (array!37465 (arr!17978 (Array (_ BitVec 32) (_ BitVec 64))) (size!18342 (_ BitVec 32))) )
))
(declare-fun lt!282446 () array!37464)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37464 (_ BitVec 32)) SeekEntryResult!6418)

(assert (=> b!615144 (= lt!282454 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282453 lt!282446 mask!3053))))

(declare-fun e!352704 () Bool)

(assert (=> b!615144 e!352704))

(declare-fun res!396233 () Bool)

(assert (=> b!615144 (=> (not res!396233) (not e!352704))))

(declare-fun lt!282439 () SeekEntryResult!6418)

(declare-fun lt!282456 () (_ BitVec 32))

(assert (=> b!615144 (= res!396233 (= lt!282439 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282456 vacantSpotIndex!68 lt!282453 lt!282446 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37464)

(assert (=> b!615144 (= lt!282439 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282456 vacantSpotIndex!68 (select (arr!17978 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!615144 (= lt!282453 (select (store (arr!17978 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282441 () Unit!19908)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19908)

(assert (=> b!615144 (= lt!282441 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282456 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615144 (= lt!282456 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615145 () Bool)

(declare-fun Unit!19910 () Unit!19908)

(assert (=> b!615145 (= e!352697 Unit!19910)))

(assert (=> b!615145 false))

(declare-fun b!615146 () Bool)

(declare-fun e!352694 () Unit!19908)

(declare-fun Unit!19911 () Unit!19908)

(assert (=> b!615146 (= e!352694 Unit!19911)))

(declare-fun b!615147 () Bool)

(declare-fun res!396223 () Bool)

(declare-fun e!352706 () Bool)

(assert (=> b!615147 (=> (not res!396223) (not e!352706))))

(assert (=> b!615147 (= res!396223 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17978 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615148 () Bool)

(declare-fun e!352707 () Bool)

(assert (=> b!615148 (= e!352707 e!352706)))

(declare-fun res!396229 () Bool)

(assert (=> b!615148 (=> (not res!396229) (not e!352706))))

(declare-fun lt!282449 () SeekEntryResult!6418)

(assert (=> b!615148 (= res!396229 (or (= lt!282449 (MissingZero!6418 i!1108)) (= lt!282449 (MissingVacant!6418 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37464 (_ BitVec 32)) SeekEntryResult!6418)

(assert (=> b!615148 (= lt!282449 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!615149 () Bool)

(declare-fun Unit!19912 () Unit!19908)

(assert (=> b!615149 (= e!352697 Unit!19912)))

(declare-fun b!615150 () Bool)

(declare-fun res!396231 () Bool)

(assert (=> b!615150 (= res!396231 (bvsge j!136 index!984))))

(declare-fun e!352696 () Bool)

(assert (=> b!615150 (=> res!396231 e!352696)))

(declare-fun e!352701 () Bool)

(assert (=> b!615150 (= e!352701 e!352696)))

(declare-fun b!615151 () Bool)

(assert (=> b!615151 false))

(declare-fun lt!282450 () Unit!19908)

(declare-datatypes ((List!12019 0))(
  ( (Nil!12016) (Cons!12015 (h!13060 (_ BitVec 64)) (t!18247 List!12019)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37464 (_ BitVec 64) (_ BitVec 32) List!12019) Unit!19908)

(assert (=> b!615151 (= lt!282450 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282446 (select (arr!17978 a!2986) j!136) index!984 Nil!12016))))

(declare-fun arrayNoDuplicates!0 (array!37464 (_ BitVec 32) List!12019) Bool)

(assert (=> b!615151 (arrayNoDuplicates!0 lt!282446 index!984 Nil!12016)))

(declare-fun lt!282444 () Unit!19908)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37464 (_ BitVec 32) (_ BitVec 32)) Unit!19908)

(assert (=> b!615151 (= lt!282444 (lemmaNoDuplicateFromThenFromBigger!0 lt!282446 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615151 (arrayNoDuplicates!0 lt!282446 #b00000000000000000000000000000000 Nil!12016)))

(declare-fun lt!282452 () Unit!19908)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12019) Unit!19908)

(assert (=> b!615151 (= lt!282452 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12016))))

(declare-fun arrayContainsKey!0 (array!37464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615151 (arrayContainsKey!0 lt!282446 (select (arr!17978 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282443 () Unit!19908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19908)

(assert (=> b!615151 (= lt!282443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282446 (select (arr!17978 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352705 () Bool)

(assert (=> b!615151 e!352705))

(declare-fun res!396224 () Bool)

(assert (=> b!615151 (=> (not res!396224) (not e!352705))))

(assert (=> b!615151 (= res!396224 (arrayContainsKey!0 lt!282446 (select (arr!17978 a!2986) j!136) j!136))))

(declare-fun Unit!19913 () Unit!19908)

(assert (=> b!615151 (= e!352694 Unit!19913)))

(declare-fun b!615152 () Bool)

(declare-fun res!396225 () Bool)

(assert (=> b!615152 (=> (not res!396225) (not e!352707))))

(assert (=> b!615152 (= res!396225 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615153 () Bool)

(declare-fun res!396228 () Bool)

(assert (=> b!615153 (=> (not res!396228) (not e!352707))))

(assert (=> b!615153 (= res!396228 (and (= (size!18342 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18342 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18342 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!396222 () Bool)

(declare-fun b!615154 () Bool)

(assert (=> b!615154 (= res!396222 (arrayContainsKey!0 lt!282446 (select (arr!17978 a!2986) j!136) j!136))))

(declare-fun e!352703 () Bool)

(assert (=> b!615154 (=> (not res!396222) (not e!352703))))

(assert (=> b!615154 (= e!352696 e!352703)))

(declare-fun b!615155 () Bool)

(declare-fun res!396221 () Bool)

(assert (=> b!615155 (=> (not res!396221) (not e!352707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615155 (= res!396221 (validKeyInArray!0 k!1786))))

(declare-fun b!615156 () Bool)

(assert (=> b!615156 false))

(declare-fun lt!282451 () Unit!19908)

(assert (=> b!615156 (= lt!282451 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282446 (select (arr!17978 a!2986) j!136) j!136 Nil!12016))))

(assert (=> b!615156 (arrayNoDuplicates!0 lt!282446 j!136 Nil!12016)))

(declare-fun lt!282442 () Unit!19908)

(assert (=> b!615156 (= lt!282442 (lemmaNoDuplicateFromThenFromBigger!0 lt!282446 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615156 (arrayNoDuplicates!0 lt!282446 #b00000000000000000000000000000000 Nil!12016)))

(declare-fun lt!282457 () Unit!19908)

(assert (=> b!615156 (= lt!282457 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12016))))

(assert (=> b!615156 (arrayContainsKey!0 lt!282446 (select (arr!17978 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282445 () Unit!19908)

(assert (=> b!615156 (= lt!282445 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282446 (select (arr!17978 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352700 () Unit!19908)

(declare-fun Unit!19914 () Unit!19908)

(assert (=> b!615156 (= e!352700 Unit!19914)))

(declare-fun b!615157 () Bool)

(assert (=> b!615157 (= e!352705 (arrayContainsKey!0 lt!282446 (select (arr!17978 a!2986) j!136) index!984))))

(declare-fun b!615158 () Bool)

(declare-fun Unit!19915 () Unit!19908)

(assert (=> b!615158 (= e!352702 Unit!19915)))

(declare-fun b!615159 () Bool)

(declare-fun lt!282447 () SeekEntryResult!6418)

(assert (=> b!615159 (= e!352704 (= lt!282447 lt!282439))))

(declare-fun b!615160 () Bool)

(declare-fun Unit!19916 () Unit!19908)

(assert (=> b!615160 (= e!352702 Unit!19916)))

(declare-fun res!396230 () Bool)

(assert (=> b!615160 (= res!396230 (= (select (store (arr!17978 a!2986) i!1108 k!1786) index!984) (select (arr!17978 a!2986) j!136)))))

(assert (=> b!615160 (=> (not res!396230) (not e!352701))))

(assert (=> b!615160 e!352701))

(declare-fun c!69831 () Bool)

(assert (=> b!615160 (= c!69831 (bvslt j!136 index!984))))

(declare-fun lt!282455 () Unit!19908)

(assert (=> b!615160 (= lt!282455 e!352700)))

(declare-fun c!69833 () Bool)

(assert (=> b!615160 (= c!69833 (bvslt index!984 j!136))))

(declare-fun lt!282448 () Unit!19908)

(assert (=> b!615160 (= lt!282448 e!352694)))

(assert (=> b!615160 false))

(declare-fun b!615161 () Bool)

(declare-fun res!396220 () Bool)

(assert (=> b!615161 (=> (not res!396220) (not e!352707))))

(assert (=> b!615161 (= res!396220 (validKeyInArray!0 (select (arr!17978 a!2986) j!136)))))

(declare-fun b!615162 () Bool)

(declare-fun e!352699 () Bool)

(assert (=> b!615162 (= e!352706 e!352699)))

(declare-fun res!396226 () Bool)

(assert (=> b!615162 (=> (not res!396226) (not e!352699))))

(assert (=> b!615162 (= res!396226 (= (select (store (arr!17978 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615162 (= lt!282446 (array!37465 (store (arr!17978 a!2986) i!1108 k!1786) (size!18342 a!2986)))))

(declare-fun b!615163 () Bool)

(declare-fun res!396227 () Bool)

(assert (=> b!615163 (=> (not res!396227) (not e!352706))))

(assert (=> b!615163 (= res!396227 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12016))))

(declare-fun b!615164 () Bool)

(assert (=> b!615164 (= e!352703 (arrayContainsKey!0 lt!282446 (select (arr!17978 a!2986) j!136) index!984))))

(declare-fun b!615165 () Bool)

(assert (=> b!615165 (= e!352699 e!352695)))

(declare-fun res!396219 () Bool)

(assert (=> b!615165 (=> (not res!396219) (not e!352695))))

(assert (=> b!615165 (= res!396219 (and (= lt!282447 (Found!6418 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17978 a!2986) index!984) (select (arr!17978 a!2986) j!136))) (not (= (select (arr!17978 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615165 (= lt!282447 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17978 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615166 () Bool)

(declare-fun res!396232 () Bool)

(assert (=> b!615166 (=> (not res!396232) (not e!352706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37464 (_ BitVec 32)) Bool)

(assert (=> b!615166 (= res!396232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615167 () Bool)

(declare-fun Unit!19917 () Unit!19908)

(assert (=> b!615167 (= e!352700 Unit!19917)))

(declare-fun res!396218 () Bool)

(assert (=> start!55994 (=> (not res!396218) (not e!352707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55994 (= res!396218 (validMask!0 mask!3053))))

(assert (=> start!55994 e!352707))

(assert (=> start!55994 true))

(declare-fun array_inv!13774 (array!37464) Bool)

(assert (=> start!55994 (array_inv!13774 a!2986)))

(assert (= (and start!55994 res!396218) b!615153))

(assert (= (and b!615153 res!396228) b!615161))

(assert (= (and b!615161 res!396220) b!615155))

(assert (= (and b!615155 res!396221) b!615152))

(assert (= (and b!615152 res!396225) b!615148))

(assert (= (and b!615148 res!396229) b!615166))

(assert (= (and b!615166 res!396232) b!615163))

(assert (= (and b!615163 res!396227) b!615147))

(assert (= (and b!615147 res!396223) b!615162))

(assert (= (and b!615162 res!396226) b!615165))

(assert (= (and b!615165 res!396219) b!615144))

(assert (= (and b!615144 res!396233) b!615159))

(assert (= (and b!615144 c!69830) b!615145))

(assert (= (and b!615144 (not c!69830)) b!615149))

(assert (= (and b!615144 c!69832) b!615160))

(assert (= (and b!615144 (not c!69832)) b!615158))

(assert (= (and b!615160 res!396230) b!615150))

(assert (= (and b!615150 (not res!396231)) b!615154))

(assert (= (and b!615154 res!396222) b!615164))

(assert (= (and b!615160 c!69831) b!615156))

(assert (= (and b!615160 (not c!69831)) b!615167))

(assert (= (and b!615160 c!69833) b!615151))

(assert (= (and b!615160 (not c!69833)) b!615146))

(assert (= (and b!615151 res!396224) b!615157))

(declare-fun m!591355 () Bool)

(assert (=> b!615144 m!591355))

(declare-fun m!591357 () Bool)

(assert (=> b!615144 m!591357))

(declare-fun m!591359 () Bool)

(assert (=> b!615144 m!591359))

(declare-fun m!591361 () Bool)

(assert (=> b!615144 m!591361))

(declare-fun m!591363 () Bool)

(assert (=> b!615144 m!591363))

(declare-fun m!591365 () Bool)

(assert (=> b!615144 m!591365))

(declare-fun m!591367 () Bool)

(assert (=> b!615144 m!591367))

(assert (=> b!615144 m!591361))

(declare-fun m!591369 () Bool)

(assert (=> b!615144 m!591369))

(declare-fun m!591371 () Bool)

(assert (=> b!615147 m!591371))

(assert (=> b!615162 m!591357))

(declare-fun m!591373 () Bool)

(assert (=> b!615162 m!591373))

(assert (=> b!615160 m!591357))

(declare-fun m!591375 () Bool)

(assert (=> b!615160 m!591375))

(assert (=> b!615160 m!591361))

(declare-fun m!591377 () Bool)

(assert (=> b!615155 m!591377))

(assert (=> b!615157 m!591361))

(assert (=> b!615157 m!591361))

(declare-fun m!591379 () Bool)

(assert (=> b!615157 m!591379))

(declare-fun m!591381 () Bool)

(assert (=> b!615148 m!591381))

(assert (=> b!615161 m!591361))

(assert (=> b!615161 m!591361))

(declare-fun m!591383 () Bool)

(assert (=> b!615161 m!591383))

(declare-fun m!591385 () Bool)

(assert (=> b!615166 m!591385))

(declare-fun m!591387 () Bool)

(assert (=> b!615156 m!591387))

(assert (=> b!615156 m!591361))

(declare-fun m!591389 () Bool)

(assert (=> b!615156 m!591389))

(declare-fun m!591391 () Bool)

(assert (=> b!615156 m!591391))

(declare-fun m!591393 () Bool)

(assert (=> b!615156 m!591393))

(assert (=> b!615156 m!591361))

(declare-fun m!591395 () Bool)

(assert (=> b!615156 m!591395))

(declare-fun m!591397 () Bool)

(assert (=> b!615156 m!591397))

(assert (=> b!615156 m!591361))

(declare-fun m!591399 () Bool)

(assert (=> b!615156 m!591399))

(assert (=> b!615156 m!591361))

(assert (=> b!615154 m!591361))

(assert (=> b!615154 m!591361))

(declare-fun m!591401 () Bool)

(assert (=> b!615154 m!591401))

(assert (=> b!615164 m!591361))

(assert (=> b!615164 m!591361))

(assert (=> b!615164 m!591379))

(declare-fun m!591403 () Bool)

(assert (=> b!615165 m!591403))

(assert (=> b!615165 m!591361))

(assert (=> b!615165 m!591361))

(declare-fun m!591405 () Bool)

(assert (=> b!615165 m!591405))

(assert (=> b!615151 m!591361))

(assert (=> b!615151 m!591401))

(assert (=> b!615151 m!591361))

(assert (=> b!615151 m!591361))

(declare-fun m!591407 () Bool)

(assert (=> b!615151 m!591407))

(declare-fun m!591409 () Bool)

(assert (=> b!615151 m!591409))

(assert (=> b!615151 m!591361))

(declare-fun m!591411 () Bool)

(assert (=> b!615151 m!591411))

(assert (=> b!615151 m!591361))

(declare-fun m!591413 () Bool)

(assert (=> b!615151 m!591413))

(assert (=> b!615151 m!591397))

(declare-fun m!591415 () Bool)

(assert (=> b!615151 m!591415))

(assert (=> b!615151 m!591393))

(declare-fun m!591417 () Bool)

(assert (=> b!615152 m!591417))

(declare-fun m!591419 () Bool)

(assert (=> start!55994 m!591419))

(declare-fun m!591421 () Bool)

(assert (=> start!55994 m!591421))

(declare-fun m!591423 () Bool)

(assert (=> b!615163 m!591423))

(push 1)

