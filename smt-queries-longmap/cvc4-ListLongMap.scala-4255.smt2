; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59004 () Bool)

(assert start!59004)

(declare-fun b!651325 () Bool)

(declare-fun e!373741 () Bool)

(declare-fun e!373745 () Bool)

(assert (=> b!651325 (= e!373741 e!373745)))

(declare-fun res!422363 () Bool)

(assert (=> b!651325 (=> (not res!422363) (not e!373745))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38585 0))(
  ( (array!38586 (arr!18497 (Array (_ BitVec 32) (_ BitVec 64))) (size!18861 (_ BitVec 32))) )
))
(declare-fun lt!302859 () array!38585)

(declare-fun a!2986 () array!38585)

(declare-fun arrayContainsKey!0 (array!38585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651325 (= res!422363 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) j!136))))

(declare-fun b!651326 () Bool)

(declare-fun res!422360 () Bool)

(declare-fun e!373739 () Bool)

(assert (=> b!651326 (=> (not res!422360) (not e!373739))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651326 (= res!422360 (validKeyInArray!0 k!1786))))

(declare-fun b!651327 () Bool)

(declare-fun res!422359 () Bool)

(assert (=> b!651327 (=> (not res!422359) (not e!373739))))

(assert (=> b!651327 (= res!422359 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651328 () Bool)

(declare-fun res!422346 () Bool)

(assert (=> b!651328 (=> (not res!422346) (not e!373739))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651328 (= res!422346 (and (= (size!18861 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18861 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18861 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651329 () Bool)

(declare-fun e!373734 () Bool)

(declare-fun e!373740 () Bool)

(assert (=> b!651329 (= e!373734 e!373740)))

(declare-fun res!422362 () Bool)

(assert (=> b!651329 (=> (not res!422362) (not e!373740))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!651329 (= res!422362 (= (select (store (arr!18497 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651329 (= lt!302859 (array!38586 (store (arr!18497 a!2986) i!1108 k!1786) (size!18861 a!2986)))))

(declare-fun res!422354 () Bool)

(assert (=> start!59004 (=> (not res!422354) (not e!373739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59004 (= res!422354 (validMask!0 mask!3053))))

(assert (=> start!59004 e!373739))

(assert (=> start!59004 true))

(declare-fun array_inv!14293 (array!38585) Bool)

(assert (=> start!59004 (array_inv!14293 a!2986)))

(declare-fun b!651330 () Bool)

(declare-fun e!373732 () Bool)

(declare-fun e!373733 () Bool)

(assert (=> b!651330 (= e!373732 (not e!373733))))

(declare-fun res!422349 () Bool)

(assert (=> b!651330 (=> res!422349 e!373733)))

(declare-datatypes ((SeekEntryResult!6937 0))(
  ( (MissingZero!6937 (index!30098 (_ BitVec 32))) (Found!6937 (index!30099 (_ BitVec 32))) (Intermediate!6937 (undefined!7749 Bool) (index!30100 (_ BitVec 32)) (x!58879 (_ BitVec 32))) (Undefined!6937) (MissingVacant!6937 (index!30101 (_ BitVec 32))) )
))
(declare-fun lt!302863 () SeekEntryResult!6937)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!651330 (= res!422349 (not (= lt!302863 (Found!6937 index!984))))))

(declare-datatypes ((Unit!22248 0))(
  ( (Unit!22249) )
))
(declare-fun lt!302872 () Unit!22248)

(declare-fun e!373746 () Unit!22248)

(assert (=> b!651330 (= lt!302872 e!373746)))

(declare-fun c!74858 () Bool)

(assert (=> b!651330 (= c!74858 (= lt!302863 Undefined!6937))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!302861 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38585 (_ BitVec 32)) SeekEntryResult!6937)

(assert (=> b!651330 (= lt!302863 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302861 lt!302859 mask!3053))))

(declare-fun e!373742 () Bool)

(assert (=> b!651330 e!373742))

(declare-fun res!422347 () Bool)

(assert (=> b!651330 (=> (not res!422347) (not e!373742))))

(declare-fun lt!302874 () (_ BitVec 32))

(declare-fun lt!302870 () SeekEntryResult!6937)

(assert (=> b!651330 (= res!422347 (= lt!302870 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 lt!302861 lt!302859 mask!3053)))))

(assert (=> b!651330 (= lt!302870 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 (select (arr!18497 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651330 (= lt!302861 (select (store (arr!18497 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302866 () Unit!22248)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22248)

(assert (=> b!651330 (= lt!302866 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651330 (= lt!302874 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651331 () Bool)

(declare-fun e!373735 () Bool)

(assert (=> b!651331 (= e!373735 e!373741)))

(declare-fun res!422351 () Bool)

(assert (=> b!651331 (=> res!422351 e!373741)))

(declare-fun lt!302873 () (_ BitVec 64))

(assert (=> b!651331 (= res!422351 (or (not (= (select (arr!18497 a!2986) j!136) lt!302861)) (not (= (select (arr!18497 a!2986) j!136) lt!302873)) (bvsge j!136 index!984)))))

(declare-fun b!651332 () Bool)

(declare-fun e!373738 () Bool)

(assert (=> b!651332 (= e!373738 (bvslt (size!18861 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12538 0))(
  ( (Nil!12535) (Cons!12534 (h!13579 (_ BitVec 64)) (t!18766 List!12538)) )
))
(declare-fun arrayNoDuplicates!0 (array!38585 (_ BitVec 32) List!12538) Bool)

(assert (=> b!651332 (arrayNoDuplicates!0 lt!302859 index!984 Nil!12535)))

(declare-fun lt!302875 () Unit!22248)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38585 (_ BitVec 32) (_ BitVec 32)) Unit!22248)

(assert (=> b!651332 (= lt!302875 (lemmaNoDuplicateFromThenFromBigger!0 lt!302859 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651332 (arrayNoDuplicates!0 lt!302859 #b00000000000000000000000000000000 Nil!12535)))

(declare-fun lt!302860 () Unit!22248)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12538) Unit!22248)

(assert (=> b!651332 (= lt!302860 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12535))))

(assert (=> b!651332 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302864 () Unit!22248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22248)

(assert (=> b!651332 (= lt!302864 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302859 (select (arr!18497 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373744 () Bool)

(assert (=> b!651332 e!373744))

(declare-fun res!422358 () Bool)

(assert (=> b!651332 (=> (not res!422358) (not e!373744))))

(assert (=> b!651332 (= res!422358 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) j!136))))

(declare-fun b!651333 () Bool)

(declare-fun e!373737 () Unit!22248)

(declare-fun Unit!22250 () Unit!22248)

(assert (=> b!651333 (= e!373737 Unit!22250)))

(declare-fun b!651334 () Bool)

(assert (=> b!651334 (= e!373744 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) index!984))))

(declare-fun b!651335 () Bool)

(declare-fun lt!302869 () SeekEntryResult!6937)

(assert (=> b!651335 (= e!373742 (= lt!302869 lt!302870))))

(declare-fun b!651336 () Bool)

(declare-fun Unit!22251 () Unit!22248)

(assert (=> b!651336 (= e!373737 Unit!22251)))

(declare-fun lt!302865 () Unit!22248)

(assert (=> b!651336 (= lt!302865 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302859 (select (arr!18497 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651336 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302871 () Unit!22248)

(assert (=> b!651336 (= lt!302871 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12535))))

(assert (=> b!651336 (arrayNoDuplicates!0 lt!302859 #b00000000000000000000000000000000 Nil!12535)))

(declare-fun lt!302867 () Unit!22248)

(assert (=> b!651336 (= lt!302867 (lemmaNoDuplicateFromThenFromBigger!0 lt!302859 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651336 (arrayNoDuplicates!0 lt!302859 j!136 Nil!12535)))

(declare-fun lt!302862 () Unit!22248)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38585 (_ BitVec 64) (_ BitVec 32) List!12538) Unit!22248)

(assert (=> b!651336 (= lt!302862 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302859 (select (arr!18497 a!2986) j!136) j!136 Nil!12535))))

(assert (=> b!651336 false))

(declare-fun b!651337 () Bool)

(assert (=> b!651337 (= e!373745 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) index!984))))

(declare-fun b!651338 () Bool)

(declare-fun Unit!22252 () Unit!22248)

(assert (=> b!651338 (= e!373746 Unit!22252)))

(assert (=> b!651338 false))

(declare-fun b!651339 () Bool)

(declare-fun res!422356 () Bool)

(assert (=> b!651339 (=> (not res!422356) (not e!373734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38585 (_ BitVec 32)) Bool)

(assert (=> b!651339 (= res!422356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651340 () Bool)

(declare-fun Unit!22253 () Unit!22248)

(assert (=> b!651340 (= e!373746 Unit!22253)))

(declare-fun b!651341 () Bool)

(declare-fun res!422345 () Bool)

(assert (=> b!651341 (=> (not res!422345) (not e!373734))))

(assert (=> b!651341 (= res!422345 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18497 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651342 () Bool)

(declare-fun res!422355 () Bool)

(assert (=> b!651342 (=> (not res!422355) (not e!373739))))

(assert (=> b!651342 (= res!422355 (validKeyInArray!0 (select (arr!18497 a!2986) j!136)))))

(declare-fun b!651343 () Bool)

(declare-fun e!373743 () Bool)

(assert (=> b!651343 (= e!373743 e!373738)))

(declare-fun res!422357 () Bool)

(assert (=> b!651343 (=> res!422357 e!373738)))

(assert (=> b!651343 (= res!422357 (bvsge index!984 j!136))))

(declare-fun lt!302868 () Unit!22248)

(assert (=> b!651343 (= lt!302868 e!373737)))

(declare-fun c!74857 () Bool)

(assert (=> b!651343 (= c!74857 (bvslt j!136 index!984))))

(declare-fun b!651344 () Bool)

(declare-fun res!422352 () Bool)

(assert (=> b!651344 (=> (not res!422352) (not e!373734))))

(assert (=> b!651344 (= res!422352 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12535))))

(declare-fun b!651345 () Bool)

(assert (=> b!651345 (= e!373733 e!373743)))

(declare-fun res!422353 () Bool)

(assert (=> b!651345 (=> res!422353 e!373743)))

(assert (=> b!651345 (= res!422353 (or (not (= (select (arr!18497 a!2986) j!136) lt!302861)) (not (= (select (arr!18497 a!2986) j!136) lt!302873))))))

(assert (=> b!651345 e!373735))

(declare-fun res!422350 () Bool)

(assert (=> b!651345 (=> (not res!422350) (not e!373735))))

(assert (=> b!651345 (= res!422350 (= lt!302873 (select (arr!18497 a!2986) j!136)))))

(assert (=> b!651345 (= lt!302873 (select (store (arr!18497 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!651346 () Bool)

(assert (=> b!651346 (= e!373740 e!373732)))

(declare-fun res!422348 () Bool)

(assert (=> b!651346 (=> (not res!422348) (not e!373732))))

(assert (=> b!651346 (= res!422348 (and (= lt!302869 (Found!6937 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18497 a!2986) index!984) (select (arr!18497 a!2986) j!136))) (not (= (select (arr!18497 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!651346 (= lt!302869 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18497 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651347 () Bool)

(assert (=> b!651347 (= e!373739 e!373734)))

(declare-fun res!422361 () Bool)

(assert (=> b!651347 (=> (not res!422361) (not e!373734))))

(declare-fun lt!302858 () SeekEntryResult!6937)

(assert (=> b!651347 (= res!422361 (or (= lt!302858 (MissingZero!6937 i!1108)) (= lt!302858 (MissingVacant!6937 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38585 (_ BitVec 32)) SeekEntryResult!6937)

(assert (=> b!651347 (= lt!302858 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!59004 res!422354) b!651328))

(assert (= (and b!651328 res!422346) b!651342))

(assert (= (and b!651342 res!422355) b!651326))

(assert (= (and b!651326 res!422360) b!651327))

(assert (= (and b!651327 res!422359) b!651347))

(assert (= (and b!651347 res!422361) b!651339))

(assert (= (and b!651339 res!422356) b!651344))

(assert (= (and b!651344 res!422352) b!651341))

(assert (= (and b!651341 res!422345) b!651329))

(assert (= (and b!651329 res!422362) b!651346))

(assert (= (and b!651346 res!422348) b!651330))

(assert (= (and b!651330 res!422347) b!651335))

(assert (= (and b!651330 c!74858) b!651338))

(assert (= (and b!651330 (not c!74858)) b!651340))

(assert (= (and b!651330 (not res!422349)) b!651345))

(assert (= (and b!651345 res!422350) b!651331))

(assert (= (and b!651331 (not res!422351)) b!651325))

(assert (= (and b!651325 res!422363) b!651337))

(assert (= (and b!651345 (not res!422353)) b!651343))

(assert (= (and b!651343 c!74857) b!651336))

(assert (= (and b!651343 (not c!74857)) b!651333))

(assert (= (and b!651343 (not res!422357)) b!651332))

(assert (= (and b!651332 res!422358) b!651334))

(declare-fun m!624471 () Bool)

(assert (=> start!59004 m!624471))

(declare-fun m!624473 () Bool)

(assert (=> start!59004 m!624473))

(declare-fun m!624475 () Bool)

(assert (=> b!651325 m!624475))

(assert (=> b!651325 m!624475))

(declare-fun m!624477 () Bool)

(assert (=> b!651325 m!624477))

(declare-fun m!624479 () Bool)

(assert (=> b!651327 m!624479))

(assert (=> b!651337 m!624475))

(assert (=> b!651337 m!624475))

(declare-fun m!624481 () Bool)

(assert (=> b!651337 m!624481))

(assert (=> b!651342 m!624475))

(assert (=> b!651342 m!624475))

(declare-fun m!624483 () Bool)

(assert (=> b!651342 m!624483))

(declare-fun m!624485 () Bool)

(assert (=> b!651332 m!624485))

(assert (=> b!651332 m!624475))

(assert (=> b!651332 m!624477))

(declare-fun m!624487 () Bool)

(assert (=> b!651332 m!624487))

(declare-fun m!624489 () Bool)

(assert (=> b!651332 m!624489))

(assert (=> b!651332 m!624475))

(declare-fun m!624491 () Bool)

(assert (=> b!651332 m!624491))

(assert (=> b!651332 m!624475))

(declare-fun m!624493 () Bool)

(assert (=> b!651332 m!624493))

(assert (=> b!651332 m!624475))

(declare-fun m!624495 () Bool)

(assert (=> b!651332 m!624495))

(declare-fun m!624497 () Bool)

(assert (=> b!651344 m!624497))

(declare-fun m!624499 () Bool)

(assert (=> b!651329 m!624499))

(declare-fun m!624501 () Bool)

(assert (=> b!651329 m!624501))

(declare-fun m!624503 () Bool)

(assert (=> b!651326 m!624503))

(declare-fun m!624505 () Bool)

(assert (=> b!651339 m!624505))

(assert (=> b!651334 m!624475))

(assert (=> b!651334 m!624475))

(assert (=> b!651334 m!624481))

(declare-fun m!624507 () Bool)

(assert (=> b!651347 m!624507))

(assert (=> b!651331 m!624475))

(declare-fun m!624509 () Bool)

(assert (=> b!651341 m!624509))

(assert (=> b!651345 m!624475))

(assert (=> b!651345 m!624499))

(declare-fun m!624511 () Bool)

(assert (=> b!651345 m!624511))

(declare-fun m!624513 () Bool)

(assert (=> b!651330 m!624513))

(declare-fun m!624515 () Bool)

(assert (=> b!651330 m!624515))

(assert (=> b!651330 m!624475))

(assert (=> b!651330 m!624499))

(declare-fun m!624517 () Bool)

(assert (=> b!651330 m!624517))

(declare-fun m!624519 () Bool)

(assert (=> b!651330 m!624519))

(assert (=> b!651330 m!624475))

(declare-fun m!624521 () Bool)

(assert (=> b!651330 m!624521))

(declare-fun m!624523 () Bool)

(assert (=> b!651330 m!624523))

(assert (=> b!651336 m!624475))

(declare-fun m!624525 () Bool)

(assert (=> b!651336 m!624525))

(assert (=> b!651336 m!624475))

(declare-fun m!624527 () Bool)

(assert (=> b!651336 m!624527))

(assert (=> b!651336 m!624487))

(assert (=> b!651336 m!624475))

(declare-fun m!624529 () Bool)

(assert (=> b!651336 m!624529))

(assert (=> b!651336 m!624489))

(assert (=> b!651336 m!624475))

(declare-fun m!624531 () Bool)

(assert (=> b!651336 m!624531))

(declare-fun m!624533 () Bool)

(assert (=> b!651336 m!624533))

(declare-fun m!624535 () Bool)

(assert (=> b!651346 m!624535))

(assert (=> b!651346 m!624475))

(assert (=> b!651346 m!624475))

(declare-fun m!624537 () Bool)

(assert (=> b!651346 m!624537))

(push 1)

(assert (not b!651332))

(assert (not b!651326))

(assert (not b!651346))

(assert (not b!651337))

(assert (not b!651325))

(assert (not b!651339))

(assert (not b!651342))

(assert (not b!651327))

(assert (not start!59004))

(assert (not b!651344))

(assert (not b!651334))

(assert (not b!651336))

(assert (not b!651347))

(assert (not b!651330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!651437 () Bool)

(declare-fun e!373808 () SeekEntryResult!6937)

(assert (=> b!651437 (= e!373808 (MissingVacant!6937 vacantSpotIndex!68))))

(declare-fun b!651438 () Bool)

(declare-fun e!373807 () SeekEntryResult!6937)

(assert (=> b!651438 (= e!373807 (Found!6937 lt!302874))))

(declare-fun b!651439 () Bool)

(declare-fun e!373806 () SeekEntryResult!6937)

(assert (=> b!651439 (= e!373806 e!373807)))

(declare-fun c!74890 () Bool)

(declare-fun lt!302902 () (_ BitVec 64))

(assert (=> b!651439 (= c!74890 (= lt!302902 (select (arr!18497 a!2986) j!136)))))

(declare-fun b!651440 () Bool)

(assert (=> b!651440 (= e!373806 Undefined!6937)))

(declare-fun lt!302901 () SeekEntryResult!6937)

(declare-fun d!92059 () Bool)

(assert (=> d!92059 (and (or (is-Undefined!6937 lt!302901) (not (is-Found!6937 lt!302901)) (and (bvsge (index!30099 lt!302901) #b00000000000000000000000000000000) (bvslt (index!30099 lt!302901) (size!18861 a!2986)))) (or (is-Undefined!6937 lt!302901) (is-Found!6937 lt!302901) (not (is-MissingVacant!6937 lt!302901)) (not (= (index!30101 lt!302901) vacantSpotIndex!68)) (and (bvsge (index!30101 lt!302901) #b00000000000000000000000000000000) (bvslt (index!30101 lt!302901) (size!18861 a!2986)))) (or (is-Undefined!6937 lt!302901) (ite (is-Found!6937 lt!302901) (= (select (arr!18497 a!2986) (index!30099 lt!302901)) (select (arr!18497 a!2986) j!136)) (and (is-MissingVacant!6937 lt!302901) (= (index!30101 lt!302901) vacantSpotIndex!68) (= (select (arr!18497 a!2986) (index!30101 lt!302901)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92059 (= lt!302901 e!373806)))

(declare-fun c!74891 () Bool)

(assert (=> d!92059 (= c!74891 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92059 (= lt!302902 (select (arr!18497 a!2986) lt!302874))))

(assert (=> d!92059 (validMask!0 mask!3053)))

(assert (=> d!92059 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 (select (arr!18497 a!2986) j!136) a!2986 mask!3053) lt!302901)))

(declare-fun b!651441 () Bool)

(declare-fun c!74889 () Bool)

(assert (=> b!651441 (= c!74889 (= lt!302902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651441 (= e!373807 e!373808)))

(declare-fun b!651442 () Bool)

(assert (=> b!651442 (= e!373808 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302874 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18497 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!92059 c!74891) b!651440))

(assert (= (and d!92059 (not c!74891)) b!651439))

(assert (= (and b!651439 c!74890) b!651438))

(assert (= (and b!651439 (not c!74890)) b!651441))

(assert (= (and b!651441 c!74889) b!651437))

(assert (= (and b!651441 (not c!74889)) b!651442))

(declare-fun m!624603 () Bool)

(assert (=> d!92059 m!624603))

(declare-fun m!624605 () Bool)

(assert (=> d!92059 m!624605))

(declare-fun m!624607 () Bool)

(assert (=> d!92059 m!624607))

(assert (=> d!92059 m!624471))

(declare-fun m!624609 () Bool)

(assert (=> b!651442 m!624609))

(assert (=> b!651442 m!624609))

(assert (=> b!651442 m!624475))

(declare-fun m!624611 () Bool)

(assert (=> b!651442 m!624611))

(assert (=> b!651330 d!92059))

(declare-fun d!92079 () Bool)

(declare-fun lt!302907 () (_ BitVec 32))

(assert (=> d!92079 (and (bvsge lt!302907 #b00000000000000000000000000000000) (bvslt lt!302907 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92079 (= lt!302907 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92079 (validMask!0 mask!3053)))

(assert (=> d!92079 (= (nextIndex!0 index!984 x!910 mask!3053) lt!302907)))

(declare-fun bs!19422 () Bool)

(assert (= bs!19422 d!92079))

(declare-fun m!624613 () Bool)

(assert (=> bs!19422 m!624613))

(assert (=> bs!19422 m!624471))

(assert (=> b!651330 d!92079))

(declare-fun d!92081 () Bool)

(declare-fun e!373834 () Bool)

(assert (=> d!92081 e!373834))

(declare-fun res!422415 () Bool)

(assert (=> d!92081 (=> (not res!422415) (not e!373834))))

(assert (=> d!92081 (= res!422415 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18861 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18861 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18861 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18861 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18861 a!2986))))))

(declare-fun lt!302920 () Unit!22248)

(declare-fun choose!9 (array!38585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22248)

(assert (=> d!92081 (= lt!302920 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92081 (validMask!0 mask!3053)))

(assert (=> d!92081 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 mask!3053) lt!302920)))

(declare-fun b!651471 () Bool)

(assert (=> b!651471 (= e!373834 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 (select (arr!18497 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 (select (store (arr!18497 a!2986) i!1108 k!1786) j!136) (array!38586 (store (arr!18497 a!2986) i!1108 k!1786) (size!18861 a!2986)) mask!3053)))))

(assert (= (and d!92081 res!422415) b!651471))

(declare-fun m!624655 () Bool)

(assert (=> d!92081 m!624655))

(assert (=> d!92081 m!624471))

(assert (=> b!651471 m!624499))

(assert (=> b!651471 m!624515))

(declare-fun m!624657 () Bool)

(assert (=> b!651471 m!624657))

(assert (=> b!651471 m!624475))

(assert (=> b!651471 m!624475))

(assert (=> b!651471 m!624521))

(assert (=> b!651471 m!624515))

(assert (=> b!651330 d!92081))

(declare-fun b!651472 () Bool)

(declare-fun e!373837 () SeekEntryResult!6937)

(assert (=> b!651472 (= e!373837 (MissingVacant!6937 vacantSpotIndex!68))))

(declare-fun b!651473 () Bool)

(declare-fun e!373836 () SeekEntryResult!6937)

(assert (=> b!651473 (= e!373836 (Found!6937 lt!302874))))

(declare-fun b!651474 () Bool)

(declare-fun e!373835 () SeekEntryResult!6937)

(assert (=> b!651474 (= e!373835 e!373836)))

(declare-fun c!74896 () Bool)

(declare-fun lt!302922 () (_ BitVec 64))

(assert (=> b!651474 (= c!74896 (= lt!302922 lt!302861))))

(declare-fun b!651475 () Bool)

(assert (=> b!651475 (= e!373835 Undefined!6937)))

(declare-fun d!92105 () Bool)

(declare-fun lt!302921 () SeekEntryResult!6937)

(assert (=> d!92105 (and (or (is-Undefined!6937 lt!302921) (not (is-Found!6937 lt!302921)) (and (bvsge (index!30099 lt!302921) #b00000000000000000000000000000000) (bvslt (index!30099 lt!302921) (size!18861 lt!302859)))) (or (is-Undefined!6937 lt!302921) (is-Found!6937 lt!302921) (not (is-MissingVacant!6937 lt!302921)) (not (= (index!30101 lt!302921) vacantSpotIndex!68)) (and (bvsge (index!30101 lt!302921) #b00000000000000000000000000000000) (bvslt (index!30101 lt!302921) (size!18861 lt!302859)))) (or (is-Undefined!6937 lt!302921) (ite (is-Found!6937 lt!302921) (= (select (arr!18497 lt!302859) (index!30099 lt!302921)) lt!302861) (and (is-MissingVacant!6937 lt!302921) (= (index!30101 lt!302921) vacantSpotIndex!68) (= (select (arr!18497 lt!302859) (index!30101 lt!302921)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92105 (= lt!302921 e!373835)))

(declare-fun c!74897 () Bool)

(assert (=> d!92105 (= c!74897 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92105 (= lt!302922 (select (arr!18497 lt!302859) lt!302874))))

(assert (=> d!92105 (validMask!0 mask!3053)))

(assert (=> d!92105 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302874 vacantSpotIndex!68 lt!302861 lt!302859 mask!3053) lt!302921)))

(declare-fun b!651476 () Bool)

(declare-fun c!74895 () Bool)

(assert (=> b!651476 (= c!74895 (= lt!302922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651476 (= e!373836 e!373837)))

(declare-fun b!651477 () Bool)

(assert (=> b!651477 (= e!373837 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302874 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!302861 lt!302859 mask!3053))))

(assert (= (and d!92105 c!74897) b!651475))

(assert (= (and d!92105 (not c!74897)) b!651474))

(assert (= (and b!651474 c!74896) b!651473))

(assert (= (and b!651474 (not c!74896)) b!651476))

(assert (= (and b!651476 c!74895) b!651472))

(assert (= (and b!651476 (not c!74895)) b!651477))

(declare-fun m!624659 () Bool)

(assert (=> d!92105 m!624659))

(declare-fun m!624661 () Bool)

(assert (=> d!92105 m!624661))

(declare-fun m!624663 () Bool)

(assert (=> d!92105 m!624663))

(assert (=> d!92105 m!624471))

(assert (=> b!651477 m!624609))

(assert (=> b!651477 m!624609))

(declare-fun m!624665 () Bool)

(assert (=> b!651477 m!624665))

(assert (=> b!651330 d!92105))

(declare-fun b!651478 () Bool)

(declare-fun e!373840 () SeekEntryResult!6937)

(assert (=> b!651478 (= e!373840 (MissingVacant!6937 vacantSpotIndex!68))))

(declare-fun b!651479 () Bool)

(declare-fun e!373839 () SeekEntryResult!6937)

(assert (=> b!651479 (= e!373839 (Found!6937 index!984))))

(declare-fun b!651480 () Bool)

(declare-fun e!373838 () SeekEntryResult!6937)

(assert (=> b!651480 (= e!373838 e!373839)))

(declare-fun c!74899 () Bool)

(declare-fun lt!302924 () (_ BitVec 64))

(assert (=> b!651480 (= c!74899 (= lt!302924 lt!302861))))

(declare-fun b!651481 () Bool)

(assert (=> b!651481 (= e!373838 Undefined!6937)))

(declare-fun d!92107 () Bool)

(declare-fun lt!302923 () SeekEntryResult!6937)

(assert (=> d!92107 (and (or (is-Undefined!6937 lt!302923) (not (is-Found!6937 lt!302923)) (and (bvsge (index!30099 lt!302923) #b00000000000000000000000000000000) (bvslt (index!30099 lt!302923) (size!18861 lt!302859)))) (or (is-Undefined!6937 lt!302923) (is-Found!6937 lt!302923) (not (is-MissingVacant!6937 lt!302923)) (not (= (index!30101 lt!302923) vacantSpotIndex!68)) (and (bvsge (index!30101 lt!302923) #b00000000000000000000000000000000) (bvslt (index!30101 lt!302923) (size!18861 lt!302859)))) (or (is-Undefined!6937 lt!302923) (ite (is-Found!6937 lt!302923) (= (select (arr!18497 lt!302859) (index!30099 lt!302923)) lt!302861) (and (is-MissingVacant!6937 lt!302923) (= (index!30101 lt!302923) vacantSpotIndex!68) (= (select (arr!18497 lt!302859) (index!30101 lt!302923)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92107 (= lt!302923 e!373838)))

(declare-fun c!74900 () Bool)

(assert (=> d!92107 (= c!74900 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92107 (= lt!302924 (select (arr!18497 lt!302859) index!984))))

(assert (=> d!92107 (validMask!0 mask!3053)))

(assert (=> d!92107 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302861 lt!302859 mask!3053) lt!302923)))

(declare-fun b!651482 () Bool)

(declare-fun c!74898 () Bool)

(assert (=> b!651482 (= c!74898 (= lt!302924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651482 (= e!373839 e!373840)))

(declare-fun b!651483 () Bool)

(assert (=> b!651483 (= e!373840 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!302861 lt!302859 mask!3053))))

(assert (= (and d!92107 c!74900) b!651481))

(assert (= (and d!92107 (not c!74900)) b!651480))

(assert (= (and b!651480 c!74899) b!651479))

(assert (= (and b!651480 (not c!74899)) b!651482))

(assert (= (and b!651482 c!74898) b!651478))

(assert (= (and b!651482 (not c!74898)) b!651483))

(declare-fun m!624667 () Bool)

(assert (=> d!92107 m!624667))

(declare-fun m!624669 () Bool)

(assert (=> d!92107 m!624669))

(declare-fun m!624671 () Bool)

(assert (=> d!92107 m!624671))

(assert (=> d!92107 m!624471))

(assert (=> b!651483 m!624513))

(assert (=> b!651483 m!624513))

(declare-fun m!624673 () Bool)

(assert (=> b!651483 m!624673))

(assert (=> b!651330 d!92107))

(declare-fun d!92109 () Bool)

(declare-fun res!422422 () Bool)

(declare-fun e!373847 () Bool)

(assert (=> d!92109 (=> res!422422 e!373847)))

(assert (=> d!92109 (= res!422422 (= (select (arr!18497 lt!302859) j!136) (select (arr!18497 a!2986) j!136)))))

(assert (=> d!92109 (= (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) j!136) e!373847)))

(declare-fun b!651490 () Bool)

(declare-fun e!373848 () Bool)

(assert (=> b!651490 (= e!373847 e!373848)))

(declare-fun res!422423 () Bool)

(assert (=> b!651490 (=> (not res!422423) (not e!373848))))

(assert (=> b!651490 (= res!422423 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18861 lt!302859)))))

(declare-fun b!651491 () Bool)

(assert (=> b!651491 (= e!373848 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92109 (not res!422422)) b!651490))

(assert (= (and b!651490 res!422423) b!651491))

(declare-fun m!624675 () Bool)

(assert (=> d!92109 m!624675))

(assert (=> b!651491 m!624475))

(declare-fun m!624677 () Bool)

(assert (=> b!651491 m!624677))

(assert (=> b!651332 d!92109))

(declare-fun bm!33761 () Bool)

(declare-fun call!33764 () Bool)

(declare-fun c!74912 () Bool)

(assert (=> bm!33761 (= call!33764 (arrayNoDuplicates!0 lt!302859 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74912 (Cons!12534 (select (arr!18497 lt!302859) #b00000000000000000000000000000000) Nil!12535) Nil!12535)))))

(declare-fun b!651525 () Bool)

(declare-fun e!373874 () Bool)

(assert (=> b!651525 (= e!373874 call!33764)))

(declare-fun d!92111 () Bool)

(declare-fun res!422435 () Bool)

(declare-fun e!373871 () Bool)

(assert (=> d!92111 (=> res!422435 e!373871)))

(assert (=> d!92111 (= res!422435 (bvsge #b00000000000000000000000000000000 (size!18861 lt!302859)))))

(assert (=> d!92111 (= (arrayNoDuplicates!0 lt!302859 #b00000000000000000000000000000000 Nil!12535) e!373871)))

(declare-fun b!651526 () Bool)

(declare-fun e!373872 () Bool)

(declare-fun contains!3178 (List!12538 (_ BitVec 64)) Bool)

(assert (=> b!651526 (= e!373872 (contains!3178 Nil!12535 (select (arr!18497 lt!302859) #b00000000000000000000000000000000)))))

(declare-fun b!651527 () Bool)

(declare-fun e!373873 () Bool)

(assert (=> b!651527 (= e!373873 e!373874)))

(assert (=> b!651527 (= c!74912 (validKeyInArray!0 (select (arr!18497 lt!302859) #b00000000000000000000000000000000)))))

(declare-fun b!651528 () Bool)

(assert (=> b!651528 (= e!373874 call!33764)))

(declare-fun b!651529 () Bool)

(assert (=> b!651529 (= e!373871 e!373873)))

(declare-fun res!422436 () Bool)

(assert (=> b!651529 (=> (not res!422436) (not e!373873))))

(assert (=> b!651529 (= res!422436 (not e!373872))))

(declare-fun res!422437 () Bool)

(assert (=> b!651529 (=> (not res!422437) (not e!373872))))

(assert (=> b!651529 (= res!422437 (validKeyInArray!0 (select (arr!18497 lt!302859) #b00000000000000000000000000000000)))))

(assert (= (and d!92111 (not res!422435)) b!651529))

(assert (= (and b!651529 res!422437) b!651526))

(assert (= (and b!651529 res!422436) b!651527))

(assert (= (and b!651527 c!74912) b!651525))

(assert (= (and b!651527 (not c!74912)) b!651528))

(assert (= (or b!651525 b!651528) bm!33761))

(declare-fun m!624707 () Bool)

(assert (=> bm!33761 m!624707))

(declare-fun m!624709 () Bool)

(assert (=> bm!33761 m!624709))

(assert (=> b!651526 m!624707))

(assert (=> b!651526 m!624707))

(declare-fun m!624711 () Bool)

(assert (=> b!651526 m!624711))

(assert (=> b!651527 m!624707))

(assert (=> b!651527 m!624707))

(declare-fun m!624713 () Bool)

(assert (=> b!651527 m!624713))

(assert (=> b!651529 m!624707))

(assert (=> b!651529 m!624707))

(assert (=> b!651529 m!624713))

(assert (=> b!651332 d!92111))

(declare-fun d!92125 () Bool)

(declare-fun res!422440 () Bool)

(declare-fun e!373877 () Bool)

(assert (=> d!92125 (=> res!422440 e!373877)))

(assert (=> d!92125 (= res!422440 (= (select (arr!18497 lt!302859) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18497 a!2986) j!136)))))

(assert (=> d!92125 (= (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!373877)))

(declare-fun b!651532 () Bool)

(declare-fun e!373878 () Bool)

(assert (=> b!651532 (= e!373877 e!373878)))

(declare-fun res!422441 () Bool)

(assert (=> b!651532 (=> (not res!422441) (not e!373878))))

(assert (=> b!651532 (= res!422441 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18861 lt!302859)))))

(declare-fun b!651533 () Bool)

(assert (=> b!651533 (= e!373878 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92125 (not res!422440)) b!651532))

(assert (= (and b!651532 res!422441) b!651533))

(declare-fun m!624719 () Bool)

(assert (=> d!92125 m!624719))

(assert (=> b!651533 m!624475))

(declare-fun m!624721 () Bool)

(assert (=> b!651533 m!624721))

(assert (=> b!651332 d!92125))

(declare-fun d!92131 () Bool)

(assert (=> d!92131 (arrayNoDuplicates!0 lt!302859 index!984 Nil!12535)))

(declare-fun lt!302944 () Unit!22248)

(declare-fun choose!39 (array!38585 (_ BitVec 32) (_ BitVec 32)) Unit!22248)

(assert (=> d!92131 (= lt!302944 (choose!39 lt!302859 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92131 (bvslt (size!18861 lt!302859) #b01111111111111111111111111111111)))

(assert (=> d!92131 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302859 #b00000000000000000000000000000000 index!984) lt!302944)))

(declare-fun bs!19429 () Bool)

(assert (= bs!19429 d!92131))

(assert (=> bs!19429 m!624491))

(declare-fun m!624731 () Bool)

(assert (=> bs!19429 m!624731))

(assert (=> b!651332 d!92131))

(declare-fun d!92137 () Bool)

(assert (=> d!92137 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302947 () Unit!22248)

(declare-fun choose!114 (array!38585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22248)

(assert (=> d!92137 (= lt!302947 (choose!114 lt!302859 (select (arr!18497 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92137 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92137 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302859 (select (arr!18497 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!302947)))

(declare-fun bs!19430 () Bool)

(assert (= bs!19430 d!92137))

(assert (=> bs!19430 m!624475))

(assert (=> bs!19430 m!624495))

(assert (=> bs!19430 m!624475))

(declare-fun m!624733 () Bool)

(assert (=> bs!19430 m!624733))

(assert (=> b!651332 d!92137))

(declare-fun d!92139 () Bool)

(declare-fun e!373893 () Bool)

(assert (=> d!92139 e!373893))

(declare-fun res!422453 () Bool)

(assert (=> d!92139 (=> (not res!422453) (not e!373893))))

(assert (=> d!92139 (= res!422453 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18861 a!2986))))))

(declare-fun lt!302956 () Unit!22248)

(declare-fun choose!41 (array!38585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12538) Unit!22248)

(assert (=> d!92139 (= lt!302956 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12535))))

(assert (=> d!92139 (bvslt (size!18861 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92139 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12535) lt!302956)))

(declare-fun b!651551 () Bool)

(assert (=> b!651551 (= e!373893 (arrayNoDuplicates!0 (array!38586 (store (arr!18497 a!2986) i!1108 k!1786) (size!18861 a!2986)) #b00000000000000000000000000000000 Nil!12535))))

(assert (= (and d!92139 res!422453) b!651551))

(declare-fun m!624735 () Bool)

(assert (=> d!92139 m!624735))

(assert (=> b!651551 m!624499))

(declare-fun m!624737 () Bool)

(assert (=> b!651551 m!624737))

(assert (=> b!651332 d!92139))

(declare-fun bm!33765 () Bool)

(declare-fun call!33768 () Bool)

(declare-fun c!74916 () Bool)

(assert (=> bm!33765 (= call!33768 (arrayNoDuplicates!0 lt!302859 (bvadd index!984 #b00000000000000000000000000000001) (ite c!74916 (Cons!12534 (select (arr!18497 lt!302859) index!984) Nil!12535) Nil!12535)))))

(declare-fun b!651552 () Bool)

(declare-fun e!373897 () Bool)

(assert (=> b!651552 (= e!373897 call!33768)))

(declare-fun d!92141 () Bool)

(declare-fun res!422454 () Bool)

(declare-fun e!373894 () Bool)

(assert (=> d!92141 (=> res!422454 e!373894)))

(assert (=> d!92141 (= res!422454 (bvsge index!984 (size!18861 lt!302859)))))

(assert (=> d!92141 (= (arrayNoDuplicates!0 lt!302859 index!984 Nil!12535) e!373894)))

(declare-fun b!651553 () Bool)

(declare-fun e!373895 () Bool)

(assert (=> b!651553 (= e!373895 (contains!3178 Nil!12535 (select (arr!18497 lt!302859) index!984)))))

(declare-fun b!651554 () Bool)

(declare-fun e!373896 () Bool)

(assert (=> b!651554 (= e!373896 e!373897)))

(assert (=> b!651554 (= c!74916 (validKeyInArray!0 (select (arr!18497 lt!302859) index!984)))))

(declare-fun b!651555 () Bool)

(assert (=> b!651555 (= e!373897 call!33768)))

(declare-fun b!651556 () Bool)

(assert (=> b!651556 (= e!373894 e!373896)))

(declare-fun res!422455 () Bool)

(assert (=> b!651556 (=> (not res!422455) (not e!373896))))

(assert (=> b!651556 (= res!422455 (not e!373895))))

(declare-fun res!422456 () Bool)

(assert (=> b!651556 (=> (not res!422456) (not e!373895))))

(assert (=> b!651556 (= res!422456 (validKeyInArray!0 (select (arr!18497 lt!302859) index!984)))))

(assert (= (and d!92141 (not res!422454)) b!651556))

(assert (= (and b!651556 res!422456) b!651553))

(assert (= (and b!651556 res!422455) b!651554))

(assert (= (and b!651554 c!74916) b!651552))

(assert (= (and b!651554 (not c!74916)) b!651555))

(assert (= (or b!651552 b!651555) bm!33765))

(assert (=> bm!33765 m!624671))

(declare-fun m!624739 () Bool)

(assert (=> bm!33765 m!624739))

(assert (=> b!651553 m!624671))

(assert (=> b!651553 m!624671))

(declare-fun m!624741 () Bool)

(assert (=> b!651553 m!624741))

(assert (=> b!651554 m!624671))

(assert (=> b!651554 m!624671))

(declare-fun m!624743 () Bool)

(assert (=> b!651554 m!624743))

(assert (=> b!651556 m!624671))

(assert (=> b!651556 m!624671))

(assert (=> b!651556 m!624743))

(assert (=> b!651332 d!92141))

(declare-fun d!92147 () Bool)

(assert (=> d!92147 (= (validKeyInArray!0 (select (arr!18497 a!2986) j!136)) (and (not (= (select (arr!18497 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18497 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!651342 d!92147))

(declare-fun bm!33766 () Bool)

(declare-fun call!33769 () Bool)

(declare-fun c!74917 () Bool)

(assert (=> bm!33766 (= call!33769 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74917 (Cons!12534 (select (arr!18497 a!2986) #b00000000000000000000000000000000) Nil!12535) Nil!12535)))))

(declare-fun b!651557 () Bool)

(declare-fun e!373901 () Bool)

(assert (=> b!651557 (= e!373901 call!33769)))

(declare-fun d!92149 () Bool)

(declare-fun res!422457 () Bool)

(declare-fun e!373898 () Bool)

(assert (=> d!92149 (=> res!422457 e!373898)))

(assert (=> d!92149 (= res!422457 (bvsge #b00000000000000000000000000000000 (size!18861 a!2986)))))

(assert (=> d!92149 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12535) e!373898)))

(declare-fun b!651558 () Bool)

(declare-fun e!373899 () Bool)

(assert (=> b!651558 (= e!373899 (contains!3178 Nil!12535 (select (arr!18497 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651559 () Bool)

(declare-fun e!373900 () Bool)

(assert (=> b!651559 (= e!373900 e!373901)))

(assert (=> b!651559 (= c!74917 (validKeyInArray!0 (select (arr!18497 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651560 () Bool)

(assert (=> b!651560 (= e!373901 call!33769)))

(declare-fun b!651561 () Bool)

(assert (=> b!651561 (= e!373898 e!373900)))

(declare-fun res!422458 () Bool)

(assert (=> b!651561 (=> (not res!422458) (not e!373900))))

(assert (=> b!651561 (= res!422458 (not e!373899))))

(declare-fun res!422459 () Bool)

(assert (=> b!651561 (=> (not res!422459) (not e!373899))))

(assert (=> b!651561 (= res!422459 (validKeyInArray!0 (select (arr!18497 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92149 (not res!422457)) b!651561))

(assert (= (and b!651561 res!422459) b!651558))

(assert (= (and b!651561 res!422458) b!651559))

(assert (= (and b!651559 c!74917) b!651557))

(assert (= (and b!651559 (not c!74917)) b!651560))

(assert (= (or b!651557 b!651560) bm!33766))

(declare-fun m!624745 () Bool)

(assert (=> bm!33766 m!624745))

(declare-fun m!624747 () Bool)

(assert (=> bm!33766 m!624747))

(assert (=> b!651558 m!624745))

(assert (=> b!651558 m!624745))

(declare-fun m!624749 () Bool)

(assert (=> b!651558 m!624749))

(assert (=> b!651559 m!624745))

(assert (=> b!651559 m!624745))

(declare-fun m!624751 () Bool)

(assert (=> b!651559 m!624751))

(assert (=> b!651561 m!624745))

(assert (=> b!651561 m!624745))

(assert (=> b!651561 m!624751))

(assert (=> b!651344 d!92149))

(declare-fun d!92151 () Bool)

(declare-fun res!422462 () Bool)

(declare-fun e!373905 () Bool)

(assert (=> d!92151 (=> res!422462 e!373905)))

(assert (=> d!92151 (= res!422462 (= (select (arr!18497 lt!302859) index!984) (select (arr!18497 a!2986) j!136)))))

(assert (=> d!92151 (= (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) index!984) e!373905)))

(declare-fun b!651566 () Bool)

(declare-fun e!373906 () Bool)

(assert (=> b!651566 (= e!373905 e!373906)))

(declare-fun res!422463 () Bool)

(assert (=> b!651566 (=> (not res!422463) (not e!373906))))

(assert (=> b!651566 (= res!422463 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18861 lt!302859)))))

(declare-fun b!651567 () Bool)

(assert (=> b!651567 (= e!373906 (arrayContainsKey!0 lt!302859 (select (arr!18497 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92151 (not res!422462)) b!651566))

(assert (= (and b!651566 res!422463) b!651567))

(assert (=> d!92151 m!624671))

(assert (=> b!651567 m!624475))

(declare-fun m!624755 () Bool)

(assert (=> b!651567 m!624755))

(assert (=> b!651334 d!92151))

(declare-fun b!651602 () Bool)

(declare-fun e!373926 () SeekEntryResult!6937)

(declare-fun lt!302982 () SeekEntryResult!6937)

(assert (=> b!651602 (= e!373926 (seekKeyOrZeroReturnVacant!0 (x!58879 lt!302982) (index!30100 lt!302982) (index!30100 lt!302982) k!1786 a!2986 mask!3053))))

(declare-fun b!651603 () Bool)

(declare-fun e!373925 () SeekEntryResult!6937)

(assert (=> b!651603 (= e!373925 (Found!6937 (index!30100 lt!302982)))))

(declare-fun d!92153 () Bool)

(declare-fun lt!302981 () SeekEntryResult!6937)

(assert (=> d!92153 (and (or (is-Undefined!6937 lt!302981) (not (is-Found!6937 lt!302981)) (and (bvsge (index!30099 lt!302981) #b00000000000000000000000000000000) (bvslt (index!30099 lt!302981) (size!18861 a!2986)))) (or (is-Undefined!6937 lt!302981) (is-Found!6937 lt!302981) (not (is-MissingZero!6937 lt!302981)) (and (bvsge (index!30098 lt!302981) #b00000000000000000000000000000000) (bvslt (index!30098 lt!302981) (size!18861 a!2986)))) (or (is-Undefined!6937 lt!302981) (is-Found!6937 lt!302981) (is-MissingZero!6937 lt!302981) (not (is-MissingVacant!6937 lt!302981)) (and (bvsge (index!30101 lt!302981) #b00000000000000000000000000000000) (bvslt (index!30101 lt!302981) (size!18861 a!2986)))) (or (is-Undefined!6937 lt!302981) (ite (is-Found!6937 lt!302981) (= (select (arr!18497 a!2986) (index!30099 lt!302981)) k!1786) (ite (is-MissingZero!6937 lt!302981) (= (select (arr!18497 a!2986) (index!30098 lt!302981)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6937 lt!302981) (= (select (arr!18497 a!2986) (index!30101 lt!302981)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!373924 () SeekEntryResult!6937)

(assert (=> d!92153 (= lt!302981 e!373924)))

(declare-fun c!74938 () Bool)

(assert (=> d!92153 (= c!74938 (and (is-Intermediate!6937 lt!302982) (undefined!7749 lt!302982)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38585 (_ BitVec 32)) SeekEntryResult!6937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92153 (= lt!302982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!92153 (validMask!0 mask!3053)))

(assert (=> d!92153 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!302981)))

(declare-fun b!651604 () Bool)

(assert (=> b!651604 (= e!373924 Undefined!6937)))

(declare-fun b!651605 () Bool)

(assert (=> b!651605 (= e!373926 (MissingZero!6937 (index!30100 lt!302982)))))

(declare-fun b!651606 () Bool)

(declare-fun c!74936 () Bool)

(declare-fun lt!302983 () (_ BitVec 64))

(assert (=> b!651606 (= c!74936 (= lt!302983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651606 (= e!373925 e!373926)))

(declare-fun b!651607 () Bool)

(assert (=> b!651607 (= e!373924 e!373925)))

(assert (=> b!651607 (= lt!302983 (select (arr!18497 a!2986) (index!30100 lt!302982)))))

(declare-fun c!74937 () Bool)

(assert (=> b!651607 (= c!74937 (= lt!302983 k!1786))))

(assert (= (and d!92153 c!74938) b!651604))

(assert (= (and d!92153 (not c!74938)) b!651607))

(assert (= (and b!651607 c!74937) b!651603))

(assert (= (and b!651607 (not c!74937)) b!651606))

(assert (= (and b!651606 c!74936) b!651605))

(assert (= (and b!651606 (not c!74936)) b!651602))

(declare-fun m!624771 () Bool)

(assert (=> b!651602 m!624771))

(declare-fun m!624773 () Bool)

(assert (=> d!92153 m!624773))

(declare-fun m!624775 () Bool)

(assert (=> d!92153 m!624775))

(declare-fun m!624777 () Bool)

(assert (=> d!92153 m!624777))

(assert (=> d!92153 m!624471))

(assert (=> d!92153 m!624773))

(declare-fun m!624779 () Bool)

(assert (=> d!92153 m!624779))

(declare-fun m!624781 () Bool)

(assert (=> d!92153 m!624781))

(declare-fun m!624783 () Bool)

(assert (=> b!651607 m!624783))

(assert (=> b!651347 d!92153))

(declare-fun d!92161 () Bool)

(assert (=> d!92161 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18861 lt!302859)) (not (= (select (arr!18497 lt!302859) j!136) (select (arr!18497 a!2986) j!136))))))

(declare-fun lt!302986 () Unit!22248)

(declare-fun choose!21 (array!38585 (_ BitVec 64) (_ BitVec 32) List!12538) Unit!22248)

(assert (=> d!92161 (= lt!302986 (choose!21 lt!302859 (select (arr!18497 a!2986) j!136) j!136 Nil!12535))))

(assert (=> d!92161 (bvslt (size!18861 lt!302859) #b01111111111111111111111111111111)))

(assert (=> d!92161 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302859 (select (arr!18497 a!2986) j!136) j!136 Nil!12535) lt!302986)))

(declare-fun bs!19432 () Bool)

(assert (= bs!19432 d!92161))

(assert (=> bs!19432 m!624675))

(assert (=> bs!19432 m!624475))

(declare-fun m!624785 () Bool)

(assert (=> bs!19432 m!624785))

(assert (=> b!651336 d!92161))

(assert (=> b!651336 d!92111))

(declare-fun bm!33768 () Bool)

(declare-fun c!74943 () Bool)

(declare-fun call!33771 () Bool)

(assert (=> bm!33768 (= call!33771 (arrayNoDuplicates!0 lt!302859 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74943 (Cons!12534 (select (arr!18497 lt!302859) j!136) Nil!12535) Nil!12535)))))

(declare-fun b!651616 () Bool)

(declare-fun e!373934 () Bool)

(assert (=> b!651616 (= e!373934 call!33771)))

(declare-fun d!92163 () Bool)

(declare-fun res!422464 () Bool)

(declare-fun e!373931 () Bool)

(assert (=> d!92163 (=> res!422464 e!373931)))

(assert (=> d!92163 (= res!422464 (bvsge j!136 (size!18861 lt!302859)))))

(assert (=> d!92163 (= (arrayNoDuplicates!0 lt!302859 j!136 Nil!12535) e!373931)))

(declare-fun b!651617 () Bool)

(declare-fun e!373932 () Bool)

(assert (=> b!651617 (= e!373932 (contains!3178 Nil!12535 (select (arr!18497 lt!302859) j!136)))))

(declare-fun b!651618 () Bool)

(declare-fun e!373933 () Bool)

(assert (=> b!651618 (= e!373933 e!373934)))

(assert (=> b!651618 (= c!74943 (validKeyInArray!0 (select (arr!18497 lt!302859) j!136)))))

(declare-fun b!651619 () Bool)

(assert (=> b!651619 (= e!373934 call!33771)))

(declare-fun b!651620 () Bool)

(assert (=> b!651620 (= e!373931 e!373933)))

