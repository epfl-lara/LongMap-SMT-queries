; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56196 () Bool)

(assert start!56196)

(declare-fun b!622569 () Bool)

(declare-fun e!357101 () Bool)

(assert (=> b!622569 (= e!357101 (not true))))

(declare-datatypes ((Unit!20918 0))(
  ( (Unit!20919) )
))
(declare-fun lt!288510 () Unit!20918)

(declare-fun e!357097 () Unit!20918)

(assert (=> b!622569 (= lt!288510 e!357097)))

(declare-fun c!71045 () Bool)

(declare-datatypes ((SeekEntryResult!6519 0))(
  ( (MissingZero!6519 (index!28360 (_ BitVec 32))) (Found!6519 (index!28361 (_ BitVec 32))) (Intermediate!6519 (undefined!7331 Bool) (index!28362 (_ BitVec 32)) (x!57127 (_ BitVec 32))) (Undefined!6519) (MissingVacant!6519 (index!28363 (_ BitVec 32))) )
))
(declare-fun lt!288508 () SeekEntryResult!6519)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622569 (= c!71045 (= lt!288508 (Found!6519 index!984)))))

(declare-fun lt!288498 () Unit!20918)

(declare-fun e!357090 () Unit!20918)

(assert (=> b!622569 (= lt!288498 e!357090)))

(declare-fun c!71043 () Bool)

(assert (=> b!622569 (= c!71043 (= lt!288508 Undefined!6519))))

(declare-datatypes ((array!37666 0))(
  ( (array!37667 (arr!18079 (Array (_ BitVec 32) (_ BitVec 64))) (size!18443 (_ BitVec 32))) )
))
(declare-fun lt!288504 () array!37666)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288503 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37666 (_ BitVec 32)) SeekEntryResult!6519)

(assert (=> b!622569 (= lt!288508 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288503 lt!288504 mask!3053))))

(declare-fun e!357100 () Bool)

(assert (=> b!622569 e!357100))

(declare-fun res!401224 () Bool)

(assert (=> b!622569 (=> (not res!401224) (not e!357100))))

(declare-fun lt!288512 () (_ BitVec 32))

(declare-fun lt!288514 () SeekEntryResult!6519)

