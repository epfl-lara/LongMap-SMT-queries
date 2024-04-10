; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58446 () Bool)

(assert start!58446)

(declare-fun b!645574 () Bool)

(declare-datatypes ((array!38462 0))(
  ( (array!38463 (arr!18443 (Array (_ BitVec 32) (_ BitVec 64))) (size!18807 (_ BitVec 32))) )
))
(declare-fun lt!299401 () array!38462)

(declare-fun e!369981 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38462)

(declare-fun arrayContainsKey!0 (array!38462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645574 (= e!369981 (arrayContainsKey!0 lt!299401 (select (arr!18443 a!2986) j!136) index!984))))

(declare-fun b!645575 () Bool)

(declare-fun e!369985 () Bool)

(assert (=> b!645575 (= e!369985 true)))

(assert (=> b!645575 (arrayContainsKey!0 lt!299401 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!21924 0))(
  ( (Unit!21925) )
))
(declare-fun lt!299403 () Unit!21924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38462 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21924)

(assert (=> b!645575 (= lt!299403 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299401 (select (arr!18443 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645575 e!369981))

(declare-fun res!418308 () Bool)

(assert (=> b!645575 (=> (not res!418308) (not e!369981))))

(assert (=> b!645575 (= res!418308 (arrayContainsKey!0 lt!299401 (select (arr!18443 a!2986) j!136) j!136))))

(declare-fun b!645576 () Bool)

(declare-fun e!369973 () Unit!21924)

(declare-fun Unit!21926 () Unit!21924)

(assert (=> b!645576 (= e!369973 Unit!21926)))

(declare-fun b!645577 () Bool)

(declare-fun Unit!21927 () Unit!21924)

(assert (=> b!645577 (= e!369973 Unit!21927)))

(declare-fun lt!299404 () Unit!21924)

(assert (=> b!645577 (= lt!299404 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299401 (select (arr!18443 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645577 (arrayContainsKey!0 lt!299401 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!299393 () Unit!21924)

(declare-datatypes ((List!12484 0))(
  ( (Nil!12481) (Cons!12480 (h!13525 (_ BitVec 64)) (t!18712 List!12484)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38462 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12484) Unit!21924)

(assert (=> b!645577 (= lt!299393 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12481))))

(declare-fun arrayNoDuplicates!0 (array!38462 (_ BitVec 32) List!12484) Bool)

(assert (=> b!645577 (arrayNoDuplicates!0 lt!299401 #b00000000000000000000000000000000 Nil!12481)))

(declare-fun lt!299396 () Unit!21924)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38462 (_ BitVec 32) (_ BitVec 32)) Unit!21924)

(assert (=> b!645577 (= lt!299396 (lemmaNoDuplicateFromThenFromBigger!0 lt!299401 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645577 (arrayNoDuplicates!0 lt!299401 j!136 Nil!12481)))

(declare-fun lt!299390 () Unit!21924)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38462 (_ BitVec 64) (_ BitVec 32) List!12484) Unit!21924)

(assert (=> b!645577 (= lt!299390 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299401 (select (arr!18443 a!2986) j!136) j!136 Nil!12481))))

(assert (=> b!645577 false))

(declare-fun b!645578 () Bool)

(declare-fun res!418292 () Bool)

(declare-fun e!369986 () Bool)

(assert (=> b!645578 (=> (not res!418292) (not e!369986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645578 (= res!418292 (validKeyInArray!0 k!1786))))

(declare-fun b!645579 () Bool)

(declare-fun e!369982 () Bool)

(declare-fun e!369980 () Bool)

(assert (=> b!645579 (= e!369982 (not e!369980))))

(declare-fun res!418301 () Bool)

(assert (=> b!645579 (=> res!418301 e!369980)))

(declare-datatypes ((SeekEntryResult!6883 0))(
  ( (MissingZero!6883 (index!29867 (_ BitVec 32))) (Found!6883 (index!29868 (_ BitVec 32))) (Intermediate!6883 (undefined!7695 Bool) (index!29869 (_ BitVec 32)) (x!58636 (_ BitVec 32))) (Undefined!6883) (MissingVacant!6883 (index!29870 (_ BitVec 32))) )
))
(declare-fun lt!299394 () SeekEntryResult!6883)

(assert (=> b!645579 (= res!418301 (not (= lt!299394 (Found!6883 index!984))))))

(declare-fun lt!299400 () Unit!21924)

(declare-fun e!369978 () Unit!21924)

(assert (=> b!645579 (= lt!299400 e!369978)))

(declare-fun c!74008 () Bool)

(assert (=> b!645579 (= c!74008 (= lt!299394 Undefined!6883))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!299397 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38462 (_ BitVec 32)) SeekEntryResult!6883)

(assert (=> b!645579 (= lt!299394 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299397 lt!299401 mask!3053))))

(declare-fun e!369987 () Bool)

(assert (=> b!645579 e!369987))

(declare-fun res!418293 () Bool)

(assert (=> b!645579 (=> (not res!418293) (not e!369987))))

(declare-fun lt!299395 () SeekEntryResult!6883)

(declare-fun lt!299399 () (_ BitVec 32))

(assert (=> b!645579 (= res!418293 (= lt!299395 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299399 vacantSpotIndex!68 lt!299397 lt!299401 mask!3053)))))

(assert (=> b!645579 (= lt!299395 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299399 vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645579 (= lt!299397 (select (store (arr!18443 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299391 () Unit!21924)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21924)

(assert (=> b!645579 (= lt!299391 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299399 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645579 (= lt!299399 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645580 () Bool)

(declare-fun res!418296 () Bool)

(assert (=> b!645580 (=> (not res!418296) (not e!369986))))

(assert (=> b!645580 (= res!418296 (validKeyInArray!0 (select (arr!18443 a!2986) j!136)))))

(declare-fun b!645581 () Bool)

(declare-fun e!369984 () Bool)

(assert (=> b!645581 (= e!369986 e!369984)))

(declare-fun res!418299 () Bool)

(assert (=> b!645581 (=> (not res!418299) (not e!369984))))

(declare-fun lt!299398 () SeekEntryResult!6883)

(assert (=> b!645581 (= res!418299 (or (= lt!299398 (MissingZero!6883 i!1108)) (= lt!299398 (MissingVacant!6883 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38462 (_ BitVec 32)) SeekEntryResult!6883)

(assert (=> b!645581 (= lt!299398 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645582 () Bool)

(declare-fun res!418310 () Bool)

(assert (=> b!645582 (=> (not res!418310) (not e!369984))))

(assert (=> b!645582 (= res!418310 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12481))))

(declare-fun b!645583 () Bool)

(declare-fun res!418300 () Bool)

(assert (=> b!645583 (=> (not res!418300) (not e!369984))))

(assert (=> b!645583 (= res!418300 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18443 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645584 () Bool)

(declare-fun Unit!21928 () Unit!21924)

(assert (=> b!645584 (= e!369978 Unit!21928)))

(assert (=> b!645584 false))

(declare-fun b!645586 () Bool)

(declare-fun e!369975 () Bool)

(assert (=> b!645586 (= e!369975 e!369982)))

(declare-fun res!418306 () Bool)

(assert (=> b!645586 (=> (not res!418306) (not e!369982))))

(declare-fun lt!299392 () SeekEntryResult!6883)

(assert (=> b!645586 (= res!418306 (and (= lt!299392 (Found!6883 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18443 a!2986) index!984) (select (arr!18443 a!2986) j!136))) (not (= (select (arr!18443 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645586 (= lt!299392 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645587 () Bool)

(declare-fun res!418307 () Bool)

(assert (=> b!645587 (=> (not res!418307) (not e!369986))))

(assert (=> b!645587 (= res!418307 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645588 () Bool)

(declare-fun res!418298 () Bool)

(assert (=> b!645588 (=> (not res!418298) (not e!369986))))

(assert (=> b!645588 (= res!418298 (and (= (size!18807 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18807 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18807 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645589 () Bool)

(declare-fun res!418305 () Bool)

(assert (=> b!645589 (=> (not res!418305) (not e!369984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38462 (_ BitVec 32)) Bool)

(assert (=> b!645589 (= res!418305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645590 () Bool)

(assert (=> b!645590 (= e!369984 e!369975)))

(declare-fun res!418294 () Bool)

(assert (=> b!645590 (=> (not res!418294) (not e!369975))))

(assert (=> b!645590 (= res!418294 (= (select (store (arr!18443 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645590 (= lt!299401 (array!38463 (store (arr!18443 a!2986) i!1108 k!1786) (size!18807 a!2986)))))

(declare-fun b!645591 () Bool)

(declare-fun e!369983 () Bool)

(assert (=> b!645591 (= e!369983 e!369985)))

(declare-fun res!418297 () Bool)

(assert (=> b!645591 (=> res!418297 e!369985)))

(assert (=> b!645591 (= res!418297 (bvsge index!984 j!136))))

(declare-fun lt!299402 () Unit!21924)

(assert (=> b!645591 (= lt!299402 e!369973)))

(declare-fun c!74009 () Bool)

(assert (=> b!645591 (= c!74009 (bvslt j!136 index!984))))

(declare-fun b!645592 () Bool)

(assert (=> b!645592 (= e!369980 e!369983)))

(declare-fun res!418295 () Bool)

(assert (=> b!645592 (=> res!418295 e!369983)))

(declare-fun lt!299389 () (_ BitVec 64))

(assert (=> b!645592 (= res!418295 (or (not (= (select (arr!18443 a!2986) j!136) lt!299397)) (not (= (select (arr!18443 a!2986) j!136) lt!299389))))))

(declare-fun e!369976 () Bool)

(assert (=> b!645592 e!369976))

(declare-fun res!418309 () Bool)

(assert (=> b!645592 (=> (not res!418309) (not e!369976))))

(assert (=> b!645592 (= res!418309 (= lt!299389 (select (arr!18443 a!2986) j!136)))))

(assert (=> b!645592 (= lt!299389 (select (store (arr!18443 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!645593 () Bool)

(assert (=> b!645593 (= e!369987 (= lt!299392 lt!299395))))

(declare-fun b!645594 () Bool)

(declare-fun Unit!21929 () Unit!21924)

(assert (=> b!645594 (= e!369978 Unit!21929)))

(declare-fun b!645595 () Bool)

(declare-fun e!369974 () Bool)

(declare-fun e!369977 () Bool)

(assert (=> b!645595 (= e!369974 e!369977)))

(declare-fun res!418302 () Bool)

(assert (=> b!645595 (=> (not res!418302) (not e!369977))))

(assert (=> b!645595 (= res!418302 (arrayContainsKey!0 lt!299401 (select (arr!18443 a!2986) j!136) j!136))))

(declare-fun b!645596 () Bool)

(assert (=> b!645596 (= e!369977 (arrayContainsKey!0 lt!299401 (select (arr!18443 a!2986) j!136) index!984))))

(declare-fun b!645585 () Bool)

(assert (=> b!645585 (= e!369976 e!369974)))

(declare-fun res!418304 () Bool)

(assert (=> b!645585 (=> res!418304 e!369974)))

(assert (=> b!645585 (= res!418304 (or (not (= (select (arr!18443 a!2986) j!136) lt!299397)) (not (= (select (arr!18443 a!2986) j!136) lt!299389)) (bvsge j!136 index!984)))))

(declare-fun res!418303 () Bool)

(assert (=> start!58446 (=> (not res!418303) (not e!369986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58446 (= res!418303 (validMask!0 mask!3053))))

(assert (=> start!58446 e!369986))

(assert (=> start!58446 true))

(declare-fun array_inv!14239 (array!38462) Bool)

(assert (=> start!58446 (array_inv!14239 a!2986)))

(assert (= (and start!58446 res!418303) b!645588))

(assert (= (and b!645588 res!418298) b!645580))

(assert (= (and b!645580 res!418296) b!645578))

(assert (= (and b!645578 res!418292) b!645587))

(assert (= (and b!645587 res!418307) b!645581))

(assert (= (and b!645581 res!418299) b!645589))

(assert (= (and b!645589 res!418305) b!645582))

(assert (= (and b!645582 res!418310) b!645583))

(assert (= (and b!645583 res!418300) b!645590))

(assert (= (and b!645590 res!418294) b!645586))

(assert (= (and b!645586 res!418306) b!645579))

(assert (= (and b!645579 res!418293) b!645593))

(assert (= (and b!645579 c!74008) b!645584))

(assert (= (and b!645579 (not c!74008)) b!645594))

(assert (= (and b!645579 (not res!418301)) b!645592))

(assert (= (and b!645592 res!418309) b!645585))

(assert (= (and b!645585 (not res!418304)) b!645595))

(assert (= (and b!645595 res!418302) b!645596))

(assert (= (and b!645592 (not res!418295)) b!645591))

(assert (= (and b!645591 c!74009) b!645577))

(assert (= (and b!645591 (not c!74009)) b!645576))

(assert (= (and b!645591 (not res!418297)) b!645575))

(assert (= (and b!645575 res!418308) b!645574))

(declare-fun m!619081 () Bool)

(assert (=> b!645580 m!619081))

(assert (=> b!645580 m!619081))

(declare-fun m!619083 () Bool)

(assert (=> b!645580 m!619083))

(declare-fun m!619085 () Bool)

(assert (=> b!645578 m!619085))

(assert (=> b!645577 m!619081))

(declare-fun m!619087 () Bool)

(assert (=> b!645577 m!619087))

(assert (=> b!645577 m!619081))

(assert (=> b!645577 m!619081))

(declare-fun m!619089 () Bool)

(assert (=> b!645577 m!619089))

(declare-fun m!619091 () Bool)

(assert (=> b!645577 m!619091))

(declare-fun m!619093 () Bool)

(assert (=> b!645577 m!619093))

(declare-fun m!619095 () Bool)

(assert (=> b!645577 m!619095))

(assert (=> b!645577 m!619081))

(declare-fun m!619097 () Bool)

(assert (=> b!645577 m!619097))

(declare-fun m!619099 () Bool)

(assert (=> b!645577 m!619099))

(assert (=> b!645595 m!619081))

(assert (=> b!645595 m!619081))

(declare-fun m!619101 () Bool)

(assert (=> b!645595 m!619101))

(declare-fun m!619103 () Bool)

(assert (=> b!645582 m!619103))

(declare-fun m!619105 () Bool)

(assert (=> b!645586 m!619105))

(assert (=> b!645586 m!619081))

(assert (=> b!645586 m!619081))

(declare-fun m!619107 () Bool)

(assert (=> b!645586 m!619107))

(declare-fun m!619109 () Bool)

(assert (=> b!645579 m!619109))

(declare-fun m!619111 () Bool)

(assert (=> b!645579 m!619111))

(assert (=> b!645579 m!619081))

(declare-fun m!619113 () Bool)

(assert (=> b!645579 m!619113))

(declare-fun m!619115 () Bool)

(assert (=> b!645579 m!619115))

(assert (=> b!645579 m!619081))

(declare-fun m!619117 () Bool)

(assert (=> b!645579 m!619117))

(declare-fun m!619119 () Bool)

(assert (=> b!645579 m!619119))

(declare-fun m!619121 () Bool)

(assert (=> b!645579 m!619121))

(declare-fun m!619123 () Bool)

(assert (=> start!58446 m!619123))

(declare-fun m!619125 () Bool)

(assert (=> start!58446 m!619125))

(assert (=> b!645592 m!619081))

(assert (=> b!645592 m!619113))

(declare-fun m!619127 () Bool)

(assert (=> b!645592 m!619127))

(declare-fun m!619129 () Bool)

(assert (=> b!645581 m!619129))

(assert (=> b!645590 m!619113))

(declare-fun m!619131 () Bool)

(assert (=> b!645590 m!619131))

(assert (=> b!645585 m!619081))

(assert (=> b!645596 m!619081))

(assert (=> b!645596 m!619081))

(declare-fun m!619133 () Bool)

(assert (=> b!645596 m!619133))

(assert (=> b!645574 m!619081))

(assert (=> b!645574 m!619081))

(assert (=> b!645574 m!619133))

(declare-fun m!619135 () Bool)

(assert (=> b!645589 m!619135))

(declare-fun m!619137 () Bool)

(assert (=> b!645587 m!619137))

(assert (=> b!645575 m!619081))

(assert (=> b!645575 m!619081))

(declare-fun m!619139 () Bool)

(assert (=> b!645575 m!619139))

(assert (=> b!645575 m!619081))

(declare-fun m!619141 () Bool)

(assert (=> b!645575 m!619141))

(assert (=> b!645575 m!619081))

(assert (=> b!645575 m!619101))

(declare-fun m!619143 () Bool)

(assert (=> b!645583 m!619143))

(push 1)

(assert (not b!645595))

(assert (not b!645596))

(assert (not start!58446))

(assert (not b!645587))

(assert (not b!645575))

(assert (not b!645581))

(assert (not b!645582))

(assert (not b!645574))

(assert (not b!645579))

(assert (not b!645589))

(assert (not b!645578))

(assert (not b!645580))

(assert (not b!645577))

(assert (not b!645586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

