; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56172 () Bool)

(assert start!56172)

(declare-fun b!620107 () Bool)

(declare-fun e!355658 () Bool)

(declare-datatypes ((SeekEntryResult!6433 0))(
  ( (MissingZero!6433 (index!28016 (_ BitVec 32))) (Found!6433 (index!28017 (_ BitVec 32))) (Intermediate!6433 (undefined!7245 Bool) (index!28018 (_ BitVec 32)) (x!56948 (_ BitVec 32))) (Undefined!6433) (MissingVacant!6433 (index!28019 (_ BitVec 32))) )
))
(declare-fun lt!286387 () SeekEntryResult!6433)

(declare-fun lt!286380 () SeekEntryResult!6433)

(assert (=> b!620107 (= e!355658 (= lt!286387 lt!286380))))

(declare-fun b!620108 () Bool)

(declare-datatypes ((Unit!20527 0))(
  ( (Unit!20528) )
))
(declare-fun e!355663 () Unit!20527)

(declare-fun Unit!20529 () Unit!20527)

(assert (=> b!620108 (= e!355663 Unit!20529)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!399544 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37587 0))(
  ( (array!37588 (arr!18037 (Array (_ BitVec 32) (_ BitVec 64))) (size!18401 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37587)

(assert (=> b!620108 (= res!399544 (= (select (store (arr!18037 a!2986) i!1108 k0!1786) index!984) (select (arr!18037 a!2986) j!136)))))

(declare-fun e!355668 () Bool)

(assert (=> b!620108 (=> (not res!399544) (not e!355668))))

(assert (=> b!620108 e!355668))

(declare-fun c!70654 () Bool)

(assert (=> b!620108 (= c!70654 (bvslt j!136 index!984))))

(declare-fun lt!286394 () Unit!20527)

(declare-fun e!355669 () Unit!20527)

(assert (=> b!620108 (= lt!286394 e!355669)))

(declare-fun c!70652 () Bool)

(assert (=> b!620108 (= c!70652 (bvslt index!984 j!136))))

(declare-fun lt!286390 () Unit!20527)

(declare-fun e!355664 () Unit!20527)

(assert (=> b!620108 (= lt!286390 e!355664)))

(assert (=> b!620108 false))

(declare-fun b!620109 () Bool)

(declare-fun e!355665 () Bool)

(declare-fun e!355666 () Bool)

(assert (=> b!620109 (= e!355665 (not e!355666))))

(declare-fun res!399551 () Bool)

(assert (=> b!620109 (=> res!399551 e!355666)))

(declare-fun lt!286396 () SeekEntryResult!6433)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!620109 (= res!399551 (not (= lt!286396 (MissingVacant!6433 vacantSpotIndex!68))))))

(declare-fun lt!286383 () Unit!20527)

(assert (=> b!620109 (= lt!286383 e!355663)))

(declare-fun c!70653 () Bool)

(assert (=> b!620109 (= c!70653 (= lt!286396 (Found!6433 index!984)))))

(declare-fun lt!286397 () Unit!20527)

(declare-fun e!355662 () Unit!20527)

(assert (=> b!620109 (= lt!286397 e!355662)))

(declare-fun c!70655 () Bool)

(assert (=> b!620109 (= c!70655 (= lt!286396 Undefined!6433))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!286388 () array!37587)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!286389 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37587 (_ BitVec 32)) SeekEntryResult!6433)

(assert (=> b!620109 (= lt!286396 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286389 lt!286388 mask!3053))))

(assert (=> b!620109 e!355658))

(declare-fun res!399556 () Bool)

(assert (=> b!620109 (=> (not res!399556) (not e!355658))))

(declare-fun lt!286381 () (_ BitVec 32))

(assert (=> b!620109 (= res!399556 (= lt!286380 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286381 vacantSpotIndex!68 lt!286389 lt!286388 mask!3053)))))

