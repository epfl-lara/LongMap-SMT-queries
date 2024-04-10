; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57814 () Bool)

(assert start!57814)

(declare-fun b!639476 () Bool)

(declare-fun e!365984 () Bool)

(declare-fun e!365988 () Bool)

(assert (=> b!639476 (= e!365984 (not e!365988))))

(declare-fun res!414032 () Bool)

(assert (=> b!639476 (=> res!414032 e!365988)))

(declare-datatypes ((SeekEntryResult!6819 0))(
  ( (MissingZero!6819 (index!29593 (_ BitVec 32))) (Found!6819 (index!29594 (_ BitVec 32))) (Intermediate!6819 (undefined!7631 Bool) (index!29595 (_ BitVec 32)) (x!58350 (_ BitVec 32))) (Undefined!6819) (MissingVacant!6819 (index!29596 (_ BitVec 32))) )
))
(declare-fun lt!295835 () SeekEntryResult!6819)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639476 (= res!414032 (not (= lt!295835 (Found!6819 index!984))))))

(declare-datatypes ((Unit!21610 0))(
  ( (Unit!21611) )
))
(declare-fun lt!295840 () Unit!21610)

(declare-fun e!365992 () Unit!21610)

(assert (=> b!639476 (= lt!295840 e!365992)))

(declare-fun c!73097 () Bool)

(assert (=> b!639476 (= c!73097 (= lt!295835 Undefined!6819))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!295839 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38316 0))(
  ( (array!38317 (arr!18379 (Array (_ BitVec 32) (_ BitVec 64))) (size!18743 (_ BitVec 32))) )
))
(declare-fun lt!295838 () array!38316)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38316 (_ BitVec 32)) SeekEntryResult!6819)

(assert (=> b!639476 (= lt!295835 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295839 lt!295838 mask!3053))))

(declare-fun e!365993 () Bool)

(assert (=> b!639476 e!365993))

(declare-fun res!414026 () Bool)

(assert (=> b!639476 (=> (not res!414026) (not e!365993))))

(declare-fun lt!295842 () (_ BitVec 32))

(declare-fun lt!295836 () SeekEntryResult!6819)

