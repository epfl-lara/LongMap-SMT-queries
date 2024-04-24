; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56112 () Bool)

(assert start!56112)

(declare-fun b!617857 () Bool)

(assert (=> b!617857 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37527 0))(
  ( (array!37528 (arr!18007 (Array (_ BitVec 32) (_ BitVec 64))) (size!18371 (_ BitVec 32))) )
))
(declare-fun lt!284585 () array!37527)

(declare-fun a!2986 () array!37527)

(declare-datatypes ((Unit!20227 0))(
  ( (Unit!20228) )
))
(declare-fun lt!284591 () Unit!20227)

(declare-datatypes ((List!11955 0))(
  ( (Nil!11952) (Cons!11951 (h!12999 (_ BitVec 64)) (t!18175 List!11955)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37527 (_ BitVec 64) (_ BitVec 32) List!11955) Unit!20227)

(assert (=> b!617857 (= lt!284591 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284585 (select (arr!18007 a!2986) j!136) j!136 Nil!11952))))

(declare-fun arrayNoDuplicates!0 (array!37527 (_ BitVec 32) List!11955) Bool)

(assert (=> b!617857 (arrayNoDuplicates!0 lt!284585 j!136 Nil!11952)))

(declare-fun lt!284592 () Unit!20227)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37527 (_ BitVec 32) (_ BitVec 32)) Unit!20227)

