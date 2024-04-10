; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55572 () Bool)

(assert start!55572)

(declare-fun b!608349 () Bool)

(declare-fun e!348402 () Bool)

(declare-fun e!348403 () Bool)

(assert (=> b!608349 (= e!348402 (not e!348403))))

(declare-fun res!391039 () Bool)

(assert (=> b!608349 (=> res!391039 e!348403)))

(declare-datatypes ((SeekEntryResult!6342 0))(
  ( (MissingZero!6342 (index!27643 (_ BitVec 32))) (Found!6342 (index!27644 (_ BitVec 32))) (Intermediate!6342 (undefined!7154 Bool) (index!27645 (_ BitVec 32)) (x!56451 (_ BitVec 32))) (Undefined!6342) (MissingVacant!6342 (index!27646 (_ BitVec 32))) )
))
(declare-fun lt!277897 () SeekEntryResult!6342)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!608349 (= res!391039 (not (= lt!277897 (Found!6342 index!984))))))

(declare-datatypes ((Unit!19432 0))(
  ( (Unit!19433) )
))
(declare-fun lt!277911 () Unit!19432)

(declare-fun e!348398 () Unit!19432)

(assert (=> b!608349 (= lt!277911 e!348398)))

(declare-fun c!69025 () Bool)

(assert (=> b!608349 (= c!69025 (= lt!277897 Undefined!6342))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37303 0))(
  ( (array!37304 (arr!17902 (Array (_ BitVec 32) (_ BitVec 64))) (size!18266 (_ BitVec 32))) )
))
(declare-fun lt!277901 () array!37303)

(declare-fun lt!277904 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37303 (_ BitVec 32)) SeekEntryResult!6342)

(assert (=> b!608349 (= lt!277897 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277904 lt!277901 mask!3053))))

(declare-fun e!348391 () Bool)

(assert (=> b!608349 e!348391))

(declare-fun res!391053 () Bool)

(assert (=> b!608349 (=> (not res!391053) (not e!348391))))

(declare-fun lt!277910 () (_ BitVec 32))

(declare-fun lt!277907 () SeekEntryResult!6342)

