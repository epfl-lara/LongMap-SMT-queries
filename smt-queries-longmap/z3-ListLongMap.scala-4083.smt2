; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55998 () Bool)

(assert start!55998)

(declare-fun b!615288 () Bool)

(declare-fun res!396326 () Bool)

(declare-fun e!352791 () Bool)

(assert (=> b!615288 (=> (not res!396326) (not e!352791))))

(declare-datatypes ((array!37468 0))(
  ( (array!37469 (arr!17980 (Array (_ BitVec 32) (_ BitVec 64))) (size!18344 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37468)

(declare-datatypes ((List!12021 0))(
  ( (Nil!12018) (Cons!12017 (h!13062 (_ BitVec 64)) (t!18249 List!12021)) )
))
(declare-fun arrayNoDuplicates!0 (array!37468 (_ BitVec 32) List!12021) Bool)

(assert (=> b!615288 (= res!396326 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12018))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!282563 () array!37468)

(declare-fun e!352786 () Bool)

(declare-fun b!615289 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615289 (= e!352786 (arrayContainsKey!0 lt!282563 (select (arr!17980 a!2986) j!136) index!984))))

(declare-fun b!615291 () Bool)

(declare-fun res!396319 () Bool)

(assert (=> b!615291 (=> (not res!396319) (not e!352791))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37468 (_ BitVec 32)) Bool)

(assert (=> b!615291 (= res!396319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615292 () Bool)

(declare-fun res!396323 () Bool)

(declare-fun e!352790 () Bool)

(assert (=> b!615292 (=> (not res!396323) (not e!352790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615292 (= res!396323 (validKeyInArray!0 (select (arr!17980 a!2986) j!136)))))

(declare-fun b!615293 () Bool)

(declare-fun res!396315 () Bool)

(assert (=> b!615293 (=> (not res!396315) (not e!352791))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!615293 (= res!396315 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17980 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615294 () Bool)

(declare-fun res!396324 () Bool)

(assert (=> b!615294 (= res!396324 (bvsge j!136 index!984))))

(declare-fun e!352785 () Bool)

(assert (=> b!615294 (=> res!396324 e!352785)))

(declare-fun e!352789 () Bool)

(assert (=> b!615294 (= e!352789 e!352785)))

(declare-fun b!615295 () Bool)

(declare-fun res!396328 () Bool)

(assert (=> b!615295 (=> (not res!396328) (not e!352790))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!615295 (= res!396328 (validKeyInArray!0 k0!1786))))

(declare-fun b!615296 () Bool)

(declare-datatypes ((Unit!19928 0))(
  ( (Unit!19929) )
))
(declare-fun e!352782 () Unit!19928)

(declare-fun Unit!19930 () Unit!19928)

(assert (=> b!615296 (= e!352782 Unit!19930)))

(assert (=> b!615296 false))

(declare-fun b!615297 () Bool)

(declare-fun res!396316 () Bool)

(assert (=> b!615297 (=> (not res!396316) (not e!352790))))

(assert (=> b!615297 (= res!396316 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615298 () Bool)

(declare-fun e!352784 () Unit!19928)

(declare-fun Unit!19931 () Unit!19928)

(assert (=> b!615298 (= e!352784 Unit!19931)))

(declare-fun b!615299 () Bool)

(declare-fun res!396325 () Bool)

(assert (=> b!615299 (=> (not res!396325) (not e!352790))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615299 (= res!396325 (and (= (size!18344 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18344 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18344 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615300 () Bool)

(declare-fun e!352787 () Unit!19928)

(declare-fun Unit!19932 () Unit!19928)

(assert (=> b!615300 (= e!352787 Unit!19932)))

(declare-fun res!396318 () Bool)

(assert (=> b!615300 (= res!396318 (= (select (store (arr!17980 a!2986) i!1108 k0!1786) index!984) (select (arr!17980 a!2986) j!136)))))

(assert (=> b!615300 (=> (not res!396318) (not e!352789))))

(assert (=> b!615300 e!352789))

(declare-fun c!69856 () Bool)

(assert (=> b!615300 (= c!69856 (bvslt j!136 index!984))))

(declare-fun lt!282574 () Unit!19928)

(assert (=> b!615300 (= lt!282574 e!352784)))

(declare-fun c!69857 () Bool)

(assert (=> b!615300 (= c!69857 (bvslt index!984 j!136))))

(declare-fun lt!282562 () Unit!19928)

(declare-fun e!352779 () Unit!19928)

(assert (=> b!615300 (= lt!282562 e!352779)))

(assert (=> b!615300 false))

(declare-fun b!615301 () Bool)

(declare-fun e!352781 () Bool)

(declare-fun e!352778 () Bool)

(assert (=> b!615301 (= e!352781 e!352778)))

(declare-fun res!396321 () Bool)

(assert (=> b!615301 (=> (not res!396321) (not e!352778))))

(declare-datatypes ((SeekEntryResult!6420 0))(
  ( (MissingZero!6420 (index!27964 (_ BitVec 32))) (Found!6420 (index!27965 (_ BitVec 32))) (Intermediate!6420 (undefined!7232 Bool) (index!27966 (_ BitVec 32)) (x!56764 (_ BitVec 32))) (Undefined!6420) (MissingVacant!6420 (index!27967 (_ BitVec 32))) )
))
(declare-fun lt!282575 () SeekEntryResult!6420)

(assert (=> b!615301 (= res!396321 (and (= lt!282575 (Found!6420 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17980 a!2986) index!984) (select (arr!17980 a!2986) j!136))) (not (= (select (arr!17980 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37468 (_ BitVec 32)) SeekEntryResult!6420)

(assert (=> b!615301 (= lt!282575 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17980 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615302 () Bool)

(assert (=> b!615302 (= e!352790 e!352791)))

(declare-fun res!396320 () Bool)

(assert (=> b!615302 (=> (not res!396320) (not e!352791))))

(declare-fun lt!282571 () SeekEntryResult!6420)

(assert (=> b!615302 (= res!396320 (or (= lt!282571 (MissingZero!6420 i!1108)) (= lt!282571 (MissingVacant!6420 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37468 (_ BitVec 32)) SeekEntryResult!6420)

(assert (=> b!615302 (= lt!282571 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615303 () Bool)

(declare-fun Unit!19933 () Unit!19928)

(assert (=> b!615303 (= e!352779 Unit!19933)))

(declare-fun b!615304 () Bool)

(assert (=> b!615304 false))

(declare-fun lt!282576 () Unit!19928)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37468 (_ BitVec 64) (_ BitVec 32) List!12021) Unit!19928)

(assert (=> b!615304 (= lt!282576 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282563 (select (arr!17980 a!2986) j!136) j!136 Nil!12018))))

(assert (=> b!615304 (arrayNoDuplicates!0 lt!282563 j!136 Nil!12018)))

(declare-fun lt!282577 () Unit!19928)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37468 (_ BitVec 32) (_ BitVec 32)) Unit!19928)

(assert (=> b!615304 (= lt!282577 (lemmaNoDuplicateFromThenFromBigger!0 lt!282563 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615304 (arrayNoDuplicates!0 lt!282563 #b00000000000000000000000000000000 Nil!12018)))

(declare-fun lt!282561 () Unit!19928)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12021) Unit!19928)

(assert (=> b!615304 (= lt!282561 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12018))))

(assert (=> b!615304 (arrayContainsKey!0 lt!282563 (select (arr!17980 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282565 () Unit!19928)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19928)

(assert (=> b!615304 (= lt!282565 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282563 (select (arr!17980 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19934 () Unit!19928)

(assert (=> b!615304 (= e!352784 Unit!19934)))

(declare-fun b!615305 () Bool)

(assert (=> b!615305 (= e!352778 (not true))))

(declare-fun lt!282558 () Unit!19928)

(assert (=> b!615305 (= lt!282558 e!352787)))

(declare-fun c!69854 () Bool)

(declare-fun lt!282572 () SeekEntryResult!6420)

(assert (=> b!615305 (= c!69854 (= lt!282572 (Found!6420 index!984)))))

(declare-fun lt!282569 () Unit!19928)

(assert (=> b!615305 (= lt!282569 e!352782)))

(declare-fun c!69855 () Bool)

(assert (=> b!615305 (= c!69855 (= lt!282572 Undefined!6420))))

(declare-fun lt!282568 () (_ BitVec 64))

(assert (=> b!615305 (= lt!282572 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282568 lt!282563 mask!3053))))

(declare-fun e!352788 () Bool)

(assert (=> b!615305 e!352788))

(declare-fun res!396314 () Bool)

(assert (=> b!615305 (=> (not res!396314) (not e!352788))))

(declare-fun lt!282573 () (_ BitVec 32))

(declare-fun lt!282570 () SeekEntryResult!6420)

(assert (=> b!615305 (= res!396314 (= lt!282570 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282573 vacantSpotIndex!68 lt!282568 lt!282563 mask!3053)))))

(assert (=> b!615305 (= lt!282570 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282573 vacantSpotIndex!68 (select (arr!17980 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615305 (= lt!282568 (select (store (arr!17980 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282567 () Unit!19928)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19928)

(assert (=> b!615305 (= lt!282567 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282573 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615305 (= lt!282573 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615306 () Bool)

(declare-fun res!396327 () Bool)

(assert (=> b!615306 (= res!396327 (arrayContainsKey!0 lt!282563 (select (arr!17980 a!2986) j!136) j!136))))

(declare-fun e!352783 () Bool)

(assert (=> b!615306 (=> (not res!396327) (not e!352783))))

(assert (=> b!615306 (= e!352785 e!352783)))

(declare-fun res!396329 () Bool)

(assert (=> start!55998 (=> (not res!396329) (not e!352790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55998 (= res!396329 (validMask!0 mask!3053))))

(assert (=> start!55998 e!352790))

(assert (=> start!55998 true))

(declare-fun array_inv!13776 (array!37468) Bool)

(assert (=> start!55998 (array_inv!13776 a!2986)))

(declare-fun b!615290 () Bool)

(declare-fun Unit!19935 () Unit!19928)

(assert (=> b!615290 (= e!352782 Unit!19935)))

(declare-fun b!615307 () Bool)

(assert (=> b!615307 (= e!352783 (arrayContainsKey!0 lt!282563 (select (arr!17980 a!2986) j!136) index!984))))

(declare-fun b!615308 () Bool)

(assert (=> b!615308 (= e!352788 (= lt!282575 lt!282570))))

(declare-fun b!615309 () Bool)

(assert (=> b!615309 false))

(declare-fun lt!282559 () Unit!19928)

(assert (=> b!615309 (= lt!282559 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282563 (select (arr!17980 a!2986) j!136) index!984 Nil!12018))))

(assert (=> b!615309 (arrayNoDuplicates!0 lt!282563 index!984 Nil!12018)))

(declare-fun lt!282560 () Unit!19928)

(assert (=> b!615309 (= lt!282560 (lemmaNoDuplicateFromThenFromBigger!0 lt!282563 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615309 (arrayNoDuplicates!0 lt!282563 #b00000000000000000000000000000000 Nil!12018)))

(declare-fun lt!282564 () Unit!19928)

(assert (=> b!615309 (= lt!282564 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12018))))

(assert (=> b!615309 (arrayContainsKey!0 lt!282563 (select (arr!17980 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282566 () Unit!19928)

(assert (=> b!615309 (= lt!282566 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282563 (select (arr!17980 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615309 e!352786))

(declare-fun res!396322 () Bool)

(assert (=> b!615309 (=> (not res!396322) (not e!352786))))

(assert (=> b!615309 (= res!396322 (arrayContainsKey!0 lt!282563 (select (arr!17980 a!2986) j!136) j!136))))

(declare-fun Unit!19936 () Unit!19928)

(assert (=> b!615309 (= e!352779 Unit!19936)))

(declare-fun b!615310 () Bool)

(declare-fun Unit!19937 () Unit!19928)

(assert (=> b!615310 (= e!352787 Unit!19937)))

(declare-fun b!615311 () Bool)

(assert (=> b!615311 (= e!352791 e!352781)))

(declare-fun res!396317 () Bool)

(assert (=> b!615311 (=> (not res!396317) (not e!352781))))

(assert (=> b!615311 (= res!396317 (= (select (store (arr!17980 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615311 (= lt!282563 (array!37469 (store (arr!17980 a!2986) i!1108 k0!1786) (size!18344 a!2986)))))

(assert (= (and start!55998 res!396329) b!615299))

(assert (= (and b!615299 res!396325) b!615292))

(assert (= (and b!615292 res!396323) b!615295))

(assert (= (and b!615295 res!396328) b!615297))

(assert (= (and b!615297 res!396316) b!615302))

(assert (= (and b!615302 res!396320) b!615291))

(assert (= (and b!615291 res!396319) b!615288))

(assert (= (and b!615288 res!396326) b!615293))

(assert (= (and b!615293 res!396315) b!615311))

(assert (= (and b!615311 res!396317) b!615301))

(assert (= (and b!615301 res!396321) b!615305))

(assert (= (and b!615305 res!396314) b!615308))

(assert (= (and b!615305 c!69855) b!615296))

(assert (= (and b!615305 (not c!69855)) b!615290))

(assert (= (and b!615305 c!69854) b!615300))

(assert (= (and b!615305 (not c!69854)) b!615310))

(assert (= (and b!615300 res!396318) b!615294))

(assert (= (and b!615294 (not res!396324)) b!615306))

(assert (= (and b!615306 res!396327) b!615307))

(assert (= (and b!615300 c!69856) b!615304))

(assert (= (and b!615300 (not c!69856)) b!615298))

(assert (= (and b!615300 c!69857) b!615309))

(assert (= (and b!615300 (not c!69857)) b!615303))

(assert (= (and b!615309 res!396322) b!615289))

(declare-fun m!591495 () Bool)

(assert (=> b!615291 m!591495))

(declare-fun m!591497 () Bool)

(assert (=> b!615302 m!591497))

(declare-fun m!591499 () Bool)

(assert (=> b!615288 m!591499))

(declare-fun m!591501 () Bool)

(assert (=> b!615295 m!591501))

(declare-fun m!591503 () Bool)

(assert (=> b!615301 m!591503))

(declare-fun m!591505 () Bool)

(assert (=> b!615301 m!591505))

(assert (=> b!615301 m!591505))

(declare-fun m!591507 () Bool)

(assert (=> b!615301 m!591507))

(assert (=> b!615309 m!591505))

(assert (=> b!615309 m!591505))

(declare-fun m!591509 () Bool)

(assert (=> b!615309 m!591509))

(assert (=> b!615309 m!591505))

(declare-fun m!591511 () Bool)

(assert (=> b!615309 m!591511))

(declare-fun m!591513 () Bool)

(assert (=> b!615309 m!591513))

(assert (=> b!615309 m!591505))

(declare-fun m!591515 () Bool)

(assert (=> b!615309 m!591515))

(assert (=> b!615309 m!591505))

(declare-fun m!591517 () Bool)

(assert (=> b!615309 m!591517))

(declare-fun m!591519 () Bool)

(assert (=> b!615309 m!591519))

(declare-fun m!591521 () Bool)

(assert (=> b!615309 m!591521))

(declare-fun m!591523 () Bool)

(assert (=> b!615309 m!591523))

(declare-fun m!591525 () Bool)

(assert (=> b!615311 m!591525))

(declare-fun m!591527 () Bool)

(assert (=> b!615311 m!591527))

(declare-fun m!591529 () Bool)

(assert (=> b!615305 m!591529))

(declare-fun m!591531 () Bool)

(assert (=> b!615305 m!591531))

(assert (=> b!615305 m!591505))

(declare-fun m!591533 () Bool)

(assert (=> b!615305 m!591533))

(declare-fun m!591535 () Bool)

(assert (=> b!615305 m!591535))

(assert (=> b!615305 m!591505))

(declare-fun m!591537 () Bool)

(assert (=> b!615305 m!591537))

(declare-fun m!591539 () Bool)

(assert (=> b!615305 m!591539))

(assert (=> b!615305 m!591525))

(declare-fun m!591541 () Bool)

(assert (=> b!615297 m!591541))

(declare-fun m!591543 () Bool)

(assert (=> b!615293 m!591543))

(assert (=> b!615292 m!591505))

(assert (=> b!615292 m!591505))

(declare-fun m!591545 () Bool)

(assert (=> b!615292 m!591545))

(declare-fun m!591547 () Bool)

(assert (=> b!615304 m!591547))

(assert (=> b!615304 m!591505))

(assert (=> b!615304 m!591505))

(declare-fun m!591549 () Bool)

(assert (=> b!615304 m!591549))

(assert (=> b!615304 m!591521))

(declare-fun m!591551 () Bool)

(assert (=> b!615304 m!591551))

(assert (=> b!615304 m!591519))

(assert (=> b!615304 m!591505))

(declare-fun m!591553 () Bool)

(assert (=> b!615304 m!591553))

(assert (=> b!615304 m!591505))

(declare-fun m!591555 () Bool)

(assert (=> b!615304 m!591555))

(assert (=> b!615300 m!591525))

(declare-fun m!591557 () Bool)

(assert (=> b!615300 m!591557))

(assert (=> b!615300 m!591505))

(assert (=> b!615289 m!591505))

(assert (=> b!615289 m!591505))

(declare-fun m!591559 () Bool)

(assert (=> b!615289 m!591559))

(declare-fun m!591561 () Bool)

(assert (=> start!55998 m!591561))

(declare-fun m!591563 () Bool)

(assert (=> start!55998 m!591563))

(assert (=> b!615307 m!591505))

(assert (=> b!615307 m!591505))

(assert (=> b!615307 m!591559))

(assert (=> b!615306 m!591505))

(assert (=> b!615306 m!591505))

(assert (=> b!615306 m!591511))

(check-sat (not b!615288) (not b!615291) (not b!615301) (not b!615292) (not start!55998) (not b!615309) (not b!615307) (not b!615305) (not b!615306) (not b!615295) (not b!615304) (not b!615302) (not b!615297) (not b!615289))
(check-sat)
