; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57914 () Bool)

(assert start!57914)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38352 0))(
  ( (array!38353 (arr!18395 (Array (_ BitVec 32) (_ BitVec 64))) (size!18760 (_ BitVec 32))) )
))
(declare-fun lt!296374 () array!38352)

(declare-fun e!366634 () Bool)

(declare-fun b!640476 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38352)

(declare-fun arrayContainsKey!0 (array!38352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640476 (= e!366634 (arrayContainsKey!0 lt!296374 (select (arr!18395 a!2986) j!136) index!984))))

(declare-fun b!640477 () Bool)

(declare-fun e!366630 () Bool)

(declare-datatypes ((SeekEntryResult!6832 0))(
  ( (MissingZero!6832 (index!29648 (_ BitVec 32))) (Found!6832 (index!29649 (_ BitVec 32))) (Intermediate!6832 (undefined!7644 Bool) (index!29650 (_ BitVec 32)) (x!58415 (_ BitVec 32))) (Undefined!6832) (MissingVacant!6832 (index!29651 (_ BitVec 32))) )
))
(declare-fun lt!296364 () SeekEntryResult!6832)

(declare-fun lt!296368 () SeekEntryResult!6832)

(assert (=> b!640477 (= e!366630 (= lt!296364 lt!296368))))

(declare-fun b!640478 () Bool)

(declare-fun res!414865 () Bool)

(declare-fun e!366633 () Bool)

