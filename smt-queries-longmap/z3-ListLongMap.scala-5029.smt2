; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68852 () Bool)

(assert start!68852)

(declare-fun b!800554 () Bool)

(declare-fun res!544524 () Bool)

(declare-fun e!444005 () Bool)

(assert (=> b!800554 (=> (not res!544524) (not e!444005))))

(declare-datatypes ((array!43474 0))(
  ( (array!43475 (arr!20812 (Array (_ BitVec 32) (_ BitVec 64))) (size!21232 (_ BitVec 32))) )
))
(declare-fun lt!357492 () array!43474)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357490 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8359 0))(
  ( (MissingZero!8359 (index!35804 (_ BitVec 32))) (Found!8359 (index!35805 (_ BitVec 32))) (Intermediate!8359 (undefined!9171 Bool) (index!35806 (_ BitVec 32)) (x!66843 (_ BitVec 32))) (Undefined!8359) (MissingVacant!8359 (index!35807 (_ BitVec 32))) )
))
(declare-fun lt!357494 () SeekEntryResult!8359)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357491 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43474 (_ BitVec 32)) SeekEntryResult!8359)

(assert (=> b!800554 (= res!544524 (= lt!357494 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357491 vacantAfter!23 lt!357490 lt!357492 mask!3266)))))

(declare-fun b!800555 () Bool)

(declare-fun e!444009 () Bool)

(assert (=> b!800555 (= e!444009 e!444005)))

(declare-fun res!544530 () Bool)

(assert (=> b!800555 (=> (not res!544530) (not e!444005))))

(declare-fun a!3170 () array!43474)

