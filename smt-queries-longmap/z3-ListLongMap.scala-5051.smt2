; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68796 () Bool)

(assert start!68796)

(declare-fun b!801895 () Bool)

(declare-fun e!444424 () Bool)

(declare-fun e!444420 () Bool)

(assert (=> b!801895 (= e!444424 e!444420)))

(declare-fun res!546563 () Bool)

(assert (=> b!801895 (=> (not res!546563) (not e!444420))))

(declare-datatypes ((SeekEntryResult!8470 0))(
  ( (MissingZero!8470 (index!36248 (_ BitVec 32))) (Found!8470 (index!36249 (_ BitVec 32))) (Intermediate!8470 (undefined!9282 Bool) (index!36250 (_ BitVec 32)) (x!67111 (_ BitVec 32))) (Undefined!8470) (MissingVacant!8470 (index!36251 (_ BitVec 32))) )
))
(declare-fun lt!358428 () SeekEntryResult!8470)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801895 (= res!546563 (or (= lt!358428 (MissingZero!8470 i!1163)) (= lt!358428 (MissingVacant!8470 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43603 0))(
  ( (array!43604 (arr!20882 (Array (_ BitVec 32) (_ BitVec 64))) (size!21303 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43603)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43603 (_ BitVec 32)) SeekEntryResult!8470)

(assert (=> b!801895 (= lt!358428 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801896 () Bool)

(declare-fun res!546564 () Bool)

(assert (=> b!801896 (=> (not res!546564) (not e!444424))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801896 (= res!546564 (and (= (size!21303 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21303 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21303 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801897 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun e!444422 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801897 (= e!444422 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358429 () (_ BitVec 64))

(declare-fun lt!358427 () (_ BitVec 32))

(declare-fun lt!358432 () array!43603)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43603 (_ BitVec 32)) SeekEntryResult!8470)

(assert (=> b!801897 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358427 vacantAfter!23 lt!358429 lt!358432 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358427 vacantBefore!23 (select (arr!20882 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27454 0))(
  ( (Unit!27455) )
))
(declare-fun lt!358431 () Unit!27454)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43603 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27454)

(assert (=> b!801897 (= lt!358431 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358427 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801897 (= lt!358427 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801898 () Bool)

(declare-fun res!546561 () Bool)

(assert (=> b!801898 (=> (not res!546561) (not e!444420))))

(assert (=> b!801898 (= res!546561 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21303 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20882 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21303 a!3170)) (= (select (arr!20882 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801899 () Bool)

(declare-fun e!444423 () Bool)

(assert (=> b!801899 (= e!444423 e!444422)))

(declare-fun res!546556 () Bool)

(assert (=> b!801899 (=> (not res!546556) (not e!444422))))

(declare-fun lt!358433 () SeekEntryResult!8470)

(declare-fun lt!358430 () SeekEntryResult!8470)

(assert (=> b!801899 (= res!546556 (and (= lt!358433 lt!358430) (= lt!358430 (Found!8470 j!153)) (not (= (select (arr!20882 a!3170) index!1236) (select (arr!20882 a!3170) j!153)))))))

(assert (=> b!801899 (= lt!358430 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20882 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801899 (= lt!358433 (seekEntryOrOpen!0 (select (arr!20882 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801900 () Bool)

(assert (=> b!801900 (= e!444420 e!444423)))

(declare-fun res!546557 () Bool)

(assert (=> b!801900 (=> (not res!546557) (not e!444423))))

(assert (=> b!801900 (= res!546557 (= (seekEntryOrOpen!0 lt!358429 lt!358432 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358429 lt!358432 mask!3266)))))

(assert (=> b!801900 (= lt!358429 (select (store (arr!20882 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801900 (= lt!358432 (array!43604 (store (arr!20882 a!3170) i!1163 k0!2044) (size!21303 a!3170)))))

(declare-fun b!801901 () Bool)

(declare-fun res!546562 () Bool)

(assert (=> b!801901 (=> (not res!546562) (not e!444424))))

(declare-fun arrayContainsKey!0 (array!43603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801901 (= res!546562 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801902 () Bool)

(declare-fun res!546559 () Bool)

(assert (=> b!801902 (=> (not res!546559) (not e!444424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801902 (= res!546559 (validKeyInArray!0 k0!2044))))

(declare-fun b!801904 () Bool)

(declare-fun res!546555 () Bool)

(assert (=> b!801904 (=> (not res!546555) (not e!444420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43603 (_ BitVec 32)) Bool)

(assert (=> b!801904 (= res!546555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801905 () Bool)

(declare-fun res!546560 () Bool)

(assert (=> b!801905 (=> (not res!546560) (not e!444424))))

(assert (=> b!801905 (= res!546560 (validKeyInArray!0 (select (arr!20882 a!3170) j!153)))))

(declare-fun b!801903 () Bool)

(declare-fun res!546558 () Bool)

(assert (=> b!801903 (=> (not res!546558) (not e!444420))))

(declare-datatypes ((List!14884 0))(
  ( (Nil!14881) (Cons!14880 (h!16009 (_ BitVec 64)) (t!21190 List!14884)) )
))
(declare-fun arrayNoDuplicates!0 (array!43603 (_ BitVec 32) List!14884) Bool)

(assert (=> b!801903 (= res!546558 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14881))))

(declare-fun res!546554 () Bool)

(assert (=> start!68796 (=> (not res!546554) (not e!444424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68796 (= res!546554 (validMask!0 mask!3266))))

(assert (=> start!68796 e!444424))

(assert (=> start!68796 true))

(declare-fun array_inv!16765 (array!43603) Bool)

(assert (=> start!68796 (array_inv!16765 a!3170)))

(assert (= (and start!68796 res!546554) b!801896))

(assert (= (and b!801896 res!546564) b!801905))

(assert (= (and b!801905 res!546560) b!801902))

(assert (= (and b!801902 res!546559) b!801901))

(assert (= (and b!801901 res!546562) b!801895))

(assert (= (and b!801895 res!546563) b!801904))

(assert (= (and b!801904 res!546555) b!801903))

(assert (= (and b!801903 res!546558) b!801898))

(assert (= (and b!801898 res!546561) b!801900))

(assert (= (and b!801900 res!546557) b!801899))

(assert (= (and b!801899 res!546556) b!801897))

(declare-fun m!742753 () Bool)

(assert (=> b!801895 m!742753))

(declare-fun m!742755 () Bool)

(assert (=> b!801900 m!742755))

(declare-fun m!742757 () Bool)

(assert (=> b!801900 m!742757))

(declare-fun m!742759 () Bool)

(assert (=> b!801900 m!742759))

(declare-fun m!742761 () Bool)

(assert (=> b!801900 m!742761))

(declare-fun m!742763 () Bool)

(assert (=> b!801902 m!742763))

(declare-fun m!742765 () Bool)

(assert (=> b!801897 m!742765))

(declare-fun m!742767 () Bool)

(assert (=> b!801897 m!742767))

(assert (=> b!801897 m!742765))

(declare-fun m!742769 () Bool)

(assert (=> b!801897 m!742769))

(declare-fun m!742771 () Bool)

(assert (=> b!801897 m!742771))

(declare-fun m!742773 () Bool)

(assert (=> b!801897 m!742773))

(declare-fun m!742775 () Bool)

(assert (=> b!801898 m!742775))

(declare-fun m!742777 () Bool)

(assert (=> b!801898 m!742777))

(declare-fun m!742779 () Bool)

(assert (=> b!801904 m!742779))

(declare-fun m!742781 () Bool)

(assert (=> b!801899 m!742781))

(assert (=> b!801899 m!742765))

(assert (=> b!801899 m!742765))

(declare-fun m!742783 () Bool)

(assert (=> b!801899 m!742783))

(assert (=> b!801899 m!742765))

(declare-fun m!742785 () Bool)

(assert (=> b!801899 m!742785))

(declare-fun m!742787 () Bool)

(assert (=> b!801903 m!742787))

(declare-fun m!742789 () Bool)

(assert (=> start!68796 m!742789))

(declare-fun m!742791 () Bool)

(assert (=> start!68796 m!742791))

(assert (=> b!801905 m!742765))

(assert (=> b!801905 m!742765))

(declare-fun m!742793 () Bool)

(assert (=> b!801905 m!742793))

(declare-fun m!742795 () Bool)

(assert (=> b!801901 m!742795))

(check-sat (not b!801897) (not b!801903) (not b!801901) (not b!801905) (not start!68796) (not b!801904) (not b!801902) (not b!801899) (not b!801895) (not b!801900))
(check-sat)
