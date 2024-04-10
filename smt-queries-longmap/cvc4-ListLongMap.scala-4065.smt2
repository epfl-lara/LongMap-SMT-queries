; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55706 () Bool)

(assert start!55706)

(declare-fun res!392801 () Bool)

(declare-fun e!349808 () Bool)

(assert (=> start!55706 (=> (not res!392801) (not e!349808))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55706 (= res!392801 (validMask!0 mask!3053))))

(assert (=> start!55706 e!349808))

(assert (=> start!55706 true))

(declare-datatypes ((array!37356 0))(
  ( (array!37357 (arr!17927 (Array (_ BitVec 32) (_ BitVec 64))) (size!18291 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37356)

(declare-fun array_inv!13723 (array!37356) Bool)

(assert (=> start!55706 (array_inv!13723 a!2986)))

(declare-fun b!610611 () Bool)

(declare-fun e!349809 () Bool)

(declare-fun e!349800 () Bool)

(assert (=> b!610611 (= e!349809 e!349800)))

(declare-fun res!392791 () Bool)

(assert (=> b!610611 (=> res!392791 e!349800)))

(assert (=> b!610611 (= res!392791 (or (bvsgt #b00000000000000000000000000000000 (size!18291 a!2986)) (bvsge (size!18291 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!279333 () array!37356)

(declare-datatypes ((List!11968 0))(
  ( (Nil!11965) (Cons!11964 (h!13009 (_ BitVec 64)) (t!18196 List!11968)) )
))
(declare-fun arrayNoDuplicates!0 (array!37356 (_ BitVec 32) List!11968) Bool)

(assert (=> b!610611 (arrayNoDuplicates!0 lt!279333 #b00000000000000000000000000000000 Nil!11965)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!19582 0))(
  ( (Unit!19583) )
))
(declare-fun lt!279326 () Unit!19582)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11968) Unit!19582)

(assert (=> b!610611 (= lt!279326 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11965))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610611 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279322 () Unit!19582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19582)

(assert (=> b!610611 (= lt!279322 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279333 (select (arr!17927 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349807 () Bool)

(assert (=> b!610611 e!349807))

(declare-fun res!392785 () Bool)

(assert (=> b!610611 (=> (not res!392785) (not e!349807))))

(assert (=> b!610611 (= res!392785 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) j!136))))

(declare-fun b!610612 () Bool)

(declare-fun e!349804 () Bool)

(declare-fun e!349801 () Bool)

(assert (=> b!610612 (= e!349804 e!349801)))

(declare-fun res!392792 () Bool)

(assert (=> b!610612 (=> res!392792 e!349801)))

(declare-fun lt!279318 () (_ BitVec 64))

(declare-fun lt!279325 () (_ BitVec 64))

(assert (=> b!610612 (= res!392792 (or (not (= (select (arr!17927 a!2986) j!136) lt!279318)) (not (= (select (arr!17927 a!2986) j!136) lt!279325)) (bvsge j!136 index!984)))))

(declare-fun b!610613 () Bool)

(declare-fun e!349803 () Bool)

(declare-datatypes ((SeekEntryResult!6367 0))(
  ( (MissingZero!6367 (index!27746 (_ BitVec 32))) (Found!6367 (index!27747 (_ BitVec 32))) (Intermediate!6367 (undefined!7179 Bool) (index!27748 (_ BitVec 32)) (x!56549 (_ BitVec 32))) (Undefined!6367) (MissingVacant!6367 (index!27749 (_ BitVec 32))) )
))
(declare-fun lt!279331 () SeekEntryResult!6367)

(declare-fun lt!279320 () SeekEntryResult!6367)

(assert (=> b!610613 (= e!349803 (= lt!279331 lt!279320))))

(declare-fun b!610614 () Bool)

(declare-fun e!349802 () Bool)

(assert (=> b!610614 (= e!349801 e!349802)))

(declare-fun res!392804 () Bool)

(assert (=> b!610614 (=> (not res!392804) (not e!349802))))

(assert (=> b!610614 (= res!392804 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) j!136))))

(declare-fun b!610615 () Bool)

(declare-fun res!392795 () Bool)

(declare-fun e!349813 () Bool)

(assert (=> b!610615 (=> (not res!392795) (not e!349813))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!610615 (= res!392795 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17927 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610616 () Bool)

(assert (=> b!610616 (= e!349807 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) index!984))))

(declare-fun b!610617 () Bool)

(declare-fun e!349810 () Unit!19582)

(declare-fun Unit!19584 () Unit!19582)

(assert (=> b!610617 (= e!349810 Unit!19584)))

(assert (=> b!610617 false))

(declare-fun b!610618 () Bool)

(declare-fun e!349806 () Bool)

(declare-fun e!349814 () Bool)

(assert (=> b!610618 (= e!349806 e!349814)))

(declare-fun res!392790 () Bool)

(assert (=> b!610618 (=> (not res!392790) (not e!349814))))

(assert (=> b!610618 (= res!392790 (and (= lt!279331 (Found!6367 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17927 a!2986) index!984) (select (arr!17927 a!2986) j!136))) (not (= (select (arr!17927 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37356 (_ BitVec 32)) SeekEntryResult!6367)

(assert (=> b!610618 (= lt!279331 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610619 () Bool)

(declare-fun res!392789 () Bool)

(assert (=> b!610619 (=> (not res!392789) (not e!349813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37356 (_ BitVec 32)) Bool)

(assert (=> b!610619 (= res!392789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!610620 () Bool)

(declare-fun e!349815 () Unit!19582)

(declare-fun Unit!19585 () Unit!19582)

(assert (=> b!610620 (= e!349815 Unit!19585)))

(declare-fun b!610621 () Bool)

(declare-fun e!349805 () Bool)

(assert (=> b!610621 (= e!349805 e!349809)))

(declare-fun res!392797 () Bool)

(assert (=> b!610621 (=> res!392797 e!349809)))

(assert (=> b!610621 (= res!392797 (bvsge index!984 j!136))))

(declare-fun lt!279321 () Unit!19582)

(assert (=> b!610621 (= lt!279321 e!349815)))

(declare-fun c!69281 () Bool)

(assert (=> b!610621 (= c!69281 (bvslt j!136 index!984))))

(declare-fun b!610622 () Bool)

(assert (=> b!610622 (= e!349808 e!349813)))

(declare-fun res!392787 () Bool)

(assert (=> b!610622 (=> (not res!392787) (not e!349813))))

(declare-fun lt!279327 () SeekEntryResult!6367)

(assert (=> b!610622 (= res!392787 (or (= lt!279327 (MissingZero!6367 i!1108)) (= lt!279327 (MissingVacant!6367 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37356 (_ BitVec 32)) SeekEntryResult!6367)

(assert (=> b!610622 (= lt!279327 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!610623 () Bool)

(declare-fun Unit!19586 () Unit!19582)

(assert (=> b!610623 (= e!349810 Unit!19586)))

(declare-fun b!610624 () Bool)

(assert (=> b!610624 (= e!349802 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) index!984))))

(declare-fun b!610625 () Bool)

(declare-fun res!392802 () Bool)

(assert (=> b!610625 (=> (not res!392802) (not e!349808))))

(assert (=> b!610625 (= res!392802 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610626 () Bool)

(declare-fun res!392796 () Bool)

(assert (=> b!610626 (=> (not res!392796) (not e!349808))))

(assert (=> b!610626 (= res!392796 (and (= (size!18291 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18291 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18291 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610627 () Bool)

(declare-fun res!392803 () Bool)

(assert (=> b!610627 (=> (not res!392803) (not e!349808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610627 (= res!392803 (validKeyInArray!0 k!1786))))

(declare-fun b!610628 () Bool)

(assert (=> b!610628 (= e!349813 e!349806)))

(declare-fun res!392798 () Bool)

(assert (=> b!610628 (=> (not res!392798) (not e!349806))))

(assert (=> b!610628 (= res!392798 (= (select (store (arr!17927 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610628 (= lt!279333 (array!37357 (store (arr!17927 a!2986) i!1108 k!1786) (size!18291 a!2986)))))

(declare-fun b!610629 () Bool)

(declare-fun res!392794 () Bool)

(assert (=> b!610629 (=> (not res!392794) (not e!349813))))

(assert (=> b!610629 (= res!392794 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11965))))

(declare-fun b!610630 () Bool)

(declare-fun res!392786 () Bool)

(assert (=> b!610630 (=> (not res!392786) (not e!349808))))

(assert (=> b!610630 (= res!392786 (validKeyInArray!0 (select (arr!17927 a!2986) j!136)))))

(declare-fun b!610631 () Bool)

(declare-fun noDuplicate!344 (List!11968) Bool)

(assert (=> b!610631 (= e!349800 (noDuplicate!344 Nil!11965))))

(declare-fun b!610632 () Bool)

(declare-fun e!349811 () Bool)

(assert (=> b!610632 (= e!349811 e!349805)))

(declare-fun res!392799 () Bool)

(assert (=> b!610632 (=> res!392799 e!349805)))

(assert (=> b!610632 (= res!392799 (or (not (= (select (arr!17927 a!2986) j!136) lt!279318)) (not (= (select (arr!17927 a!2986) j!136) lt!279325))))))

(assert (=> b!610632 e!349804))

(declare-fun res!392800 () Bool)

(assert (=> b!610632 (=> (not res!392800) (not e!349804))))

(assert (=> b!610632 (= res!392800 (= lt!279325 (select (arr!17927 a!2986) j!136)))))

(assert (=> b!610632 (= lt!279325 (select (store (arr!17927 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!610633 () Bool)

(declare-fun Unit!19587 () Unit!19582)

(assert (=> b!610633 (= e!349815 Unit!19587)))

(declare-fun lt!279319 () Unit!19582)

(assert (=> b!610633 (= lt!279319 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279333 (select (arr!17927 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610633 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279324 () Unit!19582)

(assert (=> b!610633 (= lt!279324 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11965))))

(assert (=> b!610633 (arrayNoDuplicates!0 lt!279333 #b00000000000000000000000000000000 Nil!11965)))

(declare-fun lt!279328 () Unit!19582)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37356 (_ BitVec 32) (_ BitVec 32)) Unit!19582)

(assert (=> b!610633 (= lt!279328 (lemmaNoDuplicateFromThenFromBigger!0 lt!279333 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610633 (arrayNoDuplicates!0 lt!279333 j!136 Nil!11965)))

(declare-fun lt!279323 () Unit!19582)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37356 (_ BitVec 64) (_ BitVec 32) List!11968) Unit!19582)

(assert (=> b!610633 (= lt!279323 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279333 (select (arr!17927 a!2986) j!136) j!136 Nil!11965))))

(assert (=> b!610633 false))

(declare-fun b!610634 () Bool)

(assert (=> b!610634 (= e!349814 (not e!349811))))

(declare-fun res!392788 () Bool)

(assert (=> b!610634 (=> res!392788 e!349811)))

(declare-fun lt!279334 () SeekEntryResult!6367)

(assert (=> b!610634 (= res!392788 (not (= lt!279334 (Found!6367 index!984))))))

(declare-fun lt!279329 () Unit!19582)

(assert (=> b!610634 (= lt!279329 e!349810)))

(declare-fun c!69280 () Bool)

(assert (=> b!610634 (= c!69280 (= lt!279334 Undefined!6367))))

(assert (=> b!610634 (= lt!279334 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279318 lt!279333 mask!3053))))

(assert (=> b!610634 e!349803))

(declare-fun res!392793 () Bool)

(assert (=> b!610634 (=> (not res!392793) (not e!349803))))

(declare-fun lt!279332 () (_ BitVec 32))

(assert (=> b!610634 (= res!392793 (= lt!279320 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279332 vacantSpotIndex!68 lt!279318 lt!279333 mask!3053)))))

(assert (=> b!610634 (= lt!279320 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279332 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!610634 (= lt!279318 (select (store (arr!17927 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279330 () Unit!19582)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37356 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19582)

(assert (=> b!610634 (= lt!279330 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279332 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610634 (= lt!279332 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55706 res!392801) b!610626))

(assert (= (and b!610626 res!392796) b!610630))

(assert (= (and b!610630 res!392786) b!610627))

(assert (= (and b!610627 res!392803) b!610625))

(assert (= (and b!610625 res!392802) b!610622))

(assert (= (and b!610622 res!392787) b!610619))

(assert (= (and b!610619 res!392789) b!610629))

(assert (= (and b!610629 res!392794) b!610615))

(assert (= (and b!610615 res!392795) b!610628))

(assert (= (and b!610628 res!392798) b!610618))

(assert (= (and b!610618 res!392790) b!610634))

(assert (= (and b!610634 res!392793) b!610613))

(assert (= (and b!610634 c!69280) b!610617))

(assert (= (and b!610634 (not c!69280)) b!610623))

(assert (= (and b!610634 (not res!392788)) b!610632))

(assert (= (and b!610632 res!392800) b!610612))

(assert (= (and b!610612 (not res!392792)) b!610614))

(assert (= (and b!610614 res!392804) b!610624))

(assert (= (and b!610632 (not res!392799)) b!610621))

(assert (= (and b!610621 c!69281) b!610633))

(assert (= (and b!610621 (not c!69281)) b!610620))

(assert (= (and b!610621 (not res!392797)) b!610611))

(assert (= (and b!610611 res!392785) b!610616))

(assert (= (and b!610611 (not res!392791)) b!610631))

(declare-fun m!587057 () Bool)

(assert (=> b!610627 m!587057))

(declare-fun m!587059 () Bool)

(assert (=> b!610630 m!587059))

(assert (=> b!610630 m!587059))

(declare-fun m!587061 () Bool)

(assert (=> b!610630 m!587061))

(assert (=> b!610633 m!587059))

(declare-fun m!587063 () Bool)

(assert (=> b!610633 m!587063))

(assert (=> b!610633 m!587059))

(declare-fun m!587065 () Bool)

(assert (=> b!610633 m!587065))

(declare-fun m!587067 () Bool)

(assert (=> b!610633 m!587067))

(assert (=> b!610633 m!587059))

(declare-fun m!587069 () Bool)

(assert (=> b!610633 m!587069))

(declare-fun m!587071 () Bool)

(assert (=> b!610633 m!587071))

(assert (=> b!610633 m!587059))

(declare-fun m!587073 () Bool)

(assert (=> b!610633 m!587073))

(declare-fun m!587075 () Bool)

(assert (=> b!610633 m!587075))

(declare-fun m!587077 () Bool)

(assert (=> b!610622 m!587077))

(declare-fun m!587079 () Bool)

(assert (=> b!610631 m!587079))

(declare-fun m!587081 () Bool)

(assert (=> b!610629 m!587081))

(assert (=> b!610632 m!587059))

(declare-fun m!587083 () Bool)

(assert (=> b!610632 m!587083))

(declare-fun m!587085 () Bool)

(assert (=> b!610632 m!587085))

(declare-fun m!587087 () Bool)

(assert (=> b!610619 m!587087))

(assert (=> b!610616 m!587059))

(assert (=> b!610616 m!587059))

(declare-fun m!587089 () Bool)

(assert (=> b!610616 m!587089))

(assert (=> b!610611 m!587059))

(assert (=> b!610611 m!587059))

(declare-fun m!587091 () Bool)

(assert (=> b!610611 m!587091))

(assert (=> b!610611 m!587065))

(assert (=> b!610611 m!587059))

(declare-fun m!587093 () Bool)

(assert (=> b!610611 m!587093))

(assert (=> b!610611 m!587059))

(declare-fun m!587095 () Bool)

(assert (=> b!610611 m!587095))

(assert (=> b!610611 m!587075))

(declare-fun m!587097 () Bool)

(assert (=> b!610615 m!587097))

(assert (=> b!610624 m!587059))

(assert (=> b!610624 m!587059))

(assert (=> b!610624 m!587089))

(assert (=> b!610612 m!587059))

(assert (=> b!610628 m!587083))

(declare-fun m!587099 () Bool)

(assert (=> b!610628 m!587099))

(declare-fun m!587101 () Bool)

(assert (=> b!610618 m!587101))

(assert (=> b!610618 m!587059))

(assert (=> b!610618 m!587059))

(declare-fun m!587103 () Bool)

(assert (=> b!610618 m!587103))

(assert (=> b!610614 m!587059))

(assert (=> b!610614 m!587059))

(assert (=> b!610614 m!587093))

(declare-fun m!587105 () Bool)

(assert (=> b!610634 m!587105))

(declare-fun m!587107 () Bool)

(assert (=> b!610634 m!587107))

(declare-fun m!587109 () Bool)

(assert (=> b!610634 m!587109))

(assert (=> b!610634 m!587059))

(assert (=> b!610634 m!587083))

(assert (=> b!610634 m!587059))

(declare-fun m!587111 () Bool)

(assert (=> b!610634 m!587111))

(declare-fun m!587113 () Bool)

(assert (=> b!610634 m!587113))

(declare-fun m!587115 () Bool)

(assert (=> b!610634 m!587115))

(declare-fun m!587117 () Bool)

(assert (=> b!610625 m!587117))

(declare-fun m!587119 () Bool)

(assert (=> start!55706 m!587119))

(declare-fun m!587121 () Bool)

(assert (=> start!55706 m!587121))

(push 1)

(assert (not b!610622))

(assert (not b!610633))

(assert (not b!610631))

(assert (not b!610625))

(assert (not b!610634))

(assert (not b!610629))

(assert (not b!610611))

(assert (not b!610619))

(assert (not b!610624))

(assert (not start!55706))

(assert (not b!610630))

(assert (not b!610614))

(assert (not b!610616))

(assert (not b!610627))

(assert (not b!610618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!610745 () Bool)

(declare-fun e!349901 () SeekEntryResult!6367)

(assert (=> b!610745 (= e!349901 Undefined!6367)))

(declare-fun b!610746 () Bool)

(declare-fun e!349899 () SeekEntryResult!6367)

(declare-fun lt!279375 () SeekEntryResult!6367)

(assert (=> b!610746 (= e!349899 (MissingZero!6367 (index!27748 lt!279375)))))

(declare-fun b!610747 () Bool)

(assert (=> b!610747 (= e!349899 (seekKeyOrZeroReturnVacant!0 (x!56549 lt!279375) (index!27748 lt!279375) (index!27748 lt!279375) k!1786 a!2986 mask!3053))))

(declare-fun b!610748 () Bool)

(declare-fun e!349900 () SeekEntryResult!6367)

(assert (=> b!610748 (= e!349900 (Found!6367 (index!27748 lt!279375)))))

(declare-fun b!610749 () Bool)

(assert (=> b!610749 (= e!349901 e!349900)))

(declare-fun lt!279376 () (_ BitVec 64))

(assert (=> b!610749 (= lt!279376 (select (arr!17927 a!2986) (index!27748 lt!279375)))))

(declare-fun c!69308 () Bool)

(assert (=> b!610749 (= c!69308 (= lt!279376 k!1786))))

(declare-fun d!88259 () Bool)

(declare-fun lt!279374 () SeekEntryResult!6367)

(assert (=> d!88259 (and (or (is-Undefined!6367 lt!279374) (not (is-Found!6367 lt!279374)) (and (bvsge (index!27747 lt!279374) #b00000000000000000000000000000000) (bvslt (index!27747 lt!279374) (size!18291 a!2986)))) (or (is-Undefined!6367 lt!279374) (is-Found!6367 lt!279374) (not (is-MissingZero!6367 lt!279374)) (and (bvsge (index!27746 lt!279374) #b00000000000000000000000000000000) (bvslt (index!27746 lt!279374) (size!18291 a!2986)))) (or (is-Undefined!6367 lt!279374) (is-Found!6367 lt!279374) (is-MissingZero!6367 lt!279374) (not (is-MissingVacant!6367 lt!279374)) (and (bvsge (index!27749 lt!279374) #b00000000000000000000000000000000) (bvslt (index!27749 lt!279374) (size!18291 a!2986)))) (or (is-Undefined!6367 lt!279374) (ite (is-Found!6367 lt!279374) (= (select (arr!17927 a!2986) (index!27747 lt!279374)) k!1786) (ite (is-MissingZero!6367 lt!279374) (= (select (arr!17927 a!2986) (index!27746 lt!279374)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6367 lt!279374) (= (select (arr!17927 a!2986) (index!27749 lt!279374)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88259 (= lt!279374 e!349901)))

(declare-fun c!69309 () Bool)

(assert (=> d!88259 (= c!69309 (and (is-Intermediate!6367 lt!279375) (undefined!7179 lt!279375)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37356 (_ BitVec 32)) SeekEntryResult!6367)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88259 (= lt!279375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88259 (validMask!0 mask!3053)))

(assert (=> d!88259 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!279374)))

(declare-fun b!610744 () Bool)

(declare-fun c!69310 () Bool)

(assert (=> b!610744 (= c!69310 (= lt!279376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610744 (= e!349900 e!349899)))

(assert (= (and d!88259 c!69309) b!610745))

(assert (= (and d!88259 (not c!69309)) b!610749))

(assert (= (and b!610749 c!69308) b!610748))

(assert (= (and b!610749 (not c!69308)) b!610744))

(assert (= (and b!610744 c!69310) b!610746))

(assert (= (and b!610744 (not c!69310)) b!610747))

(declare-fun m!587215 () Bool)

(assert (=> b!610747 m!587215))

(declare-fun m!587217 () Bool)

(assert (=> b!610749 m!587217))

(declare-fun m!587219 () Bool)

(assert (=> d!88259 m!587219))

(declare-fun m!587221 () Bool)

(assert (=> d!88259 m!587221))

(declare-fun m!587223 () Bool)

(assert (=> d!88259 m!587223))

(assert (=> d!88259 m!587119))

(assert (=> d!88259 m!587223))

(declare-fun m!587225 () Bool)

(assert (=> d!88259 m!587225))

(declare-fun m!587227 () Bool)

(assert (=> d!88259 m!587227))

(assert (=> b!610622 d!88259))

(declare-fun b!610767 () Bool)

(declare-fun e!349918 () Bool)

(declare-fun contains!3041 (List!11968 (_ BitVec 64)) Bool)

(assert (=> b!610767 (= e!349918 (contains!3041 Nil!11965 (select (arr!17927 lt!279333) #b00000000000000000000000000000000)))))

(declare-fun bm!33145 () Bool)

(declare-fun call!33148 () Bool)

(declare-fun c!69315 () Bool)

(assert (=> bm!33145 (= call!33148 (arrayNoDuplicates!0 lt!279333 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69315 (Cons!11964 (select (arr!17927 lt!279333) #b00000000000000000000000000000000) Nil!11965) Nil!11965)))))

(declare-fun b!610768 () Bool)

(declare-fun e!349917 () Bool)

(declare-fun e!349916 () Bool)

(assert (=> b!610768 (= e!349917 e!349916)))

(declare-fun res!392872 () Bool)

(assert (=> b!610768 (=> (not res!392872) (not e!349916))))

(assert (=> b!610768 (= res!392872 (not e!349918))))

(declare-fun res!392871 () Bool)

(assert (=> b!610768 (=> (not res!392871) (not e!349918))))

(assert (=> b!610768 (= res!392871 (validKeyInArray!0 (select (arr!17927 lt!279333) #b00000000000000000000000000000000)))))

(declare-fun d!88291 () Bool)

(declare-fun res!392873 () Bool)

(assert (=> d!88291 (=> res!392873 e!349917)))

(assert (=> d!88291 (= res!392873 (bvsge #b00000000000000000000000000000000 (size!18291 lt!279333)))))

(assert (=> d!88291 (= (arrayNoDuplicates!0 lt!279333 #b00000000000000000000000000000000 Nil!11965) e!349917)))

(declare-fun b!610769 () Bool)

(declare-fun e!349915 () Bool)

(assert (=> b!610769 (= e!349915 call!33148)))

(declare-fun b!610770 () Bool)

(assert (=> b!610770 (= e!349915 call!33148)))

(declare-fun b!610771 () Bool)

(assert (=> b!610771 (= e!349916 e!349915)))

(assert (=> b!610771 (= c!69315 (validKeyInArray!0 (select (arr!17927 lt!279333) #b00000000000000000000000000000000)))))

(assert (= (and d!88291 (not res!392873)) b!610768))

(assert (= (and b!610768 res!392871) b!610767))

(assert (= (and b!610768 res!392872) b!610771))

(assert (= (and b!610771 c!69315) b!610769))

(assert (= (and b!610771 (not c!69315)) b!610770))

(assert (= (or b!610769 b!610770) bm!33145))

(declare-fun m!587233 () Bool)

(assert (=> b!610767 m!587233))

(assert (=> b!610767 m!587233))

(declare-fun m!587235 () Bool)

(assert (=> b!610767 m!587235))

(assert (=> bm!33145 m!587233))

(declare-fun m!587237 () Bool)

(assert (=> bm!33145 m!587237))

(assert (=> b!610768 m!587233))

(assert (=> b!610768 m!587233))

(declare-fun m!587239 () Bool)

(assert (=> b!610768 m!587239))

(assert (=> b!610771 m!587233))

(assert (=> b!610771 m!587233))

(assert (=> b!610771 m!587239))

(assert (=> b!610611 d!88291))

(declare-fun d!88295 () Bool)

(declare-fun res!392880 () Bool)

(declare-fun e!349931 () Bool)

(assert (=> d!88295 (=> res!392880 e!349931)))

(assert (=> d!88295 (= res!392880 (= (select (arr!17927 lt!279333) j!136) (select (arr!17927 a!2986) j!136)))))

(assert (=> d!88295 (= (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) j!136) e!349931)))

(declare-fun b!610790 () Bool)

(declare-fun e!349932 () Bool)

(assert (=> b!610790 (= e!349931 e!349932)))

(declare-fun res!392881 () Bool)

(assert (=> b!610790 (=> (not res!392881) (not e!349932))))

(assert (=> b!610790 (= res!392881 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18291 lt!279333)))))

(declare-fun b!610791 () Bool)

(assert (=> b!610791 (= e!349932 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88295 (not res!392880)) b!610790))

(assert (= (and b!610790 res!392881) b!610791))

(declare-fun m!587241 () Bool)

(assert (=> d!88295 m!587241))

(assert (=> b!610791 m!587059))

(declare-fun m!587243 () Bool)

(assert (=> b!610791 m!587243))

(assert (=> b!610611 d!88295))

(declare-fun d!88297 () Bool)

(declare-fun e!349943 () Bool)

(assert (=> d!88297 e!349943))

(declare-fun res!392888 () Bool)

(assert (=> d!88297 (=> (not res!392888) (not e!349943))))

(assert (=> d!88297 (= res!392888 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18291 a!2986))))))

(declare-fun lt!279397 () Unit!19582)

(declare-fun choose!41 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11968) Unit!19582)

(assert (=> d!88297 (= lt!279397 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11965))))

(assert (=> d!88297 (bvslt (size!18291 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88297 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11965) lt!279397)))

(declare-fun b!610806 () Bool)

(assert (=> b!610806 (= e!349943 (arrayNoDuplicates!0 (array!37357 (store (arr!17927 a!2986) i!1108 k!1786) (size!18291 a!2986)) #b00000000000000000000000000000000 Nil!11965))))

(assert (= (and d!88297 res!392888) b!610806))

(declare-fun m!587259 () Bool)

(assert (=> d!88297 m!587259))

(assert (=> b!610806 m!587083))

(declare-fun m!587261 () Bool)

(assert (=> b!610806 m!587261))

(assert (=> b!610611 d!88297))

(declare-fun d!88303 () Bool)

(declare-fun res!392889 () Bool)

(declare-fun e!349944 () Bool)

(assert (=> d!88303 (=> res!392889 e!349944)))

(assert (=> d!88303 (= res!392889 (= (select (arr!17927 lt!279333) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17927 a!2986) j!136)))))

(assert (=> d!88303 (= (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!349944)))

(declare-fun b!610807 () Bool)

(declare-fun e!349945 () Bool)

(assert (=> b!610807 (= e!349944 e!349945)))

(declare-fun res!392890 () Bool)

(assert (=> b!610807 (=> (not res!392890) (not e!349945))))

(assert (=> b!610807 (= res!392890 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18291 lt!279333)))))

(declare-fun b!610808 () Bool)

(assert (=> b!610808 (= e!349945 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88303 (not res!392889)) b!610807))

(assert (= (and b!610807 res!392890) b!610808))

(declare-fun m!587263 () Bool)

(assert (=> d!88303 m!587263))

(assert (=> b!610808 m!587059))

(declare-fun m!587265 () Bool)

(assert (=> b!610808 m!587265))

(assert (=> b!610611 d!88303))

(declare-fun d!88305 () Bool)

(assert (=> d!88305 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279400 () Unit!19582)

(declare-fun choose!114 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19582)

(assert (=> d!88305 (= lt!279400 (choose!114 lt!279333 (select (arr!17927 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88305 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88305 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279333 (select (arr!17927 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279400)))

(declare-fun bs!18632 () Bool)

(assert (= bs!18632 d!88305))

(assert (=> bs!18632 m!587059))

(assert (=> bs!18632 m!587095))

(assert (=> bs!18632 m!587059))

(declare-fun m!587267 () Bool)

(assert (=> bs!18632 m!587267))

(assert (=> b!610611 d!88305))

(declare-fun d!88307 () Bool)

(declare-fun res!392891 () Bool)

(declare-fun e!349946 () Bool)

(assert (=> d!88307 (=> res!392891 e!349946)))

(assert (=> d!88307 (= res!392891 (= (select (arr!17927 lt!279333) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17927 a!2986) j!136)))))

(assert (=> d!88307 (= (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349946)))

(declare-fun b!610809 () Bool)

(declare-fun e!349947 () Bool)

(assert (=> b!610809 (= e!349946 e!349947)))

(declare-fun res!392892 () Bool)

(assert (=> b!610809 (=> (not res!392892) (not e!349947))))

(assert (=> b!610809 (= res!392892 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18291 lt!279333)))))

(declare-fun b!610810 () Bool)

(assert (=> b!610810 (= e!349947 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88307 (not res!392891)) b!610809))

(assert (= (and b!610809 res!392892) b!610810))

(declare-fun m!587269 () Bool)

(assert (=> d!88307 m!587269))

(assert (=> b!610810 m!587059))

(declare-fun m!587271 () Bool)

(assert (=> b!610810 m!587271))

(assert (=> b!610633 d!88307))

(declare-fun b!610811 () Bool)

(declare-fun e!349951 () Bool)

(assert (=> b!610811 (= e!349951 (contains!3041 Nil!11965 (select (arr!17927 lt!279333) j!136)))))

(declare-fun call!33152 () Bool)

(declare-fun bm!33149 () Bool)

(declare-fun c!69326 () Bool)

(assert (=> bm!33149 (= call!33152 (arrayNoDuplicates!0 lt!279333 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69326 (Cons!11964 (select (arr!17927 lt!279333) j!136) Nil!11965) Nil!11965)))))

(declare-fun b!610812 () Bool)

(declare-fun e!349950 () Bool)

(declare-fun e!349949 () Bool)

(assert (=> b!610812 (= e!349950 e!349949)))

(declare-fun res!392894 () Bool)

(assert (=> b!610812 (=> (not res!392894) (not e!349949))))

(assert (=> b!610812 (= res!392894 (not e!349951))))

(declare-fun res!392893 () Bool)

(assert (=> b!610812 (=> (not res!392893) (not e!349951))))

(assert (=> b!610812 (= res!392893 (validKeyInArray!0 (select (arr!17927 lt!279333) j!136)))))

(declare-fun d!88309 () Bool)

(declare-fun res!392895 () Bool)

(assert (=> d!88309 (=> res!392895 e!349950)))

(assert (=> d!88309 (= res!392895 (bvsge j!136 (size!18291 lt!279333)))))

(assert (=> d!88309 (= (arrayNoDuplicates!0 lt!279333 j!136 Nil!11965) e!349950)))

(declare-fun b!610813 () Bool)

(declare-fun e!349948 () Bool)

(assert (=> b!610813 (= e!349948 call!33152)))

(declare-fun b!610814 () Bool)

(assert (=> b!610814 (= e!349948 call!33152)))

(declare-fun b!610815 () Bool)

(assert (=> b!610815 (= e!349949 e!349948)))

(assert (=> b!610815 (= c!69326 (validKeyInArray!0 (select (arr!17927 lt!279333) j!136)))))

(assert (= (and d!88309 (not res!392895)) b!610812))

(assert (= (and b!610812 res!392893) b!610811))

(assert (= (and b!610812 res!392894) b!610815))

(assert (= (and b!610815 c!69326) b!610813))

(assert (= (and b!610815 (not c!69326)) b!610814))

(assert (= (or b!610813 b!610814) bm!33149))

(assert (=> b!610811 m!587241))

(assert (=> b!610811 m!587241))

(declare-fun m!587273 () Bool)

(assert (=> b!610811 m!587273))

(assert (=> bm!33149 m!587241))

(declare-fun m!587275 () Bool)

(assert (=> bm!33149 m!587275))

(assert (=> b!610812 m!587241))

(assert (=> b!610812 m!587241))

(declare-fun m!587277 () Bool)

(assert (=> b!610812 m!587277))

(assert (=> b!610815 m!587241))

(assert (=> b!610815 m!587241))

(assert (=> b!610815 m!587277))

(assert (=> b!610633 d!88309))

(assert (=> b!610633 d!88291))

(assert (=> b!610633 d!88297))

(declare-fun d!88311 () Bool)

(assert (=> d!88311 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18291 lt!279333)) (not (= (select (arr!17927 lt!279333) j!136) (select (arr!17927 a!2986) j!136))))))

(declare-fun lt!279407 () Unit!19582)

(declare-fun choose!21 (array!37356 (_ BitVec 64) (_ BitVec 32) List!11968) Unit!19582)

(assert (=> d!88311 (= lt!279407 (choose!21 lt!279333 (select (arr!17927 a!2986) j!136) j!136 Nil!11965))))

(assert (=> d!88311 (bvslt (size!18291 lt!279333) #b01111111111111111111111111111111)))

(assert (=> d!88311 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279333 (select (arr!17927 a!2986) j!136) j!136 Nil!11965) lt!279407)))

(declare-fun bs!18633 () Bool)

(assert (= bs!18633 d!88311))

(assert (=> bs!18633 m!587241))

(assert (=> bs!18633 m!587059))

(declare-fun m!587289 () Bool)

(assert (=> bs!18633 m!587289))

(assert (=> b!610633 d!88311))

(declare-fun d!88319 () Bool)

(assert (=> d!88319 (arrayContainsKey!0 lt!279333 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279408 () Unit!19582)

(assert (=> d!88319 (= lt!279408 (choose!114 lt!279333 (select (arr!17927 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88319 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88319 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279333 (select (arr!17927 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279408)))

(declare-fun bs!18634 () Bool)

(assert (= bs!18634 d!88319))

(assert (=> bs!18634 m!587059))

(assert (=> bs!18634 m!587073))

(assert (=> bs!18634 m!587059))

(declare-fun m!587297 () Bool)

(assert (=> bs!18634 m!587297))

(assert (=> b!610633 d!88319))

(declare-fun d!88321 () Bool)

(assert (=> d!88321 (arrayNoDuplicates!0 lt!279333 j!136 Nil!11965)))

(declare-fun lt!279414 () Unit!19582)

(declare-fun choose!39 (array!37356 (_ BitVec 32) (_ BitVec 32)) Unit!19582)

(assert (=> d!88321 (= lt!279414 (choose!39 lt!279333 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88321 (bvslt (size!18291 lt!279333) #b01111111111111111111111111111111)))

(assert (=> d!88321 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279333 #b00000000000000000000000000000000 j!136) lt!279414)))

(declare-fun bs!18636 () Bool)

(assert (= bs!18636 d!88321))

(assert (=> bs!18636 m!587071))

(declare-fun m!587303 () Bool)

(assert (=> bs!18636 m!587303))

(assert (=> b!610633 d!88321))

(declare-fun d!88327 () Bool)

(declare-fun res!392900 () Bool)

(declare-fun e!349962 () Bool)

(assert (=> d!88327 (=> res!392900 e!349962)))

(assert (=> d!88327 (= res!392900 (is-Nil!11965 Nil!11965))))

(assert (=> d!88327 (= (noDuplicate!344 Nil!11965) e!349962)))

(declare-fun b!610832 () Bool)

(declare-fun e!349963 () Bool)

(assert (=> b!610832 (= e!349962 e!349963)))

(declare-fun res!392901 () Bool)

(assert (=> b!610832 (=> (not res!392901) (not e!349963))))

(assert (=> b!610832 (= res!392901 (not (contains!3041 (t!18196 Nil!11965) (h!13009 Nil!11965))))))

(declare-fun b!610833 () Bool)

(assert (=> b!610833 (= e!349963 (noDuplicate!344 (t!18196 Nil!11965)))))

(assert (= (and d!88327 (not res!392900)) b!610832))

(assert (= (and b!610832 res!392901) b!610833))

(declare-fun m!587305 () Bool)

(assert (=> b!610832 m!587305))

(declare-fun m!587307 () Bool)

(assert (=> b!610833 m!587307))

(assert (=> b!610631 d!88327))

(declare-fun d!88329 () Bool)

(assert (=> d!88329 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55706 d!88329))

(declare-fun d!88339 () Bool)

(assert (=> d!88339 (= (array_inv!13723 a!2986) (bvsge (size!18291 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55706 d!88339))

(declare-fun d!88341 () Bool)

(assert (=> d!88341 (= (validKeyInArray!0 (select (arr!17927 a!2986) j!136)) (and (not (= (select (arr!17927 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17927 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610630 d!88341))

(declare-fun b!610886 () Bool)

(declare-fun e!350003 () Bool)

(declare-fun call!33156 () Bool)

(assert (=> b!610886 (= e!350003 call!33156)))

(declare-fun b!610887 () Bool)

(declare-fun e!350001 () Bool)

(assert (=> b!610887 (= e!350001 call!33156)))

(declare-fun b!610888 () Bool)

(declare-fun e!350002 () Bool)

(assert (=> b!610888 (= e!350002 e!350003)))

(declare-fun c!69348 () Bool)

(assert (=> b!610888 (= c!69348 (validKeyInArray!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88345 () Bool)

(declare-fun res!392924 () Bool)

(assert (=> d!88345 (=> res!392924 e!350002)))

(assert (=> d!88345 (= res!392924 (bvsge #b00000000000000000000000000000000 (size!18291 a!2986)))))

(assert (=> d!88345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!350002)))

(declare-fun b!610889 () Bool)

(assert (=> b!610889 (= e!350003 e!350001)))

(declare-fun lt!279443 () (_ BitVec 64))

(assert (=> b!610889 (= lt!279443 (select (arr!17927 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279444 () Unit!19582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37356 (_ BitVec 64) (_ BitVec 32)) Unit!19582)

(assert (=> b!610889 (= lt!279444 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279443 #b00000000000000000000000000000000))))

(assert (=> b!610889 (arrayContainsKey!0 a!2986 lt!279443 #b00000000000000000000000000000000)))

(declare-fun lt!279442 () Unit!19582)

(assert (=> b!610889 (= lt!279442 lt!279444)))

(declare-fun res!392925 () Bool)

(assert (=> b!610889 (= res!392925 (= (seekEntryOrOpen!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6367 #b00000000000000000000000000000000)))))

(assert (=> b!610889 (=> (not res!392925) (not e!350001))))

(declare-fun bm!33153 () Bool)

(assert (=> bm!33153 (= call!33156 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88345 (not res!392924)) b!610888))

(assert (= (and b!610888 c!69348) b!610889))

(assert (= (and b!610888 (not c!69348)) b!610886))

(assert (= (and b!610889 res!392925) b!610887))

(assert (= (or b!610887 b!610886) bm!33153))

(declare-fun m!587359 () Bool)

(assert (=> b!610888 m!587359))

(assert (=> b!610888 m!587359))

(declare-fun m!587361 () Bool)

(assert (=> b!610888 m!587361))

(assert (=> b!610889 m!587359))

(declare-fun m!587363 () Bool)

(assert (=> b!610889 m!587363))

(declare-fun m!587365 () Bool)

(assert (=> b!610889 m!587365))

(assert (=> b!610889 m!587359))

(declare-fun m!587367 () Bool)

(assert (=> b!610889 m!587367))

(declare-fun m!587369 () Bool)

(assert (=> bm!33153 m!587369))

(assert (=> b!610619 d!88345))

(declare-fun lt!279460 () SeekEntryResult!6367)

(declare-fun d!88361 () Bool)

(assert (=> d!88361 (and (or (is-Undefined!6367 lt!279460) (not (is-Found!6367 lt!279460)) (and (bvsge (index!27747 lt!279460) #b00000000000000000000000000000000) (bvslt (index!27747 lt!279460) (size!18291 a!2986)))) (or (is-Undefined!6367 lt!279460) (is-Found!6367 lt!279460) (not (is-MissingVacant!6367 lt!279460)) (not (= (index!27749 lt!279460) vacantSpotIndex!68)) (and (bvsge (index!27749 lt!279460) #b00000000000000000000000000000000) (bvslt (index!27749 lt!279460) (size!18291 a!2986)))) (or (is-Undefined!6367 lt!279460) (ite (is-Found!6367 lt!279460) (= (select (arr!17927 a!2986) (index!27747 lt!279460)) (select (arr!17927 a!2986) j!136)) (and (is-MissingVacant!6367 lt!279460) (= (index!27749 lt!279460) vacantSpotIndex!68) (= (select (arr!17927 a!2986) (index!27749 lt!279460)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350028 () SeekEntryResult!6367)

(assert (=> d!88361 (= lt!279460 e!350028)))

(declare-fun c!69370 () Bool)

(assert (=> d!88361 (= c!69370 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279461 () (_ BitVec 64))

(assert (=> d!88361 (= lt!279461 (select (arr!17927 a!2986) index!984))))

(assert (=> d!88361 (validMask!0 mask!3053)))

(assert (=> d!88361 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053) lt!279460)))

(declare-fun e!350026 () SeekEntryResult!6367)

(declare-fun b!610931 () Bool)

(assert (=> b!610931 (= e!350026 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610932 () Bool)

(declare-fun c!69368 () Bool)

(assert (=> b!610932 (= c!69368 (= lt!279461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350027 () SeekEntryResult!6367)

(assert (=> b!610932 (= e!350027 e!350026)))

(declare-fun b!610933 () Bool)

(assert (=> b!610933 (= e!350028 e!350027)))

(declare-fun c!69369 () Bool)

(assert (=> b!610933 (= c!69369 (= lt!279461 (select (arr!17927 a!2986) j!136)))))

(declare-fun b!610934 () Bool)

(assert (=> b!610934 (= e!350027 (Found!6367 index!984))))

(declare-fun b!610935 () Bool)

(assert (=> b!610935 (= e!350028 Undefined!6367)))

(declare-fun b!610936 () Bool)

(assert (=> b!610936 (= e!350026 (MissingVacant!6367 vacantSpotIndex!68))))

(assert (= (and d!88361 c!69370) b!610935))

(assert (= (and d!88361 (not c!69370)) b!610933))

(assert (= (and b!610933 c!69369) b!610934))

(assert (= (and b!610933 (not c!69369)) b!610932))

(assert (= (and b!610932 c!69368) b!610936))

(assert (= (and b!610932 (not c!69368)) b!610931))

(declare-fun m!587393 () Bool)

(assert (=> d!88361 m!587393))

(declare-fun m!587395 () Bool)

(assert (=> d!88361 m!587395))

(assert (=> d!88361 m!587101))

(assert (=> d!88361 m!587119))

(assert (=> b!610931 m!587105))

(assert (=> b!610931 m!587105))

(assert (=> b!610931 m!587059))

(declare-fun m!587397 () Bool)

(assert (=> b!610931 m!587397))

(assert (=> b!610618 d!88361))

(declare-fun b!610937 () Bool)

(declare-fun e!350032 () Bool)

(assert (=> b!610937 (= e!350032 (contains!3041 Nil!11965 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33155 () Bool)

(declare-fun call!33158 () Bool)

(declare-fun c!69371 () Bool)

(assert (=> bm!33155 (= call!33158 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69371 (Cons!11964 (select (arr!17927 a!2986) #b00000000000000000000000000000000) Nil!11965) Nil!11965)))))

(declare-fun b!610938 () Bool)

(declare-fun e!350031 () Bool)

(declare-fun e!350030 () Bool)

(assert (=> b!610938 (= e!350031 e!350030)))

(declare-fun res!392930 () Bool)

(assert (=> b!610938 (=> (not res!392930) (not e!350030))))

(assert (=> b!610938 (= res!392930 (not e!350032))))

(declare-fun res!392929 () Bool)

(assert (=> b!610938 (=> (not res!392929) (not e!350032))))

(assert (=> b!610938 (= res!392929 (validKeyInArray!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88369 () Bool)

(declare-fun res!392931 () Bool)

(assert (=> d!88369 (=> res!392931 e!350031)))

(assert (=> d!88369 (= res!392931 (bvsge #b00000000000000000000000000000000 (size!18291 a!2986)))))

(assert (=> d!88369 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11965) e!350031)))

(declare-fun b!610939 () Bool)

(declare-fun e!350029 () Bool)

(assert (=> b!610939 (= e!350029 call!33158)))

(declare-fun b!610940 () Bool)

(assert (=> b!610940 (= e!350029 call!33158)))

(declare-fun b!610941 () Bool)

(assert (=> b!610941 (= e!350030 e!350029)))

(assert (=> b!610941 (= c!69371 (validKeyInArray!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88369 (not res!392931)) b!610938))

