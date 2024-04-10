; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59356 () Bool)

(assert start!59356)

(declare-fun b!655389 () Bool)

(declare-fun res!425149 () Bool)

(declare-fun e!376391 () Bool)

(assert (=> b!655389 (=> (not res!425149) (not e!376391))))

(declare-datatypes ((array!38676 0))(
  ( (array!38677 (arr!18538 (Array (_ BitVec 32) (_ BitVec 64))) (size!18902 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38676)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655389 (= res!425149 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655390 () Bool)

(assert (=> b!655390 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22534 0))(
  ( (Unit!22535) )
))
(declare-fun lt!305648 () Unit!22534)

(declare-fun lt!305657 () array!38676)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12579 0))(
  ( (Nil!12576) (Cons!12575 (h!13620 (_ BitVec 64)) (t!18807 List!12579)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38676 (_ BitVec 64) (_ BitVec 32) List!12579) Unit!22534)

(assert (=> b!655390 (= lt!305648 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305657 (select (arr!18538 a!2986) j!136) index!984 Nil!12576))))

(declare-fun arrayNoDuplicates!0 (array!38676 (_ BitVec 32) List!12579) Bool)

(assert (=> b!655390 (arrayNoDuplicates!0 lt!305657 index!984 Nil!12576)))

(declare-fun lt!305662 () Unit!22534)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38676 (_ BitVec 32) (_ BitVec 32)) Unit!22534)

