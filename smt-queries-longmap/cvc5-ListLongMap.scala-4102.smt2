; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56110 () Bool)

(assert start!56110)

(declare-fun b!619448 () Bool)

(declare-fun res!399138 () Bool)

(declare-fun e!355267 () Bool)

(assert (=> b!619448 (=> (not res!399138) (not e!355267))))

(declare-datatypes ((array!37580 0))(
  ( (array!37581 (arr!18036 (Array (_ BitVec 32) (_ BitVec 64))) (size!18400 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37580)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37580 (_ BitVec 32)) Bool)

(assert (=> b!619448 (= res!399138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619449 () Bool)

(declare-datatypes ((Unit!20488 0))(
  ( (Unit!20489) )
))
(declare-fun e!355268 () Unit!20488)

(declare-fun Unit!20490 () Unit!20488)

(assert (=> b!619449 (= e!355268 Unit!20490)))

(declare-fun b!619450 () Bool)

(declare-fun res!399145 () Bool)

(assert (=> b!619450 (=> (not res!399145) (not e!355267))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!619450 (= res!399145 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18036 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619451 () Bool)

(declare-fun e!355259 () Unit!20488)

(declare-fun Unit!20491 () Unit!20488)

(assert (=> b!619451 (= e!355259 Unit!20491)))

(declare-fun b!619452 () Bool)

(declare-fun res!399132 () Bool)

(assert (=> b!619452 (=> (not res!399132) (not e!355267))))

(declare-datatypes ((List!12077 0))(
  ( (Nil!12074) (Cons!12073 (h!13118 (_ BitVec 64)) (t!18305 List!12077)) )
))
(declare-fun arrayNoDuplicates!0 (array!37580 (_ BitVec 32) List!12077) Bool)

(assert (=> b!619452 (= res!399132 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12074))))

(declare-fun b!619453 () Bool)

(declare-fun e!355265 () Unit!20488)

(declare-fun Unit!20492 () Unit!20488)

(assert (=> b!619453 (= e!355265 Unit!20492)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!399130 () Bool)

(assert (=> b!619453 (= res!399130 (= (select (store (arr!18036 a!2986) i!1108 k!1786) index!984) (select (arr!18036 a!2986) j!136)))))

(declare-fun e!355264 () Bool)

(assert (=> b!619453 (=> (not res!399130) (not e!355264))))

(assert (=> b!619453 e!355264))

(declare-fun c!70528 () Bool)

(assert (=> b!619453 (= c!70528 (bvslt j!136 index!984))))

(declare-fun lt!285924 () Unit!20488)

(assert (=> b!619453 (= lt!285924 e!355259)))

(declare-fun c!70526 () Bool)

(assert (=> b!619453 (= c!70526 (bvslt index!984 j!136))))

(declare-fun lt!285934 () Unit!20488)

(declare-fun e!355258 () Unit!20488)

(assert (=> b!619453 (= lt!285934 e!355258)))

(assert (=> b!619453 false))

(declare-fun res!399137 () Bool)

(declare-fun e!355260 () Bool)

(assert (=> start!56110 (=> (not res!399137) (not e!355260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56110 (= res!399137 (validMask!0 mask!3053))))

(assert (=> start!56110 e!355260))

(assert (=> start!56110 true))

(declare-fun array_inv!13832 (array!37580) Bool)

(assert (=> start!56110 (array_inv!13832 a!2986)))

(declare-fun b!619454 () Bool)

(declare-fun Unit!20493 () Unit!20488)

(assert (=> b!619454 (= e!355268 Unit!20493)))

(assert (=> b!619454 false))

(declare-fun lt!285928 () array!37580)

(declare-fun b!619455 () Bool)

(declare-fun e!355263 () Bool)

(declare-fun arrayContainsKey!0 (array!37580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619455 (= e!355263 (arrayContainsKey!0 lt!285928 (select (arr!18036 a!2986) j!136) index!984))))

(declare-fun b!619456 () Bool)

(declare-fun res!399144 () Bool)

(assert (=> b!619456 (= res!399144 (arrayContainsKey!0 lt!285928 (select (arr!18036 a!2986) j!136) j!136))))

(assert (=> b!619456 (=> (not res!399144) (not e!355263))))

(declare-fun e!355272 () Bool)

(assert (=> b!619456 (= e!355272 e!355263)))

(declare-fun b!619457 () Bool)

(declare-fun e!355270 () Bool)

(declare-fun e!355261 () Bool)

(assert (=> b!619457 (= e!355270 (not e!355261))))

(declare-fun res!399141 () Bool)

(assert (=> b!619457 (=> res!399141 e!355261)))

(declare-datatypes ((SeekEntryResult!6476 0))(
  ( (MissingZero!6476 (index!28188 (_ BitVec 32))) (Found!6476 (index!28189 (_ BitVec 32))) (Intermediate!6476 (undefined!7288 Bool) (index!28190 (_ BitVec 32)) (x!56972 (_ BitVec 32))) (Undefined!6476) (MissingVacant!6476 (index!28191 (_ BitVec 32))) )
))
(declare-fun lt!285921 () SeekEntryResult!6476)

(assert (=> b!619457 (= res!399141 (not (= lt!285921 (MissingVacant!6476 vacantSpotIndex!68))))))

(declare-fun lt!285935 () Unit!20488)

(assert (=> b!619457 (= lt!285935 e!355265)))

(declare-fun c!70529 () Bool)

(assert (=> b!619457 (= c!70529 (= lt!285921 (Found!6476 index!984)))))

(declare-fun lt!285925 () Unit!20488)

(assert (=> b!619457 (= lt!285925 e!355268)))

(declare-fun c!70527 () Bool)

(assert (=> b!619457 (= c!70527 (= lt!285921 Undefined!6476))))

(declare-fun lt!285937 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37580 (_ BitVec 32)) SeekEntryResult!6476)

(assert (=> b!619457 (= lt!285921 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285937 lt!285928 mask!3053))))

(declare-fun e!355266 () Bool)

(assert (=> b!619457 e!355266))

(declare-fun res!399136 () Bool)

(assert (=> b!619457 (=> (not res!399136) (not e!355266))))

(declare-fun lt!285936 () (_ BitVec 32))

(declare-fun lt!285933 () SeekEntryResult!6476)

(assert (=> b!619457 (= res!399136 (= lt!285933 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285936 vacantSpotIndex!68 lt!285937 lt!285928 mask!3053)))))

(assert (=> b!619457 (= lt!285933 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285936 vacantSpotIndex!68 (select (arr!18036 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619457 (= lt!285937 (select (store (arr!18036 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285927 () Unit!20488)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37580 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20488)

(assert (=> b!619457 (= lt!285927 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285936 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619457 (= lt!285936 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619458 () Bool)

(declare-fun e!355271 () Bool)

(assert (=> b!619458 (= e!355271 e!355270)))

(declare-fun res!399142 () Bool)

(assert (=> b!619458 (=> (not res!399142) (not e!355270))))

(declare-fun lt!285931 () SeekEntryResult!6476)

(assert (=> b!619458 (= res!399142 (and (= lt!285931 (Found!6476 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18036 a!2986) index!984) (select (arr!18036 a!2986) j!136))) (not (= (select (arr!18036 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619458 (= lt!285931 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18036 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619459 () Bool)

(declare-fun Unit!20494 () Unit!20488)

(assert (=> b!619459 (= e!355265 Unit!20494)))

(declare-fun b!619460 () Bool)

(declare-fun res!399143 () Bool)

(assert (=> b!619460 (=> (not res!399143) (not e!355260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619460 (= res!399143 (validKeyInArray!0 k!1786))))

(declare-fun b!619461 () Bool)

(assert (=> b!619461 false))

(declare-fun lt!285929 () Unit!20488)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37580 (_ BitVec 64) (_ BitVec 32) List!12077) Unit!20488)

(assert (=> b!619461 (= lt!285929 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285928 (select (arr!18036 a!2986) j!136) j!136 Nil!12074))))

(assert (=> b!619461 (arrayNoDuplicates!0 lt!285928 j!136 Nil!12074)))

(declare-fun lt!285918 () Unit!20488)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37580 (_ BitVec 32) (_ BitVec 32)) Unit!20488)

(assert (=> b!619461 (= lt!285918 (lemmaNoDuplicateFromThenFromBigger!0 lt!285928 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619461 (arrayNoDuplicates!0 lt!285928 #b00000000000000000000000000000000 Nil!12074)))

(declare-fun lt!285930 () Unit!20488)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12077) Unit!20488)

(assert (=> b!619461 (= lt!285930 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12074))))

(assert (=> b!619461 (arrayContainsKey!0 lt!285928 (select (arr!18036 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285923 () Unit!20488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20488)

(assert (=> b!619461 (= lt!285923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285928 (select (arr!18036 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20495 () Unit!20488)

(assert (=> b!619461 (= e!355259 Unit!20495)))

(declare-fun b!619462 () Bool)

(declare-fun e!355269 () Bool)

(assert (=> b!619462 (= e!355269 (arrayContainsKey!0 lt!285928 (select (arr!18036 a!2986) j!136) index!984))))

(declare-fun b!619463 () Bool)

(assert (=> b!619463 (= e!355260 e!355267)))

(declare-fun res!399134 () Bool)

(assert (=> b!619463 (=> (not res!399134) (not e!355267))))

(declare-fun lt!285932 () SeekEntryResult!6476)

(assert (=> b!619463 (= res!399134 (or (= lt!285932 (MissingZero!6476 i!1108)) (= lt!285932 (MissingVacant!6476 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37580 (_ BitVec 32)) SeekEntryResult!6476)

(assert (=> b!619463 (= lt!285932 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619464 () Bool)

(declare-fun res!399135 () Bool)

(assert (=> b!619464 (=> (not res!399135) (not e!355260))))

(assert (=> b!619464 (= res!399135 (and (= (size!18400 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18400 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18400 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619465 () Bool)

(assert (=> b!619465 (= e!355261 true)))

(assert (=> b!619465 (= (select (store (arr!18036 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619466 () Bool)

(declare-fun res!399133 () Bool)

(assert (=> b!619466 (= res!399133 (bvsge j!136 index!984))))

(assert (=> b!619466 (=> res!399133 e!355272)))

(assert (=> b!619466 (= e!355264 e!355272)))

(declare-fun b!619467 () Bool)

(declare-fun Unit!20496 () Unit!20488)

(assert (=> b!619467 (= e!355258 Unit!20496)))

(declare-fun b!619468 () Bool)

(assert (=> b!619468 (= e!355267 e!355271)))

(declare-fun res!399139 () Bool)

(assert (=> b!619468 (=> (not res!399139) (not e!355271))))

(assert (=> b!619468 (= res!399139 (= (select (store (arr!18036 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619468 (= lt!285928 (array!37581 (store (arr!18036 a!2986) i!1108 k!1786) (size!18400 a!2986)))))

(declare-fun b!619469 () Bool)

(declare-fun res!399131 () Bool)

(assert (=> b!619469 (=> (not res!399131) (not e!355260))))

(assert (=> b!619469 (= res!399131 (validKeyInArray!0 (select (arr!18036 a!2986) j!136)))))

(declare-fun b!619470 () Bool)

(assert (=> b!619470 (= e!355266 (= lt!285931 lt!285933))))

(declare-fun b!619471 () Bool)

(assert (=> b!619471 false))

(declare-fun lt!285919 () Unit!20488)

(assert (=> b!619471 (= lt!285919 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285928 (select (arr!18036 a!2986) j!136) index!984 Nil!12074))))

(assert (=> b!619471 (arrayNoDuplicates!0 lt!285928 index!984 Nil!12074)))

(declare-fun lt!285922 () Unit!20488)

(assert (=> b!619471 (= lt!285922 (lemmaNoDuplicateFromThenFromBigger!0 lt!285928 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619471 (arrayNoDuplicates!0 lt!285928 #b00000000000000000000000000000000 Nil!12074)))

(declare-fun lt!285920 () Unit!20488)

(assert (=> b!619471 (= lt!285920 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12074))))

(assert (=> b!619471 (arrayContainsKey!0 lt!285928 (select (arr!18036 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285926 () Unit!20488)

(assert (=> b!619471 (= lt!285926 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285928 (select (arr!18036 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619471 e!355269))

(declare-fun res!399146 () Bool)

(assert (=> b!619471 (=> (not res!399146) (not e!355269))))

(assert (=> b!619471 (= res!399146 (arrayContainsKey!0 lt!285928 (select (arr!18036 a!2986) j!136) j!136))))

(declare-fun Unit!20497 () Unit!20488)

(assert (=> b!619471 (= e!355258 Unit!20497)))

(declare-fun b!619472 () Bool)

(declare-fun res!399140 () Bool)

(assert (=> b!619472 (=> (not res!399140) (not e!355260))))

(assert (=> b!619472 (= res!399140 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56110 res!399137) b!619464))

(assert (= (and b!619464 res!399135) b!619469))

(assert (= (and b!619469 res!399131) b!619460))

(assert (= (and b!619460 res!399143) b!619472))

(assert (= (and b!619472 res!399140) b!619463))

(assert (= (and b!619463 res!399134) b!619448))

(assert (= (and b!619448 res!399138) b!619452))

(assert (= (and b!619452 res!399132) b!619450))

(assert (= (and b!619450 res!399145) b!619468))

(assert (= (and b!619468 res!399139) b!619458))

(assert (= (and b!619458 res!399142) b!619457))

(assert (= (and b!619457 res!399136) b!619470))

(assert (= (and b!619457 c!70527) b!619454))

(assert (= (and b!619457 (not c!70527)) b!619449))

(assert (= (and b!619457 c!70529) b!619453))

(assert (= (and b!619457 (not c!70529)) b!619459))

(assert (= (and b!619453 res!399130) b!619466))

(assert (= (and b!619466 (not res!399133)) b!619456))

(assert (= (and b!619456 res!399144) b!619455))

(assert (= (and b!619453 c!70528) b!619461))

(assert (= (and b!619453 (not c!70528)) b!619451))

(assert (= (and b!619453 c!70526) b!619471))

(assert (= (and b!619453 (not c!70526)) b!619467))

(assert (= (and b!619471 res!399146) b!619462))

(assert (= (and b!619457 (not res!399141)) b!619465))

(declare-fun m!595421 () Bool)

(assert (=> b!619458 m!595421))

(declare-fun m!595423 () Bool)

(assert (=> b!619458 m!595423))

(assert (=> b!619458 m!595423))

(declare-fun m!595425 () Bool)

(assert (=> b!619458 m!595425))

(declare-fun m!595427 () Bool)

(assert (=> b!619461 m!595427))

(assert (=> b!619461 m!595423))

(declare-fun m!595429 () Bool)

(assert (=> b!619461 m!595429))

(assert (=> b!619461 m!595423))

(declare-fun m!595431 () Bool)

(assert (=> b!619461 m!595431))

(assert (=> b!619461 m!595423))

(declare-fun m!595433 () Bool)

(assert (=> b!619461 m!595433))

(assert (=> b!619461 m!595423))

(declare-fun m!595435 () Bool)

(assert (=> b!619461 m!595435))

(declare-fun m!595437 () Bool)

(assert (=> b!619461 m!595437))

(declare-fun m!595439 () Bool)

(assert (=> b!619461 m!595439))

(declare-fun m!595441 () Bool)

(assert (=> b!619463 m!595441))

(declare-fun m!595443 () Bool)

(assert (=> b!619453 m!595443))

(declare-fun m!595445 () Bool)

(assert (=> b!619453 m!595445))

(assert (=> b!619453 m!595423))

(declare-fun m!595447 () Bool)

(assert (=> b!619472 m!595447))

(declare-fun m!595449 () Bool)

(assert (=> start!56110 m!595449))

(declare-fun m!595451 () Bool)

(assert (=> start!56110 m!595451))

(declare-fun m!595453 () Bool)

(assert (=> b!619457 m!595453))

(declare-fun m!595455 () Bool)

(assert (=> b!619457 m!595455))

(assert (=> b!619457 m!595423))

(assert (=> b!619457 m!595443))

(declare-fun m!595457 () Bool)

(assert (=> b!619457 m!595457))

(declare-fun m!595459 () Bool)

(assert (=> b!619457 m!595459))

(declare-fun m!595461 () Bool)

(assert (=> b!619457 m!595461))

(assert (=> b!619457 m!595423))

(declare-fun m!595463 () Bool)

(assert (=> b!619457 m!595463))

(assert (=> b!619465 m!595443))

(assert (=> b!619465 m!595445))

(assert (=> b!619469 m!595423))

(assert (=> b!619469 m!595423))

(declare-fun m!595465 () Bool)

(assert (=> b!619469 m!595465))

(assert (=> b!619462 m!595423))

(assert (=> b!619462 m!595423))

(declare-fun m!595467 () Bool)

(assert (=> b!619462 m!595467))

(assert (=> b!619455 m!595423))

(assert (=> b!619455 m!595423))

(assert (=> b!619455 m!595467))

(declare-fun m!595469 () Bool)

(assert (=> b!619460 m!595469))

(declare-fun m!595471 () Bool)

(assert (=> b!619452 m!595471))

(assert (=> b!619456 m!595423))

(assert (=> b!619456 m!595423))

(declare-fun m!595473 () Bool)

(assert (=> b!619456 m!595473))

(declare-fun m!595475 () Bool)

(assert (=> b!619450 m!595475))

(declare-fun m!595477 () Bool)

(assert (=> b!619448 m!595477))

(assert (=> b!619468 m!595443))

(declare-fun m!595479 () Bool)

(assert (=> b!619468 m!595479))

(declare-fun m!595481 () Bool)

(assert (=> b!619471 m!595481))

(assert (=> b!619471 m!595423))

(assert (=> b!619471 m!595423))

(assert (=> b!619471 m!595473))

(assert (=> b!619471 m!595423))

(declare-fun m!595483 () Bool)

(assert (=> b!619471 m!595483))

(assert (=> b!619471 m!595429))

(assert (=> b!619471 m!595423))

(declare-fun m!595485 () Bool)

(assert (=> b!619471 m!595485))

(assert (=> b!619471 m!595439))

(assert (=> b!619471 m!595423))

(declare-fun m!595487 () Bool)

(assert (=> b!619471 m!595487))

(declare-fun m!595489 () Bool)

(assert (=> b!619471 m!595489))

(push 1)

