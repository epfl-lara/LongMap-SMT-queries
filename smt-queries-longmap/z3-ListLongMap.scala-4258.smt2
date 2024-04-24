; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59160 () Bool)

(assert start!59160)

(declare-fun b!652380 () Bool)

(declare-datatypes ((Unit!22269 0))(
  ( (Unit!22270) )
))
(declare-fun e!374432 () Unit!22269)

(declare-fun Unit!22271 () Unit!22269)

(assert (=> b!652380 (= e!374432 Unit!22271)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38598 0))(
  ( (array!38599 (arr!18499 (Array (_ BitVec 32) (_ BitVec 64))) (size!18863 (_ BitVec 32))) )
))
(declare-fun lt!303493 () array!38598)

(declare-fun lt!303505 () Unit!22269)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22269)

(assert (=> b!652380 (= lt!303505 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303493 (select (arr!18499 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652380 (arrayContainsKey!0 lt!303493 (select (arr!18499 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!303499 () Unit!22269)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12447 0))(
  ( (Nil!12444) (Cons!12443 (h!13491 (_ BitVec 64)) (t!18667 List!12447)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12447) Unit!22269)

(assert (=> b!652380 (= lt!303499 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12444))))

(declare-fun arrayNoDuplicates!0 (array!38598 (_ BitVec 32) List!12447) Bool)

(assert (=> b!652380 (arrayNoDuplicates!0 lt!303493 #b00000000000000000000000000000000 Nil!12444)))

(declare-fun lt!303490 () Unit!22269)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38598 (_ BitVec 32) (_ BitVec 32)) Unit!22269)

(assert (=> b!652380 (= lt!303490 (lemmaNoDuplicateFromThenFromBigger!0 lt!303493 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652380 (arrayNoDuplicates!0 lt!303493 j!136 Nil!12444)))

(declare-fun lt!303503 () Unit!22269)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38598 (_ BitVec 64) (_ BitVec 32) List!12447) Unit!22269)

(assert (=> b!652380 (= lt!303503 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303493 (select (arr!18499 a!2986) j!136) j!136 Nil!12444))))

(assert (=> b!652380 false))

(declare-fun b!652381 () Bool)

(declare-fun res!423003 () Bool)

(declare-fun e!374435 () Bool)

(assert (=> b!652381 (=> (not res!423003) (not e!374435))))

(assert (=> b!652381 (= res!423003 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!422989 () Bool)

(assert (=> start!59160 (=> (not res!422989) (not e!374435))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59160 (= res!422989 (validMask!0 mask!3053))))

(assert (=> start!59160 e!374435))

(assert (=> start!59160 true))

(declare-fun array_inv!14358 (array!38598) Bool)

(assert (=> start!59160 (array_inv!14358 a!2986)))

(declare-fun b!652382 () Bool)

(declare-fun res!422992 () Bool)

(assert (=> b!652382 (=> (not res!422992) (not e!374435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652382 (= res!422992 (validKeyInArray!0 (select (arr!18499 a!2986) j!136)))))

(declare-fun b!652383 () Bool)

(declare-fun res!423006 () Bool)

(declare-fun e!374428 () Bool)

(assert (=> b!652383 (=> (not res!423006) (not e!374428))))

(assert (=> b!652383 (= res!423006 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12444))))

(declare-fun b!652384 () Bool)

(declare-fun e!374440 () Bool)

(declare-fun e!374429 () Bool)

(assert (=> b!652384 (= e!374440 e!374429)))

(declare-fun res!423007 () Bool)

(assert (=> b!652384 (=> (not res!423007) (not e!374429))))

(assert (=> b!652384 (= res!423007 (arrayContainsKey!0 lt!303493 (select (arr!18499 a!2986) j!136) j!136))))

(declare-fun b!652385 () Bool)

(declare-fun e!374439 () Unit!22269)

(declare-fun Unit!22272 () Unit!22269)

(assert (=> b!652385 (= e!374439 Unit!22272)))

(assert (=> b!652385 false))

(declare-fun b!652386 () Bool)

(declare-fun e!374437 () Bool)

(assert (=> b!652386 (= e!374428 e!374437)))

(declare-fun res!422995 () Bool)

(assert (=> b!652386 (=> (not res!422995) (not e!374437))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!652386 (= res!422995 (= (select (store (arr!18499 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652386 (= lt!303493 (array!38599 (store (arr!18499 a!2986) i!1108 k0!1786) (size!18863 a!2986)))))

(declare-fun b!652387 () Bool)

(declare-fun e!374441 () Bool)

(assert (=> b!652387 (= e!374437 e!374441)))

(declare-fun res!423005 () Bool)

(assert (=> b!652387 (=> (not res!423005) (not e!374441))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6895 0))(
  ( (MissingZero!6895 (index!29933 (_ BitVec 32))) (Found!6895 (index!29934 (_ BitVec 32))) (Intermediate!6895 (undefined!7707 Bool) (index!29935 (_ BitVec 32)) (x!58873 (_ BitVec 32))) (Undefined!6895) (MissingVacant!6895 (index!29936 (_ BitVec 32))) )
))
(declare-fun lt!303498 () SeekEntryResult!6895)

(assert (=> b!652387 (= res!423005 (and (= lt!303498 (Found!6895 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18499 a!2986) index!984) (select (arr!18499 a!2986) j!136))) (not (= (select (arr!18499 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38598 (_ BitVec 32)) SeekEntryResult!6895)

(assert (=> b!652387 (= lt!303498 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18499 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!374442 () Bool)

(declare-fun b!652388 () Bool)

(assert (=> b!652388 (= e!374442 (arrayContainsKey!0 lt!303493 (select (arr!18499 a!2986) j!136) index!984))))

(declare-fun b!652389 () Bool)

(declare-fun res!422999 () Bool)

(assert (=> b!652389 (=> (not res!422999) (not e!374435))))

(assert (=> b!652389 (= res!422999 (and (= (size!18863 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18863 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18863 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652390 () Bool)

(assert (=> b!652390 (= e!374435 e!374428)))

(declare-fun res!422997 () Bool)

(assert (=> b!652390 (=> (not res!422997) (not e!374428))))

(declare-fun lt!303496 () SeekEntryResult!6895)

(assert (=> b!652390 (= res!422997 (or (= lt!303496 (MissingZero!6895 i!1108)) (= lt!303496 (MissingVacant!6895 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38598 (_ BitVec 32)) SeekEntryResult!6895)

(assert (=> b!652390 (= lt!303496 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652391 () Bool)

(assert (=> b!652391 (= e!374429 (arrayContainsKey!0 lt!303493 (select (arr!18499 a!2986) j!136) index!984))))

(declare-fun b!652392 () Bool)

(declare-fun res!422994 () Bool)

(assert (=> b!652392 (=> (not res!422994) (not e!374435))))

(assert (=> b!652392 (= res!422994 (validKeyInArray!0 k0!1786))))

(declare-fun b!652393 () Bool)

(declare-fun e!374434 () Bool)

(assert (=> b!652393 (= e!374441 (not e!374434))))

(declare-fun res!422993 () Bool)

(assert (=> b!652393 (=> res!422993 e!374434)))

(declare-fun lt!303504 () SeekEntryResult!6895)

(assert (=> b!652393 (= res!422993 (not (= lt!303504 (Found!6895 index!984))))))

(declare-fun lt!303491 () Unit!22269)

(assert (=> b!652393 (= lt!303491 e!374439)))

(declare-fun c!75065 () Bool)

(assert (=> b!652393 (= c!75065 (= lt!303504 Undefined!6895))))

(declare-fun lt!303489 () (_ BitVec 64))

(assert (=> b!652393 (= lt!303504 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303489 lt!303493 mask!3053))))

(declare-fun e!374430 () Bool)

(assert (=> b!652393 e!374430))

(declare-fun res!423000 () Bool)

(assert (=> b!652393 (=> (not res!423000) (not e!374430))))

(declare-fun lt!303488 () SeekEntryResult!6895)

(declare-fun lt!303494 () (_ BitVec 32))

(assert (=> b!652393 (= res!423000 (= lt!303488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303494 vacantSpotIndex!68 lt!303489 lt!303493 mask!3053)))))

(assert (=> b!652393 (= lt!303488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303494 vacantSpotIndex!68 (select (arr!18499 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652393 (= lt!303489 (select (store (arr!18499 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303495 () Unit!22269)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38598 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22269)

(assert (=> b!652393 (= lt!303495 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303494 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652393 (= lt!303494 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!652394 () Bool)

(declare-fun e!374436 () Bool)

(assert (=> b!652394 (= e!374436 (or (bvsge (size!18863 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18863 a!2986))))))

(assert (=> b!652394 (arrayNoDuplicates!0 lt!303493 index!984 Nil!12444)))

(declare-fun lt!303502 () Unit!22269)

(assert (=> b!652394 (= lt!303502 (lemmaNoDuplicateFromThenFromBigger!0 lt!303493 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652394 (arrayNoDuplicates!0 lt!303493 #b00000000000000000000000000000000 Nil!12444)))

(declare-fun lt!303492 () Unit!22269)

(assert (=> b!652394 (= lt!303492 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12444))))

(assert (=> b!652394 (arrayContainsKey!0 lt!303493 (select (arr!18499 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303500 () Unit!22269)

(assert (=> b!652394 (= lt!303500 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303493 (select (arr!18499 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652394 e!374442))

(declare-fun res!422996 () Bool)

(assert (=> b!652394 (=> (not res!422996) (not e!374442))))

(assert (=> b!652394 (= res!422996 (arrayContainsKey!0 lt!303493 (select (arr!18499 a!2986) j!136) j!136))))

(declare-fun b!652395 () Bool)

(declare-fun res!422991 () Bool)

(assert (=> b!652395 (=> (not res!422991) (not e!374428))))

(assert (=> b!652395 (= res!422991 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18499 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652396 () Bool)

(declare-fun Unit!22273 () Unit!22269)

(assert (=> b!652396 (= e!374432 Unit!22273)))

(declare-fun b!652397 () Bool)

(declare-fun Unit!22274 () Unit!22269)

(assert (=> b!652397 (= e!374439 Unit!22274)))

(declare-fun b!652398 () Bool)

(declare-fun res!422998 () Bool)

(assert (=> b!652398 (=> (not res!422998) (not e!374428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38598 (_ BitVec 32)) Bool)

(assert (=> b!652398 (= res!422998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652399 () Bool)

(declare-fun e!374431 () Bool)

(assert (=> b!652399 (= e!374431 e!374440)))

(declare-fun res!423002 () Bool)

(assert (=> b!652399 (=> res!423002 e!374440)))

(declare-fun lt!303501 () (_ BitVec 64))

(assert (=> b!652399 (= res!423002 (or (not (= (select (arr!18499 a!2986) j!136) lt!303489)) (not (= (select (arr!18499 a!2986) j!136) lt!303501)) (bvsge j!136 index!984)))))

(declare-fun b!652400 () Bool)

(declare-fun e!374438 () Bool)

(assert (=> b!652400 (= e!374438 e!374436)))

(declare-fun res!422990 () Bool)

(assert (=> b!652400 (=> res!422990 e!374436)))

(assert (=> b!652400 (= res!422990 (bvsge index!984 j!136))))

(declare-fun lt!303497 () Unit!22269)

(assert (=> b!652400 (= lt!303497 e!374432)))

(declare-fun c!75064 () Bool)

(assert (=> b!652400 (= c!75064 (bvslt j!136 index!984))))

(declare-fun b!652401 () Bool)

(assert (=> b!652401 (= e!374434 e!374438)))

(declare-fun res!423001 () Bool)

(assert (=> b!652401 (=> res!423001 e!374438)))

(assert (=> b!652401 (= res!423001 (or (not (= (select (arr!18499 a!2986) j!136) lt!303489)) (not (= (select (arr!18499 a!2986) j!136) lt!303501))))))

(assert (=> b!652401 e!374431))

(declare-fun res!423004 () Bool)

(assert (=> b!652401 (=> (not res!423004) (not e!374431))))

(assert (=> b!652401 (= res!423004 (= lt!303501 (select (arr!18499 a!2986) j!136)))))

(assert (=> b!652401 (= lt!303501 (select (store (arr!18499 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652402 () Bool)

(assert (=> b!652402 (= e!374430 (= lt!303498 lt!303488))))

(assert (= (and start!59160 res!422989) b!652389))

(assert (= (and b!652389 res!422999) b!652382))

(assert (= (and b!652382 res!422992) b!652392))

(assert (= (and b!652392 res!422994) b!652381))

(assert (= (and b!652381 res!423003) b!652390))

(assert (= (and b!652390 res!422997) b!652398))

(assert (= (and b!652398 res!422998) b!652383))

(assert (= (and b!652383 res!423006) b!652395))

(assert (= (and b!652395 res!422991) b!652386))

(assert (= (and b!652386 res!422995) b!652387))

(assert (= (and b!652387 res!423005) b!652393))

(assert (= (and b!652393 res!423000) b!652402))

(assert (= (and b!652393 c!75065) b!652385))

(assert (= (and b!652393 (not c!75065)) b!652397))

(assert (= (and b!652393 (not res!422993)) b!652401))

(assert (= (and b!652401 res!423004) b!652399))

(assert (= (and b!652399 (not res!423002)) b!652384))

(assert (= (and b!652384 res!423007) b!652391))

(assert (= (and b!652401 (not res!423001)) b!652400))

(assert (= (and b!652400 c!75064) b!652380))

(assert (= (and b!652400 (not c!75064)) b!652396))

(assert (= (and b!652400 (not res!422990)) b!652394))

(assert (= (and b!652394 res!422996) b!652388))

(declare-fun m!625969 () Bool)

(assert (=> b!652391 m!625969))

(assert (=> b!652391 m!625969))

(declare-fun m!625971 () Bool)

(assert (=> b!652391 m!625971))

(declare-fun m!625973 () Bool)

(assert (=> b!652395 m!625973))

(assert (=> b!652394 m!625969))

(declare-fun m!625975 () Bool)

(assert (=> b!652394 m!625975))

(assert (=> b!652394 m!625969))

(declare-fun m!625977 () Bool)

(assert (=> b!652394 m!625977))

(declare-fun m!625979 () Bool)

(assert (=> b!652394 m!625979))

(declare-fun m!625981 () Bool)

(assert (=> b!652394 m!625981))

(declare-fun m!625983 () Bool)

(assert (=> b!652394 m!625983))

(assert (=> b!652394 m!625969))

(declare-fun m!625985 () Bool)

(assert (=> b!652394 m!625985))

(assert (=> b!652394 m!625969))

(declare-fun m!625987 () Bool)

(assert (=> b!652394 m!625987))

(declare-fun m!625989 () Bool)

(assert (=> b!652387 m!625989))

(assert (=> b!652387 m!625969))

(assert (=> b!652387 m!625969))

(declare-fun m!625991 () Bool)

(assert (=> b!652387 m!625991))

(assert (=> b!652388 m!625969))

(assert (=> b!652388 m!625969))

(assert (=> b!652388 m!625971))

(assert (=> b!652399 m!625969))

(assert (=> b!652380 m!625969))

(assert (=> b!652380 m!625969))

(declare-fun m!625993 () Bool)

(assert (=> b!652380 m!625993))

(assert (=> b!652380 m!625981))

(assert (=> b!652380 m!625983))

(declare-fun m!625995 () Bool)

(assert (=> b!652380 m!625995))

(assert (=> b!652380 m!625969))

(declare-fun m!625997 () Bool)

(assert (=> b!652380 m!625997))

(assert (=> b!652380 m!625969))

(declare-fun m!625999 () Bool)

(assert (=> b!652380 m!625999))

(declare-fun m!626001 () Bool)

(assert (=> b!652380 m!626001))

(assert (=> b!652384 m!625969))

(assert (=> b!652384 m!625969))

(assert (=> b!652384 m!625985))

(declare-fun m!626003 () Bool)

(assert (=> b!652381 m!626003))

(declare-fun m!626005 () Bool)

(assert (=> start!59160 m!626005))

(declare-fun m!626007 () Bool)

(assert (=> start!59160 m!626007))

(assert (=> b!652382 m!625969))

(assert (=> b!652382 m!625969))

(declare-fun m!626009 () Bool)

(assert (=> b!652382 m!626009))

(declare-fun m!626011 () Bool)

(assert (=> b!652390 m!626011))

(declare-fun m!626013 () Bool)

(assert (=> b!652386 m!626013))

(declare-fun m!626015 () Bool)

(assert (=> b!652386 m!626015))

(assert (=> b!652401 m!625969))

(assert (=> b!652401 m!626013))

(declare-fun m!626017 () Bool)

(assert (=> b!652401 m!626017))

(declare-fun m!626019 () Bool)

(assert (=> b!652393 m!626019))

(declare-fun m!626021 () Bool)

(assert (=> b!652393 m!626021))

(assert (=> b!652393 m!626013))

(declare-fun m!626023 () Bool)

(assert (=> b!652393 m!626023))

(declare-fun m!626025 () Bool)

(assert (=> b!652393 m!626025))

(assert (=> b!652393 m!625969))

(declare-fun m!626027 () Bool)

(assert (=> b!652393 m!626027))

(assert (=> b!652393 m!625969))

(declare-fun m!626029 () Bool)

(assert (=> b!652393 m!626029))

(declare-fun m!626031 () Bool)

(assert (=> b!652392 m!626031))

(declare-fun m!626033 () Bool)

(assert (=> b!652398 m!626033))

(declare-fun m!626035 () Bool)

(assert (=> b!652383 m!626035))

(check-sat (not b!652390) (not start!59160) (not b!652391) (not b!652392) (not b!652382) (not b!652394) (not b!652380) (not b!652384) (not b!652387) (not b!652388) (not b!652383) (not b!652381) (not b!652398) (not b!652393))
(check-sat)
