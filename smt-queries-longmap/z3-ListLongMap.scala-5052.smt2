; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68802 () Bool)

(assert start!68802)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43609 0))(
  ( (array!43610 (arr!20885 (Array (_ BitVec 32) (_ BitVec 64))) (size!21306 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43609)

(declare-fun e!444468 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun b!801994 () Bool)

(assert (=> b!801994 (= e!444468 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20885 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358495 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358490 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358493 () array!43609)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8473 0))(
  ( (MissingZero!8473 (index!36260 (_ BitVec 32))) (Found!8473 (index!36261 (_ BitVec 32))) (Intermediate!8473 (undefined!9285 Bool) (index!36262 (_ BitVec 32)) (x!67122 (_ BitVec 32))) (Undefined!8473) (MissingVacant!8473 (index!36263 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43609 (_ BitVec 32)) SeekEntryResult!8473)

(assert (=> b!801994 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358490 vacantAfter!23 lt!358495 lt!358493 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358490 vacantBefore!23 (select (arr!20885 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27460 0))(
  ( (Unit!27461) )
))
(declare-fun lt!358496 () Unit!27460)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27460)

(assert (=> b!801994 (= lt!358496 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358490 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801994 (= lt!358490 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801995 () Bool)

(declare-fun res!546659 () Bool)

(declare-fun e!444466 () Bool)

(assert (=> b!801995 (=> (not res!546659) (not e!444466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801995 (= res!546659 (validKeyInArray!0 (select (arr!20885 a!3170) j!153)))))

(declare-fun b!801996 () Bool)

(declare-fun e!444467 () Bool)

(assert (=> b!801996 (= e!444467 e!444468)))

(declare-fun res!546657 () Bool)

(assert (=> b!801996 (=> (not res!546657) (not e!444468))))

(declare-fun lt!358492 () SeekEntryResult!8473)

(declare-fun lt!358491 () SeekEntryResult!8473)

(assert (=> b!801996 (= res!546657 (and (= lt!358492 lt!358491) (= lt!358491 (Found!8473 j!153)) (not (= (select (arr!20885 a!3170) index!1236) (select (arr!20885 a!3170) j!153)))))))

(assert (=> b!801996 (= lt!358491 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20885 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43609 (_ BitVec 32)) SeekEntryResult!8473)

(assert (=> b!801996 (= lt!358492 (seekEntryOrOpen!0 (select (arr!20885 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801997 () Bool)

(declare-fun res!546662 () Bool)

(assert (=> b!801997 (=> (not res!546662) (not e!444466))))

(assert (=> b!801997 (= res!546662 (validKeyInArray!0 k0!2044))))

(declare-fun b!801998 () Bool)

(declare-fun res!546653 () Bool)

(declare-fun e!444469 () Bool)

(assert (=> b!801998 (=> (not res!546653) (not e!444469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43609 (_ BitVec 32)) Bool)

(assert (=> b!801998 (= res!546653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801999 () Bool)

(assert (=> b!801999 (= e!444469 e!444467)))

(declare-fun res!546655 () Bool)

(assert (=> b!801999 (=> (not res!546655) (not e!444467))))

(assert (=> b!801999 (= res!546655 (= (seekEntryOrOpen!0 lt!358495 lt!358493 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358495 lt!358493 mask!3266)))))

(assert (=> b!801999 (= lt!358495 (select (store (arr!20885 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801999 (= lt!358493 (array!43610 (store (arr!20885 a!3170) i!1163 k0!2044) (size!21306 a!3170)))))

(declare-fun b!802000 () Bool)

(assert (=> b!802000 (= e!444466 e!444469)))

(declare-fun res!546656 () Bool)

(assert (=> b!802000 (=> (not res!546656) (not e!444469))))

(declare-fun lt!358494 () SeekEntryResult!8473)

(assert (=> b!802000 (= res!546656 (or (= lt!358494 (MissingZero!8473 i!1163)) (= lt!358494 (MissingVacant!8473 i!1163))))))

(assert (=> b!802000 (= lt!358494 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!546658 () Bool)

(assert (=> start!68802 (=> (not res!546658) (not e!444466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68802 (= res!546658 (validMask!0 mask!3266))))

(assert (=> start!68802 e!444466))

(assert (=> start!68802 true))

(declare-fun array_inv!16768 (array!43609) Bool)

(assert (=> start!68802 (array_inv!16768 a!3170)))

(declare-fun b!802001 () Bool)

(declare-fun res!546660 () Bool)

(assert (=> b!802001 (=> (not res!546660) (not e!444466))))

(assert (=> b!802001 (= res!546660 (and (= (size!21306 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21306 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21306 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802002 () Bool)

(declare-fun res!546654 () Bool)

(assert (=> b!802002 (=> (not res!546654) (not e!444469))))

(declare-datatypes ((List!14887 0))(
  ( (Nil!14884) (Cons!14883 (h!16012 (_ BitVec 64)) (t!21193 List!14887)) )
))
(declare-fun arrayNoDuplicates!0 (array!43609 (_ BitVec 32) List!14887) Bool)

(assert (=> b!802002 (= res!546654 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14884))))

(declare-fun b!802003 () Bool)

(declare-fun res!546663 () Bool)

(assert (=> b!802003 (=> (not res!546663) (not e!444466))))

(declare-fun arrayContainsKey!0 (array!43609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802003 (= res!546663 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802004 () Bool)

(declare-fun res!546661 () Bool)

(assert (=> b!802004 (=> (not res!546661) (not e!444469))))

(assert (=> b!802004 (= res!546661 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21306 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20885 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21306 a!3170)) (= (select (arr!20885 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68802 res!546658) b!802001))

(assert (= (and b!802001 res!546660) b!801995))

(assert (= (and b!801995 res!546659) b!801997))

(assert (= (and b!801997 res!546662) b!802003))

(assert (= (and b!802003 res!546663) b!802000))

(assert (= (and b!802000 res!546656) b!801998))

(assert (= (and b!801998 res!546653) b!802002))

(assert (= (and b!802002 res!546654) b!802004))

(assert (= (and b!802004 res!546661) b!801999))

(assert (= (and b!801999 res!546655) b!801996))

(assert (= (and b!801996 res!546657) b!801994))

(declare-fun m!742885 () Bool)

(assert (=> b!801997 m!742885))

(declare-fun m!742887 () Bool)

(assert (=> start!68802 m!742887))

(declare-fun m!742889 () Bool)

(assert (=> start!68802 m!742889))

(declare-fun m!742891 () Bool)

(assert (=> b!802002 m!742891))

(declare-fun m!742893 () Bool)

(assert (=> b!801994 m!742893))

(declare-fun m!742895 () Bool)

(assert (=> b!801994 m!742895))

(assert (=> b!801994 m!742895))

(declare-fun m!742897 () Bool)

(assert (=> b!801994 m!742897))

(declare-fun m!742899 () Bool)

(assert (=> b!801994 m!742899))

(declare-fun m!742901 () Bool)

(assert (=> b!801994 m!742901))

(declare-fun m!742903 () Bool)

(assert (=> b!801994 m!742903))

(declare-fun m!742905 () Bool)

(assert (=> b!801994 m!742905))

(declare-fun m!742907 () Bool)

(assert (=> b!802003 m!742907))

(declare-fun m!742909 () Bool)

(assert (=> b!801996 m!742909))

(assert (=> b!801996 m!742895))

(assert (=> b!801996 m!742895))

(declare-fun m!742911 () Bool)

(assert (=> b!801996 m!742911))

(assert (=> b!801996 m!742895))

(declare-fun m!742913 () Bool)

(assert (=> b!801996 m!742913))

(declare-fun m!742915 () Bool)

(assert (=> b!801998 m!742915))

(declare-fun m!742917 () Bool)

(assert (=> b!802004 m!742917))

(declare-fun m!742919 () Bool)

(assert (=> b!802004 m!742919))

(declare-fun m!742921 () Bool)

(assert (=> b!801999 m!742921))

(declare-fun m!742923 () Bool)

(assert (=> b!801999 m!742923))

(assert (=> b!801999 m!742905))

(declare-fun m!742925 () Bool)

(assert (=> b!801999 m!742925))

(assert (=> b!801995 m!742895))

(assert (=> b!801995 m!742895))

(declare-fun m!742927 () Bool)

(assert (=> b!801995 m!742927))

(declare-fun m!742929 () Bool)

(assert (=> b!802000 m!742929))

(check-sat (not b!801997) (not b!801999) (not b!802003) (not start!68802) (not b!802000) (not b!801998) (not b!801996) (not b!802002) (not b!801995) (not b!801994))
(check-sat)