(assert (=> b!608349 (= res!391053 (= lt!277907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277910 vacantSpotIndex!68 lt!277904 lt!277901 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37303)

(assert (=> b!608349 (= lt!277907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277910 vacantSpotIndex!68 (select (arr!17902 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!608349 (= lt!277904 (select (store (arr!17902 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277896 () Unit!19432)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37303 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19432)

(assert (=> b!608349 (= lt!277896 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277910 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608349 (= lt!277910 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608350 () Bool)

(declare-fun res!391050 () Bool)

(declare-fun e!348390 () Bool)

(assert (=> b!608350 (=> (not res!391050) (not e!348390))))

(declare-fun arrayContainsKey!0 (array!37303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608350 (= res!391050 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608351 () Bool)

(declare-fun res!391044 () Bool)

(declare-fun e!348399 () Bool)

(assert (=> b!608351 (=> res!391044 e!348399)))

(declare-datatypes ((List!11943 0))(
  ( (Nil!11940) (Cons!11939 (h!12984 (_ BitVec 64)) (t!18171 List!11943)) )
))
(declare-fun contains!3019 (List!11943 (_ BitVec 64)) Bool)

(assert (=> b!608351 (= res!391044 (contains!3019 Nil!11940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608352 () Bool)

(declare-fun e!348397 () Bool)

(assert (=> b!608352 (= e!348397 e!348399)))

(declare-fun res!391055 () Bool)

(assert (=> b!608352 (=> res!391055 e!348399)))

(assert (=> b!608352 (= res!391055 (or (bvsge (size!18266 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18266 a!2986))))))

(assert (=> b!608352 (arrayContainsKey!0 lt!277901 (select (arr!17902 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277909 () Unit!19432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37303 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19432)

(assert (=> b!608352 (= lt!277909 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277901 (select (arr!17902 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348401 () Bool)

(assert (=> b!608352 e!348401))

(declare-fun res!391048 () Bool)

(assert (=> b!608352 (=> (not res!391048) (not e!348401))))

(assert (=> b!608352 (= res!391048 (arrayContainsKey!0 lt!277901 (select (arr!17902 a!2986) j!136) j!136))))

(declare-fun b!608353 () Bool)

(declare-fun e!348393 () Bool)

(assert (=> b!608353 (= e!348390 e!348393)))

(declare-fun res!391046 () Bool)

(assert (=> b!608353 (=> (not res!391046) (not e!348393))))

(declare-fun lt!277912 () SeekEntryResult!6342)

(assert (=> b!608353 (= res!391046 (or (= lt!277912 (MissingZero!6342 i!1108)) (= lt!277912 (MissingVacant!6342 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37303 (_ BitVec 32)) SeekEntryResult!6342)

(assert (=> b!608353 (= lt!277912 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608354 () Bool)

(assert (=> b!608354 (= e!348401 (arrayContainsKey!0 lt!277901 (select (arr!17902 a!2986) j!136) index!984))))

(declare-fun res!391035 () Bool)

(assert (=> start!55572 (=> (not res!391035) (not e!348390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55572 (= res!391035 (validMask!0 mask!3053))))

(assert (=> start!55572 e!348390))

(assert (=> start!55572 true))

(declare-fun array_inv!13698 (array!37303) Bool)

(assert (=> start!55572 (array_inv!13698 a!2986)))

(declare-fun b!608355 () Bool)

(declare-fun e!348396 () Bool)

(assert (=> b!608355 (= e!348396 e!348397)))

(declare-fun res!391033 () Bool)

(assert (=> b!608355 (=> res!391033 e!348397)))

(assert (=> b!608355 (= res!391033 (bvsge index!984 j!136))))

(declare-fun lt!277898 () Unit!19432)

(declare-fun e!348394 () Unit!19432)

(assert (=> b!608355 (= lt!277898 e!348394)))

(declare-fun c!69026 () Bool)

(assert (=> b!608355 (= c!69026 (bvslt j!136 index!984))))

(declare-fun b!608356 () Bool)

(declare-fun res!391043 () Bool)

(assert (=> b!608356 (=> (not res!391043) (not e!348393))))

(assert (=> b!608356 (= res!391043 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17902 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608357 () Bool)

(declare-fun res!391047 () Bool)

(assert (=> b!608357 (=> (not res!391047) (not e!348390))))

(assert (=> b!608357 (= res!391047 (and (= (size!18266 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18266 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18266 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608358 () Bool)

(declare-fun e!348400 () Bool)

(assert (=> b!608358 (= e!348400 e!348402)))

(declare-fun res!391041 () Bool)

(assert (=> b!608358 (=> (not res!391041) (not e!348402))))

(declare-fun lt!277903 () SeekEntryResult!6342)

(assert (=> b!608358 (= res!391041 (and (= lt!277903 (Found!6342 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17902 a!2986) index!984) (select (arr!17902 a!2986) j!136))) (not (= (select (arr!17902 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608358 (= lt!277903 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17902 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608359 () Bool)

(declare-fun res!391040 () Bool)

(assert (=> b!608359 (=> (not res!391040) (not e!348390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608359 (= res!391040 (validKeyInArray!0 (select (arr!17902 a!2986) j!136)))))

(declare-fun b!608360 () Bool)

(declare-fun res!391036 () Bool)

(assert (=> b!608360 (=> res!391036 e!348399)))

(declare-fun noDuplicate!325 (List!11943) Bool)

(assert (=> b!608360 (= res!391036 (not (noDuplicate!325 Nil!11940)))))

(declare-fun b!608361 () Bool)

(declare-fun Unit!19434 () Unit!19432)

(assert (=> b!608361 (= e!348398 Unit!19434)))

(assert (=> b!608361 false))

(declare-fun b!608362 () Bool)

(declare-fun res!391038 () Bool)

(assert (=> b!608362 (=> (not res!391038) (not e!348390))))

(assert (=> b!608362 (= res!391038 (validKeyInArray!0 k0!1786))))

(declare-fun b!608363 () Bool)

(assert (=> b!608363 (= e!348391 (= lt!277903 lt!277907))))

(declare-fun b!608364 () Bool)

(assert (=> b!608364 (= e!348399 true)))

(declare-fun lt!277905 () Bool)

(assert (=> b!608364 (= lt!277905 (contains!3019 Nil!11940 k0!1786))))

(declare-fun b!608365 () Bool)

(assert (=> b!608365 (= e!348393 e!348400)))

(declare-fun res!391052 () Bool)

(assert (=> b!608365 (=> (not res!391052) (not e!348400))))

(assert (=> b!608365 (= res!391052 (= (select (store (arr!17902 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608365 (= lt!277901 (array!37304 (store (arr!17902 a!2986) i!1108 k0!1786) (size!18266 a!2986)))))

(declare-fun e!348392 () Bool)

(declare-fun b!608366 () Bool)

(assert (=> b!608366 (= e!348392 (arrayContainsKey!0 lt!277901 (select (arr!17902 a!2986) j!136) index!984))))

(declare-fun b!608367 () Bool)

(declare-fun res!391054 () Bool)

(assert (=> b!608367 (=> (not res!391054) (not e!348393))))

(declare-fun arrayNoDuplicates!0 (array!37303 (_ BitVec 32) List!11943) Bool)

(assert (=> b!608367 (= res!391054 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11940))))

(declare-fun b!608368 () Bool)

(declare-fun Unit!19435 () Unit!19432)

(assert (=> b!608368 (= e!348398 Unit!19435)))

(declare-fun b!608369 () Bool)

(declare-fun e!348405 () Bool)

(declare-fun e!348404 () Bool)

(assert (=> b!608369 (= e!348405 e!348404)))

(declare-fun res!391034 () Bool)

(assert (=> b!608369 (=> res!391034 e!348404)))

(declare-fun lt!277899 () (_ BitVec 64))

(assert (=> b!608369 (= res!391034 (or (not (= (select (arr!17902 a!2986) j!136) lt!277904)) (not (= (select (arr!17902 a!2986) j!136) lt!277899)) (bvsge j!136 index!984)))))

(declare-fun b!608370 () Bool)

(declare-fun res!391037 () Bool)

(assert (=> b!608370 (=> res!391037 e!348399)))

(assert (=> b!608370 (= res!391037 (contains!3019 Nil!11940 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608371 () Bool)

(declare-fun res!391045 () Bool)

(assert (=> b!608371 (=> (not res!391045) (not e!348393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37303 (_ BitVec 32)) Bool)

(assert (=> b!608371 (= res!391045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608372 () Bool)

(assert (=> b!608372 (= e!348404 e!348392)))

(declare-fun res!391049 () Bool)

(assert (=> b!608372 (=> (not res!391049) (not e!348392))))

(assert (=> b!608372 (= res!391049 (arrayContainsKey!0 lt!277901 (select (arr!17902 a!2986) j!136) j!136))))

(declare-fun b!608373 () Bool)

(assert (=> b!608373 (= e!348403 e!348396)))

(declare-fun res!391042 () Bool)

(assert (=> b!608373 (=> res!391042 e!348396)))

(assert (=> b!608373 (= res!391042 (or (not (= (select (arr!17902 a!2986) j!136) lt!277904)) (not (= (select (arr!17902 a!2986) j!136) lt!277899))))))

(assert (=> b!608373 e!348405))

(declare-fun res!391051 () Bool)

(assert (=> b!608373 (=> (not res!391051) (not e!348405))))

(assert (=> b!608373 (= res!391051 (= lt!277899 (select (arr!17902 a!2986) j!136)))))

(assert (=> b!608373 (= lt!277899 (select (store (arr!17902 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608374 () Bool)

(declare-fun Unit!19436 () Unit!19432)

(assert (=> b!608374 (= e!348394 Unit!19436)))

(declare-fun lt!277902 () Unit!19432)

(assert (=> b!608374 (= lt!277902 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277901 (select (arr!17902 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608374 (arrayContainsKey!0 lt!277901 (select (arr!17902 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277908 () Unit!19432)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37303 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11943) Unit!19432)

(assert (=> b!608374 (= lt!277908 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11940))))

(assert (=> b!608374 (arrayNoDuplicates!0 lt!277901 #b00000000000000000000000000000000 Nil!11940)))

(declare-fun lt!277900 () Unit!19432)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37303 (_ BitVec 32) (_ BitVec 32)) Unit!19432)

(assert (=> b!608374 (= lt!277900 (lemmaNoDuplicateFromThenFromBigger!0 lt!277901 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608374 (arrayNoDuplicates!0 lt!277901 j!136 Nil!11940)))

(declare-fun lt!277906 () Unit!19432)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37303 (_ BitVec 64) (_ BitVec 32) List!11943) Unit!19432)

(assert (=> b!608374 (= lt!277906 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277901 (select (arr!17902 a!2986) j!136) j!136 Nil!11940))))

(assert (=> b!608374 false))

(declare-fun b!608375 () Bool)

(declare-fun Unit!19437 () Unit!19432)

(assert (=> b!608375 (= e!348394 Unit!19437)))

(assert (= (and start!55572 res!391035) b!608357))

(assert (= (and b!608357 res!391047) b!608359))

(assert (= (and b!608359 res!391040) b!608362))

(assert (= (and b!608362 res!391038) b!608350))

(assert (= (and b!608350 res!391050) b!608353))

(assert (= (and b!608353 res!391046) b!608371))

(assert (= (and b!608371 res!391045) b!608367))

(assert (= (and b!608367 res!391054) b!608356))

(assert (= (and b!608356 res!391043) b!608365))

(assert (= (and b!608365 res!391052) b!608358))

(assert (= (and b!608358 res!391041) b!608349))

(assert (= (and b!608349 res!391053) b!608363))

(assert (= (and b!608349 c!69025) b!608361))

(assert (= (and b!608349 (not c!69025)) b!608368))

(assert (= (and b!608349 (not res!391039)) b!608373))

(assert (= (and b!608373 res!391051) b!608369))

(assert (= (and b!608369 (not res!391034)) b!608372))

(assert (= (and b!608372 res!391049) b!608366))

(assert (= (and b!608373 (not res!391042)) b!608355))

(assert (= (and b!608355 c!69026) b!608374))

(assert (= (and b!608355 (not c!69026)) b!608375))

(assert (= (and b!608355 (not res!391033)) b!608352))

(assert (= (and b!608352 res!391048) b!608354))

(assert (= (and b!608352 (not res!391055)) b!608360))

(assert (= (and b!608360 (not res!391036)) b!608351))

(assert (= (and b!608351 (not res!391044)) b!608370))

(assert (= (and b!608370 (not res!391037)) b!608364))

(declare-fun m!584987 () Bool)

(assert (=> b!608366 m!584987))

(assert (=> b!608366 m!584987))

(declare-fun m!584989 () Bool)

(assert (=> b!608366 m!584989))

(assert (=> b!608352 m!584987))

(assert (=> b!608352 m!584987))

(declare-fun m!584991 () Bool)

(assert (=> b!608352 m!584991))

(assert (=> b!608352 m!584987))

(declare-fun m!584993 () Bool)

(assert (=> b!608352 m!584993))

(assert (=> b!608352 m!584987))

(declare-fun m!584995 () Bool)

(assert (=> b!608352 m!584995))

(declare-fun m!584997 () Bool)

(assert (=> b!608367 m!584997))

(declare-fun m!584999 () Bool)

(assert (=> b!608350 m!584999))

(assert (=> b!608372 m!584987))

(assert (=> b!608372 m!584987))

(assert (=> b!608372 m!584995))

(declare-fun m!585001 () Bool)

(assert (=> b!608362 m!585001))

(assert (=> b!608354 m!584987))

(assert (=> b!608354 m!584987))

(assert (=> b!608354 m!584989))

(declare-fun m!585003 () Bool)

(assert (=> b!608370 m!585003))

(declare-fun m!585005 () Bool)

(assert (=> b!608356 m!585005))

(declare-fun m!585007 () Bool)

(assert (=> b!608360 m!585007))

(declare-fun m!585009 () Bool)

(assert (=> b!608358 m!585009))

(assert (=> b!608358 m!584987))

(assert (=> b!608358 m!584987))

(declare-fun m!585011 () Bool)

(assert (=> b!608358 m!585011))

(declare-fun m!585013 () Bool)

(assert (=> b!608351 m!585013))

(assert (=> b!608359 m!584987))

(assert (=> b!608359 m!584987))

(declare-fun m!585015 () Bool)

(assert (=> b!608359 m!585015))

(declare-fun m!585017 () Bool)

(assert (=> b!608365 m!585017))

(declare-fun m!585019 () Bool)

(assert (=> b!608365 m!585019))

(declare-fun m!585021 () Bool)

(assert (=> b!608371 m!585021))

(assert (=> b!608373 m!584987))

(assert (=> b!608373 m!585017))

(declare-fun m!585023 () Bool)

(assert (=> b!608373 m!585023))

(declare-fun m!585025 () Bool)

(assert (=> b!608349 m!585025))

(declare-fun m!585027 () Bool)

(assert (=> b!608349 m!585027))

(assert (=> b!608349 m!584987))

(assert (=> b!608349 m!585017))

(assert (=> b!608349 m!584987))

(declare-fun m!585029 () Bool)

(assert (=> b!608349 m!585029))

(declare-fun m!585031 () Bool)

(assert (=> b!608349 m!585031))

(declare-fun m!585033 () Bool)

(assert (=> b!608349 m!585033))

(declare-fun m!585035 () Bool)

(assert (=> b!608349 m!585035))

(declare-fun m!585037 () Bool)

(assert (=> start!55572 m!585037))

(declare-fun m!585039 () Bool)

(assert (=> start!55572 m!585039))

(assert (=> b!608369 m!584987))

(declare-fun m!585041 () Bool)

(assert (=> b!608364 m!585041))

(declare-fun m!585043 () Bool)

(assert (=> b!608374 m!585043))

(assert (=> b!608374 m!584987))

(assert (=> b!608374 m!584987))

(declare-fun m!585045 () Bool)

(assert (=> b!608374 m!585045))

(assert (=> b!608374 m!584987))

(declare-fun m!585047 () Bool)

(assert (=> b!608374 m!585047))

(assert (=> b!608374 m!584987))

(declare-fun m!585049 () Bool)

(assert (=> b!608374 m!585049))

(declare-fun m!585051 () Bool)

(assert (=> b!608374 m!585051))

(declare-fun m!585053 () Bool)

(assert (=> b!608374 m!585053))

(declare-fun m!585055 () Bool)

(assert (=> b!608374 m!585055))

(declare-fun m!585057 () Bool)

(assert (=> b!608353 m!585057))

(check-sat (not b!608358) (not b!608362) (not b!608352) (not b!608351) (not b!608366) (not b!608349) (not b!608354) (not b!608371) (not b!608367) (not b!608353) (not b!608372) (not b!608350) (not b!608370) (not b!608359) (not start!55572) (not b!608374) (not b!608364) (not b!608360))
(check-sat)
