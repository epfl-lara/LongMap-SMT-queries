; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54820 () Bool)

(assert start!54820)

(declare-fun b!598466 () Bool)

(declare-fun e!342097 () Bool)

(declare-fun e!342104 () Bool)

(assert (=> b!598466 (= e!342097 e!342104)))

(declare-fun res!383549 () Bool)

(assert (=> b!598466 (=> (not res!383549) (not e!342104))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37055 0))(
  ( (array!37056 (arr!17787 (Array (_ BitVec 32) (_ BitVec 64))) (size!18151 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37055)

(declare-datatypes ((SeekEntryResult!6227 0))(
  ( (MissingZero!6227 (index!27165 (_ BitVec 32))) (Found!6227 (index!27166 (_ BitVec 32))) (Intermediate!6227 (undefined!7039 Bool) (index!27167 (_ BitVec 32)) (x!55978 (_ BitVec 32))) (Undefined!6227) (MissingVacant!6227 (index!27168 (_ BitVec 32))) )
))
(declare-fun lt!271890 () SeekEntryResult!6227)

(assert (=> b!598466 (= res!383549 (and (= lt!271890 (Found!6227 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17787 a!2986) index!984) (select (arr!17787 a!2986) j!136))) (not (= (select (arr!17787 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37055 (_ BitVec 32)) SeekEntryResult!6227)

(assert (=> b!598466 (= lt!271890 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17787 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598467 () Bool)

(declare-fun res!383543 () Bool)

(declare-fun e!342096 () Bool)

(assert (=> b!598467 (=> (not res!383543) (not e!342096))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598467 (= res!383543 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598468 () Bool)

(declare-datatypes ((Unit!18826 0))(
  ( (Unit!18827) )
))
(declare-fun e!342102 () Unit!18826)

(declare-fun Unit!18828 () Unit!18826)

(assert (=> b!598468 (= e!342102 Unit!18828)))

(declare-fun b!598469 () Bool)

(declare-fun e!342098 () Bool)

(declare-fun lt!271888 () SeekEntryResult!6227)

(assert (=> b!598469 (= e!342098 (= lt!271890 lt!271888))))

(declare-fun res!383542 () Bool)

(assert (=> start!54820 (=> (not res!383542) (not e!342096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54820 (= res!383542 (validMask!0 mask!3053))))

(assert (=> start!54820 e!342096))

(assert (=> start!54820 true))

(declare-fun array_inv!13583 (array!37055) Bool)

(assert (=> start!54820 (array_inv!13583 a!2986)))

(declare-fun b!598470 () Bool)

(declare-fun res!383546 () Bool)

(assert (=> b!598470 (=> (not res!383546) (not e!342096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598470 (= res!383546 (validKeyInArray!0 k!1786))))

(declare-fun b!598471 () Bool)

(declare-fun e!342099 () Bool)

(assert (=> b!598471 (= e!342099 e!342097)))

(declare-fun res!383555 () Bool)

(assert (=> b!598471 (=> (not res!383555) (not e!342097))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598471 (= res!383555 (= (select (store (arr!17787 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!271889 () array!37055)

(assert (=> b!598471 (= lt!271889 (array!37056 (store (arr!17787 a!2986) i!1108 k!1786) (size!18151 a!2986)))))

(declare-fun b!598472 () Bool)

(declare-fun res!383558 () Bool)

(assert (=> b!598472 (=> (not res!383558) (not e!342096))))

(assert (=> b!598472 (= res!383558 (and (= (size!18151 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18151 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18151 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598473 () Bool)

(declare-fun res!383556 () Bool)

(assert (=> b!598473 (=> (not res!383556) (not e!342096))))

(assert (=> b!598473 (= res!383556 (validKeyInArray!0 (select (arr!17787 a!2986) j!136)))))

(declare-fun b!598474 () Bool)

(declare-fun e!342101 () Bool)

(declare-fun e!342094 () Bool)

(assert (=> b!598474 (= e!342101 e!342094)))

(declare-fun res!383550 () Bool)

(assert (=> b!598474 (=> res!383550 e!342094)))

(declare-fun lt!271886 () (_ BitVec 64))

(declare-fun lt!271885 () (_ BitVec 64))

(assert (=> b!598474 (= res!383550 (or (not (= (select (arr!17787 a!2986) j!136) lt!271886)) (not (= (select (arr!17787 a!2986) j!136) lt!271885)) (bvsge j!136 index!984)))))

(declare-fun e!342103 () Bool)

(assert (=> b!598474 e!342103))

(declare-fun res!383553 () Bool)

(assert (=> b!598474 (=> (not res!383553) (not e!342103))))

(assert (=> b!598474 (= res!383553 (= lt!271885 (select (arr!17787 a!2986) j!136)))))

(assert (=> b!598474 (= lt!271885 (select (store (arr!17787 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598475 () Bool)

(declare-fun e!342095 () Bool)

(assert (=> b!598475 (= e!342103 e!342095)))

(declare-fun res!383557 () Bool)

(assert (=> b!598475 (=> res!383557 e!342095)))

(assert (=> b!598475 (= res!383557 (or (not (= (select (arr!17787 a!2986) j!136) lt!271886)) (not (= (select (arr!17787 a!2986) j!136) lt!271885)) (bvsge j!136 index!984)))))

(declare-fun b!598476 () Bool)

(assert (=> b!598476 (= e!342104 (not e!342101))))

(declare-fun res!383552 () Bool)

(assert (=> b!598476 (=> res!383552 e!342101)))

(declare-fun lt!271881 () SeekEntryResult!6227)

(assert (=> b!598476 (= res!383552 (not (= lt!271881 (Found!6227 index!984))))))

(declare-fun lt!271880 () Unit!18826)

(assert (=> b!598476 (= lt!271880 e!342102)))

(declare-fun c!67829 () Bool)

(assert (=> b!598476 (= c!67829 (= lt!271881 Undefined!6227))))

(assert (=> b!598476 (= lt!271881 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271886 lt!271889 mask!3053))))

(assert (=> b!598476 e!342098))

(declare-fun res!383554 () Bool)

(assert (=> b!598476 (=> (not res!383554) (not e!342098))))

(declare-fun lt!271887 () (_ BitVec 32))

(assert (=> b!598476 (= res!383554 (= lt!271888 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271887 vacantSpotIndex!68 lt!271886 lt!271889 mask!3053)))))

(assert (=> b!598476 (= lt!271888 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271887 vacantSpotIndex!68 (select (arr!17787 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598476 (= lt!271886 (select (store (arr!17787 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271891 () Unit!18826)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37055 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18826)

(assert (=> b!598476 (= lt!271891 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271887 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598476 (= lt!271887 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598477 () Bool)

(declare-fun e!342100 () Bool)

(assert (=> b!598477 (= e!342095 e!342100)))

(declare-fun res!383547 () Bool)

(assert (=> b!598477 (=> (not res!383547) (not e!342100))))

(assert (=> b!598477 (= res!383547 (arrayContainsKey!0 lt!271889 (select (arr!17787 a!2986) j!136) j!136))))

(declare-fun b!598478 () Bool)

(declare-fun res!383544 () Bool)

(assert (=> b!598478 (=> (not res!383544) (not e!342099))))

(assert (=> b!598478 (= res!383544 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17787 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598479 () Bool)

(declare-fun res!383545 () Bool)

(assert (=> b!598479 (=> (not res!383545) (not e!342099))))

(declare-datatypes ((List!11828 0))(
  ( (Nil!11825) (Cons!11824 (h!12869 (_ BitVec 64)) (t!18056 List!11828)) )
))
(declare-fun arrayNoDuplicates!0 (array!37055 (_ BitVec 32) List!11828) Bool)

(assert (=> b!598479 (= res!383545 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11825))))

(declare-fun b!598480 () Bool)

(assert (=> b!598480 (= e!342094 true)))

(assert (=> b!598480 (arrayNoDuplicates!0 lt!271889 #b00000000000000000000000000000000 Nil!11825)))

(declare-fun lt!271884 () Unit!18826)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37055 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11828) Unit!18826)

(assert (=> b!598480 (= lt!271884 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11825))))

(assert (=> b!598480 (arrayContainsKey!0 lt!271889 (select (arr!17787 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271882 () Unit!18826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37055 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18826)

(assert (=> b!598480 (= lt!271882 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271889 (select (arr!17787 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598481 () Bool)

(declare-fun res!383551 () Bool)

(assert (=> b!598481 (=> (not res!383551) (not e!342099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37055 (_ BitVec 32)) Bool)

(assert (=> b!598481 (= res!383551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598482 () Bool)

(declare-fun Unit!18829 () Unit!18826)

(assert (=> b!598482 (= e!342102 Unit!18829)))

(assert (=> b!598482 false))

(declare-fun b!598483 () Bool)

(assert (=> b!598483 (= e!342096 e!342099)))

(declare-fun res!383548 () Bool)

(assert (=> b!598483 (=> (not res!383548) (not e!342099))))

(declare-fun lt!271883 () SeekEntryResult!6227)

(assert (=> b!598483 (= res!383548 (or (= lt!271883 (MissingZero!6227 i!1108)) (= lt!271883 (MissingVacant!6227 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37055 (_ BitVec 32)) SeekEntryResult!6227)

(assert (=> b!598483 (= lt!271883 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!598484 () Bool)

(assert (=> b!598484 (= e!342100 (arrayContainsKey!0 lt!271889 (select (arr!17787 a!2986) j!136) index!984))))

(assert (= (and start!54820 res!383542) b!598472))

(assert (= (and b!598472 res!383558) b!598473))

(assert (= (and b!598473 res!383556) b!598470))

(assert (= (and b!598470 res!383546) b!598467))

(assert (= (and b!598467 res!383543) b!598483))

(assert (= (and b!598483 res!383548) b!598481))

(assert (= (and b!598481 res!383551) b!598479))

(assert (= (and b!598479 res!383545) b!598478))

(assert (= (and b!598478 res!383544) b!598471))

(assert (= (and b!598471 res!383555) b!598466))

(assert (= (and b!598466 res!383549) b!598476))

(assert (= (and b!598476 res!383554) b!598469))

(assert (= (and b!598476 c!67829) b!598482))

(assert (= (and b!598476 (not c!67829)) b!598468))

(assert (= (and b!598476 (not res!383552)) b!598474))

(assert (= (and b!598474 res!383553) b!598475))

(assert (= (and b!598475 (not res!383557)) b!598477))

(assert (= (and b!598477 res!383547) b!598484))

(assert (= (and b!598474 (not res!383550)) b!598480))

(declare-fun m!575771 () Bool)

(assert (=> b!598471 m!575771))

(declare-fun m!575773 () Bool)

(assert (=> b!598471 m!575773))

(declare-fun m!575775 () Bool)

(assert (=> b!598474 m!575775))

(assert (=> b!598474 m!575771))

(declare-fun m!575777 () Bool)

(assert (=> b!598474 m!575777))

(assert (=> b!598473 m!575775))

(assert (=> b!598473 m!575775))

(declare-fun m!575779 () Bool)

(assert (=> b!598473 m!575779))

(declare-fun m!575781 () Bool)

(assert (=> b!598480 m!575781))

(assert (=> b!598480 m!575775))

(declare-fun m!575783 () Bool)

(assert (=> b!598480 m!575783))

(assert (=> b!598480 m!575775))

(assert (=> b!598480 m!575775))

(declare-fun m!575785 () Bool)

(assert (=> b!598480 m!575785))

(declare-fun m!575787 () Bool)

(assert (=> b!598480 m!575787))

(declare-fun m!575789 () Bool)

(assert (=> b!598470 m!575789))

(declare-fun m!575791 () Bool)

(assert (=> b!598476 m!575791))

(assert (=> b!598476 m!575775))

(assert (=> b!598476 m!575771))

(assert (=> b!598476 m!575775))

(declare-fun m!575793 () Bool)

(assert (=> b!598476 m!575793))

(declare-fun m!575795 () Bool)

(assert (=> b!598476 m!575795))

(declare-fun m!575797 () Bool)

(assert (=> b!598476 m!575797))

(declare-fun m!575799 () Bool)

(assert (=> b!598476 m!575799))

(declare-fun m!575801 () Bool)

(assert (=> b!598476 m!575801))

(declare-fun m!575803 () Bool)

(assert (=> b!598466 m!575803))

(assert (=> b!598466 m!575775))

(assert (=> b!598466 m!575775))

(declare-fun m!575805 () Bool)

(assert (=> b!598466 m!575805))

(assert (=> b!598475 m!575775))

(declare-fun m!575807 () Bool)

(assert (=> b!598467 m!575807))

(assert (=> b!598477 m!575775))

(assert (=> b!598477 m!575775))

(declare-fun m!575809 () Bool)

(assert (=> b!598477 m!575809))

(declare-fun m!575811 () Bool)

(assert (=> b!598481 m!575811))

(declare-fun m!575813 () Bool)

(assert (=> b!598483 m!575813))

(assert (=> b!598484 m!575775))

(assert (=> b!598484 m!575775))

(declare-fun m!575815 () Bool)

(assert (=> b!598484 m!575815))

(declare-fun m!575817 () Bool)

(assert (=> start!54820 m!575817))

(declare-fun m!575819 () Bool)

(assert (=> start!54820 m!575819))

(declare-fun m!575821 () Bool)

(assert (=> b!598478 m!575821))

(declare-fun m!575823 () Bool)

(assert (=> b!598479 m!575823))

(push 1)

