; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54870 () Bool)

(assert start!54870)

(declare-fun res!383652 () Bool)

(declare-fun e!342223 () Bool)

(assert (=> start!54870 (=> (not res!383652) (not e!342223))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54870 (= res!383652 (validMask!0 mask!3053))))

(assert (=> start!54870 e!342223))

(assert (=> start!54870 true))

(declare-datatypes ((array!37050 0))(
  ( (array!37051 (arr!17782 (Array (_ BitVec 32) (_ BitVec 64))) (size!18146 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37050)

(declare-fun array_inv!13641 (array!37050) Bool)

(assert (=> start!54870 (array_inv!13641 a!2986)))

(declare-fun b!598675 () Bool)

(declare-fun e!342226 () Bool)

(declare-datatypes ((SeekEntryResult!6178 0))(
  ( (MissingZero!6178 (index!26969 (_ BitVec 32))) (Found!6178 (index!26970 (_ BitVec 32))) (Intermediate!6178 (undefined!6990 Bool) (index!26971 (_ BitVec 32)) (x!55932 (_ BitVec 32))) (Undefined!6178) (MissingVacant!6178 (index!26972 (_ BitVec 32))) )
))
(declare-fun lt!271983 () SeekEntryResult!6178)

(declare-fun lt!271988 () SeekEntryResult!6178)

(assert (=> b!598675 (= e!342226 (= lt!271983 lt!271988))))

(declare-fun b!598676 () Bool)

(declare-fun res!383655 () Bool)

(declare-fun e!342233 () Bool)

(assert (=> b!598676 (=> (not res!383655) (not e!342233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37050 (_ BitVec 32)) Bool)

(assert (=> b!598676 (= res!383655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598677 () Bool)

(declare-fun e!342225 () Bool)

(declare-fun e!342234 () Bool)

(assert (=> b!598677 (= e!342225 e!342234)))

(declare-fun res!383653 () Bool)

(assert (=> b!598677 (=> (not res!383653) (not e!342234))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!271989 () array!37050)

(declare-fun arrayContainsKey!0 (array!37050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598677 (= res!383653 (arrayContainsKey!0 lt!271989 (select (arr!17782 a!2986) j!136) j!136))))

(declare-fun b!598678 () Bool)

(declare-fun res!383647 () Bool)

(assert (=> b!598678 (=> (not res!383647) (not e!342223))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598678 (= res!383647 (and (= (size!18146 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18146 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18146 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598679 () Bool)

(declare-fun res!383659 () Bool)

(assert (=> b!598679 (=> (not res!383659) (not e!342223))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598679 (= res!383659 (validKeyInArray!0 k0!1786))))

(declare-fun b!598680 () Bool)

(declare-fun res!383661 () Bool)

(assert (=> b!598680 (=> (not res!383661) (not e!342223))))

(assert (=> b!598680 (= res!383661 (validKeyInArray!0 (select (arr!17782 a!2986) j!136)))))

(declare-fun b!598681 () Bool)

(declare-fun e!342228 () Bool)

(assert (=> b!598681 (= e!342233 e!342228)))

(declare-fun res!383646 () Bool)

(assert (=> b!598681 (=> (not res!383646) (not e!342228))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!598681 (= res!383646 (= (select (store (arr!17782 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598681 (= lt!271989 (array!37051 (store (arr!17782 a!2986) i!1108 k0!1786) (size!18146 a!2986)))))

(declare-fun b!598682 () Bool)

(declare-fun res!383650 () Bool)

(assert (=> b!598682 (=> (not res!383650) (not e!342233))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598682 (= res!383650 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17782 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598683 () Bool)

(declare-datatypes ((Unit!18805 0))(
  ( (Unit!18806) )
))
(declare-fun e!342232 () Unit!18805)

(declare-fun Unit!18807 () Unit!18805)

(assert (=> b!598683 (= e!342232 Unit!18807)))

(assert (=> b!598683 false))

(declare-fun b!598684 () Bool)

(declare-fun e!342229 () Bool)

(declare-fun e!342230 () Bool)

(assert (=> b!598684 (= e!342229 e!342230)))

(declare-fun res!383656 () Bool)

(assert (=> b!598684 (=> res!383656 e!342230)))

(declare-fun lt!271991 () (_ BitVec 64))

(declare-fun lt!271992 () (_ BitVec 64))

(assert (=> b!598684 (= res!383656 (or (not (= (select (arr!17782 a!2986) j!136) lt!271992)) (not (= (select (arr!17782 a!2986) j!136) lt!271991)) (bvsge j!136 index!984)))))

(declare-fun e!342227 () Bool)

(assert (=> b!598684 e!342227))

(declare-fun res!383657 () Bool)

(assert (=> b!598684 (=> (not res!383657) (not e!342227))))

(assert (=> b!598684 (= res!383657 (= lt!271991 (select (arr!17782 a!2986) j!136)))))

(assert (=> b!598684 (= lt!271991 (select (store (arr!17782 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598685 () Bool)

(declare-fun res!383662 () Bool)

(assert (=> b!598685 (=> (not res!383662) (not e!342223))))

(assert (=> b!598685 (= res!383662 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598686 () Bool)

(declare-fun res!383651 () Bool)

(assert (=> b!598686 (=> (not res!383651) (not e!342233))))

(declare-datatypes ((List!11730 0))(
  ( (Nil!11727) (Cons!11726 (h!12774 (_ BitVec 64)) (t!17950 List!11730)) )
))
(declare-fun arrayNoDuplicates!0 (array!37050 (_ BitVec 32) List!11730) Bool)

(assert (=> b!598686 (= res!383651 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11727))))

(declare-fun b!598687 () Bool)

(declare-fun Unit!18808 () Unit!18805)

(assert (=> b!598687 (= e!342232 Unit!18808)))

(declare-fun b!598688 () Bool)

(declare-fun e!342231 () Bool)

(assert (=> b!598688 (= e!342231 (not e!342229))))

(declare-fun res!383658 () Bool)

(assert (=> b!598688 (=> res!383658 e!342229)))

(declare-fun lt!271982 () SeekEntryResult!6178)

(assert (=> b!598688 (= res!383658 (not (= lt!271982 (Found!6178 index!984))))))

(declare-fun lt!271990 () Unit!18805)

(assert (=> b!598688 (= lt!271990 e!342232)))

(declare-fun c!67883 () Bool)

(assert (=> b!598688 (= c!67883 (= lt!271982 Undefined!6178))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37050 (_ BitVec 32)) SeekEntryResult!6178)

(assert (=> b!598688 (= lt!271982 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271992 lt!271989 mask!3053))))

(assert (=> b!598688 e!342226))

(declare-fun res!383654 () Bool)

(assert (=> b!598688 (=> (not res!383654) (not e!342226))))

(declare-fun lt!271993 () (_ BitVec 32))

(assert (=> b!598688 (= res!383654 (= lt!271988 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271993 vacantSpotIndex!68 lt!271992 lt!271989 mask!3053)))))

(assert (=> b!598688 (= lt!271988 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271993 vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598688 (= lt!271992 (select (store (arr!17782 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271986 () Unit!18805)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37050 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18805)

(assert (=> b!598688 (= lt!271986 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271993 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598688 (= lt!271993 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!598689 () Bool)

(assert (=> b!598689 (= e!342227 e!342225)))

(declare-fun res!383648 () Bool)

(assert (=> b!598689 (=> res!383648 e!342225)))

(assert (=> b!598689 (= res!383648 (or (not (= (select (arr!17782 a!2986) j!136) lt!271992)) (not (= (select (arr!17782 a!2986) j!136) lt!271991)) (bvsge j!136 index!984)))))

(declare-fun b!598690 () Bool)

(assert (=> b!598690 (= e!342230 true)))

(assert (=> b!598690 (arrayNoDuplicates!0 lt!271989 #b00000000000000000000000000000000 Nil!11727)))

(declare-fun lt!271984 () Unit!18805)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37050 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11730) Unit!18805)

(assert (=> b!598690 (= lt!271984 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11727))))

(assert (=> b!598690 (arrayContainsKey!0 lt!271989 (select (arr!17782 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271985 () Unit!18805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37050 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18805)

(assert (=> b!598690 (= lt!271985 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271989 (select (arr!17782 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598691 () Bool)

(assert (=> b!598691 (= e!342228 e!342231)))

(declare-fun res!383660 () Bool)

(assert (=> b!598691 (=> (not res!383660) (not e!342231))))

(assert (=> b!598691 (= res!383660 (and (= lt!271983 (Found!6178 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17782 a!2986) index!984) (select (arr!17782 a!2986) j!136))) (not (= (select (arr!17782 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598691 (= lt!271983 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598692 () Bool)

(assert (=> b!598692 (= e!342234 (arrayContainsKey!0 lt!271989 (select (arr!17782 a!2986) j!136) index!984))))

(declare-fun b!598693 () Bool)

(assert (=> b!598693 (= e!342223 e!342233)))

(declare-fun res!383649 () Bool)

(assert (=> b!598693 (=> (not res!383649) (not e!342233))))

(declare-fun lt!271987 () SeekEntryResult!6178)

(assert (=> b!598693 (= res!383649 (or (= lt!271987 (MissingZero!6178 i!1108)) (= lt!271987 (MissingVacant!6178 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37050 (_ BitVec 32)) SeekEntryResult!6178)

(assert (=> b!598693 (= lt!271987 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!54870 res!383652) b!598678))

(assert (= (and b!598678 res!383647) b!598680))

(assert (= (and b!598680 res!383661) b!598679))

(assert (= (and b!598679 res!383659) b!598685))

(assert (= (and b!598685 res!383662) b!598693))

(assert (= (and b!598693 res!383649) b!598676))

(assert (= (and b!598676 res!383655) b!598686))

(assert (= (and b!598686 res!383651) b!598682))

(assert (= (and b!598682 res!383650) b!598681))

(assert (= (and b!598681 res!383646) b!598691))

(assert (= (and b!598691 res!383660) b!598688))

(assert (= (and b!598688 res!383654) b!598675))

(assert (= (and b!598688 c!67883) b!598683))

(assert (= (and b!598688 (not c!67883)) b!598687))

(assert (= (and b!598688 (not res!383658)) b!598684))

(assert (= (and b!598684 res!383657) b!598689))

(assert (= (and b!598689 (not res!383648)) b!598677))

(assert (= (and b!598677 res!383653) b!598692))

(assert (= (and b!598684 (not res!383656)) b!598690))

(declare-fun m!576203 () Bool)

(assert (=> b!598676 m!576203))

(declare-fun m!576205 () Bool)

(assert (=> b!598691 m!576205))

(declare-fun m!576207 () Bool)

(assert (=> b!598691 m!576207))

(assert (=> b!598691 m!576207))

(declare-fun m!576209 () Bool)

(assert (=> b!598691 m!576209))

(declare-fun m!576211 () Bool)

(assert (=> start!54870 m!576211))

(declare-fun m!576213 () Bool)

(assert (=> start!54870 m!576213))

(assert (=> b!598690 m!576207))

(declare-fun m!576215 () Bool)

(assert (=> b!598690 m!576215))

(assert (=> b!598690 m!576207))

(declare-fun m!576217 () Bool)

(assert (=> b!598690 m!576217))

(assert (=> b!598690 m!576207))

(declare-fun m!576219 () Bool)

(assert (=> b!598690 m!576219))

(declare-fun m!576221 () Bool)

(assert (=> b!598690 m!576221))

(declare-fun m!576223 () Bool)

(assert (=> b!598679 m!576223))

(declare-fun m!576225 () Bool)

(assert (=> b!598681 m!576225))

(declare-fun m!576227 () Bool)

(assert (=> b!598681 m!576227))

(declare-fun m!576229 () Bool)

(assert (=> b!598693 m!576229))

(assert (=> b!598692 m!576207))

(assert (=> b!598692 m!576207))

(declare-fun m!576231 () Bool)

(assert (=> b!598692 m!576231))

(assert (=> b!598684 m!576207))

(assert (=> b!598684 m!576225))

(declare-fun m!576233 () Bool)

(assert (=> b!598684 m!576233))

(declare-fun m!576235 () Bool)

(assert (=> b!598686 m!576235))

(declare-fun m!576237 () Bool)

(assert (=> b!598685 m!576237))

(assert (=> b!598680 m!576207))

(assert (=> b!598680 m!576207))

(declare-fun m!576239 () Bool)

(assert (=> b!598680 m!576239))

(assert (=> b!598689 m!576207))

(declare-fun m!576241 () Bool)

(assert (=> b!598682 m!576241))

(assert (=> b!598677 m!576207))

(assert (=> b!598677 m!576207))

(declare-fun m!576243 () Bool)

(assert (=> b!598677 m!576243))

(declare-fun m!576245 () Bool)

(assert (=> b!598688 m!576245))

(declare-fun m!576247 () Bool)

(assert (=> b!598688 m!576247))

(assert (=> b!598688 m!576207))

(assert (=> b!598688 m!576207))

(declare-fun m!576249 () Bool)

(assert (=> b!598688 m!576249))

(declare-fun m!576251 () Bool)

(assert (=> b!598688 m!576251))

(declare-fun m!576253 () Bool)

(assert (=> b!598688 m!576253))

(assert (=> b!598688 m!576225))

(declare-fun m!576255 () Bool)

(assert (=> b!598688 m!576255))

(check-sat (not b!598679) (not b!598686) (not b!598690) (not b!598693) (not b!598692) (not b!598680) (not b!598685) (not b!598676) (not b!598691) (not b!598677) (not start!54870) (not b!598688))
(check-sat)