(assert (=> b!800555 (= res!544530 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357491 #b00000000000000000000000000000000) (bvslt lt!357491 (size!21232 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800555 (= lt!357491 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800556 () Bool)

(declare-fun res!544529 () Bool)

(declare-fun e!444006 () Bool)

(assert (=> b!800556 (=> (not res!544529) (not e!444006))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800556 (= res!544529 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800557 () Bool)

(declare-fun res!544525 () Bool)

(declare-fun e!444008 () Bool)

(assert (=> b!800557 (=> (not res!544525) (not e!444008))))

(declare-datatypes ((List!14682 0))(
  ( (Nil!14679) (Cons!14678 (h!15813 (_ BitVec 64)) (t!20989 List!14682)) )
))
(declare-fun arrayNoDuplicates!0 (array!43474 (_ BitVec 32) List!14682) Bool)

(assert (=> b!800557 (= res!544525 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14679))))

(declare-fun b!800558 () Bool)

(declare-fun res!544527 () Bool)

(assert (=> b!800558 (=> (not res!544527) (not e!444006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800558 (= res!544527 (validKeyInArray!0 k0!2044))))

(declare-fun b!800559 () Bool)

(assert (=> b!800559 (= e!444006 e!444008)))

(declare-fun res!544534 () Bool)

(assert (=> b!800559 (=> (not res!544534) (not e!444008))))

(declare-fun lt!357487 () SeekEntryResult!8359)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800559 (= res!544534 (or (= lt!357487 (MissingZero!8359 i!1163)) (= lt!357487 (MissingVacant!8359 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43474 (_ BitVec 32)) SeekEntryResult!8359)

(assert (=> b!800559 (= lt!357487 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800560 () Bool)

(declare-fun res!544533 () Bool)

(assert (=> b!800560 (=> (not res!544533) (not e!444008))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800560 (= res!544533 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21232 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20812 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21232 a!3170)) (= (select (arr!20812 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800561 () Bool)

(declare-fun e!444007 () Bool)

(assert (=> b!800561 (= e!444007 e!444009)))

(declare-fun res!544535 () Bool)

(assert (=> b!800561 (=> (not res!544535) (not e!444009))))

(declare-fun lt!357488 () SeekEntryResult!8359)

(declare-fun lt!357489 () SeekEntryResult!8359)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800561 (= res!544535 (and (= lt!357489 lt!357488) (= lt!357488 (Found!8359 j!153)) (not (= (select (arr!20812 a!3170) index!1236) (select (arr!20812 a!3170) j!153)))))))

(assert (=> b!800561 (= lt!357488 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20812 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800561 (= lt!357489 (seekEntryOrOpen!0 (select (arr!20812 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800562 () Bool)

(declare-fun res!544526 () Bool)

(assert (=> b!800562 (=> (not res!544526) (not e!444006))))

(assert (=> b!800562 (= res!544526 (and (= (size!21232 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21232 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21232 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800563 () Bool)

(assert (=> b!800563 (= e!444008 e!444007)))

(declare-fun res!544531 () Bool)

(assert (=> b!800563 (=> (not res!544531) (not e!444007))))

(assert (=> b!800563 (= res!544531 (= lt!357494 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357490 lt!357492 mask!3266)))))

(assert (=> b!800563 (= lt!357494 (seekEntryOrOpen!0 lt!357490 lt!357492 mask!3266))))

(assert (=> b!800563 (= lt!357490 (select (store (arr!20812 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800563 (= lt!357492 (array!43475 (store (arr!20812 a!3170) i!1163 k0!2044) (size!21232 a!3170)))))

(declare-fun b!800564 () Bool)

(assert (=> b!800564 (= e!444005 false)))

(declare-fun lt!357493 () SeekEntryResult!8359)

(assert (=> b!800564 (= lt!357493 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357491 vacantBefore!23 (select (arr!20812 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800565 () Bool)

(declare-fun res!544536 () Bool)

(assert (=> b!800565 (=> (not res!544536) (not e!444006))))

(assert (=> b!800565 (= res!544536 (validKeyInArray!0 (select (arr!20812 a!3170) j!153)))))

(declare-fun b!800553 () Bool)

(declare-fun res!544528 () Bool)

(assert (=> b!800553 (=> (not res!544528) (not e!444008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43474 (_ BitVec 32)) Bool)

(assert (=> b!800553 (= res!544528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!544532 () Bool)

(assert (=> start!68852 (=> (not res!544532) (not e!444006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68852 (= res!544532 (validMask!0 mask!3266))))

(assert (=> start!68852 e!444006))

(assert (=> start!68852 true))

(declare-fun array_inv!16671 (array!43474) Bool)

(assert (=> start!68852 (array_inv!16671 a!3170)))

(assert (= (and start!68852 res!544532) b!800562))

(assert (= (and b!800562 res!544526) b!800565))

(assert (= (and b!800565 res!544536) b!800558))

(assert (= (and b!800558 res!544527) b!800556))

(assert (= (and b!800556 res!544529) b!800559))

(assert (= (and b!800559 res!544534) b!800553))

(assert (= (and b!800553 res!544528) b!800557))

(assert (= (and b!800557 res!544525) b!800560))

(assert (= (and b!800560 res!544533) b!800563))

(assert (= (and b!800563 res!544531) b!800561))

(assert (= (and b!800561 res!544535) b!800555))

(assert (= (and b!800555 res!544530) b!800554))

(assert (= (and b!800554 res!544524) b!800564))

(declare-fun m!741949 () Bool)

(assert (=> b!800555 m!741949))

(declare-fun m!741951 () Bool)

(assert (=> b!800565 m!741951))

(assert (=> b!800565 m!741951))

(declare-fun m!741953 () Bool)

(assert (=> b!800565 m!741953))

(declare-fun m!741955 () Bool)

(assert (=> b!800563 m!741955))

(declare-fun m!741957 () Bool)

(assert (=> b!800563 m!741957))

(declare-fun m!741959 () Bool)

(assert (=> b!800563 m!741959))

(declare-fun m!741961 () Bool)

(assert (=> b!800563 m!741961))

(declare-fun m!741963 () Bool)

(assert (=> b!800556 m!741963))

(declare-fun m!741965 () Bool)

(assert (=> b!800558 m!741965))

(declare-fun m!741967 () Bool)

(assert (=> b!800561 m!741967))

(assert (=> b!800561 m!741951))

(assert (=> b!800561 m!741951))

(declare-fun m!741969 () Bool)

(assert (=> b!800561 m!741969))

(assert (=> b!800561 m!741951))

(declare-fun m!741971 () Bool)

(assert (=> b!800561 m!741971))

(declare-fun m!741973 () Bool)

(assert (=> b!800559 m!741973))

(declare-fun m!741975 () Bool)

(assert (=> b!800560 m!741975))

(declare-fun m!741977 () Bool)

(assert (=> b!800560 m!741977))

(assert (=> b!800564 m!741951))

(assert (=> b!800564 m!741951))

(declare-fun m!741979 () Bool)

(assert (=> b!800564 m!741979))

(declare-fun m!741981 () Bool)

(assert (=> b!800554 m!741981))

(declare-fun m!741983 () Bool)

(assert (=> b!800553 m!741983))

(declare-fun m!741985 () Bool)

(assert (=> start!68852 m!741985))

(declare-fun m!741987 () Bool)

(assert (=> start!68852 m!741987))

(declare-fun m!741989 () Bool)

(assert (=> b!800557 m!741989))

(check-sat (not b!800558) (not b!800559) (not b!800555) (not b!800554) (not b!800561) (not start!68852) (not b!800556) (not b!800557) (not b!800553) (not b!800564) (not b!800565) (not b!800563))
(check-sat)
