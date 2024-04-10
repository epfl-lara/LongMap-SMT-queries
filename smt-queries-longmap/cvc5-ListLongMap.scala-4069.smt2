; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55912 () Bool)

(assert start!55912)

(declare-fun b!612055 () Bool)

(declare-fun e!350796 () Bool)

(declare-fun e!350792 () Bool)

(assert (=> b!612055 (= e!350796 (not e!350792))))

(declare-fun res!393700 () Bool)

(assert (=> b!612055 (=> res!393700 e!350792)))

(declare-datatypes ((SeekEntryResult!6377 0))(
  ( (MissingZero!6377 (index!27792 (_ BitVec 32))) (Found!6377 (index!27793 (_ BitVec 32))) (Intermediate!6377 (undefined!7189 Bool) (index!27794 (_ BitVec 32)) (x!56609 (_ BitVec 32))) (Undefined!6377) (MissingVacant!6377 (index!27795 (_ BitVec 32))) )
))
(declare-fun lt!280143 () SeekEntryResult!6377)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612055 (= res!393700 (not (= lt!280143 (Found!6377 index!984))))))

(declare-datatypes ((Unit!19642 0))(
  ( (Unit!19643) )
))
(declare-fun lt!280137 () Unit!19642)

(declare-fun e!350794 () Unit!19642)

(assert (=> b!612055 (= lt!280137 e!350794)))

(declare-fun c!69550 () Bool)

(assert (=> b!612055 (= c!69550 (= lt!280143 Undefined!6377))))

(declare-datatypes ((array!37382 0))(
  ( (array!37383 (arr!17937 (Array (_ BitVec 32) (_ BitVec 64))) (size!18301 (_ BitVec 32))) )
))
(declare-fun lt!280147 () array!37382)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280144 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37382 (_ BitVec 32)) SeekEntryResult!6377)

(assert (=> b!612055 (= lt!280143 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280144 lt!280147 mask!3053))))

(declare-fun e!350788 () Bool)

(assert (=> b!612055 e!350788))

(declare-fun res!393704 () Bool)

(assert (=> b!612055 (=> (not res!393704) (not e!350788))))

(declare-fun lt!280134 () SeekEntryResult!6377)

(declare-fun lt!280149 () (_ BitVec 32))

