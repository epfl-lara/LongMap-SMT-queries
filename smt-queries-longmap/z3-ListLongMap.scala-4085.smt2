; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55992 () Bool)

(assert start!55992)

(declare-fun b!615377 () Bool)

(declare-datatypes ((Unit!19956 0))(
  ( (Unit!19957) )
))
(declare-fun e!352819 () Unit!19956)

(declare-fun Unit!19958 () Unit!19956)

(assert (=> b!615377 (= e!352819 Unit!19958)))

(assert (=> b!615377 false))

(declare-fun b!615379 () Bool)

(declare-fun e!352826 () Bool)

(declare-fun e!352822 () Bool)

(assert (=> b!615379 (= e!352826 e!352822)))

(declare-fun res!396439 () Bool)

(assert (=> b!615379 (=> (not res!396439) (not e!352822))))

(declare-datatypes ((SeekEntryResult!6421 0))(
  ( (MissingZero!6421 (index!27968 (_ BitVec 32))) (Found!6421 (index!27969 (_ BitVec 32))) (Intermediate!6421 (undefined!7233 Bool) (index!27970 (_ BitVec 32)) (x!56776 (_ BitVec 32))) (Undefined!6421) (MissingVacant!6421 (index!27971 (_ BitVec 32))) )
))
(declare-fun lt!282643 () SeekEntryResult!6421)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615379 (= res!396439 (or (= lt!282643 (MissingZero!6421 i!1108)) (= lt!282643 (MissingVacant!6421 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37476 0))(
  ( (array!37477 (arr!17984 (Array (_ BitVec 32) (_ BitVec 64))) (size!18349 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37476)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37476 (_ BitVec 32)) SeekEntryResult!6421)

(assert (=> b!615379 (= lt!282643 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615380 () Bool)

(declare-fun e!352820 () Unit!19956)

(declare-fun Unit!19959 () Unit!19956)

(assert (=> b!615380 (= e!352820 Unit!19959)))

(declare-fun b!615381 () Bool)

(assert (=> b!615381 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!282638 () Unit!19956)

(declare-fun lt!282636 () array!37476)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12064 0))(
  ( (Nil!12061) (Cons!12060 (h!13105 (_ BitVec 64)) (t!18283 List!12064)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37476 (_ BitVec 64) (_ BitVec 32) List!12064) Unit!19956)

(assert (=> b!615381 (= lt!282638 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282636 (select (arr!17984 a!2986) j!136) index!984 Nil!12061))))

(declare-fun arrayNoDuplicates!0 (array!37476 (_ BitVec 32) List!12064) Bool)

(assert (=> b!615381 (arrayNoDuplicates!0 lt!282636 index!984 Nil!12061)))

(declare-fun lt!282642 () Unit!19956)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37476 (_ BitVec 32) (_ BitVec 32)) Unit!19956)

(assert (=> b!615381 (= lt!282642 (lemmaNoDuplicateFromThenFromBigger!0 lt!282636 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615381 (arrayNoDuplicates!0 lt!282636 #b00000000000000000000000000000000 Nil!12061)))

(declare-fun lt!282641 () Unit!19956)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12064) Unit!19956)

(assert (=> b!615381 (= lt!282641 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12061))))

(declare-fun arrayContainsKey!0 (array!37476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615381 (arrayContainsKey!0 lt!282636 (select (arr!17984 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282630 () Unit!19956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19956)

(assert (=> b!615381 (= lt!282630 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282636 (select (arr!17984 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352814 () Bool)

(assert (=> b!615381 e!352814))

(declare-fun res!396426 () Bool)

(assert (=> b!615381 (=> (not res!396426) (not e!352814))))

(assert (=> b!615381 (= res!396426 (arrayContainsKey!0 lt!282636 (select (arr!17984 a!2986) j!136) j!136))))

(declare-fun e!352815 () Unit!19956)

(declare-fun Unit!19960 () Unit!19956)

(assert (=> b!615381 (= e!352815 Unit!19960)))

(declare-fun b!615382 () Bool)

(declare-fun res!396437 () Bool)

(assert (=> b!615382 (=> (not res!396437) (not e!352822))))

(assert (=> b!615382 (= res!396437 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12061))))

(declare-fun b!615383 () Bool)

(declare-fun res!396431 () Bool)

(assert (=> b!615383 (=> (not res!396431) (not e!352826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615383 (= res!396431 (validKeyInArray!0 k0!1786))))

(declare-fun b!615384 () Bool)

(declare-fun res!396435 () Bool)

(assert (=> b!615384 (=> (not res!396435) (not e!352822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37476 (_ BitVec 32)) Bool)

(assert (=> b!615384 (= res!396435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615385 () Bool)

(declare-fun e!352824 () Bool)

(assert (=> b!615385 (= e!352824 (not true))))

(declare-fun lt!282637 () Unit!19956)

(assert (=> b!615385 (= lt!282637 e!352820)))

(declare-fun c!69845 () Bool)

(declare-fun lt!282633 () SeekEntryResult!6421)

(assert (=> b!615385 (= c!69845 (= lt!282633 (Found!6421 index!984)))))

(declare-fun lt!282631 () Unit!19956)

(assert (=> b!615385 (= lt!282631 e!352819)))

(declare-fun c!69843 () Bool)

(assert (=> b!615385 (= c!69843 (= lt!282633 Undefined!6421))))

(declare-fun lt!282640 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37476 (_ BitVec 32)) SeekEntryResult!6421)

(assert (=> b!615385 (= lt!282633 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282640 lt!282636 mask!3053))))

(declare-fun e!352825 () Bool)

(assert (=> b!615385 e!352825))

(declare-fun res!396438 () Bool)

(assert (=> b!615385 (=> (not res!396438) (not e!352825))))

(declare-fun lt!282632 () SeekEntryResult!6421)

(declare-fun lt!282629 () (_ BitVec 32))

(assert (=> b!615385 (= res!396438 (= lt!282632 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282629 vacantSpotIndex!68 lt!282640 lt!282636 mask!3053)))))

(assert (=> b!615385 (= lt!282632 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282629 vacantSpotIndex!68 (select (arr!17984 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615385 (= lt!282640 (select (store (arr!17984 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282625 () Unit!19956)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19956)

(assert (=> b!615385 (= lt!282625 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282629 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615385 (= lt!282629 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615386 () Bool)

(declare-fun Unit!19961 () Unit!19956)

(assert (=> b!615386 (= e!352815 Unit!19961)))

(declare-fun b!615387 () Bool)

(declare-fun e!352816 () Bool)

(assert (=> b!615387 (= e!352816 e!352824)))

(declare-fun res!396434 () Bool)

(assert (=> b!615387 (=> (not res!396434) (not e!352824))))

(declare-fun lt!282634 () SeekEntryResult!6421)

(assert (=> b!615387 (= res!396434 (and (= lt!282634 (Found!6421 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17984 a!2986) index!984) (select (arr!17984 a!2986) j!136))) (not (= (select (arr!17984 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615387 (= lt!282634 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17984 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615378 () Bool)

(declare-fun res!396432 () Bool)

(assert (=> b!615378 (=> (not res!396432) (not e!352826))))

(assert (=> b!615378 (= res!396432 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!396433 () Bool)

(assert (=> start!55992 (=> (not res!396433) (not e!352826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55992 (= res!396433 (validMask!0 mask!3053))))

(assert (=> start!55992 e!352826))

(assert (=> start!55992 true))

(declare-fun array_inv!13867 (array!37476) Bool)

(assert (=> start!55992 (array_inv!13867 a!2986)))

(declare-fun b!615388 () Bool)

(declare-fun e!352823 () Unit!19956)

(declare-fun Unit!19962 () Unit!19956)

(assert (=> b!615388 (= e!352823 Unit!19962)))

(declare-fun b!615389 () Bool)

(declare-fun Unit!19963 () Unit!19956)

(assert (=> b!615389 (= e!352819 Unit!19963)))

(declare-fun b!615390 () Bool)

(declare-fun Unit!19964 () Unit!19956)

(assert (=> b!615390 (= e!352820 Unit!19964)))

(declare-fun res!396428 () Bool)

(assert (=> b!615390 (= res!396428 (= (select (store (arr!17984 a!2986) i!1108 k0!1786) index!984) (select (arr!17984 a!2986) j!136)))))

(declare-fun e!352817 () Bool)

(assert (=> b!615390 (=> (not res!396428) (not e!352817))))

(assert (=> b!615390 e!352817))

(declare-fun c!69846 () Bool)

(assert (=> b!615390 (= c!69846 (bvslt j!136 index!984))))

(declare-fun lt!282626 () Unit!19956)

(assert (=> b!615390 (= lt!282626 e!352823)))

(declare-fun c!69844 () Bool)

(assert (=> b!615390 (= c!69844 (bvslt index!984 j!136))))

(declare-fun lt!282624 () Unit!19956)

(assert (=> b!615390 (= lt!282624 e!352815)))

(assert (=> b!615390 false))

(declare-fun b!615391 () Bool)

(assert (=> b!615391 false))

(declare-fun lt!282635 () Unit!19956)

(assert (=> b!615391 (= lt!282635 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282636 (select (arr!17984 a!2986) j!136) j!136 Nil!12061))))

(assert (=> b!615391 (arrayNoDuplicates!0 lt!282636 j!136 Nil!12061)))

(declare-fun lt!282639 () Unit!19956)

(assert (=> b!615391 (= lt!282639 (lemmaNoDuplicateFromThenFromBigger!0 lt!282636 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615391 (arrayNoDuplicates!0 lt!282636 #b00000000000000000000000000000000 Nil!12061)))

(declare-fun lt!282628 () Unit!19956)

(assert (=> b!615391 (= lt!282628 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12061))))

(assert (=> b!615391 (arrayContainsKey!0 lt!282636 (select (arr!17984 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282627 () Unit!19956)

(assert (=> b!615391 (= lt!282627 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282636 (select (arr!17984 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19965 () Unit!19956)

(assert (=> b!615391 (= e!352823 Unit!19965)))

(declare-fun b!615392 () Bool)

(assert (=> b!615392 (= e!352814 (arrayContainsKey!0 lt!282636 (select (arr!17984 a!2986) j!136) index!984))))

(declare-fun b!615393 () Bool)

(declare-fun res!396436 () Bool)

(assert (=> b!615393 (=> (not res!396436) (not e!352826))))

(assert (=> b!615393 (= res!396436 (validKeyInArray!0 (select (arr!17984 a!2986) j!136)))))

(declare-fun res!396429 () Bool)

(declare-fun b!615394 () Bool)

(assert (=> b!615394 (= res!396429 (arrayContainsKey!0 lt!282636 (select (arr!17984 a!2986) j!136) j!136))))

(declare-fun e!352821 () Bool)

(assert (=> b!615394 (=> (not res!396429) (not e!352821))))

(declare-fun e!352818 () Bool)

(assert (=> b!615394 (= e!352818 e!352821)))

(declare-fun b!615395 () Bool)

(declare-fun res!396425 () Bool)

(assert (=> b!615395 (=> (not res!396425) (not e!352822))))

(assert (=> b!615395 (= res!396425 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17984 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615396 () Bool)

(declare-fun res!396427 () Bool)

(assert (=> b!615396 (=> (not res!396427) (not e!352826))))

(assert (=> b!615396 (= res!396427 (and (= (size!18349 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18349 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18349 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615397 () Bool)

(assert (=> b!615397 (= e!352825 (= lt!282634 lt!282632))))

(declare-fun b!615398 () Bool)

(assert (=> b!615398 (= e!352822 e!352816)))

(declare-fun res!396430 () Bool)

(assert (=> b!615398 (=> (not res!396430) (not e!352816))))

(assert (=> b!615398 (= res!396430 (= (select (store (arr!17984 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615398 (= lt!282636 (array!37477 (store (arr!17984 a!2986) i!1108 k0!1786) (size!18349 a!2986)))))

(declare-fun b!615399 () Bool)

(declare-fun res!396440 () Bool)

(assert (=> b!615399 (= res!396440 (bvsge j!136 index!984))))

(assert (=> b!615399 (=> res!396440 e!352818)))

(assert (=> b!615399 (= e!352817 e!352818)))

(declare-fun b!615400 () Bool)

(assert (=> b!615400 (= e!352821 (arrayContainsKey!0 lt!282636 (select (arr!17984 a!2986) j!136) index!984))))

(assert (= (and start!55992 res!396433) b!615396))

(assert (= (and b!615396 res!396427) b!615393))

(assert (= (and b!615393 res!396436) b!615383))

(assert (= (and b!615383 res!396431) b!615378))

(assert (= (and b!615378 res!396432) b!615379))

(assert (= (and b!615379 res!396439) b!615384))

(assert (= (and b!615384 res!396435) b!615382))

(assert (= (and b!615382 res!396437) b!615395))

(assert (= (and b!615395 res!396425) b!615398))

(assert (= (and b!615398 res!396430) b!615387))

(assert (= (and b!615387 res!396434) b!615385))

(assert (= (and b!615385 res!396438) b!615397))

(assert (= (and b!615385 c!69843) b!615377))

(assert (= (and b!615385 (not c!69843)) b!615389))

(assert (= (and b!615385 c!69845) b!615390))

(assert (= (and b!615385 (not c!69845)) b!615380))

(assert (= (and b!615390 res!396428) b!615399))

(assert (= (and b!615399 (not res!396440)) b!615394))

(assert (= (and b!615394 res!396429) b!615400))

(assert (= (and b!615390 c!69846) b!615391))

(assert (= (and b!615390 (not c!69846)) b!615388))

(assert (= (and b!615390 c!69844) b!615381))

(assert (= (and b!615390 (not c!69844)) b!615386))

(assert (= (and b!615381 res!396426) b!615392))

(declare-fun m!591073 () Bool)

(assert (=> b!615398 m!591073))

(declare-fun m!591075 () Bool)

(assert (=> b!615398 m!591075))

(declare-fun m!591077 () Bool)

(assert (=> b!615378 m!591077))

(declare-fun m!591079 () Bool)

(assert (=> b!615383 m!591079))

(declare-fun m!591081 () Bool)

(assert (=> b!615400 m!591081))

(assert (=> b!615400 m!591081))

(declare-fun m!591083 () Bool)

(assert (=> b!615400 m!591083))

(declare-fun m!591085 () Bool)

(assert (=> start!55992 m!591085))

(declare-fun m!591087 () Bool)

(assert (=> start!55992 m!591087))

(declare-fun m!591089 () Bool)

(assert (=> b!615391 m!591089))

(assert (=> b!615391 m!591081))

(declare-fun m!591091 () Bool)

(assert (=> b!615391 m!591091))

(assert (=> b!615391 m!591081))

(declare-fun m!591093 () Bool)

(assert (=> b!615391 m!591093))

(assert (=> b!615391 m!591081))

(declare-fun m!591095 () Bool)

(assert (=> b!615391 m!591095))

(declare-fun m!591097 () Bool)

(assert (=> b!615391 m!591097))

(assert (=> b!615391 m!591081))

(declare-fun m!591099 () Bool)

(assert (=> b!615391 m!591099))

(declare-fun m!591101 () Bool)

(assert (=> b!615391 m!591101))

(declare-fun m!591103 () Bool)

(assert (=> b!615385 m!591103))

(declare-fun m!591105 () Bool)

(assert (=> b!615385 m!591105))

(declare-fun m!591107 () Bool)

(assert (=> b!615385 m!591107))

(assert (=> b!615385 m!591073))

(assert (=> b!615385 m!591081))

(declare-fun m!591109 () Bool)

(assert (=> b!615385 m!591109))

(declare-fun m!591111 () Bool)

(assert (=> b!615385 m!591111))

(assert (=> b!615385 m!591081))

(declare-fun m!591113 () Bool)

(assert (=> b!615385 m!591113))

(assert (=> b!615392 m!591081))

(assert (=> b!615392 m!591081))

(assert (=> b!615392 m!591083))

(assert (=> b!615393 m!591081))

(assert (=> b!615393 m!591081))

(declare-fun m!591115 () Bool)

(assert (=> b!615393 m!591115))

(declare-fun m!591117 () Bool)

(assert (=> b!615379 m!591117))

(assert (=> b!615394 m!591081))

(assert (=> b!615394 m!591081))

(declare-fun m!591119 () Bool)

(assert (=> b!615394 m!591119))

(declare-fun m!591121 () Bool)

(assert (=> b!615395 m!591121))

(declare-fun m!591123 () Bool)

(assert (=> b!615384 m!591123))

(declare-fun m!591125 () Bool)

(assert (=> b!615382 m!591125))

(assert (=> b!615390 m!591073))

(declare-fun m!591127 () Bool)

(assert (=> b!615390 m!591127))

(assert (=> b!615390 m!591081))

(assert (=> b!615381 m!591089))

(assert (=> b!615381 m!591081))

(declare-fun m!591129 () Bool)

(assert (=> b!615381 m!591129))

(assert (=> b!615381 m!591081))

(declare-fun m!591131 () Bool)

(assert (=> b!615381 m!591131))

(assert (=> b!615381 m!591081))

(declare-fun m!591133 () Bool)

(assert (=> b!615381 m!591133))

(declare-fun m!591135 () Bool)

(assert (=> b!615381 m!591135))

(assert (=> b!615381 m!591101))

(assert (=> b!615381 m!591081))

(declare-fun m!591137 () Bool)

(assert (=> b!615381 m!591137))

(assert (=> b!615381 m!591081))

(assert (=> b!615381 m!591119))

(declare-fun m!591139 () Bool)

(assert (=> b!615387 m!591139))

(assert (=> b!615387 m!591081))

(assert (=> b!615387 m!591081))

(declare-fun m!591141 () Bool)

(assert (=> b!615387 m!591141))

(check-sat (not b!615384) (not b!615385) (not b!615383) (not b!615381) (not b!615400) (not start!55992) (not b!615378) (not b!615387) (not b!615392) (not b!615382) (not b!615391) (not b!615379) (not b!615393) (not b!615394))
(check-sat)
