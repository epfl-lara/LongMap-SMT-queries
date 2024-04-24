; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58920 () Bool)

(assert start!58920)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38520 0))(
  ( (array!38521 (arr!18463 (Array (_ BitVec 32) (_ BitVec 64))) (size!18827 (_ BitVec 32))) )
))
(declare-fun lt!301339 () array!38520)

(declare-fun e!372319 () Bool)

(declare-fun b!649115 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38520)

(declare-fun arrayContainsKey!0 (array!38520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649115 (= e!372319 (arrayContainsKey!0 lt!301339 (select (arr!18463 a!2986) j!136) index!984))))

(declare-fun b!649116 () Bool)

(declare-fun res!420598 () Bool)

(declare-fun e!372327 () Bool)

(assert (=> b!649116 (=> (not res!420598) (not e!372327))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649116 (= res!420598 (validKeyInArray!0 k0!1786))))

(declare-fun b!649117 () Bool)

(declare-fun res!420582 () Bool)

(declare-fun e!372325 () Bool)

(assert (=> b!649117 (=> (not res!420582) (not e!372325))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649117 (= res!420582 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18463 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649118 () Bool)

(declare-fun res!420596 () Bool)

(assert (=> b!649118 (=> (not res!420596) (not e!372325))))

(declare-datatypes ((List!12411 0))(
  ( (Nil!12408) (Cons!12407 (h!13455 (_ BitVec 64)) (t!18631 List!12411)) )
))
(declare-fun arrayNoDuplicates!0 (array!38520 (_ BitVec 32) List!12411) Bool)

(assert (=> b!649118 (= res!420596 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12408))))

(declare-fun b!649119 () Bool)

(declare-fun e!372326 () Bool)

(assert (=> b!649119 (= e!372326 true)))

(declare-fun lt!301335 () Bool)

(declare-fun contains!3143 (List!12411 (_ BitVec 64)) Bool)

(assert (=> b!649119 (= lt!301335 (contains!3143 Nil!12408 k0!1786))))

(declare-fun b!649120 () Bool)

(declare-datatypes ((Unit!22053 0))(
  ( (Unit!22054) )
))
(declare-fun e!372316 () Unit!22053)

(declare-fun Unit!22055 () Unit!22053)

(assert (=> b!649120 (= e!372316 Unit!22055)))

(declare-fun e!372317 () Bool)

(declare-fun b!649121 () Bool)

(assert (=> b!649121 (= e!372317 (arrayContainsKey!0 lt!301339 (select (arr!18463 a!2986) j!136) index!984))))

(declare-fun b!649122 () Bool)

(declare-fun e!372323 () Bool)

(assert (=> b!649122 (= e!372323 e!372317)))

(declare-fun res!420604 () Bool)

(assert (=> b!649122 (=> (not res!420604) (not e!372317))))

(assert (=> b!649122 (= res!420604 (arrayContainsKey!0 lt!301339 (select (arr!18463 a!2986) j!136) j!136))))

(declare-fun b!649123 () Bool)

(declare-fun res!420602 () Bool)

(assert (=> b!649123 (=> (not res!420602) (not e!372327))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!649123 (= res!420602 (and (= (size!18827 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18827 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18827 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649124 () Bool)

(declare-fun res!420588 () Bool)

(assert (=> b!649124 (=> (not res!420588) (not e!372327))))

(assert (=> b!649124 (= res!420588 (validKeyInArray!0 (select (arr!18463 a!2986) j!136)))))

(declare-fun b!649125 () Bool)

(declare-fun e!372329 () Bool)

(declare-fun e!372315 () Bool)

(assert (=> b!649125 (= e!372329 e!372315)))

(declare-fun res!420593 () Bool)

(assert (=> b!649125 (=> (not res!420593) (not e!372315))))

(declare-datatypes ((SeekEntryResult!6859 0))(
  ( (MissingZero!6859 (index!29783 (_ BitVec 32))) (Found!6859 (index!29784 (_ BitVec 32))) (Intermediate!6859 (undefined!7671 Bool) (index!29785 (_ BitVec 32)) (x!58723 (_ BitVec 32))) (Undefined!6859) (MissingVacant!6859 (index!29786 (_ BitVec 32))) )
))
(declare-fun lt!301331 () SeekEntryResult!6859)

(assert (=> b!649125 (= res!420593 (and (= lt!301331 (Found!6859 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18463 a!2986) index!984) (select (arr!18463 a!2986) j!136))) (not (= (select (arr!18463 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38520 (_ BitVec 32)) SeekEntryResult!6859)

(assert (=> b!649125 (= lt!301331 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18463 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649126 () Bool)

(declare-fun res!420597 () Bool)

(assert (=> b!649126 (=> res!420597 e!372326)))

(declare-fun noDuplicate!430 (List!12411) Bool)

(assert (=> b!649126 (= res!420597 (not (noDuplicate!430 Nil!12408)))))

(declare-fun b!649127 () Bool)

(declare-fun e!372318 () Unit!22053)

(declare-fun Unit!22056 () Unit!22053)

(assert (=> b!649127 (= e!372318 Unit!22056)))

(declare-fun res!420601 () Bool)

(assert (=> start!58920 (=> (not res!420601) (not e!372327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58920 (= res!420601 (validMask!0 mask!3053))))

(assert (=> start!58920 e!372327))

(assert (=> start!58920 true))

(declare-fun array_inv!14322 (array!38520) Bool)

(assert (=> start!58920 (array_inv!14322 a!2986)))

(declare-fun b!649128 () Bool)

(declare-fun e!372320 () Bool)

(assert (=> b!649128 (= e!372315 (not e!372320))))

(declare-fun res!420600 () Bool)

(assert (=> b!649128 (=> res!420600 e!372320)))

(declare-fun lt!301327 () SeekEntryResult!6859)

(assert (=> b!649128 (= res!420600 (not (= lt!301327 (Found!6859 index!984))))))

(declare-fun lt!301328 () Unit!22053)

(assert (=> b!649128 (= lt!301328 e!372316)))

(declare-fun c!74635 () Bool)

(assert (=> b!649128 (= c!74635 (= lt!301327 Undefined!6859))))

(declare-fun lt!301330 () (_ BitVec 64))

(assert (=> b!649128 (= lt!301327 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301330 lt!301339 mask!3053))))

(declare-fun e!372328 () Bool)

(assert (=> b!649128 e!372328))

(declare-fun res!420594 () Bool)

(assert (=> b!649128 (=> (not res!420594) (not e!372328))))

(declare-fun lt!301332 () SeekEntryResult!6859)

(declare-fun lt!301337 () (_ BitVec 32))

(assert (=> b!649128 (= res!420594 (= lt!301332 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301337 vacantSpotIndex!68 lt!301330 lt!301339 mask!3053)))))

(assert (=> b!649128 (= lt!301332 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301337 vacantSpotIndex!68 (select (arr!18463 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649128 (= lt!301330 (select (store (arr!18463 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301336 () Unit!22053)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38520 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22053)

(assert (=> b!649128 (= lt!301336 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301337 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649128 (= lt!301337 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!649129 () Bool)

(declare-fun e!372321 () Bool)

(assert (=> b!649129 (= e!372321 e!372326)))

(declare-fun res!420589 () Bool)

(assert (=> b!649129 (=> res!420589 e!372326)))

(assert (=> b!649129 (= res!420589 (or (bvsge (size!18827 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18827 a!2986))))))

(assert (=> b!649129 (arrayContainsKey!0 lt!301339 (select (arr!18463 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301329 () Unit!22053)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22053)

(assert (=> b!649129 (= lt!301329 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301339 (select (arr!18463 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649129 e!372319))

(declare-fun res!420592 () Bool)

(assert (=> b!649129 (=> (not res!420592) (not e!372319))))

(assert (=> b!649129 (= res!420592 (arrayContainsKey!0 lt!301339 (select (arr!18463 a!2986) j!136) j!136))))

(declare-fun b!649130 () Bool)

(declare-fun res!420584 () Bool)

(assert (=> b!649130 (=> res!420584 e!372326)))

(assert (=> b!649130 (= res!420584 (contains!3143 Nil!12408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649131 () Bool)

(declare-fun res!420583 () Bool)

(assert (=> b!649131 (=> (not res!420583) (not e!372327))))

(assert (=> b!649131 (= res!420583 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649132 () Bool)

(declare-fun Unit!22057 () Unit!22053)

(assert (=> b!649132 (= e!372318 Unit!22057)))

(declare-fun lt!301340 () Unit!22053)

(assert (=> b!649132 (= lt!301340 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301339 (select (arr!18463 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649132 (arrayContainsKey!0 lt!301339 (select (arr!18463 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301333 () Unit!22053)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12411) Unit!22053)

(assert (=> b!649132 (= lt!301333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12408))))

(assert (=> b!649132 (arrayNoDuplicates!0 lt!301339 #b00000000000000000000000000000000 Nil!12408)))

(declare-fun lt!301341 () Unit!22053)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38520 (_ BitVec 32) (_ BitVec 32)) Unit!22053)

(assert (=> b!649132 (= lt!301341 (lemmaNoDuplicateFromThenFromBigger!0 lt!301339 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649132 (arrayNoDuplicates!0 lt!301339 j!136 Nil!12408)))

(declare-fun lt!301342 () Unit!22053)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38520 (_ BitVec 64) (_ BitVec 32) List!12411) Unit!22053)

(assert (=> b!649132 (= lt!301342 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301339 (select (arr!18463 a!2986) j!136) j!136 Nil!12408))))

(assert (=> b!649132 false))

(declare-fun b!649133 () Bool)

(assert (=> b!649133 (= e!372328 (= lt!301331 lt!301332))))

(declare-fun b!649134 () Bool)

(declare-fun res!420586 () Bool)

(assert (=> b!649134 (=> (not res!420586) (not e!372325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38520 (_ BitVec 32)) Bool)

(assert (=> b!649134 (= res!420586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649135 () Bool)

(declare-fun res!420599 () Bool)

(assert (=> b!649135 (=> res!420599 e!372326)))

(assert (=> b!649135 (= res!420599 (contains!3143 Nil!12408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649136 () Bool)

(declare-fun Unit!22058 () Unit!22053)

(assert (=> b!649136 (= e!372316 Unit!22058)))

(assert (=> b!649136 false))

(declare-fun b!649137 () Bool)

(declare-fun e!372324 () Bool)

(assert (=> b!649137 (= e!372324 e!372323)))

(declare-fun res!420595 () Bool)

(assert (=> b!649137 (=> res!420595 e!372323)))

(declare-fun lt!301338 () (_ BitVec 64))

(assert (=> b!649137 (= res!420595 (or (not (= (select (arr!18463 a!2986) j!136) lt!301330)) (not (= (select (arr!18463 a!2986) j!136) lt!301338)) (bvsge j!136 index!984)))))

(declare-fun b!649138 () Bool)

(declare-fun e!372322 () Bool)

(assert (=> b!649138 (= e!372322 e!372321)))

(declare-fun res!420590 () Bool)

(assert (=> b!649138 (=> res!420590 e!372321)))

(assert (=> b!649138 (= res!420590 (bvsge index!984 j!136))))

(declare-fun lt!301326 () Unit!22053)

(assert (=> b!649138 (= lt!301326 e!372318)))

(declare-fun c!74636 () Bool)

(assert (=> b!649138 (= c!74636 (bvslt j!136 index!984))))

(declare-fun b!649139 () Bool)

(assert (=> b!649139 (= e!372327 e!372325)))

(declare-fun res!420585 () Bool)

(assert (=> b!649139 (=> (not res!420585) (not e!372325))))

(declare-fun lt!301334 () SeekEntryResult!6859)

(assert (=> b!649139 (= res!420585 (or (= lt!301334 (MissingZero!6859 i!1108)) (= lt!301334 (MissingVacant!6859 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38520 (_ BitVec 32)) SeekEntryResult!6859)

(assert (=> b!649139 (= lt!301334 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649140 () Bool)

(assert (=> b!649140 (= e!372325 e!372329)))

(declare-fun res!420603 () Bool)

(assert (=> b!649140 (=> (not res!420603) (not e!372329))))

(assert (=> b!649140 (= res!420603 (= (select (store (arr!18463 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649140 (= lt!301339 (array!38521 (store (arr!18463 a!2986) i!1108 k0!1786) (size!18827 a!2986)))))

(declare-fun b!649141 () Bool)

(assert (=> b!649141 (= e!372320 e!372322)))

(declare-fun res!420587 () Bool)

(assert (=> b!649141 (=> res!420587 e!372322)))

(assert (=> b!649141 (= res!420587 (or (not (= (select (arr!18463 a!2986) j!136) lt!301330)) (not (= (select (arr!18463 a!2986) j!136) lt!301338))))))

(assert (=> b!649141 e!372324))

(declare-fun res!420591 () Bool)

(assert (=> b!649141 (=> (not res!420591) (not e!372324))))

(assert (=> b!649141 (= res!420591 (= lt!301338 (select (arr!18463 a!2986) j!136)))))

(assert (=> b!649141 (= lt!301338 (select (store (arr!18463 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!58920 res!420601) b!649123))

(assert (= (and b!649123 res!420602) b!649124))

(assert (= (and b!649124 res!420588) b!649116))

(assert (= (and b!649116 res!420598) b!649131))

(assert (= (and b!649131 res!420583) b!649139))

(assert (= (and b!649139 res!420585) b!649134))

(assert (= (and b!649134 res!420586) b!649118))

(assert (= (and b!649118 res!420596) b!649117))

(assert (= (and b!649117 res!420582) b!649140))

(assert (= (and b!649140 res!420603) b!649125))

(assert (= (and b!649125 res!420593) b!649128))

(assert (= (and b!649128 res!420594) b!649133))

(assert (= (and b!649128 c!74635) b!649136))

(assert (= (and b!649128 (not c!74635)) b!649120))

(assert (= (and b!649128 (not res!420600)) b!649141))

(assert (= (and b!649141 res!420591) b!649137))

(assert (= (and b!649137 (not res!420595)) b!649122))

(assert (= (and b!649122 res!420604) b!649121))

(assert (= (and b!649141 (not res!420587)) b!649138))

(assert (= (and b!649138 c!74636) b!649132))

(assert (= (and b!649138 (not c!74636)) b!649127))

(assert (= (and b!649138 (not res!420590)) b!649129))

(assert (= (and b!649129 res!420592) b!649115))

(assert (= (and b!649129 (not res!420589)) b!649126))

(assert (= (and b!649126 (not res!420597)) b!649135))

(assert (= (and b!649135 (not res!420599)) b!649130))

(assert (= (and b!649130 (not res!420584)) b!649119))

(declare-fun m!622861 () Bool)

(assert (=> start!58920 m!622861))

(declare-fun m!622863 () Bool)

(assert (=> start!58920 m!622863))

(declare-fun m!622865 () Bool)

(assert (=> b!649118 m!622865))

(declare-fun m!622867 () Bool)

(assert (=> b!649131 m!622867))

(declare-fun m!622869 () Bool)

(assert (=> b!649125 m!622869))

(declare-fun m!622871 () Bool)

(assert (=> b!649125 m!622871))

(assert (=> b!649125 m!622871))

(declare-fun m!622873 () Bool)

(assert (=> b!649125 m!622873))

(declare-fun m!622875 () Bool)

(assert (=> b!649128 m!622875))

(declare-fun m!622877 () Bool)

(assert (=> b!649128 m!622877))

(assert (=> b!649128 m!622871))

(declare-fun m!622879 () Bool)

(assert (=> b!649128 m!622879))

(assert (=> b!649128 m!622871))

(declare-fun m!622881 () Bool)

(assert (=> b!649128 m!622881))

(declare-fun m!622883 () Bool)

(assert (=> b!649128 m!622883))

(declare-fun m!622885 () Bool)

(assert (=> b!649128 m!622885))

(declare-fun m!622887 () Bool)

(assert (=> b!649128 m!622887))

(assert (=> b!649129 m!622871))

(assert (=> b!649129 m!622871))

(declare-fun m!622889 () Bool)

(assert (=> b!649129 m!622889))

(assert (=> b!649129 m!622871))

(declare-fun m!622891 () Bool)

(assert (=> b!649129 m!622891))

(assert (=> b!649129 m!622871))

(declare-fun m!622893 () Bool)

(assert (=> b!649129 m!622893))

(declare-fun m!622895 () Bool)

(assert (=> b!649139 m!622895))

(declare-fun m!622897 () Bool)

(assert (=> b!649126 m!622897))

(declare-fun m!622899 () Bool)

(assert (=> b!649130 m!622899))

(assert (=> b!649122 m!622871))

(assert (=> b!649122 m!622871))

(assert (=> b!649122 m!622893))

(assert (=> b!649140 m!622885))

(declare-fun m!622901 () Bool)

(assert (=> b!649140 m!622901))

(declare-fun m!622903 () Bool)

(assert (=> b!649117 m!622903))

(declare-fun m!622905 () Bool)

(assert (=> b!649134 m!622905))

(assert (=> b!649121 m!622871))

(assert (=> b!649121 m!622871))

(declare-fun m!622907 () Bool)

(assert (=> b!649121 m!622907))

(assert (=> b!649141 m!622871))

(assert (=> b!649141 m!622885))

(declare-fun m!622909 () Bool)

(assert (=> b!649141 m!622909))

(assert (=> b!649137 m!622871))

(declare-fun m!622911 () Bool)

(assert (=> b!649135 m!622911))

(assert (=> b!649132 m!622871))

(declare-fun m!622913 () Bool)

(assert (=> b!649132 m!622913))

(assert (=> b!649132 m!622871))

(declare-fun m!622915 () Bool)

(assert (=> b!649132 m!622915))

(declare-fun m!622917 () Bool)

(assert (=> b!649132 m!622917))

(declare-fun m!622919 () Bool)

(assert (=> b!649132 m!622919))

(assert (=> b!649132 m!622871))

(declare-fun m!622921 () Bool)

(assert (=> b!649132 m!622921))

(assert (=> b!649132 m!622871))

(declare-fun m!622923 () Bool)

(assert (=> b!649132 m!622923))

(declare-fun m!622925 () Bool)

(assert (=> b!649132 m!622925))

(assert (=> b!649124 m!622871))

(assert (=> b!649124 m!622871))

(declare-fun m!622927 () Bool)

(assert (=> b!649124 m!622927))

(declare-fun m!622929 () Bool)

(assert (=> b!649119 m!622929))

(assert (=> b!649115 m!622871))

(assert (=> b!649115 m!622871))

(assert (=> b!649115 m!622907))

(declare-fun m!622931 () Bool)

(assert (=> b!649116 m!622931))

(check-sat (not b!649131) (not b!649121) (not start!58920) (not b!649128) (not b!649130) (not b!649122) (not b!649124) (not b!649115) (not b!649126) (not b!649129) (not b!649116) (not b!649119) (not b!649139) (not b!649135) (not b!649118) (not b!649125) (not b!649132) (not b!649134))
(check-sat)
