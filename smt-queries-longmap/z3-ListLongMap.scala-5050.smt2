; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68790 () Bool)

(assert start!68790)

(declare-fun b!801796 () Bool)

(declare-fun res!546457 () Bool)

(declare-fun e!444376 () Bool)

(assert (=> b!801796 (=> (not res!546457) (not e!444376))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801796 (= res!546457 (validKeyInArray!0 k0!2044))))

(declare-fun b!801797 () Bool)

(declare-fun res!546460 () Bool)

(declare-fun e!444375 () Bool)

(assert (=> b!801797 (=> (not res!546460) (not e!444375))))

(declare-datatypes ((array!43597 0))(
  ( (array!43598 (arr!20879 (Array (_ BitVec 32) (_ BitVec 64))) (size!21300 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43597)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43597 (_ BitVec 32)) Bool)

(assert (=> b!801797 (= res!546460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801798 () Bool)

(declare-fun res!546462 () Bool)

(assert (=> b!801798 (=> (not res!546462) (not e!444375))))

(declare-datatypes ((List!14881 0))(
  ( (Nil!14878) (Cons!14877 (h!16006 (_ BitVec 64)) (t!21187 List!14881)) )
))
(declare-fun arrayNoDuplicates!0 (array!43597 (_ BitVec 32) List!14881) Bool)

(assert (=> b!801798 (= res!546462 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14878))))

(declare-fun b!801799 () Bool)

(declare-fun res!546461 () Bool)

(assert (=> b!801799 (=> (not res!546461) (not e!444376))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801799 (= res!546461 (validKeyInArray!0 (select (arr!20879 a!3170) j!153)))))

(declare-fun b!801800 () Bool)

(declare-fun e!444378 () Bool)

(assert (=> b!801800 (= e!444375 e!444378)))

(declare-fun res!546459 () Bool)

(assert (=> b!801800 (=> (not res!546459) (not e!444378))))

(declare-fun lt!358370 () array!43597)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358368 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8467 0))(
  ( (MissingZero!8467 (index!36236 (_ BitVec 32))) (Found!8467 (index!36237 (_ BitVec 32))) (Intermediate!8467 (undefined!9279 Bool) (index!36238 (_ BitVec 32)) (x!67100 (_ BitVec 32))) (Undefined!8467) (MissingVacant!8467 (index!36239 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43597 (_ BitVec 32)) SeekEntryResult!8467)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43597 (_ BitVec 32)) SeekEntryResult!8467)

(assert (=> b!801800 (= res!546459 (= (seekEntryOrOpen!0 lt!358368 lt!358370 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358368 lt!358370 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801800 (= lt!358368 (select (store (arr!20879 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801800 (= lt!358370 (array!43598 (store (arr!20879 a!3170) i!1163 k0!2044) (size!21300 a!3170)))))

(declare-fun b!801801 () Bool)

(declare-fun res!546465 () Bool)

(assert (=> b!801801 (=> (not res!546465) (not e!444375))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801801 (= res!546465 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21300 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20879 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21300 a!3170)) (= (select (arr!20879 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801802 () Bool)

(declare-fun e!444377 () Bool)

(assert (=> b!801802 (= e!444377 (not true))))

(declare-fun lt!358367 () (_ BitVec 32))

(assert (=> b!801802 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358367 vacantAfter!23 lt!358368 lt!358370 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358367 vacantBefore!23 (select (arr!20879 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27448 0))(
  ( (Unit!27449) )
))
(declare-fun lt!358366 () Unit!27448)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43597 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27448)

(assert (=> b!801802 (= lt!358366 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358367 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801802 (= lt!358367 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!546463 () Bool)

(assert (=> start!68790 (=> (not res!546463) (not e!444376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68790 (= res!546463 (validMask!0 mask!3266))))

(assert (=> start!68790 e!444376))

(assert (=> start!68790 true))

(declare-fun array_inv!16762 (array!43597) Bool)

(assert (=> start!68790 (array_inv!16762 a!3170)))

(declare-fun b!801803 () Bool)

(assert (=> b!801803 (= e!444376 e!444375)))

(declare-fun res!546455 () Bool)

(assert (=> b!801803 (=> (not res!546455) (not e!444375))))

(declare-fun lt!358365 () SeekEntryResult!8467)

(assert (=> b!801803 (= res!546455 (or (= lt!358365 (MissingZero!8467 i!1163)) (= lt!358365 (MissingVacant!8467 i!1163))))))

(assert (=> b!801803 (= lt!358365 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801804 () Bool)

(declare-fun res!546458 () Bool)

(assert (=> b!801804 (=> (not res!546458) (not e!444376))))

(declare-fun arrayContainsKey!0 (array!43597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801804 (= res!546458 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801805 () Bool)

(declare-fun res!546464 () Bool)

(assert (=> b!801805 (=> (not res!546464) (not e!444376))))

(assert (=> b!801805 (= res!546464 (and (= (size!21300 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21300 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21300 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801806 () Bool)

(assert (=> b!801806 (= e!444378 e!444377)))

(declare-fun res!546456 () Bool)

(assert (=> b!801806 (=> (not res!546456) (not e!444377))))

(declare-fun lt!358364 () SeekEntryResult!8467)

(declare-fun lt!358369 () SeekEntryResult!8467)

(assert (=> b!801806 (= res!546456 (and (= lt!358364 lt!358369) (= lt!358369 (Found!8467 j!153)) (not (= (select (arr!20879 a!3170) index!1236) (select (arr!20879 a!3170) j!153)))))))

(assert (=> b!801806 (= lt!358369 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20879 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801806 (= lt!358364 (seekEntryOrOpen!0 (select (arr!20879 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68790 res!546463) b!801805))

(assert (= (and b!801805 res!546464) b!801799))

(assert (= (and b!801799 res!546461) b!801796))

(assert (= (and b!801796 res!546457) b!801804))

(assert (= (and b!801804 res!546458) b!801803))

(assert (= (and b!801803 res!546455) b!801797))

(assert (= (and b!801797 res!546460) b!801798))

(assert (= (and b!801798 res!546462) b!801801))

(assert (= (and b!801801 res!546465) b!801800))

(assert (= (and b!801800 res!546459) b!801806))

(assert (= (and b!801806 res!546456) b!801802))

(declare-fun m!742621 () Bool)

(assert (=> b!801799 m!742621))

(assert (=> b!801799 m!742621))

(declare-fun m!742623 () Bool)

(assert (=> b!801799 m!742623))

(declare-fun m!742625 () Bool)

(assert (=> b!801800 m!742625))

(declare-fun m!742627 () Bool)

(assert (=> b!801800 m!742627))

(declare-fun m!742629 () Bool)

(assert (=> b!801800 m!742629))

(declare-fun m!742631 () Bool)

(assert (=> b!801800 m!742631))

(declare-fun m!742633 () Bool)

(assert (=> b!801796 m!742633))

(declare-fun m!742635 () Bool)

(assert (=> b!801803 m!742635))

(declare-fun m!742637 () Bool)

(assert (=> b!801801 m!742637))

(declare-fun m!742639 () Bool)

(assert (=> b!801801 m!742639))

(declare-fun m!742641 () Bool)

(assert (=> start!68790 m!742641))

(declare-fun m!742643 () Bool)

(assert (=> start!68790 m!742643))

(assert (=> b!801802 m!742621))

(declare-fun m!742645 () Bool)

(assert (=> b!801802 m!742645))

(declare-fun m!742647 () Bool)

(assert (=> b!801802 m!742647))

(assert (=> b!801802 m!742621))

(declare-fun m!742649 () Bool)

(assert (=> b!801802 m!742649))

(declare-fun m!742651 () Bool)

(assert (=> b!801802 m!742651))

(declare-fun m!742653 () Bool)

(assert (=> b!801806 m!742653))

(assert (=> b!801806 m!742621))

(assert (=> b!801806 m!742621))

(declare-fun m!742655 () Bool)

(assert (=> b!801806 m!742655))

(assert (=> b!801806 m!742621))

(declare-fun m!742657 () Bool)

(assert (=> b!801806 m!742657))

(declare-fun m!742659 () Bool)

(assert (=> b!801804 m!742659))

(declare-fun m!742661 () Bool)

(assert (=> b!801798 m!742661))

(declare-fun m!742663 () Bool)

(assert (=> b!801797 m!742663))

(check-sat (not b!801796) (not b!801798) (not b!801803) (not start!68790) (not b!801806) (not b!801804) (not b!801802) (not b!801799) (not b!801800) (not b!801797))
(check-sat)
