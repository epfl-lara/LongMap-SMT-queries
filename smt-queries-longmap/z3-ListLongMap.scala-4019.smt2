; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54822 () Bool)

(assert start!54822)

(declare-fun b!598523 () Bool)

(declare-datatypes ((Unit!18830 0))(
  ( (Unit!18831) )
))
(declare-fun e!342130 () Unit!18830)

(declare-fun Unit!18832 () Unit!18830)

(assert (=> b!598523 (= e!342130 Unit!18832)))

(assert (=> b!598523 false))

(declare-fun b!598524 () Bool)

(declare-fun res!383605 () Bool)

(declare-fun e!342133 () Bool)

(assert (=> b!598524 (=> (not res!383605) (not e!342133))))

(declare-datatypes ((array!37057 0))(
  ( (array!37058 (arr!17788 (Array (_ BitVec 32) (_ BitVec 64))) (size!18152 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37057)

(declare-datatypes ((List!11829 0))(
  ( (Nil!11826) (Cons!11825 (h!12870 (_ BitVec 64)) (t!18057 List!11829)) )
))
(declare-fun arrayNoDuplicates!0 (array!37057 (_ BitVec 32) List!11829) Bool)

(assert (=> b!598524 (= res!383605 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11826))))

(declare-fun b!598525 () Bool)

(declare-fun e!342131 () Bool)

(declare-fun e!342140 () Bool)

(assert (=> b!598525 (= e!342131 e!342140)))

(declare-fun res!383606 () Bool)

(assert (=> b!598525 (=> (not res!383606) (not e!342140))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!271919 () array!37057)

(declare-fun arrayContainsKey!0 (array!37057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598525 (= res!383606 (arrayContainsKey!0 lt!271919 (select (arr!17788 a!2986) j!136) j!136))))

(declare-fun b!598526 () Bool)

(declare-fun e!342135 () Bool)

(assert (=> b!598526 (= e!342135 true)))

(assert (=> b!598526 (arrayNoDuplicates!0 lt!271919 #b00000000000000000000000000000000 Nil!11826)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!271917 () Unit!18830)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37057 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11829) Unit!18830)

(assert (=> b!598526 (= lt!271917 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11826))))

(assert (=> b!598526 (arrayContainsKey!0 lt!271919 (select (arr!17788 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271923 () Unit!18830)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37057 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18830)

(assert (=> b!598526 (= lt!271923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271919 (select (arr!17788 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598527 () Bool)

(declare-fun e!342136 () Bool)

(assert (=> b!598527 (= e!342133 e!342136)))

(declare-fun res!383604 () Bool)

(assert (=> b!598527 (=> (not res!383604) (not e!342136))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!598527 (= res!383604 (= (select (store (arr!17788 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598527 (= lt!271919 (array!37058 (store (arr!17788 a!2986) i!1108 k0!1786) (size!18152 a!2986)))))

(declare-fun b!598528 () Bool)

(declare-fun e!342141 () Bool)

(assert (=> b!598528 (= e!342136 e!342141)))

(declare-fun res!383599 () Bool)

(assert (=> b!598528 (=> (not res!383599) (not e!342141))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6228 0))(
  ( (MissingZero!6228 (index!27169 (_ BitVec 32))) (Found!6228 (index!27170 (_ BitVec 32))) (Intermediate!6228 (undefined!7040 Bool) (index!27171 (_ BitVec 32)) (x!55979 (_ BitVec 32))) (Undefined!6228) (MissingVacant!6228 (index!27172 (_ BitVec 32))) )
))
(declare-fun lt!271921 () SeekEntryResult!6228)

(assert (=> b!598528 (= res!383599 (and (= lt!271921 (Found!6228 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17788 a!2986) index!984) (select (arr!17788 a!2986) j!136))) (not (= (select (arr!17788 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37057 (_ BitVec 32)) SeekEntryResult!6228)

(assert (=> b!598528 (= lt!271921 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17788 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598529 () Bool)

(declare-fun res!383593 () Bool)

(declare-fun e!342137 () Bool)

(assert (=> b!598529 (=> (not res!383593) (not e!342137))))

(assert (=> b!598529 (= res!383593 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598530 () Bool)

(declare-fun e!342138 () Bool)

(assert (=> b!598530 (= e!342138 e!342131)))

(declare-fun res!383598 () Bool)

(assert (=> b!598530 (=> res!383598 e!342131)))

(declare-fun lt!271926 () (_ BitVec 64))

(declare-fun lt!271916 () (_ BitVec 64))

(assert (=> b!598530 (= res!383598 (or (not (= (select (arr!17788 a!2986) j!136) lt!271926)) (not (= (select (arr!17788 a!2986) j!136) lt!271916)) (bvsge j!136 index!984)))))

(declare-fun b!598531 () Bool)

(assert (=> b!598531 (= e!342140 (arrayContainsKey!0 lt!271919 (select (arr!17788 a!2986) j!136) index!984))))

(declare-fun b!598533 () Bool)

(declare-fun Unit!18833 () Unit!18830)

(assert (=> b!598533 (= e!342130 Unit!18833)))

(declare-fun b!598534 () Bool)

(declare-fun e!342132 () Bool)

(assert (=> b!598534 (= e!342132 e!342135)))

(declare-fun res!383600 () Bool)

(assert (=> b!598534 (=> res!383600 e!342135)))

(assert (=> b!598534 (= res!383600 (or (not (= (select (arr!17788 a!2986) j!136) lt!271926)) (not (= (select (arr!17788 a!2986) j!136) lt!271916)) (bvsge j!136 index!984)))))

(assert (=> b!598534 e!342138))

(declare-fun res!383595 () Bool)

(assert (=> b!598534 (=> (not res!383595) (not e!342138))))

(assert (=> b!598534 (= res!383595 (= lt!271916 (select (arr!17788 a!2986) j!136)))))

(assert (=> b!598534 (= lt!271916 (select (store (arr!17788 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598535 () Bool)

(declare-fun res!383597 () Bool)

(assert (=> b!598535 (=> (not res!383597) (not e!342133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37057 (_ BitVec 32)) Bool)

(assert (=> b!598535 (= res!383597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598536 () Bool)

(assert (=> b!598536 (= e!342137 e!342133)))

(declare-fun res!383594 () Bool)

(assert (=> b!598536 (=> (not res!383594) (not e!342133))))

(declare-fun lt!271927 () SeekEntryResult!6228)

(assert (=> b!598536 (= res!383594 (or (= lt!271927 (MissingZero!6228 i!1108)) (= lt!271927 (MissingVacant!6228 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37057 (_ BitVec 32)) SeekEntryResult!6228)

(assert (=> b!598536 (= lt!271927 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598537 () Bool)

(declare-fun res!383602 () Bool)

(assert (=> b!598537 (=> (not res!383602) (not e!342137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598537 (= res!383602 (validKeyInArray!0 (select (arr!17788 a!2986) j!136)))))

(declare-fun b!598538 () Bool)

(declare-fun res!383596 () Bool)

(assert (=> b!598538 (=> (not res!383596) (not e!342137))))

(assert (=> b!598538 (= res!383596 (and (= (size!18152 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18152 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18152 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598539 () Bool)

(assert (=> b!598539 (= e!342141 (not e!342132))))

(declare-fun res!383607 () Bool)

(assert (=> b!598539 (=> res!383607 e!342132)))

(declare-fun lt!271918 () SeekEntryResult!6228)

(assert (=> b!598539 (= res!383607 (not (= lt!271918 (Found!6228 index!984))))))

(declare-fun lt!271924 () Unit!18830)

(assert (=> b!598539 (= lt!271924 e!342130)))

(declare-fun c!67832 () Bool)

(assert (=> b!598539 (= c!67832 (= lt!271918 Undefined!6228))))

(assert (=> b!598539 (= lt!271918 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271926 lt!271919 mask!3053))))

(declare-fun e!342134 () Bool)

(assert (=> b!598539 e!342134))

(declare-fun res!383601 () Bool)

(assert (=> b!598539 (=> (not res!383601) (not e!342134))))

(declare-fun lt!271920 () (_ BitVec 32))

(declare-fun lt!271922 () SeekEntryResult!6228)

(assert (=> b!598539 (= res!383601 (= lt!271922 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271920 vacantSpotIndex!68 lt!271926 lt!271919 mask!3053)))))

(assert (=> b!598539 (= lt!271922 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271920 vacantSpotIndex!68 (select (arr!17788 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598539 (= lt!271926 (select (store (arr!17788 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271925 () Unit!18830)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18830)

(assert (=> b!598539 (= lt!271925 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271920 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598539 (= lt!271920 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!383609 () Bool)

(assert (=> start!54822 (=> (not res!383609) (not e!342137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54822 (= res!383609 (validMask!0 mask!3053))))

(assert (=> start!54822 e!342137))

(assert (=> start!54822 true))

(declare-fun array_inv!13584 (array!37057) Bool)

(assert (=> start!54822 (array_inv!13584 a!2986)))

(declare-fun b!598532 () Bool)

(declare-fun res!383608 () Bool)

(assert (=> b!598532 (=> (not res!383608) (not e!342137))))

(assert (=> b!598532 (= res!383608 (validKeyInArray!0 k0!1786))))

(declare-fun b!598540 () Bool)

(declare-fun res!383603 () Bool)

(assert (=> b!598540 (=> (not res!383603) (not e!342133))))

(assert (=> b!598540 (= res!383603 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17788 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598541 () Bool)

(assert (=> b!598541 (= e!342134 (= lt!271921 lt!271922))))

(assert (= (and start!54822 res!383609) b!598538))

(assert (= (and b!598538 res!383596) b!598537))

(assert (= (and b!598537 res!383602) b!598532))

(assert (= (and b!598532 res!383608) b!598529))

(assert (= (and b!598529 res!383593) b!598536))

(assert (= (and b!598536 res!383594) b!598535))

(assert (= (and b!598535 res!383597) b!598524))

(assert (= (and b!598524 res!383605) b!598540))

(assert (= (and b!598540 res!383603) b!598527))

(assert (= (and b!598527 res!383604) b!598528))

(assert (= (and b!598528 res!383599) b!598539))

(assert (= (and b!598539 res!383601) b!598541))

(assert (= (and b!598539 c!67832) b!598523))

(assert (= (and b!598539 (not c!67832)) b!598533))

(assert (= (and b!598539 (not res!383607)) b!598534))

(assert (= (and b!598534 res!383595) b!598530))

(assert (= (and b!598530 (not res!383598)) b!598525))

(assert (= (and b!598525 res!383606) b!598531))

(assert (= (and b!598534 (not res!383600)) b!598526))

(declare-fun m!575825 () Bool)

(assert (=> b!598530 m!575825))

(declare-fun m!575827 () Bool)

(assert (=> b!598524 m!575827))

(declare-fun m!575829 () Bool)

(assert (=> b!598528 m!575829))

(assert (=> b!598528 m!575825))

(assert (=> b!598528 m!575825))

(declare-fun m!575831 () Bool)

(assert (=> b!598528 m!575831))

(declare-fun m!575833 () Bool)

(assert (=> b!598540 m!575833))

(assert (=> b!598525 m!575825))

(assert (=> b!598525 m!575825))

(declare-fun m!575835 () Bool)

(assert (=> b!598525 m!575835))

(declare-fun m!575837 () Bool)

(assert (=> start!54822 m!575837))

(declare-fun m!575839 () Bool)

(assert (=> start!54822 m!575839))

(declare-fun m!575841 () Bool)

(assert (=> b!598527 m!575841))

(declare-fun m!575843 () Bool)

(assert (=> b!598527 m!575843))

(declare-fun m!575845 () Bool)

(assert (=> b!598532 m!575845))

(declare-fun m!575847 () Bool)

(assert (=> b!598529 m!575847))

(assert (=> b!598531 m!575825))

(assert (=> b!598531 m!575825))

(declare-fun m!575849 () Bool)

(assert (=> b!598531 m!575849))

(assert (=> b!598526 m!575825))

(assert (=> b!598526 m!575825))

(declare-fun m!575851 () Bool)

(assert (=> b!598526 m!575851))

(declare-fun m!575853 () Bool)

(assert (=> b!598526 m!575853))

(assert (=> b!598526 m!575825))

(declare-fun m!575855 () Bool)

(assert (=> b!598526 m!575855))

(declare-fun m!575857 () Bool)

(assert (=> b!598526 m!575857))

(declare-fun m!575859 () Bool)

(assert (=> b!598535 m!575859))

(assert (=> b!598537 m!575825))

(assert (=> b!598537 m!575825))

(declare-fun m!575861 () Bool)

(assert (=> b!598537 m!575861))

(assert (=> b!598534 m!575825))

(assert (=> b!598534 m!575841))

(declare-fun m!575863 () Bool)

(assert (=> b!598534 m!575863))

(declare-fun m!575865 () Bool)

(assert (=> b!598536 m!575865))

(declare-fun m!575867 () Bool)

(assert (=> b!598539 m!575867))

(assert (=> b!598539 m!575825))

(assert (=> b!598539 m!575841))

(declare-fun m!575869 () Bool)

(assert (=> b!598539 m!575869))

(assert (=> b!598539 m!575825))

(declare-fun m!575871 () Bool)

(assert (=> b!598539 m!575871))

(declare-fun m!575873 () Bool)

(assert (=> b!598539 m!575873))

(declare-fun m!575875 () Bool)

(assert (=> b!598539 m!575875))

(declare-fun m!575877 () Bool)

(assert (=> b!598539 m!575877))

(check-sat (not b!598537) (not b!598532) (not b!598536) (not b!598539) (not b!598526) (not b!598535) (not b!598524) (not b!598525) (not b!598529) (not b!598528) (not b!598531) (not start!54822))
(check-sat)
