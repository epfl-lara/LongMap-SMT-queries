; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54064 () Bool)

(assert start!54064)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!267886 () (_ BitVec 64))

(declare-fun e!337107 () Bool)

(declare-fun b!590470 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36851 0))(
  ( (array!36852 (arr!17697 (Array (_ BitVec 32) (_ BitVec 64))) (size!18061 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36851)

(assert (=> b!590470 (= e!337107 (or (not (= (select (arr!17697 a!2986) j!136) lt!267886)) (not (= (select (arr!17697 a!2986) j!136) (select (store (arr!17697 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984) (bvslt index!984 (size!18061 a!2986))))))

(declare-fun e!337104 () Bool)

(assert (=> b!590470 e!337104))

(declare-fun res!377699 () Bool)

(assert (=> b!590470 (=> (not res!377699) (not e!337104))))

(assert (=> b!590470 (= res!377699 (= (select (store (arr!17697 a!2986) i!1108 k!1786) index!984) (select (arr!17697 a!2986) j!136)))))

(declare-fun b!590471 () Bool)

(declare-fun res!377700 () Bool)

(declare-fun e!337111 () Bool)

(assert (=> b!590471 (=> (not res!377700) (not e!337111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590471 (= res!377700 (validKeyInArray!0 k!1786))))

(declare-fun b!590472 () Bool)

(declare-fun e!337110 () Bool)

(declare-datatypes ((SeekEntryResult!6137 0))(
  ( (MissingZero!6137 (index!26781 (_ BitVec 32))) (Found!6137 (index!26782 (_ BitVec 32))) (Intermediate!6137 (undefined!6949 Bool) (index!26783 (_ BitVec 32)) (x!55576 (_ BitVec 32))) (Undefined!6137) (MissingVacant!6137 (index!26784 (_ BitVec 32))) )
))
(declare-fun lt!267889 () SeekEntryResult!6137)

(declare-fun lt!267888 () SeekEntryResult!6137)

(assert (=> b!590472 (= e!337110 (= lt!267889 lt!267888))))

(declare-fun b!590473 () Bool)

(declare-fun e!337112 () Bool)

(assert (=> b!590473 (= e!337111 e!337112)))

(declare-fun res!377688 () Bool)

(assert (=> b!590473 (=> (not res!377688) (not e!337112))))

(declare-fun lt!267883 () SeekEntryResult!6137)

(assert (=> b!590473 (= res!377688 (or (= lt!267883 (MissingZero!6137 i!1108)) (= lt!267883 (MissingVacant!6137 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36851 (_ BitVec 32)) SeekEntryResult!6137)

(assert (=> b!590473 (= lt!267883 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!590474 () Bool)

(declare-fun res!377693 () Bool)

(assert (=> b!590474 (=> (not res!377693) (not e!337112))))

(declare-datatypes ((List!11738 0))(
  ( (Nil!11735) (Cons!11734 (h!12779 (_ BitVec 64)) (t!17966 List!11738)) )
))
(declare-fun arrayNoDuplicates!0 (array!36851 (_ BitVec 32) List!11738) Bool)

(assert (=> b!590474 (= res!377693 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11735))))

(declare-fun b!590475 () Bool)

(declare-fun res!377695 () Bool)

(assert (=> b!590475 (=> (not res!377695) (not e!337111))))

(assert (=> b!590475 (= res!377695 (validKeyInArray!0 (select (arr!17697 a!2986) j!136)))))

(declare-fun b!590476 () Bool)

(declare-datatypes ((Unit!18466 0))(
  ( (Unit!18467) )
))
(declare-fun e!337109 () Unit!18466)

(declare-fun Unit!18468 () Unit!18466)

(assert (=> b!590476 (= e!337109 Unit!18468)))

(assert (=> b!590476 false))

(declare-fun res!377701 () Bool)

(assert (=> start!54064 (=> (not res!377701) (not e!337111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54064 (= res!377701 (validMask!0 mask!3053))))

(assert (=> start!54064 e!337111))

(assert (=> start!54064 true))

(declare-fun array_inv!13493 (array!36851) Bool)

(assert (=> start!54064 (array_inv!13493 a!2986)))

(declare-fun b!590477 () Bool)

(declare-fun e!337106 () Bool)

(assert (=> b!590477 (= e!337106 (not e!337107))))

(declare-fun res!377694 () Bool)

(assert (=> b!590477 (=> res!377694 e!337107)))

(declare-fun lt!267885 () SeekEntryResult!6137)

(assert (=> b!590477 (= res!377694 (not (= lt!267885 (Found!6137 index!984))))))

(declare-fun lt!267884 () Unit!18466)

(assert (=> b!590477 (= lt!267884 e!337109)))

(declare-fun c!66758 () Bool)

(assert (=> b!590477 (= c!66758 (= lt!267885 Undefined!6137))))

(declare-fun lt!267882 () array!36851)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36851 (_ BitVec 32)) SeekEntryResult!6137)

(assert (=> b!590477 (= lt!267885 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267886 lt!267882 mask!3053))))

(assert (=> b!590477 e!337110))

(declare-fun res!377692 () Bool)

(assert (=> b!590477 (=> (not res!377692) (not e!337110))))

(declare-fun lt!267887 () (_ BitVec 32))

(assert (=> b!590477 (= res!377692 (= lt!267888 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267887 vacantSpotIndex!68 lt!267886 lt!267882 mask!3053)))))

(assert (=> b!590477 (= lt!267888 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267887 vacantSpotIndex!68 (select (arr!17697 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590477 (= lt!267886 (select (store (arr!17697 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267881 () Unit!18466)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36851 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18466)

(assert (=> b!590477 (= lt!267881 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267887 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590477 (= lt!267887 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590478 () Bool)

(declare-fun e!337113 () Bool)

(assert (=> b!590478 (= e!337112 e!337113)))

(declare-fun res!377702 () Bool)

(assert (=> b!590478 (=> (not res!377702) (not e!337113))))

(assert (=> b!590478 (= res!377702 (= (select (store (arr!17697 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590478 (= lt!267882 (array!36852 (store (arr!17697 a!2986) i!1108 k!1786) (size!18061 a!2986)))))

(declare-fun b!590479 () Bool)

(declare-fun res!377691 () Bool)

(assert (=> b!590479 (=> (not res!377691) (not e!337111))))

(declare-fun arrayContainsKey!0 (array!36851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590479 (= res!377691 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590480 () Bool)

(declare-fun res!377698 () Bool)

(assert (=> b!590480 (=> (not res!377698) (not e!337112))))

(assert (=> b!590480 (= res!377698 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17697 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590481 () Bool)

(assert (=> b!590481 (= e!337113 e!337106)))

(declare-fun res!377689 () Bool)

(assert (=> b!590481 (=> (not res!377689) (not e!337106))))

(assert (=> b!590481 (= res!377689 (and (= lt!267889 (Found!6137 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17697 a!2986) index!984) (select (arr!17697 a!2986) j!136))) (not (= (select (arr!17697 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590481 (= lt!267889 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17697 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590482 () Bool)

(declare-fun res!377697 () Bool)

(assert (=> b!590482 (=> (not res!377697) (not e!337112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36851 (_ BitVec 32)) Bool)

(assert (=> b!590482 (= res!377697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590483 () Bool)

(declare-fun e!337108 () Bool)

(assert (=> b!590483 (= e!337104 e!337108)))

(declare-fun res!377696 () Bool)

(assert (=> b!590483 (=> res!377696 e!337108)))

(assert (=> b!590483 (= res!377696 (or (not (= (select (arr!17697 a!2986) j!136) lt!267886)) (not (= (select (arr!17697 a!2986) j!136) (select (store (arr!17697 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590484 () Bool)

(declare-fun Unit!18469 () Unit!18466)

(assert (=> b!590484 (= e!337109 Unit!18469)))

(declare-fun b!590485 () Bool)

(assert (=> b!590485 (= e!337108 (arrayContainsKey!0 lt!267882 (select (arr!17697 a!2986) j!136) j!136))))

(declare-fun b!590486 () Bool)

(declare-fun res!377690 () Bool)

(assert (=> b!590486 (=> (not res!377690) (not e!337111))))

(assert (=> b!590486 (= res!377690 (and (= (size!18061 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18061 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18061 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54064 res!377701) b!590486))

(assert (= (and b!590486 res!377690) b!590475))

(assert (= (and b!590475 res!377695) b!590471))

(assert (= (and b!590471 res!377700) b!590479))

(assert (= (and b!590479 res!377691) b!590473))

(assert (= (and b!590473 res!377688) b!590482))

(assert (= (and b!590482 res!377697) b!590474))

(assert (= (and b!590474 res!377693) b!590480))

(assert (= (and b!590480 res!377698) b!590478))

(assert (= (and b!590478 res!377702) b!590481))

(assert (= (and b!590481 res!377689) b!590477))

(assert (= (and b!590477 res!377692) b!590472))

(assert (= (and b!590477 c!66758) b!590476))

(assert (= (and b!590477 (not c!66758)) b!590484))

(assert (= (and b!590477 (not res!377694)) b!590470))

(assert (= (and b!590470 res!377699) b!590483))

(assert (= (and b!590483 (not res!377696)) b!590485))

(declare-fun m!568873 () Bool)

(assert (=> b!590478 m!568873))

(declare-fun m!568875 () Bool)

(assert (=> b!590478 m!568875))

(declare-fun m!568877 () Bool)

(assert (=> b!590475 m!568877))

(assert (=> b!590475 m!568877))

(declare-fun m!568879 () Bool)

(assert (=> b!590475 m!568879))

(declare-fun m!568881 () Bool)

(assert (=> b!590474 m!568881))

(declare-fun m!568883 () Bool)

(assert (=> b!590481 m!568883))

(assert (=> b!590481 m!568877))

(assert (=> b!590481 m!568877))

(declare-fun m!568885 () Bool)

(assert (=> b!590481 m!568885))

(assert (=> b!590483 m!568877))

(assert (=> b!590483 m!568873))

(declare-fun m!568887 () Bool)

(assert (=> b!590483 m!568887))

(declare-fun m!568889 () Bool)

(assert (=> b!590482 m!568889))

(declare-fun m!568891 () Bool)

(assert (=> start!54064 m!568891))

(declare-fun m!568893 () Bool)

(assert (=> start!54064 m!568893))

(declare-fun m!568895 () Bool)

(assert (=> b!590473 m!568895))

(declare-fun m!568897 () Bool)

(assert (=> b!590479 m!568897))

(declare-fun m!568899 () Bool)

(assert (=> b!590471 m!568899))

(declare-fun m!568901 () Bool)

(assert (=> b!590480 m!568901))

(assert (=> b!590485 m!568877))

(assert (=> b!590485 m!568877))

(declare-fun m!568903 () Bool)

(assert (=> b!590485 m!568903))

(declare-fun m!568905 () Bool)

(assert (=> b!590477 m!568905))

(declare-fun m!568907 () Bool)

(assert (=> b!590477 m!568907))

(assert (=> b!590477 m!568877))

(declare-fun m!568909 () Bool)

(assert (=> b!590477 m!568909))

(assert (=> b!590477 m!568877))

(assert (=> b!590477 m!568873))

(declare-fun m!568911 () Bool)

(assert (=> b!590477 m!568911))

(declare-fun m!568913 () Bool)

(assert (=> b!590477 m!568913))

(declare-fun m!568915 () Bool)

(assert (=> b!590477 m!568915))

(assert (=> b!590470 m!568877))

(assert (=> b!590470 m!568873))

(assert (=> b!590470 m!568887))

(push 1)

(assert (not b!590471))

(assert (not b!590482))

(assert (not b!590473))

(assert (not b!590479))

(assert (not b!590474))

(assert (not b!590485))

(assert (not start!54064))

(assert (not b!590481))

(assert (not b!590475))

(assert (not b!590477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

