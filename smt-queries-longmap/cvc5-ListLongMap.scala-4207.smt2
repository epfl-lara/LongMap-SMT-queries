; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57686 () Bool)

(assert start!57686)

(declare-fun b!637396 () Bool)

(declare-fun e!364728 () Bool)

(declare-fun e!364734 () Bool)

(assert (=> b!637396 (= e!364728 e!364734)))

(declare-fun res!412310 () Bool)

(assert (=> b!637396 (=> (not res!412310) (not e!364734))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6791 0))(
  ( (MissingZero!6791 (index!29478 (_ BitVec 32))) (Found!6791 (index!29479 (_ BitVec 32))) (Intermediate!6791 (undefined!7603 Bool) (index!29480 (_ BitVec 32)) (x!58241 (_ BitVec 32))) (Undefined!6791) (MissingVacant!6791 (index!29481 (_ BitVec 32))) )
))
(declare-fun lt!294702 () SeekEntryResult!6791)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38257 0))(
  ( (array!38258 (arr!18351 (Array (_ BitVec 32) (_ BitVec 64))) (size!18715 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38257)

(assert (=> b!637396 (= res!412310 (and (= lt!294702 (Found!6791 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18351 a!2986) index!984) (select (arr!18351 a!2986) j!136))) (not (= (select (arr!18351 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38257 (_ BitVec 32)) SeekEntryResult!6791)

(assert (=> b!637396 (= lt!294702 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18351 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637397 () Bool)

(declare-fun e!364733 () Bool)

(declare-fun e!364724 () Bool)

(assert (=> b!637397 (= e!364733 e!364724)))

(declare-fun res!412320 () Bool)

(assert (=> b!637397 (=> (not res!412320) (not e!364724))))

(declare-fun lt!294712 () SeekEntryResult!6791)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637397 (= res!412320 (or (= lt!294712 (MissingZero!6791 i!1108)) (= lt!294712 (MissingVacant!6791 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38257 (_ BitVec 32)) SeekEntryResult!6791)

(assert (=> b!637397 (= lt!294712 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!637398 () Bool)

(declare-fun res!412328 () Bool)

(assert (=> b!637398 (=> (not res!412328) (not e!364733))))

(declare-fun arrayContainsKey!0 (array!38257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637398 (= res!412328 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637399 () Bool)

(declare-fun res!412326 () Bool)

(declare-fun e!364729 () Bool)

(assert (=> b!637399 (=> res!412326 e!364729)))

(declare-datatypes ((List!12392 0))(
  ( (Nil!12389) (Cons!12388 (h!13433 (_ BitVec 64)) (t!18620 List!12392)) )
))
(declare-fun contains!3106 (List!12392 (_ BitVec 64)) Bool)

(assert (=> b!637399 (= res!412326 (contains!3106 Nil!12389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637400 () Bool)

(assert (=> b!637400 (= e!364729 true)))

(declare-fun lt!294711 () Bool)

(assert (=> b!637400 (= lt!294711 (contains!3106 Nil!12389 k!1786))))

(declare-fun b!637401 () Bool)

(declare-fun res!412322 () Bool)

(assert (=> b!637401 (=> (not res!412322) (not e!364724))))

(assert (=> b!637401 (= res!412322 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18351 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637402 () Bool)

(declare-fun res!412315 () Bool)

(assert (=> b!637402 (=> (not res!412315) (not e!364733))))

(assert (=> b!637402 (= res!412315 (and (= (size!18715 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18715 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18715 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637403 () Bool)

(declare-fun res!412316 () Bool)

(assert (=> b!637403 (=> res!412316 e!364729)))

(assert (=> b!637403 (= res!412316 (contains!3106 Nil!12389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637404 () Bool)

(declare-fun res!412323 () Bool)

(assert (=> b!637404 (=> (not res!412323) (not e!364724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38257 (_ BitVec 32)) Bool)

(assert (=> b!637404 (= res!412323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!412325 () Bool)

(assert (=> start!57686 (=> (not res!412325) (not e!364733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57686 (= res!412325 (validMask!0 mask!3053))))

(assert (=> start!57686 e!364733))

(assert (=> start!57686 true))

(declare-fun array_inv!14147 (array!38257) Bool)

(assert (=> start!57686 (array_inv!14147 a!2986)))

(declare-fun b!637405 () Bool)

(declare-fun res!412321 () Bool)

(assert (=> b!637405 (=> (not res!412321) (not e!364733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637405 (= res!412321 (validKeyInArray!0 (select (arr!18351 a!2986) j!136)))))

(declare-fun b!637406 () Bool)

(declare-fun e!364731 () Bool)

(declare-fun lt!294703 () SeekEntryResult!6791)

(assert (=> b!637406 (= e!364731 (= lt!294702 lt!294703))))

(declare-fun b!637407 () Bool)

(declare-fun e!364727 () Bool)

(assert (=> b!637407 (= e!364734 (not e!364727))))

(declare-fun res!412309 () Bool)

(assert (=> b!637407 (=> res!412309 e!364727)))

(declare-fun lt!294704 () SeekEntryResult!6791)

(assert (=> b!637407 (= res!412309 (not (= lt!294704 (Found!6791 index!984))))))

(declare-datatypes ((Unit!21498 0))(
  ( (Unit!21499) )
))
(declare-fun lt!294701 () Unit!21498)

(declare-fun e!364722 () Unit!21498)

(assert (=> b!637407 (= lt!294701 e!364722)))

(declare-fun c!72911 () Bool)

(assert (=> b!637407 (= c!72911 (= lt!294704 Undefined!6791))))

(declare-fun lt!294710 () array!38257)

(declare-fun lt!294707 () (_ BitVec 64))

(assert (=> b!637407 (= lt!294704 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294707 lt!294710 mask!3053))))

(assert (=> b!637407 e!364731))

(declare-fun res!412317 () Bool)

(assert (=> b!637407 (=> (not res!412317) (not e!364731))))

(declare-fun lt!294706 () (_ BitVec 32))

(assert (=> b!637407 (= res!412317 (= lt!294703 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294706 vacantSpotIndex!68 lt!294707 lt!294710 mask!3053)))))

(assert (=> b!637407 (= lt!294703 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294706 vacantSpotIndex!68 (select (arr!18351 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637407 (= lt!294707 (select (store (arr!18351 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294705 () Unit!21498)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21498)

(assert (=> b!637407 (= lt!294705 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294706 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637407 (= lt!294706 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637408 () Bool)

(declare-fun e!364730 () Bool)

(declare-fun e!364726 () Bool)

(assert (=> b!637408 (= e!364730 e!364726)))

(declare-fun res!412308 () Bool)

(assert (=> b!637408 (=> res!412308 e!364726)))

(declare-fun lt!294708 () (_ BitVec 64))

(assert (=> b!637408 (= res!412308 (or (not (= (select (arr!18351 a!2986) j!136) lt!294707)) (not (= (select (arr!18351 a!2986) j!136) lt!294708)) (bvsge j!136 index!984)))))

(declare-fun b!637409 () Bool)

(declare-fun e!364723 () Bool)

(assert (=> b!637409 (= e!364726 e!364723)))

(declare-fun res!412324 () Bool)

(assert (=> b!637409 (=> (not res!412324) (not e!364723))))

(assert (=> b!637409 (= res!412324 (arrayContainsKey!0 lt!294710 (select (arr!18351 a!2986) j!136) j!136))))

(declare-fun b!637410 () Bool)

(assert (=> b!637410 (= e!364724 e!364728)))

(declare-fun res!412312 () Bool)

(assert (=> b!637410 (=> (not res!412312) (not e!364728))))

(assert (=> b!637410 (= res!412312 (= (select (store (arr!18351 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637410 (= lt!294710 (array!38258 (store (arr!18351 a!2986) i!1108 k!1786) (size!18715 a!2986)))))

(declare-fun b!637411 () Bool)

(declare-fun e!364725 () Bool)

(assert (=> b!637411 (= e!364725 e!364729)))

(declare-fun res!412314 () Bool)

(assert (=> b!637411 (=> res!412314 e!364729)))

(assert (=> b!637411 (= res!412314 (or (bvsge (size!18715 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18715 a!2986))))))

(assert (=> b!637411 (arrayContainsKey!0 lt!294710 (select (arr!18351 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294709 () Unit!21498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21498)

(assert (=> b!637411 (= lt!294709 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294710 (select (arr!18351 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637412 () Bool)

(declare-fun Unit!21500 () Unit!21498)

(assert (=> b!637412 (= e!364722 Unit!21500)))

(declare-fun b!637413 () Bool)

(declare-fun res!412318 () Bool)

(assert (=> b!637413 (=> res!412318 e!364729)))

(declare-fun noDuplicate!384 (List!12392) Bool)

(assert (=> b!637413 (= res!412318 (not (noDuplicate!384 Nil!12389)))))

(declare-fun b!637414 () Bool)

(declare-fun res!412313 () Bool)

(assert (=> b!637414 (=> (not res!412313) (not e!364724))))

(declare-fun arrayNoDuplicates!0 (array!38257 (_ BitVec 32) List!12392) Bool)

(assert (=> b!637414 (= res!412313 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12389))))

(declare-fun b!637415 () Bool)

(assert (=> b!637415 (= e!364727 e!364725)))

(declare-fun res!412319 () Bool)

(assert (=> b!637415 (=> res!412319 e!364725)))

(assert (=> b!637415 (= res!412319 (or (not (= (select (arr!18351 a!2986) j!136) lt!294707)) (not (= (select (arr!18351 a!2986) j!136) lt!294708)) (bvsge j!136 index!984)))))

(assert (=> b!637415 e!364730))

(declare-fun res!412327 () Bool)

(assert (=> b!637415 (=> (not res!412327) (not e!364730))))

(assert (=> b!637415 (= res!412327 (= lt!294708 (select (arr!18351 a!2986) j!136)))))

(assert (=> b!637415 (= lt!294708 (select (store (arr!18351 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!637416 () Bool)

(declare-fun Unit!21501 () Unit!21498)

(assert (=> b!637416 (= e!364722 Unit!21501)))

(assert (=> b!637416 false))

(declare-fun b!637417 () Bool)

(assert (=> b!637417 (= e!364723 (arrayContainsKey!0 lt!294710 (select (arr!18351 a!2986) j!136) index!984))))

(declare-fun b!637418 () Bool)

(declare-fun res!412311 () Bool)

(assert (=> b!637418 (=> (not res!412311) (not e!364733))))

(assert (=> b!637418 (= res!412311 (validKeyInArray!0 k!1786))))

(assert (= (and start!57686 res!412325) b!637402))

(assert (= (and b!637402 res!412315) b!637405))

(assert (= (and b!637405 res!412321) b!637418))

(assert (= (and b!637418 res!412311) b!637398))

(assert (= (and b!637398 res!412328) b!637397))

(assert (= (and b!637397 res!412320) b!637404))

(assert (= (and b!637404 res!412323) b!637414))

(assert (= (and b!637414 res!412313) b!637401))

(assert (= (and b!637401 res!412322) b!637410))

(assert (= (and b!637410 res!412312) b!637396))

(assert (= (and b!637396 res!412310) b!637407))

(assert (= (and b!637407 res!412317) b!637406))

(assert (= (and b!637407 c!72911) b!637416))

(assert (= (and b!637407 (not c!72911)) b!637412))

(assert (= (and b!637407 (not res!412309)) b!637415))

(assert (= (and b!637415 res!412327) b!637408))

(assert (= (and b!637408 (not res!412308)) b!637409))

(assert (= (and b!637409 res!412324) b!637417))

(assert (= (and b!637415 (not res!412319)) b!637411))

(assert (= (and b!637411 (not res!412314)) b!637413))

(assert (= (and b!637413 (not res!412318)) b!637399))

(assert (= (and b!637399 (not res!412326)) b!637403))

(assert (= (and b!637403 (not res!412316)) b!637400))

(declare-fun m!611483 () Bool)

(assert (=> b!637418 m!611483))

(declare-fun m!611485 () Bool)

(assert (=> b!637415 m!611485))

(declare-fun m!611487 () Bool)

(assert (=> b!637415 m!611487))

(declare-fun m!611489 () Bool)

(assert (=> b!637415 m!611489))

(declare-fun m!611491 () Bool)

(assert (=> b!637403 m!611491))

(declare-fun m!611493 () Bool)

(assert (=> b!637407 m!611493))

(declare-fun m!611495 () Bool)

(assert (=> b!637407 m!611495))

(assert (=> b!637407 m!611485))

(assert (=> b!637407 m!611487))

(declare-fun m!611497 () Bool)

(assert (=> b!637407 m!611497))

(assert (=> b!637407 m!611485))

(declare-fun m!611499 () Bool)

(assert (=> b!637407 m!611499))

(declare-fun m!611501 () Bool)

(assert (=> b!637407 m!611501))

(declare-fun m!611503 () Bool)

(assert (=> b!637407 m!611503))

(declare-fun m!611505 () Bool)

(assert (=> b!637397 m!611505))

(assert (=> b!637417 m!611485))

(assert (=> b!637417 m!611485))

(declare-fun m!611507 () Bool)

(assert (=> b!637417 m!611507))

(declare-fun m!611509 () Bool)

(assert (=> b!637399 m!611509))

(declare-fun m!611511 () Bool)

(assert (=> b!637398 m!611511))

(assert (=> b!637408 m!611485))

(declare-fun m!611513 () Bool)

(assert (=> start!57686 m!611513))

(declare-fun m!611515 () Bool)

(assert (=> start!57686 m!611515))

(declare-fun m!611517 () Bool)

(assert (=> b!637396 m!611517))

(assert (=> b!637396 m!611485))

(assert (=> b!637396 m!611485))

(declare-fun m!611519 () Bool)

(assert (=> b!637396 m!611519))

(declare-fun m!611521 () Bool)

(assert (=> b!637404 m!611521))

(assert (=> b!637409 m!611485))

(assert (=> b!637409 m!611485))

(declare-fun m!611523 () Bool)

(assert (=> b!637409 m!611523))

(assert (=> b!637411 m!611485))

(assert (=> b!637411 m!611485))

(declare-fun m!611525 () Bool)

(assert (=> b!637411 m!611525))

(assert (=> b!637411 m!611485))

(declare-fun m!611527 () Bool)

(assert (=> b!637411 m!611527))

(declare-fun m!611529 () Bool)

(assert (=> b!637401 m!611529))

(declare-fun m!611531 () Bool)

(assert (=> b!637400 m!611531))

(declare-fun m!611533 () Bool)

(assert (=> b!637413 m!611533))

(assert (=> b!637405 m!611485))

(assert (=> b!637405 m!611485))

(declare-fun m!611535 () Bool)

(assert (=> b!637405 m!611535))

(declare-fun m!611537 () Bool)

(assert (=> b!637414 m!611537))

(assert (=> b!637410 m!611487))

(declare-fun m!611539 () Bool)

(assert (=> b!637410 m!611539))

(push 1)