(assert (=> b!620109 (= lt!286380 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286381 vacantSpotIndex!68 (select (arr!18037 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620109 (= lt!286389 (select (store (arr!18037 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286384 () Unit!20527)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37587 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20527)

(assert (=> b!620109 (= lt!286384 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286381 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620109 (= lt!286381 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!620110 () Bool)

(declare-fun e!355659 () Bool)

(assert (=> b!620110 (= e!355659 e!355665)))

(declare-fun res!399542 () Bool)

(assert (=> b!620110 (=> (not res!399542) (not e!355665))))

(assert (=> b!620110 (= res!399542 (and (= lt!286387 (Found!6433 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18037 a!2986) index!984) (select (arr!18037 a!2986) j!136))) (not (= (select (arr!18037 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620110 (= lt!286387 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18037 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620111 () Bool)

(declare-fun res!399555 () Bool)

(declare-fun e!355661 () Bool)

(assert (=> b!620111 (=> (not res!399555) (not e!355661))))

(assert (=> b!620111 (= res!399555 (and (= (size!18401 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18401 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18401 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620112 () Bool)

(declare-fun res!399549 () Bool)

(assert (=> b!620112 (=> (not res!399549) (not e!355661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620112 (= res!399549 (validKeyInArray!0 (select (arr!18037 a!2986) j!136)))))

(declare-fun e!355670 () Bool)

(declare-fun b!620113 () Bool)

(declare-fun arrayContainsKey!0 (array!37587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620113 (= e!355670 (arrayContainsKey!0 lt!286388 (select (arr!18037 a!2986) j!136) index!984))))

(declare-fun b!620114 () Bool)

(declare-fun res!399552 () Bool)

(assert (=> b!620114 (= res!399552 (arrayContainsKey!0 lt!286388 (select (arr!18037 a!2986) j!136) j!136))))

(assert (=> b!620114 (=> (not res!399552) (not e!355670))))

(declare-fun e!355657 () Bool)

(assert (=> b!620114 (= e!355657 e!355670)))

(declare-fun b!620115 () Bool)

(declare-fun res!399553 () Bool)

(assert (=> b!620115 (=> (not res!399553) (not e!355661))))

(assert (=> b!620115 (= res!399553 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620116 () Bool)

(declare-fun e!355671 () Bool)

(assert (=> b!620116 (= e!355671 (arrayContainsKey!0 lt!286388 (select (arr!18037 a!2986) j!136) index!984))))

(declare-fun b!620117 () Bool)

(declare-fun Unit!20530 () Unit!20527)

(assert (=> b!620117 (= e!355669 Unit!20530)))

(declare-fun b!620118 () Bool)

(declare-fun res!399543 () Bool)

(declare-fun e!355660 () Bool)

(assert (=> b!620118 (=> (not res!399543) (not e!355660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37587 (_ BitVec 32)) Bool)

(assert (=> b!620118 (= res!399543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620119 () Bool)

(declare-fun res!399545 () Bool)

(assert (=> b!620119 (= res!399545 (bvsge j!136 index!984))))

(assert (=> b!620119 (=> res!399545 e!355657)))

(assert (=> b!620119 (= e!355668 e!355657)))

(declare-fun b!620120 () Bool)

(assert (=> b!620120 false))

(declare-fun lt!286392 () Unit!20527)

(declare-datatypes ((List!11985 0))(
  ( (Nil!11982) (Cons!11981 (h!13029 (_ BitVec 64)) (t!18205 List!11985)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37587 (_ BitVec 64) (_ BitVec 32) List!11985) Unit!20527)

(assert (=> b!620120 (= lt!286392 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286388 (select (arr!18037 a!2986) j!136) index!984 Nil!11982))))

(declare-fun arrayNoDuplicates!0 (array!37587 (_ BitVec 32) List!11985) Bool)

(assert (=> b!620120 (arrayNoDuplicates!0 lt!286388 index!984 Nil!11982)))

(declare-fun lt!286386 () Unit!20527)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37587 (_ BitVec 32) (_ BitVec 32)) Unit!20527)

(assert (=> b!620120 (= lt!286386 (lemmaNoDuplicateFromThenFromBigger!0 lt!286388 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620120 (arrayNoDuplicates!0 lt!286388 #b00000000000000000000000000000000 Nil!11982)))

(declare-fun lt!286395 () Unit!20527)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11985) Unit!20527)

(assert (=> b!620120 (= lt!286395 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11982))))

(assert (=> b!620120 (arrayContainsKey!0 lt!286388 (select (arr!18037 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286382 () Unit!20527)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20527)

(assert (=> b!620120 (= lt!286382 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286388 (select (arr!18037 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620120 e!355671))

(declare-fun res!399541 () Bool)

(assert (=> b!620120 (=> (not res!399541) (not e!355671))))

(assert (=> b!620120 (= res!399541 (arrayContainsKey!0 lt!286388 (select (arr!18037 a!2986) j!136) j!136))))

(declare-fun Unit!20531 () Unit!20527)

(assert (=> b!620120 (= e!355664 Unit!20531)))

(declare-fun b!620121 () Bool)

(assert (=> b!620121 (= e!355661 e!355660)))

(declare-fun res!399547 () Bool)

(assert (=> b!620121 (=> (not res!399547) (not e!355660))))

(declare-fun lt!286393 () SeekEntryResult!6433)

(assert (=> b!620121 (= res!399547 (or (= lt!286393 (MissingZero!6433 i!1108)) (= lt!286393 (MissingVacant!6433 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37587 (_ BitVec 32)) SeekEntryResult!6433)

(assert (=> b!620121 (= lt!286393 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620122 () Bool)

(declare-fun res!399540 () Bool)

(assert (=> b!620122 (=> (not res!399540) (not e!355661))))

(assert (=> b!620122 (= res!399540 (validKeyInArray!0 k0!1786))))

(declare-fun b!620123 () Bool)

(declare-fun Unit!20532 () Unit!20527)

(assert (=> b!620123 (= e!355662 Unit!20532)))

(declare-fun b!620124 () Bool)

(assert (=> b!620124 (= e!355666 true)))

(assert (=> b!620124 (= (select (store (arr!18037 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!620125 () Bool)

(declare-fun Unit!20533 () Unit!20527)

(assert (=> b!620125 (= e!355663 Unit!20533)))

(declare-fun b!620126 () Bool)

(assert (=> b!620126 false))

(declare-fun lt!286385 () Unit!20527)

(assert (=> b!620126 (= lt!286385 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286388 (select (arr!18037 a!2986) j!136) j!136 Nil!11982))))

(assert (=> b!620126 (arrayNoDuplicates!0 lt!286388 j!136 Nil!11982)))

(declare-fun lt!286391 () Unit!20527)

(assert (=> b!620126 (= lt!286391 (lemmaNoDuplicateFromThenFromBigger!0 lt!286388 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620126 (arrayNoDuplicates!0 lt!286388 #b00000000000000000000000000000000 Nil!11982)))

(declare-fun lt!286398 () Unit!20527)

(assert (=> b!620126 (= lt!286398 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11982))))

(assert (=> b!620126 (arrayContainsKey!0 lt!286388 (select (arr!18037 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286399 () Unit!20527)

(assert (=> b!620126 (= lt!286399 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286388 (select (arr!18037 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20534 () Unit!20527)

(assert (=> b!620126 (= e!355669 Unit!20534)))

(declare-fun res!399554 () Bool)

(assert (=> start!56172 (=> (not res!399554) (not e!355661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56172 (= res!399554 (validMask!0 mask!3053))))

(assert (=> start!56172 e!355661))

(assert (=> start!56172 true))

(declare-fun array_inv!13896 (array!37587) Bool)

(assert (=> start!56172 (array_inv!13896 a!2986)))

(declare-fun b!620127 () Bool)

(declare-fun res!399548 () Bool)

(assert (=> b!620127 (=> (not res!399548) (not e!355660))))

(assert (=> b!620127 (= res!399548 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18037 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620128 () Bool)

(assert (=> b!620128 (= e!355660 e!355659)))

(declare-fun res!399546 () Bool)

(assert (=> b!620128 (=> (not res!399546) (not e!355659))))

(assert (=> b!620128 (= res!399546 (= (select (store (arr!18037 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620128 (= lt!286388 (array!37588 (store (arr!18037 a!2986) i!1108 k0!1786) (size!18401 a!2986)))))

(declare-fun b!620129 () Bool)

(declare-fun Unit!20535 () Unit!20527)

(assert (=> b!620129 (= e!355662 Unit!20535)))

(assert (=> b!620129 false))

(declare-fun b!620130 () Bool)

(declare-fun res!399550 () Bool)

(assert (=> b!620130 (=> (not res!399550) (not e!355660))))

(assert (=> b!620130 (= res!399550 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11982))))

(declare-fun b!620131 () Bool)

(declare-fun Unit!20536 () Unit!20527)

(assert (=> b!620131 (= e!355664 Unit!20536)))

(assert (= (and start!56172 res!399554) b!620111))

(assert (= (and b!620111 res!399555) b!620112))

(assert (= (and b!620112 res!399549) b!620122))

(assert (= (and b!620122 res!399540) b!620115))

(assert (= (and b!620115 res!399553) b!620121))

(assert (= (and b!620121 res!399547) b!620118))

(assert (= (and b!620118 res!399543) b!620130))

(assert (= (and b!620130 res!399550) b!620127))

(assert (= (and b!620127 res!399548) b!620128))

(assert (= (and b!620128 res!399546) b!620110))

(assert (= (and b!620110 res!399542) b!620109))

(assert (= (and b!620109 res!399556) b!620107))

(assert (= (and b!620109 c!70655) b!620129))

(assert (= (and b!620109 (not c!70655)) b!620123))

(assert (= (and b!620109 c!70653) b!620108))

(assert (= (and b!620109 (not c!70653)) b!620125))

(assert (= (and b!620108 res!399544) b!620119))

(assert (= (and b!620119 (not res!399545)) b!620114))

(assert (= (and b!620114 res!399552) b!620113))

(assert (= (and b!620108 c!70654) b!620126))

(assert (= (and b!620108 (not c!70654)) b!620117))

(assert (= (and b!620108 c!70652) b!620120))

(assert (= (and b!620108 (not c!70652)) b!620131))

(assert (= (and b!620120 res!399541) b!620116))

(assert (= (and b!620109 (not res!399551)) b!620124))

(declare-fun m!596327 () Bool)

(assert (=> b!620127 m!596327))

(declare-fun m!596329 () Bool)

(assert (=> b!620113 m!596329))

(assert (=> b!620113 m!596329))

(declare-fun m!596331 () Bool)

(assert (=> b!620113 m!596331))

(declare-fun m!596333 () Bool)

(assert (=> b!620109 m!596333))

(declare-fun m!596335 () Bool)

(assert (=> b!620109 m!596335))

(assert (=> b!620109 m!596329))

(assert (=> b!620109 m!596329))

(declare-fun m!596337 () Bool)

(assert (=> b!620109 m!596337))

(declare-fun m!596339 () Bool)

(assert (=> b!620109 m!596339))

(declare-fun m!596341 () Bool)

(assert (=> b!620109 m!596341))

(declare-fun m!596343 () Bool)

(assert (=> b!620109 m!596343))

(declare-fun m!596345 () Bool)

(assert (=> b!620109 m!596345))

(assert (=> b!620124 m!596339))

(declare-fun m!596347 () Bool)

(assert (=> b!620124 m!596347))

(assert (=> b!620114 m!596329))

(assert (=> b!620114 m!596329))

(declare-fun m!596349 () Bool)

(assert (=> b!620114 m!596349))

(declare-fun m!596351 () Bool)

(assert (=> b!620118 m!596351))

(declare-fun m!596353 () Bool)

(assert (=> start!56172 m!596353))

(declare-fun m!596355 () Bool)

(assert (=> start!56172 m!596355))

(declare-fun m!596357 () Bool)

(assert (=> b!620110 m!596357))

(assert (=> b!620110 m!596329))

(assert (=> b!620110 m!596329))

(declare-fun m!596359 () Bool)

(assert (=> b!620110 m!596359))

(assert (=> b!620128 m!596339))

(declare-fun m!596361 () Bool)

(assert (=> b!620128 m!596361))

(assert (=> b!620126 m!596329))

(assert (=> b!620126 m!596329))

(declare-fun m!596363 () Bool)

(assert (=> b!620126 m!596363))

(assert (=> b!620126 m!596329))

(declare-fun m!596365 () Bool)

(assert (=> b!620126 m!596365))

(declare-fun m!596367 () Bool)

(assert (=> b!620126 m!596367))

(declare-fun m!596369 () Bool)

(assert (=> b!620126 m!596369))

(declare-fun m!596371 () Bool)

(assert (=> b!620126 m!596371))

(assert (=> b!620126 m!596329))

(declare-fun m!596373 () Bool)

(assert (=> b!620126 m!596373))

(declare-fun m!596375 () Bool)

(assert (=> b!620126 m!596375))

(assert (=> b!620116 m!596329))

(assert (=> b!620116 m!596329))

(assert (=> b!620116 m!596331))

(declare-fun m!596377 () Bool)

(assert (=> b!620121 m!596377))

(declare-fun m!596379 () Bool)

(assert (=> b!620120 m!596379))

(assert (=> b!620120 m!596329))

(declare-fun m!596381 () Bool)

(assert (=> b!620120 m!596381))

(assert (=> b!620120 m!596369))

(assert (=> b!620120 m!596329))

(assert (=> b!620120 m!596349))

(assert (=> b!620120 m!596329))

(declare-fun m!596383 () Bool)

(assert (=> b!620120 m!596383))

(assert (=> b!620120 m!596329))

(assert (=> b!620120 m!596329))

(declare-fun m!596385 () Bool)

(assert (=> b!620120 m!596385))

(declare-fun m!596387 () Bool)

(assert (=> b!620120 m!596387))

(assert (=> b!620120 m!596371))

(assert (=> b!620108 m!596339))

(assert (=> b!620108 m!596347))

(assert (=> b!620108 m!596329))

(assert (=> b!620112 m!596329))

(assert (=> b!620112 m!596329))

(declare-fun m!596389 () Bool)

(assert (=> b!620112 m!596389))

(declare-fun m!596391 () Bool)

(assert (=> b!620122 m!596391))

(declare-fun m!596393 () Bool)

(assert (=> b!620115 m!596393))

(declare-fun m!596395 () Bool)

(assert (=> b!620130 m!596395))

(check-sat (not b!620130) (not b!620115) (not b!620109) (not b!620122) (not b!620114) (not b!620113) (not b!620120) (not b!620126) (not b!620116) (not b!620118) (not b!620121) (not b!620110) (not start!56172) (not b!620112))
(check-sat)