(assert (=> b!640478 (=> (not res!414865) (not e!366633))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!640478 (= res!414865 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18395 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640479 () Bool)

(declare-fun res!414868 () Bool)

(declare-fun e!366627 () Bool)

(assert (=> b!640479 (=> (not res!414868) (not e!366627))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!640479 (= res!414868 (and (= (size!18760 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18760 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18760 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!414878 () Bool)

(assert (=> start!57914 (=> (not res!414878) (not e!366627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57914 (= res!414878 (validMask!0 mask!3053))))

(assert (=> start!57914 e!366627))

(assert (=> start!57914 true))

(declare-fun array_inv!14278 (array!38352) Bool)

(assert (=> start!57914 (array_inv!14278 a!2986)))

(declare-fun b!640480 () Bool)

(declare-fun res!414873 () Bool)

(assert (=> b!640480 (=> (not res!414873) (not e!366627))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640480 (= res!414873 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640481 () Bool)

(assert (=> b!640481 (= e!366627 e!366633)))

(declare-fun res!414866 () Bool)

(assert (=> b!640481 (=> (not res!414866) (not e!366633))))

(declare-fun lt!296366 () SeekEntryResult!6832)

(assert (=> b!640481 (= res!414866 (or (= lt!296366 (MissingZero!6832 i!1108)) (= lt!296366 (MissingVacant!6832 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38352 (_ BitVec 32)) SeekEntryResult!6832)

(assert (=> b!640481 (= lt!296366 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640482 () Bool)

(declare-fun e!366628 () Bool)

(declare-fun e!366638 () Bool)

(assert (=> b!640482 (= e!366628 (not e!366638))))

(declare-fun res!414874 () Bool)

(assert (=> b!640482 (=> res!414874 e!366638)))

(declare-fun lt!296373 () SeekEntryResult!6832)

(assert (=> b!640482 (= res!414874 (not (= lt!296373 (Found!6832 index!984))))))

(declare-datatypes ((Unit!21656 0))(
  ( (Unit!21657) )
))
(declare-fun lt!296372 () Unit!21656)

(declare-fun e!366635 () Unit!21656)

(assert (=> b!640482 (= lt!296372 e!366635)))

(declare-fun c!73173 () Bool)

(assert (=> b!640482 (= c!73173 (= lt!296373 Undefined!6832))))

(declare-fun lt!296370 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38352 (_ BitVec 32)) SeekEntryResult!6832)

(assert (=> b!640482 (= lt!296373 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296370 lt!296374 mask!3053))))

(assert (=> b!640482 e!366630))

(declare-fun res!414871 () Bool)

(assert (=> b!640482 (=> (not res!414871) (not e!366630))))

(declare-fun lt!296369 () (_ BitVec 32))

(assert (=> b!640482 (= res!414871 (= lt!296368 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296369 vacantSpotIndex!68 lt!296370 lt!296374 mask!3053)))))

(assert (=> b!640482 (= lt!296368 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296369 vacantSpotIndex!68 (select (arr!18395 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640482 (= lt!296370 (select (store (arr!18395 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296375 () Unit!21656)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38352 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21656)

(assert (=> b!640482 (= lt!296375 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296369 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640482 (= lt!296369 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640483 () Bool)

(declare-fun res!414870 () Bool)

(assert (=> b!640483 (=> (not res!414870) (not e!366633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38352 (_ BitVec 32)) Bool)

(assert (=> b!640483 (= res!414870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640484 () Bool)

(declare-fun e!366629 () Bool)

(declare-fun e!366637 () Bool)

(assert (=> b!640484 (= e!366629 e!366637)))

(declare-fun res!414879 () Bool)

(assert (=> b!640484 (=> res!414879 e!366637)))

(declare-fun lt!296371 () (_ BitVec 64))

(assert (=> b!640484 (= res!414879 (or (not (= (select (arr!18395 a!2986) j!136) lt!296370)) (not (= (select (arr!18395 a!2986) j!136) lt!296371)) (bvsge j!136 index!984)))))

(declare-fun b!640485 () Bool)

(declare-fun res!414875 () Bool)

(assert (=> b!640485 (=> (not res!414875) (not e!366633))))

(declare-datatypes ((List!12475 0))(
  ( (Nil!12472) (Cons!12471 (h!13516 (_ BitVec 64)) (t!18694 List!12475)) )
))
(declare-fun arrayNoDuplicates!0 (array!38352 (_ BitVec 32) List!12475) Bool)

(assert (=> b!640485 (= res!414875 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12472))))

(declare-fun b!640486 () Bool)

(assert (=> b!640486 (= e!366637 e!366634)))

(declare-fun res!414864 () Bool)

(assert (=> b!640486 (=> (not res!414864) (not e!366634))))

(assert (=> b!640486 (= res!414864 (arrayContainsKey!0 lt!296374 (select (arr!18395 a!2986) j!136) j!136))))

(declare-fun b!640487 () Bool)

(declare-fun Unit!21658 () Unit!21656)

(assert (=> b!640487 (= e!366635 Unit!21658)))

(declare-fun b!640488 () Bool)

(declare-fun Unit!21659 () Unit!21656)

(assert (=> b!640488 (= e!366635 Unit!21659)))

(assert (=> b!640488 false))

(declare-fun b!640489 () Bool)

(declare-fun e!366632 () Bool)

(assert (=> b!640489 (= e!366632 true)))

(assert (=> b!640489 (arrayNoDuplicates!0 lt!296374 j!136 Nil!12472)))

(declare-fun lt!296367 () Unit!21656)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38352 (_ BitVec 32) (_ BitVec 32)) Unit!21656)

(assert (=> b!640489 (= lt!296367 (lemmaNoDuplicateFromThenFromBigger!0 lt!296374 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640489 (arrayNoDuplicates!0 lt!296374 #b00000000000000000000000000000000 Nil!12472)))

(declare-fun lt!296365 () Unit!21656)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12475) Unit!21656)

(assert (=> b!640489 (= lt!296365 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12472))))

(assert (=> b!640489 (arrayContainsKey!0 lt!296374 (select (arr!18395 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296376 () Unit!21656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21656)

(assert (=> b!640489 (= lt!296376 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296374 (select (arr!18395 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640490 () Bool)

(declare-fun e!366636 () Bool)

(assert (=> b!640490 (= e!366636 e!366628)))

(declare-fun res!414876 () Bool)

(assert (=> b!640490 (=> (not res!414876) (not e!366628))))

(assert (=> b!640490 (= res!414876 (and (= lt!296364 (Found!6832 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18395 a!2986) index!984) (select (arr!18395 a!2986) j!136))) (not (= (select (arr!18395 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640490 (= lt!296364 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18395 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640491 () Bool)

(declare-fun res!414880 () Bool)

(assert (=> b!640491 (=> (not res!414880) (not e!366627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640491 (= res!414880 (validKeyInArray!0 k0!1786))))

(declare-fun b!640492 () Bool)

(assert (=> b!640492 (= e!366633 e!366636)))

(declare-fun res!414867 () Bool)

(assert (=> b!640492 (=> (not res!414867) (not e!366636))))

(assert (=> b!640492 (= res!414867 (= (select (store (arr!18395 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640492 (= lt!296374 (array!38353 (store (arr!18395 a!2986) i!1108 k0!1786) (size!18760 a!2986)))))

(declare-fun b!640493 () Bool)

(declare-fun res!414877 () Bool)

(assert (=> b!640493 (=> (not res!414877) (not e!366627))))

(assert (=> b!640493 (= res!414877 (validKeyInArray!0 (select (arr!18395 a!2986) j!136)))))

(declare-fun b!640494 () Bool)

(assert (=> b!640494 (= e!366638 e!366632)))

(declare-fun res!414869 () Bool)

(assert (=> b!640494 (=> res!414869 e!366632)))

(assert (=> b!640494 (= res!414869 (or (not (= (select (arr!18395 a!2986) j!136) lt!296370)) (not (= (select (arr!18395 a!2986) j!136) lt!296371)) (bvsge j!136 index!984)))))

(assert (=> b!640494 e!366629))

(declare-fun res!414872 () Bool)

(assert (=> b!640494 (=> (not res!414872) (not e!366629))))

(assert (=> b!640494 (= res!414872 (= lt!296371 (select (arr!18395 a!2986) j!136)))))

(assert (=> b!640494 (= lt!296371 (select (store (arr!18395 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!57914 res!414878) b!640479))

(assert (= (and b!640479 res!414868) b!640493))

(assert (= (and b!640493 res!414877) b!640491))

(assert (= (and b!640491 res!414880) b!640480))

(assert (= (and b!640480 res!414873) b!640481))

(assert (= (and b!640481 res!414866) b!640483))

(assert (= (and b!640483 res!414870) b!640485))

(assert (= (and b!640485 res!414875) b!640478))

(assert (= (and b!640478 res!414865) b!640492))

(assert (= (and b!640492 res!414867) b!640490))

(assert (= (and b!640490 res!414876) b!640482))

(assert (= (and b!640482 res!414871) b!640477))

(assert (= (and b!640482 c!73173) b!640488))

(assert (= (and b!640482 (not c!73173)) b!640487))

(assert (= (and b!640482 (not res!414874)) b!640494))

(assert (= (and b!640494 res!414872) b!640484))

(assert (= (and b!640484 (not res!414879)) b!640486))

(assert (= (and b!640486 res!414864) b!640476))

(assert (= (and b!640494 (not res!414869)) b!640489))

(declare-fun m!613827 () Bool)

(assert (=> b!640476 m!613827))

(assert (=> b!640476 m!613827))

(declare-fun m!613829 () Bool)

(assert (=> b!640476 m!613829))

(declare-fun m!613831 () Bool)

(assert (=> b!640491 m!613831))

(assert (=> b!640494 m!613827))

(declare-fun m!613833 () Bool)

(assert (=> b!640494 m!613833))

(declare-fun m!613835 () Bool)

(assert (=> b!640494 m!613835))

(assert (=> b!640484 m!613827))

(assert (=> b!640492 m!613833))

(declare-fun m!613837 () Bool)

(assert (=> b!640492 m!613837))

(declare-fun m!613839 () Bool)

(assert (=> b!640478 m!613839))

(declare-fun m!613841 () Bool)

(assert (=> b!640480 m!613841))

(declare-fun m!613843 () Bool)

(assert (=> b!640482 m!613843))

(declare-fun m!613845 () Bool)

(assert (=> b!640482 m!613845))

(assert (=> b!640482 m!613827))

(assert (=> b!640482 m!613833))

(declare-fun m!613847 () Bool)

(assert (=> b!640482 m!613847))

(declare-fun m!613849 () Bool)

(assert (=> b!640482 m!613849))

(assert (=> b!640482 m!613827))

(declare-fun m!613851 () Bool)

(assert (=> b!640482 m!613851))

(declare-fun m!613853 () Bool)

(assert (=> b!640482 m!613853))

(declare-fun m!613855 () Bool)

(assert (=> b!640489 m!613855))

(assert (=> b!640489 m!613827))

(assert (=> b!640489 m!613827))

(declare-fun m!613857 () Bool)

(assert (=> b!640489 m!613857))

(assert (=> b!640489 m!613827))

(declare-fun m!613859 () Bool)

(assert (=> b!640489 m!613859))

(declare-fun m!613861 () Bool)

(assert (=> b!640489 m!613861))

(declare-fun m!613863 () Bool)

(assert (=> b!640489 m!613863))

(declare-fun m!613865 () Bool)

(assert (=> b!640489 m!613865))

(declare-fun m!613867 () Bool)

(assert (=> b!640490 m!613867))

(assert (=> b!640490 m!613827))

(assert (=> b!640490 m!613827))

(declare-fun m!613869 () Bool)

(assert (=> b!640490 m!613869))

(declare-fun m!613871 () Bool)

(assert (=> b!640483 m!613871))

(assert (=> b!640493 m!613827))

(assert (=> b!640493 m!613827))

(declare-fun m!613873 () Bool)

(assert (=> b!640493 m!613873))

(declare-fun m!613875 () Bool)

(assert (=> b!640485 m!613875))

(declare-fun m!613877 () Bool)

(assert (=> b!640481 m!613877))

(assert (=> b!640486 m!613827))

(assert (=> b!640486 m!613827))

(declare-fun m!613879 () Bool)

(assert (=> b!640486 m!613879))

(declare-fun m!613881 () Bool)

(assert (=> start!57914 m!613881))

(declare-fun m!613883 () Bool)

(assert (=> start!57914 m!613883))

(check-sat (not b!640485) (not b!640482) (not b!640491) (not b!640493) (not b!640476) (not start!57914) (not b!640486) (not b!640481) (not b!640483) (not b!640480) (not b!640489) (not b!640490))
(check-sat)
