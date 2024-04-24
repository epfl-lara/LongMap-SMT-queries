; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58494 () Bool)

(assert start!58494)

(declare-fun b!645453 () Bool)

(declare-fun e!369899 () Bool)

(declare-fun e!369889 () Bool)

(assert (=> b!645453 (= e!369899 e!369889)))

(declare-fun res!418134 () Bool)

(assert (=> b!645453 (=> res!418134 e!369889)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299256 () (_ BitVec 64))

(declare-fun lt!299266 () (_ BitVec 64))

(declare-datatypes ((array!38448 0))(
  ( (array!38449 (arr!18433 (Array (_ BitVec 32) (_ BitVec 64))) (size!18797 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38448)

(assert (=> b!645453 (= res!418134 (or (not (= (select (arr!18433 a!2986) j!136) lt!299256)) (not (= (select (arr!18433 a!2986) j!136) lt!299266))))))

(declare-fun e!369898 () Bool)

(assert (=> b!645453 e!369898))

(declare-fun res!418130 () Bool)

(assert (=> b!645453 (=> (not res!418130) (not e!369898))))

(assert (=> b!645453 (= res!418130 (= lt!299266 (select (arr!18433 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645453 (= lt!299266 (select (store (arr!18433 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!369893 () Bool)

(declare-fun lt!299253 () array!38448)

(declare-fun b!645454 () Bool)

(declare-fun arrayContainsKey!0 (array!38448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645454 (= e!369893 (arrayContainsKey!0 lt!299253 (select (arr!18433 a!2986) j!136) index!984))))

(declare-fun b!645455 () Bool)

(declare-fun e!369896 () Bool)

(declare-datatypes ((SeekEntryResult!6829 0))(
  ( (MissingZero!6829 (index!29651 (_ BitVec 32))) (Found!6829 (index!29652 (_ BitVec 32))) (Intermediate!6829 (undefined!7641 Bool) (index!29653 (_ BitVec 32)) (x!58577 (_ BitVec 32))) (Undefined!6829) (MissingVacant!6829 (index!29654 (_ BitVec 32))) )
))
(declare-fun lt!299264 () SeekEntryResult!6829)

(declare-fun lt!299260 () SeekEntryResult!6829)

(assert (=> b!645455 (= e!369896 (= lt!299264 lt!299260))))

(declare-fun b!645456 () Bool)

(declare-fun e!369890 () Bool)

(assert (=> b!645456 (= e!369890 (not e!369899))))

(declare-fun res!418120 () Bool)

(assert (=> b!645456 (=> res!418120 e!369899)))

(declare-fun lt!299251 () SeekEntryResult!6829)

(assert (=> b!645456 (= res!418120 (not (= lt!299251 (Found!6829 index!984))))))

(declare-datatypes ((Unit!21873 0))(
  ( (Unit!21874) )
))
(declare-fun lt!299255 () Unit!21873)

(declare-fun e!369902 () Unit!21873)

(assert (=> b!645456 (= lt!299255 e!369902)))

(declare-fun c!74036 () Bool)

(assert (=> b!645456 (= c!74036 (= lt!299251 Undefined!6829))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38448 (_ BitVec 32)) SeekEntryResult!6829)

(assert (=> b!645456 (= lt!299251 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299256 lt!299253 mask!3053))))

(assert (=> b!645456 e!369896))

(declare-fun res!418138 () Bool)

(assert (=> b!645456 (=> (not res!418138) (not e!369896))))

(declare-fun lt!299258 () (_ BitVec 32))

(assert (=> b!645456 (= res!418138 (= lt!299260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299258 vacantSpotIndex!68 lt!299256 lt!299253 mask!3053)))))

(assert (=> b!645456 (= lt!299260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299258 vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645456 (= lt!299256 (select (store (arr!18433 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299257 () Unit!21873)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38448 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21873)

(assert (=> b!645456 (= lt!299257 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299258 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645456 (= lt!299258 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!645457 () Bool)

(declare-fun res!418123 () Bool)

(declare-fun e!369901 () Bool)

(assert (=> b!645457 (=> (not res!418123) (not e!369901))))

(declare-datatypes ((List!12381 0))(
  ( (Nil!12378) (Cons!12377 (h!13425 (_ BitVec 64)) (t!18601 List!12381)) )
))
(declare-fun arrayNoDuplicates!0 (array!38448 (_ BitVec 32) List!12381) Bool)

(assert (=> b!645457 (= res!418123 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12378))))

(declare-fun res!418128 () Bool)

(declare-fun e!369894 () Bool)

(assert (=> start!58494 (=> (not res!418128) (not e!369894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58494 (= res!418128 (validMask!0 mask!3053))))

(assert (=> start!58494 e!369894))

(assert (=> start!58494 true))

(declare-fun array_inv!14292 (array!38448) Bool)

(assert (=> start!58494 (array_inv!14292 a!2986)))

(declare-fun b!645458 () Bool)

(declare-fun e!369903 () Unit!21873)

(declare-fun Unit!21875 () Unit!21873)

(assert (=> b!645458 (= e!369903 Unit!21875)))

(declare-fun b!645459 () Bool)

(declare-fun e!369891 () Bool)

(assert (=> b!645459 (= e!369891 true)))

(assert (=> b!645459 (arrayContainsKey!0 lt!299253 (select (arr!18433 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299262 () Unit!21873)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38448 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21873)

(assert (=> b!645459 (= lt!299262 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299253 (select (arr!18433 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645459 e!369893))

(declare-fun res!418135 () Bool)

(assert (=> b!645459 (=> (not res!418135) (not e!369893))))

(assert (=> b!645459 (= res!418135 (arrayContainsKey!0 lt!299253 (select (arr!18433 a!2986) j!136) j!136))))

(declare-fun b!645460 () Bool)

(declare-fun res!418121 () Bool)

(assert (=> b!645460 (=> (not res!418121) (not e!369894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645460 (= res!418121 (validKeyInArray!0 (select (arr!18433 a!2986) j!136)))))

(declare-fun b!645461 () Bool)

(declare-fun e!369892 () Bool)

(assert (=> b!645461 (= e!369901 e!369892)))

(declare-fun res!418124 () Bool)

(assert (=> b!645461 (=> (not res!418124) (not e!369892))))

(assert (=> b!645461 (= res!418124 (= (select (store (arr!18433 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645461 (= lt!299253 (array!38449 (store (arr!18433 a!2986) i!1108 k0!1786) (size!18797 a!2986)))))

(declare-fun b!645462 () Bool)

(declare-fun Unit!21876 () Unit!21873)

(assert (=> b!645462 (= e!369902 Unit!21876)))

(assert (=> b!645462 false))

(declare-fun e!369897 () Bool)

(declare-fun b!645463 () Bool)

(assert (=> b!645463 (= e!369897 (arrayContainsKey!0 lt!299253 (select (arr!18433 a!2986) j!136) index!984))))

(declare-fun b!645464 () Bool)

(declare-fun e!369900 () Bool)

(assert (=> b!645464 (= e!369900 e!369897)))

(declare-fun res!418136 () Bool)

(assert (=> b!645464 (=> (not res!418136) (not e!369897))))

(assert (=> b!645464 (= res!418136 (arrayContainsKey!0 lt!299253 (select (arr!18433 a!2986) j!136) j!136))))

(declare-fun b!645465 () Bool)

(declare-fun Unit!21877 () Unit!21873)

(assert (=> b!645465 (= e!369903 Unit!21877)))

(declare-fun lt!299263 () Unit!21873)

(assert (=> b!645465 (= lt!299263 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299253 (select (arr!18433 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645465 (arrayContainsKey!0 lt!299253 (select (arr!18433 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299265 () Unit!21873)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38448 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12381) Unit!21873)

(assert (=> b!645465 (= lt!299265 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12378))))

(assert (=> b!645465 (arrayNoDuplicates!0 lt!299253 #b00000000000000000000000000000000 Nil!12378)))

(declare-fun lt!299254 () Unit!21873)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38448 (_ BitVec 32) (_ BitVec 32)) Unit!21873)

(assert (=> b!645465 (= lt!299254 (lemmaNoDuplicateFromThenFromBigger!0 lt!299253 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645465 (arrayNoDuplicates!0 lt!299253 j!136 Nil!12378)))

(declare-fun lt!299261 () Unit!21873)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38448 (_ BitVec 64) (_ BitVec 32) List!12381) Unit!21873)

(assert (=> b!645465 (= lt!299261 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299253 (select (arr!18433 a!2986) j!136) j!136 Nil!12378))))

(assert (=> b!645465 false))

(declare-fun b!645466 () Bool)

(declare-fun res!418127 () Bool)

(assert (=> b!645466 (=> (not res!418127) (not e!369901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38448 (_ BitVec 32)) Bool)

(assert (=> b!645466 (= res!418127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645467 () Bool)

(declare-fun res!418133 () Bool)

(assert (=> b!645467 (=> (not res!418133) (not e!369894))))

(assert (=> b!645467 (= res!418133 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645468 () Bool)

(assert (=> b!645468 (= e!369894 e!369901)))

(declare-fun res!418122 () Bool)

(assert (=> b!645468 (=> (not res!418122) (not e!369901))))

(declare-fun lt!299252 () SeekEntryResult!6829)

(assert (=> b!645468 (= res!418122 (or (= lt!299252 (MissingZero!6829 i!1108)) (= lt!299252 (MissingVacant!6829 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38448 (_ BitVec 32)) SeekEntryResult!6829)

(assert (=> b!645468 (= lt!299252 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645469 () Bool)

(assert (=> b!645469 (= e!369889 e!369891)))

(declare-fun res!418125 () Bool)

(assert (=> b!645469 (=> res!418125 e!369891)))

(assert (=> b!645469 (= res!418125 (bvsge index!984 j!136))))

(declare-fun lt!299259 () Unit!21873)

(assert (=> b!645469 (= lt!299259 e!369903)))

(declare-fun c!74035 () Bool)

(assert (=> b!645469 (= c!74035 (bvslt j!136 index!984))))

(declare-fun b!645470 () Bool)

(declare-fun res!418132 () Bool)

(assert (=> b!645470 (=> (not res!418132) (not e!369901))))

(assert (=> b!645470 (= res!418132 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18433 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645471 () Bool)

(declare-fun res!418131 () Bool)

(assert (=> b!645471 (=> (not res!418131) (not e!369894))))

(assert (=> b!645471 (= res!418131 (and (= (size!18797 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18797 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18797 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645472 () Bool)

(assert (=> b!645472 (= e!369892 e!369890)))

(declare-fun res!418126 () Bool)

(assert (=> b!645472 (=> (not res!418126) (not e!369890))))

(assert (=> b!645472 (= res!418126 (and (= lt!299264 (Found!6829 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18433 a!2986) index!984) (select (arr!18433 a!2986) j!136))) (not (= (select (arr!18433 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645472 (= lt!299264 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645473 () Bool)

(declare-fun res!418129 () Bool)

(assert (=> b!645473 (=> (not res!418129) (not e!369894))))

(assert (=> b!645473 (= res!418129 (validKeyInArray!0 k0!1786))))

(declare-fun b!645474 () Bool)

(assert (=> b!645474 (= e!369898 e!369900)))

(declare-fun res!418137 () Bool)

(assert (=> b!645474 (=> res!418137 e!369900)))

(assert (=> b!645474 (= res!418137 (or (not (= (select (arr!18433 a!2986) j!136) lt!299256)) (not (= (select (arr!18433 a!2986) j!136) lt!299266)) (bvsge j!136 index!984)))))

(declare-fun b!645475 () Bool)

(declare-fun Unit!21878 () Unit!21873)

(assert (=> b!645475 (= e!369902 Unit!21878)))

(assert (= (and start!58494 res!418128) b!645471))

(assert (= (and b!645471 res!418131) b!645460))

(assert (= (and b!645460 res!418121) b!645473))

(assert (= (and b!645473 res!418129) b!645467))

(assert (= (and b!645467 res!418133) b!645468))

(assert (= (and b!645468 res!418122) b!645466))

(assert (= (and b!645466 res!418127) b!645457))

(assert (= (and b!645457 res!418123) b!645470))

(assert (= (and b!645470 res!418132) b!645461))

(assert (= (and b!645461 res!418124) b!645472))

(assert (= (and b!645472 res!418126) b!645456))

(assert (= (and b!645456 res!418138) b!645455))

(assert (= (and b!645456 c!74036) b!645462))

(assert (= (and b!645456 (not c!74036)) b!645475))

(assert (= (and b!645456 (not res!418120)) b!645453))

(assert (= (and b!645453 res!418130) b!645474))

(assert (= (and b!645474 (not res!418137)) b!645464))

(assert (= (and b!645464 res!418136) b!645463))

(assert (= (and b!645453 (not res!418134)) b!645469))

(assert (= (and b!645469 c!74035) b!645465))

(assert (= (and b!645469 (not c!74035)) b!645458))

(assert (= (and b!645469 (not res!418125)) b!645459))

(assert (= (and b!645459 res!418135) b!645454))

(declare-fun m!619393 () Bool)

(assert (=> start!58494 m!619393))

(declare-fun m!619395 () Bool)

(assert (=> start!58494 m!619395))

(declare-fun m!619397 () Bool)

(assert (=> b!645467 m!619397))

(declare-fun m!619399 () Bool)

(assert (=> b!645459 m!619399))

(assert (=> b!645459 m!619399))

(declare-fun m!619401 () Bool)

(assert (=> b!645459 m!619401))

(assert (=> b!645459 m!619399))

(declare-fun m!619403 () Bool)

(assert (=> b!645459 m!619403))

(assert (=> b!645459 m!619399))

(declare-fun m!619405 () Bool)

(assert (=> b!645459 m!619405))

(declare-fun m!619407 () Bool)

(assert (=> b!645468 m!619407))

(assert (=> b!645454 m!619399))

(assert (=> b!645454 m!619399))

(declare-fun m!619409 () Bool)

(assert (=> b!645454 m!619409))

(declare-fun m!619411 () Bool)

(assert (=> b!645472 m!619411))

(assert (=> b!645472 m!619399))

(assert (=> b!645472 m!619399))

(declare-fun m!619413 () Bool)

(assert (=> b!645472 m!619413))

(declare-fun m!619415 () Bool)

(assert (=> b!645461 m!619415))

(declare-fun m!619417 () Bool)

(assert (=> b!645461 m!619417))

(assert (=> b!645465 m!619399))

(declare-fun m!619419 () Bool)

(assert (=> b!645465 m!619419))

(declare-fun m!619421 () Bool)

(assert (=> b!645465 m!619421))

(declare-fun m!619423 () Bool)

(assert (=> b!645465 m!619423))

(assert (=> b!645465 m!619399))

(assert (=> b!645465 m!619399))

(declare-fun m!619425 () Bool)

(assert (=> b!645465 m!619425))

(declare-fun m!619427 () Bool)

(assert (=> b!645465 m!619427))

(assert (=> b!645465 m!619399))

(declare-fun m!619429 () Bool)

(assert (=> b!645465 m!619429))

(declare-fun m!619431 () Bool)

(assert (=> b!645465 m!619431))

(assert (=> b!645460 m!619399))

(assert (=> b!645460 m!619399))

(declare-fun m!619433 () Bool)

(assert (=> b!645460 m!619433))

(assert (=> b!645453 m!619399))

(assert (=> b!645453 m!619415))

(declare-fun m!619435 () Bool)

(assert (=> b!645453 m!619435))

(declare-fun m!619437 () Bool)

(assert (=> b!645473 m!619437))

(assert (=> b!645464 m!619399))

(assert (=> b!645464 m!619399))

(assert (=> b!645464 m!619405))

(declare-fun m!619439 () Bool)

(assert (=> b!645457 m!619439))

(assert (=> b!645474 m!619399))

(declare-fun m!619441 () Bool)

(assert (=> b!645470 m!619441))

(declare-fun m!619443 () Bool)

(assert (=> b!645456 m!619443))

(declare-fun m!619445 () Bool)

(assert (=> b!645456 m!619445))

(declare-fun m!619447 () Bool)

(assert (=> b!645456 m!619447))

(assert (=> b!645456 m!619399))

(declare-fun m!619449 () Bool)

(assert (=> b!645456 m!619449))

(assert (=> b!645456 m!619415))

(assert (=> b!645456 m!619399))

(declare-fun m!619451 () Bool)

(assert (=> b!645456 m!619451))

(declare-fun m!619453 () Bool)

(assert (=> b!645456 m!619453))

(declare-fun m!619455 () Bool)

(assert (=> b!645466 m!619455))

(assert (=> b!645463 m!619399))

(assert (=> b!645463 m!619399))

(assert (=> b!645463 m!619409))

(check-sat (not b!645460) (not b!645464) (not b!645456) (not b!645466) (not b!645473) (not b!645468) (not start!58494) (not b!645463) (not b!645457) (not b!645467) (not b!645454) (not b!645465) (not b!645472) (not b!645459))
(check-sat)
