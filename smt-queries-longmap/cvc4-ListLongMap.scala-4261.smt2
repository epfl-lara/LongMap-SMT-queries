; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59214 () Bool)

(assert start!59214)

(declare-fun b!653314 () Bool)

(declare-fun e!375067 () Bool)

(declare-datatypes ((SeekEntryResult!6955 0))(
  ( (MissingZero!6955 (index!30176 (_ BitVec 32))) (Found!6955 (index!30177 (_ BitVec 32))) (Intermediate!6955 (undefined!7767 Bool) (index!30178 (_ BitVec 32)) (x!58963 (_ BitVec 32))) (Undefined!6955) (MissingVacant!6955 (index!30179 (_ BitVec 32))) )
))
(declare-fun lt!304138 () SeekEntryResult!6955)

(declare-fun lt!304143 () SeekEntryResult!6955)

(assert (=> b!653314 (= e!375067 (= lt!304138 lt!304143))))

(declare-fun b!653315 () Bool)

(declare-datatypes ((Unit!22356 0))(
  ( (Unit!22357) )
))
(declare-fun e!375076 () Unit!22356)

(declare-fun Unit!22358 () Unit!22356)

(assert (=> b!653315 (= e!375076 Unit!22358)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38627 0))(
  ( (array!38628 (arr!18515 (Array (_ BitVec 32) (_ BitVec 64))) (size!18879 (_ BitVec 32))) )
))
(declare-fun lt!304134 () array!38627)

(declare-fun lt!304140 () Unit!22356)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38627 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22356)

