; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58976 () Bool)

(assert start!58976)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!650359 () Bool)

(declare-datatypes ((array!38557 0))(
  ( (array!38558 (arr!18483 (Array (_ BitVec 32) (_ BitVec 64))) (size!18847 (_ BitVec 32))) )
))
(declare-fun lt!302140 () array!38557)

(declare-fun e!373116 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38557)

(declare-fun arrayContainsKey!0 (array!38557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650359 (= e!373116 (arrayContainsKey!0 lt!302140 (select (arr!18483 a!2986) j!136) index!984))))

(declare-fun b!650360 () Bool)

(declare-fun res!421552 () Bool)

(declare-fun e!373113 () Bool)

(assert (=> b!650360 (=> (not res!421552) (not e!373113))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!650360 (= res!421552 (and (= (size!18847 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18847 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18847 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650361 () Bool)

(declare-datatypes ((Unit!22164 0))(
  ( (Unit!22165) )
))
(declare-fun e!373111 () Unit!22164)

(declare-fun Unit!22166 () Unit!22164)

(assert (=> b!650361 (= e!373111 Unit!22166)))

(declare-fun b!650362 () Bool)

(declare-fun e!373112 () Bool)

(declare-fun e!373105 () Bool)

(assert (=> b!650362 (= e!373112 e!373105)))

(declare-fun res!421563 () Bool)

(assert (=> b!650362 (=> res!421563 e!373105)))

(declare-fun lt!302152 () (_ BitVec 64))

(declare-fun lt!302136 () (_ BitVec 64))

(assert (=> b!650362 (= res!421563 (or (not (= (select (arr!18483 a!2986) j!136) lt!302152)) (not (= (select (arr!18483 a!2986) j!136) lt!302136)) (bvsge j!136 index!984)))))

(declare-fun b!650363 () Bool)

(declare-fun e!373115 () Unit!22164)

(declare-fun Unit!22167 () Unit!22164)

(assert (=> b!650363 (= e!373115 Unit!22167)))

(declare-fun lt!302148 () Unit!22164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22164)

(assert (=> b!650363 (= lt!302148 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302140 (select (arr!18483 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650363 (arrayContainsKey!0 lt!302140 (select (arr!18483 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!302142 () Unit!22164)

(declare-datatypes ((List!12524 0))(
  ( (Nil!12521) (Cons!12520 (h!13565 (_ BitVec 64)) (t!18752 List!12524)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12524) Unit!22164)

(assert (=> b!650363 (= lt!302142 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12521))))

(declare-fun arrayNoDuplicates!0 (array!38557 (_ BitVec 32) List!12524) Bool)

(assert (=> b!650363 (arrayNoDuplicates!0 lt!302140 #b00000000000000000000000000000000 Nil!12521)))

(declare-fun lt!302137 () Unit!22164)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38557 (_ BitVec 32) (_ BitVec 32)) Unit!22164)

(assert (=> b!650363 (= lt!302137 (lemmaNoDuplicateFromThenFromBigger!0 lt!302140 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650363 (arrayNoDuplicates!0 lt!302140 j!136 Nil!12521)))

(declare-fun lt!302151 () Unit!22164)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38557 (_ BitVec 64) (_ BitVec 32) List!12524) Unit!22164)

(assert (=> b!650363 (= lt!302151 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302140 (select (arr!18483 a!2986) j!136) j!136 Nil!12521))))

(assert (=> b!650363 false))

(declare-fun res!421553 () Bool)

(assert (=> start!58976 (=> (not res!421553) (not e!373113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58976 (= res!421553 (validMask!0 mask!3053))))

(assert (=> start!58976 e!373113))

(assert (=> start!58976 true))

(declare-fun array_inv!14279 (array!38557) Bool)

(assert (=> start!58976 (array_inv!14279 a!2986)))

(declare-fun b!650364 () Bool)

(declare-fun res!421549 () Bool)

(declare-fun e!373108 () Bool)

(assert (=> b!650364 (=> (not res!421549) (not e!373108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38557 (_ BitVec 32)) Bool)

(assert (=> b!650364 (= res!421549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650365 () Bool)

(declare-fun e!373109 () Bool)

(declare-fun e!373104 () Bool)

(assert (=> b!650365 (= e!373109 e!373104)))

(declare-fun res!421548 () Bool)

(assert (=> b!650365 (=> (not res!421548) (not e!373104))))

(declare-datatypes ((SeekEntryResult!6923 0))(
  ( (MissingZero!6923 (index!30042 (_ BitVec 32))) (Found!6923 (index!30043 (_ BitVec 32))) (Intermediate!6923 (undefined!7735 Bool) (index!30044 (_ BitVec 32)) (x!58833 (_ BitVec 32))) (Undefined!6923) (MissingVacant!6923 (index!30045 (_ BitVec 32))) )
))
(declare-fun lt!302138 () SeekEntryResult!6923)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!650365 (= res!421548 (and (= lt!302138 (Found!6923 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18483 a!2986) index!984) (select (arr!18483 a!2986) j!136))) (not (= (select (arr!18483 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38557 (_ BitVec 32)) SeekEntryResult!6923)

(assert (=> b!650365 (= lt!302138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18483 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650366 () Bool)

(declare-fun e!373106 () Bool)

(declare-fun lt!302143 () SeekEntryResult!6923)

(assert (=> b!650366 (= e!373106 (= lt!302138 lt!302143))))

(declare-fun b!650367 () Bool)

(declare-fun res!421554 () Bool)

(assert (=> b!650367 (=> (not res!421554) (not e!373108))))

(assert (=> b!650367 (= res!421554 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12521))))

(declare-fun b!650368 () Bool)

(assert (=> b!650368 (= e!373113 e!373108)))

(declare-fun res!421564 () Bool)

(assert (=> b!650368 (=> (not res!421564) (not e!373108))))

(declare-fun lt!302150 () SeekEntryResult!6923)

(assert (=> b!650368 (= res!421564 (or (= lt!302150 (MissingZero!6923 i!1108)) (= lt!302150 (MissingVacant!6923 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38557 (_ BitVec 32)) SeekEntryResult!6923)

(assert (=> b!650368 (= lt!302150 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!650369 () Bool)

(declare-fun e!373107 () Bool)

(assert (=> b!650369 (= e!373107 (arrayContainsKey!0 lt!302140 (select (arr!18483 a!2986) j!136) index!984))))

(declare-fun b!650370 () Bool)

(declare-fun res!421547 () Bool)

(assert (=> b!650370 (=> (not res!421547) (not e!373108))))

(assert (=> b!650370 (= res!421547 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18483 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650371 () Bool)

(declare-fun Unit!22168 () Unit!22164)

(assert (=> b!650371 (= e!373115 Unit!22168)))

(declare-fun b!650372 () Bool)

(declare-fun e!373114 () Bool)

(assert (=> b!650372 (= e!373114 true)))

(assert (=> b!650372 (arrayNoDuplicates!0 lt!302140 #b00000000000000000000000000000000 Nil!12521)))

(declare-fun lt!302144 () Unit!22164)

(assert (=> b!650372 (= lt!302144 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12521))))

(assert (=> b!650372 (arrayContainsKey!0 lt!302140 (select (arr!18483 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302149 () Unit!22164)

(assert (=> b!650372 (= lt!302149 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302140 (select (arr!18483 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!650372 e!373107))

(declare-fun res!421555 () Bool)

(assert (=> b!650372 (=> (not res!421555) (not e!373107))))

(assert (=> b!650372 (= res!421555 (arrayContainsKey!0 lt!302140 (select (arr!18483 a!2986) j!136) j!136))))

(declare-fun b!650373 () Bool)

(declare-fun e!373102 () Bool)

(declare-fun e!373110 () Bool)

(assert (=> b!650373 (= e!373102 e!373110)))

(declare-fun res!421561 () Bool)

(assert (=> b!650373 (=> res!421561 e!373110)))

(assert (=> b!650373 (= res!421561 (or (not (= (select (arr!18483 a!2986) j!136) lt!302152)) (not (= (select (arr!18483 a!2986) j!136) lt!302136))))))

(assert (=> b!650373 e!373112))

(declare-fun res!421562 () Bool)

(assert (=> b!650373 (=> (not res!421562) (not e!373112))))

(assert (=> b!650373 (= res!421562 (= lt!302136 (select (arr!18483 a!2986) j!136)))))

(assert (=> b!650373 (= lt!302136 (select (store (arr!18483 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!650374 () Bool)

(declare-fun res!421551 () Bool)

(assert (=> b!650374 (=> (not res!421551) (not e!373113))))

(assert (=> b!650374 (= res!421551 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650375 () Bool)

(declare-fun res!421560 () Bool)

(assert (=> b!650375 (=> (not res!421560) (not e!373113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650375 (= res!421560 (validKeyInArray!0 k!1786))))

(declare-fun b!650376 () Bool)

(assert (=> b!650376 (= e!373110 e!373114)))

(declare-fun res!421558 () Bool)

(assert (=> b!650376 (=> res!421558 e!373114)))

(assert (=> b!650376 (= res!421558 (bvsge index!984 j!136))))

(declare-fun lt!302145 () Unit!22164)

(assert (=> b!650376 (= lt!302145 e!373115)))

(declare-fun c!74773 () Bool)

(assert (=> b!650376 (= c!74773 (bvslt j!136 index!984))))

(declare-fun b!650377 () Bool)

(declare-fun Unit!22169 () Unit!22164)

(assert (=> b!650377 (= e!373111 Unit!22169)))

(assert (=> b!650377 false))

(declare-fun b!650378 () Bool)

(assert (=> b!650378 (= e!373105 e!373116)))

(declare-fun res!421556 () Bool)

(assert (=> b!650378 (=> (not res!421556) (not e!373116))))

(assert (=> b!650378 (= res!421556 (arrayContainsKey!0 lt!302140 (select (arr!18483 a!2986) j!136) j!136))))

(declare-fun b!650379 () Bool)

(assert (=> b!650379 (= e!373108 e!373109)))

(declare-fun res!421550 () Bool)

(assert (=> b!650379 (=> (not res!421550) (not e!373109))))

(assert (=> b!650379 (= res!421550 (= (select (store (arr!18483 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650379 (= lt!302140 (array!38558 (store (arr!18483 a!2986) i!1108 k!1786) (size!18847 a!2986)))))

(declare-fun b!650380 () Bool)

(declare-fun res!421557 () Bool)

(assert (=> b!650380 (=> (not res!421557) (not e!373113))))

(assert (=> b!650380 (= res!421557 (validKeyInArray!0 (select (arr!18483 a!2986) j!136)))))

(declare-fun b!650381 () Bool)

(assert (=> b!650381 (= e!373104 (not e!373102))))

(declare-fun res!421565 () Bool)

(assert (=> b!650381 (=> res!421565 e!373102)))

(declare-fun lt!302141 () SeekEntryResult!6923)

(assert (=> b!650381 (= res!421565 (not (= lt!302141 (Found!6923 index!984))))))

(declare-fun lt!302146 () Unit!22164)

(assert (=> b!650381 (= lt!302146 e!373111)))

(declare-fun c!74774 () Bool)

(assert (=> b!650381 (= c!74774 (= lt!302141 Undefined!6923))))

(assert (=> b!650381 (= lt!302141 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302152 lt!302140 mask!3053))))

(assert (=> b!650381 e!373106))

(declare-fun res!421559 () Bool)

(assert (=> b!650381 (=> (not res!421559) (not e!373106))))

(declare-fun lt!302147 () (_ BitVec 32))

(assert (=> b!650381 (= res!421559 (= lt!302143 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302147 vacantSpotIndex!68 lt!302152 lt!302140 mask!3053)))))

(assert (=> b!650381 (= lt!302143 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302147 vacantSpotIndex!68 (select (arr!18483 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650381 (= lt!302152 (select (store (arr!18483 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302139 () Unit!22164)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38557 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22164)

(assert (=> b!650381 (= lt!302139 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302147 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650381 (= lt!302147 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!58976 res!421553) b!650360))

(assert (= (and b!650360 res!421552) b!650380))

(assert (= (and b!650380 res!421557) b!650375))

(assert (= (and b!650375 res!421560) b!650374))

(assert (= (and b!650374 res!421551) b!650368))

(assert (= (and b!650368 res!421564) b!650364))

(assert (= (and b!650364 res!421549) b!650367))

(assert (= (and b!650367 res!421554) b!650370))

(assert (= (and b!650370 res!421547) b!650379))

(assert (= (and b!650379 res!421550) b!650365))

(assert (= (and b!650365 res!421548) b!650381))

(assert (= (and b!650381 res!421559) b!650366))

(assert (= (and b!650381 c!74774) b!650377))

(assert (= (and b!650381 (not c!74774)) b!650361))

(assert (= (and b!650381 (not res!421565)) b!650373))

(assert (= (and b!650373 res!421562) b!650362))

(assert (= (and b!650362 (not res!421563)) b!650378))

(assert (= (and b!650378 res!421556) b!650359))

(assert (= (and b!650373 (not res!421561)) b!650376))

(assert (= (and b!650376 c!74773) b!650363))

(assert (= (and b!650376 (not c!74773)) b!650371))

(assert (= (and b!650376 (not res!421558)) b!650372))

(assert (= (and b!650372 res!421555) b!650369))

(declare-fun m!623567 () Bool)

(assert (=> b!650373 m!623567))

(declare-fun m!623569 () Bool)

(assert (=> b!650373 m!623569))

(declare-fun m!623571 () Bool)

(assert (=> b!650373 m!623571))

(declare-fun m!623573 () Bool)

(assert (=> b!650375 m!623573))

(assert (=> b!650380 m!623567))

(assert (=> b!650380 m!623567))

(declare-fun m!623575 () Bool)

(assert (=> b!650380 m!623575))

(declare-fun m!623577 () Bool)

(assert (=> b!650370 m!623577))

(declare-fun m!623579 () Bool)

(assert (=> b!650365 m!623579))

(assert (=> b!650365 m!623567))

(assert (=> b!650365 m!623567))

(declare-fun m!623581 () Bool)

(assert (=> b!650365 m!623581))

(declare-fun m!623583 () Bool)

(assert (=> b!650374 m!623583))

(assert (=> b!650359 m!623567))

(assert (=> b!650359 m!623567))

(declare-fun m!623585 () Bool)

(assert (=> b!650359 m!623585))

(declare-fun m!623587 () Bool)

(assert (=> b!650363 m!623587))

(assert (=> b!650363 m!623567))

(declare-fun m!623589 () Bool)

(assert (=> b!650363 m!623589))

(declare-fun m!623591 () Bool)

(assert (=> b!650363 m!623591))

(assert (=> b!650363 m!623567))

(declare-fun m!623593 () Bool)

(assert (=> b!650363 m!623593))

(declare-fun m!623595 () Bool)

(assert (=> b!650363 m!623595))

(declare-fun m!623597 () Bool)

(assert (=> b!650363 m!623597))

(assert (=> b!650363 m!623567))

(assert (=> b!650363 m!623567))

(declare-fun m!623599 () Bool)

(assert (=> b!650363 m!623599))

(declare-fun m!623601 () Bool)

(assert (=> b!650367 m!623601))

(assert (=> b!650378 m!623567))

(assert (=> b!650378 m!623567))

(declare-fun m!623603 () Bool)

(assert (=> b!650378 m!623603))

(assert (=> b!650362 m!623567))

(declare-fun m!623605 () Bool)

(assert (=> start!58976 m!623605))

(declare-fun m!623607 () Bool)

(assert (=> start!58976 m!623607))

(declare-fun m!623609 () Bool)

(assert (=> b!650381 m!623609))

(declare-fun m!623611 () Bool)

(assert (=> b!650381 m!623611))

(assert (=> b!650381 m!623567))

(assert (=> b!650381 m!623569))

(declare-fun m!623613 () Bool)

(assert (=> b!650381 m!623613))

(declare-fun m!623615 () Bool)

(assert (=> b!650381 m!623615))

(declare-fun m!623617 () Bool)

(assert (=> b!650381 m!623617))

(assert (=> b!650381 m!623567))

(declare-fun m!623619 () Bool)

(assert (=> b!650381 m!623619))

(assert (=> b!650369 m!623567))

(assert (=> b!650369 m!623567))

(assert (=> b!650369 m!623585))

(declare-fun m!623621 () Bool)

(assert (=> b!650364 m!623621))

(assert (=> b!650372 m!623587))

(assert (=> b!650372 m!623567))

(assert (=> b!650372 m!623603))

(assert (=> b!650372 m!623567))

(declare-fun m!623623 () Bool)

(assert (=> b!650372 m!623623))

(assert (=> b!650372 m!623567))

(assert (=> b!650372 m!623567))

(declare-fun m!623625 () Bool)

(assert (=> b!650372 m!623625))

(assert (=> b!650372 m!623597))

(declare-fun m!623627 () Bool)

(assert (=> b!650368 m!623627))

(assert (=> b!650379 m!623569))

(declare-fun m!623629 () Bool)

(assert (=> b!650379 m!623629))

(push 1)

