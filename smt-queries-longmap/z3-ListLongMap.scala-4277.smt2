; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59572 () Bool)

(assert start!59572)

(declare-fun b!657854 () Bool)

(declare-fun res!426605 () Bool)

(declare-fun e!377910 () Bool)

(assert (=> b!657854 (=> (not res!426605) (not e!377910))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38730 0))(
  ( (array!38731 (arr!18562 (Array (_ BitVec 32) (_ BitVec 64))) (size!18926 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38730)

(assert (=> b!657854 (= res!426605 (and (= (size!18926 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18926 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18926 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657855 () Bool)

(assert (=> b!657855 false))

(declare-fun lt!307400 () array!38730)

(declare-datatypes ((Unit!22774 0))(
  ( (Unit!22775) )
))
(declare-fun lt!307392 () Unit!22774)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12603 0))(
  ( (Nil!12600) (Cons!12599 (h!13644 (_ BitVec 64)) (t!18831 List!12603)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38730 (_ BitVec 64) (_ BitVec 32) List!12603) Unit!22774)

(assert (=> b!657855 (= lt!307392 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307400 (select (arr!18562 a!2986) j!136) index!984 Nil!12600))))

(declare-fun arrayNoDuplicates!0 (array!38730 (_ BitVec 32) List!12603) Bool)

(assert (=> b!657855 (arrayNoDuplicates!0 lt!307400 index!984 Nil!12600)))

(declare-fun lt!307403 () Unit!22774)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38730 (_ BitVec 32) (_ BitVec 32)) Unit!22774)

(assert (=> b!657855 (= lt!307403 (lemmaNoDuplicateFromThenFromBigger!0 lt!307400 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657855 (arrayNoDuplicates!0 lt!307400 #b00000000000000000000000000000000 Nil!12600)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!307393 () Unit!22774)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12603) Unit!22774)

(assert (=> b!657855 (= lt!307393 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12600))))

(declare-fun arrayContainsKey!0 (array!38730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657855 (arrayContainsKey!0 lt!307400 (select (arr!18562 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307397 () Unit!22774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22774)

(assert (=> b!657855 (= lt!307397 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307400 (select (arr!18562 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377922 () Bool)

(assert (=> b!657855 e!377922))

(declare-fun res!426610 () Bool)

(assert (=> b!657855 (=> (not res!426610) (not e!377922))))

(assert (=> b!657855 (= res!426610 (arrayContainsKey!0 lt!307400 (select (arr!18562 a!2986) j!136) j!136))))

(declare-fun e!377914 () Unit!22774)

(declare-fun Unit!22776 () Unit!22774)

(assert (=> b!657855 (= e!377914 Unit!22776)))

(declare-fun e!377912 () Bool)

(declare-fun b!657856 () Bool)

(assert (=> b!657856 (= e!377912 (arrayContainsKey!0 lt!307400 (select (arr!18562 a!2986) j!136) index!984))))

(declare-fun b!657857 () Bool)

(declare-fun e!377921 () Bool)

(declare-fun e!377919 () Bool)

(assert (=> b!657857 (= e!377921 e!377919)))

(declare-fun res!426604 () Bool)

(assert (=> b!657857 (=> (not res!426604) (not e!377919))))

(declare-datatypes ((SeekEntryResult!7002 0))(
  ( (MissingZero!7002 (index!30373 (_ BitVec 32))) (Found!7002 (index!30374 (_ BitVec 32))) (Intermediate!7002 (undefined!7814 Bool) (index!30375 (_ BitVec 32)) (x!59165 (_ BitVec 32))) (Undefined!7002) (MissingVacant!7002 (index!30376 (_ BitVec 32))) )
))
(declare-fun lt!307407 () SeekEntryResult!7002)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657857 (= res!426604 (and (= lt!307407 (Found!7002 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18562 a!2986) index!984) (select (arr!18562 a!2986) j!136))) (not (= (select (arr!18562 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38730 (_ BitVec 32)) SeekEntryResult!7002)

(assert (=> b!657857 (= lt!307407 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18562 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657858 () Bool)

(declare-fun res!426608 () Bool)

(assert (=> b!657858 (= res!426608 (arrayContainsKey!0 lt!307400 (select (arr!18562 a!2986) j!136) j!136))))

(assert (=> b!657858 (=> (not res!426608) (not e!377912))))

(declare-fun e!377916 () Bool)

(assert (=> b!657858 (= e!377916 e!377912)))

(declare-fun b!657859 () Bool)

(declare-fun e!377911 () Bool)

(assert (=> b!657859 (= e!377911 e!377921)))

(declare-fun res!426600 () Bool)

(assert (=> b!657859 (=> (not res!426600) (not e!377921))))

(assert (=> b!657859 (= res!426600 (= (select (store (arr!18562 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657859 (= lt!307400 (array!38731 (store (arr!18562 a!2986) i!1108 k0!1786) (size!18926 a!2986)))))

(declare-fun b!657860 () Bool)

(declare-fun res!426611 () Bool)

(assert (=> b!657860 (=> (not res!426611) (not e!377910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657860 (= res!426611 (validKeyInArray!0 (select (arr!18562 a!2986) j!136)))))

(declare-fun b!657861 () Bool)

(assert (=> b!657861 (= e!377922 (arrayContainsKey!0 lt!307400 (select (arr!18562 a!2986) j!136) index!984))))

(declare-fun b!657862 () Bool)

(declare-fun e!377920 () Bool)

(declare-fun lt!307390 () SeekEntryResult!7002)

(assert (=> b!657862 (= e!377920 (= lt!307407 lt!307390))))

(declare-fun b!657863 () Bool)

(declare-fun Unit!22777 () Unit!22774)

(assert (=> b!657863 (= e!377914 Unit!22777)))

(declare-fun b!657865 () Bool)

(declare-fun e!377917 () Unit!22774)

(declare-fun Unit!22778 () Unit!22774)

(assert (=> b!657865 (= e!377917 Unit!22778)))

(declare-fun res!426607 () Bool)

(assert (=> b!657865 (= res!426607 (= (select (store (arr!18562 a!2986) i!1108 k0!1786) index!984) (select (arr!18562 a!2986) j!136)))))

(declare-fun e!377908 () Bool)

(assert (=> b!657865 (=> (not res!426607) (not e!377908))))

(assert (=> b!657865 e!377908))

(declare-fun c!75997 () Bool)

(assert (=> b!657865 (= c!75997 (bvslt j!136 index!984))))

(declare-fun lt!307404 () Unit!22774)

(declare-fun e!377909 () Unit!22774)

(assert (=> b!657865 (= lt!307404 e!377909)))

(declare-fun c!75998 () Bool)

(assert (=> b!657865 (= c!75998 (bvslt index!984 j!136))))

(declare-fun lt!307394 () Unit!22774)

(assert (=> b!657865 (= lt!307394 e!377914)))

(assert (=> b!657865 false))

(declare-fun b!657866 () Bool)

(declare-fun e!377913 () Bool)

(assert (=> b!657866 (= e!377913 true)))

(assert (=> b!657866 (= (select (store (arr!18562 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657867 () Bool)

(declare-fun Unit!22779 () Unit!22774)

(assert (=> b!657867 (= e!377917 Unit!22779)))

(declare-fun b!657868 () Bool)

(declare-fun res!426609 () Bool)

(assert (=> b!657868 (=> (not res!426609) (not e!377910))))

(assert (=> b!657868 (= res!426609 (validKeyInArray!0 k0!1786))))

(declare-fun b!657869 () Bool)

(assert (=> b!657869 (= e!377910 e!377911)))

(declare-fun res!426601 () Bool)

(assert (=> b!657869 (=> (not res!426601) (not e!377911))))

(declare-fun lt!307395 () SeekEntryResult!7002)

(assert (=> b!657869 (= res!426601 (or (= lt!307395 (MissingZero!7002 i!1108)) (= lt!307395 (MissingVacant!7002 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38730 (_ BitVec 32)) SeekEntryResult!7002)

(assert (=> b!657869 (= lt!307395 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657870 () Bool)

(assert (=> b!657870 false))

(declare-fun lt!307405 () Unit!22774)

(assert (=> b!657870 (= lt!307405 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307400 (select (arr!18562 a!2986) j!136) j!136 Nil!12600))))

(assert (=> b!657870 (arrayNoDuplicates!0 lt!307400 j!136 Nil!12600)))

(declare-fun lt!307402 () Unit!22774)

(assert (=> b!657870 (= lt!307402 (lemmaNoDuplicateFromThenFromBigger!0 lt!307400 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657870 (arrayNoDuplicates!0 lt!307400 #b00000000000000000000000000000000 Nil!12600)))

(declare-fun lt!307408 () Unit!22774)

(assert (=> b!657870 (= lt!307408 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12600))))

(assert (=> b!657870 (arrayContainsKey!0 lt!307400 (select (arr!18562 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307391 () Unit!22774)

(assert (=> b!657870 (= lt!307391 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307400 (select (arr!18562 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22780 () Unit!22774)

(assert (=> b!657870 (= e!377909 Unit!22780)))

(declare-fun b!657871 () Bool)

(assert (=> b!657871 (= e!377919 (not e!377913))))

(declare-fun res!426614 () Bool)

(assert (=> b!657871 (=> res!426614 e!377913)))

(declare-fun lt!307389 () SeekEntryResult!7002)

(assert (=> b!657871 (= res!426614 (not (= lt!307389 (MissingVacant!7002 vacantSpotIndex!68))))))

(declare-fun lt!307396 () Unit!22774)

(assert (=> b!657871 (= lt!307396 e!377917)))

(declare-fun c!75995 () Bool)

(assert (=> b!657871 (= c!75995 (= lt!307389 (Found!7002 index!984)))))

(declare-fun lt!307399 () Unit!22774)

(declare-fun e!377915 () Unit!22774)

(assert (=> b!657871 (= lt!307399 e!377915)))

(declare-fun c!75996 () Bool)

(assert (=> b!657871 (= c!75996 (= lt!307389 Undefined!7002))))

(declare-fun lt!307401 () (_ BitVec 64))

(assert (=> b!657871 (= lt!307389 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307401 lt!307400 mask!3053))))

(assert (=> b!657871 e!377920))

(declare-fun res!426598 () Bool)

(assert (=> b!657871 (=> (not res!426598) (not e!377920))))

(declare-fun lt!307406 () (_ BitVec 32))

(assert (=> b!657871 (= res!426598 (= lt!307390 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307406 vacantSpotIndex!68 lt!307401 lt!307400 mask!3053)))))

(assert (=> b!657871 (= lt!307390 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307406 vacantSpotIndex!68 (select (arr!18562 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657871 (= lt!307401 (select (store (arr!18562 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307398 () Unit!22774)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38730 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22774)

(assert (=> b!657871 (= lt!307398 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307406 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657871 (= lt!307406 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657872 () Bool)

(declare-fun Unit!22781 () Unit!22774)

(assert (=> b!657872 (= e!377915 Unit!22781)))

(assert (=> b!657872 false))

(declare-fun b!657873 () Bool)

(declare-fun res!426613 () Bool)

(assert (=> b!657873 (=> (not res!426613) (not e!377910))))

(assert (=> b!657873 (= res!426613 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!426606 () Bool)

(assert (=> start!59572 (=> (not res!426606) (not e!377910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59572 (= res!426606 (validMask!0 mask!3053))))

(assert (=> start!59572 e!377910))

(assert (=> start!59572 true))

(declare-fun array_inv!14358 (array!38730) Bool)

(assert (=> start!59572 (array_inv!14358 a!2986)))

(declare-fun b!657864 () Bool)

(declare-fun res!426602 () Bool)

(assert (=> b!657864 (=> (not res!426602) (not e!377911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38730 (_ BitVec 32)) Bool)

(assert (=> b!657864 (= res!426602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657874 () Bool)

(declare-fun res!426612 () Bool)

(assert (=> b!657874 (=> (not res!426612) (not e!377911))))

(assert (=> b!657874 (= res!426612 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18562 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657875 () Bool)

(declare-fun Unit!22782 () Unit!22774)

(assert (=> b!657875 (= e!377909 Unit!22782)))

(declare-fun b!657876 () Bool)

(declare-fun Unit!22783 () Unit!22774)

(assert (=> b!657876 (= e!377915 Unit!22783)))

(declare-fun b!657877 () Bool)

(declare-fun res!426599 () Bool)

(assert (=> b!657877 (=> (not res!426599) (not e!377911))))

(assert (=> b!657877 (= res!426599 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12600))))

(declare-fun b!657878 () Bool)

(declare-fun res!426603 () Bool)

(assert (=> b!657878 (= res!426603 (bvsge j!136 index!984))))

(assert (=> b!657878 (=> res!426603 e!377916)))

(assert (=> b!657878 (= e!377908 e!377916)))

(assert (= (and start!59572 res!426606) b!657854))

(assert (= (and b!657854 res!426605) b!657860))

(assert (= (and b!657860 res!426611) b!657868))

(assert (= (and b!657868 res!426609) b!657873))

(assert (= (and b!657873 res!426613) b!657869))

(assert (= (and b!657869 res!426601) b!657864))

(assert (= (and b!657864 res!426602) b!657877))

(assert (= (and b!657877 res!426599) b!657874))

(assert (= (and b!657874 res!426612) b!657859))

(assert (= (and b!657859 res!426600) b!657857))

(assert (= (and b!657857 res!426604) b!657871))

(assert (= (and b!657871 res!426598) b!657862))

(assert (= (and b!657871 c!75996) b!657872))

(assert (= (and b!657871 (not c!75996)) b!657876))

(assert (= (and b!657871 c!75995) b!657865))

(assert (= (and b!657871 (not c!75995)) b!657867))

(assert (= (and b!657865 res!426607) b!657878))

(assert (= (and b!657878 (not res!426603)) b!657858))

(assert (= (and b!657858 res!426608) b!657856))

(assert (= (and b!657865 c!75997) b!657870))

(assert (= (and b!657865 (not c!75997)) b!657875))

(assert (= (and b!657865 c!75998) b!657855))

(assert (= (and b!657865 (not c!75998)) b!657863))

(assert (= (and b!657855 res!426610) b!657861))

(assert (= (and b!657871 (not res!426614)) b!657866))

(declare-fun m!630867 () Bool)

(assert (=> b!657865 m!630867))

(declare-fun m!630869 () Bool)

(assert (=> b!657865 m!630869))

(declare-fun m!630871 () Bool)

(assert (=> b!657865 m!630871))

(assert (=> b!657858 m!630871))

(assert (=> b!657858 m!630871))

(declare-fun m!630873 () Bool)

(assert (=> b!657858 m!630873))

(assert (=> b!657860 m!630871))

(assert (=> b!657860 m!630871))

(declare-fun m!630875 () Bool)

(assert (=> b!657860 m!630875))

(declare-fun m!630877 () Bool)

(assert (=> b!657869 m!630877))

(assert (=> b!657859 m!630867))

(declare-fun m!630879 () Bool)

(assert (=> b!657859 m!630879))

(declare-fun m!630881 () Bool)

(assert (=> start!59572 m!630881))

(declare-fun m!630883 () Bool)

(assert (=> start!59572 m!630883))

(declare-fun m!630885 () Bool)

(assert (=> b!657857 m!630885))

(assert (=> b!657857 m!630871))

(assert (=> b!657857 m!630871))

(declare-fun m!630887 () Bool)

(assert (=> b!657857 m!630887))

(declare-fun m!630889 () Bool)

(assert (=> b!657877 m!630889))

(declare-fun m!630891 () Bool)

(assert (=> b!657874 m!630891))

(declare-fun m!630893 () Bool)

(assert (=> b!657868 m!630893))

(assert (=> b!657866 m!630867))

(assert (=> b!657866 m!630869))

(declare-fun m!630895 () Bool)

(assert (=> b!657864 m!630895))

(assert (=> b!657855 m!630871))

(declare-fun m!630897 () Bool)

(assert (=> b!657855 m!630897))

(declare-fun m!630899 () Bool)

(assert (=> b!657855 m!630899))

(assert (=> b!657855 m!630871))

(assert (=> b!657855 m!630871))

(declare-fun m!630901 () Bool)

(assert (=> b!657855 m!630901))

(assert (=> b!657855 m!630871))

(declare-fun m!630903 () Bool)

(assert (=> b!657855 m!630903))

(assert (=> b!657855 m!630871))

(assert (=> b!657855 m!630873))

(declare-fun m!630905 () Bool)

(assert (=> b!657855 m!630905))

(declare-fun m!630907 () Bool)

(assert (=> b!657855 m!630907))

(declare-fun m!630909 () Bool)

(assert (=> b!657855 m!630909))

(assert (=> b!657856 m!630871))

(assert (=> b!657856 m!630871))

(declare-fun m!630911 () Bool)

(assert (=> b!657856 m!630911))

(assert (=> b!657861 m!630871))

(assert (=> b!657861 m!630871))

(assert (=> b!657861 m!630911))

(declare-fun m!630913 () Bool)

(assert (=> b!657871 m!630913))

(declare-fun m!630915 () Bool)

(assert (=> b!657871 m!630915))

(declare-fun m!630917 () Bool)

(assert (=> b!657871 m!630917))

(assert (=> b!657871 m!630871))

(assert (=> b!657871 m!630871))

(declare-fun m!630919 () Bool)

(assert (=> b!657871 m!630919))

(assert (=> b!657871 m!630867))

(declare-fun m!630921 () Bool)

(assert (=> b!657871 m!630921))

(declare-fun m!630923 () Bool)

(assert (=> b!657871 m!630923))

(declare-fun m!630925 () Bool)

(assert (=> b!657873 m!630925))

(assert (=> b!657870 m!630899))

(assert (=> b!657870 m!630871))

(declare-fun m!630927 () Bool)

(assert (=> b!657870 m!630927))

(assert (=> b!657870 m!630871))

(declare-fun m!630929 () Bool)

(assert (=> b!657870 m!630929))

(assert (=> b!657870 m!630871))

(declare-fun m!630931 () Bool)

(assert (=> b!657870 m!630931))

(assert (=> b!657870 m!630909))

(declare-fun m!630933 () Bool)

(assert (=> b!657870 m!630933))

(assert (=> b!657870 m!630871))

(declare-fun m!630935 () Bool)

(assert (=> b!657870 m!630935))

(check-sat (not b!657855) (not b!657861) (not b!657864) (not start!59572) (not b!657871) (not b!657877) (not b!657858) (not b!657856) (not b!657870) (not b!657860) (not b!657873) (not b!657869) (not b!657857) (not b!657868))
(check-sat)
