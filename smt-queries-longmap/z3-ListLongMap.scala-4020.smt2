; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54876 () Bool)

(assert start!54876)

(declare-fun b!598846 () Bool)

(declare-fun res!383810 () Bool)

(declare-fun e!342334 () Bool)

(assert (=> b!598846 (=> (not res!383810) (not e!342334))))

(declare-datatypes ((array!37056 0))(
  ( (array!37057 (arr!17785 (Array (_ BitVec 32) (_ BitVec 64))) (size!18149 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37056)

(declare-datatypes ((List!11733 0))(
  ( (Nil!11730) (Cons!11729 (h!12777 (_ BitVec 64)) (t!17953 List!11733)) )
))
(declare-fun arrayNoDuplicates!0 (array!37056 (_ BitVec 32) List!11733) Bool)

(assert (=> b!598846 (= res!383810 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11730))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!342335 () Bool)

(declare-fun b!598847 () Bool)

(declare-fun lt!272097 () array!37056)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598847 (= e!342335 (arrayContainsKey!0 lt!272097 (select (arr!17785 a!2986) j!136) index!984))))

(declare-fun b!598848 () Bool)

(declare-fun e!342340 () Bool)

(assert (=> b!598848 (= e!342340 e!342335)))

(declare-fun res!383813 () Bool)

(assert (=> b!598848 (=> (not res!383813) (not e!342335))))

(assert (=> b!598848 (= res!383813 (arrayContainsKey!0 lt!272097 (select (arr!17785 a!2986) j!136) j!136))))

(declare-fun b!598849 () Bool)

(declare-datatypes ((Unit!18817 0))(
  ( (Unit!18818) )
))
(declare-fun e!342338 () Unit!18817)

(declare-fun Unit!18819 () Unit!18817)

(assert (=> b!598849 (= e!342338 Unit!18819)))

(assert (=> b!598849 false))

(declare-fun b!598850 () Bool)

(declare-fun e!342333 () Bool)

(assert (=> b!598850 (= e!342333 e!342334)))

(declare-fun res!383805 () Bool)

(assert (=> b!598850 (=> (not res!383805) (not e!342334))))

(declare-datatypes ((SeekEntryResult!6181 0))(
  ( (MissingZero!6181 (index!26981 (_ BitVec 32))) (Found!6181 (index!26982 (_ BitVec 32))) (Intermediate!6181 (undefined!6993 Bool) (index!26983 (_ BitVec 32)) (x!55943 (_ BitVec 32))) (Undefined!6181) (MissingVacant!6181 (index!26984 (_ BitVec 32))) )
))
(declare-fun lt!272095 () SeekEntryResult!6181)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598850 (= res!383805 (or (= lt!272095 (MissingZero!6181 i!1108)) (= lt!272095 (MissingVacant!6181 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37056 (_ BitVec 32)) SeekEntryResult!6181)

(assert (=> b!598850 (= lt!272095 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598851 () Bool)

(declare-fun res!383799 () Bool)

(assert (=> b!598851 (=> (not res!383799) (not e!342333))))

(assert (=> b!598851 (= res!383799 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598852 () Bool)

(declare-fun e!342341 () Bool)

(declare-fun e!342337 () Bool)

(assert (=> b!598852 (= e!342341 e!342337)))

(declare-fun res!383812 () Bool)

(assert (=> b!598852 (=> res!383812 e!342337)))

(declare-fun lt!272101 () (_ BitVec 64))

(declare-fun lt!272098 () (_ BitVec 64))

(assert (=> b!598852 (= res!383812 (or (not (= (select (arr!17785 a!2986) j!136) lt!272101)) (not (= (select (arr!17785 a!2986) j!136) lt!272098)) (bvsge j!136 index!984)))))

(declare-fun e!342331 () Bool)

(assert (=> b!598852 e!342331))

(declare-fun res!383811 () Bool)

(assert (=> b!598852 (=> (not res!383811) (not e!342331))))

(assert (=> b!598852 (= res!383811 (= lt!272098 (select (arr!17785 a!2986) j!136)))))

(assert (=> b!598852 (= lt!272098 (select (store (arr!17785 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598853 () Bool)

(declare-fun res!383804 () Bool)

(assert (=> b!598853 (=> (not res!383804) (not e!342333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598853 (= res!383804 (validKeyInArray!0 k0!1786))))

(declare-fun res!383800 () Bool)

(assert (=> start!54876 (=> (not res!383800) (not e!342333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54876 (= res!383800 (validMask!0 mask!3053))))

(assert (=> start!54876 e!342333))

(assert (=> start!54876 true))

(declare-fun array_inv!13644 (array!37056) Bool)

(assert (=> start!54876 (array_inv!13644 a!2986)))

(declare-fun b!598854 () Bool)

(declare-fun e!342336 () Bool)

(declare-fun lt!272094 () SeekEntryResult!6181)

(declare-fun lt!272100 () SeekEntryResult!6181)

(assert (=> b!598854 (= e!342336 (= lt!272094 lt!272100))))

(declare-fun b!598855 () Bool)

(declare-fun e!342339 () Bool)

(assert (=> b!598855 (= e!342339 (not e!342341))))

(declare-fun res!383803 () Bool)

(assert (=> b!598855 (=> res!383803 e!342341)))

(declare-fun lt!272090 () SeekEntryResult!6181)

(assert (=> b!598855 (= res!383803 (not (= lt!272090 (Found!6181 index!984))))))

(declare-fun lt!272091 () Unit!18817)

(assert (=> b!598855 (= lt!272091 e!342338)))

(declare-fun c!67892 () Bool)

(assert (=> b!598855 (= c!67892 (= lt!272090 Undefined!6181))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37056 (_ BitVec 32)) SeekEntryResult!6181)

(assert (=> b!598855 (= lt!272090 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272101 lt!272097 mask!3053))))

(assert (=> b!598855 e!342336))

(declare-fun res!383815 () Bool)

(assert (=> b!598855 (=> (not res!383815) (not e!342336))))

(declare-fun lt!272099 () (_ BitVec 32))

(assert (=> b!598855 (= res!383815 (= lt!272100 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272099 vacantSpotIndex!68 lt!272101 lt!272097 mask!3053)))))

(assert (=> b!598855 (= lt!272100 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272099 vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598855 (= lt!272101 (select (store (arr!17785 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272093 () Unit!18817)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37056 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18817)

(assert (=> b!598855 (= lt!272093 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272099 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598855 (= lt!272099 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!598856 () Bool)

(declare-fun res!383801 () Bool)

(assert (=> b!598856 (=> (not res!383801) (not e!342334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37056 (_ BitVec 32)) Bool)

(assert (=> b!598856 (= res!383801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598857 () Bool)

(assert (=> b!598857 (= e!342337 true)))

(assert (=> b!598857 (arrayNoDuplicates!0 lt!272097 #b00000000000000000000000000000000 Nil!11730)))

(declare-fun lt!272096 () Unit!18817)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37056 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11733) Unit!18817)

(assert (=> b!598857 (= lt!272096 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11730))))

(assert (=> b!598857 (arrayContainsKey!0 lt!272097 (select (arr!17785 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272092 () Unit!18817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37056 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18817)

(assert (=> b!598857 (= lt!272092 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272097 (select (arr!17785 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598858 () Bool)

(declare-fun e!342342 () Bool)

(assert (=> b!598858 (= e!342342 e!342339)))

(declare-fun res!383807 () Bool)

(assert (=> b!598858 (=> (not res!383807) (not e!342339))))

(assert (=> b!598858 (= res!383807 (and (= lt!272094 (Found!6181 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17785 a!2986) index!984) (select (arr!17785 a!2986) j!136))) (not (= (select (arr!17785 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598858 (= lt!272094 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598859 () Bool)

(declare-fun Unit!18820 () Unit!18817)

(assert (=> b!598859 (= e!342338 Unit!18820)))

(declare-fun b!598860 () Bool)

(declare-fun res!383808 () Bool)

(assert (=> b!598860 (=> (not res!383808) (not e!342334))))

(assert (=> b!598860 (= res!383808 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17785 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598861 () Bool)

(declare-fun res!383809 () Bool)

(assert (=> b!598861 (=> (not res!383809) (not e!342333))))

(assert (=> b!598861 (= res!383809 (and (= (size!18149 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18149 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18149 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598862 () Bool)

(declare-fun res!383802 () Bool)

(assert (=> b!598862 (=> (not res!383802) (not e!342333))))

(assert (=> b!598862 (= res!383802 (validKeyInArray!0 (select (arr!17785 a!2986) j!136)))))

(declare-fun b!598863 () Bool)

(assert (=> b!598863 (= e!342334 e!342342)))

(declare-fun res!383806 () Bool)

(assert (=> b!598863 (=> (not res!383806) (not e!342342))))

(assert (=> b!598863 (= res!383806 (= (select (store (arr!17785 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598863 (= lt!272097 (array!37057 (store (arr!17785 a!2986) i!1108 k0!1786) (size!18149 a!2986)))))

(declare-fun b!598864 () Bool)

(assert (=> b!598864 (= e!342331 e!342340)))

(declare-fun res!383814 () Bool)

(assert (=> b!598864 (=> res!383814 e!342340)))

(assert (=> b!598864 (= res!383814 (or (not (= (select (arr!17785 a!2986) j!136) lt!272101)) (not (= (select (arr!17785 a!2986) j!136) lt!272098)) (bvsge j!136 index!984)))))

(assert (= (and start!54876 res!383800) b!598861))

(assert (= (and b!598861 res!383809) b!598862))

(assert (= (and b!598862 res!383802) b!598853))

(assert (= (and b!598853 res!383804) b!598851))

(assert (= (and b!598851 res!383799) b!598850))

(assert (= (and b!598850 res!383805) b!598856))

(assert (= (and b!598856 res!383801) b!598846))

(assert (= (and b!598846 res!383810) b!598860))

(assert (= (and b!598860 res!383808) b!598863))

(assert (= (and b!598863 res!383806) b!598858))

(assert (= (and b!598858 res!383807) b!598855))

(assert (= (and b!598855 res!383815) b!598854))

(assert (= (and b!598855 c!67892) b!598849))

(assert (= (and b!598855 (not c!67892)) b!598859))

(assert (= (and b!598855 (not res!383803)) b!598852))

(assert (= (and b!598852 res!383811) b!598864))

(assert (= (and b!598864 (not res!383814)) b!598848))

(assert (= (and b!598848 res!383813) b!598847))

(assert (= (and b!598852 (not res!383812)) b!598857))

(declare-fun m!576365 () Bool)

(assert (=> b!598846 m!576365))

(declare-fun m!576367 () Bool)

(assert (=> start!54876 m!576367))

(declare-fun m!576369 () Bool)

(assert (=> start!54876 m!576369))

(declare-fun m!576371 () Bool)

(assert (=> b!598858 m!576371))

(declare-fun m!576373 () Bool)

(assert (=> b!598858 m!576373))

(assert (=> b!598858 m!576373))

(declare-fun m!576375 () Bool)

(assert (=> b!598858 m!576375))

(assert (=> b!598857 m!576373))

(assert (=> b!598857 m!576373))

(declare-fun m!576377 () Bool)

(assert (=> b!598857 m!576377))

(declare-fun m!576379 () Bool)

(assert (=> b!598857 m!576379))

(assert (=> b!598857 m!576373))

(declare-fun m!576381 () Bool)

(assert (=> b!598857 m!576381))

(declare-fun m!576383 () Bool)

(assert (=> b!598857 m!576383))

(assert (=> b!598864 m!576373))

(declare-fun m!576385 () Bool)

(assert (=> b!598851 m!576385))

(declare-fun m!576387 () Bool)

(assert (=> b!598860 m!576387))

(declare-fun m!576389 () Bool)

(assert (=> b!598856 m!576389))

(declare-fun m!576391 () Bool)

(assert (=> b!598850 m!576391))

(declare-fun m!576393 () Bool)

(assert (=> b!598855 m!576393))

(declare-fun m!576395 () Bool)

(assert (=> b!598855 m!576395))

(declare-fun m!576397 () Bool)

(assert (=> b!598855 m!576397))

(declare-fun m!576399 () Bool)

(assert (=> b!598855 m!576399))

(assert (=> b!598855 m!576373))

(declare-fun m!576401 () Bool)

(assert (=> b!598855 m!576401))

(declare-fun m!576403 () Bool)

(assert (=> b!598855 m!576403))

(assert (=> b!598855 m!576373))

(declare-fun m!576405 () Bool)

(assert (=> b!598855 m!576405))

(assert (=> b!598863 m!576401))

(declare-fun m!576407 () Bool)

(assert (=> b!598863 m!576407))

(assert (=> b!598848 m!576373))

(assert (=> b!598848 m!576373))

(declare-fun m!576409 () Bool)

(assert (=> b!598848 m!576409))

(assert (=> b!598847 m!576373))

(assert (=> b!598847 m!576373))

(declare-fun m!576411 () Bool)

(assert (=> b!598847 m!576411))

(assert (=> b!598862 m!576373))

(assert (=> b!598862 m!576373))

(declare-fun m!576413 () Bool)

(assert (=> b!598862 m!576413))

(declare-fun m!576415 () Bool)

(assert (=> b!598853 m!576415))

(assert (=> b!598852 m!576373))

(assert (=> b!598852 m!576401))

(declare-fun m!576417 () Bool)

(assert (=> b!598852 m!576417))

(check-sat (not b!598848) (not b!598862) (not b!598856) (not b!598846) (not b!598850) (not b!598855) (not b!598857) (not b!598853) (not b!598858) (not b!598847) (not b!598851) (not start!54876))
(check-sat)