(assert (=> b!639476 (= res!414026 (= lt!295836 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295842 vacantSpotIndex!68 lt!295839 lt!295838 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38316)

(assert (=> b!639476 (= lt!295836 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295842 vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639476 (= lt!295839 (select (store (arr!18379 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295845 () Unit!21610)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38316 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21610)

(assert (=> b!639476 (= lt!295845 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295842 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639476 (= lt!295842 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639477 () Bool)

(declare-fun res!414016 () Bool)

(declare-fun e!365994 () Bool)

(assert (=> b!639477 (=> (not res!414016) (not e!365994))))

(declare-datatypes ((List!12420 0))(
  ( (Nil!12417) (Cons!12416 (h!13461 (_ BitVec 64)) (t!18648 List!12420)) )
))
(declare-fun arrayNoDuplicates!0 (array!38316 (_ BitVec 32) List!12420) Bool)

(assert (=> b!639477 (= res!414016 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12417))))

(declare-fun b!639478 () Bool)

(declare-fun e!365987 () Bool)

(assert (=> b!639478 (= e!365987 e!365984)))

(declare-fun res!414021 () Bool)

(assert (=> b!639478 (=> (not res!414021) (not e!365984))))

(declare-fun lt!295844 () SeekEntryResult!6819)

(assert (=> b!639478 (= res!414021 (and (= lt!295844 (Found!6819 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18379 a!2986) index!984) (select (arr!18379 a!2986) j!136))) (not (= (select (arr!18379 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639478 (= lt!295844 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18379 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639479 () Bool)

(declare-fun e!365983 () Bool)

(declare-fun e!365989 () Bool)

(assert (=> b!639479 (= e!365983 e!365989)))

(declare-fun res!414031 () Bool)

(assert (=> b!639479 (=> (not res!414031) (not e!365989))))

(declare-fun arrayContainsKey!0 (array!38316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639479 (= res!414031 (arrayContainsKey!0 lt!295838 (select (arr!18379 a!2986) j!136) j!136))))

(declare-fun b!639480 () Bool)

(declare-fun res!414025 () Bool)

(declare-fun e!365985 () Bool)

(assert (=> b!639480 (=> (not res!414025) (not e!365985))))

(assert (=> b!639480 (= res!414025 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639481 () Bool)

(declare-fun res!414020 () Bool)

(assert (=> b!639481 (=> (not res!414020) (not e!365985))))

(assert (=> b!639481 (= res!414020 (and (= (size!18743 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18743 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18743 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639482 () Bool)

(declare-fun e!365990 () Bool)

(assert (=> b!639482 (= e!365988 e!365990)))

(declare-fun res!414023 () Bool)

(assert (=> b!639482 (=> res!414023 e!365990)))

(declare-fun lt!295846 () (_ BitVec 64))

(assert (=> b!639482 (= res!414023 (or (not (= (select (arr!18379 a!2986) j!136) lt!295839)) (not (= (select (arr!18379 a!2986) j!136) lt!295846)) (bvsge j!136 index!984)))))

(declare-fun e!365986 () Bool)

(assert (=> b!639482 e!365986))

(declare-fun res!414017 () Bool)

(assert (=> b!639482 (=> (not res!414017) (not e!365986))))

(assert (=> b!639482 (= res!414017 (= lt!295846 (select (arr!18379 a!2986) j!136)))))

(assert (=> b!639482 (= lt!295846 (select (store (arr!18379 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639483 () Bool)

(declare-fun res!414024 () Bool)

(assert (=> b!639483 (=> (not res!414024) (not e!365985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639483 (= res!414024 (validKeyInArray!0 (select (arr!18379 a!2986) j!136)))))

(declare-fun b!639484 () Bool)

(declare-fun res!414018 () Bool)

(assert (=> b!639484 (=> (not res!414018) (not e!365985))))

(assert (=> b!639484 (= res!414018 (validKeyInArray!0 k0!1786))))

(declare-fun b!639485 () Bool)

(assert (=> b!639485 (= e!365994 e!365987)))

(declare-fun res!414028 () Bool)

(assert (=> b!639485 (=> (not res!414028) (not e!365987))))

(assert (=> b!639485 (= res!414028 (= (select (store (arr!18379 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639485 (= lt!295838 (array!38317 (store (arr!18379 a!2986) i!1108 k0!1786) (size!18743 a!2986)))))

(declare-fun b!639486 () Bool)

(declare-fun res!414019 () Bool)

(assert (=> b!639486 (=> (not res!414019) (not e!365994))))

(assert (=> b!639486 (= res!414019 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18379 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!414027 () Bool)

(assert (=> start!57814 (=> (not res!414027) (not e!365985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57814 (= res!414027 (validMask!0 mask!3053))))

(assert (=> start!57814 e!365985))

(assert (=> start!57814 true))

(declare-fun array_inv!14175 (array!38316) Bool)

(assert (=> start!57814 (array_inv!14175 a!2986)))

(declare-fun b!639487 () Bool)

(assert (=> b!639487 (= e!365989 (arrayContainsKey!0 lt!295838 (select (arr!18379 a!2986) j!136) index!984))))

(declare-fun b!639488 () Bool)

(declare-fun Unit!21612 () Unit!21610)

(assert (=> b!639488 (= e!365992 Unit!21612)))

(assert (=> b!639488 false))

(declare-fun b!639489 () Bool)

(declare-fun Unit!21613 () Unit!21610)

(assert (=> b!639489 (= e!365992 Unit!21613)))

(declare-fun b!639490 () Bool)

(declare-fun res!414022 () Bool)

(assert (=> b!639490 (=> (not res!414022) (not e!365994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38316 (_ BitVec 32)) Bool)

(assert (=> b!639490 (= res!414022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639491 () Bool)

(assert (=> b!639491 (= e!365985 e!365994)))

(declare-fun res!414030 () Bool)

(assert (=> b!639491 (=> (not res!414030) (not e!365994))))

(declare-fun lt!295841 () SeekEntryResult!6819)

(assert (=> b!639491 (= res!414030 (or (= lt!295841 (MissingZero!6819 i!1108)) (= lt!295841 (MissingVacant!6819 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38316 (_ BitVec 32)) SeekEntryResult!6819)

(assert (=> b!639491 (= lt!295841 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639492 () Bool)

(assert (=> b!639492 (= e!365993 (= lt!295844 lt!295836))))

(declare-fun b!639493 () Bool)

(assert (=> b!639493 (= e!365990 (or (bvsge (size!18743 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18743 a!2986)) (bvsle j!136 (size!18743 a!2986))))))

(assert (=> b!639493 (arrayNoDuplicates!0 lt!295838 #b00000000000000000000000000000000 Nil!12417)))

(declare-fun lt!295843 () Unit!21610)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12420) Unit!21610)

(assert (=> b!639493 (= lt!295843 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12417))))

(assert (=> b!639493 (arrayContainsKey!0 lt!295838 (select (arr!18379 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295837 () Unit!21610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21610)

(assert (=> b!639493 (= lt!295837 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295838 (select (arr!18379 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639494 () Bool)

(assert (=> b!639494 (= e!365986 e!365983)))

(declare-fun res!414029 () Bool)

(assert (=> b!639494 (=> res!414029 e!365983)))

(assert (=> b!639494 (= res!414029 (or (not (= (select (arr!18379 a!2986) j!136) lt!295839)) (not (= (select (arr!18379 a!2986) j!136) lt!295846)) (bvsge j!136 index!984)))))

(assert (= (and start!57814 res!414027) b!639481))

(assert (= (and b!639481 res!414020) b!639483))

(assert (= (and b!639483 res!414024) b!639484))

(assert (= (and b!639484 res!414018) b!639480))

(assert (= (and b!639480 res!414025) b!639491))

(assert (= (and b!639491 res!414030) b!639490))

(assert (= (and b!639490 res!414022) b!639477))

(assert (= (and b!639477 res!414016) b!639486))

(assert (= (and b!639486 res!414019) b!639485))

(assert (= (and b!639485 res!414028) b!639478))

(assert (= (and b!639478 res!414021) b!639476))

(assert (= (and b!639476 res!414026) b!639492))

(assert (= (and b!639476 c!73097) b!639488))

(assert (= (and b!639476 (not c!73097)) b!639489))

(assert (= (and b!639476 (not res!414032)) b!639482))

(assert (= (and b!639482 res!414017) b!639494))

(assert (= (and b!639494 (not res!414029)) b!639479))

(assert (= (and b!639479 res!414031) b!639487))

(assert (= (and b!639482 (not res!414023)) b!639493))

(declare-fun m!613337 () Bool)

(assert (=> b!639483 m!613337))

(assert (=> b!639483 m!613337))

(declare-fun m!613339 () Bool)

(assert (=> b!639483 m!613339))

(assert (=> b!639482 m!613337))

(declare-fun m!613341 () Bool)

(assert (=> b!639482 m!613341))

(declare-fun m!613343 () Bool)

(assert (=> b!639482 m!613343))

(declare-fun m!613345 () Bool)

(assert (=> b!639480 m!613345))

(assert (=> b!639494 m!613337))

(declare-fun m!613347 () Bool)

(assert (=> b!639493 m!613347))

(assert (=> b!639493 m!613337))

(assert (=> b!639493 m!613337))

(declare-fun m!613349 () Bool)

(assert (=> b!639493 m!613349))

(assert (=> b!639493 m!613337))

(declare-fun m!613351 () Bool)

(assert (=> b!639493 m!613351))

(declare-fun m!613353 () Bool)

(assert (=> b!639493 m!613353))

(declare-fun m!613355 () Bool)

(assert (=> b!639484 m!613355))

(assert (=> b!639487 m!613337))

(assert (=> b!639487 m!613337))

(declare-fun m!613357 () Bool)

(assert (=> b!639487 m!613357))

(assert (=> b!639485 m!613341))

(declare-fun m!613359 () Bool)

(assert (=> b!639485 m!613359))

(declare-fun m!613361 () Bool)

(assert (=> b!639490 m!613361))

(declare-fun m!613363 () Bool)

(assert (=> b!639491 m!613363))

(assert (=> b!639479 m!613337))

(assert (=> b!639479 m!613337))

(declare-fun m!613365 () Bool)

(assert (=> b!639479 m!613365))

(declare-fun m!613367 () Bool)

(assert (=> b!639478 m!613367))

(assert (=> b!639478 m!613337))

(assert (=> b!639478 m!613337))

(declare-fun m!613369 () Bool)

(assert (=> b!639478 m!613369))

(declare-fun m!613371 () Bool)

(assert (=> b!639476 m!613371))

(assert (=> b!639476 m!613337))

(declare-fun m!613373 () Bool)

(assert (=> b!639476 m!613373))

(assert (=> b!639476 m!613337))

(assert (=> b!639476 m!613341))

(declare-fun m!613375 () Bool)

(assert (=> b!639476 m!613375))

(declare-fun m!613377 () Bool)

(assert (=> b!639476 m!613377))

(declare-fun m!613379 () Bool)

(assert (=> b!639476 m!613379))

(declare-fun m!613381 () Bool)

(assert (=> b!639476 m!613381))

(declare-fun m!613383 () Bool)

(assert (=> b!639486 m!613383))

(declare-fun m!613385 () Bool)

(assert (=> start!57814 m!613385))

(declare-fun m!613387 () Bool)

(assert (=> start!57814 m!613387))

(declare-fun m!613389 () Bool)

(assert (=> b!639477 m!613389))

(check-sat (not b!639493) (not b!639477) (not b!639478) (not b!639476) (not b!639490) (not start!57814) (not b!639483) (not b!639491) (not b!639480) (not b!639479) (not b!639487) (not b!639484))
(check-sat)