(assert (=> b!655390 (= lt!305662 (lemmaNoDuplicateFromThenFromBigger!0 lt!305657 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655390 (arrayNoDuplicates!0 lt!305657 #b00000000000000000000000000000000 Nil!12576)))

(declare-fun lt!305643 () Unit!22534)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12579) Unit!22534)

(assert (=> b!655390 (= lt!305643 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12576))))

(assert (=> b!655390 (arrayContainsKey!0 lt!305657 (select (arr!18538 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305656 () Unit!22534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22534)

(assert (=> b!655390 (= lt!305656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305657 (select (arr!18538 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376380 () Bool)

(assert (=> b!655390 e!376380))

(declare-fun res!425143 () Bool)

(assert (=> b!655390 (=> (not res!425143) (not e!376380))))

(assert (=> b!655390 (= res!425143 (arrayContainsKey!0 lt!305657 (select (arr!18538 a!2986) j!136) j!136))))

(declare-fun e!376382 () Unit!22534)

(declare-fun Unit!22536 () Unit!22534)

(assert (=> b!655390 (= e!376382 Unit!22536)))

(declare-fun b!655391 () Bool)

(declare-fun e!376388 () Unit!22534)

(declare-fun Unit!22537 () Unit!22534)

(assert (=> b!655391 (= e!376388 Unit!22537)))

(assert (=> b!655391 false))

(declare-fun b!655392 () Bool)

(declare-fun e!376383 () Unit!22534)

(declare-fun Unit!22538 () Unit!22534)

(assert (=> b!655392 (= e!376383 Unit!22538)))

(declare-fun res!425146 () Bool)

(assert (=> b!655392 (= res!425146 (= (select (store (arr!18538 a!2986) i!1108 k0!1786) index!984) (select (arr!18538 a!2986) j!136)))))

(declare-fun e!376384 () Bool)

(assert (=> b!655392 (=> (not res!425146) (not e!376384))))

(assert (=> b!655392 e!376384))

(declare-fun c!75493 () Bool)

(assert (=> b!655392 (= c!75493 (bvslt j!136 index!984))))

(declare-fun lt!305645 () Unit!22534)

(declare-fun e!376392 () Unit!22534)

(assert (=> b!655392 (= lt!305645 e!376392)))

(declare-fun c!75491 () Bool)

(assert (=> b!655392 (= c!75491 (bvslt index!984 j!136))))

(declare-fun lt!305654 () Unit!22534)

(assert (=> b!655392 (= lt!305654 e!376382)))

(assert (=> b!655392 false))

(declare-fun b!655393 () Bool)

(assert (=> b!655393 false))

(declare-fun lt!305653 () Unit!22534)

(assert (=> b!655393 (= lt!305653 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305657 (select (arr!18538 a!2986) j!136) j!136 Nil!12576))))

(assert (=> b!655393 (arrayNoDuplicates!0 lt!305657 j!136 Nil!12576)))

(declare-fun lt!305661 () Unit!22534)

(assert (=> b!655393 (= lt!305661 (lemmaNoDuplicateFromThenFromBigger!0 lt!305657 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655393 (arrayNoDuplicates!0 lt!305657 #b00000000000000000000000000000000 Nil!12576)))

(declare-fun lt!305646 () Unit!22534)

(assert (=> b!655393 (= lt!305646 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12576))))

(assert (=> b!655393 (arrayContainsKey!0 lt!305657 (select (arr!18538 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305651 () Unit!22534)

(assert (=> b!655393 (= lt!305651 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305657 (select (arr!18538 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22539 () Unit!22534)

(assert (=> b!655393 (= e!376392 Unit!22539)))

(declare-fun b!655394 () Bool)

(declare-fun e!376386 () Bool)

(assert (=> b!655394 (= e!376391 e!376386)))

(declare-fun res!425148 () Bool)

(assert (=> b!655394 (=> (not res!425148) (not e!376386))))

(declare-datatypes ((SeekEntryResult!6978 0))(
  ( (MissingZero!6978 (index!30271 (_ BitVec 32))) (Found!6978 (index!30272 (_ BitVec 32))) (Intermediate!6978 (undefined!7790 Bool) (index!30273 (_ BitVec 32)) (x!59059 (_ BitVec 32))) (Undefined!6978) (MissingVacant!6978 (index!30274 (_ BitVec 32))) )
))
(declare-fun lt!305644 () SeekEntryResult!6978)

(assert (=> b!655394 (= res!425148 (or (= lt!305644 (MissingZero!6978 i!1108)) (= lt!305644 (MissingVacant!6978 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38676 (_ BitVec 32)) SeekEntryResult!6978)

(assert (=> b!655394 (= lt!305644 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!425145 () Bool)

(assert (=> start!59356 (=> (not res!425145) (not e!376391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59356 (= res!425145 (validMask!0 mask!3053))))

(assert (=> start!59356 e!376391))

(assert (=> start!59356 true))

(declare-fun array_inv!14334 (array!38676) Bool)

(assert (=> start!59356 (array_inv!14334 a!2986)))

(declare-fun b!655395 () Bool)

(declare-fun Unit!22540 () Unit!22534)

(assert (=> b!655395 (= e!376383 Unit!22540)))

(declare-fun b!655396 () Bool)

(declare-fun e!376381 () Bool)

(assert (=> b!655396 (= e!376381 (arrayContainsKey!0 lt!305657 (select (arr!18538 a!2986) j!136) index!984))))

(declare-fun b!655397 () Bool)

(declare-fun Unit!22541 () Unit!22534)

(assert (=> b!655397 (= e!376392 Unit!22541)))

(declare-fun b!655398 () Bool)

(declare-fun e!376379 () Bool)

(declare-fun e!376389 () Bool)

(assert (=> b!655398 (= e!376379 e!376389)))

(declare-fun res!425142 () Bool)

(assert (=> b!655398 (=> (not res!425142) (not e!376389))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!305647 () SeekEntryResult!6978)

(assert (=> b!655398 (= res!425142 (and (= lt!305647 (Found!6978 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18538 a!2986) index!984) (select (arr!18538 a!2986) j!136))) (not (= (select (arr!18538 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38676 (_ BitVec 32)) SeekEntryResult!6978)

(assert (=> b!655398 (= lt!305647 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18538 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655399 () Bool)

(declare-fun res!425147 () Bool)

(assert (=> b!655399 (= res!425147 (arrayContainsKey!0 lt!305657 (select (arr!18538 a!2986) j!136) j!136))))

(assert (=> b!655399 (=> (not res!425147) (not e!376381))))

(declare-fun e!376387 () Bool)

(assert (=> b!655399 (= e!376387 e!376381)))

(declare-fun b!655400 () Bool)

(assert (=> b!655400 (= e!376389 (not true))))

(declare-fun lt!305659 () Unit!22534)

(assert (=> b!655400 (= lt!305659 e!376383)))

(declare-fun c!75492 () Bool)

(declare-fun lt!305652 () SeekEntryResult!6978)

(assert (=> b!655400 (= c!75492 (= lt!305652 (Found!6978 index!984)))))

(declare-fun lt!305660 () Unit!22534)

(assert (=> b!655400 (= lt!305660 e!376388)))

(declare-fun c!75494 () Bool)

(assert (=> b!655400 (= c!75494 (= lt!305652 Undefined!6978))))

(declare-fun lt!305655 () (_ BitVec 64))

(assert (=> b!655400 (= lt!305652 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305655 lt!305657 mask!3053))))

(declare-fun e!376385 () Bool)

(assert (=> b!655400 e!376385))

(declare-fun res!425153 () Bool)

(assert (=> b!655400 (=> (not res!425153) (not e!376385))))

(declare-fun lt!305649 () SeekEntryResult!6978)

(declare-fun lt!305658 () (_ BitVec 32))

(assert (=> b!655400 (= res!425153 (= lt!305649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305658 vacantSpotIndex!68 lt!305655 lt!305657 mask!3053)))))

(assert (=> b!655400 (= lt!305649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305658 vacantSpotIndex!68 (select (arr!18538 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655400 (= lt!305655 (select (store (arr!18538 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305650 () Unit!22534)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38676 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22534)

(assert (=> b!655400 (= lt!305650 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305658 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655400 (= lt!305658 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655401 () Bool)

(declare-fun res!425144 () Bool)

(assert (=> b!655401 (=> (not res!425144) (not e!376391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655401 (= res!425144 (validKeyInArray!0 (select (arr!18538 a!2986) j!136)))))

(declare-fun b!655402 () Bool)

(declare-fun res!425150 () Bool)

(assert (=> b!655402 (=> (not res!425150) (not e!376386))))

(assert (=> b!655402 (= res!425150 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12576))))

(declare-fun b!655403 () Bool)

(declare-fun res!425152 () Bool)

(assert (=> b!655403 (=> (not res!425152) (not e!376391))))

(assert (=> b!655403 (= res!425152 (and (= (size!18902 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18902 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18902 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655404 () Bool)

(assert (=> b!655404 (= e!376385 (= lt!305647 lt!305649))))

(declare-fun b!655405 () Bool)

(declare-fun res!425156 () Bool)

(assert (=> b!655405 (= res!425156 (bvsge j!136 index!984))))

(assert (=> b!655405 (=> res!425156 e!376387)))

(assert (=> b!655405 (= e!376384 e!376387)))

(declare-fun b!655406 () Bool)

(declare-fun res!425154 () Bool)

(assert (=> b!655406 (=> (not res!425154) (not e!376391))))

(assert (=> b!655406 (= res!425154 (validKeyInArray!0 k0!1786))))

(declare-fun b!655407 () Bool)

(assert (=> b!655407 (= e!376380 (arrayContainsKey!0 lt!305657 (select (arr!18538 a!2986) j!136) index!984))))

(declare-fun b!655408 () Bool)

(assert (=> b!655408 (= e!376386 e!376379)))

(declare-fun res!425151 () Bool)

(assert (=> b!655408 (=> (not res!425151) (not e!376379))))

(assert (=> b!655408 (= res!425151 (= (select (store (arr!18538 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655408 (= lt!305657 (array!38677 (store (arr!18538 a!2986) i!1108 k0!1786) (size!18902 a!2986)))))

(declare-fun b!655409 () Bool)

(declare-fun Unit!22542 () Unit!22534)

(assert (=> b!655409 (= e!376388 Unit!22542)))

(declare-fun b!655410 () Bool)

(declare-fun Unit!22543 () Unit!22534)

(assert (=> b!655410 (= e!376382 Unit!22543)))

(declare-fun b!655411 () Bool)

(declare-fun res!425155 () Bool)

(assert (=> b!655411 (=> (not res!425155) (not e!376386))))

(assert (=> b!655411 (= res!425155 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18538 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655412 () Bool)

(declare-fun res!425141 () Bool)

(assert (=> b!655412 (=> (not res!425141) (not e!376386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38676 (_ BitVec 32)) Bool)

(assert (=> b!655412 (= res!425141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59356 res!425145) b!655403))

(assert (= (and b!655403 res!425152) b!655401))

(assert (= (and b!655401 res!425144) b!655406))

(assert (= (and b!655406 res!425154) b!655389))

(assert (= (and b!655389 res!425149) b!655394))

(assert (= (and b!655394 res!425148) b!655412))

(assert (= (and b!655412 res!425141) b!655402))

(assert (= (and b!655402 res!425150) b!655411))

(assert (= (and b!655411 res!425155) b!655408))

(assert (= (and b!655408 res!425151) b!655398))

(assert (= (and b!655398 res!425142) b!655400))

(assert (= (and b!655400 res!425153) b!655404))

(assert (= (and b!655400 c!75494) b!655391))

(assert (= (and b!655400 (not c!75494)) b!655409))

(assert (= (and b!655400 c!75492) b!655392))

(assert (= (and b!655400 (not c!75492)) b!655395))

(assert (= (and b!655392 res!425146) b!655405))

(assert (= (and b!655405 (not res!425156)) b!655399))

(assert (= (and b!655399 res!425147) b!655396))

(assert (= (and b!655392 c!75493) b!655393))

(assert (= (and b!655392 (not c!75493)) b!655397))

(assert (= (and b!655392 c!75491) b!655390))

(assert (= (and b!655392 (not c!75491)) b!655410))

(assert (= (and b!655390 res!425143) b!655407))

(declare-fun m!628467 () Bool)

(assert (=> b!655406 m!628467))

(declare-fun m!628469 () Bool)

(assert (=> b!655400 m!628469))

(declare-fun m!628471 () Bool)

(assert (=> b!655400 m!628471))

(declare-fun m!628473 () Bool)

(assert (=> b!655400 m!628473))

(declare-fun m!628475 () Bool)

(assert (=> b!655400 m!628475))

(declare-fun m!628477 () Bool)

(assert (=> b!655400 m!628477))

(assert (=> b!655400 m!628473))

(declare-fun m!628479 () Bool)

(assert (=> b!655400 m!628479))

(declare-fun m!628481 () Bool)

(assert (=> b!655400 m!628481))

(declare-fun m!628483 () Bool)

(assert (=> b!655400 m!628483))

(declare-fun m!628485 () Bool)

(assert (=> b!655394 m!628485))

(declare-fun m!628487 () Bool)

(assert (=> b!655412 m!628487))

(assert (=> b!655392 m!628483))

(declare-fun m!628489 () Bool)

(assert (=> b!655392 m!628489))

(assert (=> b!655392 m!628473))

(assert (=> b!655408 m!628483))

(declare-fun m!628491 () Bool)

(assert (=> b!655408 m!628491))

(declare-fun m!628493 () Bool)

(assert (=> b!655393 m!628493))

(assert (=> b!655393 m!628473))

(declare-fun m!628495 () Bool)

(assert (=> b!655393 m!628495))

(assert (=> b!655393 m!628473))

(declare-fun m!628497 () Bool)

(assert (=> b!655393 m!628497))

(declare-fun m!628499 () Bool)

(assert (=> b!655393 m!628499))

(assert (=> b!655393 m!628473))

(assert (=> b!655393 m!628473))

(declare-fun m!628501 () Bool)

(assert (=> b!655393 m!628501))

(declare-fun m!628503 () Bool)

(assert (=> b!655393 m!628503))

(declare-fun m!628505 () Bool)

(assert (=> b!655393 m!628505))

(declare-fun m!628507 () Bool)

(assert (=> start!59356 m!628507))

(declare-fun m!628509 () Bool)

(assert (=> start!59356 m!628509))

(assert (=> b!655407 m!628473))

(assert (=> b!655407 m!628473))

(declare-fun m!628511 () Bool)

(assert (=> b!655407 m!628511))

(declare-fun m!628513 () Bool)

(assert (=> b!655398 m!628513))

(assert (=> b!655398 m!628473))

(assert (=> b!655398 m!628473))

(declare-fun m!628515 () Bool)

(assert (=> b!655398 m!628515))

(assert (=> b!655390 m!628473))

(declare-fun m!628517 () Bool)

(assert (=> b!655390 m!628517))

(assert (=> b!655390 m!628473))

(assert (=> b!655390 m!628473))

(declare-fun m!628519 () Bool)

(assert (=> b!655390 m!628519))

(declare-fun m!628521 () Bool)

(assert (=> b!655390 m!628521))

(assert (=> b!655390 m!628473))

(declare-fun m!628523 () Bool)

(assert (=> b!655390 m!628523))

(assert (=> b!655390 m!628473))

(declare-fun m!628525 () Bool)

(assert (=> b!655390 m!628525))

(assert (=> b!655390 m!628499))

(declare-fun m!628527 () Bool)

(assert (=> b!655390 m!628527))

(assert (=> b!655390 m!628493))

(declare-fun m!628529 () Bool)

(assert (=> b!655411 m!628529))

(declare-fun m!628531 () Bool)

(assert (=> b!655389 m!628531))

(assert (=> b!655401 m!628473))

(assert (=> b!655401 m!628473))

(declare-fun m!628533 () Bool)

(assert (=> b!655401 m!628533))

(assert (=> b!655399 m!628473))

(assert (=> b!655399 m!628473))

(assert (=> b!655399 m!628517))

(assert (=> b!655396 m!628473))

(assert (=> b!655396 m!628473))

(assert (=> b!655396 m!628511))

(declare-fun m!628535 () Bool)

(assert (=> b!655402 m!628535))

(check-sat (not b!655402) (not b!655393) (not b!655406) (not b!655407) (not b!655396) (not b!655390) (not b!655389) (not b!655398) (not b!655394) (not b!655400) (not b!655401) (not b!655399) (not start!59356) (not b!655412))
(check-sat)