(assert (=> b!612055 (= res!393704 (= lt!280134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280149 vacantSpotIndex!68 lt!280144 lt!280147 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37382)

(assert (=> b!612055 (= lt!280134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280149 vacantSpotIndex!68 (select (arr!17937 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!612055 (= lt!280144 (select (store (arr!17937 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!280135 () Unit!19642)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37382 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19642)

(assert (=> b!612055 (= lt!280135 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280149 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612055 (= lt!280149 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612056 () Bool)

(declare-fun e!350793 () Bool)

(declare-fun e!350789 () Bool)

(assert (=> b!612056 (= e!350793 e!350789)))

(declare-fun res!393698 () Bool)

(assert (=> b!612056 (=> res!393698 e!350789)))

(assert (=> b!612056 (= res!393698 (bvsge index!984 j!136))))

(declare-fun lt!280141 () Unit!19642)

(declare-fun e!350791 () Unit!19642)

(assert (=> b!612056 (= lt!280141 e!350791)))

(declare-fun c!69551 () Bool)

(assert (=> b!612056 (= c!69551 (bvslt j!136 index!984))))

(declare-fun b!612057 () Bool)

(declare-fun res!393690 () Bool)

(declare-fun e!350785 () Bool)

(assert (=> b!612057 (=> (not res!393690) (not e!350785))))

(declare-fun arrayContainsKey!0 (array!37382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612057 (= res!393690 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612058 () Bool)

(declare-fun res!393689 () Bool)

(assert (=> b!612058 (=> (not res!393689) (not e!350785))))

(assert (=> b!612058 (= res!393689 (and (= (size!18301 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18301 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18301 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612059 () Bool)

(assert (=> b!612059 (= e!350789 true)))

(declare-datatypes ((List!11978 0))(
  ( (Nil!11975) (Cons!11974 (h!13019 (_ BitVec 64)) (t!18206 List!11978)) )
))
(declare-fun arrayNoDuplicates!0 (array!37382 (_ BitVec 32) List!11978) Bool)

(assert (=> b!612059 (arrayNoDuplicates!0 lt!280147 #b00000000000000000000000000000000 Nil!11975)))

(declare-fun lt!280148 () Unit!19642)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11978) Unit!19642)

(assert (=> b!612059 (= lt!280148 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11975))))

(assert (=> b!612059 (arrayContainsKey!0 lt!280147 (select (arr!17937 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280150 () Unit!19642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19642)

(assert (=> b!612059 (= lt!280150 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280147 (select (arr!17937 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350786 () Bool)

(assert (=> b!612059 e!350786))

(declare-fun res!393694 () Bool)

(assert (=> b!612059 (=> (not res!393694) (not e!350786))))

(assert (=> b!612059 (= res!393694 (arrayContainsKey!0 lt!280147 (select (arr!17937 a!2986) j!136) j!136))))

(declare-fun b!612060 () Bool)

(declare-fun res!393691 () Bool)

(declare-fun e!350795 () Bool)

(assert (=> b!612060 (=> (not res!393691) (not e!350795))))

(assert (=> b!612060 (= res!393691 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11975))))

(declare-fun b!612061 () Bool)

(declare-fun e!350787 () Bool)

(assert (=> b!612061 (= e!350795 e!350787)))

(declare-fun res!393702 () Bool)

(assert (=> b!612061 (=> (not res!393702) (not e!350787))))

(assert (=> b!612061 (= res!393702 (= (select (store (arr!17937 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612061 (= lt!280147 (array!37383 (store (arr!17937 a!2986) i!1108 k!1786) (size!18301 a!2986)))))

(declare-fun res!393703 () Bool)

(assert (=> start!55912 (=> (not res!393703) (not e!350785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55912 (= res!393703 (validMask!0 mask!3053))))

(assert (=> start!55912 e!350785))

(assert (=> start!55912 true))

(declare-fun array_inv!13733 (array!37382) Bool)

(assert (=> start!55912 (array_inv!13733 a!2986)))

(declare-fun b!612062 () Bool)

(declare-fun res!393693 () Bool)

(assert (=> b!612062 (=> (not res!393693) (not e!350785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612062 (= res!393693 (validKeyInArray!0 (select (arr!17937 a!2986) j!136)))))

(declare-fun b!612063 () Bool)

(declare-fun e!350799 () Bool)

(declare-fun e!350798 () Bool)

(assert (=> b!612063 (= e!350799 e!350798)))

(declare-fun res!393696 () Bool)

(assert (=> b!612063 (=> res!393696 e!350798)))

(declare-fun lt!280136 () (_ BitVec 64))

(assert (=> b!612063 (= res!393696 (or (not (= (select (arr!17937 a!2986) j!136) lt!280144)) (not (= (select (arr!17937 a!2986) j!136) lt!280136)) (bvsge j!136 index!984)))))

(declare-fun b!612064 () Bool)

(declare-fun e!350790 () Bool)

(assert (=> b!612064 (= e!350798 e!350790)))

(declare-fun res!393707 () Bool)

(assert (=> b!612064 (=> (not res!393707) (not e!350790))))

(assert (=> b!612064 (= res!393707 (arrayContainsKey!0 lt!280147 (select (arr!17937 a!2986) j!136) j!136))))

(declare-fun b!612065 () Bool)

(assert (=> b!612065 (= e!350790 (arrayContainsKey!0 lt!280147 (select (arr!17937 a!2986) j!136) index!984))))

(declare-fun b!612066 () Bool)

(declare-fun Unit!19644 () Unit!19642)

(assert (=> b!612066 (= e!350791 Unit!19644)))

(declare-fun lt!280145 () Unit!19642)

(assert (=> b!612066 (= lt!280145 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280147 (select (arr!17937 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612066 (arrayContainsKey!0 lt!280147 (select (arr!17937 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280142 () Unit!19642)

(assert (=> b!612066 (= lt!280142 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11975))))

(assert (=> b!612066 (arrayNoDuplicates!0 lt!280147 #b00000000000000000000000000000000 Nil!11975)))

(declare-fun lt!280146 () Unit!19642)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37382 (_ BitVec 32) (_ BitVec 32)) Unit!19642)

(assert (=> b!612066 (= lt!280146 (lemmaNoDuplicateFromThenFromBigger!0 lt!280147 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612066 (arrayNoDuplicates!0 lt!280147 j!136 Nil!11975)))

(declare-fun lt!280138 () Unit!19642)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37382 (_ BitVec 64) (_ BitVec 32) List!11978) Unit!19642)

(assert (=> b!612066 (= lt!280138 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280147 (select (arr!17937 a!2986) j!136) j!136 Nil!11975))))

(assert (=> b!612066 false))

(declare-fun b!612067 () Bool)

(assert (=> b!612067 (= e!350785 e!350795)))

(declare-fun res!393706 () Bool)

(assert (=> b!612067 (=> (not res!393706) (not e!350795))))

(declare-fun lt!280140 () SeekEntryResult!6377)

(assert (=> b!612067 (= res!393706 (or (= lt!280140 (MissingZero!6377 i!1108)) (= lt!280140 (MissingVacant!6377 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37382 (_ BitVec 32)) SeekEntryResult!6377)

(assert (=> b!612067 (= lt!280140 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!612068 () Bool)

(assert (=> b!612068 (= e!350787 e!350796)))

(declare-fun res!393695 () Bool)

(assert (=> b!612068 (=> (not res!393695) (not e!350796))))

(declare-fun lt!280139 () SeekEntryResult!6377)

(assert (=> b!612068 (= res!393695 (and (= lt!280139 (Found!6377 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17937 a!2986) index!984) (select (arr!17937 a!2986) j!136))) (not (= (select (arr!17937 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612068 (= lt!280139 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17937 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612069 () Bool)

(assert (=> b!612069 (= e!350788 (= lt!280139 lt!280134))))

(declare-fun b!612070 () Bool)

(assert (=> b!612070 (= e!350786 (arrayContainsKey!0 lt!280147 (select (arr!17937 a!2986) j!136) index!984))))

(declare-fun b!612071 () Bool)

(declare-fun res!393701 () Bool)

(assert (=> b!612071 (=> (not res!393701) (not e!350795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37382 (_ BitVec 32)) Bool)

(assert (=> b!612071 (= res!393701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612072 () Bool)

(declare-fun Unit!19645 () Unit!19642)

(assert (=> b!612072 (= e!350794 Unit!19645)))

(declare-fun b!612073 () Bool)

(declare-fun Unit!19646 () Unit!19642)

(assert (=> b!612073 (= e!350791 Unit!19646)))

(declare-fun b!612074 () Bool)

(declare-fun Unit!19647 () Unit!19642)

(assert (=> b!612074 (= e!350794 Unit!19647)))

(assert (=> b!612074 false))

(declare-fun b!612075 () Bool)

(declare-fun res!393697 () Bool)

(assert (=> b!612075 (=> (not res!393697) (not e!350785))))

(assert (=> b!612075 (= res!393697 (validKeyInArray!0 k!1786))))

(declare-fun b!612076 () Bool)

(declare-fun res!393705 () Bool)

(assert (=> b!612076 (=> (not res!393705) (not e!350795))))

(assert (=> b!612076 (= res!393705 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17937 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612077 () Bool)

(assert (=> b!612077 (= e!350792 e!350793)))

(declare-fun res!393699 () Bool)

(assert (=> b!612077 (=> res!393699 e!350793)))

(assert (=> b!612077 (= res!393699 (or (not (= (select (arr!17937 a!2986) j!136) lt!280144)) (not (= (select (arr!17937 a!2986) j!136) lt!280136))))))

(assert (=> b!612077 e!350799))

(declare-fun res!393692 () Bool)

(assert (=> b!612077 (=> (not res!393692) (not e!350799))))

(assert (=> b!612077 (= res!393692 (= lt!280136 (select (arr!17937 a!2986) j!136)))))

(assert (=> b!612077 (= lt!280136 (select (store (arr!17937 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!55912 res!393703) b!612058))

(assert (= (and b!612058 res!393689) b!612062))

(assert (= (and b!612062 res!393693) b!612075))

(assert (= (and b!612075 res!393697) b!612057))

(assert (= (and b!612057 res!393690) b!612067))

(assert (= (and b!612067 res!393706) b!612071))

(assert (= (and b!612071 res!393701) b!612060))

(assert (= (and b!612060 res!393691) b!612076))

(assert (= (and b!612076 res!393705) b!612061))

(assert (= (and b!612061 res!393702) b!612068))

(assert (= (and b!612068 res!393695) b!612055))

(assert (= (and b!612055 res!393704) b!612069))

(assert (= (and b!612055 c!69550) b!612074))

(assert (= (and b!612055 (not c!69550)) b!612072))

(assert (= (and b!612055 (not res!393700)) b!612077))

(assert (= (and b!612077 res!393692) b!612063))

(assert (= (and b!612063 (not res!393696)) b!612064))

(assert (= (and b!612064 res!393707) b!612065))

(assert (= (and b!612077 (not res!393699)) b!612056))

(assert (= (and b!612056 c!69551) b!612066))

(assert (= (and b!612056 (not c!69551)) b!612073))

(assert (= (and b!612056 (not res!393698)) b!612059))

(assert (= (and b!612059 res!393694) b!612070))

(declare-fun m!588431 () Bool)

(assert (=> b!612077 m!588431))

(declare-fun m!588433 () Bool)

(assert (=> b!612077 m!588433))

(declare-fun m!588435 () Bool)

(assert (=> b!612077 m!588435))

(declare-fun m!588437 () Bool)

(assert (=> b!612076 m!588437))

(declare-fun m!588439 () Bool)

(assert (=> b!612055 m!588439))

(declare-fun m!588441 () Bool)

(assert (=> b!612055 m!588441))

(assert (=> b!612055 m!588433))

(declare-fun m!588443 () Bool)

(assert (=> b!612055 m!588443))

(declare-fun m!588445 () Bool)

(assert (=> b!612055 m!588445))

(assert (=> b!612055 m!588431))

(declare-fun m!588447 () Bool)

(assert (=> b!612055 m!588447))

(assert (=> b!612055 m!588431))

(declare-fun m!588449 () Bool)

(assert (=> b!612055 m!588449))

(declare-fun m!588451 () Bool)

(assert (=> b!612067 m!588451))

(assert (=> b!612070 m!588431))

(assert (=> b!612070 m!588431))

(declare-fun m!588453 () Bool)

(assert (=> b!612070 m!588453))

(assert (=> b!612061 m!588433))

(declare-fun m!588455 () Bool)

(assert (=> b!612061 m!588455))

(assert (=> b!612059 m!588431))

(assert (=> b!612059 m!588431))

(declare-fun m!588457 () Bool)

(assert (=> b!612059 m!588457))

(declare-fun m!588459 () Bool)

(assert (=> b!612059 m!588459))

(declare-fun m!588461 () Bool)

(assert (=> b!612059 m!588461))

(assert (=> b!612059 m!588431))

(declare-fun m!588463 () Bool)

(assert (=> b!612059 m!588463))

(assert (=> b!612059 m!588431))

(declare-fun m!588465 () Bool)

(assert (=> b!612059 m!588465))

(declare-fun m!588467 () Bool)

(assert (=> b!612057 m!588467))

(assert (=> b!612062 m!588431))

(assert (=> b!612062 m!588431))

(declare-fun m!588469 () Bool)

(assert (=> b!612062 m!588469))

(assert (=> b!612066 m!588431))

(declare-fun m!588471 () Bool)

(assert (=> b!612066 m!588471))

(assert (=> b!612066 m!588431))

(assert (=> b!612066 m!588459))

(assert (=> b!612066 m!588431))

(declare-fun m!588473 () Bool)

(assert (=> b!612066 m!588473))

(declare-fun m!588475 () Bool)

(assert (=> b!612066 m!588475))

(assert (=> b!612066 m!588461))

(assert (=> b!612066 m!588431))

(declare-fun m!588477 () Bool)

(assert (=> b!612066 m!588477))

(declare-fun m!588479 () Bool)

(assert (=> b!612066 m!588479))

(declare-fun m!588481 () Bool)

(assert (=> start!55912 m!588481))

(declare-fun m!588483 () Bool)

(assert (=> start!55912 m!588483))

(declare-fun m!588485 () Bool)

(assert (=> b!612068 m!588485))

(assert (=> b!612068 m!588431))

(assert (=> b!612068 m!588431))

(declare-fun m!588487 () Bool)

(assert (=> b!612068 m!588487))

(assert (=> b!612065 m!588431))

(assert (=> b!612065 m!588431))

(assert (=> b!612065 m!588453))

(declare-fun m!588489 () Bool)

(assert (=> b!612060 m!588489))

(assert (=> b!612063 m!588431))

(declare-fun m!588491 () Bool)

(assert (=> b!612071 m!588491))

(assert (=> b!612064 m!588431))

(assert (=> b!612064 m!588431))

(assert (=> b!612064 m!588457))

(declare-fun m!588493 () Bool)

(assert (=> b!612075 m!588493))

(push 1)

