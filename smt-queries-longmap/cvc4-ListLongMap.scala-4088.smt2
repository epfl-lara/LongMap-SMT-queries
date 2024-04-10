; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56030 () Bool)

(assert start!56030)

(declare-fun b!616448 () Bool)

(declare-fun res!397092 () Bool)

(declare-fun e!353471 () Bool)

(assert (=> b!616448 (=> (not res!397092) (not e!353471))))

(declare-datatypes ((array!37500 0))(
  ( (array!37501 (arr!17996 (Array (_ BitVec 32) (_ BitVec 64))) (size!18360 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37500)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37500 (_ BitVec 32)) Bool)

(assert (=> b!616448 (= res!397092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616449 () Bool)

(declare-fun e!353458 () Bool)

(assert (=> b!616449 (= e!353458 e!353471)))

(declare-fun res!397091 () Bool)

(assert (=> b!616449 (=> (not res!397091) (not e!353471))))

(declare-datatypes ((SeekEntryResult!6436 0))(
  ( (MissingZero!6436 (index!28028 (_ BitVec 32))) (Found!6436 (index!28029 (_ BitVec 32))) (Intermediate!6436 (undefined!7248 Bool) (index!28030 (_ BitVec 32)) (x!56820 (_ BitVec 32))) (Undefined!6436) (MissingVacant!6436 (index!28031 (_ BitVec 32))) )
))
(declare-fun lt!283526 () SeekEntryResult!6436)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616449 (= res!397091 (or (= lt!283526 (MissingZero!6436 i!1108)) (= lt!283526 (MissingVacant!6436 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37500 (_ BitVec 32)) SeekEntryResult!6436)

(assert (=> b!616449 (= lt!283526 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616450 () Bool)

(declare-datatypes ((Unit!20088 0))(
  ( (Unit!20089) )
))
(declare-fun e!353469 () Unit!20088)

(declare-fun Unit!20090 () Unit!20088)

(assert (=> b!616450 (= e!353469 Unit!20090)))

(declare-fun b!616451 () Bool)

(assert (=> b!616451 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!283528 () array!37500)

(declare-fun lt!283525 () Unit!20088)

(declare-datatypes ((List!12037 0))(
  ( (Nil!12034) (Cons!12033 (h!13078 (_ BitVec 64)) (t!18265 List!12037)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37500 (_ BitVec 64) (_ BitVec 32) List!12037) Unit!20088)

(assert (=> b!616451 (= lt!283525 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283528 (select (arr!17996 a!2986) j!136) j!136 Nil!12034))))

(declare-fun arrayNoDuplicates!0 (array!37500 (_ BitVec 32) List!12037) Bool)

(assert (=> b!616451 (arrayNoDuplicates!0 lt!283528 j!136 Nil!12034)))

(declare-fun lt!283518 () Unit!20088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37500 (_ BitVec 32) (_ BitVec 32)) Unit!20088)

(assert (=> b!616451 (= lt!283518 (lemmaNoDuplicateFromThenFromBigger!0 lt!283528 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616451 (arrayNoDuplicates!0 lt!283528 #b00000000000000000000000000000000 Nil!12034)))

(declare-fun lt!283523 () Unit!20088)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37500 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12037) Unit!20088)

(assert (=> b!616451 (= lt!283523 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12034))))

(declare-fun arrayContainsKey!0 (array!37500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616451 (arrayContainsKey!0 lt!283528 (select (arr!17996 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283532 () Unit!20088)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37500 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20088)

(assert (=> b!616451 (= lt!283532 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283528 (select (arr!17996 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20091 () Unit!20088)

(assert (=> b!616451 (= e!353469 Unit!20091)))

(declare-fun b!616452 () Bool)

(declare-fun e!353472 () Unit!20088)

(declare-fun Unit!20092 () Unit!20088)

(assert (=> b!616452 (= e!353472 Unit!20092)))

(declare-fun res!397097 () Bool)

(assert (=> b!616452 (= res!397097 (= (select (store (arr!17996 a!2986) i!1108 k!1786) index!984) (select (arr!17996 a!2986) j!136)))))

(declare-fun e!353462 () Bool)

(assert (=> b!616452 (=> (not res!397097) (not e!353462))))

(assert (=> b!616452 e!353462))

(declare-fun c!70048 () Bool)

(assert (=> b!616452 (= c!70048 (bvslt j!136 index!984))))

(declare-fun lt!283529 () Unit!20088)

(assert (=> b!616452 (= lt!283529 e!353469)))

(declare-fun c!70046 () Bool)

(assert (=> b!616452 (= c!70046 (bvslt index!984 j!136))))

(declare-fun lt!283524 () Unit!20088)

(declare-fun e!353467 () Unit!20088)

(assert (=> b!616452 (= lt!283524 e!353467)))

(assert (=> b!616452 false))

(declare-fun res!397100 () Bool)

(declare-fun b!616453 () Bool)

(assert (=> b!616453 (= res!397100 (arrayContainsKey!0 lt!283528 (select (arr!17996 a!2986) j!136) j!136))))

(declare-fun e!353468 () Bool)

(assert (=> b!616453 (=> (not res!397100) (not e!353468))))

(declare-fun e!353460 () Bool)

(assert (=> b!616453 (= e!353460 e!353468)))

(declare-fun b!616454 () Bool)

(declare-fun e!353459 () Bool)

(declare-fun lt!283521 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616454 (= e!353459 (validKeyInArray!0 lt!283521))))

(declare-fun b!616455 () Bool)

(assert (=> b!616455 (= e!353468 (arrayContainsKey!0 lt!283528 (select (arr!17996 a!2986) j!136) index!984))))

(declare-fun b!616456 () Bool)

(declare-fun res!397104 () Bool)

(assert (=> b!616456 (=> (not res!397104) (not e!353458))))

(assert (=> b!616456 (= res!397104 (validKeyInArray!0 (select (arr!17996 a!2986) j!136)))))

(declare-fun b!616458 () Bool)

(declare-fun e!353463 () Bool)

(assert (=> b!616458 (= e!353463 (not e!353459))))

(declare-fun res!397095 () Bool)

(assert (=> b!616458 (=> res!397095 e!353459)))

(assert (=> b!616458 (= res!397095 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!283531 () Unit!20088)

(assert (=> b!616458 (= lt!283531 e!353472)))

(declare-fun c!70047 () Bool)

(declare-fun lt!283533 () SeekEntryResult!6436)

(assert (=> b!616458 (= c!70047 (= lt!283533 (Found!6436 index!984)))))

(declare-fun lt!283527 () Unit!20088)

(declare-fun e!353470 () Unit!20088)

(assert (=> b!616458 (= lt!283527 e!353470)))

(declare-fun c!70049 () Bool)

(assert (=> b!616458 (= c!70049 (= lt!283533 Undefined!6436))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37500 (_ BitVec 32)) SeekEntryResult!6436)

(assert (=> b!616458 (= lt!283533 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283521 lt!283528 mask!3053))))

(declare-fun e!353465 () Bool)

(assert (=> b!616458 e!353465))

(declare-fun res!397096 () Bool)

(assert (=> b!616458 (=> (not res!397096) (not e!353465))))

(declare-fun lt!283520 () SeekEntryResult!6436)

(declare-fun lt!283535 () (_ BitVec 32))

(assert (=> b!616458 (= res!397096 (= lt!283520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283535 vacantSpotIndex!68 lt!283521 lt!283528 mask!3053)))))

(assert (=> b!616458 (= lt!283520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283535 vacantSpotIndex!68 (select (arr!17996 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616458 (= lt!283521 (select (store (arr!17996 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283522 () Unit!20088)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20088)

(assert (=> b!616458 (= lt!283522 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283535 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616458 (= lt!283535 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616459 () Bool)

(declare-fun res!397103 () Bool)

(assert (=> b!616459 (=> (not res!397103) (not e!353458))))

(assert (=> b!616459 (= res!397103 (validKeyInArray!0 k!1786))))

(declare-fun b!616460 () Bool)

(assert (=> b!616460 false))

(declare-fun lt!283537 () Unit!20088)

(assert (=> b!616460 (= lt!283537 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283528 (select (arr!17996 a!2986) j!136) index!984 Nil!12034))))

(assert (=> b!616460 (arrayNoDuplicates!0 lt!283528 index!984 Nil!12034)))

(declare-fun lt!283534 () Unit!20088)

(assert (=> b!616460 (= lt!283534 (lemmaNoDuplicateFromThenFromBigger!0 lt!283528 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616460 (arrayNoDuplicates!0 lt!283528 #b00000000000000000000000000000000 Nil!12034)))

(declare-fun lt!283530 () Unit!20088)

(assert (=> b!616460 (= lt!283530 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12034))))

(assert (=> b!616460 (arrayContainsKey!0 lt!283528 (select (arr!17996 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283536 () Unit!20088)

(assert (=> b!616460 (= lt!283536 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283528 (select (arr!17996 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353466 () Bool)

(assert (=> b!616460 e!353466))

(declare-fun res!397101 () Bool)

(assert (=> b!616460 (=> (not res!397101) (not e!353466))))

(assert (=> b!616460 (= res!397101 (arrayContainsKey!0 lt!283528 (select (arr!17996 a!2986) j!136) j!136))))

(declare-fun Unit!20093 () Unit!20088)

(assert (=> b!616460 (= e!353467 Unit!20093)))

(declare-fun b!616461 () Bool)

(declare-fun res!397098 () Bool)

(assert (=> b!616461 (= res!397098 (bvsge j!136 index!984))))

(assert (=> b!616461 (=> res!397098 e!353460)))

(assert (=> b!616461 (= e!353462 e!353460)))

(declare-fun b!616462 () Bool)

(declare-fun Unit!20094 () Unit!20088)

(assert (=> b!616462 (= e!353472 Unit!20094)))

(declare-fun b!616463 () Bool)

(declare-fun e!353461 () Bool)

(assert (=> b!616463 (= e!353471 e!353461)))

(declare-fun res!397094 () Bool)

(assert (=> b!616463 (=> (not res!397094) (not e!353461))))

(assert (=> b!616463 (= res!397094 (= (select (store (arr!17996 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616463 (= lt!283528 (array!37501 (store (arr!17996 a!2986) i!1108 k!1786) (size!18360 a!2986)))))

(declare-fun b!616464 () Bool)

(declare-fun lt!283519 () SeekEntryResult!6436)

(assert (=> b!616464 (= e!353465 (= lt!283519 lt!283520))))

(declare-fun b!616465 () Bool)

(declare-fun res!397090 () Bool)

(assert (=> b!616465 (=> (not res!397090) (not e!353471))))

(assert (=> b!616465 (= res!397090 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17996 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616466 () Bool)

(declare-fun Unit!20095 () Unit!20088)

(assert (=> b!616466 (= e!353467 Unit!20095)))

(declare-fun b!616467 () Bool)

(declare-fun Unit!20096 () Unit!20088)

(assert (=> b!616467 (= e!353470 Unit!20096)))

(declare-fun b!616468 () Bool)

(declare-fun res!397093 () Bool)

(assert (=> b!616468 (=> (not res!397093) (not e!353458))))

(assert (=> b!616468 (= res!397093 (and (= (size!18360 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18360 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18360 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616469 () Bool)

(declare-fun Unit!20097 () Unit!20088)

(assert (=> b!616469 (= e!353470 Unit!20097)))

(assert (=> b!616469 false))

(declare-fun b!616470 () Bool)

(declare-fun res!397105 () Bool)

(assert (=> b!616470 (=> (not res!397105) (not e!353471))))

(assert (=> b!616470 (= res!397105 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12034))))

(declare-fun b!616457 () Bool)

(assert (=> b!616457 (= e!353461 e!353463)))

(declare-fun res!397099 () Bool)

(assert (=> b!616457 (=> (not res!397099) (not e!353463))))

(assert (=> b!616457 (= res!397099 (and (= lt!283519 (Found!6436 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17996 a!2986) index!984) (select (arr!17996 a!2986) j!136))) (not (= (select (arr!17996 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616457 (= lt!283519 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17996 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!397102 () Bool)

(assert (=> start!56030 (=> (not res!397102) (not e!353458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56030 (= res!397102 (validMask!0 mask!3053))))

(assert (=> start!56030 e!353458))

(assert (=> start!56030 true))

(declare-fun array_inv!13792 (array!37500) Bool)

(assert (=> start!56030 (array_inv!13792 a!2986)))

(declare-fun b!616471 () Bool)

(declare-fun res!397106 () Bool)

(assert (=> b!616471 (=> (not res!397106) (not e!353458))))

(assert (=> b!616471 (= res!397106 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616472 () Bool)

(assert (=> b!616472 (= e!353466 (arrayContainsKey!0 lt!283528 (select (arr!17996 a!2986) j!136) index!984))))

(assert (= (and start!56030 res!397102) b!616468))

(assert (= (and b!616468 res!397093) b!616456))

(assert (= (and b!616456 res!397104) b!616459))

(assert (= (and b!616459 res!397103) b!616471))

(assert (= (and b!616471 res!397106) b!616449))

(assert (= (and b!616449 res!397091) b!616448))

(assert (= (and b!616448 res!397092) b!616470))

(assert (= (and b!616470 res!397105) b!616465))

(assert (= (and b!616465 res!397090) b!616463))

(assert (= (and b!616463 res!397094) b!616457))

(assert (= (and b!616457 res!397099) b!616458))

(assert (= (and b!616458 res!397096) b!616464))

(assert (= (and b!616458 c!70049) b!616469))

(assert (= (and b!616458 (not c!70049)) b!616467))

(assert (= (and b!616458 c!70047) b!616452))

(assert (= (and b!616458 (not c!70047)) b!616462))

(assert (= (and b!616452 res!397097) b!616461))

(assert (= (and b!616461 (not res!397098)) b!616453))

(assert (= (and b!616453 res!397100) b!616455))

(assert (= (and b!616452 c!70048) b!616451))

(assert (= (and b!616452 (not c!70048)) b!616450))

(assert (= (and b!616452 c!70046) b!616460))

(assert (= (and b!616452 (not c!70046)) b!616466))

(assert (= (and b!616460 res!397101) b!616472))

(assert (= (and b!616458 (not res!397095)) b!616454))

(declare-fun m!592619 () Bool)

(assert (=> b!616451 m!592619))

(declare-fun m!592621 () Bool)

(assert (=> b!616451 m!592621))

(declare-fun m!592623 () Bool)

(assert (=> b!616451 m!592623))

(declare-fun m!592625 () Bool)

(assert (=> b!616451 m!592625))

(assert (=> b!616451 m!592623))

(declare-fun m!592627 () Bool)

(assert (=> b!616451 m!592627))

(assert (=> b!616451 m!592623))

(declare-fun m!592629 () Bool)

(assert (=> b!616451 m!592629))

(assert (=> b!616451 m!592623))

(declare-fun m!592631 () Bool)

(assert (=> b!616451 m!592631))

(declare-fun m!592633 () Bool)

(assert (=> b!616451 m!592633))

(declare-fun m!592635 () Bool)

(assert (=> b!616449 m!592635))

(declare-fun m!592637 () Bool)

(assert (=> b!616452 m!592637))

(declare-fun m!592639 () Bool)

(assert (=> b!616452 m!592639))

(assert (=> b!616452 m!592623))

(declare-fun m!592641 () Bool)

(assert (=> b!616465 m!592641))

(declare-fun m!592643 () Bool)

(assert (=> b!616470 m!592643))

(assert (=> b!616453 m!592623))

(assert (=> b!616453 m!592623))

(declare-fun m!592645 () Bool)

(assert (=> b!616453 m!592645))

(assert (=> b!616456 m!592623))

(assert (=> b!616456 m!592623))

(declare-fun m!592647 () Bool)

(assert (=> b!616456 m!592647))

(declare-fun m!592649 () Bool)

(assert (=> b!616448 m!592649))

(assert (=> b!616472 m!592623))

(assert (=> b!616472 m!592623))

(declare-fun m!592651 () Bool)

(assert (=> b!616472 m!592651))

(assert (=> b!616463 m!592637))

(declare-fun m!592653 () Bool)

(assert (=> b!616463 m!592653))

(assert (=> b!616460 m!592623))

(declare-fun m!592655 () Bool)

(assert (=> b!616460 m!592655))

(declare-fun m!592657 () Bool)

(assert (=> b!616460 m!592657))

(assert (=> b!616460 m!592623))

(declare-fun m!592659 () Bool)

(assert (=> b!616460 m!592659))

(assert (=> b!616460 m!592623))

(declare-fun m!592661 () Bool)

(assert (=> b!616460 m!592661))

(assert (=> b!616460 m!592623))

(declare-fun m!592663 () Bool)

(assert (=> b!616460 m!592663))

(assert (=> b!616460 m!592633))

(assert (=> b!616460 m!592623))

(assert (=> b!616460 m!592645))

(assert (=> b!616460 m!592621))

(declare-fun m!592665 () Bool)

(assert (=> b!616454 m!592665))

(declare-fun m!592667 () Bool)

(assert (=> b!616459 m!592667))

(declare-fun m!592669 () Bool)

(assert (=> b!616471 m!592669))

(declare-fun m!592671 () Bool)

(assert (=> b!616458 m!592671))

(declare-fun m!592673 () Bool)

(assert (=> b!616458 m!592673))

(assert (=> b!616458 m!592623))

(declare-fun m!592675 () Bool)

(assert (=> b!616458 m!592675))

(assert (=> b!616458 m!592637))

(assert (=> b!616458 m!592623))

(declare-fun m!592677 () Bool)

(assert (=> b!616458 m!592677))

(declare-fun m!592679 () Bool)

(assert (=> b!616458 m!592679))

(declare-fun m!592681 () Bool)

(assert (=> b!616458 m!592681))

(assert (=> b!616455 m!592623))

(assert (=> b!616455 m!592623))

(assert (=> b!616455 m!592651))

(declare-fun m!592683 () Bool)

(assert (=> start!56030 m!592683))

(declare-fun m!592685 () Bool)

(assert (=> start!56030 m!592685))

(declare-fun m!592687 () Bool)

(assert (=> b!616457 m!592687))

(assert (=> b!616457 m!592623))

(assert (=> b!616457 m!592623))

(declare-fun m!592689 () Bool)

(assert (=> b!616457 m!592689))

(push 1)

