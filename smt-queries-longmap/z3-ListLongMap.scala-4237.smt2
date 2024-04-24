; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58500 () Bool)

(assert start!58500)

(declare-fun b!645660 () Bool)

(declare-fun e!370035 () Bool)

(declare-fun e!370028 () Bool)

(assert (=> b!645660 (= e!370035 e!370028)))

(declare-fun res!418308 () Bool)

(assert (=> b!645660 (=> (not res!418308) (not e!370028))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38454 0))(
  ( (array!38455 (arr!18436 (Array (_ BitVec 32) (_ BitVec 64))) (size!18800 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38454)

(declare-fun lt!299405 () array!38454)

(declare-fun arrayContainsKey!0 (array!38454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645660 (= res!418308 (arrayContainsKey!0 lt!299405 (select (arr!18436 a!2986) j!136) j!136))))

(declare-fun b!645661 () Bool)

(declare-fun e!370026 () Bool)

(declare-fun e!370037 () Bool)

(assert (=> b!645661 (= e!370026 e!370037)))

(declare-fun res!418298 () Bool)

(assert (=> b!645661 (=> (not res!418298) (not e!370037))))

(declare-datatypes ((SeekEntryResult!6832 0))(
  ( (MissingZero!6832 (index!29663 (_ BitVec 32))) (Found!6832 (index!29664 (_ BitVec 32))) (Intermediate!6832 (undefined!7644 Bool) (index!29665 (_ BitVec 32)) (x!58588 (_ BitVec 32))) (Undefined!6832) (MissingVacant!6832 (index!29666 (_ BitVec 32))) )
))
(declare-fun lt!299400 () SeekEntryResult!6832)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!645661 (= res!418298 (or (= lt!299400 (MissingZero!6832 i!1108)) (= lt!299400 (MissingVacant!6832 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38454 (_ BitVec 32)) SeekEntryResult!6832)

(assert (=> b!645661 (= lt!299400 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645662 () Bool)

(declare-fun e!370033 () Bool)

(declare-fun e!370024 () Bool)

(assert (=> b!645662 (= e!370033 e!370024)))

(declare-fun res!418304 () Bool)

(assert (=> b!645662 (=> res!418304 e!370024)))

(declare-fun lt!299407 () (_ BitVec 64))

(declare-fun lt!299397 () (_ BitVec 64))

(assert (=> b!645662 (= res!418304 (or (not (= (select (arr!18436 a!2986) j!136) lt!299397)) (not (= (select (arr!18436 a!2986) j!136) lt!299407))))))

(declare-fun e!370029 () Bool)

(assert (=> b!645662 e!370029))

(declare-fun res!418306 () Bool)

(assert (=> b!645662 (=> (not res!418306) (not e!370029))))

(assert (=> b!645662 (= res!418306 (= lt!299407 (select (arr!18436 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645662 (= lt!299407 (select (store (arr!18436 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645663 () Bool)

(declare-fun res!418305 () Bool)

(assert (=> b!645663 (=> (not res!418305) (not e!370026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645663 (= res!418305 (validKeyInArray!0 k0!1786))))

(declare-fun res!418300 () Bool)

(assert (=> start!58500 (=> (not res!418300) (not e!370026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58500 (= res!418300 (validMask!0 mask!3053))))

(assert (=> start!58500 e!370026))

(assert (=> start!58500 true))

(declare-fun array_inv!14295 (array!38454) Bool)

(assert (=> start!58500 (array_inv!14295 a!2986)))

(declare-fun b!645664 () Bool)

(declare-fun e!370027 () Bool)

(declare-fun lt!299396 () SeekEntryResult!6832)

(declare-fun lt!299403 () SeekEntryResult!6832)

(assert (=> b!645664 (= e!370027 (= lt!299396 lt!299403))))

(declare-fun b!645665 () Bool)

(declare-fun e!370038 () Bool)

(assert (=> b!645665 (= e!370024 e!370038)))

(declare-fun res!418295 () Bool)

(assert (=> b!645665 (=> res!418295 e!370038)))

(assert (=> b!645665 (= res!418295 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21891 0))(
  ( (Unit!21892) )
))
(declare-fun lt!299408 () Unit!21891)

(declare-fun e!370032 () Unit!21891)

(assert (=> b!645665 (= lt!299408 e!370032)))

(declare-fun c!74054 () Bool)

(assert (=> b!645665 (= c!74054 (bvslt j!136 index!984))))

(declare-fun b!645666 () Bool)

(declare-fun res!418294 () Bool)

(assert (=> b!645666 (=> (not res!418294) (not e!370037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38454 (_ BitVec 32)) Bool)

(assert (=> b!645666 (= res!418294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645667 () Bool)

(declare-fun Unit!21893 () Unit!21891)

(assert (=> b!645667 (= e!370032 Unit!21893)))

(declare-fun e!370036 () Bool)

(declare-fun b!645668 () Bool)

(assert (=> b!645668 (= e!370036 (arrayContainsKey!0 lt!299405 (select (arr!18436 a!2986) j!136) index!984))))

(declare-fun b!645669 () Bool)

(declare-fun res!418296 () Bool)

(assert (=> b!645669 (=> (not res!418296) (not e!370026))))

(assert (=> b!645669 (= res!418296 (validKeyInArray!0 (select (arr!18436 a!2986) j!136)))))

(declare-fun b!645670 () Bool)

(declare-fun e!370025 () Bool)

(assert (=> b!645670 (= e!370037 e!370025)))

(declare-fun res!418299 () Bool)

(assert (=> b!645670 (=> (not res!418299) (not e!370025))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!645670 (= res!418299 (= (select (store (arr!18436 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645670 (= lt!299405 (array!38455 (store (arr!18436 a!2986) i!1108 k0!1786) (size!18800 a!2986)))))

(declare-fun b!645671 () Bool)

(declare-fun res!418297 () Bool)

(assert (=> b!645671 (=> (not res!418297) (not e!370026))))

(assert (=> b!645671 (= res!418297 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645672 () Bool)

(declare-fun e!370034 () Unit!21891)

(declare-fun Unit!21894 () Unit!21891)

(assert (=> b!645672 (= e!370034 Unit!21894)))

(declare-fun b!645673 () Bool)

(assert (=> b!645673 (= e!370028 (arrayContainsKey!0 lt!299405 (select (arr!18436 a!2986) j!136) index!984))))

(declare-fun b!645674 () Bool)

(declare-fun Unit!21895 () Unit!21891)

(assert (=> b!645674 (= e!370034 Unit!21895)))

(assert (=> b!645674 false))

(declare-fun b!645675 () Bool)

(declare-fun res!418301 () Bool)

(assert (=> b!645675 (=> (not res!418301) (not e!370037))))

(declare-datatypes ((List!12384 0))(
  ( (Nil!12381) (Cons!12380 (h!13428 (_ BitVec 64)) (t!18604 List!12384)) )
))
(declare-fun arrayNoDuplicates!0 (array!38454 (_ BitVec 32) List!12384) Bool)

(assert (=> b!645675 (= res!418301 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12381))))

(declare-fun b!645676 () Bool)

(declare-fun e!370031 () Bool)

(assert (=> b!645676 (= e!370031 (not e!370033))))

(declare-fun res!418292 () Bool)

(assert (=> b!645676 (=> res!418292 e!370033)))

(declare-fun lt!299399 () SeekEntryResult!6832)

(assert (=> b!645676 (= res!418292 (not (= lt!299399 (Found!6832 index!984))))))

(declare-fun lt!299395 () Unit!21891)

(assert (=> b!645676 (= lt!299395 e!370034)))

(declare-fun c!74053 () Bool)

(assert (=> b!645676 (= c!74053 (= lt!299399 Undefined!6832))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38454 (_ BitVec 32)) SeekEntryResult!6832)

(assert (=> b!645676 (= lt!299399 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299397 lt!299405 mask!3053))))

(assert (=> b!645676 e!370027))

(declare-fun res!418291 () Bool)

(assert (=> b!645676 (=> (not res!418291) (not e!370027))))

(declare-fun lt!299398 () (_ BitVec 32))

(assert (=> b!645676 (= res!418291 (= lt!299403 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299398 vacantSpotIndex!68 lt!299397 lt!299405 mask!3053)))))

(assert (=> b!645676 (= lt!299403 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299398 vacantSpotIndex!68 (select (arr!18436 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645676 (= lt!299397 (select (store (arr!18436 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299409 () Unit!21891)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38454 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21891)

(assert (=> b!645676 (= lt!299409 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299398 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645676 (= lt!299398 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!645677 () Bool)

(assert (=> b!645677 (= e!370029 e!370035)))

(declare-fun res!418293 () Bool)

(assert (=> b!645677 (=> res!418293 e!370035)))

(assert (=> b!645677 (= res!418293 (or (not (= (select (arr!18436 a!2986) j!136) lt!299397)) (not (= (select (arr!18436 a!2986) j!136) lt!299407)) (bvsge j!136 index!984)))))

(declare-fun b!645678 () Bool)

(assert (=> b!645678 (= e!370025 e!370031)))

(declare-fun res!418302 () Bool)

(assert (=> b!645678 (=> (not res!418302) (not e!370031))))

(assert (=> b!645678 (= res!418302 (and (= lt!299396 (Found!6832 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18436 a!2986) index!984) (select (arr!18436 a!2986) j!136))) (not (= (select (arr!18436 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645678 (= lt!299396 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18436 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645679 () Bool)

(assert (=> b!645679 (= e!370038 true)))

(assert (=> b!645679 (arrayContainsKey!0 lt!299405 (select (arr!18436 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299401 () Unit!21891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21891)

(assert (=> b!645679 (= lt!299401 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299405 (select (arr!18436 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645679 e!370036))

(declare-fun res!418303 () Bool)

(assert (=> b!645679 (=> (not res!418303) (not e!370036))))

(assert (=> b!645679 (= res!418303 (arrayContainsKey!0 lt!299405 (select (arr!18436 a!2986) j!136) j!136))))

(declare-fun b!645680 () Bool)

(declare-fun res!418307 () Bool)

(assert (=> b!645680 (=> (not res!418307) (not e!370026))))

(assert (=> b!645680 (= res!418307 (and (= (size!18800 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18800 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18800 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645681 () Bool)

(declare-fun Unit!21896 () Unit!21891)

(assert (=> b!645681 (= e!370032 Unit!21896)))

(declare-fun lt!299406 () Unit!21891)

(assert (=> b!645681 (= lt!299406 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299405 (select (arr!18436 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645681 (arrayContainsKey!0 lt!299405 (select (arr!18436 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299404 () Unit!21891)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12384) Unit!21891)

(assert (=> b!645681 (= lt!299404 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12381))))

(assert (=> b!645681 (arrayNoDuplicates!0 lt!299405 #b00000000000000000000000000000000 Nil!12381)))

(declare-fun lt!299410 () Unit!21891)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38454 (_ BitVec 32) (_ BitVec 32)) Unit!21891)

(assert (=> b!645681 (= lt!299410 (lemmaNoDuplicateFromThenFromBigger!0 lt!299405 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645681 (arrayNoDuplicates!0 lt!299405 j!136 Nil!12381)))

(declare-fun lt!299402 () Unit!21891)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38454 (_ BitVec 64) (_ BitVec 32) List!12384) Unit!21891)

(assert (=> b!645681 (= lt!299402 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299405 (select (arr!18436 a!2986) j!136) j!136 Nil!12381))))

(assert (=> b!645681 false))

(declare-fun b!645682 () Bool)

(declare-fun res!418309 () Bool)

(assert (=> b!645682 (=> (not res!418309) (not e!370037))))

(assert (=> b!645682 (= res!418309 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18436 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!58500 res!418300) b!645680))

(assert (= (and b!645680 res!418307) b!645669))

(assert (= (and b!645669 res!418296) b!645663))

(assert (= (and b!645663 res!418305) b!645671))

(assert (= (and b!645671 res!418297) b!645661))

(assert (= (and b!645661 res!418298) b!645666))

(assert (= (and b!645666 res!418294) b!645675))

(assert (= (and b!645675 res!418301) b!645682))

(assert (= (and b!645682 res!418309) b!645670))

(assert (= (and b!645670 res!418299) b!645678))

(assert (= (and b!645678 res!418302) b!645676))

(assert (= (and b!645676 res!418291) b!645664))

(assert (= (and b!645676 c!74053) b!645674))

(assert (= (and b!645676 (not c!74053)) b!645672))

(assert (= (and b!645676 (not res!418292)) b!645662))

(assert (= (and b!645662 res!418306) b!645677))

(assert (= (and b!645677 (not res!418293)) b!645660))

(assert (= (and b!645660 res!418308) b!645673))

(assert (= (and b!645662 (not res!418304)) b!645665))

(assert (= (and b!645665 c!74054) b!645681))

(assert (= (and b!645665 (not c!74054)) b!645667))

(assert (= (and b!645665 (not res!418295)) b!645679))

(assert (= (and b!645679 res!418303) b!645668))

(declare-fun m!619585 () Bool)

(assert (=> b!645668 m!619585))

(assert (=> b!645668 m!619585))

(declare-fun m!619587 () Bool)

(assert (=> b!645668 m!619587))

(assert (=> b!645681 m!619585))

(declare-fun m!619589 () Bool)

(assert (=> b!645681 m!619589))

(assert (=> b!645681 m!619585))

(declare-fun m!619591 () Bool)

(assert (=> b!645681 m!619591))

(declare-fun m!619593 () Bool)

(assert (=> b!645681 m!619593))

(assert (=> b!645681 m!619585))

(declare-fun m!619595 () Bool)

(assert (=> b!645681 m!619595))

(assert (=> b!645681 m!619585))

(declare-fun m!619597 () Bool)

(assert (=> b!645681 m!619597))

(declare-fun m!619599 () Bool)

(assert (=> b!645681 m!619599))

(declare-fun m!619601 () Bool)

(assert (=> b!645681 m!619601))

(declare-fun m!619603 () Bool)

(assert (=> b!645678 m!619603))

(assert (=> b!645678 m!619585))

(assert (=> b!645678 m!619585))

(declare-fun m!619605 () Bool)

(assert (=> b!645678 m!619605))

(assert (=> b!645677 m!619585))

(declare-fun m!619607 () Bool)

(assert (=> start!58500 m!619607))

(declare-fun m!619609 () Bool)

(assert (=> start!58500 m!619609))

(declare-fun m!619611 () Bool)

(assert (=> b!645661 m!619611))

(assert (=> b!645673 m!619585))

(assert (=> b!645673 m!619585))

(assert (=> b!645673 m!619587))

(declare-fun m!619613 () Bool)

(assert (=> b!645670 m!619613))

(declare-fun m!619615 () Bool)

(assert (=> b!645670 m!619615))

(declare-fun m!619617 () Bool)

(assert (=> b!645675 m!619617))

(declare-fun m!619619 () Bool)

(assert (=> b!645682 m!619619))

(assert (=> b!645662 m!619585))

(assert (=> b!645662 m!619613))

(declare-fun m!619621 () Bool)

(assert (=> b!645662 m!619621))

(assert (=> b!645679 m!619585))

(assert (=> b!645679 m!619585))

(declare-fun m!619623 () Bool)

(assert (=> b!645679 m!619623))

(assert (=> b!645679 m!619585))

(declare-fun m!619625 () Bool)

(assert (=> b!645679 m!619625))

(assert (=> b!645679 m!619585))

(declare-fun m!619627 () Bool)

(assert (=> b!645679 m!619627))

(assert (=> b!645669 m!619585))

(assert (=> b!645669 m!619585))

(declare-fun m!619629 () Bool)

(assert (=> b!645669 m!619629))

(declare-fun m!619631 () Bool)

(assert (=> b!645676 m!619631))

(declare-fun m!619633 () Bool)

(assert (=> b!645676 m!619633))

(declare-fun m!619635 () Bool)

(assert (=> b!645676 m!619635))

(assert (=> b!645676 m!619585))

(assert (=> b!645676 m!619613))

(declare-fun m!619637 () Bool)

(assert (=> b!645676 m!619637))

(assert (=> b!645676 m!619585))

(declare-fun m!619639 () Bool)

(assert (=> b!645676 m!619639))

(declare-fun m!619641 () Bool)

(assert (=> b!645676 m!619641))

(declare-fun m!619643 () Bool)

(assert (=> b!645671 m!619643))

(declare-fun m!619645 () Bool)

(assert (=> b!645663 m!619645))

(assert (=> b!645660 m!619585))

(assert (=> b!645660 m!619585))

(assert (=> b!645660 m!619627))

(declare-fun m!619647 () Bool)

(assert (=> b!645666 m!619647))

(check-sat (not b!645660) (not b!645679) (not b!645676) (not b!645681) (not b!645668) (not b!645671) (not b!645663) (not b!645678) (not b!645673) (not b!645669) (not b!645675) (not start!58500) (not b!645666) (not b!645661))
(check-sat)
