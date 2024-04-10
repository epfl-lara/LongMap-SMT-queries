; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55128 () Bool)

(assert start!55128)

(declare-fun b!603616 () Bool)

(declare-fun res!387687 () Bool)

(declare-fun e!345319 () Bool)

(assert (=> b!603616 (=> (not res!387687) (not e!345319))))

(declare-datatypes ((array!37201 0))(
  ( (array!37202 (arr!17857 (Array (_ BitVec 32) (_ BitVec 64))) (size!18221 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37201)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603616 (= res!387687 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603618 () Bool)

(declare-fun res!387691 () Bool)

(assert (=> b!603618 (=> (not res!387691) (not e!345319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603618 (= res!387691 (validKeyInArray!0 k0!1786))))

(declare-fun b!603619 () Bool)

(declare-fun e!345316 () Bool)

(declare-fun e!345321 () Bool)

(assert (=> b!603619 (= e!345316 e!345321)))

(declare-fun res!387698 () Bool)

(assert (=> b!603619 (=> (not res!387698) (not e!345321))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6297 0))(
  ( (MissingZero!6297 (index!27451 (_ BitVec 32))) (Found!6297 (index!27452 (_ BitVec 32))) (Intermediate!6297 (undefined!7109 Bool) (index!27453 (_ BitVec 32)) (x!56250 (_ BitVec 32))) (Undefined!6297) (MissingVacant!6297 (index!27454 (_ BitVec 32))) )
))
(declare-fun lt!275121 () SeekEntryResult!6297)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603619 (= res!387698 (and (= lt!275121 (Found!6297 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17857 a!2986) index!984) (select (arr!17857 a!2986) j!136))) (not (= (select (arr!17857 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37201 (_ BitVec 32)) SeekEntryResult!6297)

(assert (=> b!603619 (= lt!275121 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17857 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603620 () Bool)

(declare-fun res!387697 () Bool)

(assert (=> b!603620 (=> (not res!387697) (not e!345319))))

(assert (=> b!603620 (= res!387697 (validKeyInArray!0 (select (arr!17857 a!2986) j!136)))))

(declare-fun b!603621 () Bool)

(declare-fun e!345328 () Bool)

(declare-fun e!345318 () Bool)

(assert (=> b!603621 (= e!345328 e!345318)))

(declare-fun res!387694 () Bool)

(assert (=> b!603621 (=> res!387694 e!345318)))

(assert (=> b!603621 (= res!387694 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19162 0))(
  ( (Unit!19163) )
))
(declare-fun lt!275112 () Unit!19162)

(declare-fun e!345330 () Unit!19162)

(assert (=> b!603621 (= lt!275112 e!345330)))

(declare-fun c!68335 () Bool)

(assert (=> b!603621 (= c!68335 (bvslt j!136 index!984))))

(declare-fun b!603622 () Bool)

(declare-fun Unit!19164 () Unit!19162)

(assert (=> b!603622 (= e!345330 Unit!19164)))

(declare-fun b!603623 () Bool)

(declare-fun e!345325 () Bool)

(declare-fun e!345317 () Bool)

(assert (=> b!603623 (= e!345325 e!345317)))

(declare-fun res!387685 () Bool)

(assert (=> b!603623 (=> res!387685 e!345317)))

(declare-fun lt!275122 () (_ BitVec 64))

(declare-fun lt!275108 () (_ BitVec 64))

(assert (=> b!603623 (= res!387685 (or (not (= (select (arr!17857 a!2986) j!136) lt!275122)) (not (= (select (arr!17857 a!2986) j!136) lt!275108)) (bvsge j!136 index!984)))))

(declare-fun b!603624 () Bool)

(declare-fun e!345327 () Bool)

(declare-fun lt!275113 () SeekEntryResult!6297)

(assert (=> b!603624 (= e!345327 (= lt!275121 lt!275113))))

(declare-fun b!603625 () Bool)

(declare-fun res!387680 () Bool)

(declare-fun e!345322 () Bool)

(assert (=> b!603625 (=> (not res!387680) (not e!345322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37201 (_ BitVec 32)) Bool)

(assert (=> b!603625 (= res!387680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603626 () Bool)

(declare-fun e!345323 () Bool)

(assert (=> b!603626 (= e!345321 (not e!345323))))

(declare-fun res!387696 () Bool)

(assert (=> b!603626 (=> res!387696 e!345323)))

(declare-fun lt!275120 () SeekEntryResult!6297)

(assert (=> b!603626 (= res!387696 (not (= lt!275120 (Found!6297 index!984))))))

(declare-fun lt!275117 () Unit!19162)

(declare-fun e!345320 () Unit!19162)

(assert (=> b!603626 (= lt!275117 e!345320)))

(declare-fun c!68336 () Bool)

(assert (=> b!603626 (= c!68336 (= lt!275120 Undefined!6297))))

(declare-fun lt!275114 () array!37201)

(assert (=> b!603626 (= lt!275120 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275122 lt!275114 mask!3053))))

(assert (=> b!603626 e!345327))

(declare-fun res!387681 () Bool)

(assert (=> b!603626 (=> (not res!387681) (not e!345327))))

(declare-fun lt!275109 () (_ BitVec 32))

(assert (=> b!603626 (= res!387681 (= lt!275113 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275109 vacantSpotIndex!68 lt!275122 lt!275114 mask!3053)))))

(assert (=> b!603626 (= lt!275113 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275109 vacantSpotIndex!68 (select (arr!17857 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603626 (= lt!275122 (select (store (arr!17857 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275110 () Unit!19162)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19162)

(assert (=> b!603626 (= lt!275110 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275109 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603626 (= lt!275109 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603627 () Bool)

(declare-fun res!387683 () Bool)

(assert (=> b!603627 (=> (not res!387683) (not e!345322))))

(declare-datatypes ((List!11898 0))(
  ( (Nil!11895) (Cons!11894 (h!12939 (_ BitVec 64)) (t!18126 List!11898)) )
))
(declare-fun arrayNoDuplicates!0 (array!37201 (_ BitVec 32) List!11898) Bool)

(assert (=> b!603627 (= res!387683 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11895))))

(declare-fun b!603628 () Bool)

(declare-fun e!345326 () Bool)

(assert (=> b!603628 (= e!345317 e!345326)))

(declare-fun res!387692 () Bool)

(assert (=> b!603628 (=> (not res!387692) (not e!345326))))

(assert (=> b!603628 (= res!387692 (arrayContainsKey!0 lt!275114 (select (arr!17857 a!2986) j!136) j!136))))

(declare-fun b!603629 () Bool)

(declare-fun Unit!19165 () Unit!19162)

(assert (=> b!603629 (= e!345320 Unit!19165)))

(declare-fun b!603630 () Bool)

(assert (=> b!603630 (= e!345319 e!345322)))

(declare-fun res!387688 () Bool)

(assert (=> b!603630 (=> (not res!387688) (not e!345322))))

(declare-fun lt!275118 () SeekEntryResult!6297)

(assert (=> b!603630 (= res!387688 (or (= lt!275118 (MissingZero!6297 i!1108)) (= lt!275118 (MissingVacant!6297 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37201 (_ BitVec 32)) SeekEntryResult!6297)

(assert (=> b!603630 (= lt!275118 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603631 () Bool)

(assert (=> b!603631 (= e!345323 e!345328)))

(declare-fun res!387686 () Bool)

(assert (=> b!603631 (=> res!387686 e!345328)))

(assert (=> b!603631 (= res!387686 (or (not (= (select (arr!17857 a!2986) j!136) lt!275122)) (not (= (select (arr!17857 a!2986) j!136) lt!275108))))))

(assert (=> b!603631 e!345325))

(declare-fun res!387689 () Bool)

(assert (=> b!603631 (=> (not res!387689) (not e!345325))))

(assert (=> b!603631 (= res!387689 (= lt!275108 (select (arr!17857 a!2986) j!136)))))

(assert (=> b!603631 (= lt!275108 (select (store (arr!17857 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603632 () Bool)

(assert (=> b!603632 (= e!345322 e!345316)))

(declare-fun res!387690 () Bool)

(assert (=> b!603632 (=> (not res!387690) (not e!345316))))

(assert (=> b!603632 (= res!387690 (= (select (store (arr!17857 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603632 (= lt!275114 (array!37202 (store (arr!17857 a!2986) i!1108 k0!1786) (size!18221 a!2986)))))

(declare-fun b!603633 () Bool)

(assert (=> b!603633 (= e!345318 true)))

(declare-fun e!345329 () Bool)

(assert (=> b!603633 e!345329))

(declare-fun res!387684 () Bool)

(assert (=> b!603633 (=> (not res!387684) (not e!345329))))

(assert (=> b!603633 (= res!387684 (arrayContainsKey!0 lt!275114 (select (arr!17857 a!2986) j!136) j!136))))

(declare-fun b!603634 () Bool)

(declare-fun Unit!19166 () Unit!19162)

(assert (=> b!603634 (= e!345320 Unit!19166)))

(assert (=> b!603634 false))

(declare-fun b!603635 () Bool)

(assert (=> b!603635 (= e!345326 (arrayContainsKey!0 lt!275114 (select (arr!17857 a!2986) j!136) index!984))))

(declare-fun b!603636 () Bool)

(declare-fun Unit!19167 () Unit!19162)

(assert (=> b!603636 (= e!345330 Unit!19167)))

(declare-fun lt!275115 () Unit!19162)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37201 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19162)

(assert (=> b!603636 (= lt!275115 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275114 (select (arr!17857 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603636 (arrayContainsKey!0 lt!275114 (select (arr!17857 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275119 () Unit!19162)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37201 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11898) Unit!19162)

(assert (=> b!603636 (= lt!275119 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11895))))

(assert (=> b!603636 (arrayNoDuplicates!0 lt!275114 #b00000000000000000000000000000000 Nil!11895)))

(declare-fun lt!275116 () Unit!19162)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37201 (_ BitVec 32) (_ BitVec 32)) Unit!19162)

(assert (=> b!603636 (= lt!275116 (lemmaNoDuplicateFromThenFromBigger!0 lt!275114 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603636 (arrayNoDuplicates!0 lt!275114 j!136 Nil!11895)))

(declare-fun lt!275111 () Unit!19162)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37201 (_ BitVec 64) (_ BitVec 32) List!11898) Unit!19162)

(assert (=> b!603636 (= lt!275111 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275114 (select (arr!17857 a!2986) j!136) j!136 Nil!11895))))

(assert (=> b!603636 false))

(declare-fun b!603617 () Bool)

(declare-fun res!387695 () Bool)

(assert (=> b!603617 (=> (not res!387695) (not e!345322))))

(assert (=> b!603617 (= res!387695 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17857 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!387682 () Bool)

(assert (=> start!55128 (=> (not res!387682) (not e!345319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55128 (= res!387682 (validMask!0 mask!3053))))

(assert (=> start!55128 e!345319))

(assert (=> start!55128 true))

(declare-fun array_inv!13653 (array!37201) Bool)

(assert (=> start!55128 (array_inv!13653 a!2986)))

(declare-fun b!603637 () Bool)

(declare-fun res!387693 () Bool)

(assert (=> b!603637 (=> (not res!387693) (not e!345319))))

(assert (=> b!603637 (= res!387693 (and (= (size!18221 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18221 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18221 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603638 () Bool)

(assert (=> b!603638 (= e!345329 (arrayContainsKey!0 lt!275114 (select (arr!17857 a!2986) j!136) index!984))))

(assert (= (and start!55128 res!387682) b!603637))

(assert (= (and b!603637 res!387693) b!603620))

(assert (= (and b!603620 res!387697) b!603618))

(assert (= (and b!603618 res!387691) b!603616))

(assert (= (and b!603616 res!387687) b!603630))

(assert (= (and b!603630 res!387688) b!603625))

(assert (= (and b!603625 res!387680) b!603627))

(assert (= (and b!603627 res!387683) b!603617))

(assert (= (and b!603617 res!387695) b!603632))

(assert (= (and b!603632 res!387690) b!603619))

(assert (= (and b!603619 res!387698) b!603626))

(assert (= (and b!603626 res!387681) b!603624))

(assert (= (and b!603626 c!68336) b!603634))

(assert (= (and b!603626 (not c!68336)) b!603629))

(assert (= (and b!603626 (not res!387696)) b!603631))

(assert (= (and b!603631 res!387689) b!603623))

(assert (= (and b!603623 (not res!387685)) b!603628))

(assert (= (and b!603628 res!387692) b!603635))

(assert (= (and b!603631 (not res!387686)) b!603621))

(assert (= (and b!603621 c!68335) b!603636))

(assert (= (and b!603621 (not c!68335)) b!603622))

(assert (= (and b!603621 (not res!387694)) b!603633))

(assert (= (and b!603633 res!387684) b!603638))

(declare-fun m!580613 () Bool)

(assert (=> b!603626 m!580613))

(declare-fun m!580615 () Bool)

(assert (=> b!603626 m!580615))

(declare-fun m!580617 () Bool)

(assert (=> b!603626 m!580617))

(declare-fun m!580619 () Bool)

(assert (=> b!603626 m!580619))

(declare-fun m!580621 () Bool)

(assert (=> b!603626 m!580621))

(assert (=> b!603626 m!580619))

(declare-fun m!580623 () Bool)

(assert (=> b!603626 m!580623))

(declare-fun m!580625 () Bool)

(assert (=> b!603626 m!580625))

(declare-fun m!580627 () Bool)

(assert (=> b!603626 m!580627))

(declare-fun m!580629 () Bool)

(assert (=> b!603617 m!580629))

(assert (=> b!603632 m!580627))

(declare-fun m!580631 () Bool)

(assert (=> b!603632 m!580631))

(declare-fun m!580633 () Bool)

(assert (=> b!603619 m!580633))

(assert (=> b!603619 m!580619))

(assert (=> b!603619 m!580619))

(declare-fun m!580635 () Bool)

(assert (=> b!603619 m!580635))

(declare-fun m!580637 () Bool)

(assert (=> b!603630 m!580637))

(assert (=> b!603638 m!580619))

(assert (=> b!603638 m!580619))

(declare-fun m!580639 () Bool)

(assert (=> b!603638 m!580639))

(assert (=> b!603620 m!580619))

(assert (=> b!603620 m!580619))

(declare-fun m!580641 () Bool)

(assert (=> b!603620 m!580641))

(assert (=> b!603628 m!580619))

(assert (=> b!603628 m!580619))

(declare-fun m!580643 () Bool)

(assert (=> b!603628 m!580643))

(declare-fun m!580645 () Bool)

(assert (=> b!603627 m!580645))

(declare-fun m!580647 () Bool)

(assert (=> b!603616 m!580647))

(assert (=> b!603635 m!580619))

(assert (=> b!603635 m!580619))

(assert (=> b!603635 m!580639))

(declare-fun m!580649 () Bool)

(assert (=> b!603618 m!580649))

(declare-fun m!580651 () Bool)

(assert (=> b!603636 m!580651))

(assert (=> b!603636 m!580619))

(assert (=> b!603636 m!580619))

(declare-fun m!580653 () Bool)

(assert (=> b!603636 m!580653))

(declare-fun m!580655 () Bool)

(assert (=> b!603636 m!580655))

(assert (=> b!603636 m!580619))

(declare-fun m!580657 () Bool)

(assert (=> b!603636 m!580657))

(declare-fun m!580659 () Bool)

(assert (=> b!603636 m!580659))

(declare-fun m!580661 () Bool)

(assert (=> b!603636 m!580661))

(assert (=> b!603636 m!580619))

(declare-fun m!580663 () Bool)

(assert (=> b!603636 m!580663))

(declare-fun m!580665 () Bool)

(assert (=> b!603625 m!580665))

(assert (=> b!603631 m!580619))

(assert (=> b!603631 m!580627))

(declare-fun m!580667 () Bool)

(assert (=> b!603631 m!580667))

(declare-fun m!580669 () Bool)

(assert (=> start!55128 m!580669))

(declare-fun m!580671 () Bool)

(assert (=> start!55128 m!580671))

(assert (=> b!603633 m!580619))

(assert (=> b!603633 m!580619))

(assert (=> b!603633 m!580643))

(assert (=> b!603623 m!580619))

(check-sat (not b!603618) (not start!55128) (not b!603633) (not b!603628) (not b!603625) (not b!603626) (not b!603627) (not b!603630) (not b!603620) (not b!603638) (not b!603616) (not b!603619) (not b!603635) (not b!603636))
(check-sat)
