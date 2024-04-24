; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56262 () Bool)

(assert start!56262)

(declare-fun res!401707 () Bool)

(declare-fun e!357563 () Bool)

(assert (=> start!56262 (=> (not res!401707) (not e!357563))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56262 (= res!401707 (validMask!0 mask!3053))))

(assert (=> start!56262 e!357563))

(assert (=> start!56262 true))

(declare-datatypes ((array!37677 0))(
  ( (array!37678 (arr!18082 (Array (_ BitVec 32) (_ BitVec 64))) (size!18446 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37677)

(declare-fun array_inv!13941 (array!37677) Bool)

(assert (=> start!56262 (array_inv!13941 a!2986)))

(declare-fun b!623354 () Bool)

(declare-fun e!357564 () Bool)

(declare-datatypes ((SeekEntryResult!6478 0))(
  ( (MissingZero!6478 (index!28196 (_ BitVec 32))) (Found!6478 (index!28197 (_ BitVec 32))) (Intermediate!6478 (undefined!7290 Bool) (index!28198 (_ BitVec 32)) (x!57113 (_ BitVec 32))) (Undefined!6478) (MissingVacant!6478 (index!28199 (_ BitVec 32))) )
))
(declare-fun lt!289096 () SeekEntryResult!6478)

(declare-fun lt!289090 () SeekEntryResult!6478)

(assert (=> b!623354 (= e!357564 (= lt!289096 lt!289090))))

(declare-fun b!623355 () Bool)

(declare-fun res!401709 () Bool)

(declare-fun e!357556 () Bool)

(assert (=> b!623355 (=> (not res!401709) (not e!357556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37677 (_ BitVec 32)) Bool)

(assert (=> b!623355 (= res!401709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623356 () Bool)

(assert (=> b!623356 (= e!357563 e!357556)))

(declare-fun res!401713 () Bool)

(assert (=> b!623356 (=> (not res!401713) (not e!357556))))

(declare-fun lt!289098 () SeekEntryResult!6478)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623356 (= res!401713 (or (= lt!289098 (MissingZero!6478 i!1108)) (= lt!289098 (MissingVacant!6478 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37677 (_ BitVec 32)) SeekEntryResult!6478)

(assert (=> b!623356 (= lt!289098 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623357 () Bool)

(declare-datatypes ((Unit!20977 0))(
  ( (Unit!20978) )
))
(declare-fun e!357559 () Unit!20977)

(declare-fun Unit!20979 () Unit!20977)

(assert (=> b!623357 (= e!357559 Unit!20979)))

(declare-fun b!623358 () Bool)

(declare-fun e!357566 () Unit!20977)

(declare-fun Unit!20980 () Unit!20977)

(assert (=> b!623358 (= e!357566 Unit!20980)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!401721 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623358 (= res!401721 (= (select (store (arr!18082 a!2986) i!1108 k0!1786) index!984) (select (arr!18082 a!2986) j!136)))))

(declare-fun e!357558 () Bool)

(assert (=> b!623358 (=> (not res!401721) (not e!357558))))

(assert (=> b!623358 e!357558))

(declare-fun c!71193 () Bool)

(assert (=> b!623358 (= c!71193 (bvslt j!136 index!984))))

(declare-fun lt!289080 () Unit!20977)

(declare-fun e!357560 () Unit!20977)

(assert (=> b!623358 (= lt!289080 e!357560)))

(declare-fun c!71194 () Bool)

(assert (=> b!623358 (= c!71194 (bvslt index!984 j!136))))

(declare-fun lt!289094 () Unit!20977)

(declare-fun e!357565 () Unit!20977)

(assert (=> b!623358 (= lt!289094 e!357565)))

(assert (=> b!623358 false))

(declare-fun b!623359 () Bool)

(declare-fun res!401715 () Bool)

(assert (=> b!623359 (=> (not res!401715) (not e!357556))))

(declare-datatypes ((List!12030 0))(
  ( (Nil!12027) (Cons!12026 (h!13074 (_ BitVec 64)) (t!18250 List!12030)) )
))
(declare-fun arrayNoDuplicates!0 (array!37677 (_ BitVec 32) List!12030) Bool)

(assert (=> b!623359 (= res!401715 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12027))))

(declare-fun b!623360 () Bool)

(declare-fun res!401719 () Bool)

(assert (=> b!623360 (= res!401719 (bvsge j!136 index!984))))

(declare-fun e!357554 () Bool)

(assert (=> b!623360 (=> res!401719 e!357554)))

(assert (=> b!623360 (= e!357558 e!357554)))

(declare-fun b!623361 () Bool)

(declare-fun res!401712 () Bool)

(assert (=> b!623361 (=> (not res!401712) (not e!357563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623361 (= res!401712 (validKeyInArray!0 k0!1786))))

(declare-fun b!623362 () Bool)

(declare-fun e!357557 () Bool)

(assert (=> b!623362 (= e!357556 e!357557)))

(declare-fun res!401714 () Bool)

(assert (=> b!623362 (=> (not res!401714) (not e!357557))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!623362 (= res!401714 (= (select (store (arr!18082 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!289082 () array!37677)

(assert (=> b!623362 (= lt!289082 (array!37678 (store (arr!18082 a!2986) i!1108 k0!1786) (size!18446 a!2986)))))

(declare-fun b!623363 () Bool)

(declare-fun e!357561 () Bool)

(assert (=> b!623363 (= e!357557 e!357561)))

(declare-fun res!401722 () Bool)

(assert (=> b!623363 (=> (not res!401722) (not e!357561))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!623363 (= res!401722 (and (= lt!289096 (Found!6478 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18082 a!2986) index!984) (select (arr!18082 a!2986) j!136))) (not (= (select (arr!18082 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37677 (_ BitVec 32)) SeekEntryResult!6478)

(assert (=> b!623363 (= lt!289096 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18082 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623364 () Bool)

(assert (=> b!623364 (= e!357561 (not true))))

(declare-fun lt!289086 () Unit!20977)

(assert (=> b!623364 (= lt!289086 e!357566)))

(declare-fun c!71192 () Bool)

(declare-fun lt!289088 () SeekEntryResult!6478)

(assert (=> b!623364 (= c!71192 (= lt!289088 (Found!6478 index!984)))))

(declare-fun lt!289081 () Unit!20977)

(assert (=> b!623364 (= lt!289081 e!357559)))

(declare-fun c!71195 () Bool)

(assert (=> b!623364 (= c!71195 (= lt!289088 Undefined!6478))))

(declare-fun lt!289087 () (_ BitVec 64))

(assert (=> b!623364 (= lt!289088 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289087 lt!289082 mask!3053))))

(assert (=> b!623364 e!357564))

(declare-fun res!401717 () Bool)

(assert (=> b!623364 (=> (not res!401717) (not e!357564))))

(declare-fun lt!289091 () (_ BitVec 32))

(assert (=> b!623364 (= res!401717 (= lt!289090 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289091 vacantSpotIndex!68 lt!289087 lt!289082 mask!3053)))))

(assert (=> b!623364 (= lt!289090 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289091 vacantSpotIndex!68 (select (arr!18082 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623364 (= lt!289087 (select (store (arr!18082 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289097 () Unit!20977)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37677 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20977)

(assert (=> b!623364 (= lt!289097 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289091 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623364 (= lt!289091 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!623365 () Bool)

(assert (=> b!623365 false))

(declare-fun lt!289095 () Unit!20977)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37677 (_ BitVec 64) (_ BitVec 32) List!12030) Unit!20977)

(assert (=> b!623365 (= lt!289095 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289082 (select (arr!18082 a!2986) j!136) index!984 Nil!12027))))

(assert (=> b!623365 (arrayNoDuplicates!0 lt!289082 index!984 Nil!12027)))

(declare-fun lt!289093 () Unit!20977)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37677 (_ BitVec 32) (_ BitVec 32)) Unit!20977)

(assert (=> b!623365 (= lt!289093 (lemmaNoDuplicateFromThenFromBigger!0 lt!289082 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623365 (arrayNoDuplicates!0 lt!289082 #b00000000000000000000000000000000 Nil!12027)))

(declare-fun lt!289092 () Unit!20977)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12030) Unit!20977)

(assert (=> b!623365 (= lt!289092 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12027))))

(declare-fun arrayContainsKey!0 (array!37677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623365 (arrayContainsKey!0 lt!289082 (select (arr!18082 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!289084 () Unit!20977)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20977)

(assert (=> b!623365 (= lt!289084 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289082 (select (arr!18082 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357555 () Bool)

(assert (=> b!623365 e!357555))

(declare-fun res!401710 () Bool)

(assert (=> b!623365 (=> (not res!401710) (not e!357555))))

(assert (=> b!623365 (= res!401710 (arrayContainsKey!0 lt!289082 (select (arr!18082 a!2986) j!136) j!136))))

(declare-fun Unit!20981 () Unit!20977)

(assert (=> b!623365 (= e!357565 Unit!20981)))

(declare-fun b!623366 () Bool)

(declare-fun e!357562 () Bool)

(assert (=> b!623366 (= e!357562 (arrayContainsKey!0 lt!289082 (select (arr!18082 a!2986) j!136) index!984))))

(declare-fun res!401718 () Bool)

(declare-fun b!623367 () Bool)

(assert (=> b!623367 (= res!401718 (arrayContainsKey!0 lt!289082 (select (arr!18082 a!2986) j!136) j!136))))

(assert (=> b!623367 (=> (not res!401718) (not e!357562))))

(assert (=> b!623367 (= e!357554 e!357562)))

(declare-fun b!623368 () Bool)

(declare-fun res!401720 () Bool)

(assert (=> b!623368 (=> (not res!401720) (not e!357563))))

(assert (=> b!623368 (= res!401720 (validKeyInArray!0 (select (arr!18082 a!2986) j!136)))))

(declare-fun b!623369 () Bool)

(assert (=> b!623369 (= e!357555 (arrayContainsKey!0 lt!289082 (select (arr!18082 a!2986) j!136) index!984))))

(declare-fun b!623370 () Bool)

(declare-fun res!401716 () Bool)

(assert (=> b!623370 (=> (not res!401716) (not e!357563))))

(assert (=> b!623370 (= res!401716 (and (= (size!18446 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18446 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18446 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623371 () Bool)

(declare-fun Unit!20982 () Unit!20977)

(assert (=> b!623371 (= e!357565 Unit!20982)))

(declare-fun b!623372 () Bool)

(declare-fun Unit!20983 () Unit!20977)

(assert (=> b!623372 (= e!357560 Unit!20983)))

(declare-fun b!623373 () Bool)

(declare-fun Unit!20984 () Unit!20977)

(assert (=> b!623373 (= e!357559 Unit!20984)))

(assert (=> b!623373 false))

(declare-fun b!623374 () Bool)

(assert (=> b!623374 false))

(declare-fun lt!289085 () Unit!20977)

(assert (=> b!623374 (= lt!289085 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289082 (select (arr!18082 a!2986) j!136) j!136 Nil!12027))))

(assert (=> b!623374 (arrayNoDuplicates!0 lt!289082 j!136 Nil!12027)))

(declare-fun lt!289089 () Unit!20977)

(assert (=> b!623374 (= lt!289089 (lemmaNoDuplicateFromThenFromBigger!0 lt!289082 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623374 (arrayNoDuplicates!0 lt!289082 #b00000000000000000000000000000000 Nil!12027)))

(declare-fun lt!289083 () Unit!20977)

(assert (=> b!623374 (= lt!289083 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12027))))

(assert (=> b!623374 (arrayContainsKey!0 lt!289082 (select (arr!18082 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!289099 () Unit!20977)

(assert (=> b!623374 (= lt!289099 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289082 (select (arr!18082 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20985 () Unit!20977)

(assert (=> b!623374 (= e!357560 Unit!20985)))

(declare-fun b!623375 () Bool)

(declare-fun res!401708 () Bool)

(assert (=> b!623375 (=> (not res!401708) (not e!357563))))

(assert (=> b!623375 (= res!401708 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623376 () Bool)

(declare-fun res!401711 () Bool)

(assert (=> b!623376 (=> (not res!401711) (not e!357556))))

(assert (=> b!623376 (= res!401711 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18082 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623377 () Bool)

(declare-fun Unit!20986 () Unit!20977)

(assert (=> b!623377 (= e!357566 Unit!20986)))

(assert (= (and start!56262 res!401707) b!623370))

(assert (= (and b!623370 res!401716) b!623368))

(assert (= (and b!623368 res!401720) b!623361))

(assert (= (and b!623361 res!401712) b!623375))

(assert (= (and b!623375 res!401708) b!623356))

(assert (= (and b!623356 res!401713) b!623355))

(assert (= (and b!623355 res!401709) b!623359))

(assert (= (and b!623359 res!401715) b!623376))

(assert (= (and b!623376 res!401711) b!623362))

(assert (= (and b!623362 res!401714) b!623363))

(assert (= (and b!623363 res!401722) b!623364))

(assert (= (and b!623364 res!401717) b!623354))

(assert (= (and b!623364 c!71195) b!623373))

(assert (= (and b!623364 (not c!71195)) b!623357))

(assert (= (and b!623364 c!71192) b!623358))

(assert (= (and b!623364 (not c!71192)) b!623377))

(assert (= (and b!623358 res!401721) b!623360))

(assert (= (and b!623360 (not res!401719)) b!623367))

(assert (= (and b!623367 res!401718) b!623366))

(assert (= (and b!623358 c!71193) b!623374))

(assert (= (and b!623358 (not c!71193)) b!623372))

(assert (= (and b!623358 c!71194) b!623365))

(assert (= (and b!623358 (not c!71194)) b!623371))

(assert (= (and b!623365 res!401710) b!623369))

(declare-fun m!599477 () Bool)

(assert (=> b!623361 m!599477))

(declare-fun m!599479 () Bool)

(assert (=> start!56262 m!599479))

(declare-fun m!599481 () Bool)

(assert (=> start!56262 m!599481))

(declare-fun m!599483 () Bool)

(assert (=> b!623364 m!599483))

(declare-fun m!599485 () Bool)

(assert (=> b!623364 m!599485))

(declare-fun m!599487 () Bool)

(assert (=> b!623364 m!599487))

(declare-fun m!599489 () Bool)

(assert (=> b!623364 m!599489))

(assert (=> b!623364 m!599487))

(declare-fun m!599491 () Bool)

(assert (=> b!623364 m!599491))

(declare-fun m!599493 () Bool)

(assert (=> b!623364 m!599493))

(declare-fun m!599495 () Bool)

(assert (=> b!623364 m!599495))

(declare-fun m!599497 () Bool)

(assert (=> b!623364 m!599497))

(assert (=> b!623369 m!599487))

(assert (=> b!623369 m!599487))

(declare-fun m!599499 () Bool)

(assert (=> b!623369 m!599499))

(declare-fun m!599501 () Bool)

(assert (=> b!623376 m!599501))

(assert (=> b!623367 m!599487))

(assert (=> b!623367 m!599487))

(declare-fun m!599503 () Bool)

(assert (=> b!623367 m!599503))

(assert (=> b!623366 m!599487))

(assert (=> b!623366 m!599487))

(assert (=> b!623366 m!599499))

(declare-fun m!599505 () Bool)

(assert (=> b!623355 m!599505))

(assert (=> b!623368 m!599487))

(assert (=> b!623368 m!599487))

(declare-fun m!599507 () Bool)

(assert (=> b!623368 m!599507))

(declare-fun m!599509 () Bool)

(assert (=> b!623375 m!599509))

(assert (=> b!623374 m!599487))

(declare-fun m!599511 () Bool)

(assert (=> b!623374 m!599511))

(declare-fun m!599513 () Bool)

(assert (=> b!623374 m!599513))

(assert (=> b!623374 m!599487))

(assert (=> b!623374 m!599487))

(declare-fun m!599515 () Bool)

(assert (=> b!623374 m!599515))

(assert (=> b!623374 m!599487))

(declare-fun m!599517 () Bool)

(assert (=> b!623374 m!599517))

(declare-fun m!599519 () Bool)

(assert (=> b!623374 m!599519))

(declare-fun m!599521 () Bool)

(assert (=> b!623374 m!599521))

(declare-fun m!599523 () Bool)

(assert (=> b!623374 m!599523))

(declare-fun m!599525 () Bool)

(assert (=> b!623356 m!599525))

(declare-fun m!599527 () Bool)

(assert (=> b!623363 m!599527))

(assert (=> b!623363 m!599487))

(assert (=> b!623363 m!599487))

(declare-fun m!599529 () Bool)

(assert (=> b!623363 m!599529))

(assert (=> b!623362 m!599491))

(declare-fun m!599531 () Bool)

(assert (=> b!623362 m!599531))

(assert (=> b!623358 m!599491))

(declare-fun m!599533 () Bool)

(assert (=> b!623358 m!599533))

(assert (=> b!623358 m!599487))

(assert (=> b!623365 m!599487))

(assert (=> b!623365 m!599503))

(declare-fun m!599535 () Bool)

(assert (=> b!623365 m!599535))

(declare-fun m!599537 () Bool)

(assert (=> b!623365 m!599537))

(assert (=> b!623365 m!599513))

(assert (=> b!623365 m!599487))

(assert (=> b!623365 m!599487))

(declare-fun m!599539 () Bool)

(assert (=> b!623365 m!599539))

(assert (=> b!623365 m!599487))

(declare-fun m!599541 () Bool)

(assert (=> b!623365 m!599541))

(assert (=> b!623365 m!599487))

(declare-fun m!599543 () Bool)

(assert (=> b!623365 m!599543))

(assert (=> b!623365 m!599523))

(declare-fun m!599545 () Bool)

(assert (=> b!623359 m!599545))

(check-sat (not b!623359) (not b!623366) (not start!56262) (not b!623356) (not b!623365) (not b!623363) (not b!623375) (not b!623361) (not b!623374) (not b!623369) (not b!623355) (not b!623368) (not b!623364) (not b!623367))
(check-sat)