(assert (=> b!617857 (= lt!284592 (lemmaNoDuplicateFromThenFromBigger!0 lt!284585 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617857 (arrayNoDuplicates!0 lt!284585 #b00000000000000000000000000000000 Nil!11952)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!284590 () Unit!20227)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11955) Unit!20227)

(assert (=> b!617857 (= lt!284590 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11952))))

(declare-fun arrayContainsKey!0 (array!37527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617857 (arrayContainsKey!0 lt!284585 (select (arr!18007 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284583 () Unit!20227)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20227)

(assert (=> b!617857 (= lt!284583 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284585 (select (arr!18007 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354315 () Unit!20227)

(declare-fun Unit!20229 () Unit!20227)

(assert (=> b!617857 (= e!354315 Unit!20229)))

(declare-fun b!617858 () Bool)

(declare-fun e!354321 () Unit!20227)

(declare-fun Unit!20230 () Unit!20227)

(assert (=> b!617858 (= e!354321 Unit!20230)))

(declare-fun b!617860 () Bool)

(declare-fun res!398014 () Bool)

(declare-fun e!354311 () Bool)

(assert (=> b!617860 (=> (not res!398014) (not e!354311))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617860 (= res!398014 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18007 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617861 () Bool)

(declare-fun res!398013 () Bool)

(assert (=> b!617861 (=> (not res!398013) (not e!354311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37527 (_ BitVec 32)) Bool)

(assert (=> b!617861 (= res!398013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!354316 () Bool)

(declare-fun b!617862 () Bool)

(assert (=> b!617862 (= e!354316 (arrayContainsKey!0 lt!284585 (select (arr!18007 a!2986) j!136) index!984))))

(declare-fun b!617863 () Bool)

(declare-fun res!398018 () Bool)

(declare-fun e!354308 () Bool)

(assert (=> b!617863 (=> (not res!398018) (not e!354308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617863 (= res!398018 (validKeyInArray!0 (select (arr!18007 a!2986) j!136)))))

(declare-fun b!617864 () Bool)

(declare-fun res!398020 () Bool)

(assert (=> b!617864 (=> (not res!398020) (not e!354311))))

(assert (=> b!617864 (= res!398020 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11952))))

(declare-fun b!617865 () Bool)

(declare-fun res!398023 () Bool)

(assert (=> b!617865 (=> (not res!398023) (not e!354308))))

(assert (=> b!617865 (= res!398023 (and (= (size!18371 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18371 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18371 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617866 () Bool)

(declare-fun e!354309 () Bool)

(declare-fun e!354318 () Bool)

(assert (=> b!617866 (= e!354309 (not e!354318))))

(declare-fun res!398022 () Bool)

(assert (=> b!617866 (=> res!398022 e!354318)))

(declare-datatypes ((SeekEntryResult!6403 0))(
  ( (MissingZero!6403 (index!27896 (_ BitVec 32))) (Found!6403 (index!27897 (_ BitVec 32))) (Intermediate!6403 (undefined!7215 Bool) (index!27898 (_ BitVec 32)) (x!56838 (_ BitVec 32))) (Undefined!6403) (MissingVacant!6403 (index!27899 (_ BitVec 32))) )
))
(declare-fun lt!284599 () SeekEntryResult!6403)

(assert (=> b!617866 (= res!398022 (not (= lt!284599 (MissingVacant!6403 vacantSpotIndex!68))))))

(declare-fun lt!284584 () Unit!20227)

(declare-fun e!354307 () Unit!20227)

(assert (=> b!617866 (= lt!284584 e!354307)))

(declare-fun c!70294 () Bool)

(assert (=> b!617866 (= c!70294 (= lt!284599 (Found!6403 index!984)))))

(declare-fun lt!284596 () Unit!20227)

(assert (=> b!617866 (= lt!284596 e!354321)))

(declare-fun c!70292 () Bool)

(assert (=> b!617866 (= c!70292 (= lt!284599 Undefined!6403))))

(declare-fun lt!284597 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37527 (_ BitVec 32)) SeekEntryResult!6403)

(assert (=> b!617866 (= lt!284599 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284597 lt!284585 mask!3053))))

(declare-fun e!354320 () Bool)

(assert (=> b!617866 e!354320))

(declare-fun res!398010 () Bool)

(assert (=> b!617866 (=> (not res!398010) (not e!354320))))

(declare-fun lt!284593 () SeekEntryResult!6403)

(declare-fun lt!284587 () (_ BitVec 32))

(assert (=> b!617866 (= res!398010 (= lt!284593 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284587 vacantSpotIndex!68 lt!284597 lt!284585 mask!3053)))))

(assert (=> b!617866 (= lt!284593 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284587 vacantSpotIndex!68 (select (arr!18007 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617866 (= lt!284597 (select (store (arr!18007 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284588 () Unit!20227)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37527 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20227)

(assert (=> b!617866 (= lt!284588 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284587 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617866 (= lt!284587 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!617867 () Bool)

(declare-fun Unit!20231 () Unit!20227)

(assert (=> b!617867 (= e!354307 Unit!20231)))

(declare-fun res!398025 () Bool)

(assert (=> b!617867 (= res!398025 (= (select (store (arr!18007 a!2986) i!1108 k0!1786) index!984) (select (arr!18007 a!2986) j!136)))))

(declare-fun e!354317 () Bool)

(assert (=> b!617867 (=> (not res!398025) (not e!354317))))

(assert (=> b!617867 e!354317))

(declare-fun c!70295 () Bool)

(assert (=> b!617867 (= c!70295 (bvslt j!136 index!984))))

(declare-fun lt!284581 () Unit!20227)

(assert (=> b!617867 (= lt!284581 e!354315)))

(declare-fun c!70293 () Bool)

(assert (=> b!617867 (= c!70293 (bvslt index!984 j!136))))

(declare-fun lt!284580 () Unit!20227)

(declare-fun e!354313 () Unit!20227)

(assert (=> b!617867 (= lt!284580 e!354313)))

(assert (=> b!617867 false))

(declare-fun b!617868 () Bool)

(assert (=> b!617868 false))

(declare-fun lt!284594 () Unit!20227)

(assert (=> b!617868 (= lt!284594 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284585 (select (arr!18007 a!2986) j!136) index!984 Nil!11952))))

(assert (=> b!617868 (arrayNoDuplicates!0 lt!284585 index!984 Nil!11952)))

(declare-fun lt!284582 () Unit!20227)

(assert (=> b!617868 (= lt!284582 (lemmaNoDuplicateFromThenFromBigger!0 lt!284585 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617868 (arrayNoDuplicates!0 lt!284585 #b00000000000000000000000000000000 Nil!11952)))

(declare-fun lt!284589 () Unit!20227)

(assert (=> b!617868 (= lt!284589 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11952))))

(assert (=> b!617868 (arrayContainsKey!0 lt!284585 (select (arr!18007 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284586 () Unit!20227)

(assert (=> b!617868 (= lt!284586 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284585 (select (arr!18007 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354319 () Bool)

(assert (=> b!617868 e!354319))

(declare-fun res!398024 () Bool)

(assert (=> b!617868 (=> (not res!398024) (not e!354319))))

(assert (=> b!617868 (= res!398024 (arrayContainsKey!0 lt!284585 (select (arr!18007 a!2986) j!136) j!136))))

(declare-fun Unit!20232 () Unit!20227)

(assert (=> b!617868 (= e!354313 Unit!20232)))

(declare-fun b!617869 () Bool)

(declare-fun res!398017 () Bool)

(assert (=> b!617869 (=> (not res!398017) (not e!354308))))

(assert (=> b!617869 (= res!398017 (validKeyInArray!0 k0!1786))))

(declare-fun b!617870 () Bool)

(declare-fun res!398026 () Bool)

(assert (=> b!617870 (= res!398026 (bvsge j!136 index!984))))

(declare-fun e!354314 () Bool)

(assert (=> b!617870 (=> res!398026 e!354314)))

(assert (=> b!617870 (= e!354317 e!354314)))

(declare-fun b!617871 () Bool)

(assert (=> b!617871 (= e!354318 true)))

(assert (=> b!617871 (= (select (store (arr!18007 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!398011 () Bool)

(assert (=> start!56112 (=> (not res!398011) (not e!354308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56112 (= res!398011 (validMask!0 mask!3053))))

(assert (=> start!56112 e!354308))

(assert (=> start!56112 true))

(declare-fun array_inv!13866 (array!37527) Bool)

(assert (=> start!56112 (array_inv!13866 a!2986)))

(declare-fun b!617859 () Bool)

(declare-fun e!354312 () Bool)

(assert (=> b!617859 (= e!354311 e!354312)))

(declare-fun res!398016 () Bool)

(assert (=> b!617859 (=> (not res!398016) (not e!354312))))

(assert (=> b!617859 (= res!398016 (= (select (store (arr!18007 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617859 (= lt!284585 (array!37528 (store (arr!18007 a!2986) i!1108 k0!1786) (size!18371 a!2986)))))

(declare-fun b!617872 () Bool)

(declare-fun Unit!20233 () Unit!20227)

(assert (=> b!617872 (= e!354315 Unit!20233)))

(declare-fun b!617873 () Bool)

(declare-fun Unit!20234 () Unit!20227)

(assert (=> b!617873 (= e!354307 Unit!20234)))

(declare-fun b!617874 () Bool)

(assert (=> b!617874 (= e!354319 (arrayContainsKey!0 lt!284585 (select (arr!18007 a!2986) j!136) index!984))))

(declare-fun b!617875 () Bool)

(declare-fun res!398019 () Bool)

(assert (=> b!617875 (=> (not res!398019) (not e!354308))))

(assert (=> b!617875 (= res!398019 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617876 () Bool)

(declare-fun Unit!20235 () Unit!20227)

(assert (=> b!617876 (= e!354321 Unit!20235)))

(assert (=> b!617876 false))

(declare-fun b!617877 () Bool)

(declare-fun res!398021 () Bool)

(assert (=> b!617877 (= res!398021 (arrayContainsKey!0 lt!284585 (select (arr!18007 a!2986) j!136) j!136))))

(assert (=> b!617877 (=> (not res!398021) (not e!354316))))

(assert (=> b!617877 (= e!354314 e!354316)))

(declare-fun b!617878 () Bool)

(declare-fun Unit!20236 () Unit!20227)

(assert (=> b!617878 (= e!354313 Unit!20236)))

(declare-fun b!617879 () Bool)

(assert (=> b!617879 (= e!354308 e!354311)))

(declare-fun res!398015 () Bool)

(assert (=> b!617879 (=> (not res!398015) (not e!354311))))

(declare-fun lt!284595 () SeekEntryResult!6403)

(assert (=> b!617879 (= res!398015 (or (= lt!284595 (MissingZero!6403 i!1108)) (= lt!284595 (MissingVacant!6403 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37527 (_ BitVec 32)) SeekEntryResult!6403)

(assert (=> b!617879 (= lt!284595 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617880 () Bool)

(declare-fun lt!284598 () SeekEntryResult!6403)

(assert (=> b!617880 (= e!354320 (= lt!284598 lt!284593))))

(declare-fun b!617881 () Bool)

(assert (=> b!617881 (= e!354312 e!354309)))

(declare-fun res!398012 () Bool)

(assert (=> b!617881 (=> (not res!398012) (not e!354309))))

(assert (=> b!617881 (= res!398012 (and (= lt!284598 (Found!6403 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18007 a!2986) index!984) (select (arr!18007 a!2986) j!136))) (not (= (select (arr!18007 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!617881 (= lt!284598 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18007 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56112 res!398011) b!617865))

(assert (= (and b!617865 res!398023) b!617863))

(assert (= (and b!617863 res!398018) b!617869))

(assert (= (and b!617869 res!398017) b!617875))

(assert (= (and b!617875 res!398019) b!617879))

(assert (= (and b!617879 res!398015) b!617861))

(assert (= (and b!617861 res!398013) b!617864))

(assert (= (and b!617864 res!398020) b!617860))

(assert (= (and b!617860 res!398014) b!617859))

(assert (= (and b!617859 res!398016) b!617881))

(assert (= (and b!617881 res!398012) b!617866))

(assert (= (and b!617866 res!398010) b!617880))

(assert (= (and b!617866 c!70292) b!617876))

(assert (= (and b!617866 (not c!70292)) b!617858))

(assert (= (and b!617866 c!70294) b!617867))

(assert (= (and b!617866 (not c!70294)) b!617873))

(assert (= (and b!617867 res!398025) b!617870))

(assert (= (and b!617870 (not res!398026)) b!617877))

(assert (= (and b!617877 res!398021) b!617862))

(assert (= (and b!617867 c!70295) b!617857))

(assert (= (and b!617867 (not c!70295)) b!617872))

(assert (= (and b!617867 c!70293) b!617868))

(assert (= (and b!617867 (not c!70293)) b!617878))

(assert (= (and b!617868 res!398024) b!617874))

(assert (= (and b!617866 (not res!398022)) b!617871))

(declare-fun m!594227 () Bool)

(assert (=> b!617881 m!594227))

(declare-fun m!594229 () Bool)

(assert (=> b!617881 m!594229))

(assert (=> b!617881 m!594229))

(declare-fun m!594231 () Bool)

(assert (=> b!617881 m!594231))

(assert (=> b!617877 m!594229))

(assert (=> b!617877 m!594229))

(declare-fun m!594233 () Bool)

(assert (=> b!617877 m!594233))

(declare-fun m!594235 () Bool)

(assert (=> b!617869 m!594235))

(assert (=> b!617863 m!594229))

(assert (=> b!617863 m!594229))

(declare-fun m!594237 () Bool)

(assert (=> b!617863 m!594237))

(assert (=> b!617862 m!594229))

(assert (=> b!617862 m!594229))

(declare-fun m!594239 () Bool)

(assert (=> b!617862 m!594239))

(declare-fun m!594241 () Bool)

(assert (=> b!617866 m!594241))

(declare-fun m!594243 () Bool)

(assert (=> b!617866 m!594243))

(declare-fun m!594245 () Bool)

(assert (=> b!617866 m!594245))

(declare-fun m!594247 () Bool)

(assert (=> b!617866 m!594247))

(assert (=> b!617866 m!594229))

(declare-fun m!594249 () Bool)

(assert (=> b!617866 m!594249))

(declare-fun m!594251 () Bool)

(assert (=> b!617866 m!594251))

(assert (=> b!617866 m!594229))

(declare-fun m!594253 () Bool)

(assert (=> b!617866 m!594253))

(assert (=> b!617867 m!594249))

(declare-fun m!594255 () Bool)

(assert (=> b!617867 m!594255))

(assert (=> b!617867 m!594229))

(declare-fun m!594257 () Bool)

(assert (=> b!617860 m!594257))

(assert (=> b!617857 m!594229))

(declare-fun m!594259 () Bool)

(assert (=> b!617857 m!594259))

(declare-fun m!594261 () Bool)

(assert (=> b!617857 m!594261))

(declare-fun m!594263 () Bool)

(assert (=> b!617857 m!594263))

(declare-fun m!594265 () Bool)

(assert (=> b!617857 m!594265))

(assert (=> b!617857 m!594229))

(declare-fun m!594267 () Bool)

(assert (=> b!617857 m!594267))

(declare-fun m!594269 () Bool)

(assert (=> b!617857 m!594269))

(assert (=> b!617857 m!594229))

(assert (=> b!617857 m!594229))

(declare-fun m!594271 () Bool)

(assert (=> b!617857 m!594271))

(assert (=> b!617871 m!594249))

(assert (=> b!617871 m!594255))

(declare-fun m!594273 () Bool)

(assert (=> b!617861 m!594273))

(declare-fun m!594275 () Bool)

(assert (=> b!617864 m!594275))

(declare-fun m!594277 () Bool)

(assert (=> b!617875 m!594277))

(declare-fun m!594279 () Bool)

(assert (=> start!56112 m!594279))

(declare-fun m!594281 () Bool)

(assert (=> start!56112 m!594281))

(assert (=> b!617874 m!594229))

(assert (=> b!617874 m!594229))

(assert (=> b!617874 m!594239))

(declare-fun m!594283 () Bool)

(assert (=> b!617879 m!594283))

(assert (=> b!617859 m!594249))

(declare-fun m!594285 () Bool)

(assert (=> b!617859 m!594285))

(assert (=> b!617868 m!594229))

(declare-fun m!594287 () Bool)

(assert (=> b!617868 m!594287))

(assert (=> b!617868 m!594229))

(assert (=> b!617868 m!594229))

(declare-fun m!594289 () Bool)

(assert (=> b!617868 m!594289))

(assert (=> b!617868 m!594265))

(declare-fun m!594291 () Bool)

(assert (=> b!617868 m!594291))

(assert (=> b!617868 m!594229))

(declare-fun m!594293 () Bool)

(assert (=> b!617868 m!594293))

(assert (=> b!617868 m!594229))

(assert (=> b!617868 m!594233))

(declare-fun m!594295 () Bool)

(assert (=> b!617868 m!594295))

(assert (=> b!617868 m!594269))

(check-sat (not b!617857) (not b!617874) (not b!617881) (not b!617869) (not b!617866) (not b!617868) (not b!617875) (not b!617862) (not b!617864) (not b!617863) (not b!617877) (not start!56112) (not b!617879) (not b!617861))
(check-sat)