(assert (=> b!622569 (= res!401224 (= lt!288514 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288512 vacantSpotIndex!68 lt!288503 lt!288504 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37666)

(assert (=> b!622569 (= lt!288514 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288512 vacantSpotIndex!68 (select (arr!18079 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!622569 (= lt!288503 (select (store (arr!18079 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288507 () Unit!20918)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37666 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20918)

(assert (=> b!622569 (= lt!288507 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288512 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622569 (= lt!288512 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622570 () Bool)

(declare-fun res!401232 () Bool)

(assert (=> b!622570 (= res!401232 (bvsge j!136 index!984))))

(declare-fun e!357096 () Bool)

(assert (=> b!622570 (=> res!401232 e!357096)))

(declare-fun e!357092 () Bool)

(assert (=> b!622570 (= e!357092 e!357096)))

(declare-fun b!622571 () Bool)

(assert (=> b!622571 false))

(declare-fun lt!288511 () Unit!20918)

(declare-datatypes ((List!12120 0))(
  ( (Nil!12117) (Cons!12116 (h!13161 (_ BitVec 64)) (t!18348 List!12120)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37666 (_ BitVec 64) (_ BitVec 32) List!12120) Unit!20918)

(assert (=> b!622571 (= lt!288511 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288504 (select (arr!18079 a!2986) j!136) j!136 Nil!12117))))

(declare-fun arrayNoDuplicates!0 (array!37666 (_ BitVec 32) List!12120) Bool)

(assert (=> b!622571 (arrayNoDuplicates!0 lt!288504 j!136 Nil!12117)))

(declare-fun lt!288499 () Unit!20918)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37666 (_ BitVec 32) (_ BitVec 32)) Unit!20918)

(assert (=> b!622571 (= lt!288499 (lemmaNoDuplicateFromThenFromBigger!0 lt!288504 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622571 (arrayNoDuplicates!0 lt!288504 #b00000000000000000000000000000000 Nil!12117)))

(declare-fun lt!288501 () Unit!20918)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37666 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12120) Unit!20918)

(assert (=> b!622571 (= lt!288501 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12117))))

(declare-fun arrayContainsKey!0 (array!37666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622571 (arrayContainsKey!0 lt!288504 (select (arr!18079 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288515 () Unit!20918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37666 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20918)

(assert (=> b!622571 (= lt!288515 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288504 (select (arr!18079 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357098 () Unit!20918)

(declare-fun Unit!20920 () Unit!20918)

(assert (=> b!622571 (= e!357098 Unit!20920)))

(declare-fun b!622572 () Bool)

(declare-fun res!401228 () Bool)

(declare-fun e!357091 () Bool)

(assert (=> b!622572 (=> (not res!401228) (not e!357091))))

(assert (=> b!622572 (= res!401228 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622573 () Bool)

(declare-fun e!357089 () Bool)

(assert (=> b!622573 (= e!357089 e!357101)))

(declare-fun res!401233 () Bool)

(assert (=> b!622573 (=> (not res!401233) (not e!357101))))

(declare-fun lt!288500 () SeekEntryResult!6519)

(assert (=> b!622573 (= res!401233 (and (= lt!288500 (Found!6519 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18079 a!2986) index!984) (select (arr!18079 a!2986) j!136))) (not (= (select (arr!18079 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622573 (= lt!288500 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18079 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622574 () Bool)

(declare-fun Unit!20921 () Unit!20918)

(assert (=> b!622574 (= e!357097 Unit!20921)))

(declare-fun res!401229 () Bool)

(assert (=> b!622574 (= res!401229 (= (select (store (arr!18079 a!2986) i!1108 k0!1786) index!984) (select (arr!18079 a!2986) j!136)))))

(assert (=> b!622574 (=> (not res!401229) (not e!357092))))

(assert (=> b!622574 e!357092))

(declare-fun c!71044 () Bool)

(assert (=> b!622574 (= c!71044 (bvslt j!136 index!984))))

(declare-fun lt!288506 () Unit!20918)

(assert (=> b!622574 (= lt!288506 e!357098)))

(declare-fun c!71042 () Bool)

(assert (=> b!622574 (= c!71042 (bvslt index!984 j!136))))

(declare-fun lt!288502 () Unit!20918)

(declare-fun e!357102 () Unit!20918)

(assert (=> b!622574 (= lt!288502 e!357102)))

(assert (=> b!622574 false))

(declare-fun res!401225 () Bool)

(assert (=> start!56196 (=> (not res!401225) (not e!357091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56196 (= res!401225 (validMask!0 mask!3053))))

(assert (=> start!56196 e!357091))

(assert (=> start!56196 true))

(declare-fun array_inv!13875 (array!37666) Bool)

(assert (=> start!56196 (array_inv!13875 a!2986)))

(declare-fun b!622575 () Bool)

(declare-fun e!357093 () Bool)

(assert (=> b!622575 (= e!357093 (arrayContainsKey!0 lt!288504 (select (arr!18079 a!2986) j!136) index!984))))

(declare-fun b!622576 () Bool)

(declare-fun Unit!20922 () Unit!20918)

(assert (=> b!622576 (= e!357090 Unit!20922)))

(assert (=> b!622576 false))

(declare-fun b!622577 () Bool)

(declare-fun Unit!20923 () Unit!20918)

(assert (=> b!622577 (= e!357102 Unit!20923)))

(declare-fun b!622578 () Bool)

(declare-fun res!401227 () Bool)

(declare-fun e!357094 () Bool)

(assert (=> b!622578 (=> (not res!401227) (not e!357094))))

(assert (=> b!622578 (= res!401227 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18079 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622579 () Bool)

(assert (=> b!622579 (= e!357100 (= lt!288500 lt!288514))))

(declare-fun b!622580 () Bool)

(declare-fun Unit!20924 () Unit!20918)

(assert (=> b!622580 (= e!357090 Unit!20924)))

(declare-fun b!622581 () Bool)

(declare-fun Unit!20925 () Unit!20918)

(assert (=> b!622581 (= e!357098 Unit!20925)))

(declare-fun b!622582 () Bool)

(assert (=> b!622582 (= e!357091 e!357094)))

(declare-fun res!401230 () Bool)

(assert (=> b!622582 (=> (not res!401230) (not e!357094))))

(declare-fun lt!288513 () SeekEntryResult!6519)

(assert (=> b!622582 (= res!401230 (or (= lt!288513 (MissingZero!6519 i!1108)) (= lt!288513 (MissingVacant!6519 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37666 (_ BitVec 32)) SeekEntryResult!6519)

(assert (=> b!622582 (= lt!288513 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622583 () Bool)

(declare-fun res!401231 () Bool)

(assert (=> b!622583 (=> (not res!401231) (not e!357094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37666 (_ BitVec 32)) Bool)

(assert (=> b!622583 (= res!401231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622584 () Bool)

(declare-fun res!401226 () Bool)

(assert (=> b!622584 (=> (not res!401226) (not e!357091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622584 (= res!401226 (validKeyInArray!0 k0!1786))))

(declare-fun b!622585 () Bool)

(declare-fun res!401221 () Bool)

(assert (=> b!622585 (=> (not res!401221) (not e!357094))))

(assert (=> b!622585 (= res!401221 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12117))))

(declare-fun b!622586 () Bool)

(declare-fun e!357099 () Bool)

(assert (=> b!622586 (= e!357099 (arrayContainsKey!0 lt!288504 (select (arr!18079 a!2986) j!136) index!984))))

(declare-fun b!622587 () Bool)

(declare-fun Unit!20926 () Unit!20918)

(assert (=> b!622587 (= e!357097 Unit!20926)))

(declare-fun b!622588 () Bool)

(assert (=> b!622588 (= e!357094 e!357089)))

(declare-fun res!401220 () Bool)

(assert (=> b!622588 (=> (not res!401220) (not e!357089))))

(assert (=> b!622588 (= res!401220 (= (select (store (arr!18079 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622588 (= lt!288504 (array!37667 (store (arr!18079 a!2986) i!1108 k0!1786) (size!18443 a!2986)))))

(declare-fun b!622589 () Bool)

(declare-fun res!401223 () Bool)

(assert (=> b!622589 (= res!401223 (arrayContainsKey!0 lt!288504 (select (arr!18079 a!2986) j!136) j!136))))

(assert (=> b!622589 (=> (not res!401223) (not e!357099))))

(assert (=> b!622589 (= e!357096 e!357099)))

(declare-fun b!622590 () Bool)

(declare-fun res!401234 () Bool)

(assert (=> b!622590 (=> (not res!401234) (not e!357091))))

(assert (=> b!622590 (= res!401234 (validKeyInArray!0 (select (arr!18079 a!2986) j!136)))))

(declare-fun b!622591 () Bool)

(declare-fun res!401222 () Bool)

(assert (=> b!622591 (=> (not res!401222) (not e!357091))))

(assert (=> b!622591 (= res!401222 (and (= (size!18443 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18443 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18443 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622592 () Bool)

(assert (=> b!622592 false))

(declare-fun lt!288509 () Unit!20918)

(assert (=> b!622592 (= lt!288509 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288504 (select (arr!18079 a!2986) j!136) index!984 Nil!12117))))

(assert (=> b!622592 (arrayNoDuplicates!0 lt!288504 index!984 Nil!12117)))

(declare-fun lt!288505 () Unit!20918)

(assert (=> b!622592 (= lt!288505 (lemmaNoDuplicateFromThenFromBigger!0 lt!288504 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622592 (arrayNoDuplicates!0 lt!288504 #b00000000000000000000000000000000 Nil!12117)))

(declare-fun lt!288516 () Unit!20918)

(assert (=> b!622592 (= lt!288516 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12117))))

(assert (=> b!622592 (arrayContainsKey!0 lt!288504 (select (arr!18079 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288517 () Unit!20918)

(assert (=> b!622592 (= lt!288517 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288504 (select (arr!18079 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622592 e!357093))

(declare-fun res!401219 () Bool)

(assert (=> b!622592 (=> (not res!401219) (not e!357093))))

(assert (=> b!622592 (= res!401219 (arrayContainsKey!0 lt!288504 (select (arr!18079 a!2986) j!136) j!136))))

(declare-fun Unit!20927 () Unit!20918)

(assert (=> b!622592 (= e!357102 Unit!20927)))

(assert (= (and start!56196 res!401225) b!622591))

(assert (= (and b!622591 res!401222) b!622590))

(assert (= (and b!622590 res!401234) b!622584))

(assert (= (and b!622584 res!401226) b!622572))

(assert (= (and b!622572 res!401228) b!622582))

(assert (= (and b!622582 res!401230) b!622583))

(assert (= (and b!622583 res!401231) b!622585))

(assert (= (and b!622585 res!401221) b!622578))

(assert (= (and b!622578 res!401227) b!622588))

(assert (= (and b!622588 res!401220) b!622573))

(assert (= (and b!622573 res!401233) b!622569))

(assert (= (and b!622569 res!401224) b!622579))

(assert (= (and b!622569 c!71043) b!622576))

(assert (= (and b!622569 (not c!71043)) b!622580))

(assert (= (and b!622569 c!71045) b!622574))

(assert (= (and b!622569 (not c!71045)) b!622587))

(assert (= (and b!622574 res!401229) b!622570))

(assert (= (and b!622570 (not res!401232)) b!622589))

(assert (= (and b!622589 res!401223) b!622586))

(assert (= (and b!622574 c!71044) b!622571))

(assert (= (and b!622574 (not c!71044)) b!622581))

(assert (= (and b!622574 c!71042) b!622592))

(assert (= (and b!622574 (not c!71042)) b!622577))

(assert (= (and b!622592 res!401219) b!622575))

(declare-fun m!598431 () Bool)

(assert (=> b!622571 m!598431))

(declare-fun m!598433 () Bool)

(assert (=> b!622571 m!598433))

(assert (=> b!622571 m!598431))

(declare-fun m!598435 () Bool)

(assert (=> b!622571 m!598435))

(assert (=> b!622571 m!598431))

(declare-fun m!598437 () Bool)

(assert (=> b!622571 m!598437))

(declare-fun m!598439 () Bool)

(assert (=> b!622571 m!598439))

(declare-fun m!598441 () Bool)

(assert (=> b!622571 m!598441))

(assert (=> b!622571 m!598431))

(declare-fun m!598443 () Bool)

(assert (=> b!622571 m!598443))

(declare-fun m!598445 () Bool)

(assert (=> b!622571 m!598445))

(assert (=> b!622586 m!598431))

(assert (=> b!622586 m!598431))

(declare-fun m!598447 () Bool)

(assert (=> b!622586 m!598447))

(declare-fun m!598449 () Bool)

(assert (=> b!622569 m!598449))

(declare-fun m!598451 () Bool)

(assert (=> b!622569 m!598451))

(declare-fun m!598453 () Bool)

(assert (=> b!622569 m!598453))

(assert (=> b!622569 m!598431))

(declare-fun m!598455 () Bool)

(assert (=> b!622569 m!598455))

(declare-fun m!598457 () Bool)

(assert (=> b!622569 m!598457))

(declare-fun m!598459 () Bool)

(assert (=> b!622569 m!598459))

(assert (=> b!622569 m!598431))

(declare-fun m!598461 () Bool)

(assert (=> b!622569 m!598461))

(declare-fun m!598463 () Bool)

(assert (=> b!622582 m!598463))

(assert (=> b!622574 m!598455))

(declare-fun m!598465 () Bool)

(assert (=> b!622574 m!598465))

(assert (=> b!622574 m!598431))

(assert (=> b!622588 m!598455))

(declare-fun m!598467 () Bool)

(assert (=> b!622588 m!598467))

(declare-fun m!598469 () Bool)

(assert (=> b!622585 m!598469))

(declare-fun m!598471 () Bool)

(assert (=> b!622573 m!598471))

(assert (=> b!622573 m!598431))

(assert (=> b!622573 m!598431))

(declare-fun m!598473 () Bool)

(assert (=> b!622573 m!598473))

(declare-fun m!598475 () Bool)

(assert (=> b!622578 m!598475))

(assert (=> b!622590 m!598431))

(assert (=> b!622590 m!598431))

(declare-fun m!598477 () Bool)

(assert (=> b!622590 m!598477))

(declare-fun m!598479 () Bool)

(assert (=> b!622572 m!598479))

(declare-fun m!598481 () Bool)

(assert (=> b!622584 m!598481))

(assert (=> b!622592 m!598445))

(assert (=> b!622592 m!598431))

(assert (=> b!622592 m!598431))

(declare-fun m!598483 () Bool)

(assert (=> b!622592 m!598483))

(assert (=> b!622592 m!598431))

(declare-fun m!598485 () Bool)

(assert (=> b!622592 m!598485))

(assert (=> b!622592 m!598441))

(assert (=> b!622592 m!598431))

(declare-fun m!598487 () Bool)

(assert (=> b!622592 m!598487))

(declare-fun m!598489 () Bool)

(assert (=> b!622592 m!598489))

(assert (=> b!622592 m!598431))

(declare-fun m!598491 () Bool)

(assert (=> b!622592 m!598491))

(declare-fun m!598493 () Bool)

(assert (=> b!622592 m!598493))

(declare-fun m!598495 () Bool)

(assert (=> start!56196 m!598495))

(declare-fun m!598497 () Bool)

(assert (=> start!56196 m!598497))

(assert (=> b!622589 m!598431))

(assert (=> b!622589 m!598431))

(assert (=> b!622589 m!598487))

(assert (=> b!622575 m!598431))

(assert (=> b!622575 m!598431))

(assert (=> b!622575 m!598447))

(declare-fun m!598499 () Bool)

(assert (=> b!622583 m!598499))

(check-sat (not b!622573) (not b!622589) (not b!622572) (not b!622569) (not b!622575) (not start!56196) (not b!622590) (not b!622586) (not b!622582) (not b!622592) (not b!622584) (not b!622571) (not b!622585) (not b!622583))
(check-sat)
