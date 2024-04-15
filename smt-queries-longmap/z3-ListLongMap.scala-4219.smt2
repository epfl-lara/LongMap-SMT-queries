; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57896 () Bool)

(assert start!57896)

(declare-fun res!414410 () Bool)

(declare-fun e!366303 () Bool)

(assert (=> start!57896 (=> (not res!414410) (not e!366303))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57896 (= res!414410 (validMask!0 mask!3053))))

(assert (=> start!57896 e!366303))

(assert (=> start!57896 true))

(declare-datatypes ((array!38334 0))(
  ( (array!38335 (arr!18386 (Array (_ BitVec 32) (_ BitVec 64))) (size!18751 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38334)

(declare-fun array_inv!14269 (array!38334) Bool)

(assert (=> start!57896 (array_inv!14269 a!2986)))

(declare-fun b!639963 () Bool)

(declare-fun e!366312 () Bool)

(declare-fun e!366306 () Bool)

(assert (=> b!639963 (= e!366312 (not e!366306))))

(declare-fun res!414415 () Bool)

(assert (=> b!639963 (=> res!414415 e!366306)))

(declare-datatypes ((SeekEntryResult!6823 0))(
  ( (MissingZero!6823 (index!29612 (_ BitVec 32))) (Found!6823 (index!29613 (_ BitVec 32))) (Intermediate!6823 (undefined!7635 Bool) (index!29614 (_ BitVec 32)) (x!58382 (_ BitVec 32))) (Undefined!6823) (MissingVacant!6823 (index!29615 (_ BitVec 32))) )
))
(declare-fun lt!296019 () SeekEntryResult!6823)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639963 (= res!414415 (not (= lt!296019 (Found!6823 index!984))))))

(declare-datatypes ((Unit!21620 0))(
  ( (Unit!21621) )
))
(declare-fun lt!296016 () Unit!21620)

(declare-fun e!366313 () Unit!21620)

(assert (=> b!639963 (= lt!296016 e!366313)))

(declare-fun c!73146 () Bool)

(assert (=> b!639963 (= c!73146 (= lt!296019 Undefined!6823))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!296015 () array!38334)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!296021 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38334 (_ BitVec 32)) SeekEntryResult!6823)

(assert (=> b!639963 (= lt!296019 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296021 lt!296015 mask!3053))))

(declare-fun e!366304 () Bool)

(assert (=> b!639963 e!366304))

(declare-fun res!414406 () Bool)

(assert (=> b!639963 (=> (not res!414406) (not e!366304))))

(declare-fun lt!296014 () SeekEntryResult!6823)

(declare-fun lt!296022 () (_ BitVec 32))

