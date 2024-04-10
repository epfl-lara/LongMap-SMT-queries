; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54858 () Bool)

(assert start!54858)

(declare-fun b!599591 () Bool)

(declare-fun e!342801 () Bool)

(declare-fun e!342799 () Bool)

(assert (=> b!599591 (= e!342801 e!342799)))

(declare-fun res!384564 () Bool)

(assert (=> b!599591 (=> res!384564 e!342799)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272605 () (_ BitVec 64))

(declare-fun lt!272601 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37093 0))(
  ( (array!37094 (arr!17806 (Array (_ BitVec 32) (_ BitVec 64))) (size!18170 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37093)

(assert (=> b!599591 (= res!384564 (or (not (= (select (arr!17806 a!2986) j!136) lt!272601)) (not (= (select (arr!17806 a!2986) j!136) lt!272605)) (bvsge j!136 index!984)))))

(declare-fun b!599592 () Bool)

(declare-fun res!384559 () Bool)

(declare-fun e!342800 () Bool)

(assert (=> b!599592 (=> (not res!384559) (not e!342800))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599592 (= res!384559 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17806 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599593 () Bool)

(declare-fun e!342796 () Bool)

(declare-fun lt!272592 () array!37093)

(declare-fun arrayContainsKey!0 (array!37093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599593 (= e!342796 (arrayContainsKey!0 lt!272592 (select (arr!17806 a!2986) j!136) index!984))))

(declare-fun b!599594 () Bool)

(declare-fun e!342797 () Bool)

(assert (=> b!599594 (= e!342800 e!342797)))

(declare-fun res!384554 () Bool)

(assert (=> b!599594 (=> (not res!384554) (not e!342797))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!599594 (= res!384554 (= (select (store (arr!17806 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599594 (= lt!272592 (array!37094 (store (arr!17806 a!2986) i!1108 k0!1786) (size!18170 a!2986)))))

(declare-fun b!599595 () Bool)

(declare-fun e!342798 () Bool)

(declare-datatypes ((SeekEntryResult!6246 0))(
  ( (MissingZero!6246 (index!27241 (_ BitVec 32))) (Found!6246 (index!27242 (_ BitVec 32))) (Intermediate!6246 (undefined!7058 Bool) (index!27243 (_ BitVec 32)) (x!56045 (_ BitVec 32))) (Undefined!6246) (MissingVacant!6246 (index!27244 (_ BitVec 32))) )
))
(declare-fun lt!272603 () SeekEntryResult!6246)

(declare-fun lt!272597 () SeekEntryResult!6246)

(assert (=> b!599595 (= e!342798 (= lt!272603 lt!272597))))

(declare-fun b!599596 () Bool)

(declare-fun res!384572 () Bool)

(assert (=> b!599596 (=> (not res!384572) (not e!342800))))

(declare-datatypes ((List!11847 0))(
  ( (Nil!11844) (Cons!11843 (h!12888 (_ BitVec 64)) (t!18075 List!11847)) )
))
(declare-fun arrayNoDuplicates!0 (array!37093 (_ BitVec 32) List!11847) Bool)

(assert (=> b!599596 (= res!384572 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11844))))

(declare-fun b!599597 () Bool)

(declare-fun res!384560 () Bool)

(declare-fun e!342802 () Bool)

(assert (=> b!599597 (=> (not res!384560) (not e!342802))))

(assert (=> b!599597 (= res!384560 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599598 () Bool)

(declare-fun e!342804 () Bool)

(declare-fun e!342792 () Bool)

(assert (=> b!599598 (= e!342804 (not e!342792))))

(declare-fun res!384567 () Bool)

(assert (=> b!599598 (=> res!384567 e!342792)))

(declare-fun lt!272600 () SeekEntryResult!6246)

(assert (=> b!599598 (= res!384567 (not (= lt!272600 (Found!6246 index!984))))))

(declare-datatypes ((Unit!18902 0))(
  ( (Unit!18903) )
))
(declare-fun lt!272594 () Unit!18902)

(declare-fun e!342794 () Unit!18902)

(assert (=> b!599598 (= lt!272594 e!342794)))

(declare-fun c!67886 () Bool)

(assert (=> b!599598 (= c!67886 (= lt!272600 Undefined!6246))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37093 (_ BitVec 32)) SeekEntryResult!6246)

(assert (=> b!599598 (= lt!272600 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272601 lt!272592 mask!3053))))

(assert (=> b!599598 e!342798))

(declare-fun res!384553 () Bool)

(assert (=> b!599598 (=> (not res!384553) (not e!342798))))

(declare-fun lt!272595 () (_ BitVec 32))

(assert (=> b!599598 (= res!384553 (= lt!272597 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272595 vacantSpotIndex!68 lt!272601 lt!272592 mask!3053)))))

(assert (=> b!599598 (= lt!272597 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272595 vacantSpotIndex!68 (select (arr!17806 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599598 (= lt!272601 (select (store (arr!17806 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272604 () Unit!18902)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37093 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18902)

(assert (=> b!599598 (= lt!272604 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272595 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599598 (= lt!272595 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599600 () Bool)

(declare-fun res!384558 () Bool)

(assert (=> b!599600 (=> (not res!384558) (not e!342800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37093 (_ BitVec 32)) Bool)

(assert (=> b!599600 (= res!384558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599601 () Bool)

(declare-fun res!384565 () Bool)

(declare-fun e!342803 () Bool)

(assert (=> b!599601 (=> res!384565 e!342803)))

(declare-fun noDuplicate!280 (List!11847) Bool)

(assert (=> b!599601 (= res!384565 (not (noDuplicate!280 Nil!11844)))))

(declare-fun b!599602 () Bool)

(assert (=> b!599602 (= e!342803 true)))

(declare-fun lt!272602 () Bool)

(declare-fun contains!2963 (List!11847 (_ BitVec 64)) Bool)

(assert (=> b!599602 (= lt!272602 (contains!2963 Nil!11844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599603 () Bool)

(assert (=> b!599603 (= e!342797 e!342804)))

(declare-fun res!384571 () Bool)

(assert (=> b!599603 (=> (not res!384571) (not e!342804))))

(assert (=> b!599603 (= res!384571 (and (= lt!272603 (Found!6246 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17806 a!2986) index!984) (select (arr!17806 a!2986) j!136))) (not (= (select (arr!17806 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599603 (= lt!272603 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17806 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599604 () Bool)

(declare-fun res!384562 () Bool)

(assert (=> b!599604 (=> res!384562 e!342803)))

(assert (=> b!599604 (= res!384562 (contains!2963 Nil!11844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599605 () Bool)

(declare-fun e!342795 () Bool)

(assert (=> b!599605 (= e!342792 e!342795)))

(declare-fun res!384561 () Bool)

(assert (=> b!599605 (=> res!384561 e!342795)))

(assert (=> b!599605 (= res!384561 (or (not (= (select (arr!17806 a!2986) j!136) lt!272601)) (not (= (select (arr!17806 a!2986) j!136) lt!272605)) (bvsge j!136 index!984)))))

(assert (=> b!599605 e!342801))

(declare-fun res!384570 () Bool)

(assert (=> b!599605 (=> (not res!384570) (not e!342801))))

(assert (=> b!599605 (= res!384570 (= lt!272605 (select (arr!17806 a!2986) j!136)))))

(assert (=> b!599605 (= lt!272605 (select (store (arr!17806 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599606 () Bool)

(declare-fun res!384569 () Bool)

(assert (=> b!599606 (=> (not res!384569) (not e!342802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599606 (= res!384569 (validKeyInArray!0 k0!1786))))

(declare-fun b!599607 () Bool)

(declare-fun res!384557 () Bool)

(assert (=> b!599607 (=> (not res!384557) (not e!342802))))

(assert (=> b!599607 (= res!384557 (validKeyInArray!0 (select (arr!17806 a!2986) j!136)))))

(declare-fun b!599608 () Bool)

(declare-fun res!384563 () Bool)

(assert (=> b!599608 (=> (not res!384563) (not e!342802))))

(assert (=> b!599608 (= res!384563 (and (= (size!18170 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18170 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18170 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599609 () Bool)

(declare-fun Unit!18904 () Unit!18902)

(assert (=> b!599609 (= e!342794 Unit!18904)))

(declare-fun b!599610 () Bool)

(assert (=> b!599610 (= e!342795 e!342803)))

(declare-fun res!384568 () Bool)

(assert (=> b!599610 (=> res!384568 e!342803)))

(assert (=> b!599610 (= res!384568 (or (bvsge (size!18170 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18170 a!2986))))))

(assert (=> b!599610 (arrayNoDuplicates!0 lt!272592 j!136 Nil!11844)))

(declare-fun lt!272593 () Unit!18902)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37093 (_ BitVec 32) (_ BitVec 32)) Unit!18902)

(assert (=> b!599610 (= lt!272593 (lemmaNoDuplicateFromThenFromBigger!0 lt!272592 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599610 (arrayNoDuplicates!0 lt!272592 #b00000000000000000000000000000000 Nil!11844)))

(declare-fun lt!272596 () Unit!18902)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37093 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11847) Unit!18902)

(assert (=> b!599610 (= lt!272596 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11844))))

(assert (=> b!599610 (arrayContainsKey!0 lt!272592 (select (arr!17806 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272599 () Unit!18902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37093 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18902)

(assert (=> b!599610 (= lt!272599 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272592 (select (arr!17806 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!384556 () Bool)

(assert (=> start!54858 (=> (not res!384556) (not e!342802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54858 (= res!384556 (validMask!0 mask!3053))))

(assert (=> start!54858 e!342802))

(assert (=> start!54858 true))

(declare-fun array_inv!13602 (array!37093) Bool)

(assert (=> start!54858 (array_inv!13602 a!2986)))

(declare-fun b!599599 () Bool)

(assert (=> b!599599 (= e!342799 e!342796)))

(declare-fun res!384555 () Bool)

(assert (=> b!599599 (=> (not res!384555) (not e!342796))))

(assert (=> b!599599 (= res!384555 (arrayContainsKey!0 lt!272592 (select (arr!17806 a!2986) j!136) j!136))))

(declare-fun b!599611 () Bool)

(declare-fun Unit!18905 () Unit!18902)

(assert (=> b!599611 (= e!342794 Unit!18905)))

(assert (=> b!599611 false))

(declare-fun b!599612 () Bool)

(assert (=> b!599612 (= e!342802 e!342800)))

(declare-fun res!384566 () Bool)

(assert (=> b!599612 (=> (not res!384566) (not e!342800))))

(declare-fun lt!272598 () SeekEntryResult!6246)

(assert (=> b!599612 (= res!384566 (or (= lt!272598 (MissingZero!6246 i!1108)) (= lt!272598 (MissingVacant!6246 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37093 (_ BitVec 32)) SeekEntryResult!6246)

(assert (=> b!599612 (= lt!272598 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!54858 res!384556) b!599608))

(assert (= (and b!599608 res!384563) b!599607))

(assert (= (and b!599607 res!384557) b!599606))

(assert (= (and b!599606 res!384569) b!599597))

(assert (= (and b!599597 res!384560) b!599612))

(assert (= (and b!599612 res!384566) b!599600))

(assert (= (and b!599600 res!384558) b!599596))

(assert (= (and b!599596 res!384572) b!599592))

(assert (= (and b!599592 res!384559) b!599594))

(assert (= (and b!599594 res!384554) b!599603))

(assert (= (and b!599603 res!384571) b!599598))

(assert (= (and b!599598 res!384553) b!599595))

(assert (= (and b!599598 c!67886) b!599611))

(assert (= (and b!599598 (not c!67886)) b!599609))

(assert (= (and b!599598 (not res!384567)) b!599605))

(assert (= (and b!599605 res!384570) b!599591))

(assert (= (and b!599591 (not res!384564)) b!599599))

(assert (= (and b!599599 res!384555) b!599593))

(assert (= (and b!599605 (not res!384561)) b!599610))

(assert (= (and b!599610 (not res!384568)) b!599601))

(assert (= (and b!599601 (not res!384565)) b!599604))

(assert (= (and b!599604 (not res!384562)) b!599602))

(declare-fun m!576837 () Bool)

(assert (=> b!599598 m!576837))

(declare-fun m!576839 () Bool)

(assert (=> b!599598 m!576839))

(declare-fun m!576841 () Bool)

(assert (=> b!599598 m!576841))

(declare-fun m!576843 () Bool)

(assert (=> b!599598 m!576843))

(declare-fun m!576845 () Bool)

(assert (=> b!599598 m!576845))

(declare-fun m!576847 () Bool)

(assert (=> b!599598 m!576847))

(declare-fun m!576849 () Bool)

(assert (=> b!599598 m!576849))

(assert (=> b!599598 m!576839))

(declare-fun m!576851 () Bool)

(assert (=> b!599598 m!576851))

(declare-fun m!576853 () Bool)

(assert (=> b!599612 m!576853))

(declare-fun m!576855 () Bool)

(assert (=> b!599596 m!576855))

(declare-fun m!576857 () Bool)

(assert (=> b!599601 m!576857))

(declare-fun m!576859 () Bool)

(assert (=> b!599592 m!576859))

(declare-fun m!576861 () Bool)

(assert (=> b!599606 m!576861))

(declare-fun m!576863 () Bool)

(assert (=> b!599600 m!576863))

(assert (=> b!599593 m!576839))

(assert (=> b!599593 m!576839))

(declare-fun m!576865 () Bool)

(assert (=> b!599593 m!576865))

(assert (=> b!599591 m!576839))

(assert (=> b!599599 m!576839))

(assert (=> b!599599 m!576839))

(declare-fun m!576867 () Bool)

(assert (=> b!599599 m!576867))

(declare-fun m!576869 () Bool)

(assert (=> start!54858 m!576869))

(declare-fun m!576871 () Bool)

(assert (=> start!54858 m!576871))

(assert (=> b!599607 m!576839))

(assert (=> b!599607 m!576839))

(declare-fun m!576873 () Bool)

(assert (=> b!599607 m!576873))

(declare-fun m!576875 () Bool)

(assert (=> b!599602 m!576875))

(declare-fun m!576877 () Bool)

(assert (=> b!599610 m!576877))

(assert (=> b!599610 m!576839))

(assert (=> b!599610 m!576839))

(declare-fun m!576879 () Bool)

(assert (=> b!599610 m!576879))

(declare-fun m!576881 () Bool)

(assert (=> b!599610 m!576881))

(assert (=> b!599610 m!576839))

(declare-fun m!576883 () Bool)

(assert (=> b!599610 m!576883))

(declare-fun m!576885 () Bool)

(assert (=> b!599610 m!576885))

(declare-fun m!576887 () Bool)

(assert (=> b!599610 m!576887))

(declare-fun m!576889 () Bool)

(assert (=> b!599603 m!576889))

(assert (=> b!599603 m!576839))

(assert (=> b!599603 m!576839))

(declare-fun m!576891 () Bool)

(assert (=> b!599603 m!576891))

(declare-fun m!576893 () Bool)

(assert (=> b!599597 m!576893))

(assert (=> b!599594 m!576841))

(declare-fun m!576895 () Bool)

(assert (=> b!599594 m!576895))

(declare-fun m!576897 () Bool)

(assert (=> b!599604 m!576897))

(assert (=> b!599605 m!576839))

(assert (=> b!599605 m!576841))

(declare-fun m!576899 () Bool)

(assert (=> b!599605 m!576899))

(check-sat (not b!599596) (not b!599606) (not b!599601) (not b!599604) (not b!599598) (not b!599597) (not start!54858) (not b!599612) (not b!599602) (not b!599610) (not b!599603) (not b!599593) (not b!599599) (not b!599607) (not b!599600))
(check-sat)
