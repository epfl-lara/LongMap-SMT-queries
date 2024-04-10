; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56136 () Bool)

(assert start!56136)

(declare-fun b!620409 () Bool)

(declare-datatypes ((Unit!20618 0))(
  ( (Unit!20619) )
))
(declare-fun e!355841 () Unit!20618)

(declare-fun Unit!20620 () Unit!20618)

(assert (=> b!620409 (= e!355841 Unit!20620)))

(declare-fun b!620410 () Bool)

(declare-fun res!399794 () Bool)

(declare-fun e!355838 () Bool)

(assert (=> b!620410 (=> (not res!399794) (not e!355838))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37606 0))(
  ( (array!37607 (arr!18049 (Array (_ BitVec 32) (_ BitVec 64))) (size!18413 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37606)

(assert (=> b!620410 (= res!399794 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18049 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620411 () Bool)

(declare-fun e!355840 () Bool)

(assert (=> b!620411 (= e!355840 e!355838)))

(declare-fun res!399793 () Bool)

(assert (=> b!620411 (=> (not res!399793) (not e!355838))))

(declare-datatypes ((SeekEntryResult!6489 0))(
  ( (MissingZero!6489 (index!28240 (_ BitVec 32))) (Found!6489 (index!28241 (_ BitVec 32))) (Intermediate!6489 (undefined!7301 Bool) (index!28242 (_ BitVec 32)) (x!57017 (_ BitVec 32))) (Undefined!6489) (MissingVacant!6489 (index!28243 (_ BitVec 32))) )
))
(declare-fun lt!286704 () SeekEntryResult!6489)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!620411 (= res!399793 (or (= lt!286704 (MissingZero!6489 i!1108)) (= lt!286704 (MissingVacant!6489 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37606 (_ BitVec 32)) SeekEntryResult!6489)

(assert (=> b!620411 (= lt!286704 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620412 () Bool)

(declare-fun e!355833 () Bool)

(declare-fun lt!286708 () SeekEntryResult!6489)

(declare-fun lt!286705 () SeekEntryResult!6489)

(assert (=> b!620412 (= e!355833 (= lt!286708 lt!286705))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!399791 () Bool)

(declare-fun lt!286702 () array!37606)

(declare-fun b!620413 () Bool)

(declare-fun arrayContainsKey!0 (array!37606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620413 (= res!399791 (arrayContainsKey!0 lt!286702 (select (arr!18049 a!2986) j!136) j!136))))

(declare-fun e!355837 () Bool)

(assert (=> b!620413 (=> (not res!399791) (not e!355837))))

(declare-fun e!355829 () Bool)

(assert (=> b!620413 (= e!355829 e!355837)))

(declare-fun b!620414 () Bool)

(declare-fun e!355842 () Unit!20618)

(declare-fun Unit!20621 () Unit!20618)

(assert (=> b!620414 (= e!355842 Unit!20621)))

(assert (=> b!620414 false))

(declare-fun b!620416 () Bool)

(declare-fun e!355839 () Unit!20618)

(declare-fun Unit!20622 () Unit!20618)

(assert (=> b!620416 (= e!355839 Unit!20622)))

(declare-fun b!620417 () Bool)

(declare-fun res!399779 () Bool)

(assert (=> b!620417 (=> (not res!399779) (not e!355840))))

(assert (=> b!620417 (= res!399779 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620418 () Bool)

(declare-fun e!355832 () Bool)

(declare-fun e!355831 () Bool)

(assert (=> b!620418 (= e!355832 e!355831)))

(declare-fun res!399780 () Bool)

(assert (=> b!620418 (=> (not res!399780) (not e!355831))))

(assert (=> b!620418 (= res!399780 (and (= lt!286708 (Found!6489 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18049 a!2986) index!984) (select (arr!18049 a!2986) j!136))) (not (= (select (arr!18049 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37606 (_ BitVec 32)) SeekEntryResult!6489)

(assert (=> b!620418 (= lt!286708 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18049 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620419 () Bool)

(declare-fun res!399786 () Bool)

(assert (=> b!620419 (=> (not res!399786) (not e!355838))))

(declare-datatypes ((List!12090 0))(
  ( (Nil!12087) (Cons!12086 (h!13131 (_ BitVec 64)) (t!18318 List!12090)) )
))
(declare-fun arrayNoDuplicates!0 (array!37606 (_ BitVec 32) List!12090) Bool)

(assert (=> b!620419 (= res!399786 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12087))))

(declare-fun b!620420 () Bool)

(declare-fun res!399788 () Bool)

(assert (=> b!620420 (= res!399788 (bvsge j!136 index!984))))

(assert (=> b!620420 (=> res!399788 e!355829)))

(declare-fun e!355830 () Bool)

(assert (=> b!620420 (= e!355830 e!355829)))

(declare-fun b!620421 () Bool)

(declare-fun Unit!20623 () Unit!20618)

(assert (=> b!620421 (= e!355841 Unit!20623)))

(declare-fun res!399790 () Bool)

(assert (=> b!620421 (= res!399790 (= (select (store (arr!18049 a!2986) i!1108 k0!1786) index!984) (select (arr!18049 a!2986) j!136)))))

(assert (=> b!620421 (=> (not res!399790) (not e!355830))))

(assert (=> b!620421 e!355830))

(declare-fun c!70684 () Bool)

(assert (=> b!620421 (= c!70684 (bvslt j!136 index!984))))

(declare-fun lt!286701 () Unit!20618)

(assert (=> b!620421 (= lt!286701 e!355839)))

(declare-fun c!70683 () Bool)

(assert (=> b!620421 (= c!70683 (bvslt index!984 j!136))))

(declare-fun lt!286716 () Unit!20618)

(declare-fun e!355835 () Unit!20618)

(assert (=> b!620421 (= lt!286716 e!355835)))

(assert (=> b!620421 false))

(declare-fun e!355834 () Bool)

(declare-fun b!620422 () Bool)

(assert (=> b!620422 (= e!355834 (arrayContainsKey!0 lt!286702 (select (arr!18049 a!2986) j!136) index!984))))

(declare-fun b!620423 () Bool)

(declare-fun Unit!20624 () Unit!20618)

(assert (=> b!620423 (= e!355835 Unit!20624)))

(declare-fun b!620424 () Bool)

(declare-fun lt!286703 () SeekEntryResult!6489)

(assert (=> b!620424 (= e!355831 (not (or (= lt!286703 (MissingVacant!6489 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!286698 () Unit!20618)

(assert (=> b!620424 (= lt!286698 e!355841)))

(declare-fun c!70682 () Bool)

(assert (=> b!620424 (= c!70682 (= lt!286703 (Found!6489 index!984)))))

(declare-fun lt!286709 () Unit!20618)

(assert (=> b!620424 (= lt!286709 e!355842)))

(declare-fun c!70685 () Bool)

(assert (=> b!620424 (= c!70685 (= lt!286703 Undefined!6489))))

(declare-fun lt!286717 () (_ BitVec 64))

(assert (=> b!620424 (= lt!286703 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286717 lt!286702 mask!3053))))

(assert (=> b!620424 e!355833))

(declare-fun res!399787 () Bool)

(assert (=> b!620424 (=> (not res!399787) (not e!355833))))

(declare-fun lt!286714 () (_ BitVec 32))

(assert (=> b!620424 (= res!399787 (= lt!286705 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286714 vacantSpotIndex!68 lt!286717 lt!286702 mask!3053)))))

(assert (=> b!620424 (= lt!286705 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286714 vacantSpotIndex!68 (select (arr!18049 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620424 (= lt!286717 (select (store (arr!18049 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286710 () Unit!20618)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37606 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20618)

(assert (=> b!620424 (= lt!286710 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286714 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620424 (= lt!286714 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620425 () Bool)

(declare-fun Unit!20625 () Unit!20618)

(assert (=> b!620425 (= e!355842 Unit!20625)))

(declare-fun b!620426 () Bool)

(assert (=> b!620426 (= e!355838 e!355832)))

(declare-fun res!399782 () Bool)

(assert (=> b!620426 (=> (not res!399782) (not e!355832))))

(assert (=> b!620426 (= res!399782 (= (select (store (arr!18049 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620426 (= lt!286702 (array!37607 (store (arr!18049 a!2986) i!1108 k0!1786) (size!18413 a!2986)))))

(declare-fun b!620427 () Bool)

(declare-fun res!399783 () Bool)

(assert (=> b!620427 (=> (not res!399783) (not e!355838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37606 (_ BitVec 32)) Bool)

(assert (=> b!620427 (= res!399783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620415 () Bool)

(assert (=> b!620415 (= e!355837 (arrayContainsKey!0 lt!286702 (select (arr!18049 a!2986) j!136) index!984))))

(declare-fun res!399785 () Bool)

(assert (=> start!56136 (=> (not res!399785) (not e!355840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56136 (= res!399785 (validMask!0 mask!3053))))

(assert (=> start!56136 e!355840))

(assert (=> start!56136 true))

(declare-fun array_inv!13845 (array!37606) Bool)

(assert (=> start!56136 (array_inv!13845 a!2986)))

(declare-fun b!620428 () Bool)

(assert (=> b!620428 false))

(declare-fun lt!286699 () Unit!20618)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37606 (_ BitVec 64) (_ BitVec 32) List!12090) Unit!20618)

(assert (=> b!620428 (= lt!286699 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286702 (select (arr!18049 a!2986) j!136) j!136 Nil!12087))))

(assert (=> b!620428 (arrayNoDuplicates!0 lt!286702 j!136 Nil!12087)))

(declare-fun lt!286700 () Unit!20618)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37606 (_ BitVec 32) (_ BitVec 32)) Unit!20618)

(assert (=> b!620428 (= lt!286700 (lemmaNoDuplicateFromThenFromBigger!0 lt!286702 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620428 (arrayNoDuplicates!0 lt!286702 #b00000000000000000000000000000000 Nil!12087)))

(declare-fun lt!286707 () Unit!20618)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37606 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12090) Unit!20618)

(assert (=> b!620428 (= lt!286707 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12087))))

(assert (=> b!620428 (arrayContainsKey!0 lt!286702 (select (arr!18049 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286713 () Unit!20618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37606 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20618)

(assert (=> b!620428 (= lt!286713 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286702 (select (arr!18049 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20626 () Unit!20618)

(assert (=> b!620428 (= e!355839 Unit!20626)))

(declare-fun b!620429 () Bool)

(assert (=> b!620429 false))

(declare-fun lt!286711 () Unit!20618)

(assert (=> b!620429 (= lt!286711 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286702 (select (arr!18049 a!2986) j!136) index!984 Nil!12087))))

(assert (=> b!620429 (arrayNoDuplicates!0 lt!286702 index!984 Nil!12087)))

(declare-fun lt!286712 () Unit!20618)

(assert (=> b!620429 (= lt!286712 (lemmaNoDuplicateFromThenFromBigger!0 lt!286702 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620429 (arrayNoDuplicates!0 lt!286702 #b00000000000000000000000000000000 Nil!12087)))

(declare-fun lt!286706 () Unit!20618)

(assert (=> b!620429 (= lt!286706 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12087))))

(assert (=> b!620429 (arrayContainsKey!0 lt!286702 (select (arr!18049 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286715 () Unit!20618)

(assert (=> b!620429 (= lt!286715 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286702 (select (arr!18049 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620429 e!355834))

(declare-fun res!399792 () Bool)

(assert (=> b!620429 (=> (not res!399792) (not e!355834))))

(assert (=> b!620429 (= res!399792 (arrayContainsKey!0 lt!286702 (select (arr!18049 a!2986) j!136) j!136))))

(declare-fun Unit!20627 () Unit!20618)

(assert (=> b!620429 (= e!355835 Unit!20627)))

(declare-fun b!620430 () Bool)

(declare-fun res!399784 () Bool)

(assert (=> b!620430 (=> (not res!399784) (not e!355840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620430 (= res!399784 (validKeyInArray!0 (select (arr!18049 a!2986) j!136)))))

(declare-fun b!620431 () Bool)

(declare-fun res!399789 () Bool)

(assert (=> b!620431 (=> (not res!399789) (not e!355840))))

(assert (=> b!620431 (= res!399789 (validKeyInArray!0 k0!1786))))

(declare-fun b!620432 () Bool)

(declare-fun res!399781 () Bool)

(assert (=> b!620432 (=> (not res!399781) (not e!355840))))

(assert (=> b!620432 (= res!399781 (and (= (size!18413 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18413 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18413 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56136 res!399785) b!620432))

(assert (= (and b!620432 res!399781) b!620430))

(assert (= (and b!620430 res!399784) b!620431))

(assert (= (and b!620431 res!399789) b!620417))

(assert (= (and b!620417 res!399779) b!620411))

(assert (= (and b!620411 res!399793) b!620427))

(assert (= (and b!620427 res!399783) b!620419))

(assert (= (and b!620419 res!399786) b!620410))

(assert (= (and b!620410 res!399794) b!620426))

(assert (= (and b!620426 res!399782) b!620418))

(assert (= (and b!620418 res!399780) b!620424))

(assert (= (and b!620424 res!399787) b!620412))

(assert (= (and b!620424 c!70685) b!620414))

(assert (= (and b!620424 (not c!70685)) b!620425))

(assert (= (and b!620424 c!70682) b!620421))

(assert (= (and b!620424 (not c!70682)) b!620409))

(assert (= (and b!620421 res!399790) b!620420))

(assert (= (and b!620420 (not res!399788)) b!620413))

(assert (= (and b!620413 res!399791) b!620415))

(assert (= (and b!620421 c!70684) b!620428))

(assert (= (and b!620421 (not c!70684)) b!620416))

(assert (= (and b!620421 c!70683) b!620429))

(assert (= (and b!620421 (not c!70683)) b!620423))

(assert (= (and b!620429 res!399792) b!620422))

(declare-fun m!596331 () Bool)

(assert (=> b!620421 m!596331))

(declare-fun m!596333 () Bool)

(assert (=> b!620421 m!596333))

(declare-fun m!596335 () Bool)

(assert (=> b!620421 m!596335))

(declare-fun m!596337 () Bool)

(assert (=> b!620418 m!596337))

(assert (=> b!620418 m!596335))

(assert (=> b!620418 m!596335))

(declare-fun m!596339 () Bool)

(assert (=> b!620418 m!596339))

(declare-fun m!596341 () Bool)

(assert (=> b!620417 m!596341))

(assert (=> b!620430 m!596335))

(assert (=> b!620430 m!596335))

(declare-fun m!596343 () Bool)

(assert (=> b!620430 m!596343))

(declare-fun m!596345 () Bool)

(assert (=> b!620431 m!596345))

(assert (=> b!620413 m!596335))

(assert (=> b!620413 m!596335))

(declare-fun m!596347 () Bool)

(assert (=> b!620413 m!596347))

(assert (=> b!620429 m!596335))

(assert (=> b!620429 m!596335))

(assert (=> b!620429 m!596347))

(assert (=> b!620429 m!596335))

(declare-fun m!596349 () Bool)

(assert (=> b!620429 m!596349))

(declare-fun m!596351 () Bool)

(assert (=> b!620429 m!596351))

(declare-fun m!596353 () Bool)

(assert (=> b!620429 m!596353))

(declare-fun m!596355 () Bool)

(assert (=> b!620429 m!596355))

(assert (=> b!620429 m!596335))

(declare-fun m!596357 () Bool)

(assert (=> b!620429 m!596357))

(assert (=> b!620429 m!596335))

(declare-fun m!596359 () Bool)

(assert (=> b!620429 m!596359))

(declare-fun m!596361 () Bool)

(assert (=> b!620429 m!596361))

(declare-fun m!596363 () Bool)

(assert (=> b!620424 m!596363))

(declare-fun m!596365 () Bool)

(assert (=> b!620424 m!596365))

(assert (=> b!620424 m!596335))

(assert (=> b!620424 m!596331))

(declare-fun m!596367 () Bool)

(assert (=> b!620424 m!596367))

(declare-fun m!596369 () Bool)

(assert (=> b!620424 m!596369))

(declare-fun m!596371 () Bool)

(assert (=> b!620424 m!596371))

(assert (=> b!620424 m!596335))

(declare-fun m!596373 () Bool)

(assert (=> b!620424 m!596373))

(assert (=> b!620415 m!596335))

(assert (=> b!620415 m!596335))

(declare-fun m!596375 () Bool)

(assert (=> b!620415 m!596375))

(declare-fun m!596377 () Bool)

(assert (=> b!620427 m!596377))

(assert (=> b!620422 m!596335))

(assert (=> b!620422 m!596335))

(assert (=> b!620422 m!596375))

(declare-fun m!596379 () Bool)

(assert (=> b!620419 m!596379))

(declare-fun m!596381 () Bool)

(assert (=> b!620411 m!596381))

(assert (=> b!620426 m!596331))

(declare-fun m!596383 () Bool)

(assert (=> b!620426 m!596383))

(declare-fun m!596385 () Bool)

(assert (=> start!56136 m!596385))

(declare-fun m!596387 () Bool)

(assert (=> start!56136 m!596387))

(declare-fun m!596389 () Bool)

(assert (=> b!620410 m!596389))

(assert (=> b!620428 m!596335))

(declare-fun m!596391 () Bool)

(assert (=> b!620428 m!596391))

(declare-fun m!596393 () Bool)

(assert (=> b!620428 m!596393))

(assert (=> b!620428 m!596335))

(assert (=> b!620428 m!596335))

(declare-fun m!596395 () Bool)

(assert (=> b!620428 m!596395))

(assert (=> b!620428 m!596335))

(declare-fun m!596397 () Bool)

(assert (=> b!620428 m!596397))

(declare-fun m!596399 () Bool)

(assert (=> b!620428 m!596399))

(assert (=> b!620428 m!596355))

(assert (=> b!620428 m!596361))

(check-sat (not b!620430) (not b!620429) (not b!620428) (not b!620419) (not b!620418) (not b!620415) (not start!56136) (not b!620411) (not b!620422) (not b!620431) (not b!620427) (not b!620417) (not b!620413) (not b!620424))
(check-sat)
