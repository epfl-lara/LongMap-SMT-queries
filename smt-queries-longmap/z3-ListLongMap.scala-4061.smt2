; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55596 () Bool)

(assert start!55596)

(declare-fun b!609321 () Bool)

(declare-fun e!348977 () Bool)

(declare-fun e!348979 () Bool)

(assert (=> b!609321 (= e!348977 e!348979)))

(declare-fun res!391863 () Bool)

(assert (=> b!609321 (=> (not res!391863) (not e!348979))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37327 0))(
  ( (array!37328 (arr!17914 (Array (_ BitVec 32) (_ BitVec 64))) (size!18278 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37327)

(declare-fun lt!278518 () array!37327)

(declare-fun arrayContainsKey!0 (array!37327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609321 (= res!391863 (arrayContainsKey!0 lt!278518 (select (arr!17914 a!2986) j!136) j!136))))

(declare-fun b!609322 () Bool)

(declare-fun res!391882 () Bool)

(declare-fun e!348978 () Bool)

(assert (=> b!609322 (=> (not res!391882) (not e!348978))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609322 (= res!391882 (validKeyInArray!0 k0!1786))))

(declare-fun b!609323 () Bool)

(declare-fun res!391868 () Bool)

(declare-fun e!348966 () Bool)

(assert (=> b!609323 (=> (not res!391868) (not e!348966))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37327 (_ BitVec 32)) Bool)

(assert (=> b!609323 (= res!391868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609324 () Bool)

(declare-fun e!348975 () Bool)

(declare-fun e!348968 () Bool)

(assert (=> b!609324 (= e!348975 e!348968)))

(declare-fun res!391879 () Bool)

(assert (=> b!609324 (=> res!391879 e!348968)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609324 (= res!391879 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19504 0))(
  ( (Unit!19505) )
))
(declare-fun lt!278517 () Unit!19504)

(declare-fun e!348981 () Unit!19504)

(assert (=> b!609324 (= lt!278517 e!348981)))

(declare-fun c!69097 () Bool)

(assert (=> b!609324 (= c!69097 (bvslt j!136 index!984))))

(declare-fun b!609325 () Bool)

(assert (=> b!609325 (= e!348979 (arrayContainsKey!0 lt!278518 (select (arr!17914 a!2986) j!136) index!984))))

(declare-fun b!609326 () Bool)

(declare-fun res!391869 () Bool)

(assert (=> b!609326 (=> (not res!391869) (not e!348978))))

(assert (=> b!609326 (= res!391869 (validKeyInArray!0 (select (arr!17914 a!2986) j!136)))))

(declare-fun b!609327 () Bool)

(declare-fun res!391865 () Bool)

(assert (=> b!609327 (=> (not res!391865) (not e!348966))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609327 (= res!391865 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17914 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609328 () Bool)

(declare-fun e!348980 () Bool)

(assert (=> b!609328 (= e!348980 true)))

(declare-fun lt!278513 () Bool)

(declare-datatypes ((List!11955 0))(
  ( (Nil!11952) (Cons!11951 (h!12996 (_ BitVec 64)) (t!18183 List!11955)) )
))
(declare-fun contains!3031 (List!11955 (_ BitVec 64)) Bool)

(assert (=> b!609328 (= lt!278513 (contains!3031 Nil!11952 k0!1786))))

(declare-fun b!609329 () Bool)

(assert (=> b!609329 (= e!348968 e!348980)))

(declare-fun res!391872 () Bool)

(assert (=> b!609329 (=> res!391872 e!348980)))

(assert (=> b!609329 (= res!391872 (or (bvsge (size!18278 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18278 a!2986))))))

(assert (=> b!609329 (arrayContainsKey!0 lt!278518 (select (arr!17914 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278521 () Unit!19504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37327 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19504)

(assert (=> b!609329 (= lt!278521 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278518 (select (arr!17914 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348973 () Bool)

(assert (=> b!609329 e!348973))

(declare-fun res!391866 () Bool)

(assert (=> b!609329 (=> (not res!391866) (not e!348973))))

(assert (=> b!609329 (= res!391866 (arrayContainsKey!0 lt!278518 (select (arr!17914 a!2986) j!136) j!136))))

(declare-fun b!609330 () Bool)

(declare-fun res!391861 () Bool)

(assert (=> b!609330 (=> res!391861 e!348980)))

(assert (=> b!609330 (= res!391861 (contains!3031 Nil!11952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609331 () Bool)

(declare-fun e!348972 () Bool)

(declare-fun e!348969 () Bool)

(assert (=> b!609331 (= e!348972 (not e!348969))))

(declare-fun res!391873 () Bool)

(assert (=> b!609331 (=> res!391873 e!348969)))

(declare-datatypes ((SeekEntryResult!6354 0))(
  ( (MissingZero!6354 (index!27691 (_ BitVec 32))) (Found!6354 (index!27692 (_ BitVec 32))) (Intermediate!6354 (undefined!7166 Bool) (index!27693 (_ BitVec 32)) (x!56495 (_ BitVec 32))) (Undefined!6354) (MissingVacant!6354 (index!27694 (_ BitVec 32))) )
))
(declare-fun lt!278511 () SeekEntryResult!6354)

(assert (=> b!609331 (= res!391873 (not (= lt!278511 (Found!6354 index!984))))))

(declare-fun lt!278509 () Unit!19504)

(declare-fun e!348970 () Unit!19504)

(assert (=> b!609331 (= lt!278509 e!348970)))

(declare-fun c!69098 () Bool)

(assert (=> b!609331 (= c!69098 (= lt!278511 Undefined!6354))))

(declare-fun lt!278524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37327 (_ BitVec 32)) SeekEntryResult!6354)

(assert (=> b!609331 (= lt!278511 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278524 lt!278518 mask!3053))))

(declare-fun e!348967 () Bool)

(assert (=> b!609331 e!348967))

(declare-fun res!391877 () Bool)

(assert (=> b!609331 (=> (not res!391877) (not e!348967))))

(declare-fun lt!278520 () SeekEntryResult!6354)

(declare-fun lt!278515 () (_ BitVec 32))

(assert (=> b!609331 (= res!391877 (= lt!278520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278515 vacantSpotIndex!68 lt!278524 lt!278518 mask!3053)))))

(assert (=> b!609331 (= lt!278520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278515 vacantSpotIndex!68 (select (arr!17914 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609331 (= lt!278524 (select (store (arr!17914 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278516 () Unit!19504)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19504)

(assert (=> b!609331 (= lt!278516 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278515 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609331 (= lt!278515 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609332 () Bool)

(declare-fun res!391870 () Bool)

(assert (=> b!609332 (=> (not res!391870) (not e!348966))))

(declare-fun arrayNoDuplicates!0 (array!37327 (_ BitVec 32) List!11955) Bool)

(assert (=> b!609332 (= res!391870 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11952))))

(declare-fun b!609333 () Bool)

(assert (=> b!609333 (= e!348978 e!348966)))

(declare-fun res!391881 () Bool)

(assert (=> b!609333 (=> (not res!391881) (not e!348966))))

(declare-fun lt!278514 () SeekEntryResult!6354)

(assert (=> b!609333 (= res!391881 (or (= lt!278514 (MissingZero!6354 i!1108)) (= lt!278514 (MissingVacant!6354 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37327 (_ BitVec 32)) SeekEntryResult!6354)

(assert (=> b!609333 (= lt!278514 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!391874 () Bool)

(assert (=> start!55596 (=> (not res!391874) (not e!348978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55596 (= res!391874 (validMask!0 mask!3053))))

(assert (=> start!55596 e!348978))

(assert (=> start!55596 true))

(declare-fun array_inv!13710 (array!37327) Bool)

(assert (=> start!55596 (array_inv!13710 a!2986)))

(declare-fun b!609334 () Bool)

(declare-fun e!348971 () Bool)

(assert (=> b!609334 (= e!348966 e!348971)))

(declare-fun res!391875 () Bool)

(assert (=> b!609334 (=> (not res!391875) (not e!348971))))

(assert (=> b!609334 (= res!391875 (= (select (store (arr!17914 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609334 (= lt!278518 (array!37328 (store (arr!17914 a!2986) i!1108 k0!1786) (size!18278 a!2986)))))

(declare-fun b!609335 () Bool)

(declare-fun lt!278522 () SeekEntryResult!6354)

(assert (=> b!609335 (= e!348967 (= lt!278522 lt!278520))))

(declare-fun b!609336 () Bool)

(declare-fun Unit!19506 () Unit!19504)

(assert (=> b!609336 (= e!348981 Unit!19506)))

(declare-fun lt!278510 () Unit!19504)

(assert (=> b!609336 (= lt!278510 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278518 (select (arr!17914 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609336 (arrayContainsKey!0 lt!278518 (select (arr!17914 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278519 () Unit!19504)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37327 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11955) Unit!19504)

(assert (=> b!609336 (= lt!278519 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11952))))

(assert (=> b!609336 (arrayNoDuplicates!0 lt!278518 #b00000000000000000000000000000000 Nil!11952)))

(declare-fun lt!278523 () Unit!19504)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37327 (_ BitVec 32) (_ BitVec 32)) Unit!19504)

(assert (=> b!609336 (= lt!278523 (lemmaNoDuplicateFromThenFromBigger!0 lt!278518 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609336 (arrayNoDuplicates!0 lt!278518 j!136 Nil!11952)))

(declare-fun lt!278512 () Unit!19504)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37327 (_ BitVec 64) (_ BitVec 32) List!11955) Unit!19504)

(assert (=> b!609336 (= lt!278512 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278518 (select (arr!17914 a!2986) j!136) j!136 Nil!11952))))

(assert (=> b!609336 false))

(declare-fun b!609337 () Bool)

(declare-fun Unit!19507 () Unit!19504)

(assert (=> b!609337 (= e!348981 Unit!19507)))

(declare-fun b!609338 () Bool)

(declare-fun res!391880 () Bool)

(assert (=> b!609338 (=> (not res!391880) (not e!348978))))

(assert (=> b!609338 (= res!391880 (and (= (size!18278 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18278 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18278 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609339 () Bool)

(declare-fun Unit!19508 () Unit!19504)

(assert (=> b!609339 (= e!348970 Unit!19508)))

(assert (=> b!609339 false))

(declare-fun b!609340 () Bool)

(declare-fun res!391878 () Bool)

(assert (=> b!609340 (=> (not res!391878) (not e!348978))))

(assert (=> b!609340 (= res!391878 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609341 () Bool)

(assert (=> b!609341 (= e!348971 e!348972)))

(declare-fun res!391862 () Bool)

(assert (=> b!609341 (=> (not res!391862) (not e!348972))))

(assert (=> b!609341 (= res!391862 (and (= lt!278522 (Found!6354 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17914 a!2986) index!984) (select (arr!17914 a!2986) j!136))) (not (= (select (arr!17914 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609341 (= lt!278522 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17914 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609342 () Bool)

(declare-fun res!391867 () Bool)

(assert (=> b!609342 (=> res!391867 e!348980)))

(assert (=> b!609342 (= res!391867 (contains!3031 Nil!11952 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609343 () Bool)

(declare-fun Unit!19509 () Unit!19504)

(assert (=> b!609343 (= e!348970 Unit!19509)))

(declare-fun b!609344 () Bool)

(assert (=> b!609344 (= e!348969 e!348975)))

(declare-fun res!391864 () Bool)

(assert (=> b!609344 (=> res!391864 e!348975)))

(declare-fun lt!278508 () (_ BitVec 64))

(assert (=> b!609344 (= res!391864 (or (not (= (select (arr!17914 a!2986) j!136) lt!278524)) (not (= (select (arr!17914 a!2986) j!136) lt!278508))))))

(declare-fun e!348974 () Bool)

(assert (=> b!609344 e!348974))

(declare-fun res!391876 () Bool)

(assert (=> b!609344 (=> (not res!391876) (not e!348974))))

(assert (=> b!609344 (= res!391876 (= lt!278508 (select (arr!17914 a!2986) j!136)))))

(assert (=> b!609344 (= lt!278508 (select (store (arr!17914 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609345 () Bool)

(assert (=> b!609345 (= e!348973 (arrayContainsKey!0 lt!278518 (select (arr!17914 a!2986) j!136) index!984))))

(declare-fun b!609346 () Bool)

(assert (=> b!609346 (= e!348974 e!348977)))

(declare-fun res!391883 () Bool)

(assert (=> b!609346 (=> res!391883 e!348977)))

(assert (=> b!609346 (= res!391883 (or (not (= (select (arr!17914 a!2986) j!136) lt!278524)) (not (= (select (arr!17914 a!2986) j!136) lt!278508)) (bvsge j!136 index!984)))))

(declare-fun b!609347 () Bool)

(declare-fun res!391871 () Bool)

(assert (=> b!609347 (=> res!391871 e!348980)))

(declare-fun noDuplicate!337 (List!11955) Bool)

(assert (=> b!609347 (= res!391871 (not (noDuplicate!337 Nil!11952)))))

(assert (= (and start!55596 res!391874) b!609338))

(assert (= (and b!609338 res!391880) b!609326))

(assert (= (and b!609326 res!391869) b!609322))

(assert (= (and b!609322 res!391882) b!609340))

(assert (= (and b!609340 res!391878) b!609333))

(assert (= (and b!609333 res!391881) b!609323))

(assert (= (and b!609323 res!391868) b!609332))

(assert (= (and b!609332 res!391870) b!609327))

(assert (= (and b!609327 res!391865) b!609334))

(assert (= (and b!609334 res!391875) b!609341))

(assert (= (and b!609341 res!391862) b!609331))

(assert (= (and b!609331 res!391877) b!609335))

(assert (= (and b!609331 c!69098) b!609339))

(assert (= (and b!609331 (not c!69098)) b!609343))

(assert (= (and b!609331 (not res!391873)) b!609344))

(assert (= (and b!609344 res!391876) b!609346))

(assert (= (and b!609346 (not res!391883)) b!609321))

(assert (= (and b!609321 res!391863) b!609325))

(assert (= (and b!609344 (not res!391864)) b!609324))

(assert (= (and b!609324 c!69097) b!609336))

(assert (= (and b!609324 (not c!69097)) b!609337))

(assert (= (and b!609324 (not res!391879)) b!609329))

(assert (= (and b!609329 res!391866) b!609345))

(assert (= (and b!609329 (not res!391872)) b!609347))

(assert (= (and b!609347 (not res!391871)) b!609330))

(assert (= (and b!609330 (not res!391861)) b!609342))

(assert (= (and b!609342 (not res!391867)) b!609328))

(declare-fun m!585851 () Bool)

(assert (=> b!609336 m!585851))

(declare-fun m!585853 () Bool)

(assert (=> b!609336 m!585853))

(declare-fun m!585855 () Bool)

(assert (=> b!609336 m!585855))

(declare-fun m!585857 () Bool)

(assert (=> b!609336 m!585857))

(assert (=> b!609336 m!585853))

(declare-fun m!585859 () Bool)

(assert (=> b!609336 m!585859))

(assert (=> b!609336 m!585853))

(declare-fun m!585861 () Bool)

(assert (=> b!609336 m!585861))

(declare-fun m!585863 () Bool)

(assert (=> b!609336 m!585863))

(assert (=> b!609336 m!585853))

(declare-fun m!585865 () Bool)

(assert (=> b!609336 m!585865))

(assert (=> b!609325 m!585853))

(assert (=> b!609325 m!585853))

(declare-fun m!585867 () Bool)

(assert (=> b!609325 m!585867))

(declare-fun m!585869 () Bool)

(assert (=> b!609333 m!585869))

(assert (=> b!609326 m!585853))

(assert (=> b!609326 m!585853))

(declare-fun m!585871 () Bool)

(assert (=> b!609326 m!585871))

(declare-fun m!585873 () Bool)

(assert (=> b!609331 m!585873))

(declare-fun m!585875 () Bool)

(assert (=> b!609331 m!585875))

(assert (=> b!609331 m!585853))

(declare-fun m!585877 () Bool)

(assert (=> b!609331 m!585877))

(assert (=> b!609331 m!585853))

(declare-fun m!585879 () Bool)

(assert (=> b!609331 m!585879))

(declare-fun m!585881 () Bool)

(assert (=> b!609331 m!585881))

(declare-fun m!585883 () Bool)

(assert (=> b!609331 m!585883))

(declare-fun m!585885 () Bool)

(assert (=> b!609331 m!585885))

(declare-fun m!585887 () Bool)

(assert (=> b!609322 m!585887))

(declare-fun m!585889 () Bool)

(assert (=> b!609342 m!585889))

(declare-fun m!585891 () Bool)

(assert (=> b!609341 m!585891))

(assert (=> b!609341 m!585853))

(assert (=> b!609341 m!585853))

(declare-fun m!585893 () Bool)

(assert (=> b!609341 m!585893))

(declare-fun m!585895 () Bool)

(assert (=> b!609323 m!585895))

(assert (=> b!609346 m!585853))

(declare-fun m!585897 () Bool)

(assert (=> b!609327 m!585897))

(declare-fun m!585899 () Bool)

(assert (=> b!609340 m!585899))

(assert (=> b!609334 m!585877))

(declare-fun m!585901 () Bool)

(assert (=> b!609334 m!585901))

(declare-fun m!585903 () Bool)

(assert (=> b!609328 m!585903))

(declare-fun m!585905 () Bool)

(assert (=> b!609332 m!585905))

(assert (=> b!609321 m!585853))

(assert (=> b!609321 m!585853))

(declare-fun m!585907 () Bool)

(assert (=> b!609321 m!585907))

(declare-fun m!585909 () Bool)

(assert (=> start!55596 m!585909))

(declare-fun m!585911 () Bool)

(assert (=> start!55596 m!585911))

(assert (=> b!609344 m!585853))

(assert (=> b!609344 m!585877))

(declare-fun m!585913 () Bool)

(assert (=> b!609344 m!585913))

(assert (=> b!609329 m!585853))

(assert (=> b!609329 m!585853))

(declare-fun m!585915 () Bool)

(assert (=> b!609329 m!585915))

(assert (=> b!609329 m!585853))

(declare-fun m!585917 () Bool)

(assert (=> b!609329 m!585917))

(assert (=> b!609329 m!585853))

(assert (=> b!609329 m!585907))

(declare-fun m!585919 () Bool)

(assert (=> b!609347 m!585919))

(declare-fun m!585921 () Bool)

(assert (=> b!609330 m!585921))

(assert (=> b!609345 m!585853))

(assert (=> b!609345 m!585853))

(assert (=> b!609345 m!585867))

(check-sat (not b!609323) (not b!609325) (not b!609345) (not b!609330) (not b!609322) (not b!609332) (not b!609333) (not b!609347) (not b!609321) (not b!609328) (not b!609341) (not b!609329) (not b!609340) (not b!609336) (not b!609326) (not start!55596) (not b!609342) (not b!609331))
(check-sat)
