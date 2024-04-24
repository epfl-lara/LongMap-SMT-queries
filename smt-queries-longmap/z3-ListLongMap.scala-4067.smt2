; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55950 () Bool)

(assert start!55950)

(declare-fun b!611850 () Bool)

(declare-fun e!350649 () Bool)

(declare-fun e!350644 () Bool)

(assert (=> b!611850 (= e!350649 e!350644)))

(declare-fun res!393458 () Bool)

(assert (=> b!611850 (=> (not res!393458) (not e!350644))))

(declare-datatypes ((SeekEntryResult!6322 0))(
  ( (MissingZero!6322 (index!27572 (_ BitVec 32))) (Found!6322 (index!27573 (_ BitVec 32))) (Intermediate!6322 (undefined!7134 Bool) (index!27574 (_ BitVec 32)) (x!56541 (_ BitVec 32))) (Undefined!6322) (MissingVacant!6322 (index!27575 (_ BitVec 32))) )
))
(declare-fun lt!279930 () SeekEntryResult!6322)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!611850 (= res!393458 (or (= lt!279930 (MissingZero!6322 i!1108)) (= lt!279930 (MissingVacant!6322 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37365 0))(
  ( (array!37366 (arr!17926 (Array (_ BitVec 32) (_ BitVec 64))) (size!18290 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37365)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37365 (_ BitVec 32)) SeekEntryResult!6322)

(assert (=> b!611850 (= lt!279930 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!279942 () array!37365)

(declare-fun b!611851 () Bool)

(declare-fun e!350646 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611851 (= e!350646 (arrayContainsKey!0 lt!279942 (select (arr!17926 a!2986) j!136) index!984))))

(declare-fun b!611852 () Bool)

(declare-datatypes ((Unit!19585 0))(
  ( (Unit!19586) )
))
(declare-fun e!350658 () Unit!19585)

(declare-fun Unit!19587 () Unit!19585)

(assert (=> b!611852 (= e!350658 Unit!19587)))

(declare-fun b!611853 () Bool)

(declare-fun e!350651 () Unit!19585)

(declare-fun Unit!19588 () Unit!19585)

(assert (=> b!611853 (= e!350651 Unit!19588)))

(declare-fun lt!279937 () Unit!19585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19585)

(assert (=> b!611853 (= lt!279937 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279942 (select (arr!17926 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611853 (arrayContainsKey!0 lt!279942 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279935 () Unit!19585)

(declare-datatypes ((List!11874 0))(
  ( (Nil!11871) (Cons!11870 (h!12918 (_ BitVec 64)) (t!18094 List!11874)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11874) Unit!19585)

(assert (=> b!611853 (= lt!279935 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11871))))

(declare-fun arrayNoDuplicates!0 (array!37365 (_ BitVec 32) List!11874) Bool)

(assert (=> b!611853 (arrayNoDuplicates!0 lt!279942 #b00000000000000000000000000000000 Nil!11871)))

(declare-fun lt!279938 () Unit!19585)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37365 (_ BitVec 32) (_ BitVec 32)) Unit!19585)

(assert (=> b!611853 (= lt!279938 (lemmaNoDuplicateFromThenFromBigger!0 lt!279942 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611853 (arrayNoDuplicates!0 lt!279942 j!136 Nil!11871)))

(declare-fun lt!279934 () Unit!19585)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37365 (_ BitVec 64) (_ BitVec 32) List!11874) Unit!19585)

(assert (=> b!611853 (= lt!279934 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279942 (select (arr!17926 a!2986) j!136) j!136 Nil!11871))))

(assert (=> b!611853 false))

(declare-fun b!611854 () Bool)

(declare-fun res!393462 () Bool)

(assert (=> b!611854 (=> (not res!393462) (not e!350649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611854 (= res!393462 (validKeyInArray!0 k0!1786))))

(declare-fun b!611855 () Bool)

(declare-fun e!350656 () Bool)

(assert (=> b!611855 (= e!350656 true)))

(assert (=> b!611855 (arrayNoDuplicates!0 lt!279942 #b00000000000000000000000000000000 Nil!11871)))

(declare-fun lt!279940 () Unit!19585)

(assert (=> b!611855 (= lt!279940 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11871))))

(assert (=> b!611855 (arrayContainsKey!0 lt!279942 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279945 () Unit!19585)

(assert (=> b!611855 (= lt!279945 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279942 (select (arr!17926 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350652 () Bool)

(assert (=> b!611855 e!350652))

(declare-fun res!393456 () Bool)

(assert (=> b!611855 (=> (not res!393456) (not e!350652))))

(assert (=> b!611855 (= res!393456 (arrayContainsKey!0 lt!279942 (select (arr!17926 a!2986) j!136) j!136))))

(declare-fun b!611856 () Bool)

(declare-fun e!350648 () Bool)

(declare-fun lt!279939 () SeekEntryResult!6322)

(declare-fun lt!279936 () SeekEntryResult!6322)

(assert (=> b!611856 (= e!350648 (= lt!279939 lt!279936))))

(declare-fun b!611857 () Bool)

(declare-fun e!350653 () Bool)

(declare-fun e!350647 () Bool)

(assert (=> b!611857 (= e!350653 (not e!350647))))

(declare-fun res!393468 () Bool)

(assert (=> b!611857 (=> res!393468 e!350647)))

(declare-fun lt!279944 () SeekEntryResult!6322)

(assert (=> b!611857 (= res!393468 (not (= lt!279944 (Found!6322 index!984))))))

(declare-fun lt!279933 () Unit!19585)

(assert (=> b!611857 (= lt!279933 e!350658)))

(declare-fun c!69568 () Bool)

(assert (=> b!611857 (= c!69568 (= lt!279944 Undefined!6322))))

(declare-fun lt!279946 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37365 (_ BitVec 32)) SeekEntryResult!6322)

(assert (=> b!611857 (= lt!279944 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279946 lt!279942 mask!3053))))

(assert (=> b!611857 e!350648))

(declare-fun res!393454 () Bool)

(assert (=> b!611857 (=> (not res!393454) (not e!350648))))

(declare-fun lt!279931 () (_ BitVec 32))

(assert (=> b!611857 (= res!393454 (= lt!279936 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279931 vacantSpotIndex!68 lt!279946 lt!279942 mask!3053)))))

(assert (=> b!611857 (= lt!279936 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279931 vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611857 (= lt!279946 (select (store (arr!17926 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279932 () Unit!19585)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19585)

(assert (=> b!611857 (= lt!279932 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279931 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611857 (= lt!279931 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!611859 () Bool)

(declare-fun res!393463 () Bool)

(assert (=> b!611859 (=> (not res!393463) (not e!350649))))

(assert (=> b!611859 (= res!393463 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611860 () Bool)

(declare-fun res!393464 () Bool)

(assert (=> b!611860 (=> (not res!393464) (not e!350644))))

(assert (=> b!611860 (= res!393464 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11871))))

(declare-fun b!611861 () Bool)

(declare-fun e!350650 () Bool)

(assert (=> b!611861 (= e!350644 e!350650)))

(declare-fun res!393460 () Bool)

(assert (=> b!611861 (=> (not res!393460) (not e!350650))))

(assert (=> b!611861 (= res!393460 (= (select (store (arr!17926 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611861 (= lt!279942 (array!37366 (store (arr!17926 a!2986) i!1108 k0!1786) (size!18290 a!2986)))))

(declare-fun b!611862 () Bool)

(declare-fun res!393459 () Bool)

(assert (=> b!611862 (=> (not res!393459) (not e!350649))))

(assert (=> b!611862 (= res!393459 (and (= (size!18290 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18290 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18290 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611863 () Bool)

(assert (=> b!611863 (= e!350652 (arrayContainsKey!0 lt!279942 (select (arr!17926 a!2986) j!136) index!984))))

(declare-fun b!611864 () Bool)

(declare-fun e!350655 () Bool)

(assert (=> b!611864 (= e!350647 e!350655)))

(declare-fun res!393465 () Bool)

(assert (=> b!611864 (=> res!393465 e!350655)))

(declare-fun lt!279941 () (_ BitVec 64))

(assert (=> b!611864 (= res!393465 (or (not (= (select (arr!17926 a!2986) j!136) lt!279946)) (not (= (select (arr!17926 a!2986) j!136) lt!279941))))))

(declare-fun e!350657 () Bool)

(assert (=> b!611864 e!350657))

(declare-fun res!393453 () Bool)

(assert (=> b!611864 (=> (not res!393453) (not e!350657))))

(assert (=> b!611864 (= res!393453 (= lt!279941 (select (arr!17926 a!2986) j!136)))))

(assert (=> b!611864 (= lt!279941 (select (store (arr!17926 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!611865 () Bool)

(declare-fun res!393457 () Bool)

(assert (=> b!611865 (=> (not res!393457) (not e!350644))))

(assert (=> b!611865 (= res!393457 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17926 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611866 () Bool)

(declare-fun e!350645 () Bool)

(assert (=> b!611866 (= e!350645 e!350646)))

(declare-fun res!393451 () Bool)

(assert (=> b!611866 (=> (not res!393451) (not e!350646))))

(assert (=> b!611866 (= res!393451 (arrayContainsKey!0 lt!279942 (select (arr!17926 a!2986) j!136) j!136))))

(declare-fun b!611867 () Bool)

(declare-fun Unit!19589 () Unit!19585)

(assert (=> b!611867 (= e!350658 Unit!19589)))

(assert (=> b!611867 false))

(declare-fun b!611868 () Bool)

(declare-fun Unit!19590 () Unit!19585)

(assert (=> b!611868 (= e!350651 Unit!19590)))

(declare-fun b!611869 () Bool)

(assert (=> b!611869 (= e!350655 e!350656)))

(declare-fun res!393469 () Bool)

(assert (=> b!611869 (=> res!393469 e!350656)))

(assert (=> b!611869 (= res!393469 (bvsge index!984 j!136))))

(declare-fun lt!279943 () Unit!19585)

(assert (=> b!611869 (= lt!279943 e!350651)))

(declare-fun c!69569 () Bool)

(assert (=> b!611869 (= c!69569 (bvslt j!136 index!984))))

(declare-fun b!611870 () Bool)

(declare-fun res!393467 () Bool)

(assert (=> b!611870 (=> (not res!393467) (not e!350649))))

(assert (=> b!611870 (= res!393467 (validKeyInArray!0 (select (arr!17926 a!2986) j!136)))))

(declare-fun b!611871 () Bool)

(assert (=> b!611871 (= e!350657 e!350645)))

(declare-fun res!393455 () Bool)

(assert (=> b!611871 (=> res!393455 e!350645)))

(assert (=> b!611871 (= res!393455 (or (not (= (select (arr!17926 a!2986) j!136) lt!279946)) (not (= (select (arr!17926 a!2986) j!136) lt!279941)) (bvsge j!136 index!984)))))

(declare-fun b!611872 () Bool)

(assert (=> b!611872 (= e!350650 e!350653)))

(declare-fun res!393461 () Bool)

(assert (=> b!611872 (=> (not res!393461) (not e!350653))))

(assert (=> b!611872 (= res!393461 (and (= lt!279939 (Found!6322 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17926 a!2986) index!984) (select (arr!17926 a!2986) j!136))) (not (= (select (arr!17926 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611872 (= lt!279939 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!393452 () Bool)

(assert (=> start!55950 (=> (not res!393452) (not e!350649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55950 (= res!393452 (validMask!0 mask!3053))))

(assert (=> start!55950 e!350649))

(assert (=> start!55950 true))

(declare-fun array_inv!13785 (array!37365) Bool)

(assert (=> start!55950 (array_inv!13785 a!2986)))

(declare-fun b!611858 () Bool)

(declare-fun res!393466 () Bool)

(assert (=> b!611858 (=> (not res!393466) (not e!350644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37365 (_ BitVec 32)) Bool)

(assert (=> b!611858 (= res!393466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55950 res!393452) b!611862))

(assert (= (and b!611862 res!393459) b!611870))

(assert (= (and b!611870 res!393467) b!611854))

(assert (= (and b!611854 res!393462) b!611859))

(assert (= (and b!611859 res!393463) b!611850))

(assert (= (and b!611850 res!393458) b!611858))

(assert (= (and b!611858 res!393466) b!611860))

(assert (= (and b!611860 res!393464) b!611865))

(assert (= (and b!611865 res!393457) b!611861))

(assert (= (and b!611861 res!393460) b!611872))

(assert (= (and b!611872 res!393461) b!611857))

(assert (= (and b!611857 res!393454) b!611856))

(assert (= (and b!611857 c!69568) b!611867))

(assert (= (and b!611857 (not c!69568)) b!611852))

(assert (= (and b!611857 (not res!393468)) b!611864))

(assert (= (and b!611864 res!393453) b!611871))

(assert (= (and b!611871 (not res!393455)) b!611866))

(assert (= (and b!611866 res!393451) b!611851))

(assert (= (and b!611864 (not res!393465)) b!611869))

(assert (= (and b!611869 c!69569) b!611853))

(assert (= (and b!611869 (not c!69569)) b!611868))

(assert (= (and b!611869 (not res!393469)) b!611855))

(assert (= (and b!611855 res!393456) b!611863))

(declare-fun m!588533 () Bool)

(assert (=> b!611860 m!588533))

(declare-fun m!588535 () Bool)

(assert (=> b!611871 m!588535))

(assert (=> b!611853 m!588535))

(declare-fun m!588537 () Bool)

(assert (=> b!611853 m!588537))

(declare-fun m!588539 () Bool)

(assert (=> b!611853 m!588539))

(declare-fun m!588541 () Bool)

(assert (=> b!611853 m!588541))

(declare-fun m!588543 () Bool)

(assert (=> b!611853 m!588543))

(declare-fun m!588545 () Bool)

(assert (=> b!611853 m!588545))

(assert (=> b!611853 m!588535))

(assert (=> b!611853 m!588535))

(declare-fun m!588547 () Bool)

(assert (=> b!611853 m!588547))

(assert (=> b!611853 m!588535))

(declare-fun m!588549 () Bool)

(assert (=> b!611853 m!588549))

(declare-fun m!588551 () Bool)

(assert (=> b!611850 m!588551))

(assert (=> b!611870 m!588535))

(assert (=> b!611870 m!588535))

(declare-fun m!588553 () Bool)

(assert (=> b!611870 m!588553))

(assert (=> b!611864 m!588535))

(declare-fun m!588555 () Bool)

(assert (=> b!611864 m!588555))

(declare-fun m!588557 () Bool)

(assert (=> b!611864 m!588557))

(declare-fun m!588559 () Bool)

(assert (=> b!611872 m!588559))

(assert (=> b!611872 m!588535))

(assert (=> b!611872 m!588535))

(declare-fun m!588561 () Bool)

(assert (=> b!611872 m!588561))

(declare-fun m!588563 () Bool)

(assert (=> b!611859 m!588563))

(assert (=> b!611855 m!588543))

(assert (=> b!611855 m!588535))

(declare-fun m!588565 () Bool)

(assert (=> b!611855 m!588565))

(assert (=> b!611855 m!588535))

(declare-fun m!588567 () Bool)

(assert (=> b!611855 m!588567))

(assert (=> b!611855 m!588545))

(assert (=> b!611855 m!588535))

(declare-fun m!588569 () Bool)

(assert (=> b!611855 m!588569))

(assert (=> b!611855 m!588535))

(assert (=> b!611851 m!588535))

(assert (=> b!611851 m!588535))

(declare-fun m!588571 () Bool)

(assert (=> b!611851 m!588571))

(assert (=> b!611861 m!588555))

(declare-fun m!588573 () Bool)

(assert (=> b!611861 m!588573))

(declare-fun m!588575 () Bool)

(assert (=> b!611858 m!588575))

(assert (=> b!611866 m!588535))

(assert (=> b!611866 m!588535))

(assert (=> b!611866 m!588567))

(declare-fun m!588577 () Bool)

(assert (=> start!55950 m!588577))

(declare-fun m!588579 () Bool)

(assert (=> start!55950 m!588579))

(declare-fun m!588581 () Bool)

(assert (=> b!611857 m!588581))

(assert (=> b!611857 m!588535))

(assert (=> b!611857 m!588555))

(assert (=> b!611857 m!588535))

(declare-fun m!588583 () Bool)

(assert (=> b!611857 m!588583))

(declare-fun m!588585 () Bool)

(assert (=> b!611857 m!588585))

(declare-fun m!588587 () Bool)

(assert (=> b!611857 m!588587))

(declare-fun m!588589 () Bool)

(assert (=> b!611857 m!588589))

(declare-fun m!588591 () Bool)

(assert (=> b!611857 m!588591))

(declare-fun m!588593 () Bool)

(assert (=> b!611854 m!588593))

(declare-fun m!588595 () Bool)

(assert (=> b!611865 m!588595))

(assert (=> b!611863 m!588535))

(assert (=> b!611863 m!588535))

(assert (=> b!611863 m!588571))

(check-sat (not b!611858) (not b!611853) (not b!611872) (not b!611866) (not b!611857) (not b!611854) (not b!611863) (not b!611860) (not b!611870) (not b!611855) (not start!55950) (not b!611850) (not b!611859) (not b!611851))
(check-sat)
