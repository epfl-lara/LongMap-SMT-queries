; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55632 () Bool)

(assert start!55632)

(declare-fun b!608963 () Bool)

(declare-fun res!391482 () Bool)

(declare-fun e!348771 () Bool)

(assert (=> b!608963 (=> res!391482 e!348771)))

(declare-datatypes ((List!11850 0))(
  ( (Nil!11847) (Cons!11846 (h!12894 (_ BitVec 64)) (t!18070 List!11850)) )
))
(declare-fun contains!3000 (List!11850 (_ BitVec 64)) Bool)

(assert (=> b!608963 (= res!391482 (contains!3000 Nil!11847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608964 () Bool)

(declare-datatypes ((Unit!19441 0))(
  ( (Unit!19442) )
))
(declare-fun e!348766 () Unit!19441)

(declare-fun Unit!19443 () Unit!19441)

(assert (=> b!608964 (= e!348766 Unit!19443)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!348765 () Bool)

(declare-fun b!608965 () Bool)

(declare-datatypes ((array!37308 0))(
  ( (array!37309 (arr!17902 (Array (_ BitVec 32) (_ BitVec 64))) (size!18266 (_ BitVec 32))) )
))
(declare-fun lt!278263 () array!37308)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37308)

(declare-fun arrayContainsKey!0 (array!37308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608965 (= e!348765 (arrayContainsKey!0 lt!278263 (select (arr!17902 a!2986) j!136) index!984))))

(declare-fun b!608966 () Bool)

(declare-fun res!391496 () Bool)

(declare-fun e!348770 () Bool)

(assert (=> b!608966 (=> (not res!391496) (not e!348770))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!608966 (= res!391496 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608967 () Bool)

(declare-fun res!391499 () Bool)

(declare-fun e!348761 () Bool)

(assert (=> b!608967 (=> (not res!391499) (not e!348761))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!608967 (= res!391499 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17902 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608968 () Bool)

(declare-fun res!391503 () Bool)

(assert (=> b!608968 (=> (not res!391503) (not e!348761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37308 (_ BitVec 32)) Bool)

(assert (=> b!608968 (= res!391503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608969 () Bool)

(declare-fun e!348763 () Bool)

(declare-fun e!348772 () Bool)

(assert (=> b!608969 (= e!348763 e!348772)))

(declare-fun res!391486 () Bool)

(assert (=> b!608969 (=> res!391486 e!348772)))

(declare-fun lt!278266 () (_ BitVec 64))

(declare-fun lt!278254 () (_ BitVec 64))

(assert (=> b!608969 (= res!391486 (or (not (= (select (arr!17902 a!2986) j!136) lt!278266)) (not (= (select (arr!17902 a!2986) j!136) lt!278254))))))

(declare-fun e!348767 () Bool)

(assert (=> b!608969 e!348767))

(declare-fun res!391494 () Bool)

(assert (=> b!608969 (=> (not res!391494) (not e!348767))))

(assert (=> b!608969 (= res!391494 (= lt!278254 (select (arr!17902 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608969 (= lt!278254 (select (store (arr!17902 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608970 () Bool)

(declare-fun e!348773 () Bool)

(assert (=> b!608970 (= e!348773 (arrayContainsKey!0 lt!278263 (select (arr!17902 a!2986) j!136) index!984))))

(declare-fun b!608971 () Bool)

(declare-fun res!391498 () Bool)

(assert (=> b!608971 (=> (not res!391498) (not e!348770))))

(assert (=> b!608971 (= res!391498 (and (= (size!18266 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18266 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18266 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608972 () Bool)

(declare-fun res!391487 () Bool)

(assert (=> b!608972 (=> (not res!391487) (not e!348770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608972 (= res!391487 (validKeyInArray!0 (select (arr!17902 a!2986) j!136)))))

(declare-fun res!391483 () Bool)

(assert (=> start!55632 (=> (not res!391483) (not e!348770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55632 (= res!391483 (validMask!0 mask!3053))))

(assert (=> start!55632 e!348770))

(assert (=> start!55632 true))

(declare-fun array_inv!13761 (array!37308) Bool)

(assert (=> start!55632 (array_inv!13761 a!2986)))

(declare-fun b!608973 () Bool)

(declare-fun e!348759 () Bool)

(assert (=> b!608973 (= e!348761 e!348759)))

(declare-fun res!391485 () Bool)

(assert (=> b!608973 (=> (not res!391485) (not e!348759))))

(assert (=> b!608973 (= res!391485 (= (select (store (arr!17902 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608973 (= lt!278263 (array!37309 (store (arr!17902 a!2986) i!1108 k0!1786) (size!18266 a!2986)))))

(declare-fun b!608974 () Bool)

(declare-fun e!348768 () Bool)

(assert (=> b!608974 (= e!348772 e!348768)))

(declare-fun res!391493 () Bool)

(assert (=> b!608974 (=> res!391493 e!348768)))

(assert (=> b!608974 (= res!391493 (bvsge index!984 j!136))))

(declare-fun lt!278264 () Unit!19441)

(declare-fun e!348774 () Unit!19441)

(assert (=> b!608974 (= lt!278264 e!348774)))

(declare-fun c!69109 () Bool)

(assert (=> b!608974 (= c!69109 (bvslt j!136 index!984))))

(declare-fun b!608975 () Bool)

(declare-fun Unit!19444 () Unit!19441)

(assert (=> b!608975 (= e!348774 Unit!19444)))

(declare-fun lt!278255 () Unit!19441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37308 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19441)

(assert (=> b!608975 (= lt!278255 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278263 (select (arr!17902 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608975 (arrayContainsKey!0 lt!278263 (select (arr!17902 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278259 () Unit!19441)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37308 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11850) Unit!19441)

(assert (=> b!608975 (= lt!278259 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11847))))

(declare-fun arrayNoDuplicates!0 (array!37308 (_ BitVec 32) List!11850) Bool)

(assert (=> b!608975 (arrayNoDuplicates!0 lt!278263 #b00000000000000000000000000000000 Nil!11847)))

(declare-fun lt!278260 () Unit!19441)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37308 (_ BitVec 32) (_ BitVec 32)) Unit!19441)

(assert (=> b!608975 (= lt!278260 (lemmaNoDuplicateFromThenFromBigger!0 lt!278263 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608975 (arrayNoDuplicates!0 lt!278263 j!136 Nil!11847)))

(declare-fun lt!278269 () Unit!19441)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37308 (_ BitVec 64) (_ BitVec 32) List!11850) Unit!19441)

(assert (=> b!608975 (= lt!278269 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278263 (select (arr!17902 a!2986) j!136) j!136 Nil!11847))))

(assert (=> b!608975 false))

(declare-fun b!608976 () Bool)

(declare-fun e!348762 () Bool)

(assert (=> b!608976 (= e!348759 e!348762)))

(declare-fun res!391501 () Bool)

(assert (=> b!608976 (=> (not res!391501) (not e!348762))))

(declare-datatypes ((SeekEntryResult!6298 0))(
  ( (MissingZero!6298 (index!27467 (_ BitVec 32))) (Found!6298 (index!27468 (_ BitVec 32))) (Intermediate!6298 (undefined!7110 Bool) (index!27469 (_ BitVec 32)) (x!56426 (_ BitVec 32))) (Undefined!6298) (MissingVacant!6298 (index!27470 (_ BitVec 32))) )
))
(declare-fun lt!278256 () SeekEntryResult!6298)

(assert (=> b!608976 (= res!391501 (and (= lt!278256 (Found!6298 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17902 a!2986) index!984) (select (arr!17902 a!2986) j!136))) (not (= (select (arr!17902 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37308 (_ BitVec 32)) SeekEntryResult!6298)

(assert (=> b!608976 (= lt!278256 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17902 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608977 () Bool)

(declare-fun e!348760 () Bool)

(declare-fun lt!278267 () SeekEntryResult!6298)

(assert (=> b!608977 (= e!348760 (= lt!278256 lt!278267))))

(declare-fun b!608978 () Bool)

(declare-fun res!391497 () Bool)

(assert (=> b!608978 (=> res!391497 e!348771)))

(assert (=> b!608978 (= res!391497 (contains!3000 Nil!11847 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608979 () Bool)

(assert (=> b!608979 (= e!348762 (not e!348763))))

(declare-fun res!391500 () Bool)

(assert (=> b!608979 (=> res!391500 e!348763)))

(declare-fun lt!278261 () SeekEntryResult!6298)

(assert (=> b!608979 (= res!391500 (not (= lt!278261 (Found!6298 index!984))))))

(declare-fun lt!278262 () Unit!19441)

(assert (=> b!608979 (= lt!278262 e!348766)))

(declare-fun c!69110 () Bool)

(assert (=> b!608979 (= c!69110 (= lt!278261 Undefined!6298))))

(assert (=> b!608979 (= lt!278261 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278266 lt!278263 mask!3053))))

(assert (=> b!608979 e!348760))

(declare-fun res!391492 () Bool)

(assert (=> b!608979 (=> (not res!391492) (not e!348760))))

(declare-fun lt!278258 () (_ BitVec 32))

(assert (=> b!608979 (= res!391492 (= lt!278267 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278258 vacantSpotIndex!68 lt!278266 lt!278263 mask!3053)))))

(assert (=> b!608979 (= lt!278267 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278258 vacantSpotIndex!68 (select (arr!17902 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608979 (= lt!278266 (select (store (arr!17902 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278257 () Unit!19441)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37308 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19441)

(assert (=> b!608979 (= lt!278257 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278258 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608979 (= lt!278258 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!608980 () Bool)

(declare-fun res!391495 () Bool)

(assert (=> b!608980 (=> (not res!391495) (not e!348770))))

(assert (=> b!608980 (= res!391495 (validKeyInArray!0 k0!1786))))

(declare-fun b!608981 () Bool)

(declare-fun e!348764 () Bool)

(assert (=> b!608981 (= e!348767 e!348764)))

(declare-fun res!391484 () Bool)

(assert (=> b!608981 (=> res!391484 e!348764)))

(assert (=> b!608981 (= res!391484 (or (not (= (select (arr!17902 a!2986) j!136) lt!278266)) (not (= (select (arr!17902 a!2986) j!136) lt!278254)) (bvsge j!136 index!984)))))

(declare-fun b!608982 () Bool)

(assert (=> b!608982 (= e!348764 e!348773)))

(declare-fun res!391502 () Bool)

(assert (=> b!608982 (=> (not res!391502) (not e!348773))))

(assert (=> b!608982 (= res!391502 (arrayContainsKey!0 lt!278263 (select (arr!17902 a!2986) j!136) j!136))))

(declare-fun b!608983 () Bool)

(declare-fun Unit!19445 () Unit!19441)

(assert (=> b!608983 (= e!348766 Unit!19445)))

(assert (=> b!608983 false))

(declare-fun b!608984 () Bool)

(declare-fun res!391491 () Bool)

(assert (=> b!608984 (=> (not res!391491) (not e!348761))))

(assert (=> b!608984 (= res!391491 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11847))))

(declare-fun b!608985 () Bool)

(assert (=> b!608985 (= e!348770 e!348761)))

(declare-fun res!391488 () Bool)

(assert (=> b!608985 (=> (not res!391488) (not e!348761))))

(declare-fun lt!278268 () SeekEntryResult!6298)

(assert (=> b!608985 (= res!391488 (or (= lt!278268 (MissingZero!6298 i!1108)) (= lt!278268 (MissingVacant!6298 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37308 (_ BitVec 32)) SeekEntryResult!6298)

(assert (=> b!608985 (= lt!278268 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608986 () Bool)

(assert (=> b!608986 (= e!348768 e!348771)))

(declare-fun res!391504 () Bool)

(assert (=> b!608986 (=> res!391504 e!348771)))

(assert (=> b!608986 (= res!391504 (or (bvsge (size!18266 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18266 a!2986))))))

(assert (=> b!608986 (arrayContainsKey!0 lt!278263 (select (arr!17902 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278253 () Unit!19441)

(assert (=> b!608986 (= lt!278253 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278263 (select (arr!17902 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608986 e!348765))

(declare-fun res!391490 () Bool)

(assert (=> b!608986 (=> (not res!391490) (not e!348765))))

(assert (=> b!608986 (= res!391490 (arrayContainsKey!0 lt!278263 (select (arr!17902 a!2986) j!136) j!136))))

(declare-fun b!608987 () Bool)

(declare-fun res!391489 () Bool)

(assert (=> b!608987 (=> res!391489 e!348771)))

(declare-fun noDuplicate!334 (List!11850) Bool)

(assert (=> b!608987 (= res!391489 (not (noDuplicate!334 Nil!11847)))))

(declare-fun b!608988 () Bool)

(assert (=> b!608988 (= e!348771 true)))

(declare-fun lt!278265 () Bool)

(assert (=> b!608988 (= lt!278265 (contains!3000 Nil!11847 k0!1786))))

(declare-fun b!608989 () Bool)

(declare-fun Unit!19446 () Unit!19441)

(assert (=> b!608989 (= e!348774 Unit!19446)))

(assert (= (and start!55632 res!391483) b!608971))

(assert (= (and b!608971 res!391498) b!608972))

(assert (= (and b!608972 res!391487) b!608980))

(assert (= (and b!608980 res!391495) b!608966))

(assert (= (and b!608966 res!391496) b!608985))

(assert (= (and b!608985 res!391488) b!608968))

(assert (= (and b!608968 res!391503) b!608984))

(assert (= (and b!608984 res!391491) b!608967))

(assert (= (and b!608967 res!391499) b!608973))

(assert (= (and b!608973 res!391485) b!608976))

(assert (= (and b!608976 res!391501) b!608979))

(assert (= (and b!608979 res!391492) b!608977))

(assert (= (and b!608979 c!69110) b!608983))

(assert (= (and b!608979 (not c!69110)) b!608964))

(assert (= (and b!608979 (not res!391500)) b!608969))

(assert (= (and b!608969 res!391494) b!608981))

(assert (= (and b!608981 (not res!391484)) b!608982))

(assert (= (and b!608982 res!391502) b!608970))

(assert (= (and b!608969 (not res!391486)) b!608974))

(assert (= (and b!608974 c!69109) b!608975))

(assert (= (and b!608974 (not c!69109)) b!608989))

(assert (= (and b!608974 (not res!391493)) b!608986))

(assert (= (and b!608986 res!391490) b!608965))

(assert (= (and b!608986 (not res!391504)) b!608987))

(assert (= (and b!608987 (not res!391489)) b!608963))

(assert (= (and b!608963 (not res!391482)) b!608978))

(assert (= (and b!608978 (not res!391497)) b!608988))

(declare-fun m!585815 () Bool)

(assert (=> b!608969 m!585815))

(declare-fun m!585817 () Bool)

(assert (=> b!608969 m!585817))

(declare-fun m!585819 () Bool)

(assert (=> b!608969 m!585819))

(declare-fun m!585821 () Bool)

(assert (=> start!55632 m!585821))

(declare-fun m!585823 () Bool)

(assert (=> start!55632 m!585823))

(assert (=> b!608970 m!585815))

(assert (=> b!608970 m!585815))

(declare-fun m!585825 () Bool)

(assert (=> b!608970 m!585825))

(declare-fun m!585827 () Bool)

(assert (=> b!608980 m!585827))

(assert (=> b!608981 m!585815))

(declare-fun m!585829 () Bool)

(assert (=> b!608985 m!585829))

(declare-fun m!585831 () Bool)

(assert (=> b!608984 m!585831))

(declare-fun m!585833 () Bool)

(assert (=> b!608976 m!585833))

(assert (=> b!608976 m!585815))

(assert (=> b!608976 m!585815))

(declare-fun m!585835 () Bool)

(assert (=> b!608976 m!585835))

(declare-fun m!585837 () Bool)

(assert (=> b!608987 m!585837))

(assert (=> b!608972 m!585815))

(assert (=> b!608972 m!585815))

(declare-fun m!585839 () Bool)

(assert (=> b!608972 m!585839))

(assert (=> b!608965 m!585815))

(assert (=> b!608965 m!585815))

(assert (=> b!608965 m!585825))

(declare-fun m!585841 () Bool)

(assert (=> b!608979 m!585841))

(declare-fun m!585843 () Bool)

(assert (=> b!608979 m!585843))

(assert (=> b!608979 m!585815))

(assert (=> b!608979 m!585815))

(declare-fun m!585845 () Bool)

(assert (=> b!608979 m!585845))

(declare-fun m!585847 () Bool)

(assert (=> b!608979 m!585847))

(declare-fun m!585849 () Bool)

(assert (=> b!608979 m!585849))

(declare-fun m!585851 () Bool)

(assert (=> b!608979 m!585851))

(assert (=> b!608979 m!585817))

(declare-fun m!585853 () Bool)

(assert (=> b!608963 m!585853))

(declare-fun m!585855 () Bool)

(assert (=> b!608968 m!585855))

(declare-fun m!585857 () Bool)

(assert (=> b!608975 m!585857))

(assert (=> b!608975 m!585815))

(declare-fun m!585859 () Bool)

(assert (=> b!608975 m!585859))

(assert (=> b!608975 m!585815))

(declare-fun m!585861 () Bool)

(assert (=> b!608975 m!585861))

(declare-fun m!585863 () Bool)

(assert (=> b!608975 m!585863))

(declare-fun m!585865 () Bool)

(assert (=> b!608975 m!585865))

(declare-fun m!585867 () Bool)

(assert (=> b!608975 m!585867))

(assert (=> b!608975 m!585815))

(assert (=> b!608975 m!585815))

(declare-fun m!585869 () Bool)

(assert (=> b!608975 m!585869))

(declare-fun m!585871 () Bool)

(assert (=> b!608988 m!585871))

(declare-fun m!585873 () Bool)

(assert (=> b!608967 m!585873))

(assert (=> b!608982 m!585815))

(assert (=> b!608982 m!585815))

(declare-fun m!585875 () Bool)

(assert (=> b!608982 m!585875))

(declare-fun m!585877 () Bool)

(assert (=> b!608966 m!585877))

(assert (=> b!608973 m!585817))

(declare-fun m!585879 () Bool)

(assert (=> b!608973 m!585879))

(assert (=> b!608986 m!585815))

(assert (=> b!608986 m!585815))

(declare-fun m!585881 () Bool)

(assert (=> b!608986 m!585881))

(assert (=> b!608986 m!585815))

(declare-fun m!585883 () Bool)

(assert (=> b!608986 m!585883))

(assert (=> b!608986 m!585815))

(assert (=> b!608986 m!585875))

(declare-fun m!585885 () Bool)

(assert (=> b!608978 m!585885))

(check-sat (not b!608966) (not b!608965) (not b!608972) (not b!608963) (not b!608979) (not b!608986) (not b!608988) (not start!55632) (not b!608985) (not b!608987) (not b!608978) (not b!608982) (not b!608975) (not b!608976) (not b!608970) (not b!608984) (not b!608980) (not b!608968))
(check-sat)
