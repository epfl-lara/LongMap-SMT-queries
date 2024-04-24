; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55296 () Bool)

(assert start!55296)

(declare-fun b!605331 () Bool)

(declare-datatypes ((Unit!19243 0))(
  ( (Unit!19244) )
))
(declare-fun e!346441 () Unit!19243)

(declare-fun Unit!19245 () Unit!19243)

(assert (=> b!605331 (= e!346441 Unit!19245)))

(declare-fun b!605332 () Bool)

(declare-fun e!346452 () Bool)

(declare-fun e!346446 () Bool)

(assert (=> b!605332 (= e!346452 e!346446)))

(declare-fun res!388883 () Bool)

(assert (=> b!605332 (=> res!388883 e!346446)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!276159 () (_ BitVec 64))

(declare-fun lt!276155 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37233 0))(
  ( (array!37234 (arr!17869 (Array (_ BitVec 32) (_ BitVec 64))) (size!18233 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37233)

(assert (=> b!605332 (= res!388883 (or (not (= (select (arr!17869 a!2986) j!136) lt!276159)) (not (= (select (arr!17869 a!2986) j!136) lt!276155)) (bvsge j!136 index!984)))))

(declare-fun b!605333 () Bool)

(declare-fun e!346442 () Bool)

(declare-fun e!346450 () Bool)

(assert (=> b!605333 (= e!346442 e!346450)))

(declare-fun res!388894 () Bool)

(assert (=> b!605333 (=> res!388894 e!346450)))

(assert (=> b!605333 (= res!388894 (or (not (= (select (arr!17869 a!2986) j!136) lt!276159)) (not (= (select (arr!17869 a!2986) j!136) lt!276155))))))

(assert (=> b!605333 e!346452))

(declare-fun res!388888 () Bool)

(assert (=> b!605333 (=> (not res!388888) (not e!346452))))

(assert (=> b!605333 (= res!388888 (= lt!276155 (select (arr!17869 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!605333 (= lt!276155 (select (store (arr!17869 a!2986) i!1108 k0!1786) index!984))))

(declare-fun lt!276157 () array!37233)

(declare-fun e!346440 () Bool)

(declare-fun b!605334 () Bool)

(declare-fun arrayContainsKey!0 (array!37233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605334 (= e!346440 (arrayContainsKey!0 lt!276157 (select (arr!17869 a!2986) j!136) index!984))))

(declare-fun b!605335 () Bool)

(declare-fun res!388885 () Bool)

(declare-fun e!346448 () Bool)

(assert (=> b!605335 (=> (not res!388885) (not e!346448))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!605335 (= res!388885 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17869 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605336 () Bool)

(declare-fun e!346449 () Bool)

(assert (=> b!605336 (= e!346449 e!346448)))

(declare-fun res!388880 () Bool)

(assert (=> b!605336 (=> (not res!388880) (not e!346448))))

(declare-datatypes ((SeekEntryResult!6265 0))(
  ( (MissingZero!6265 (index!27326 (_ BitVec 32))) (Found!6265 (index!27327 (_ BitVec 32))) (Intermediate!6265 (undefined!7077 Bool) (index!27328 (_ BitVec 32)) (x!56278 (_ BitVec 32))) (Undefined!6265) (MissingVacant!6265 (index!27329 (_ BitVec 32))) )
))
(declare-fun lt!276163 () SeekEntryResult!6265)

(assert (=> b!605336 (= res!388880 (or (= lt!276163 (MissingZero!6265 i!1108)) (= lt!276163 (MissingVacant!6265 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37233 (_ BitVec 32)) SeekEntryResult!6265)

(assert (=> b!605336 (= lt!276163 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!605338 () Bool)

(declare-fun e!346447 () Bool)

(assert (=> b!605338 (= e!346447 (bvsle #b00000000000000000000000000000000 (size!18233 a!2986)))))

(assert (=> b!605338 (arrayContainsKey!0 lt!276157 (select (arr!17869 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276151 () Unit!19243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19243)

(assert (=> b!605338 (= lt!276151 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276157 (select (arr!17869 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605338 e!346440))

(declare-fun res!388884 () Bool)

(assert (=> b!605338 (=> (not res!388884) (not e!346440))))

(assert (=> b!605338 (= res!388884 (arrayContainsKey!0 lt!276157 (select (arr!17869 a!2986) j!136) j!136))))

(declare-fun b!605339 () Bool)

(declare-fun e!346439 () Bool)

(assert (=> b!605339 (= e!346446 e!346439)))

(declare-fun res!388882 () Bool)

(assert (=> b!605339 (=> (not res!388882) (not e!346439))))

(assert (=> b!605339 (= res!388882 (arrayContainsKey!0 lt!276157 (select (arr!17869 a!2986) j!136) j!136))))

(declare-fun b!605340 () Bool)

(declare-fun Unit!19246 () Unit!19243)

(assert (=> b!605340 (= e!346441 Unit!19246)))

(assert (=> b!605340 false))

(declare-fun b!605341 () Bool)

(declare-fun res!388876 () Bool)

(assert (=> b!605341 (=> (not res!388876) (not e!346449))))

(assert (=> b!605341 (= res!388876 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605342 () Bool)

(declare-fun e!346438 () Unit!19243)

(declare-fun Unit!19247 () Unit!19243)

(assert (=> b!605342 (= e!346438 Unit!19247)))

(declare-fun b!605343 () Bool)

(declare-fun res!388886 () Bool)

(assert (=> b!605343 (=> (not res!388886) (not e!346449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605343 (= res!388886 (validKeyInArray!0 k0!1786))))

(declare-fun b!605344 () Bool)

(declare-fun e!346445 () Bool)

(assert (=> b!605344 (= e!346448 e!346445)))

(declare-fun res!388878 () Bool)

(assert (=> b!605344 (=> (not res!388878) (not e!346445))))

(assert (=> b!605344 (= res!388878 (= (select (store (arr!17869 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605344 (= lt!276157 (array!37234 (store (arr!17869 a!2986) i!1108 k0!1786) (size!18233 a!2986)))))

(declare-fun b!605345 () Bool)

(declare-fun res!388879 () Bool)

(assert (=> b!605345 (=> (not res!388879) (not e!346449))))

(assert (=> b!605345 (= res!388879 (and (= (size!18233 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18233 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18233 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!388889 () Bool)

(assert (=> start!55296 (=> (not res!388889) (not e!346449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55296 (= res!388889 (validMask!0 mask!3053))))

(assert (=> start!55296 e!346449))

(assert (=> start!55296 true))

(declare-fun array_inv!13728 (array!37233) Bool)

(assert (=> start!55296 (array_inv!13728 a!2986)))

(declare-fun b!605337 () Bool)

(declare-fun res!388877 () Bool)

(assert (=> b!605337 (=> (not res!388877) (not e!346448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37233 (_ BitVec 32)) Bool)

(assert (=> b!605337 (= res!388877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605346 () Bool)

(declare-fun Unit!19248 () Unit!19243)

(assert (=> b!605346 (= e!346438 Unit!19248)))

(declare-fun lt!276161 () Unit!19243)

(assert (=> b!605346 (= lt!276161 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276157 (select (arr!17869 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605346 (arrayContainsKey!0 lt!276157 (select (arr!17869 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276154 () Unit!19243)

(declare-datatypes ((List!11817 0))(
  ( (Nil!11814) (Cons!11813 (h!12861 (_ BitVec 64)) (t!18037 List!11817)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11817) Unit!19243)

(assert (=> b!605346 (= lt!276154 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11814))))

(declare-fun arrayNoDuplicates!0 (array!37233 (_ BitVec 32) List!11817) Bool)

(assert (=> b!605346 (arrayNoDuplicates!0 lt!276157 #b00000000000000000000000000000000 Nil!11814)))

(declare-fun lt!276166 () Unit!19243)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37233 (_ BitVec 32) (_ BitVec 32)) Unit!19243)

(assert (=> b!605346 (= lt!276166 (lemmaNoDuplicateFromThenFromBigger!0 lt!276157 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605346 (arrayNoDuplicates!0 lt!276157 j!136 Nil!11814)))

(declare-fun lt!276158 () Unit!19243)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37233 (_ BitVec 64) (_ BitVec 32) List!11817) Unit!19243)

(assert (=> b!605346 (= lt!276158 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276157 (select (arr!17869 a!2986) j!136) j!136 Nil!11814))))

(assert (=> b!605346 false))

(declare-fun b!605347 () Bool)

(declare-fun res!388892 () Bool)

(assert (=> b!605347 (=> (not res!388892) (not e!346449))))

(assert (=> b!605347 (= res!388892 (validKeyInArray!0 (select (arr!17869 a!2986) j!136)))))

(declare-fun b!605348 () Bool)

(declare-fun res!388881 () Bool)

(assert (=> b!605348 (=> (not res!388881) (not e!346448))))

(assert (=> b!605348 (= res!388881 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11814))))

(declare-fun b!605349 () Bool)

(assert (=> b!605349 (= e!346439 (arrayContainsKey!0 lt!276157 (select (arr!17869 a!2986) j!136) index!984))))

(declare-fun b!605350 () Bool)

(declare-fun e!346451 () Bool)

(declare-fun lt!276152 () SeekEntryResult!6265)

(declare-fun lt!276165 () SeekEntryResult!6265)

(assert (=> b!605350 (= e!346451 (= lt!276152 lt!276165))))

(declare-fun b!605351 () Bool)

(assert (=> b!605351 (= e!346450 e!346447)))

(declare-fun res!388887 () Bool)

(assert (=> b!605351 (=> res!388887 e!346447)))

(assert (=> b!605351 (= res!388887 (bvsge index!984 j!136))))

(declare-fun lt!276153 () Unit!19243)

(assert (=> b!605351 (= lt!276153 e!346438)))

(declare-fun c!68597 () Bool)

(assert (=> b!605351 (= c!68597 (bvslt j!136 index!984))))

(declare-fun b!605352 () Bool)

(declare-fun e!346443 () Bool)

(assert (=> b!605352 (= e!346443 (not e!346442))))

(declare-fun res!388891 () Bool)

(assert (=> b!605352 (=> res!388891 e!346442)))

(declare-fun lt!276156 () SeekEntryResult!6265)

(assert (=> b!605352 (= res!388891 (not (= lt!276156 (Found!6265 index!984))))))

(declare-fun lt!276164 () Unit!19243)

(assert (=> b!605352 (= lt!276164 e!346441)))

(declare-fun c!68596 () Bool)

(assert (=> b!605352 (= c!68596 (= lt!276156 Undefined!6265))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37233 (_ BitVec 32)) SeekEntryResult!6265)

(assert (=> b!605352 (= lt!276156 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276159 lt!276157 mask!3053))))

(assert (=> b!605352 e!346451))

(declare-fun res!388890 () Bool)

(assert (=> b!605352 (=> (not res!388890) (not e!346451))))

(declare-fun lt!276162 () (_ BitVec 32))

(assert (=> b!605352 (= res!388890 (= lt!276165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276162 vacantSpotIndex!68 lt!276159 lt!276157 mask!3053)))))

(assert (=> b!605352 (= lt!276165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276162 vacantSpotIndex!68 (select (arr!17869 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605352 (= lt!276159 (select (store (arr!17869 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276160 () Unit!19243)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19243)

(assert (=> b!605352 (= lt!276160 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276162 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605352 (= lt!276162 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!605353 () Bool)

(assert (=> b!605353 (= e!346445 e!346443)))

(declare-fun res!388893 () Bool)

(assert (=> b!605353 (=> (not res!388893) (not e!346443))))

(assert (=> b!605353 (= res!388893 (and (= lt!276152 (Found!6265 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17869 a!2986) index!984) (select (arr!17869 a!2986) j!136))) (not (= (select (arr!17869 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605353 (= lt!276152 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17869 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55296 res!388889) b!605345))

(assert (= (and b!605345 res!388879) b!605347))

(assert (= (and b!605347 res!388892) b!605343))

(assert (= (and b!605343 res!388886) b!605341))

(assert (= (and b!605341 res!388876) b!605336))

(assert (= (and b!605336 res!388880) b!605337))

(assert (= (and b!605337 res!388877) b!605348))

(assert (= (and b!605348 res!388881) b!605335))

(assert (= (and b!605335 res!388885) b!605344))

(assert (= (and b!605344 res!388878) b!605353))

(assert (= (and b!605353 res!388893) b!605352))

(assert (= (and b!605352 res!388890) b!605350))

(assert (= (and b!605352 c!68596) b!605340))

(assert (= (and b!605352 (not c!68596)) b!605331))

(assert (= (and b!605352 (not res!388891)) b!605333))

(assert (= (and b!605333 res!388888) b!605332))

(assert (= (and b!605332 (not res!388883)) b!605339))

(assert (= (and b!605339 res!388882) b!605349))

(assert (= (and b!605333 (not res!388894)) b!605351))

(assert (= (and b!605351 c!68597) b!605346))

(assert (= (and b!605351 (not c!68597)) b!605342))

(assert (= (and b!605351 (not res!388887)) b!605338))

(assert (= (and b!605338 res!388884) b!605334))

(declare-fun m!582449 () Bool)

(assert (=> b!605348 m!582449))

(declare-fun m!582451 () Bool)

(assert (=> b!605353 m!582451))

(declare-fun m!582453 () Bool)

(assert (=> b!605353 m!582453))

(assert (=> b!605353 m!582453))

(declare-fun m!582455 () Bool)

(assert (=> b!605353 m!582455))

(declare-fun m!582457 () Bool)

(assert (=> b!605352 m!582457))

(declare-fun m!582459 () Bool)

(assert (=> b!605352 m!582459))

(declare-fun m!582461 () Bool)

(assert (=> b!605352 m!582461))

(assert (=> b!605352 m!582453))

(declare-fun m!582463 () Bool)

(assert (=> b!605352 m!582463))

(assert (=> b!605352 m!582453))

(declare-fun m!582465 () Bool)

(assert (=> b!605352 m!582465))

(declare-fun m!582467 () Bool)

(assert (=> b!605352 m!582467))

(declare-fun m!582469 () Bool)

(assert (=> b!605352 m!582469))

(assert (=> b!605344 m!582463))

(declare-fun m!582471 () Bool)

(assert (=> b!605344 m!582471))

(assert (=> b!605334 m!582453))

(assert (=> b!605334 m!582453))

(declare-fun m!582473 () Bool)

(assert (=> b!605334 m!582473))

(declare-fun m!582475 () Bool)

(assert (=> b!605341 m!582475))

(assert (=> b!605347 m!582453))

(assert (=> b!605347 m!582453))

(declare-fun m!582477 () Bool)

(assert (=> b!605347 m!582477))

(assert (=> b!605332 m!582453))

(declare-fun m!582479 () Bool)

(assert (=> start!55296 m!582479))

(declare-fun m!582481 () Bool)

(assert (=> start!55296 m!582481))

(declare-fun m!582483 () Bool)

(assert (=> b!605343 m!582483))

(assert (=> b!605346 m!582453))

(declare-fun m!582485 () Bool)

(assert (=> b!605346 m!582485))

(assert (=> b!605346 m!582453))

(declare-fun m!582487 () Bool)

(assert (=> b!605346 m!582487))

(declare-fun m!582489 () Bool)

(assert (=> b!605346 m!582489))

(assert (=> b!605346 m!582453))

(declare-fun m!582491 () Bool)

(assert (=> b!605346 m!582491))

(assert (=> b!605346 m!582453))

(declare-fun m!582493 () Bool)

(assert (=> b!605346 m!582493))

(declare-fun m!582495 () Bool)

(assert (=> b!605346 m!582495))

(declare-fun m!582497 () Bool)

(assert (=> b!605346 m!582497))

(assert (=> b!605339 m!582453))

(assert (=> b!605339 m!582453))

(declare-fun m!582499 () Bool)

(assert (=> b!605339 m!582499))

(declare-fun m!582501 () Bool)

(assert (=> b!605335 m!582501))

(declare-fun m!582503 () Bool)

(assert (=> b!605336 m!582503))

(assert (=> b!605338 m!582453))

(assert (=> b!605338 m!582453))

(declare-fun m!582505 () Bool)

(assert (=> b!605338 m!582505))

(assert (=> b!605338 m!582453))

(declare-fun m!582507 () Bool)

(assert (=> b!605338 m!582507))

(assert (=> b!605338 m!582453))

(assert (=> b!605338 m!582499))

(declare-fun m!582509 () Bool)

(assert (=> b!605337 m!582509))

(assert (=> b!605333 m!582453))

(assert (=> b!605333 m!582463))

(declare-fun m!582511 () Bool)

(assert (=> b!605333 m!582511))

(assert (=> b!605349 m!582453))

(assert (=> b!605349 m!582453))

(assert (=> b!605349 m!582473))

(check-sat (not b!605337) (not b!605343) (not b!605339) (not b!605346) (not b!605353) (not b!605352) (not b!605349) (not b!605348) (not b!605338) (not b!605347) (not b!605334) (not b!605336) (not start!55296) (not b!605341))
(check-sat)
