; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59268 () Bool)

(assert start!59268)

(declare-fun res!423671 () Bool)

(declare-fun e!375118 () Bool)

(assert (=> start!59268 (=> (not res!423671) (not e!375118))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59268 (= res!423671 (validMask!0 mask!3053))))

(assert (=> start!59268 e!375118))

(assert (=> start!59268 true))

(declare-datatypes ((array!38619 0))(
  ( (array!38620 (arr!18508 (Array (_ BitVec 32) (_ BitVec 64))) (size!18872 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38619)

(declare-fun array_inv!14367 (array!38619) Bool)

(assert (=> start!59268 (array_inv!14367 a!2986)))

(declare-fun b!653382 () Bool)

(declare-fun e!375115 () Bool)

(declare-fun e!375111 () Bool)

(assert (=> b!653382 (= e!375115 e!375111)))

(declare-fun res!423688 () Bool)

(assert (=> b!653382 (=> res!423688 e!375111)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!653382 (= res!423688 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22323 0))(
  ( (Unit!22324) )
))
(declare-fun lt!304136 () Unit!22323)

(declare-fun e!375110 () Unit!22323)

(assert (=> b!653382 (= lt!304136 e!375110)))

(declare-fun c!75226 () Bool)

(assert (=> b!653382 (= c!75226 (bvslt j!136 index!984))))

(declare-fun b!653383 () Bool)

(declare-fun Unit!22325 () Unit!22323)

(assert (=> b!653383 (= e!375110 Unit!22325)))

(declare-fun lt!304139 () array!38619)

(declare-fun lt!304138 () Unit!22323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22323)

(assert (=> b!653383 (= lt!304138 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304139 (select (arr!18508 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!653383 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!304141 () Unit!22323)

(declare-datatypes ((List!12456 0))(
  ( (Nil!12453) (Cons!12452 (h!13500 (_ BitVec 64)) (t!18676 List!12456)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12456) Unit!22323)

(assert (=> b!653383 (= lt!304141 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12453))))

(declare-fun arrayNoDuplicates!0 (array!38619 (_ BitVec 32) List!12456) Bool)

(assert (=> b!653383 (arrayNoDuplicates!0 lt!304139 #b00000000000000000000000000000000 Nil!12453)))

(declare-fun lt!304129 () Unit!22323)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38619 (_ BitVec 32) (_ BitVec 32)) Unit!22323)

(assert (=> b!653383 (= lt!304129 (lemmaNoDuplicateFromThenFromBigger!0 lt!304139 #b00000000000000000000000000000000 j!136))))

(assert (=> b!653383 (arrayNoDuplicates!0 lt!304139 j!136 Nil!12453)))

(declare-fun lt!304140 () Unit!22323)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38619 (_ BitVec 64) (_ BitVec 32) List!12456) Unit!22323)

(assert (=> b!653383 (= lt!304140 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304139 (select (arr!18508 a!2986) j!136) j!136 Nil!12453))))

(assert (=> b!653383 false))

(declare-fun b!653384 () Bool)

(declare-fun res!423686 () Bool)

(declare-fun e!375113 () Bool)

(assert (=> b!653384 (=> (not res!423686) (not e!375113))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!653384 (= res!423686 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18508 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653385 () Bool)

(declare-fun res!423676 () Bool)

(assert (=> b!653385 (=> (not res!423676) (not e!375118))))

(assert (=> b!653385 (= res!423676 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!653386 () Bool)

(declare-fun res!423677 () Bool)

(assert (=> b!653386 (=> (not res!423677) (not e!375113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38619 (_ BitVec 32)) Bool)

(assert (=> b!653386 (= res!423677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!653387 () Bool)

(declare-fun res!423672 () Bool)

(assert (=> b!653387 (=> (not res!423672) (not e!375118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!653387 (= res!423672 (validKeyInArray!0 (select (arr!18508 a!2986) j!136)))))

(declare-fun b!653388 () Bool)

(declare-fun e!375116 () Bool)

(assert (=> b!653388 (= e!375116 e!375115)))

(declare-fun res!423687 () Bool)

(assert (=> b!653388 (=> res!423687 e!375115)))

(declare-fun lt!304128 () (_ BitVec 64))

(declare-fun lt!304126 () (_ BitVec 64))

(assert (=> b!653388 (= res!423687 (or (not (= (select (arr!18508 a!2986) j!136) lt!304128)) (not (= (select (arr!18508 a!2986) j!136) lt!304126))))))

(declare-fun e!375114 () Bool)

(assert (=> b!653388 e!375114))

(declare-fun res!423670 () Bool)

(assert (=> b!653388 (=> (not res!423670) (not e!375114))))

(assert (=> b!653388 (= res!423670 (= lt!304126 (select (arr!18508 a!2986) j!136)))))

(assert (=> b!653388 (= lt!304126 (select (store (arr!18508 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!653389 () Bool)

(declare-fun e!375105 () Bool)

(declare-datatypes ((SeekEntryResult!6904 0))(
  ( (MissingZero!6904 (index!29972 (_ BitVec 32))) (Found!6904 (index!29973 (_ BitVec 32))) (Intermediate!6904 (undefined!7716 Bool) (index!29974 (_ BitVec 32)) (x!58915 (_ BitVec 32))) (Undefined!6904) (MissingVacant!6904 (index!29975 (_ BitVec 32))) )
))
(declare-fun lt!304134 () SeekEntryResult!6904)

(declare-fun lt!304133 () SeekEntryResult!6904)

(assert (=> b!653389 (= e!375105 (= lt!304134 lt!304133))))

(declare-fun b!653390 () Bool)

(declare-fun res!423679 () Bool)

(assert (=> b!653390 (=> (not res!423679) (not e!375118))))

(assert (=> b!653390 (= res!423679 (validKeyInArray!0 k0!1786))))

(declare-fun b!653391 () Bool)

(declare-fun e!375104 () Bool)

(assert (=> b!653391 (= e!375104 (not e!375116))))

(declare-fun res!423675 () Bool)

(assert (=> b!653391 (=> res!423675 e!375116)))

(declare-fun lt!304131 () SeekEntryResult!6904)

(assert (=> b!653391 (= res!423675 (not (= lt!304131 (Found!6904 index!984))))))

(declare-fun lt!304135 () Unit!22323)

(declare-fun e!375120 () Unit!22323)

(assert (=> b!653391 (= lt!304135 e!375120)))

(declare-fun c!75227 () Bool)

(assert (=> b!653391 (= c!75227 (= lt!304131 Undefined!6904))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38619 (_ BitVec 32)) SeekEntryResult!6904)

(assert (=> b!653391 (= lt!304131 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304128 lt!304139 mask!3053))))

(assert (=> b!653391 e!375105))

(declare-fun res!423685 () Bool)

(assert (=> b!653391 (=> (not res!423685) (not e!375105))))

(declare-fun lt!304124 () (_ BitVec 32))

(assert (=> b!653391 (= res!423685 (= lt!304133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 lt!304128 lt!304139 mask!3053)))))

(assert (=> b!653391 (= lt!304133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!653391 (= lt!304128 (select (store (arr!18508 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304130 () Unit!22323)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22323)

(assert (=> b!653391 (= lt!304130 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!653391 (= lt!304124 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!653392 () Bool)

(declare-fun e!375107 () Bool)

(assert (=> b!653392 (= e!375107 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) index!984))))

(declare-fun b!653393 () Bool)

(declare-fun Unit!22326 () Unit!22323)

(assert (=> b!653393 (= e!375120 Unit!22326)))

(declare-fun b!653394 () Bool)

(declare-fun res!423682 () Bool)

(assert (=> b!653394 (=> (not res!423682) (not e!375118))))

(assert (=> b!653394 (= res!423682 (and (= (size!18872 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18872 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18872 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!653395 () Bool)

(declare-fun e!375108 () Bool)

(declare-fun e!375106 () Bool)

(assert (=> b!653395 (= e!375108 e!375106)))

(declare-fun res!423668 () Bool)

(assert (=> b!653395 (=> (not res!423668) (not e!375106))))

(declare-fun contains!3160 (List!12456 (_ BitVec 64)) Bool)

(assert (=> b!653395 (= res!423668 (not (contains!3160 Nil!12453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653396 () Bool)

(declare-fun Unit!22327 () Unit!22323)

(assert (=> b!653396 (= e!375110 Unit!22327)))

(declare-fun b!653397 () Bool)

(declare-fun e!375117 () Bool)

(assert (=> b!653397 (= e!375114 e!375117)))

(declare-fun res!423667 () Bool)

(assert (=> b!653397 (=> res!423667 e!375117)))

(assert (=> b!653397 (= res!423667 (or (not (= (select (arr!18508 a!2986) j!136) lt!304128)) (not (= (select (arr!18508 a!2986) j!136) lt!304126)) (bvsge j!136 index!984)))))

(declare-fun b!653398 () Bool)

(assert (=> b!653398 (= e!375111 e!375108)))

(declare-fun res!423673 () Bool)

(assert (=> b!653398 (=> res!423673 e!375108)))

(assert (=> b!653398 (= res!423673 (or (bvsge (size!18872 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18872 a!2986)) (bvsge index!984 (size!18872 a!2986))))))

(assert (=> b!653398 (arrayNoDuplicates!0 lt!304139 index!984 Nil!12453)))

(declare-fun lt!304132 () Unit!22323)

(assert (=> b!653398 (= lt!304132 (lemmaNoDuplicateFromThenFromBigger!0 lt!304139 #b00000000000000000000000000000000 index!984))))

(assert (=> b!653398 (arrayNoDuplicates!0 lt!304139 #b00000000000000000000000000000000 Nil!12453)))

(declare-fun lt!304125 () Unit!22323)

(assert (=> b!653398 (= lt!304125 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12453))))

(assert (=> b!653398 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304127 () Unit!22323)

(assert (=> b!653398 (= lt!304127 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304139 (select (arr!18508 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!653398 e!375107))

(declare-fun res!423683 () Bool)

(assert (=> b!653398 (=> (not res!423683) (not e!375107))))

(assert (=> b!653398 (= res!423683 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) j!136))))

(declare-fun b!653399 () Bool)

(declare-fun e!375119 () Bool)

(assert (=> b!653399 (= e!375119 e!375104)))

(declare-fun res!423681 () Bool)

(assert (=> b!653399 (=> (not res!423681) (not e!375104))))

(assert (=> b!653399 (= res!423681 (and (= lt!304134 (Found!6904 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18508 a!2986) index!984) (select (arr!18508 a!2986) j!136))) (not (= (select (arr!18508 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!653399 (= lt!304134 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653400 () Bool)

(declare-fun res!423680 () Bool)

(assert (=> b!653400 (=> res!423680 e!375108)))

(declare-fun noDuplicate!442 (List!12456) Bool)

(assert (=> b!653400 (= res!423680 (not (noDuplicate!442 Nil!12453)))))

(declare-fun b!653401 () Bool)

(assert (=> b!653401 (= e!375106 (not (contains!3160 Nil!12453 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653402 () Bool)

(declare-fun res!423684 () Bool)

(assert (=> b!653402 (=> (not res!423684) (not e!375113))))

(assert (=> b!653402 (= res!423684 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12453))))

(declare-fun b!653403 () Bool)

(declare-fun Unit!22328 () Unit!22323)

(assert (=> b!653403 (= e!375120 Unit!22328)))

(assert (=> b!653403 false))

(declare-fun e!375112 () Bool)

(declare-fun b!653404 () Bool)

(assert (=> b!653404 (= e!375112 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) index!984))))

(declare-fun b!653405 () Bool)

(assert (=> b!653405 (= e!375113 e!375119)))

(declare-fun res!423674 () Bool)

(assert (=> b!653405 (=> (not res!423674) (not e!375119))))

(assert (=> b!653405 (= res!423674 (= (select (store (arr!18508 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653405 (= lt!304139 (array!38620 (store (arr!18508 a!2986) i!1108 k0!1786) (size!18872 a!2986)))))

(declare-fun b!653406 () Bool)

(assert (=> b!653406 (= e!375118 e!375113)))

(declare-fun res!423669 () Bool)

(assert (=> b!653406 (=> (not res!423669) (not e!375113))))

(declare-fun lt!304137 () SeekEntryResult!6904)

(assert (=> b!653406 (= res!423669 (or (= lt!304137 (MissingZero!6904 i!1108)) (= lt!304137 (MissingVacant!6904 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38619 (_ BitVec 32)) SeekEntryResult!6904)

(assert (=> b!653406 (= lt!304137 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!653407 () Bool)

(assert (=> b!653407 (= e!375117 e!375112)))

(declare-fun res!423678 () Bool)

(assert (=> b!653407 (=> (not res!423678) (not e!375112))))

(assert (=> b!653407 (= res!423678 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) j!136))))

(assert (= (and start!59268 res!423671) b!653394))

(assert (= (and b!653394 res!423682) b!653387))

(assert (= (and b!653387 res!423672) b!653390))

(assert (= (and b!653390 res!423679) b!653385))

(assert (= (and b!653385 res!423676) b!653406))

(assert (= (and b!653406 res!423669) b!653386))

(assert (= (and b!653386 res!423677) b!653402))

(assert (= (and b!653402 res!423684) b!653384))

(assert (= (and b!653384 res!423686) b!653405))

(assert (= (and b!653405 res!423674) b!653399))

(assert (= (and b!653399 res!423681) b!653391))

(assert (= (and b!653391 res!423685) b!653389))

(assert (= (and b!653391 c!75227) b!653403))

(assert (= (and b!653391 (not c!75227)) b!653393))

(assert (= (and b!653391 (not res!423675)) b!653388))

(assert (= (and b!653388 res!423670) b!653397))

(assert (= (and b!653397 (not res!423667)) b!653407))

(assert (= (and b!653407 res!423678) b!653404))

(assert (= (and b!653388 (not res!423687)) b!653382))

(assert (= (and b!653382 c!75226) b!653383))

(assert (= (and b!653382 (not c!75226)) b!653396))

(assert (= (and b!653382 (not res!423688)) b!653398))

(assert (= (and b!653398 res!423683) b!653392))

(assert (= (and b!653398 (not res!423673)) b!653400))

(assert (= (and b!653400 (not res!423680)) b!653395))

(assert (= (and b!653395 res!423668) b!653401))

(declare-fun m!626959 () Bool)

(assert (=> b!653401 m!626959))

(declare-fun m!626961 () Bool)

(assert (=> b!653399 m!626961))

(declare-fun m!626963 () Bool)

(assert (=> b!653399 m!626963))

(assert (=> b!653399 m!626963))

(declare-fun m!626965 () Bool)

(assert (=> b!653399 m!626965))

(declare-fun m!626967 () Bool)

(assert (=> start!59268 m!626967))

(declare-fun m!626969 () Bool)

(assert (=> start!59268 m!626969))

(assert (=> b!653404 m!626963))

(assert (=> b!653404 m!626963))

(declare-fun m!626971 () Bool)

(assert (=> b!653404 m!626971))

(declare-fun m!626973 () Bool)

(assert (=> b!653385 m!626973))

(declare-fun m!626975 () Bool)

(assert (=> b!653406 m!626975))

(assert (=> b!653387 m!626963))

(assert (=> b!653387 m!626963))

(declare-fun m!626977 () Bool)

(assert (=> b!653387 m!626977))

(assert (=> b!653383 m!626963))

(declare-fun m!626979 () Bool)

(assert (=> b!653383 m!626979))

(declare-fun m!626981 () Bool)

(assert (=> b!653383 m!626981))

(declare-fun m!626983 () Bool)

(assert (=> b!653383 m!626983))

(assert (=> b!653383 m!626963))

(declare-fun m!626985 () Bool)

(assert (=> b!653383 m!626985))

(assert (=> b!653383 m!626963))

(declare-fun m!626987 () Bool)

(assert (=> b!653383 m!626987))

(assert (=> b!653383 m!626963))

(declare-fun m!626989 () Bool)

(assert (=> b!653383 m!626989))

(declare-fun m!626991 () Bool)

(assert (=> b!653383 m!626991))

(declare-fun m!626993 () Bool)

(assert (=> b!653402 m!626993))

(declare-fun m!626995 () Bool)

(assert (=> b!653395 m!626995))

(assert (=> b!653392 m!626963))

(assert (=> b!653392 m!626963))

(assert (=> b!653392 m!626971))

(assert (=> b!653398 m!626979))

(assert (=> b!653398 m!626963))

(declare-fun m!626997 () Bool)

(assert (=> b!653398 m!626997))

(declare-fun m!626999 () Bool)

(assert (=> b!653398 m!626999))

(declare-fun m!627001 () Bool)

(assert (=> b!653398 m!627001))

(assert (=> b!653398 m!626963))

(assert (=> b!653398 m!626963))

(declare-fun m!627003 () Bool)

(assert (=> b!653398 m!627003))

(assert (=> b!653398 m!626963))

(declare-fun m!627005 () Bool)

(assert (=> b!653398 m!627005))

(assert (=> b!653398 m!626991))

(assert (=> b!653407 m!626963))

(assert (=> b!653407 m!626963))

(assert (=> b!653407 m!627003))

(declare-fun m!627007 () Bool)

(assert (=> b!653391 m!627007))

(declare-fun m!627009 () Bool)

(assert (=> b!653391 m!627009))

(declare-fun m!627011 () Bool)

(assert (=> b!653391 m!627011))

(assert (=> b!653391 m!626963))

(declare-fun m!627013 () Bool)

(assert (=> b!653391 m!627013))

(declare-fun m!627015 () Bool)

(assert (=> b!653391 m!627015))

(declare-fun m!627017 () Bool)

(assert (=> b!653391 m!627017))

(assert (=> b!653391 m!626963))

(declare-fun m!627019 () Bool)

(assert (=> b!653391 m!627019))

(declare-fun m!627021 () Bool)

(assert (=> b!653384 m!627021))

(assert (=> b!653388 m!626963))

(assert (=> b!653388 m!627013))

(declare-fun m!627023 () Bool)

(assert (=> b!653388 m!627023))

(assert (=> b!653397 m!626963))

(declare-fun m!627025 () Bool)

(assert (=> b!653400 m!627025))

(declare-fun m!627027 () Bool)

(assert (=> b!653386 m!627027))

(assert (=> b!653405 m!627013))

(declare-fun m!627029 () Bool)

(assert (=> b!653405 m!627029))

(declare-fun m!627031 () Bool)

(assert (=> b!653390 m!627031))

(check-sat (not b!653383) (not b!653395) (not b!653391) (not b!653404) (not b!653385) (not b!653392) (not b!653406) (not start!59268) (not b!653400) (not b!653401) (not b!653407) (not b!653398) (not b!653390) (not b!653387) (not b!653386) (not b!653399) (not b!653402))
(check-sat)
(get-model)

(declare-fun d!92513 () Bool)

(declare-fun res!423825 () Bool)

(declare-fun e!375227 () Bool)

(assert (=> d!92513 (=> res!423825 e!375227)))

(assert (=> d!92513 (= res!423825 (= (select (arr!18508 lt!304139) index!984) (select (arr!18508 a!2986) j!136)))))

(assert (=> d!92513 (= (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) index!984) e!375227)))

(declare-fun b!653568 () Bool)

(declare-fun e!375228 () Bool)

(assert (=> b!653568 (= e!375227 e!375228)))

(declare-fun res!423826 () Bool)

(assert (=> b!653568 (=> (not res!423826) (not e!375228))))

(assert (=> b!653568 (= res!423826 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18872 lt!304139)))))

(declare-fun b!653569 () Bool)

(assert (=> b!653569 (= e!375228 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92513 (not res!423825)) b!653568))

(assert (= (and b!653568 res!423826) b!653569))

(declare-fun m!627181 () Bool)

(assert (=> d!92513 m!627181))

(assert (=> b!653569 m!626963))

(declare-fun m!627183 () Bool)

(assert (=> b!653569 m!627183))

(assert (=> b!653404 d!92513))

(declare-fun d!92515 () Bool)

(assert (=> d!92515 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304252 () Unit!22323)

(declare-fun choose!114 (array!38619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22323)

(assert (=> d!92515 (= lt!304252 (choose!114 lt!304139 (select (arr!18508 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92515 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92515 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304139 (select (arr!18508 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!304252)))

(declare-fun bs!19493 () Bool)

(assert (= bs!19493 d!92515))

(assert (=> bs!19493 m!626963))

(assert (=> bs!19493 m!626987))

(assert (=> bs!19493 m!626963))

(declare-fun m!627185 () Bool)

(assert (=> bs!19493 m!627185))

(assert (=> b!653383 d!92515))

(declare-fun d!92517 () Bool)

(declare-fun res!423835 () Bool)

(declare-fun e!375237 () Bool)

(assert (=> d!92517 (=> res!423835 e!375237)))

(assert (=> d!92517 (= res!423835 (bvsge j!136 (size!18872 lt!304139)))))

(assert (=> d!92517 (= (arrayNoDuplicates!0 lt!304139 j!136 Nil!12453) e!375237)))

(declare-fun b!653580 () Bool)

(declare-fun e!375240 () Bool)

(declare-fun call!33816 () Bool)

(assert (=> b!653580 (= e!375240 call!33816)))

(declare-fun b!653581 () Bool)

(declare-fun e!375238 () Bool)

(assert (=> b!653581 (= e!375238 (contains!3160 Nil!12453 (select (arr!18508 lt!304139) j!136)))))

(declare-fun bm!33813 () Bool)

(declare-fun c!75242 () Bool)

(assert (=> bm!33813 (= call!33816 (arrayNoDuplicates!0 lt!304139 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75242 (Cons!12452 (select (arr!18508 lt!304139) j!136) Nil!12453) Nil!12453)))))

(declare-fun b!653582 () Bool)

(declare-fun e!375239 () Bool)

(assert (=> b!653582 (= e!375237 e!375239)))

(declare-fun res!423834 () Bool)

(assert (=> b!653582 (=> (not res!423834) (not e!375239))))

(assert (=> b!653582 (= res!423834 (not e!375238))))

(declare-fun res!423833 () Bool)

(assert (=> b!653582 (=> (not res!423833) (not e!375238))))

(assert (=> b!653582 (= res!423833 (validKeyInArray!0 (select (arr!18508 lt!304139) j!136)))))

(declare-fun b!653583 () Bool)

(assert (=> b!653583 (= e!375240 call!33816)))

(declare-fun b!653584 () Bool)

(assert (=> b!653584 (= e!375239 e!375240)))

(assert (=> b!653584 (= c!75242 (validKeyInArray!0 (select (arr!18508 lt!304139) j!136)))))

(assert (= (and d!92517 (not res!423835)) b!653582))

(assert (= (and b!653582 res!423833) b!653581))

(assert (= (and b!653582 res!423834) b!653584))

(assert (= (and b!653584 c!75242) b!653583))

(assert (= (and b!653584 (not c!75242)) b!653580))

(assert (= (or b!653583 b!653580) bm!33813))

(declare-fun m!627187 () Bool)

(assert (=> b!653581 m!627187))

(assert (=> b!653581 m!627187))

(declare-fun m!627189 () Bool)

(assert (=> b!653581 m!627189))

(assert (=> bm!33813 m!627187))

(declare-fun m!627191 () Bool)

(assert (=> bm!33813 m!627191))

(assert (=> b!653582 m!627187))

(assert (=> b!653582 m!627187))

(declare-fun m!627193 () Bool)

(assert (=> b!653582 m!627193))

(assert (=> b!653584 m!627187))

(assert (=> b!653584 m!627187))

(assert (=> b!653584 m!627193))

(assert (=> b!653383 d!92517))

(declare-fun d!92519 () Bool)

(declare-fun res!423836 () Bool)

(declare-fun e!375241 () Bool)

(assert (=> d!92519 (=> res!423836 e!375241)))

(assert (=> d!92519 (= res!423836 (= (select (arr!18508 lt!304139) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18508 a!2986) j!136)))))

(assert (=> d!92519 (= (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!375241)))

(declare-fun b!653585 () Bool)

(declare-fun e!375242 () Bool)

(assert (=> b!653585 (= e!375241 e!375242)))

(declare-fun res!423837 () Bool)

(assert (=> b!653585 (=> (not res!423837) (not e!375242))))

(assert (=> b!653585 (= res!423837 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18872 lt!304139)))))

(declare-fun b!653586 () Bool)

(assert (=> b!653586 (= e!375242 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92519 (not res!423836)) b!653585))

(assert (= (and b!653585 res!423837) b!653586))

(declare-fun m!627195 () Bool)

(assert (=> d!92519 m!627195))

(assert (=> b!653586 m!626963))

(declare-fun m!627197 () Bool)

(assert (=> b!653586 m!627197))

(assert (=> b!653383 d!92519))

(declare-fun d!92521 () Bool)

(assert (=> d!92521 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18872 lt!304139)) (not (= (select (arr!18508 lt!304139) j!136) (select (arr!18508 a!2986) j!136))))))

(declare-fun lt!304255 () Unit!22323)

(declare-fun choose!21 (array!38619 (_ BitVec 64) (_ BitVec 32) List!12456) Unit!22323)

(assert (=> d!92521 (= lt!304255 (choose!21 lt!304139 (select (arr!18508 a!2986) j!136) j!136 Nil!12453))))

(assert (=> d!92521 (bvslt (size!18872 lt!304139) #b01111111111111111111111111111111)))

(assert (=> d!92521 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304139 (select (arr!18508 a!2986) j!136) j!136 Nil!12453) lt!304255)))

(declare-fun bs!19494 () Bool)

(assert (= bs!19494 d!92521))

(assert (=> bs!19494 m!627187))

(assert (=> bs!19494 m!626963))

(declare-fun m!627199 () Bool)

(assert (=> bs!19494 m!627199))

(assert (=> b!653383 d!92521))

(declare-fun d!92523 () Bool)

(declare-fun e!375245 () Bool)

(assert (=> d!92523 e!375245))

(declare-fun res!423840 () Bool)

(assert (=> d!92523 (=> (not res!423840) (not e!375245))))

(assert (=> d!92523 (= res!423840 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18872 a!2986))))))

(declare-fun lt!304258 () Unit!22323)

(declare-fun choose!41 (array!38619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12456) Unit!22323)

(assert (=> d!92523 (= lt!304258 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12453))))

(assert (=> d!92523 (bvslt (size!18872 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92523 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12453) lt!304258)))

(declare-fun b!653589 () Bool)

(assert (=> b!653589 (= e!375245 (arrayNoDuplicates!0 (array!38620 (store (arr!18508 a!2986) i!1108 k0!1786) (size!18872 a!2986)) #b00000000000000000000000000000000 Nil!12453))))

(assert (= (and d!92523 res!423840) b!653589))

(declare-fun m!627201 () Bool)

(assert (=> d!92523 m!627201))

(assert (=> b!653589 m!627013))

(declare-fun m!627203 () Bool)

(assert (=> b!653589 m!627203))

(assert (=> b!653383 d!92523))

(declare-fun d!92525 () Bool)

(declare-fun res!423843 () Bool)

(declare-fun e!375246 () Bool)

(assert (=> d!92525 (=> res!423843 e!375246)))

(assert (=> d!92525 (= res!423843 (bvsge #b00000000000000000000000000000000 (size!18872 lt!304139)))))

(assert (=> d!92525 (= (arrayNoDuplicates!0 lt!304139 #b00000000000000000000000000000000 Nil!12453) e!375246)))

(declare-fun b!653590 () Bool)

(declare-fun e!375249 () Bool)

(declare-fun call!33817 () Bool)

(assert (=> b!653590 (= e!375249 call!33817)))

(declare-fun b!653591 () Bool)

(declare-fun e!375247 () Bool)

(assert (=> b!653591 (= e!375247 (contains!3160 Nil!12453 (select (arr!18508 lt!304139) #b00000000000000000000000000000000)))))

(declare-fun bm!33814 () Bool)

(declare-fun c!75243 () Bool)

(assert (=> bm!33814 (= call!33817 (arrayNoDuplicates!0 lt!304139 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75243 (Cons!12452 (select (arr!18508 lt!304139) #b00000000000000000000000000000000) Nil!12453) Nil!12453)))))

(declare-fun b!653592 () Bool)

(declare-fun e!375248 () Bool)

(assert (=> b!653592 (= e!375246 e!375248)))

(declare-fun res!423842 () Bool)

(assert (=> b!653592 (=> (not res!423842) (not e!375248))))

(assert (=> b!653592 (= res!423842 (not e!375247))))

(declare-fun res!423841 () Bool)

(assert (=> b!653592 (=> (not res!423841) (not e!375247))))

(assert (=> b!653592 (= res!423841 (validKeyInArray!0 (select (arr!18508 lt!304139) #b00000000000000000000000000000000)))))

(declare-fun b!653593 () Bool)

(assert (=> b!653593 (= e!375249 call!33817)))

(declare-fun b!653594 () Bool)

(assert (=> b!653594 (= e!375248 e!375249)))

(assert (=> b!653594 (= c!75243 (validKeyInArray!0 (select (arr!18508 lt!304139) #b00000000000000000000000000000000)))))

(assert (= (and d!92525 (not res!423843)) b!653592))

(assert (= (and b!653592 res!423841) b!653591))

(assert (= (and b!653592 res!423842) b!653594))

(assert (= (and b!653594 c!75243) b!653593))

(assert (= (and b!653594 (not c!75243)) b!653590))

(assert (= (or b!653593 b!653590) bm!33814))

(declare-fun m!627205 () Bool)

(assert (=> b!653591 m!627205))

(assert (=> b!653591 m!627205))

(declare-fun m!627207 () Bool)

(assert (=> b!653591 m!627207))

(assert (=> bm!33814 m!627205))

(declare-fun m!627209 () Bool)

(assert (=> bm!33814 m!627209))

(assert (=> b!653592 m!627205))

(assert (=> b!653592 m!627205))

(declare-fun m!627211 () Bool)

(assert (=> b!653592 m!627211))

(assert (=> b!653594 m!627205))

(assert (=> b!653594 m!627205))

(assert (=> b!653594 m!627211))

(assert (=> b!653383 d!92525))

(declare-fun d!92527 () Bool)

(assert (=> d!92527 (arrayNoDuplicates!0 lt!304139 j!136 Nil!12453)))

(declare-fun lt!304261 () Unit!22323)

(declare-fun choose!39 (array!38619 (_ BitVec 32) (_ BitVec 32)) Unit!22323)

(assert (=> d!92527 (= lt!304261 (choose!39 lt!304139 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92527 (bvslt (size!18872 lt!304139) #b01111111111111111111111111111111)))

(assert (=> d!92527 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!304139 #b00000000000000000000000000000000 j!136) lt!304261)))

(declare-fun bs!19495 () Bool)

(assert (= bs!19495 d!92527))

(assert (=> bs!19495 m!626981))

(declare-fun m!627213 () Bool)

(assert (=> bs!19495 m!627213))

(assert (=> b!653383 d!92527))

(declare-fun b!653607 () Bool)

(declare-fun c!75252 () Bool)

(declare-fun lt!304270 () (_ BitVec 64))

(assert (=> b!653607 (= c!75252 (= lt!304270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375257 () SeekEntryResult!6904)

(declare-fun e!375258 () SeekEntryResult!6904)

(assert (=> b!653607 (= e!375257 e!375258)))

(declare-fun b!653608 () Bool)

(declare-fun lt!304268 () SeekEntryResult!6904)

(assert (=> b!653608 (= e!375257 (Found!6904 (index!29974 lt!304268)))))

(declare-fun b!653609 () Bool)

(assert (=> b!653609 (= e!375258 (MissingZero!6904 (index!29974 lt!304268)))))

(declare-fun d!92529 () Bool)

(declare-fun lt!304269 () SeekEntryResult!6904)

(get-info :version)

(assert (=> d!92529 (and (or ((_ is Undefined!6904) lt!304269) (not ((_ is Found!6904) lt!304269)) (and (bvsge (index!29973 lt!304269) #b00000000000000000000000000000000) (bvslt (index!29973 lt!304269) (size!18872 a!2986)))) (or ((_ is Undefined!6904) lt!304269) ((_ is Found!6904) lt!304269) (not ((_ is MissingZero!6904) lt!304269)) (and (bvsge (index!29972 lt!304269) #b00000000000000000000000000000000) (bvslt (index!29972 lt!304269) (size!18872 a!2986)))) (or ((_ is Undefined!6904) lt!304269) ((_ is Found!6904) lt!304269) ((_ is MissingZero!6904) lt!304269) (not ((_ is MissingVacant!6904) lt!304269)) (and (bvsge (index!29975 lt!304269) #b00000000000000000000000000000000) (bvslt (index!29975 lt!304269) (size!18872 a!2986)))) (or ((_ is Undefined!6904) lt!304269) (ite ((_ is Found!6904) lt!304269) (= (select (arr!18508 a!2986) (index!29973 lt!304269)) k0!1786) (ite ((_ is MissingZero!6904) lt!304269) (= (select (arr!18508 a!2986) (index!29972 lt!304269)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6904) lt!304269) (= (select (arr!18508 a!2986) (index!29975 lt!304269)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!375256 () SeekEntryResult!6904)

(assert (=> d!92529 (= lt!304269 e!375256)))

(declare-fun c!75251 () Bool)

(assert (=> d!92529 (= c!75251 (and ((_ is Intermediate!6904) lt!304268) (undefined!7716 lt!304268)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38619 (_ BitVec 32)) SeekEntryResult!6904)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92529 (= lt!304268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92529 (validMask!0 mask!3053)))

(assert (=> d!92529 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!304269)))

(declare-fun b!653610 () Bool)

(assert (=> b!653610 (= e!375258 (seekKeyOrZeroReturnVacant!0 (x!58915 lt!304268) (index!29974 lt!304268) (index!29974 lt!304268) k0!1786 a!2986 mask!3053))))

(declare-fun b!653611 () Bool)

(assert (=> b!653611 (= e!375256 Undefined!6904)))

(declare-fun b!653612 () Bool)

(assert (=> b!653612 (= e!375256 e!375257)))

(assert (=> b!653612 (= lt!304270 (select (arr!18508 a!2986) (index!29974 lt!304268)))))

(declare-fun c!75250 () Bool)

(assert (=> b!653612 (= c!75250 (= lt!304270 k0!1786))))

(assert (= (and d!92529 c!75251) b!653611))

(assert (= (and d!92529 (not c!75251)) b!653612))

(assert (= (and b!653612 c!75250) b!653608))

(assert (= (and b!653612 (not c!75250)) b!653607))

(assert (= (and b!653607 c!75252) b!653609))

(assert (= (and b!653607 (not c!75252)) b!653610))

(assert (=> d!92529 m!626967))

(declare-fun m!627215 () Bool)

(assert (=> d!92529 m!627215))

(declare-fun m!627217 () Bool)

(assert (=> d!92529 m!627217))

(declare-fun m!627219 () Bool)

(assert (=> d!92529 m!627219))

(declare-fun m!627221 () Bool)

(assert (=> d!92529 m!627221))

(assert (=> d!92529 m!627221))

(declare-fun m!627223 () Bool)

(assert (=> d!92529 m!627223))

(declare-fun m!627225 () Bool)

(assert (=> b!653610 m!627225))

(declare-fun m!627227 () Bool)

(assert (=> b!653612 m!627227))

(assert (=> b!653406 d!92529))

(declare-fun d!92531 () Bool)

(declare-fun res!423844 () Bool)

(declare-fun e!375259 () Bool)

(assert (=> d!92531 (=> res!423844 e!375259)))

(assert (=> d!92531 (= res!423844 (= (select (arr!18508 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92531 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!375259)))

(declare-fun b!653613 () Bool)

(declare-fun e!375260 () Bool)

(assert (=> b!653613 (= e!375259 e!375260)))

(declare-fun res!423845 () Bool)

(assert (=> b!653613 (=> (not res!423845) (not e!375260))))

(assert (=> b!653613 (= res!423845 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18872 a!2986)))))

(declare-fun b!653614 () Bool)

(assert (=> b!653614 (= e!375260 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92531 (not res!423844)) b!653613))

(assert (= (and b!653613 res!423845) b!653614))

(declare-fun m!627229 () Bool)

(assert (=> d!92531 m!627229))

(declare-fun m!627231 () Bool)

(assert (=> b!653614 m!627231))

(assert (=> b!653385 d!92531))

(declare-fun d!92533 () Bool)

(declare-fun lt!304273 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!254 (List!12456) (InoxSet (_ BitVec 64)))

(assert (=> d!92533 (= lt!304273 (select (content!254 Nil!12453) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375266 () Bool)

(assert (=> d!92533 (= lt!304273 e!375266)))

(declare-fun res!423851 () Bool)

(assert (=> d!92533 (=> (not res!423851) (not e!375266))))

(assert (=> d!92533 (= res!423851 ((_ is Cons!12452) Nil!12453))))

(assert (=> d!92533 (= (contains!3160 Nil!12453 #b0000000000000000000000000000000000000000000000000000000000000000) lt!304273)))

(declare-fun b!653619 () Bool)

(declare-fun e!375265 () Bool)

(assert (=> b!653619 (= e!375266 e!375265)))

(declare-fun res!423850 () Bool)

(assert (=> b!653619 (=> res!423850 e!375265)))

(assert (=> b!653619 (= res!423850 (= (h!13500 Nil!12453) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653620 () Bool)

(assert (=> b!653620 (= e!375265 (contains!3160 (t!18676 Nil!12453) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92533 res!423851) b!653619))

(assert (= (and b!653619 (not res!423850)) b!653620))

(declare-fun m!627233 () Bool)

(assert (=> d!92533 m!627233))

(declare-fun m!627235 () Bool)

(assert (=> d!92533 m!627235))

(declare-fun m!627237 () Bool)

(assert (=> b!653620 m!627237))

(assert (=> b!653395 d!92533))

(declare-fun d!92535 () Bool)

(declare-fun res!423854 () Bool)

(declare-fun e!375267 () Bool)

(assert (=> d!92535 (=> res!423854 e!375267)))

(assert (=> d!92535 (= res!423854 (bvsge #b00000000000000000000000000000000 (size!18872 a!2986)))))

(assert (=> d!92535 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12453) e!375267)))

(declare-fun b!653621 () Bool)

(declare-fun e!375270 () Bool)

(declare-fun call!33818 () Bool)

(assert (=> b!653621 (= e!375270 call!33818)))

(declare-fun b!653622 () Bool)

(declare-fun e!375268 () Bool)

(assert (=> b!653622 (= e!375268 (contains!3160 Nil!12453 (select (arr!18508 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33815 () Bool)

(declare-fun c!75253 () Bool)

(assert (=> bm!33815 (= call!33818 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75253 (Cons!12452 (select (arr!18508 a!2986) #b00000000000000000000000000000000) Nil!12453) Nil!12453)))))

(declare-fun b!653623 () Bool)

(declare-fun e!375269 () Bool)

(assert (=> b!653623 (= e!375267 e!375269)))

(declare-fun res!423853 () Bool)

(assert (=> b!653623 (=> (not res!423853) (not e!375269))))

(assert (=> b!653623 (= res!423853 (not e!375268))))

(declare-fun res!423852 () Bool)

(assert (=> b!653623 (=> (not res!423852) (not e!375268))))

(assert (=> b!653623 (= res!423852 (validKeyInArray!0 (select (arr!18508 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653624 () Bool)

(assert (=> b!653624 (= e!375270 call!33818)))

(declare-fun b!653625 () Bool)

(assert (=> b!653625 (= e!375269 e!375270)))

(assert (=> b!653625 (= c!75253 (validKeyInArray!0 (select (arr!18508 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92535 (not res!423854)) b!653623))

(assert (= (and b!653623 res!423852) b!653622))

(assert (= (and b!653623 res!423853) b!653625))

(assert (= (and b!653625 c!75253) b!653624))

(assert (= (and b!653625 (not c!75253)) b!653621))

(assert (= (or b!653624 b!653621) bm!33815))

(assert (=> b!653622 m!627229))

(assert (=> b!653622 m!627229))

(declare-fun m!627239 () Bool)

(assert (=> b!653622 m!627239))

(assert (=> bm!33815 m!627229))

(declare-fun m!627241 () Bool)

(assert (=> bm!33815 m!627241))

(assert (=> b!653623 m!627229))

(assert (=> b!653623 m!627229))

(declare-fun m!627243 () Bool)

(assert (=> b!653623 m!627243))

(assert (=> b!653625 m!627229))

(assert (=> b!653625 m!627229))

(assert (=> b!653625 m!627243))

(assert (=> b!653402 d!92535))

(declare-fun b!653652 () Bool)

(declare-fun e!375292 () SeekEntryResult!6904)

(assert (=> b!653652 (= e!375292 Undefined!6904)))

(declare-fun d!92537 () Bool)

(declare-fun lt!304282 () SeekEntryResult!6904)

(assert (=> d!92537 (and (or ((_ is Undefined!6904) lt!304282) (not ((_ is Found!6904) lt!304282)) (and (bvsge (index!29973 lt!304282) #b00000000000000000000000000000000) (bvslt (index!29973 lt!304282) (size!18872 a!2986)))) (or ((_ is Undefined!6904) lt!304282) ((_ is Found!6904) lt!304282) (not ((_ is MissingVacant!6904) lt!304282)) (not (= (index!29975 lt!304282) vacantSpotIndex!68)) (and (bvsge (index!29975 lt!304282) #b00000000000000000000000000000000) (bvslt (index!29975 lt!304282) (size!18872 a!2986)))) (or ((_ is Undefined!6904) lt!304282) (ite ((_ is Found!6904) lt!304282) (= (select (arr!18508 a!2986) (index!29973 lt!304282)) (select (arr!18508 a!2986) j!136)) (and ((_ is MissingVacant!6904) lt!304282) (= (index!29975 lt!304282) vacantSpotIndex!68) (= (select (arr!18508 a!2986) (index!29975 lt!304282)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92537 (= lt!304282 e!375292)))

(declare-fun c!75262 () Bool)

(assert (=> d!92537 (= c!75262 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!304281 () (_ BitVec 64))

(assert (=> d!92537 (= lt!304281 (select (arr!18508 a!2986) lt!304124))))

(assert (=> d!92537 (validMask!0 mask!3053)))

(assert (=> d!92537 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053) lt!304282)))

(declare-fun b!653653 () Bool)

(declare-fun e!375291 () SeekEntryResult!6904)

(assert (=> b!653653 (= e!375292 e!375291)))

(declare-fun c!75260 () Bool)

(assert (=> b!653653 (= c!75260 (= lt!304281 (select (arr!18508 a!2986) j!136)))))

(declare-fun b!653654 () Bool)

(declare-fun c!75261 () Bool)

(assert (=> b!653654 (= c!75261 (= lt!304281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375293 () SeekEntryResult!6904)

(assert (=> b!653654 (= e!375291 e!375293)))

(declare-fun b!653655 () Bool)

(assert (=> b!653655 (= e!375291 (Found!6904 lt!304124))))

(declare-fun b!653656 () Bool)

(assert (=> b!653656 (= e!375293 (MissingVacant!6904 vacantSpotIndex!68))))

(declare-fun b!653657 () Bool)

(assert (=> b!653657 (= e!375293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!304124 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!92537 c!75262) b!653652))

(assert (= (and d!92537 (not c!75262)) b!653653))

(assert (= (and b!653653 c!75260) b!653655))

(assert (= (and b!653653 (not c!75260)) b!653654))

(assert (= (and b!653654 c!75261) b!653656))

(assert (= (and b!653654 (not c!75261)) b!653657))

(declare-fun m!627259 () Bool)

(assert (=> d!92537 m!627259))

(declare-fun m!627261 () Bool)

(assert (=> d!92537 m!627261))

(declare-fun m!627263 () Bool)

(assert (=> d!92537 m!627263))

(assert (=> d!92537 m!626967))

(declare-fun m!627265 () Bool)

(assert (=> b!653657 m!627265))

(assert (=> b!653657 m!627265))

(assert (=> b!653657 m!626963))

(declare-fun m!627267 () Bool)

(assert (=> b!653657 m!627267))

(assert (=> b!653391 d!92537))

(declare-fun b!653658 () Bool)

(declare-fun e!375295 () SeekEntryResult!6904)

(assert (=> b!653658 (= e!375295 Undefined!6904)))

(declare-fun d!92553 () Bool)

(declare-fun lt!304284 () SeekEntryResult!6904)

(assert (=> d!92553 (and (or ((_ is Undefined!6904) lt!304284) (not ((_ is Found!6904) lt!304284)) (and (bvsge (index!29973 lt!304284) #b00000000000000000000000000000000) (bvslt (index!29973 lt!304284) (size!18872 lt!304139)))) (or ((_ is Undefined!6904) lt!304284) ((_ is Found!6904) lt!304284) (not ((_ is MissingVacant!6904) lt!304284)) (not (= (index!29975 lt!304284) vacantSpotIndex!68)) (and (bvsge (index!29975 lt!304284) #b00000000000000000000000000000000) (bvslt (index!29975 lt!304284) (size!18872 lt!304139)))) (or ((_ is Undefined!6904) lt!304284) (ite ((_ is Found!6904) lt!304284) (= (select (arr!18508 lt!304139) (index!29973 lt!304284)) lt!304128) (and ((_ is MissingVacant!6904) lt!304284) (= (index!29975 lt!304284) vacantSpotIndex!68) (= (select (arr!18508 lt!304139) (index!29975 lt!304284)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92553 (= lt!304284 e!375295)))

(declare-fun c!75265 () Bool)

(assert (=> d!92553 (= c!75265 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!304283 () (_ BitVec 64))

(assert (=> d!92553 (= lt!304283 (select (arr!18508 lt!304139) lt!304124))))

(assert (=> d!92553 (validMask!0 mask!3053)))

(assert (=> d!92553 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 lt!304128 lt!304139 mask!3053) lt!304284)))

(declare-fun b!653659 () Bool)

(declare-fun e!375294 () SeekEntryResult!6904)

(assert (=> b!653659 (= e!375295 e!375294)))

(declare-fun c!75263 () Bool)

(assert (=> b!653659 (= c!75263 (= lt!304283 lt!304128))))

(declare-fun b!653660 () Bool)

(declare-fun c!75264 () Bool)

(assert (=> b!653660 (= c!75264 (= lt!304283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375296 () SeekEntryResult!6904)

(assert (=> b!653660 (= e!375294 e!375296)))

(declare-fun b!653661 () Bool)

(assert (=> b!653661 (= e!375294 (Found!6904 lt!304124))))

(declare-fun b!653662 () Bool)

(assert (=> b!653662 (= e!375296 (MissingVacant!6904 vacantSpotIndex!68))))

(declare-fun b!653663 () Bool)

(assert (=> b!653663 (= e!375296 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!304124 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!304128 lt!304139 mask!3053))))

(assert (= (and d!92553 c!75265) b!653658))

(assert (= (and d!92553 (not c!75265)) b!653659))

(assert (= (and b!653659 c!75263) b!653661))

(assert (= (and b!653659 (not c!75263)) b!653660))

(assert (= (and b!653660 c!75264) b!653662))

(assert (= (and b!653660 (not c!75264)) b!653663))

(declare-fun m!627269 () Bool)

(assert (=> d!92553 m!627269))

(declare-fun m!627271 () Bool)

(assert (=> d!92553 m!627271))

(declare-fun m!627273 () Bool)

(assert (=> d!92553 m!627273))

(assert (=> d!92553 m!626967))

(assert (=> b!653663 m!627265))

(assert (=> b!653663 m!627265))

(declare-fun m!627275 () Bool)

(assert (=> b!653663 m!627275))

(assert (=> b!653391 d!92553))

(declare-fun d!92555 () Bool)

(declare-fun lt!304287 () (_ BitVec 32))

(assert (=> d!92555 (and (bvsge lt!304287 #b00000000000000000000000000000000) (bvslt lt!304287 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92555 (= lt!304287 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!92555 (validMask!0 mask!3053)))

(assert (=> d!92555 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!304287)))

(declare-fun bs!19497 () Bool)

(assert (= bs!19497 d!92555))

(declare-fun m!627277 () Bool)

(assert (=> bs!19497 m!627277))

(assert (=> bs!19497 m!626967))

(assert (=> b!653391 d!92555))

(declare-fun d!92557 () Bool)

(declare-fun e!375326 () Bool)

(assert (=> d!92557 e!375326))

(declare-fun res!423892 () Bool)

(assert (=> d!92557 (=> (not res!423892) (not e!375326))))

(assert (=> d!92557 (= res!423892 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18872 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18872 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18872 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18872 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18872 a!2986))))))

(declare-fun lt!304296 () Unit!22323)

(declare-fun choose!9 (array!38619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22323)

(assert (=> d!92557 (= lt!304296 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92557 (validMask!0 mask!3053)))

(assert (=> d!92557 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 mask!3053) lt!304296)))

(declare-fun b!653699 () Bool)

(assert (=> b!653699 (= e!375326 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304124 vacantSpotIndex!68 (select (store (arr!18508 a!2986) i!1108 k0!1786) j!136) (array!38620 (store (arr!18508 a!2986) i!1108 k0!1786) (size!18872 a!2986)) mask!3053)))))

(assert (= (and d!92557 res!423892) b!653699))

(declare-fun m!627301 () Bool)

(assert (=> d!92557 m!627301))

(assert (=> d!92557 m!626967))

(assert (=> b!653699 m!626963))

(assert (=> b!653699 m!627019))

(assert (=> b!653699 m!627009))

(assert (=> b!653699 m!627013))

(assert (=> b!653699 m!627009))

(declare-fun m!627303 () Bool)

(assert (=> b!653699 m!627303))

(assert (=> b!653699 m!626963))

(assert (=> b!653391 d!92557))

(declare-fun b!653700 () Bool)

(declare-fun e!375328 () SeekEntryResult!6904)

(assert (=> b!653700 (= e!375328 Undefined!6904)))

(declare-fun lt!304298 () SeekEntryResult!6904)

(declare-fun d!92571 () Bool)

(assert (=> d!92571 (and (or ((_ is Undefined!6904) lt!304298) (not ((_ is Found!6904) lt!304298)) (and (bvsge (index!29973 lt!304298) #b00000000000000000000000000000000) (bvslt (index!29973 lt!304298) (size!18872 lt!304139)))) (or ((_ is Undefined!6904) lt!304298) ((_ is Found!6904) lt!304298) (not ((_ is MissingVacant!6904) lt!304298)) (not (= (index!29975 lt!304298) vacantSpotIndex!68)) (and (bvsge (index!29975 lt!304298) #b00000000000000000000000000000000) (bvslt (index!29975 lt!304298) (size!18872 lt!304139)))) (or ((_ is Undefined!6904) lt!304298) (ite ((_ is Found!6904) lt!304298) (= (select (arr!18508 lt!304139) (index!29973 lt!304298)) lt!304128) (and ((_ is MissingVacant!6904) lt!304298) (= (index!29975 lt!304298) vacantSpotIndex!68) (= (select (arr!18508 lt!304139) (index!29975 lt!304298)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92571 (= lt!304298 e!375328)))

(declare-fun c!75274 () Bool)

(assert (=> d!92571 (= c!75274 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!304297 () (_ BitVec 64))

(assert (=> d!92571 (= lt!304297 (select (arr!18508 lt!304139) index!984))))

(assert (=> d!92571 (validMask!0 mask!3053)))

(assert (=> d!92571 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304128 lt!304139 mask!3053) lt!304298)))

(declare-fun b!653701 () Bool)

(declare-fun e!375327 () SeekEntryResult!6904)

(assert (=> b!653701 (= e!375328 e!375327)))

(declare-fun c!75272 () Bool)

(assert (=> b!653701 (= c!75272 (= lt!304297 lt!304128))))

(declare-fun b!653702 () Bool)

(declare-fun c!75273 () Bool)

(assert (=> b!653702 (= c!75273 (= lt!304297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375329 () SeekEntryResult!6904)

(assert (=> b!653702 (= e!375327 e!375329)))

(declare-fun b!653703 () Bool)

(assert (=> b!653703 (= e!375327 (Found!6904 index!984))))

(declare-fun b!653704 () Bool)

(assert (=> b!653704 (= e!375329 (MissingVacant!6904 vacantSpotIndex!68))))

(declare-fun b!653705 () Bool)

(assert (=> b!653705 (= e!375329 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!304128 lt!304139 mask!3053))))

(assert (= (and d!92571 c!75274) b!653700))

(assert (= (and d!92571 (not c!75274)) b!653701))

(assert (= (and b!653701 c!75272) b!653703))

(assert (= (and b!653701 (not c!75272)) b!653702))

(assert (= (and b!653702 c!75273) b!653704))

(assert (= (and b!653702 (not c!75273)) b!653705))

(declare-fun m!627305 () Bool)

(assert (=> d!92571 m!627305))

(declare-fun m!627307 () Bool)

(assert (=> d!92571 m!627307))

(assert (=> d!92571 m!627181))

(assert (=> d!92571 m!626967))

(declare-fun m!627309 () Bool)

(assert (=> b!653705 m!627309))

(assert (=> b!653705 m!627309))

(declare-fun m!627311 () Bool)

(assert (=> b!653705 m!627311))

(assert (=> b!653391 d!92571))

(assert (=> b!653392 d!92513))

(declare-fun b!653714 () Bool)

(declare-fun e!375337 () SeekEntryResult!6904)

(assert (=> b!653714 (= e!375337 Undefined!6904)))

(declare-fun lt!304306 () SeekEntryResult!6904)

(declare-fun d!92573 () Bool)

(assert (=> d!92573 (and (or ((_ is Undefined!6904) lt!304306) (not ((_ is Found!6904) lt!304306)) (and (bvsge (index!29973 lt!304306) #b00000000000000000000000000000000) (bvslt (index!29973 lt!304306) (size!18872 a!2986)))) (or ((_ is Undefined!6904) lt!304306) ((_ is Found!6904) lt!304306) (not ((_ is MissingVacant!6904) lt!304306)) (not (= (index!29975 lt!304306) vacantSpotIndex!68)) (and (bvsge (index!29975 lt!304306) #b00000000000000000000000000000000) (bvslt (index!29975 lt!304306) (size!18872 a!2986)))) (or ((_ is Undefined!6904) lt!304306) (ite ((_ is Found!6904) lt!304306) (= (select (arr!18508 a!2986) (index!29973 lt!304306)) (select (arr!18508 a!2986) j!136)) (and ((_ is MissingVacant!6904) lt!304306) (= (index!29975 lt!304306) vacantSpotIndex!68) (= (select (arr!18508 a!2986) (index!29975 lt!304306)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92573 (= lt!304306 e!375337)))

(declare-fun c!75279 () Bool)

(assert (=> d!92573 (= c!75279 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!304305 () (_ BitVec 64))

(assert (=> d!92573 (= lt!304305 (select (arr!18508 a!2986) index!984))))

(assert (=> d!92573 (validMask!0 mask!3053)))

(assert (=> d!92573 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053) lt!304306)))

(declare-fun b!653715 () Bool)

(declare-fun e!375336 () SeekEntryResult!6904)

(assert (=> b!653715 (= e!375337 e!375336)))

(declare-fun c!75277 () Bool)

(assert (=> b!653715 (= c!75277 (= lt!304305 (select (arr!18508 a!2986) j!136)))))

(declare-fun b!653716 () Bool)

(declare-fun c!75278 () Bool)

(assert (=> b!653716 (= c!75278 (= lt!304305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375338 () SeekEntryResult!6904)

(assert (=> b!653716 (= e!375336 e!375338)))

(declare-fun b!653717 () Bool)

(assert (=> b!653717 (= e!375336 (Found!6904 index!984))))

(declare-fun b!653718 () Bool)

(assert (=> b!653718 (= e!375338 (MissingVacant!6904 vacantSpotIndex!68))))

(declare-fun b!653719 () Bool)

(assert (=> b!653719 (= e!375338 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18508 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!92573 c!75279) b!653714))

(assert (= (and d!92573 (not c!75279)) b!653715))

(assert (= (and b!653715 c!75277) b!653717))

(assert (= (and b!653715 (not c!75277)) b!653716))

(assert (= (and b!653716 c!75278) b!653718))

(assert (= (and b!653716 (not c!75278)) b!653719))

(declare-fun m!627313 () Bool)

(assert (=> d!92573 m!627313))

(declare-fun m!627315 () Bool)

(assert (=> d!92573 m!627315))

(assert (=> d!92573 m!626961))

(assert (=> d!92573 m!626967))

(assert (=> b!653719 m!627309))

(assert (=> b!653719 m!627309))

(assert (=> b!653719 m!626963))

(declare-fun m!627317 () Bool)

(assert (=> b!653719 m!627317))

(assert (=> b!653399 d!92573))

(declare-fun d!92575 () Bool)

(assert (=> d!92575 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653390 d!92575))

(declare-fun d!92579 () Bool)

(declare-fun lt!304307 () Bool)

(assert (=> d!92579 (= lt!304307 (select (content!254 Nil!12453) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375344 () Bool)

(assert (=> d!92579 (= lt!304307 e!375344)))

(declare-fun res!423901 () Bool)

(assert (=> d!92579 (=> (not res!423901) (not e!375344))))

(assert (=> d!92579 (= res!423901 ((_ is Cons!12452) Nil!12453))))

(assert (=> d!92579 (= (contains!3160 Nil!12453 #b1000000000000000000000000000000000000000000000000000000000000000) lt!304307)))

(declare-fun b!653725 () Bool)

(declare-fun e!375343 () Bool)

(assert (=> b!653725 (= e!375344 e!375343)))

(declare-fun res!423900 () Bool)

(assert (=> b!653725 (=> res!423900 e!375343)))

(assert (=> b!653725 (= res!423900 (= (h!13500 Nil!12453) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653726 () Bool)

(assert (=> b!653726 (= e!375343 (contains!3160 (t!18676 Nil!12453) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92579 res!423901) b!653725))

(assert (= (and b!653725 (not res!423900)) b!653726))

(assert (=> d!92579 m!627233))

(declare-fun m!627327 () Bool)

(assert (=> d!92579 m!627327))

(declare-fun m!627329 () Bool)

(assert (=> b!653726 m!627329))

(assert (=> b!653401 d!92579))

(declare-fun d!92581 () Bool)

(declare-fun res!423914 () Bool)

(declare-fun e!375358 () Bool)

(assert (=> d!92581 (=> res!423914 e!375358)))

(assert (=> d!92581 (= res!423914 ((_ is Nil!12453) Nil!12453))))

(assert (=> d!92581 (= (noDuplicate!442 Nil!12453) e!375358)))

(declare-fun b!653741 () Bool)

(declare-fun e!375359 () Bool)

(assert (=> b!653741 (= e!375358 e!375359)))

(declare-fun res!423915 () Bool)

(assert (=> b!653741 (=> (not res!423915) (not e!375359))))

(assert (=> b!653741 (= res!423915 (not (contains!3160 (t!18676 Nil!12453) (h!13500 Nil!12453))))))

(declare-fun b!653742 () Bool)

(assert (=> b!653742 (= e!375359 (noDuplicate!442 (t!18676 Nil!12453)))))

(assert (= (and d!92581 (not res!423914)) b!653741))

(assert (= (and b!653741 res!423915) b!653742))

(declare-fun m!627347 () Bool)

(assert (=> b!653741 m!627347))

(declare-fun m!627349 () Bool)

(assert (=> b!653742 m!627349))

(assert (=> b!653400 d!92581))

(declare-fun b!653763 () Bool)

(declare-fun e!375376 () Bool)

(declare-fun e!375377 () Bool)

(assert (=> b!653763 (= e!375376 e!375377)))

(declare-fun c!75287 () Bool)

(assert (=> b!653763 (= c!75287 (validKeyInArray!0 (select (arr!18508 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92589 () Bool)

(declare-fun res!423926 () Bool)

(assert (=> d!92589 (=> res!423926 e!375376)))

(assert (=> d!92589 (= res!423926 (bvsge #b00000000000000000000000000000000 (size!18872 a!2986)))))

(assert (=> d!92589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!375376)))

(declare-fun b!653764 () Bool)

(declare-fun call!33834 () Bool)

(assert (=> b!653764 (= e!375377 call!33834)))

(declare-fun b!653765 () Bool)

(declare-fun e!375375 () Bool)

(assert (=> b!653765 (= e!375377 e!375375)))

(declare-fun lt!304328 () (_ BitVec 64))

(assert (=> b!653765 (= lt!304328 (select (arr!18508 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!304326 () Unit!22323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38619 (_ BitVec 64) (_ BitVec 32)) Unit!22323)

(assert (=> b!653765 (= lt!304326 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!304328 #b00000000000000000000000000000000))))

(assert (=> b!653765 (arrayContainsKey!0 a!2986 lt!304328 #b00000000000000000000000000000000)))

(declare-fun lt!304327 () Unit!22323)

(assert (=> b!653765 (= lt!304327 lt!304326)))

(declare-fun res!423927 () Bool)

(assert (=> b!653765 (= res!423927 (= (seekEntryOrOpen!0 (select (arr!18508 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6904 #b00000000000000000000000000000000)))))

(assert (=> b!653765 (=> (not res!423927) (not e!375375))))

(declare-fun bm!33831 () Bool)

(assert (=> bm!33831 (= call!33834 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!653766 () Bool)

(assert (=> b!653766 (= e!375375 call!33834)))

(assert (= (and d!92589 (not res!423926)) b!653763))

(assert (= (and b!653763 c!75287) b!653765))

(assert (= (and b!653763 (not c!75287)) b!653764))

(assert (= (and b!653765 res!423927) b!653766))

(assert (= (or b!653766 b!653764) bm!33831))

(assert (=> b!653763 m!627229))

(assert (=> b!653763 m!627229))

(assert (=> b!653763 m!627243))

(assert (=> b!653765 m!627229))

(declare-fun m!627359 () Bool)

(assert (=> b!653765 m!627359))

(declare-fun m!627361 () Bool)

(assert (=> b!653765 m!627361))

(assert (=> b!653765 m!627229))

(declare-fun m!627363 () Bool)

(assert (=> b!653765 m!627363))

(declare-fun m!627365 () Bool)

(assert (=> bm!33831 m!627365))

(assert (=> b!653386 d!92589))

(declare-fun d!92593 () Bool)

(declare-fun res!423928 () Bool)

(declare-fun e!375378 () Bool)

(assert (=> d!92593 (=> res!423928 e!375378)))

(assert (=> d!92593 (= res!423928 (= (select (arr!18508 lt!304139) j!136) (select (arr!18508 a!2986) j!136)))))

(assert (=> d!92593 (= (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) j!136) e!375378)))

(declare-fun b!653767 () Bool)

(declare-fun e!375379 () Bool)

(assert (=> b!653767 (= e!375378 e!375379)))

(declare-fun res!423929 () Bool)

(assert (=> b!653767 (=> (not res!423929) (not e!375379))))

(assert (=> b!653767 (= res!423929 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18872 lt!304139)))))

(declare-fun b!653768 () Bool)

(assert (=> b!653768 (= e!375379 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92593 (not res!423928)) b!653767))

(assert (= (and b!653767 res!423929) b!653768))

(assert (=> d!92593 m!627187))

(assert (=> b!653768 m!626963))

(declare-fun m!627367 () Bool)

(assert (=> b!653768 m!627367))

(assert (=> b!653407 d!92593))

(declare-fun d!92595 () Bool)

(assert (=> d!92595 (arrayNoDuplicates!0 lt!304139 index!984 Nil!12453)))

(declare-fun lt!304333 () Unit!22323)

(assert (=> d!92595 (= lt!304333 (choose!39 lt!304139 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92595 (bvslt (size!18872 lt!304139) #b01111111111111111111111111111111)))

(assert (=> d!92595 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!304139 #b00000000000000000000000000000000 index!984) lt!304333)))

(declare-fun bs!19499 () Bool)

(assert (= bs!19499 d!92595))

(assert (=> bs!19499 m!626999))

(declare-fun m!627369 () Bool)

(assert (=> bs!19499 m!627369))

(assert (=> b!653398 d!92595))

(assert (=> b!653398 d!92525))

(declare-fun d!92597 () Bool)

(assert (=> d!92597 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304334 () Unit!22323)

(assert (=> d!92597 (= lt!304334 (choose!114 lt!304139 (select (arr!18508 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92597 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92597 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304139 (select (arr!18508 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!304334)))

(declare-fun bs!19500 () Bool)

(assert (= bs!19500 d!92597))

(assert (=> bs!19500 m!626963))

(assert (=> bs!19500 m!626997))

(assert (=> bs!19500 m!626963))

(declare-fun m!627371 () Bool)

(assert (=> bs!19500 m!627371))

(assert (=> b!653398 d!92597))

(assert (=> b!653398 d!92593))

(declare-fun d!92599 () Bool)

(declare-fun res!423930 () Bool)

(declare-fun e!375386 () Bool)

(assert (=> d!92599 (=> res!423930 e!375386)))

(assert (=> d!92599 (= res!423930 (= (select (arr!18508 lt!304139) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18508 a!2986) j!136)))))

(assert (=> d!92599 (= (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!375386)))

(declare-fun b!653781 () Bool)

(declare-fun e!375387 () Bool)

(assert (=> b!653781 (= e!375386 e!375387)))

(declare-fun res!423931 () Bool)

(assert (=> b!653781 (=> (not res!423931) (not e!375387))))

(assert (=> b!653781 (= res!423931 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18872 lt!304139)))))

(declare-fun b!653782 () Bool)

(assert (=> b!653782 (= e!375387 (arrayContainsKey!0 lt!304139 (select (arr!18508 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92599 (not res!423930)) b!653781))

(assert (= (and b!653781 res!423931) b!653782))

(declare-fun m!627373 () Bool)

(assert (=> d!92599 m!627373))

(assert (=> b!653782 m!626963))

(declare-fun m!627375 () Bool)

(assert (=> b!653782 m!627375))

(assert (=> b!653398 d!92599))

(assert (=> b!653398 d!92523))

(declare-fun d!92601 () Bool)

(declare-fun res!423938 () Bool)

(declare-fun e!375392 () Bool)

(assert (=> d!92601 (=> res!423938 e!375392)))

(assert (=> d!92601 (= res!423938 (bvsge index!984 (size!18872 lt!304139)))))

(assert (=> d!92601 (= (arrayNoDuplicates!0 lt!304139 index!984 Nil!12453) e!375392)))

(declare-fun b!653787 () Bool)

(declare-fun e!375395 () Bool)

(declare-fun call!33835 () Bool)

(assert (=> b!653787 (= e!375395 call!33835)))

(declare-fun b!653788 () Bool)

(declare-fun e!375393 () Bool)

(assert (=> b!653788 (= e!375393 (contains!3160 Nil!12453 (select (arr!18508 lt!304139) index!984)))))

(declare-fun c!75294 () Bool)

(declare-fun bm!33832 () Bool)

(assert (=> bm!33832 (= call!33835 (arrayNoDuplicates!0 lt!304139 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75294 (Cons!12452 (select (arr!18508 lt!304139) index!984) Nil!12453) Nil!12453)))))

(declare-fun b!653789 () Bool)

(declare-fun e!375394 () Bool)

(assert (=> b!653789 (= e!375392 e!375394)))

(declare-fun res!423937 () Bool)

(assert (=> b!653789 (=> (not res!423937) (not e!375394))))

(assert (=> b!653789 (= res!423937 (not e!375393))))

(declare-fun res!423936 () Bool)

(assert (=> b!653789 (=> (not res!423936) (not e!375393))))

(assert (=> b!653789 (= res!423936 (validKeyInArray!0 (select (arr!18508 lt!304139) index!984)))))

(declare-fun b!653790 () Bool)

(assert (=> b!653790 (= e!375395 call!33835)))

(declare-fun b!653791 () Bool)

(assert (=> b!653791 (= e!375394 e!375395)))

(assert (=> b!653791 (= c!75294 (validKeyInArray!0 (select (arr!18508 lt!304139) index!984)))))

(assert (= (and d!92601 (not res!423938)) b!653789))

(assert (= (and b!653789 res!423936) b!653788))

(assert (= (and b!653789 res!423937) b!653791))

(assert (= (and b!653791 c!75294) b!653790))

(assert (= (and b!653791 (not c!75294)) b!653787))

(assert (= (or b!653790 b!653787) bm!33832))

(assert (=> b!653788 m!627181))

(assert (=> b!653788 m!627181))

(declare-fun m!627377 () Bool)

(assert (=> b!653788 m!627377))

(assert (=> bm!33832 m!627181))

(declare-fun m!627379 () Bool)

(assert (=> bm!33832 m!627379))

(assert (=> b!653789 m!627181))

(assert (=> b!653789 m!627181))

(declare-fun m!627381 () Bool)

(assert (=> b!653789 m!627381))

(assert (=> b!653791 m!627181))

(assert (=> b!653791 m!627181))

(assert (=> b!653791 m!627381))

(assert (=> b!653398 d!92601))

(declare-fun d!92603 () Bool)

(assert (=> d!92603 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59268 d!92603))

(declare-fun d!92611 () Bool)

(assert (=> d!92611 (= (array_inv!14367 a!2986) (bvsge (size!18872 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59268 d!92611))

(declare-fun d!92613 () Bool)

(assert (=> d!92613 (= (validKeyInArray!0 (select (arr!18508 a!2986) j!136)) (and (not (= (select (arr!18508 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18508 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653387 d!92613))

(check-sat (not b!653791) (not bm!33813) (not b!653765) (not b!653620) (not bm!33831) (not d!92597) (not d!92571) (not b!653592) (not b!653705) (not d!92515) (not b!653610) (not b!653788) (not bm!33832) (not b!653782) (not d!92537) (not b!653768) (not d!92533) (not b!653614) (not d!92553) (not b!653594) (not b!653663) (not d!92557) (not d!92523) (not d!92555) (not d!92595) (not b!653569) (not d!92527) (not b!653581) (not b!653622) (not b!653591) (not b!653719) (not d!92573) (not b!653623) (not b!653589) (not d!92579) (not b!653763) (not b!653657) (not b!653699) (not d!92529) (not b!653584) (not b!653726) (not d!92521) (not bm!33814) (not b!653586) (not b!653742) (not b!653582) (not b!653789) (not b!653741) (not bm!33815) (not b!653625))
(check-sat)