(assert (=> b!639963 (= res!414406 (= lt!296014 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296022 vacantSpotIndex!68 lt!296021 lt!296015 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!639963 (= lt!296014 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296022 vacantSpotIndex!68 (select (arr!18386 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639963 (= lt!296021 (select (store (arr!18386 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296013 () Unit!21620)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38334 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21620)

(assert (=> b!639963 (= lt!296013 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296022 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639963 (= lt!296022 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639964 () Bool)

(declare-fun e!366308 () Bool)

(assert (=> b!639964 (= e!366303 e!366308)))

(declare-fun res!414408 () Bool)

(assert (=> b!639964 (=> (not res!414408) (not e!366308))))

(declare-fun lt!296024 () SeekEntryResult!6823)

(assert (=> b!639964 (= res!414408 (or (= lt!296024 (MissingZero!6823 i!1108)) (= lt!296024 (MissingVacant!6823 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38334 (_ BitVec 32)) SeekEntryResult!6823)

(assert (=> b!639964 (= lt!296024 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639965 () Bool)

(declare-fun res!414416 () Bool)

(assert (=> b!639965 (=> (not res!414416) (not e!366308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38334 (_ BitVec 32)) Bool)

(assert (=> b!639965 (= res!414416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639966 () Bool)

(declare-fun e!366314 () Bool)

(assert (=> b!639966 (= e!366306 e!366314)))

(declare-fun res!414421 () Bool)

(assert (=> b!639966 (=> res!414421 e!366314)))

(declare-fun lt!296018 () (_ BitVec 64))

(assert (=> b!639966 (= res!414421 (or (not (= (select (arr!18386 a!2986) j!136) lt!296021)) (not (= (select (arr!18386 a!2986) j!136) lt!296018)) (bvsge j!136 index!984)))))

(declare-fun e!366309 () Bool)

(assert (=> b!639966 e!366309))

(declare-fun res!414411 () Bool)

(assert (=> b!639966 (=> (not res!414411) (not e!366309))))

(assert (=> b!639966 (= res!414411 (= lt!296018 (select (arr!18386 a!2986) j!136)))))

(assert (=> b!639966 (= lt!296018 (select (store (arr!18386 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639967 () Bool)

(assert (=> b!639967 (= e!366314 true)))

(declare-datatypes ((List!12466 0))(
  ( (Nil!12463) (Cons!12462 (h!13507 (_ BitVec 64)) (t!18685 List!12466)) )
))
(declare-fun arrayNoDuplicates!0 (array!38334 (_ BitVec 32) List!12466) Bool)

(assert (=> b!639967 (arrayNoDuplicates!0 lt!296015 j!136 Nil!12463)))

(declare-fun lt!296025 () Unit!21620)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38334 (_ BitVec 32) (_ BitVec 32)) Unit!21620)

(assert (=> b!639967 (= lt!296025 (lemmaNoDuplicateFromThenFromBigger!0 lt!296015 #b00000000000000000000000000000000 j!136))))

(assert (=> b!639967 (arrayNoDuplicates!0 lt!296015 #b00000000000000000000000000000000 Nil!12463)))

(declare-fun lt!296023 () Unit!21620)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38334 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12466) Unit!21620)

(assert (=> b!639967 (= lt!296023 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12463))))

(declare-fun arrayContainsKey!0 (array!38334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639967 (arrayContainsKey!0 lt!296015 (select (arr!18386 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296020 () Unit!21620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38334 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21620)

(assert (=> b!639967 (= lt!296020 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296015 (select (arr!18386 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639968 () Bool)

(declare-fun e!366311 () Bool)

(declare-fun e!366310 () Bool)

(assert (=> b!639968 (= e!366311 e!366310)))

(declare-fun res!414414 () Bool)

(assert (=> b!639968 (=> (not res!414414) (not e!366310))))

(assert (=> b!639968 (= res!414414 (arrayContainsKey!0 lt!296015 (select (arr!18386 a!2986) j!136) j!136))))

(declare-fun b!639969 () Bool)

(declare-fun res!414405 () Bool)

(assert (=> b!639969 (=> (not res!414405) (not e!366303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639969 (= res!414405 (validKeyInArray!0 k0!1786))))

(declare-fun b!639970 () Bool)

(declare-fun e!366305 () Bool)

(assert (=> b!639970 (= e!366305 e!366312)))

(declare-fun res!414407 () Bool)

(assert (=> b!639970 (=> (not res!414407) (not e!366312))))

(declare-fun lt!296017 () SeekEntryResult!6823)

(assert (=> b!639970 (= res!414407 (and (= lt!296017 (Found!6823 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18386 a!2986) index!984) (select (arr!18386 a!2986) j!136))) (not (= (select (arr!18386 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639970 (= lt!296017 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18386 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639971 () Bool)

(declare-fun Unit!21622 () Unit!21620)

(assert (=> b!639971 (= e!366313 Unit!21622)))

(assert (=> b!639971 false))

(declare-fun b!639972 () Bool)

(declare-fun res!414412 () Bool)

(assert (=> b!639972 (=> (not res!414412) (not e!366308))))

(assert (=> b!639972 (= res!414412 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12463))))

(declare-fun b!639973 () Bool)

(assert (=> b!639973 (= e!366308 e!366305)))

(declare-fun res!414417 () Bool)

(assert (=> b!639973 (=> (not res!414417) (not e!366305))))

(assert (=> b!639973 (= res!414417 (= (select (store (arr!18386 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639973 (= lt!296015 (array!38335 (store (arr!18386 a!2986) i!1108 k0!1786) (size!18751 a!2986)))))

(declare-fun b!639974 () Bool)

(assert (=> b!639974 (= e!366310 (arrayContainsKey!0 lt!296015 (select (arr!18386 a!2986) j!136) index!984))))

(declare-fun b!639975 () Bool)

(assert (=> b!639975 (= e!366309 e!366311)))

(declare-fun res!414413 () Bool)

(assert (=> b!639975 (=> res!414413 e!366311)))

(assert (=> b!639975 (= res!414413 (or (not (= (select (arr!18386 a!2986) j!136) lt!296021)) (not (= (select (arr!18386 a!2986) j!136) lt!296018)) (bvsge j!136 index!984)))))

(declare-fun b!639976 () Bool)

(declare-fun res!414418 () Bool)

(assert (=> b!639976 (=> (not res!414418) (not e!366308))))

(assert (=> b!639976 (= res!414418 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18386 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639977 () Bool)

(declare-fun res!414419 () Bool)

(assert (=> b!639977 (=> (not res!414419) (not e!366303))))

(assert (=> b!639977 (= res!414419 (validKeyInArray!0 (select (arr!18386 a!2986) j!136)))))

(declare-fun b!639978 () Bool)

(declare-fun res!414420 () Bool)

(assert (=> b!639978 (=> (not res!414420) (not e!366303))))

(assert (=> b!639978 (= res!414420 (and (= (size!18751 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18751 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18751 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639979 () Bool)

(declare-fun res!414409 () Bool)

(assert (=> b!639979 (=> (not res!414409) (not e!366303))))

(assert (=> b!639979 (= res!414409 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639980 () Bool)

(assert (=> b!639980 (= e!366304 (= lt!296017 lt!296014))))

(declare-fun b!639981 () Bool)

(declare-fun Unit!21623 () Unit!21620)

(assert (=> b!639981 (= e!366313 Unit!21623)))

(assert (= (and start!57896 res!414410) b!639978))

(assert (= (and b!639978 res!414420) b!639977))

(assert (= (and b!639977 res!414419) b!639969))

(assert (= (and b!639969 res!414405) b!639979))

(assert (= (and b!639979 res!414409) b!639964))

(assert (= (and b!639964 res!414408) b!639965))

(assert (= (and b!639965 res!414416) b!639972))

(assert (= (and b!639972 res!414412) b!639976))

(assert (= (and b!639976 res!414418) b!639973))

(assert (= (and b!639973 res!414417) b!639970))

(assert (= (and b!639970 res!414407) b!639963))

(assert (= (and b!639963 res!414406) b!639980))

(assert (= (and b!639963 c!73146) b!639971))

(assert (= (and b!639963 (not c!73146)) b!639981))

(assert (= (and b!639963 (not res!414415)) b!639966))

(assert (= (and b!639966 res!414411) b!639975))

(assert (= (and b!639975 (not res!414413)) b!639968))

(assert (= (and b!639968 res!414414) b!639974))

(assert (= (and b!639966 (not res!414421)) b!639967))

(declare-fun m!613305 () Bool)

(assert (=> start!57896 m!613305))

(declare-fun m!613307 () Bool)

(assert (=> start!57896 m!613307))

(declare-fun m!613309 () Bool)

(assert (=> b!639972 m!613309))

(declare-fun m!613311 () Bool)

(assert (=> b!639966 m!613311))

(declare-fun m!613313 () Bool)

(assert (=> b!639966 m!613313))

(declare-fun m!613315 () Bool)

(assert (=> b!639966 m!613315))

(assert (=> b!639977 m!613311))

(assert (=> b!639977 m!613311))

(declare-fun m!613317 () Bool)

(assert (=> b!639977 m!613317))

(declare-fun m!613319 () Bool)

(assert (=> b!639979 m!613319))

(declare-fun m!613321 () Bool)

(assert (=> b!639969 m!613321))

(declare-fun m!613323 () Bool)

(assert (=> b!639964 m!613323))

(assert (=> b!639968 m!613311))

(assert (=> b!639968 m!613311))

(declare-fun m!613325 () Bool)

(assert (=> b!639968 m!613325))

(declare-fun m!613327 () Bool)

(assert (=> b!639976 m!613327))

(assert (=> b!639975 m!613311))

(declare-fun m!613329 () Bool)

(assert (=> b!639970 m!613329))

(assert (=> b!639970 m!613311))

(assert (=> b!639970 m!613311))

(declare-fun m!613331 () Bool)

(assert (=> b!639970 m!613331))

(declare-fun m!613333 () Bool)

(assert (=> b!639965 m!613333))

(assert (=> b!639967 m!613311))

(declare-fun m!613335 () Bool)

(assert (=> b!639967 m!613335))

(assert (=> b!639967 m!613311))

(assert (=> b!639967 m!613311))

(declare-fun m!613337 () Bool)

(assert (=> b!639967 m!613337))

(declare-fun m!613339 () Bool)

(assert (=> b!639967 m!613339))

(declare-fun m!613341 () Bool)

(assert (=> b!639967 m!613341))

(declare-fun m!613343 () Bool)

(assert (=> b!639967 m!613343))

(declare-fun m!613345 () Bool)

(assert (=> b!639967 m!613345))

(assert (=> b!639974 m!613311))

(assert (=> b!639974 m!613311))

(declare-fun m!613347 () Bool)

(assert (=> b!639974 m!613347))

(assert (=> b!639973 m!613313))

(declare-fun m!613349 () Bool)

(assert (=> b!639973 m!613349))

(declare-fun m!613351 () Bool)

(assert (=> b!639963 m!613351))

(declare-fun m!613353 () Bool)

(assert (=> b!639963 m!613353))

(declare-fun m!613355 () Bool)

(assert (=> b!639963 m!613355))

(assert (=> b!639963 m!613311))

(assert (=> b!639963 m!613313))

(declare-fun m!613357 () Bool)

(assert (=> b!639963 m!613357))

(declare-fun m!613359 () Bool)

(assert (=> b!639963 m!613359))

(assert (=> b!639963 m!613311))

(declare-fun m!613361 () Bool)

(assert (=> b!639963 m!613361))

(check-sat (not start!57896) (not b!639979) (not b!639963) (not b!639967) (not b!639977) (not b!639968) (not b!639972) (not b!639969) (not b!639965) (not b!639970) (not b!639974) (not b!639964))
(check-sat)
