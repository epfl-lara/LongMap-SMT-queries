; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55596 () Bool)

(assert start!55596)

(declare-fun b!607505 () Bool)

(declare-fun res!390244 () Bool)

(declare-fun e!347897 () Bool)

(assert (=> b!607505 (=> (not res!390244) (not e!347897))))

(declare-datatypes ((array!37272 0))(
  ( (array!37273 (arr!17884 (Array (_ BitVec 32) (_ BitVec 64))) (size!18248 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37272)

(declare-datatypes ((List!11832 0))(
  ( (Nil!11829) (Cons!11828 (h!12876 (_ BitVec 64)) (t!18052 List!11832)) )
))
(declare-fun arrayNoDuplicates!0 (array!37272 (_ BitVec 32) List!11832) Bool)

(assert (=> b!607505 (= res!390244 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11829))))

(declare-fun b!607506 () Bool)

(declare-fun e!347902 () Bool)

(declare-fun e!347908 () Bool)

(assert (=> b!607506 (= e!347902 e!347908)))

(declare-fun res!390246 () Bool)

(assert (=> b!607506 (=> res!390246 e!347908)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!607506 (= res!390246 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19333 0))(
  ( (Unit!19334) )
))
(declare-fun lt!277340 () Unit!19333)

(declare-fun e!347899 () Unit!19333)

(assert (=> b!607506 (= lt!277340 e!347899)))

(declare-fun c!69001 () Bool)

(assert (=> b!607506 (= c!69001 (bvslt j!136 index!984))))

(declare-fun b!607507 () Bool)

(declare-fun e!347905 () Bool)

(assert (=> b!607507 (= e!347908 e!347905)))

(declare-fun res!390250 () Bool)

(assert (=> b!607507 (=> res!390250 e!347905)))

(assert (=> b!607507 (= res!390250 (or (bvsge (size!18248 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18248 a!2986))))))

(declare-fun lt!277343 () array!37272)

(declare-fun arrayContainsKey!0 (array!37272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607507 (arrayContainsKey!0 lt!277343 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277345 () Unit!19333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37272 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19333)

(assert (=> b!607507 (= lt!277345 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277343 (select (arr!17884 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347906 () Bool)

(assert (=> b!607507 e!347906))

(declare-fun res!390247 () Bool)

(assert (=> b!607507 (=> (not res!390247) (not e!347906))))

(assert (=> b!607507 (= res!390247 (arrayContainsKey!0 lt!277343 (select (arr!17884 a!2986) j!136) j!136))))

(declare-fun b!607508 () Bool)

(declare-fun Unit!19335 () Unit!19333)

(assert (=> b!607508 (= e!347899 Unit!19335)))

(declare-fun lt!277349 () Unit!19333)

(assert (=> b!607508 (= lt!277349 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277343 (select (arr!17884 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607508 (arrayContainsKey!0 lt!277343 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!277346 () Unit!19333)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37272 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11832) Unit!19333)

(assert (=> b!607508 (= lt!277346 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11829))))

(assert (=> b!607508 (arrayNoDuplicates!0 lt!277343 #b00000000000000000000000000000000 Nil!11829)))

(declare-fun lt!277344 () Unit!19333)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37272 (_ BitVec 32) (_ BitVec 32)) Unit!19333)

(assert (=> b!607508 (= lt!277344 (lemmaNoDuplicateFromThenFromBigger!0 lt!277343 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607508 (arrayNoDuplicates!0 lt!277343 j!136 Nil!11829)))

(declare-fun lt!277348 () Unit!19333)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37272 (_ BitVec 64) (_ BitVec 32) List!11832) Unit!19333)

(assert (=> b!607508 (= lt!277348 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277343 (select (arr!17884 a!2986) j!136) j!136 Nil!11829))))

(assert (=> b!607508 false))

(declare-fun b!607509 () Bool)

(declare-fun res!390259 () Bool)

(declare-fun e!347909 () Bool)

(assert (=> b!607509 (=> (not res!390259) (not e!347909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607509 (= res!390259 (validKeyInArray!0 k0!1786))))

(declare-fun b!607510 () Bool)

(declare-fun res!390242 () Bool)

(assert (=> b!607510 (=> (not res!390242) (not e!347909))))

(assert (=> b!607510 (= res!390242 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!390261 () Bool)

(assert (=> start!55596 (=> (not res!390261) (not e!347909))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55596 (= res!390261 (validMask!0 mask!3053))))

(assert (=> start!55596 e!347909))

(assert (=> start!55596 true))

(declare-fun array_inv!13743 (array!37272) Bool)

(assert (=> start!55596 (array_inv!13743 a!2986)))

(declare-fun b!607511 () Bool)

(assert (=> b!607511 (= e!347905 true)))

(declare-fun lt!277337 () Bool)

(declare-fun contains!2982 (List!11832 (_ BitVec 64)) Bool)

(assert (=> b!607511 (= lt!277337 (contains!2982 Nil!11829 k0!1786))))

(declare-fun b!607512 () Bool)

(declare-fun res!390241 () Bool)

(assert (=> b!607512 (=> res!390241 e!347905)))

(assert (=> b!607512 (= res!390241 (contains!2982 Nil!11829 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607513 () Bool)

(declare-fun e!347907 () Bool)

(declare-fun e!347910 () Bool)

(assert (=> b!607513 (= e!347907 e!347910)))

(declare-fun res!390248 () Bool)

(assert (=> b!607513 (=> res!390248 e!347910)))

(declare-fun lt!277341 () (_ BitVec 64))

(declare-fun lt!277347 () (_ BitVec 64))

(assert (=> b!607513 (= res!390248 (or (not (= (select (arr!17884 a!2986) j!136) lt!277347)) (not (= (select (arr!17884 a!2986) j!136) lt!277341)) (bvsge j!136 index!984)))))

(declare-fun b!607514 () Bool)

(declare-fun e!347896 () Bool)

(assert (=> b!607514 (= e!347897 e!347896)))

(declare-fun res!390260 () Bool)

(assert (=> b!607514 (=> (not res!390260) (not e!347896))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!607514 (= res!390260 (= (select (store (arr!17884 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607514 (= lt!277343 (array!37273 (store (arr!17884 a!2986) i!1108 k0!1786) (size!18248 a!2986)))))

(declare-fun b!607515 () Bool)

(declare-fun res!390252 () Bool)

(assert (=> b!607515 (=> (not res!390252) (not e!347909))))

(assert (=> b!607515 (= res!390252 (and (= (size!18248 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18248 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18248 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607516 () Bool)

(declare-fun e!347898 () Bool)

(assert (=> b!607516 (= e!347898 (arrayContainsKey!0 lt!277343 (select (arr!17884 a!2986) j!136) index!984))))

(declare-fun b!607517 () Bool)

(assert (=> b!607517 (= e!347909 e!347897)))

(declare-fun res!390254 () Bool)

(assert (=> b!607517 (=> (not res!390254) (not e!347897))))

(declare-datatypes ((SeekEntryResult!6280 0))(
  ( (MissingZero!6280 (index!27395 (_ BitVec 32))) (Found!6280 (index!27396 (_ BitVec 32))) (Intermediate!6280 (undefined!7092 Bool) (index!27397 (_ BitVec 32)) (x!56360 (_ BitVec 32))) (Undefined!6280) (MissingVacant!6280 (index!27398 (_ BitVec 32))) )
))
(declare-fun lt!277339 () SeekEntryResult!6280)

(assert (=> b!607517 (= res!390254 (or (= lt!277339 (MissingZero!6280 i!1108)) (= lt!277339 (MissingVacant!6280 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37272 (_ BitVec 32)) SeekEntryResult!6280)

(assert (=> b!607517 (= lt!277339 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607518 () Bool)

(assert (=> b!607518 (= e!347906 (arrayContainsKey!0 lt!277343 (select (arr!17884 a!2986) j!136) index!984))))

(declare-fun b!607519 () Bool)

(assert (=> b!607519 (= e!347910 e!347898)))

(declare-fun res!390249 () Bool)

(assert (=> b!607519 (=> (not res!390249) (not e!347898))))

(assert (=> b!607519 (= res!390249 (arrayContainsKey!0 lt!277343 (select (arr!17884 a!2986) j!136) j!136))))

(declare-fun b!607520 () Bool)

(declare-fun Unit!19336 () Unit!19333)

(assert (=> b!607520 (= e!347899 Unit!19336)))

(declare-fun b!607521 () Bool)

(declare-fun e!347900 () Bool)

(assert (=> b!607521 (= e!347896 e!347900)))

(declare-fun res!390245 () Bool)

(assert (=> b!607521 (=> (not res!390245) (not e!347900))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!277350 () SeekEntryResult!6280)

(assert (=> b!607521 (= res!390245 (and (= lt!277350 (Found!6280 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17884 a!2986) index!984) (select (arr!17884 a!2986) j!136))) (not (= (select (arr!17884 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37272 (_ BitVec 32)) SeekEntryResult!6280)

(assert (=> b!607521 (= lt!277350 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607522 () Bool)

(declare-fun e!347903 () Bool)

(declare-fun lt!277351 () SeekEntryResult!6280)

(assert (=> b!607522 (= e!347903 (= lt!277350 lt!277351))))

(declare-fun b!607523 () Bool)

(declare-fun res!390251 () Bool)

(assert (=> b!607523 (=> res!390251 e!347905)))

(assert (=> b!607523 (= res!390251 (contains!2982 Nil!11829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607524 () Bool)

(declare-fun e!347895 () Unit!19333)

(declare-fun Unit!19337 () Unit!19333)

(assert (=> b!607524 (= e!347895 Unit!19337)))

(declare-fun b!607525 () Bool)

(declare-fun e!347904 () Bool)

(assert (=> b!607525 (= e!347904 e!347902)))

(declare-fun res!390258 () Bool)

(assert (=> b!607525 (=> res!390258 e!347902)))

(assert (=> b!607525 (= res!390258 (or (not (= (select (arr!17884 a!2986) j!136) lt!277347)) (not (= (select (arr!17884 a!2986) j!136) lt!277341))))))

(assert (=> b!607525 e!347907))

(declare-fun res!390253 () Bool)

(assert (=> b!607525 (=> (not res!390253) (not e!347907))))

(assert (=> b!607525 (= res!390253 (= lt!277341 (select (arr!17884 a!2986) j!136)))))

(assert (=> b!607525 (= lt!277341 (select (store (arr!17884 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607526 () Bool)

(declare-fun res!390262 () Bool)

(assert (=> b!607526 (=> (not res!390262) (not e!347909))))

(assert (=> b!607526 (= res!390262 (validKeyInArray!0 (select (arr!17884 a!2986) j!136)))))

(declare-fun b!607527 () Bool)

(declare-fun res!390256 () Bool)

(assert (=> b!607527 (=> (not res!390256) (not e!347897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37272 (_ BitVec 32)) Bool)

(assert (=> b!607527 (= res!390256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607528 () Bool)

(declare-fun res!390243 () Bool)

(assert (=> b!607528 (=> res!390243 e!347905)))

(declare-fun noDuplicate!316 (List!11832) Bool)

(assert (=> b!607528 (= res!390243 (not (noDuplicate!316 Nil!11829)))))

(declare-fun b!607529 () Bool)

(declare-fun Unit!19338 () Unit!19333)

(assert (=> b!607529 (= e!347895 Unit!19338)))

(assert (=> b!607529 false))

(declare-fun b!607530 () Bool)

(assert (=> b!607530 (= e!347900 (not e!347904))))

(declare-fun res!390255 () Bool)

(assert (=> b!607530 (=> res!390255 e!347904)))

(declare-fun lt!277336 () SeekEntryResult!6280)

(assert (=> b!607530 (= res!390255 (not (= lt!277336 (Found!6280 index!984))))))

(declare-fun lt!277342 () Unit!19333)

(assert (=> b!607530 (= lt!277342 e!347895)))

(declare-fun c!69002 () Bool)

(assert (=> b!607530 (= c!69002 (= lt!277336 Undefined!6280))))

(assert (=> b!607530 (= lt!277336 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277347 lt!277343 mask!3053))))

(assert (=> b!607530 e!347903))

(declare-fun res!390257 () Bool)

(assert (=> b!607530 (=> (not res!390257) (not e!347903))))

(declare-fun lt!277338 () (_ BitVec 32))

(assert (=> b!607530 (= res!390257 (= lt!277351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277338 vacantSpotIndex!68 lt!277347 lt!277343 mask!3053)))))

(assert (=> b!607530 (= lt!277351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277338 vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607530 (= lt!277347 (select (store (arr!17884 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277335 () Unit!19333)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37272 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19333)

(assert (=> b!607530 (= lt!277335 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277338 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607530 (= lt!277338 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!607531 () Bool)

(declare-fun res!390240 () Bool)

(assert (=> b!607531 (=> (not res!390240) (not e!347897))))

(assert (=> b!607531 (= res!390240 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17884 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55596 res!390261) b!607515))

(assert (= (and b!607515 res!390252) b!607526))

(assert (= (and b!607526 res!390262) b!607509))

(assert (= (and b!607509 res!390259) b!607510))

(assert (= (and b!607510 res!390242) b!607517))

(assert (= (and b!607517 res!390254) b!607527))

(assert (= (and b!607527 res!390256) b!607505))

(assert (= (and b!607505 res!390244) b!607531))

(assert (= (and b!607531 res!390240) b!607514))

(assert (= (and b!607514 res!390260) b!607521))

(assert (= (and b!607521 res!390245) b!607530))

(assert (= (and b!607530 res!390257) b!607522))

(assert (= (and b!607530 c!69002) b!607529))

(assert (= (and b!607530 (not c!69002)) b!607524))

(assert (= (and b!607530 (not res!390255)) b!607525))

(assert (= (and b!607525 res!390253) b!607513))

(assert (= (and b!607513 (not res!390248)) b!607519))

(assert (= (and b!607519 res!390249) b!607516))

(assert (= (and b!607525 (not res!390258)) b!607506))

(assert (= (and b!607506 c!69001) b!607508))

(assert (= (and b!607506 (not c!69001)) b!607520))

(assert (= (and b!607506 (not res!390246)) b!607507))

(assert (= (and b!607507 res!390247) b!607518))

(assert (= (and b!607507 (not res!390250)) b!607528))

(assert (= (and b!607528 (not res!390243)) b!607523))

(assert (= (and b!607523 (not res!390251)) b!607512))

(assert (= (and b!607512 (not res!390241)) b!607511))

(declare-fun m!584519 () Bool)

(assert (=> b!607509 m!584519))

(declare-fun m!584521 () Bool)

(assert (=> b!607518 m!584521))

(assert (=> b!607518 m!584521))

(declare-fun m!584523 () Bool)

(assert (=> b!607518 m!584523))

(assert (=> b!607526 m!584521))

(assert (=> b!607526 m!584521))

(declare-fun m!584525 () Bool)

(assert (=> b!607526 m!584525))

(declare-fun m!584527 () Bool)

(assert (=> b!607530 m!584527))

(declare-fun m!584529 () Bool)

(assert (=> b!607530 m!584529))

(declare-fun m!584531 () Bool)

(assert (=> b!607530 m!584531))

(assert (=> b!607530 m!584521))

(declare-fun m!584533 () Bool)

(assert (=> b!607530 m!584533))

(declare-fun m!584535 () Bool)

(assert (=> b!607530 m!584535))

(assert (=> b!607530 m!584521))

(declare-fun m!584537 () Bool)

(assert (=> b!607530 m!584537))

(declare-fun m!584539 () Bool)

(assert (=> b!607530 m!584539))

(declare-fun m!584541 () Bool)

(assert (=> b!607528 m!584541))

(declare-fun m!584543 () Bool)

(assert (=> b!607505 m!584543))

(declare-fun m!584545 () Bool)

(assert (=> b!607531 m!584545))

(declare-fun m!584547 () Bool)

(assert (=> b!607510 m!584547))

(assert (=> b!607514 m!584533))

(declare-fun m!584549 () Bool)

(assert (=> b!607514 m!584549))

(declare-fun m!584551 () Bool)

(assert (=> b!607517 m!584551))

(declare-fun m!584553 () Bool)

(assert (=> start!55596 m!584553))

(declare-fun m!584555 () Bool)

(assert (=> start!55596 m!584555))

(declare-fun m!584557 () Bool)

(assert (=> b!607521 m!584557))

(assert (=> b!607521 m!584521))

(assert (=> b!607521 m!584521))

(declare-fun m!584559 () Bool)

(assert (=> b!607521 m!584559))

(assert (=> b!607525 m!584521))

(assert (=> b!607525 m!584533))

(declare-fun m!584561 () Bool)

(assert (=> b!607525 m!584561))

(assert (=> b!607513 m!584521))

(assert (=> b!607519 m!584521))

(assert (=> b!607519 m!584521))

(declare-fun m!584563 () Bool)

(assert (=> b!607519 m!584563))

(declare-fun m!584565 () Bool)

(assert (=> b!607512 m!584565))

(declare-fun m!584567 () Bool)

(assert (=> b!607527 m!584567))

(declare-fun m!584569 () Bool)

(assert (=> b!607511 m!584569))

(assert (=> b!607507 m!584521))

(assert (=> b!607507 m!584521))

(declare-fun m!584571 () Bool)

(assert (=> b!607507 m!584571))

(assert (=> b!607507 m!584521))

(declare-fun m!584573 () Bool)

(assert (=> b!607507 m!584573))

(assert (=> b!607507 m!584521))

(assert (=> b!607507 m!584563))

(assert (=> b!607508 m!584521))

(declare-fun m!584575 () Bool)

(assert (=> b!607508 m!584575))

(declare-fun m!584577 () Bool)

(assert (=> b!607508 m!584577))

(assert (=> b!607508 m!584521))

(declare-fun m!584579 () Bool)

(assert (=> b!607508 m!584579))

(declare-fun m!584581 () Bool)

(assert (=> b!607508 m!584581))

(declare-fun m!584583 () Bool)

(assert (=> b!607508 m!584583))

(assert (=> b!607508 m!584521))

(declare-fun m!584585 () Bool)

(assert (=> b!607508 m!584585))

(assert (=> b!607508 m!584521))

(declare-fun m!584587 () Bool)

(assert (=> b!607508 m!584587))

(declare-fun m!584589 () Bool)

(assert (=> b!607523 m!584589))

(assert (=> b!607516 m!584521))

(assert (=> b!607516 m!584521))

(assert (=> b!607516 m!584523))

(check-sat (not b!607519) (not b!607527) (not b!607521) (not b!607510) (not b!607512) (not b!607505) (not b!607511) (not b!607509) (not b!607508) (not b!607507) (not b!607518) (not b!607516) (not start!55596) (not b!607530) (not b!607526) (not b!607528) (not b!607517) (not b!607523))
(check-sat)