(assert (=> b!653315 (= lt!304140 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304134 (select (arr!18515 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!653315 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304145 () Unit!22356)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!12556 0))(
  ( (Nil!12553) (Cons!12552 (h!13597 (_ BitVec 64)) (t!18784 List!12556)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38627 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12556) Unit!22356)

(assert (=> b!653315 (= lt!304145 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12553))))

(declare-fun arrayNoDuplicates!0 (array!38627 (_ BitVec 32) List!12556) Bool)

(assert (=> b!653315 (arrayNoDuplicates!0 lt!304134 #b00000000000000000000000000000000 Nil!12553)))

(declare-fun lt!304147 () Unit!22356)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38627 (_ BitVec 32) (_ BitVec 32)) Unit!22356)

(assert (=> b!653315 (= lt!304147 (lemmaNoDuplicateFromThenFromBigger!0 lt!304134 #b00000000000000000000000000000000 j!136))))

(assert (=> b!653315 (arrayNoDuplicates!0 lt!304134 j!136 Nil!12553)))

(declare-fun lt!304130 () Unit!22356)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38627 (_ BitVec 64) (_ BitVec 32) List!12556) Unit!22356)

(assert (=> b!653315 (= lt!304130 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304134 (select (arr!18515 a!2986) j!136) j!136 Nil!12553))))

(assert (=> b!653315 false))

(declare-fun b!653316 () Bool)

(declare-fun e!375074 () Unit!22356)

(declare-fun Unit!22359 () Unit!22356)

(assert (=> b!653316 (= e!375074 Unit!22359)))

(assert (=> b!653316 false))

(declare-fun b!653317 () Bool)

(declare-fun e!375077 () Bool)

(declare-fun e!375078 () Bool)

(assert (=> b!653317 (= e!375077 (not e!375078))))

(declare-fun res!423695 () Bool)

(assert (=> b!653317 (=> res!423695 e!375078)))

(declare-fun lt!304137 () SeekEntryResult!6955)

(assert (=> b!653317 (= res!423695 (not (= lt!304137 (Found!6955 index!984))))))

(declare-fun lt!304133 () Unit!22356)

(assert (=> b!653317 (= lt!304133 e!375074)))

(declare-fun c!75181 () Bool)

(assert (=> b!653317 (= c!75181 (= lt!304137 Undefined!6955))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!304131 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38627 (_ BitVec 32)) SeekEntryResult!6955)

(assert (=> b!653317 (= lt!304137 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304131 lt!304134 mask!3053))))

(assert (=> b!653317 e!375067))

(declare-fun res!423692 () Bool)

(assert (=> b!653317 (=> (not res!423692) (not e!375067))))

(declare-fun lt!304144 () (_ BitVec 32))

(assert (=> b!653317 (= res!423692 (= lt!304143 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304144 vacantSpotIndex!68 lt!304131 lt!304134 mask!3053)))))

(assert (=> b!653317 (= lt!304143 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304144 vacantSpotIndex!68 (select (arr!18515 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!653317 (= lt!304131 (select (store (arr!18515 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!304135 () Unit!22356)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22356)

(assert (=> b!653317 (= lt!304135 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304144 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!653317 (= lt!304144 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!653318 () Bool)

(declare-fun e!375075 () Bool)

(assert (=> b!653318 (= e!375078 e!375075)))

(declare-fun res!423701 () Bool)

(assert (=> b!653318 (=> res!423701 e!375075)))

(declare-fun lt!304146 () (_ BitVec 64))

(assert (=> b!653318 (= res!423701 (or (not (= (select (arr!18515 a!2986) j!136) lt!304131)) (not (= (select (arr!18515 a!2986) j!136) lt!304146))))))

(declare-fun e!375072 () Bool)

(assert (=> b!653318 e!375072))

(declare-fun res!423705 () Bool)

(assert (=> b!653318 (=> (not res!423705) (not e!375072))))

(assert (=> b!653318 (= res!423705 (= lt!304146 (select (arr!18515 a!2986) j!136)))))

(assert (=> b!653318 (= lt!304146 (select (store (arr!18515 a!2986) i!1108 k!1786) index!984))))

(declare-fun e!375068 () Bool)

(declare-fun b!653320 () Bool)

(assert (=> b!653320 (= e!375068 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) index!984))))

(declare-fun b!653321 () Bool)

(declare-fun res!423691 () Bool)

(declare-fun e!375071 () Bool)

(assert (=> b!653321 (=> (not res!423691) (not e!375071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!653321 (= res!423691 (validKeyInArray!0 (select (arr!18515 a!2986) j!136)))))

(declare-fun b!653322 () Bool)

(declare-fun e!375065 () Bool)

(assert (=> b!653322 (= e!375071 e!375065)))

(declare-fun res!423696 () Bool)

(assert (=> b!653322 (=> (not res!423696) (not e!375065))))

(declare-fun lt!304136 () SeekEntryResult!6955)

(assert (=> b!653322 (= res!423696 (or (= lt!304136 (MissingZero!6955 i!1108)) (= lt!304136 (MissingVacant!6955 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38627 (_ BitVec 32)) SeekEntryResult!6955)

(assert (=> b!653322 (= lt!304136 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!653323 () Bool)

(declare-fun res!423693 () Bool)

(assert (=> b!653323 (=> (not res!423693) (not e!375065))))

(assert (=> b!653323 (= res!423693 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18515 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653324 () Bool)

(declare-fun e!375080 () Bool)

(assert (=> b!653324 (= e!375072 e!375080)))

(declare-fun res!423687 () Bool)

(assert (=> b!653324 (=> res!423687 e!375080)))

(assert (=> b!653324 (= res!423687 (or (not (= (select (arr!18515 a!2986) j!136) lt!304131)) (not (= (select (arr!18515 a!2986) j!136) lt!304146)) (bvsge j!136 index!984)))))

(declare-fun b!653325 () Bool)

(assert (=> b!653325 (= e!375080 e!375068)))

(declare-fun res!423689 () Bool)

(assert (=> b!653325 (=> (not res!423689) (not e!375068))))

(assert (=> b!653325 (= res!423689 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) j!136))))

(declare-fun b!653326 () Bool)

(declare-fun e!375079 () Bool)

(declare-fun contains!3184 (List!12556 (_ BitVec 64)) Bool)

(assert (=> b!653326 (= e!375079 (not (contains!3184 Nil!12553 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653327 () Bool)

(declare-fun e!375066 () Bool)

(assert (=> b!653327 (= e!375065 e!375066)))

(declare-fun res!423688 () Bool)

(assert (=> b!653327 (=> (not res!423688) (not e!375066))))

(assert (=> b!653327 (= res!423688 (= (select (store (arr!18515 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653327 (= lt!304134 (array!38628 (store (arr!18515 a!2986) i!1108 k!1786) (size!18879 a!2986)))))

(declare-fun b!653328 () Bool)

(declare-fun res!423702 () Bool)

(assert (=> b!653328 (=> (not res!423702) (not e!375065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38627 (_ BitVec 32)) Bool)

(assert (=> b!653328 (= res!423702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!653329 () Bool)

(declare-fun e!375069 () Bool)

(assert (=> b!653329 (= e!375075 e!375069)))

(declare-fun res!423703 () Bool)

(assert (=> b!653329 (=> res!423703 e!375069)))

(assert (=> b!653329 (= res!423703 (bvsge index!984 j!136))))

(declare-fun lt!304141 () Unit!22356)

(assert (=> b!653329 (= lt!304141 e!375076)))

(declare-fun c!75182 () Bool)

(assert (=> b!653329 (= c!75182 (bvslt j!136 index!984))))

(declare-fun b!653330 () Bool)

(declare-fun e!375081 () Bool)

(assert (=> b!653330 (= e!375081 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) index!984))))

(declare-fun b!653331 () Bool)

(declare-fun Unit!22360 () Unit!22356)

(assert (=> b!653331 (= e!375076 Unit!22360)))

(declare-fun b!653332 () Bool)

(declare-fun res!423694 () Bool)

(assert (=> b!653332 (=> (not res!423694) (not e!375071))))

(assert (=> b!653332 (= res!423694 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!653333 () Bool)

(declare-fun res!423700 () Bool)

(assert (=> b!653333 (=> (not res!423700) (not e!375065))))

(assert (=> b!653333 (= res!423700 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12553))))

(declare-fun b!653334 () Bool)

(declare-fun e!375070 () Bool)

(assert (=> b!653334 (= e!375069 e!375070)))

(declare-fun res!423707 () Bool)

(assert (=> b!653334 (=> res!423707 e!375070)))

(assert (=> b!653334 (= res!423707 (or (bvsge (size!18879 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18879 a!2986)) (bvsge index!984 (size!18879 a!2986))))))

(assert (=> b!653334 (arrayNoDuplicates!0 lt!304134 index!984 Nil!12553)))

(declare-fun lt!304142 () Unit!22356)

(assert (=> b!653334 (= lt!304142 (lemmaNoDuplicateFromThenFromBigger!0 lt!304134 #b00000000000000000000000000000000 index!984))))

(assert (=> b!653334 (arrayNoDuplicates!0 lt!304134 #b00000000000000000000000000000000 Nil!12553)))

(declare-fun lt!304132 () Unit!22356)

(assert (=> b!653334 (= lt!304132 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12553))))

(assert (=> b!653334 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304139 () Unit!22356)

(assert (=> b!653334 (= lt!304139 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304134 (select (arr!18515 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!653334 e!375081))

(declare-fun res!423706 () Bool)

(assert (=> b!653334 (=> (not res!423706) (not e!375081))))

(assert (=> b!653334 (= res!423706 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) j!136))))

(declare-fun b!653335 () Bool)

(declare-fun Unit!22361 () Unit!22356)

(assert (=> b!653335 (= e!375074 Unit!22361)))

(declare-fun b!653336 () Bool)

(declare-fun res!423704 () Bool)

(assert (=> b!653336 (=> (not res!423704) (not e!375071))))

(assert (=> b!653336 (= res!423704 (validKeyInArray!0 k!1786))))

(declare-fun b!653337 () Bool)

(assert (=> b!653337 (= e!375066 e!375077)))

(declare-fun res!423698 () Bool)

(assert (=> b!653337 (=> (not res!423698) (not e!375077))))

(assert (=> b!653337 (= res!423698 (and (= lt!304138 (Found!6955 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18515 a!2986) index!984) (select (arr!18515 a!2986) j!136))) (not (= (select (arr!18515 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!653337 (= lt!304138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18515 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653338 () Bool)

(declare-fun res!423697 () Bool)

(assert (=> b!653338 (=> res!423697 e!375070)))

(declare-fun noDuplicate!440 (List!12556) Bool)

(assert (=> b!653338 (= res!423697 (not (noDuplicate!440 Nil!12553)))))

(declare-fun b!653339 () Bool)

(declare-fun res!423690 () Bool)

(assert (=> b!653339 (=> (not res!423690) (not e!375071))))

(assert (=> b!653339 (= res!423690 (and (= (size!18879 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18879 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18879 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!423699 () Bool)

(assert (=> start!59214 (=> (not res!423699) (not e!375071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59214 (= res!423699 (validMask!0 mask!3053))))

(assert (=> start!59214 e!375071))

(assert (=> start!59214 true))

(declare-fun array_inv!14311 (array!38627) Bool)

(assert (=> start!59214 (array_inv!14311 a!2986)))

(declare-fun b!653319 () Bool)

(assert (=> b!653319 (= e!375070 e!375079)))

(declare-fun res!423686 () Bool)

(assert (=> b!653319 (=> (not res!423686) (not e!375079))))

(assert (=> b!653319 (= res!423686 (not (contains!3184 Nil!12553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59214 res!423699) b!653339))

(assert (= (and b!653339 res!423690) b!653321))

(assert (= (and b!653321 res!423691) b!653336))

(assert (= (and b!653336 res!423704) b!653332))

(assert (= (and b!653332 res!423694) b!653322))

(assert (= (and b!653322 res!423696) b!653328))

(assert (= (and b!653328 res!423702) b!653333))

(assert (= (and b!653333 res!423700) b!653323))

(assert (= (and b!653323 res!423693) b!653327))

(assert (= (and b!653327 res!423688) b!653337))

(assert (= (and b!653337 res!423698) b!653317))

(assert (= (and b!653317 res!423692) b!653314))

(assert (= (and b!653317 c!75181) b!653316))

(assert (= (and b!653317 (not c!75181)) b!653335))

(assert (= (and b!653317 (not res!423695)) b!653318))

(assert (= (and b!653318 res!423705) b!653324))

(assert (= (and b!653324 (not res!423687)) b!653325))

(assert (= (and b!653325 res!423689) b!653320))

(assert (= (and b!653318 (not res!423701)) b!653329))

(assert (= (and b!653329 c!75182) b!653315))

(assert (= (and b!653329 (not c!75182)) b!653331))

(assert (= (and b!653329 (not res!423703)) b!653334))

(assert (= (and b!653334 res!423706) b!653330))

(assert (= (and b!653334 (not res!423707)) b!653338))

(assert (= (and b!653338 (not res!423697)) b!653319))

(assert (= (and b!653319 res!423686) b!653326))

(declare-fun m!626433 () Bool)

(assert (=> b!653315 m!626433))

(declare-fun m!626435 () Bool)

(assert (=> b!653315 m!626435))

(declare-fun m!626437 () Bool)

(assert (=> b!653315 m!626437))

(assert (=> b!653315 m!626435))

(declare-fun m!626439 () Bool)

(assert (=> b!653315 m!626439))

(assert (=> b!653315 m!626435))

(declare-fun m!626441 () Bool)

(assert (=> b!653315 m!626441))

(declare-fun m!626443 () Bool)

(assert (=> b!653315 m!626443))

(assert (=> b!653315 m!626435))

(declare-fun m!626445 () Bool)

(assert (=> b!653315 m!626445))

(declare-fun m!626447 () Bool)

(assert (=> b!653315 m!626447))

(declare-fun m!626449 () Bool)

(assert (=> b!653332 m!626449))

(declare-fun m!626451 () Bool)

(assert (=> b!653319 m!626451))

(assert (=> b!653330 m!626435))

(assert (=> b!653330 m!626435))

(declare-fun m!626453 () Bool)

(assert (=> b!653330 m!626453))

(declare-fun m!626455 () Bool)

(assert (=> b!653317 m!626455))

(assert (=> b!653317 m!626435))

(declare-fun m!626457 () Bool)

(assert (=> b!653317 m!626457))

(declare-fun m!626459 () Bool)

(assert (=> b!653317 m!626459))

(declare-fun m!626461 () Bool)

(assert (=> b!653317 m!626461))

(assert (=> b!653317 m!626435))

(declare-fun m!626463 () Bool)

(assert (=> b!653317 m!626463))

(declare-fun m!626465 () Bool)

(assert (=> b!653317 m!626465))

(declare-fun m!626467 () Bool)

(assert (=> b!653317 m!626467))

(declare-fun m!626469 () Bool)

(assert (=> start!59214 m!626469))

(declare-fun m!626471 () Bool)

(assert (=> start!59214 m!626471))

(assert (=> b!653327 m!626457))

(declare-fun m!626473 () Bool)

(assert (=> b!653327 m!626473))

(declare-fun m!626475 () Bool)

(assert (=> b!653328 m!626475))

(assert (=> b!653334 m!626435))

(declare-fun m!626477 () Bool)

(assert (=> b!653334 m!626477))

(assert (=> b!653334 m!626435))

(declare-fun m!626479 () Bool)

(assert (=> b!653334 m!626479))

(declare-fun m!626481 () Bool)

(assert (=> b!653334 m!626481))

(assert (=> b!653334 m!626437))

(assert (=> b!653334 m!626435))

(declare-fun m!626483 () Bool)

(assert (=> b!653334 m!626483))

(assert (=> b!653334 m!626435))

(declare-fun m!626485 () Bool)

(assert (=> b!653334 m!626485))

(assert (=> b!653334 m!626447))

(declare-fun m!626487 () Bool)

(assert (=> b!653326 m!626487))

(assert (=> b!653318 m!626435))

(assert (=> b!653318 m!626457))

(declare-fun m!626489 () Bool)

(assert (=> b!653318 m!626489))

(declare-fun m!626491 () Bool)

(assert (=> b!653333 m!626491))

(declare-fun m!626493 () Bool)

(assert (=> b!653338 m!626493))

(declare-fun m!626495 () Bool)

(assert (=> b!653337 m!626495))

(assert (=> b!653337 m!626435))

(assert (=> b!653337 m!626435))

(declare-fun m!626497 () Bool)

(assert (=> b!653337 m!626497))

(declare-fun m!626499 () Bool)

(assert (=> b!653322 m!626499))

(assert (=> b!653320 m!626435))

(assert (=> b!653320 m!626435))

(assert (=> b!653320 m!626453))

(declare-fun m!626501 () Bool)

(assert (=> b!653336 m!626501))

(assert (=> b!653321 m!626435))

(assert (=> b!653321 m!626435))

(declare-fun m!626503 () Bool)

(assert (=> b!653321 m!626503))

(declare-fun m!626505 () Bool)

(assert (=> b!653323 m!626505))

(assert (=> b!653324 m!626435))

(assert (=> b!653325 m!626435))

(assert (=> b!653325 m!626435))

(assert (=> b!653325 m!626485))

(push 1)

(assert (not b!653328))

(assert (not b!653320))

(assert (not b!653332))

(assert (not b!653315))

(assert (not b!653322))

(assert (not b!653337))

(assert (not b!653338))

(assert (not b!653321))

(assert (not b!653330))

(assert (not b!653326))

(assert (not b!653336))

(assert (not start!59214))

(assert (not b!653319))

(assert (not b!653333))

(assert (not b!653317))

(assert (not b!653334))

(assert (not b!653325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92425 () Bool)

(assert (=> d!92425 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653336 d!92425))

(declare-fun d!92427 () Bool)

(declare-fun res!423769 () Bool)

(declare-fun e!375160 () Bool)

(assert (=> d!92427 (=> res!423769 e!375160)))

(assert (=> d!92427 (= res!423769 (= (select (arr!18515 lt!304134) j!136) (select (arr!18515 a!2986) j!136)))))

(assert (=> d!92427 (= (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) j!136) e!375160)))

(declare-fun b!653435 () Bool)

(declare-fun e!375161 () Bool)

(assert (=> b!653435 (= e!375160 e!375161)))

(declare-fun res!423770 () Bool)

(assert (=> b!653435 (=> (not res!423770) (not e!375161))))

(assert (=> b!653435 (= res!423770 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18879 lt!304134)))))

(declare-fun b!653436 () Bool)

(assert (=> b!653436 (= e!375161 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92427 (not res!423769)) b!653435))

(assert (= (and b!653435 res!423770) b!653436))

(declare-fun m!626591 () Bool)

(assert (=> d!92427 m!626591))

(assert (=> b!653436 m!626435))

(declare-fun m!626593 () Bool)

(assert (=> b!653436 m!626593))

(assert (=> b!653325 d!92427))

(declare-fun d!92437 () Bool)

(declare-fun lt!304178 () Bool)

(declare-fun content!254 (List!12556) (Set (_ BitVec 64)))

(assert (=> d!92437 (= lt!304178 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!254 Nil!12553)))))

(declare-fun e!375172 () Bool)

(assert (=> d!92437 (= lt!304178 e!375172)))

(declare-fun res!423781 () Bool)

(assert (=> d!92437 (=> (not res!423781) (not e!375172))))

(assert (=> d!92437 (= res!423781 (is-Cons!12552 Nil!12553))))

(assert (=> d!92437 (= (contains!3184 Nil!12553 #b1000000000000000000000000000000000000000000000000000000000000000) lt!304178)))

(declare-fun b!653447 () Bool)

(declare-fun e!375173 () Bool)

(assert (=> b!653447 (= e!375172 e!375173)))

(declare-fun res!423782 () Bool)

(assert (=> b!653447 (=> res!423782 e!375173)))

(assert (=> b!653447 (= res!423782 (= (h!13597 Nil!12553) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653448 () Bool)

(assert (=> b!653448 (= e!375173 (contains!3184 (t!18784 Nil!12553) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92437 res!423781) b!653447))

(assert (= (and b!653447 (not res!423782)) b!653448))

(declare-fun m!626601 () Bool)

(assert (=> d!92437 m!626601))

(declare-fun m!626603 () Bool)

(assert (=> d!92437 m!626603))

(declare-fun m!626605 () Bool)

(assert (=> b!653448 m!626605))

(assert (=> b!653326 d!92437))

(declare-fun b!653473 () Bool)

(declare-fun e!375194 () Bool)

(declare-fun call!33820 () Bool)

(assert (=> b!653473 (= e!375194 call!33820)))

(declare-fun d!92443 () Bool)

(declare-fun res!423797 () Bool)

(declare-fun e!375195 () Bool)

(assert (=> d!92443 (=> res!423797 e!375195)))

(assert (=> d!92443 (= res!423797 (bvsge #b00000000000000000000000000000000 (size!18879 lt!304134)))))

(assert (=> d!92443 (= (arrayNoDuplicates!0 lt!304134 #b00000000000000000000000000000000 Nil!12553) e!375195)))

(declare-fun b!653474 () Bool)

(declare-fun e!375196 () Bool)

(assert (=> b!653474 (= e!375195 e!375196)))

(declare-fun res!423799 () Bool)

(assert (=> b!653474 (=> (not res!423799) (not e!375196))))

(declare-fun e!375193 () Bool)

(assert (=> b!653474 (= res!423799 (not e!375193))))

(declare-fun res!423798 () Bool)

(assert (=> b!653474 (=> (not res!423798) (not e!375193))))

(assert (=> b!653474 (= res!423798 (validKeyInArray!0 (select (arr!18515 lt!304134) #b00000000000000000000000000000000)))))

(declare-fun b!653475 () Bool)

(assert (=> b!653475 (= e!375196 e!375194)))

(declare-fun c!75205 () Bool)

(assert (=> b!653475 (= c!75205 (validKeyInArray!0 (select (arr!18515 lt!304134) #b00000000000000000000000000000000)))))

(declare-fun b!653476 () Bool)

(assert (=> b!653476 (= e!375193 (contains!3184 Nil!12553 (select (arr!18515 lt!304134) #b00000000000000000000000000000000)))))

(declare-fun bm!33817 () Bool)

(assert (=> bm!33817 (= call!33820 (arrayNoDuplicates!0 lt!304134 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75205 (Cons!12552 (select (arr!18515 lt!304134) #b00000000000000000000000000000000) Nil!12553) Nil!12553)))))

(declare-fun b!653477 () Bool)

(assert (=> b!653477 (= e!375194 call!33820)))

(assert (= (and d!92443 (not res!423797)) b!653474))

(assert (= (and b!653474 res!423798) b!653476))

(assert (= (and b!653474 res!423799) b!653475))

(assert (= (and b!653475 c!75205) b!653473))

(assert (= (and b!653475 (not c!75205)) b!653477))

(assert (= (or b!653473 b!653477) bm!33817))

(declare-fun m!626617 () Bool)

(assert (=> b!653474 m!626617))

(assert (=> b!653474 m!626617))

(declare-fun m!626619 () Bool)

(assert (=> b!653474 m!626619))

(assert (=> b!653475 m!626617))

(assert (=> b!653475 m!626617))

(assert (=> b!653475 m!626619))

(assert (=> b!653476 m!626617))

(assert (=> b!653476 m!626617))

(declare-fun m!626621 () Bool)

(assert (=> b!653476 m!626621))

(assert (=> bm!33817 m!626617))

(declare-fun m!626623 () Bool)

(assert (=> bm!33817 m!626623))

(assert (=> b!653315 d!92443))

(declare-fun d!92451 () Bool)

(assert (=> d!92451 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18879 lt!304134)) (not (= (select (arr!18515 lt!304134) j!136) (select (arr!18515 a!2986) j!136))))))

(declare-fun lt!304190 () Unit!22356)

(declare-fun choose!21 (array!38627 (_ BitVec 64) (_ BitVec 32) List!12556) Unit!22356)

(assert (=> d!92451 (= lt!304190 (choose!21 lt!304134 (select (arr!18515 a!2986) j!136) j!136 Nil!12553))))

(assert (=> d!92451 (bvslt (size!18879 lt!304134) #b01111111111111111111111111111111)))

(assert (=> d!92451 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304134 (select (arr!18515 a!2986) j!136) j!136 Nil!12553) lt!304190)))

(declare-fun bs!19477 () Bool)

(assert (= bs!19477 d!92451))

(assert (=> bs!19477 m!626591))

(assert (=> bs!19477 m!626435))

(declare-fun m!626625 () Bool)

(assert (=> bs!19477 m!626625))

(assert (=> b!653315 d!92451))

(declare-fun d!92455 () Bool)

(assert (=> d!92455 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304193 () Unit!22356)

(declare-fun choose!114 (array!38627 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22356)

(assert (=> d!92455 (= lt!304193 (choose!114 lt!304134 (select (arr!18515 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92455 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92455 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304134 (select (arr!18515 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!304193)))

(declare-fun bs!19478 () Bool)

(assert (= bs!19478 d!92455))

(assert (=> bs!19478 m!626435))

(assert (=> bs!19478 m!626439))

(assert (=> bs!19478 m!626435))

(declare-fun m!626627 () Bool)

(assert (=> bs!19478 m!626627))

(assert (=> b!653315 d!92455))

(declare-fun d!92459 () Bool)

(declare-fun res!423800 () Bool)

(declare-fun e!375197 () Bool)

(assert (=> d!92459 (=> res!423800 e!375197)))

(assert (=> d!92459 (= res!423800 (= (select (arr!18515 lt!304134) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18515 a!2986) j!136)))))

(assert (=> d!92459 (= (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!375197)))

(declare-fun b!653478 () Bool)

(declare-fun e!375198 () Bool)

(assert (=> b!653478 (= e!375197 e!375198)))

(declare-fun res!423801 () Bool)

(assert (=> b!653478 (=> (not res!423801) (not e!375198))))

(assert (=> b!653478 (= res!423801 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18879 lt!304134)))))

(declare-fun b!653479 () Bool)

(assert (=> b!653479 (= e!375198 (arrayContainsKey!0 lt!304134 (select (arr!18515 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92459 (not res!423800)) b!653478))

(assert (= (and b!653478 res!423801) b!653479))

(declare-fun m!626629 () Bool)

(assert (=> d!92459 m!626629))

(assert (=> b!653479 m!626435))

(declare-fun m!626631 () Bool)

(assert (=> b!653479 m!626631))

(assert (=> b!653315 d!92459))

(declare-fun b!653480 () Bool)

(declare-fun e!375200 () Bool)

(declare-fun call!33821 () Bool)

(assert (=> b!653480 (= e!375200 call!33821)))

(declare-fun d!92461 () Bool)

(declare-fun res!423802 () Bool)

(declare-fun e!375201 () Bool)

(assert (=> d!92461 (=> res!423802 e!375201)))

(assert (=> d!92461 (= res!423802 (bvsge j!136 (size!18879 lt!304134)))))

(assert (=> d!92461 (= (arrayNoDuplicates!0 lt!304134 j!136 Nil!12553) e!375201)))

(declare-fun b!653481 () Bool)

(declare-fun e!375202 () Bool)

(assert (=> b!653481 (= e!375201 e!375202)))

(declare-fun res!423804 () Bool)

(assert (=> b!653481 (=> (not res!423804) (not e!375202))))

(declare-fun e!375199 () Bool)

(assert (=> b!653481 (= res!423804 (not e!375199))))

(declare-fun res!423803 () Bool)

(assert (=> b!653481 (=> (not res!423803) (not e!375199))))

(assert (=> b!653481 (= res!423803 (validKeyInArray!0 (select (arr!18515 lt!304134) j!136)))))

(declare-fun b!653482 () Bool)

(assert (=> b!653482 (= e!375202 e!375200)))

(declare-fun c!75206 () Bool)

(assert (=> b!653482 (= c!75206 (validKeyInArray!0 (select (arr!18515 lt!304134) j!136)))))

(declare-fun b!653483 () Bool)

(assert (=> b!653483 (= e!375199 (contains!3184 Nil!12553 (select (arr!18515 lt!304134) j!136)))))

(declare-fun bm!33818 () Bool)

(assert (=> bm!33818 (= call!33821 (arrayNoDuplicates!0 lt!304134 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75206 (Cons!12552 (select (arr!18515 lt!304134) j!136) Nil!12553) Nil!12553)))))

(declare-fun b!653484 () Bool)

(assert (=> b!653484 (= e!375200 call!33821)))

(assert (= (and d!92461 (not res!423802)) b!653481))

(assert (= (and b!653481 res!423803) b!653483))

(assert (= (and b!653481 res!423804) b!653482))

(assert (= (and b!653482 c!75206) b!653480))

(assert (= (and b!653482 (not c!75206)) b!653484))

(assert (= (or b!653480 b!653484) bm!33818))

(assert (=> b!653481 m!626591))

(assert (=> b!653481 m!626591))

(declare-fun m!626633 () Bool)

(assert (=> b!653481 m!626633))

(assert (=> b!653482 m!626591))

(assert (=> b!653482 m!626591))

(assert (=> b!653482 m!626633))

(assert (=> b!653483 m!626591))

(assert (=> b!653483 m!626591))

(declare-fun m!626635 () Bool)

(assert (=> b!653483 m!626635))

(assert (=> bm!33818 m!626591))

(declare-fun m!626637 () Bool)

(assert (=> bm!33818 m!626637))

(assert (=> b!653315 d!92461))

(declare-fun d!92463 () Bool)

(assert (=> d!92463 (arrayNoDuplicates!0 lt!304134 j!136 Nil!12553)))

(declare-fun lt!304196 () Unit!22356)

(declare-fun choose!39 (array!38627 (_ BitVec 32) (_ BitVec 32)) Unit!22356)

(assert (=> d!92463 (= lt!304196 (choose!39 lt!304134 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92463 (bvslt (size!18879 lt!304134) #b01111111111111111111111111111111)))

(assert (=> d!92463 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!304134 #b00000000000000000000000000000000 j!136) lt!304196)))

(declare-fun bs!19479 () Bool)

(assert (= bs!19479 d!92463))

(assert (=> bs!19479 m!626443))

(declare-fun m!626639 () Bool)

(assert (=> bs!19479 m!626639))

(assert (=> b!653315 d!92463))

(declare-fun d!92465 () Bool)

(declare-fun e!375222 () Bool)

(assert (=> d!92465 e!375222))

(declare-fun res!423815 () Bool)

(assert (=> d!92465 (=> (not res!423815) (not e!375222))))

(assert (=> d!92465 (= res!423815 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18879 a!2986))))))

(declare-fun lt!304212 () Unit!22356)

(declare-fun choose!41 (array!38627 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12556) Unit!22356)

(assert (=> d!92465 (= lt!304212 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12553))))

(assert (=> d!92465 (bvslt (size!18879 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92465 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12553) lt!304212)))

(declare-fun b!653513 () Bool)

(assert (=> b!653513 (= e!375222 (arrayNoDuplicates!0 (array!38628 (store (arr!18515 a!2986) i!1108 k!1786) (size!18879 a!2986)) #b00000000000000000000000000000000 Nil!12553))))

(assert (= (and d!92465 res!423815) b!653513))

(declare-fun m!626653 () Bool)

(assert (=> d!92465 m!626653))

(assert (=> b!653513 m!626457))

(declare-fun m!626655 () Bool)

(assert (=> b!653513 m!626655))

(assert (=> b!653315 d!92465))

(declare-fun d!92471 () Bool)

(declare-fun res!423816 () Bool)

(declare-fun e!375226 () Bool)

(assert (=> d!92471 (=> res!423816 e!375226)))

(assert (=> d!92471 (= res!423816 (= (select (arr!18515 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!92471 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!375226)))

(declare-fun b!653520 () Bool)

(declare-fun e!375227 () Bool)

(assert (=> b!653520 (= e!375226 e!375227)))

(declare-fun res!423817 () Bool)

(assert (=> b!653520 (=> (not res!423817) (not e!375227))))

(assert (=> b!653520 (= res!423817 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18879 a!2986)))))

(declare-fun b!653521 () Bool)

(assert (=> b!653521 (= e!375227 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92471 (not res!423816)) b!653520))

(assert (= (and b!653520 res!423817) b!653521))

(declare-fun m!626659 () Bool)

(assert (=> d!92471 m!626659))

(declare-fun m!626663 () Bool)

(assert (=> b!653521 m!626663))

(assert (=> b!653332 d!92471))

(declare-fun d!92473 () Bool)

(assert (=> d!92473 (= (validKeyInArray!0 (select (arr!18515 a!2986) j!136)) (and (not (= (select (arr!18515 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18515 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653321 d!92473))

(declare-fun b!653589 () Bool)

(declare-fun e!375278 () SeekEntryResult!6955)

(declare-fun lt!304252 () SeekEntryResult!6955)

(assert (=> b!653589 (= e!375278 (Found!6955 (index!30178 lt!304252)))))

(declare-fun b!653590 () Bool)

(declare-fun e!375279 () SeekEntryResult!6955)

(assert (=> b!653590 (= e!375279 Undefined!6955)))

(declare-fun b!653591 () Bool)

(declare-fun c!75237 () Bool)

(declare-fun lt!304250 () (_ BitVec 64))

(assert (=> b!653591 (= c!75237 (= lt!304250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375277 () SeekEntryResult!6955)

(assert (=> b!653591 (= e!375278 e!375277)))

(declare-fun d!92477 () Bool)

(declare-fun lt!304251 () SeekEntryResult!6955)

(assert (=> d!92477 (and (or (is-Undefined!6955 lt!304251) (not (is-Found!6955 lt!304251)) (and (bvsge (index!30177 lt!304251) #b00000000000000000000000000000000) (bvslt (index!30177 lt!304251) (size!18879 a!2986)))) (or (is-Undefined!6955 lt!304251) (is-Found!6955 lt!304251) (not (is-MissingZero!6955 lt!304251)) (and (bvsge (index!30176 lt!304251) #b00000000000000000000000000000000) (bvslt (index!30176 lt!304251) (size!18879 a!2986)))) (or (is-Undefined!6955 lt!304251) (is-Found!6955 lt!304251) (is-MissingZero!6955 lt!304251) (not (is-MissingVacant!6955 lt!304251)) (and (bvsge (index!30179 lt!304251) #b00000000000000000000000000000000) (bvslt (index!30179 lt!304251) (size!18879 a!2986)))) (or (is-Undefined!6955 lt!304251) (ite (is-Found!6955 lt!304251) (= (select (arr!18515 a!2986) (index!30177 lt!304251)) k!1786) (ite (is-MissingZero!6955 lt!304251) (= (select (arr!18515 a!2986) (index!30176 lt!304251)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6955 lt!304251) (= (select (arr!18515 a!2986) (index!30179 lt!304251)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92477 (= lt!304251 e!375279)))

(declare-fun c!75239 () Bool)

(assert (=> d!92477 (= c!75239 (and (is-Intermediate!6955 lt!304252) (undefined!7767 lt!304252)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38627 (_ BitVec 32)) SeekEntryResult!6955)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92477 (= lt!304252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!92477 (validMask!0 mask!3053)))

(assert (=> d!92477 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!304251)))

(declare-fun b!653592 () Bool)

(assert (=> b!653592 (= e!375277 (MissingZero!6955 (index!30178 lt!304252)))))

(declare-fun b!653593 () Bool)

