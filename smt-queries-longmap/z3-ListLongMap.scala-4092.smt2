; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56052 () Bool)

(assert start!56052)

(declare-fun b!617273 () Bool)

(declare-fun res!397665 () Bool)

(declare-fun e!353959 () Bool)

(assert (=> b!617273 (=> (not res!397665) (not e!353959))))

(declare-datatypes ((array!37522 0))(
  ( (array!37523 (arr!18007 (Array (_ BitVec 32) (_ BitVec 64))) (size!18371 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37522)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617273 (= res!397665 (validKeyInArray!0 (select (arr!18007 a!2986) j!136)))))

(declare-fun b!617274 () Bool)

(declare-datatypes ((Unit!20198 0))(
  ( (Unit!20199) )
))
(declare-fun e!353964 () Unit!20198)

(declare-fun Unit!20200 () Unit!20198)

(assert (=> b!617274 (= e!353964 Unit!20200)))

(declare-fun b!617275 () Bool)

(declare-fun res!397660 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617275 (= res!397660 (bvsge j!136 index!984))))

(declare-fun e!353960 () Bool)

(assert (=> b!617275 (=> res!397660 e!353960)))

(declare-fun e!353954 () Bool)

(assert (=> b!617275 (= e!353954 e!353960)))

(declare-fun b!617276 () Bool)

(declare-fun res!397658 () Bool)

(declare-fun e!353961 () Bool)

(assert (=> b!617276 (=> (not res!397658) (not e!353961))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37522 (_ BitVec 32)) Bool)

(assert (=> b!617276 (= res!397658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617277 () Bool)

(assert (=> b!617277 false))

(declare-fun lt!284191 () Unit!20198)

(declare-fun lt!284185 () array!37522)

(declare-datatypes ((List!12048 0))(
  ( (Nil!12045) (Cons!12044 (h!13089 (_ BitVec 64)) (t!18276 List!12048)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37522 (_ BitVec 64) (_ BitVec 32) List!12048) Unit!20198)

(assert (=> b!617277 (= lt!284191 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284185 (select (arr!18007 a!2986) j!136) index!984 Nil!12045))))

(declare-fun arrayNoDuplicates!0 (array!37522 (_ BitVec 32) List!12048) Bool)

(assert (=> b!617277 (arrayNoDuplicates!0 lt!284185 index!984 Nil!12045)))

(declare-fun lt!284182 () Unit!20198)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37522 (_ BitVec 32) (_ BitVec 32)) Unit!20198)

(assert (=> b!617277 (= lt!284182 (lemmaNoDuplicateFromThenFromBigger!0 lt!284185 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617277 (arrayNoDuplicates!0 lt!284185 #b00000000000000000000000000000000 Nil!12045)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!284189 () Unit!20198)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37522 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12048) Unit!20198)

(assert (=> b!617277 (= lt!284189 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12045))))

(declare-fun arrayContainsKey!0 (array!37522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617277 (arrayContainsKey!0 lt!284185 (select (arr!18007 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284184 () Unit!20198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37522 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20198)

(assert (=> b!617277 (= lt!284184 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284185 (select (arr!18007 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353965 () Bool)

(assert (=> b!617277 e!353965))

(declare-fun res!397663 () Bool)

(assert (=> b!617277 (=> (not res!397663) (not e!353965))))

(assert (=> b!617277 (= res!397663 (arrayContainsKey!0 lt!284185 (select (arr!18007 a!2986) j!136) j!136))))

(declare-fun e!353966 () Unit!20198)

(declare-fun Unit!20201 () Unit!20198)

(assert (=> b!617277 (= e!353966 Unit!20201)))

(declare-fun b!617279 () Bool)

(declare-fun Unit!20202 () Unit!20198)

(assert (=> b!617279 (= e!353964 Unit!20202)))

(assert (=> b!617279 false))

(declare-fun b!617280 () Bool)

(declare-fun e!353953 () Unit!20198)

(declare-fun Unit!20203 () Unit!20198)

(assert (=> b!617280 (= e!353953 Unit!20203)))

(declare-fun b!617281 () Bool)

(declare-fun res!397651 () Bool)

(assert (=> b!617281 (=> (not res!397651) (not e!353961))))

(assert (=> b!617281 (= res!397651 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12045))))

(declare-fun b!617282 () Bool)

(declare-fun e!353962 () Bool)

(declare-fun e!353963 () Bool)

(assert (=> b!617282 (= e!353962 e!353963)))

(declare-fun res!397655 () Bool)

(assert (=> b!617282 (=> (not res!397655) (not e!353963))))

(declare-datatypes ((SeekEntryResult!6447 0))(
  ( (MissingZero!6447 (index!28072 (_ BitVec 32))) (Found!6447 (index!28073 (_ BitVec 32))) (Intermediate!6447 (undefined!7259 Bool) (index!28074 (_ BitVec 32)) (x!56863 (_ BitVec 32))) (Undefined!6447) (MissingVacant!6447 (index!28075 (_ BitVec 32))) )
))
(declare-fun lt!284196 () SeekEntryResult!6447)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617282 (= res!397655 (and (= lt!284196 (Found!6447 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18007 a!2986) index!984) (select (arr!18007 a!2986) j!136))) (not (= (select (arr!18007 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37522 (_ BitVec 32)) SeekEntryResult!6447)

(assert (=> b!617282 (= lt!284196 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18007 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!397657 () Bool)

(declare-fun b!617283 () Bool)

(assert (=> b!617283 (= res!397657 (arrayContainsKey!0 lt!284185 (select (arr!18007 a!2986) j!136) j!136))))

(declare-fun e!353956 () Bool)

(assert (=> b!617283 (=> (not res!397657) (not e!353956))))

(assert (=> b!617283 (= e!353960 e!353956)))

(declare-fun b!617284 () Bool)

(declare-fun res!397652 () Bool)

(assert (=> b!617284 (=> (not res!397652) (not e!353959))))

(assert (=> b!617284 (= res!397652 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617285 () Bool)

(assert (=> b!617285 (= e!353965 (arrayContainsKey!0 lt!284185 (select (arr!18007 a!2986) j!136) index!984))))

(declare-fun b!617286 () Bool)

(declare-fun e!353955 () Bool)

(assert (=> b!617286 (= e!353963 (not e!353955))))

(declare-fun res!397667 () Bool)

(assert (=> b!617286 (=> res!397667 e!353955)))

(declare-fun lt!284195 () SeekEntryResult!6447)

(assert (=> b!617286 (= res!397667 (not (= lt!284195 (MissingVacant!6447 vacantSpotIndex!68))))))

(declare-fun lt!284179 () Unit!20198)

(assert (=> b!617286 (= lt!284179 e!353953)))

(declare-fun c!70181 () Bool)

(assert (=> b!617286 (= c!70181 (= lt!284195 (Found!6447 index!984)))))

(declare-fun lt!284190 () Unit!20198)

(assert (=> b!617286 (= lt!284190 e!353964)))

(declare-fun c!70178 () Bool)

(assert (=> b!617286 (= c!70178 (= lt!284195 Undefined!6447))))

(declare-fun lt!284193 () (_ BitVec 64))

(assert (=> b!617286 (= lt!284195 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284193 lt!284185 mask!3053))))

(declare-fun e!353967 () Bool)

(assert (=> b!617286 e!353967))

(declare-fun res!397656 () Bool)

(assert (=> b!617286 (=> (not res!397656) (not e!353967))))

(declare-fun lt!284192 () (_ BitVec 32))

(declare-fun lt!284187 () SeekEntryResult!6447)

(assert (=> b!617286 (= res!397656 (= lt!284187 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284192 vacantSpotIndex!68 lt!284193 lt!284185 mask!3053)))))

(assert (=> b!617286 (= lt!284187 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284192 vacantSpotIndex!68 (select (arr!18007 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617286 (= lt!284193 (select (store (arr!18007 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284181 () Unit!20198)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37522 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20198)

(assert (=> b!617286 (= lt!284181 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284192 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617286 (= lt!284192 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617287 () Bool)

(assert (=> b!617287 (= e!353956 (arrayContainsKey!0 lt!284185 (select (arr!18007 a!2986) j!136) index!984))))

(declare-fun b!617288 () Bool)

(declare-fun Unit!20204 () Unit!20198)

(assert (=> b!617288 (= e!353953 Unit!20204)))

(declare-fun res!397659 () Bool)

(assert (=> b!617288 (= res!397659 (= (select (store (arr!18007 a!2986) i!1108 k0!1786) index!984) (select (arr!18007 a!2986) j!136)))))

(assert (=> b!617288 (=> (not res!397659) (not e!353954))))

(assert (=> b!617288 e!353954))

(declare-fun c!70179 () Bool)

(assert (=> b!617288 (= c!70179 (bvslt j!136 index!984))))

(declare-fun lt!284183 () Unit!20198)

(declare-fun e!353958 () Unit!20198)

(assert (=> b!617288 (= lt!284183 e!353958)))

(declare-fun c!70180 () Bool)

(assert (=> b!617288 (= c!70180 (bvslt index!984 j!136))))

(declare-fun lt!284178 () Unit!20198)

(assert (=> b!617288 (= lt!284178 e!353966)))

(assert (=> b!617288 false))

(declare-fun b!617289 () Bool)

(declare-fun Unit!20205 () Unit!20198)

(assert (=> b!617289 (= e!353958 Unit!20205)))

(declare-fun b!617290 () Bool)

(assert (=> b!617290 (= e!353959 e!353961)))

(declare-fun res!397653 () Bool)

(assert (=> b!617290 (=> (not res!397653) (not e!353961))))

(declare-fun lt!284188 () SeekEntryResult!6447)

(assert (=> b!617290 (= res!397653 (or (= lt!284188 (MissingZero!6447 i!1108)) (= lt!284188 (MissingVacant!6447 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37522 (_ BitVec 32)) SeekEntryResult!6447)

(assert (=> b!617290 (= lt!284188 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!397666 () Bool)

(assert (=> start!56052 (=> (not res!397666) (not e!353959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56052 (= res!397666 (validMask!0 mask!3053))))

(assert (=> start!56052 e!353959))

(assert (=> start!56052 true))

(declare-fun array_inv!13803 (array!37522) Bool)

(assert (=> start!56052 (array_inv!13803 a!2986)))

(declare-fun b!617278 () Bool)

(declare-fun res!397654 () Bool)

(assert (=> b!617278 (=> (not res!397654) (not e!353961))))

(assert (=> b!617278 (= res!397654 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18007 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617291 () Bool)

(assert (=> b!617291 false))

(declare-fun lt!284186 () Unit!20198)

(assert (=> b!617291 (= lt!284186 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284185 (select (arr!18007 a!2986) j!136) j!136 Nil!12045))))

(assert (=> b!617291 (arrayNoDuplicates!0 lt!284185 j!136 Nil!12045)))

(declare-fun lt!284180 () Unit!20198)

(assert (=> b!617291 (= lt!284180 (lemmaNoDuplicateFromThenFromBigger!0 lt!284185 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617291 (arrayNoDuplicates!0 lt!284185 #b00000000000000000000000000000000 Nil!12045)))

(declare-fun lt!284194 () Unit!20198)

(assert (=> b!617291 (= lt!284194 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12045))))

(assert (=> b!617291 (arrayContainsKey!0 lt!284185 (select (arr!18007 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284197 () Unit!20198)

(assert (=> b!617291 (= lt!284197 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284185 (select (arr!18007 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20206 () Unit!20198)

(assert (=> b!617291 (= e!353958 Unit!20206)))

(declare-fun b!617292 () Bool)

(declare-fun res!397662 () Bool)

(assert (=> b!617292 (=> (not res!397662) (not e!353959))))

(assert (=> b!617292 (= res!397662 (and (= (size!18371 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18371 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18371 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617293 () Bool)

(declare-fun res!397661 () Bool)

(assert (=> b!617293 (=> (not res!397661) (not e!353959))))

(assert (=> b!617293 (= res!397661 (validKeyInArray!0 k0!1786))))

(declare-fun b!617294 () Bool)

(assert (=> b!617294 (= e!353955 true)))

(assert (=> b!617294 (= (select (store (arr!18007 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617295 () Bool)

(assert (=> b!617295 (= e!353961 e!353962)))

(declare-fun res!397664 () Bool)

(assert (=> b!617295 (=> (not res!397664) (not e!353962))))

(assert (=> b!617295 (= res!397664 (= (select (store (arr!18007 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617295 (= lt!284185 (array!37523 (store (arr!18007 a!2986) i!1108 k0!1786) (size!18371 a!2986)))))

(declare-fun b!617296 () Bool)

(assert (=> b!617296 (= e!353967 (= lt!284196 lt!284187))))

(declare-fun b!617297 () Bool)

(declare-fun Unit!20207 () Unit!20198)

(assert (=> b!617297 (= e!353966 Unit!20207)))

(assert (= (and start!56052 res!397666) b!617292))

(assert (= (and b!617292 res!397662) b!617273))

(assert (= (and b!617273 res!397665) b!617293))

(assert (= (and b!617293 res!397661) b!617284))

(assert (= (and b!617284 res!397652) b!617290))

(assert (= (and b!617290 res!397653) b!617276))

(assert (= (and b!617276 res!397658) b!617281))

(assert (= (and b!617281 res!397651) b!617278))

(assert (= (and b!617278 res!397654) b!617295))

(assert (= (and b!617295 res!397664) b!617282))

(assert (= (and b!617282 res!397655) b!617286))

(assert (= (and b!617286 res!397656) b!617296))

(assert (= (and b!617286 c!70178) b!617279))

(assert (= (and b!617286 (not c!70178)) b!617274))

(assert (= (and b!617286 c!70181) b!617288))

(assert (= (and b!617286 (not c!70181)) b!617280))

(assert (= (and b!617288 res!397659) b!617275))

(assert (= (and b!617275 (not res!397660)) b!617283))

(assert (= (and b!617283 res!397657) b!617287))

(assert (= (and b!617288 c!70179) b!617291))

(assert (= (and b!617288 (not c!70179)) b!617289))

(assert (= (and b!617288 c!70180) b!617277))

(assert (= (and b!617288 (not c!70180)) b!617297))

(assert (= (and b!617277 res!397663) b!617285))

(assert (= (and b!617286 (not res!397667)) b!617294))

(declare-fun m!593391 () Bool)

(assert (=> b!617291 m!593391))

(declare-fun m!593393 () Bool)

(assert (=> b!617291 m!593393))

(declare-fun m!593395 () Bool)

(assert (=> b!617291 m!593395))

(declare-fun m!593397 () Bool)

(assert (=> b!617291 m!593397))

(assert (=> b!617291 m!593393))

(declare-fun m!593399 () Bool)

(assert (=> b!617291 m!593399))

(declare-fun m!593401 () Bool)

(assert (=> b!617291 m!593401))

(declare-fun m!593403 () Bool)

(assert (=> b!617291 m!593403))

(assert (=> b!617291 m!593393))

(assert (=> b!617291 m!593393))

(declare-fun m!593405 () Bool)

(assert (=> b!617291 m!593405))

(declare-fun m!593407 () Bool)

(assert (=> b!617286 m!593407))

(declare-fun m!593409 () Bool)

(assert (=> b!617286 m!593409))

(declare-fun m!593411 () Bool)

(assert (=> b!617286 m!593411))

(declare-fun m!593413 () Bool)

(assert (=> b!617286 m!593413))

(declare-fun m!593415 () Bool)

(assert (=> b!617286 m!593415))

(assert (=> b!617286 m!593393))

(declare-fun m!593417 () Bool)

(assert (=> b!617286 m!593417))

(declare-fun m!593419 () Bool)

(assert (=> b!617286 m!593419))

(assert (=> b!617286 m!593393))

(assert (=> b!617294 m!593411))

(declare-fun m!593421 () Bool)

(assert (=> b!617294 m!593421))

(declare-fun m!593423 () Bool)

(assert (=> b!617281 m!593423))

(assert (=> b!617277 m!593393))

(declare-fun m!593425 () Bool)

(assert (=> b!617277 m!593425))

(assert (=> b!617277 m!593393))

(declare-fun m!593427 () Bool)

(assert (=> b!617277 m!593427))

(assert (=> b!617277 m!593393))

(assert (=> b!617277 m!593391))

(assert (=> b!617277 m!593393))

(declare-fun m!593429 () Bool)

(assert (=> b!617277 m!593429))

(assert (=> b!617277 m!593393))

(declare-fun m!593431 () Bool)

(assert (=> b!617277 m!593431))

(declare-fun m!593433 () Bool)

(assert (=> b!617277 m!593433))

(declare-fun m!593435 () Bool)

(assert (=> b!617277 m!593435))

(assert (=> b!617277 m!593403))

(declare-fun m!593437 () Bool)

(assert (=> b!617278 m!593437))

(declare-fun m!593439 () Bool)

(assert (=> b!617293 m!593439))

(declare-fun m!593441 () Bool)

(assert (=> b!617290 m!593441))

(assert (=> b!617288 m!593411))

(assert (=> b!617288 m!593421))

(assert (=> b!617288 m!593393))

(declare-fun m!593443 () Bool)

(assert (=> b!617282 m!593443))

(assert (=> b!617282 m!593393))

(assert (=> b!617282 m!593393))

(declare-fun m!593445 () Bool)

(assert (=> b!617282 m!593445))

(assert (=> b!617287 m!593393))

(assert (=> b!617287 m!593393))

(declare-fun m!593447 () Bool)

(assert (=> b!617287 m!593447))

(assert (=> b!617285 m!593393))

(assert (=> b!617285 m!593393))

(assert (=> b!617285 m!593447))

(declare-fun m!593449 () Bool)

(assert (=> start!56052 m!593449))

(declare-fun m!593451 () Bool)

(assert (=> start!56052 m!593451))

(assert (=> b!617273 m!593393))

(assert (=> b!617273 m!593393))

(declare-fun m!593453 () Bool)

(assert (=> b!617273 m!593453))

(declare-fun m!593455 () Bool)

(assert (=> b!617276 m!593455))

(assert (=> b!617283 m!593393))

(assert (=> b!617283 m!593393))

(assert (=> b!617283 m!593427))

(assert (=> b!617295 m!593411))

(declare-fun m!593457 () Bool)

(assert (=> b!617295 m!593457))

(declare-fun m!593459 () Bool)

(assert (=> b!617284 m!593459))

(check-sat (not b!617282) (not b!617286) (not b!617293) (not b!617287) (not b!617285) (not b!617283) (not b!617284) (not b!617281) (not b!617290) (not b!617276) (not b!617291) (not start!56052) (not b!617277) (not b!617273))
(check-sat)
