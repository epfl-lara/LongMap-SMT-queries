; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69642 () Bool)

(assert start!69642)

(declare-fun b!811455 () Bool)

(declare-fun res!554642 () Bool)

(declare-fun e!449085 () Bool)

(assert (=> b!811455 (=> (not res!554642) (not e!449085))))

(declare-datatypes ((array!44098 0))(
  ( (array!44099 (arr!21119 (Array (_ BitVec 32) (_ BitVec 64))) (size!21540 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44098)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811455 (= res!554642 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!554648 () Bool)

(assert (=> start!69642 (=> (not res!554648) (not e!449085))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69642 (= res!554648 (validMask!0 mask!3266))))

(assert (=> start!69642 e!449085))

(assert (=> start!69642 true))

(declare-fun array_inv!17002 (array!44098) Bool)

(assert (=> start!69642 (array_inv!17002 a!3170)))

(declare-fun b!811456 () Bool)

(declare-fun res!554643 () Bool)

(declare-fun e!449087 () Bool)

(assert (=> b!811456 (=> (not res!554643) (not e!449087))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811456 (= res!554643 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21540 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21119 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21540 a!3170)) (= (select (arr!21119 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811457 () Bool)

(declare-fun e!449088 () Bool)

(declare-fun e!449086 () Bool)

(assert (=> b!811457 (= e!449088 e!449086)))

(declare-fun res!554645 () Bool)

(assert (=> b!811457 (=> (not res!554645) (not e!449086))))

(declare-datatypes ((SeekEntryResult!8707 0))(
  ( (MissingZero!8707 (index!37199 (_ BitVec 32))) (Found!8707 (index!37200 (_ BitVec 32))) (Intermediate!8707 (undefined!9519 Bool) (index!37201 (_ BitVec 32)) (x!68019 (_ BitVec 32))) (Undefined!8707) (MissingVacant!8707 (index!37202 (_ BitVec 32))) )
))
(declare-fun lt!363748 () SeekEntryResult!8707)

(declare-fun lt!363751 () SeekEntryResult!8707)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811457 (= res!554645 (and (= lt!363751 lt!363748) (not (= (select (arr!21119 a!3170) index!1236) (select (arr!21119 a!3170) j!153)))))))

(assert (=> b!811457 (= lt!363748 (Found!8707 j!153))))

(declare-fun b!811458 () Bool)

(assert (=> b!811458 (= e!449085 e!449087)))

(declare-fun res!554646 () Bool)

(assert (=> b!811458 (=> (not res!554646) (not e!449087))))

(declare-fun lt!363745 () SeekEntryResult!8707)

(assert (=> b!811458 (= res!554646 (or (= lt!363745 (MissingZero!8707 i!1163)) (= lt!363745 (MissingVacant!8707 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44098 (_ BitVec 32)) SeekEntryResult!8707)

(assert (=> b!811458 (= lt!363745 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811459 () Bool)

(declare-fun res!554649 () Bool)

(assert (=> b!811459 (=> (not res!554649) (not e!449085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811459 (= res!554649 (validKeyInArray!0 (select (arr!21119 a!3170) j!153)))))

(declare-fun b!811460 () Bool)

(declare-fun res!554641 () Bool)

(assert (=> b!811460 (=> (not res!554641) (not e!449087))))

(declare-datatypes ((List!15121 0))(
  ( (Nil!15118) (Cons!15117 (h!16246 (_ BitVec 64)) (t!21427 List!15121)) )
))
(declare-fun arrayNoDuplicates!0 (array!44098 (_ BitVec 32) List!15121) Bool)

(assert (=> b!811460 (= res!554641 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15118))))

(declare-fun b!811461 () Bool)

(declare-fun res!554638 () Bool)

(assert (=> b!811461 (=> (not res!554638) (not e!449087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44098 (_ BitVec 32)) Bool)

(assert (=> b!811461 (= res!554638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811462 () Bool)

(declare-fun e!449084 () Bool)

(assert (=> b!811462 (= e!449084 e!449088)))

(declare-fun res!554639 () Bool)

(assert (=> b!811462 (=> (not res!554639) (not e!449088))))

(declare-fun lt!363750 () SeekEntryResult!8707)

(assert (=> b!811462 (= res!554639 (= lt!363750 lt!363751))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44098 (_ BitVec 32)) SeekEntryResult!8707)

(assert (=> b!811462 (= lt!363751 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21119 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811462 (= lt!363750 (seekEntryOrOpen!0 (select (arr!21119 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811463 () Bool)

(assert (=> b!811463 (= e!449087 e!449084)))

(declare-fun res!554640 () Bool)

(assert (=> b!811463 (=> (not res!554640) (not e!449084))))

(declare-fun lt!363747 () SeekEntryResult!8707)

(declare-fun lt!363743 () SeekEntryResult!8707)

(assert (=> b!811463 (= res!554640 (= lt!363747 lt!363743))))

(declare-fun lt!363749 () array!44098)

(declare-fun lt!363746 () (_ BitVec 64))

(assert (=> b!811463 (= lt!363743 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363746 lt!363749 mask!3266))))

(assert (=> b!811463 (= lt!363747 (seekEntryOrOpen!0 lt!363746 lt!363749 mask!3266))))

(assert (=> b!811463 (= lt!363746 (select (store (arr!21119 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811463 (= lt!363749 (array!44099 (store (arr!21119 a!3170) i!1163 k0!2044) (size!21540 a!3170)))))

(declare-fun b!811464 () Bool)

(declare-fun res!554644 () Bool)

(assert (=> b!811464 (=> (not res!554644) (not e!449085))))

(assert (=> b!811464 (= res!554644 (and (= (size!21540 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21540 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21540 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811465 () Bool)

(declare-fun res!554647 () Bool)

(assert (=> b!811465 (=> (not res!554647) (not e!449085))))

(assert (=> b!811465 (= res!554647 (validKeyInArray!0 k0!2044))))

(declare-fun b!811466 () Bool)

(assert (=> b!811466 (= e!449086 (not (or (not (= lt!363743 lt!363748)) (= lt!363743 lt!363751))))))

(declare-fun lt!363752 () (_ BitVec 32))

(assert (=> b!811466 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363752 vacantAfter!23 lt!363746 lt!363749 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363752 vacantBefore!23 (select (arr!21119 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27642 0))(
  ( (Unit!27643) )
))
(declare-fun lt!363744 () Unit!27642)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44098 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27642)

(assert (=> b!811466 (= lt!363744 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363752 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811466 (= lt!363752 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69642 res!554648) b!811464))

(assert (= (and b!811464 res!554644) b!811459))

(assert (= (and b!811459 res!554649) b!811465))

(assert (= (and b!811465 res!554647) b!811455))

(assert (= (and b!811455 res!554642) b!811458))

(assert (= (and b!811458 res!554646) b!811461))

(assert (= (and b!811461 res!554638) b!811460))

(assert (= (and b!811460 res!554641) b!811456))

(assert (= (and b!811456 res!554643) b!811463))

(assert (= (and b!811463 res!554640) b!811462))

(assert (= (and b!811462 res!554639) b!811457))

(assert (= (and b!811457 res!554645) b!811466))

(declare-fun m!753397 () Bool)

(assert (=> b!811457 m!753397))

(declare-fun m!753399 () Bool)

(assert (=> b!811457 m!753399))

(assert (=> b!811459 m!753399))

(assert (=> b!811459 m!753399))

(declare-fun m!753401 () Bool)

(assert (=> b!811459 m!753401))

(declare-fun m!753403 () Bool)

(assert (=> b!811461 m!753403))

(assert (=> b!811466 m!753399))

(declare-fun m!753405 () Bool)

(assert (=> b!811466 m!753405))

(declare-fun m!753407 () Bool)

(assert (=> b!811466 m!753407))

(assert (=> b!811466 m!753399))

(declare-fun m!753409 () Bool)

(assert (=> b!811466 m!753409))

(declare-fun m!753411 () Bool)

(assert (=> b!811466 m!753411))

(declare-fun m!753413 () Bool)

(assert (=> b!811465 m!753413))

(declare-fun m!753415 () Bool)

(assert (=> start!69642 m!753415))

(declare-fun m!753417 () Bool)

(assert (=> start!69642 m!753417))

(declare-fun m!753419 () Bool)

(assert (=> b!811456 m!753419))

(declare-fun m!753421 () Bool)

(assert (=> b!811456 m!753421))

(declare-fun m!753423 () Bool)

(assert (=> b!811455 m!753423))

(declare-fun m!753425 () Bool)

(assert (=> b!811463 m!753425))

(declare-fun m!753427 () Bool)

(assert (=> b!811463 m!753427))

(declare-fun m!753429 () Bool)

(assert (=> b!811463 m!753429))

(declare-fun m!753431 () Bool)

(assert (=> b!811463 m!753431))

(assert (=> b!811462 m!753399))

(assert (=> b!811462 m!753399))

(declare-fun m!753433 () Bool)

(assert (=> b!811462 m!753433))

(assert (=> b!811462 m!753399))

(declare-fun m!753435 () Bool)

(assert (=> b!811462 m!753435))

(declare-fun m!753437 () Bool)

(assert (=> b!811460 m!753437))

(declare-fun m!753439 () Bool)

(assert (=> b!811458 m!753439))

(check-sat (not b!811458) (not b!811465) (not b!811460) (not b!811463) (not b!811461) (not b!811459) (not b!811455) (not start!69642) (not b!811462) (not b!811466))
(check-sat)
