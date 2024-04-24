; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68960 () Bool)

(assert start!68960)

(declare-fun b!802637 () Bool)

(declare-fun res!546608 () Bool)

(declare-fun e!444968 () Bool)

(assert (=> b!802637 (=> (not res!546608) (not e!444968))))

(declare-datatypes ((array!43582 0))(
  ( (array!43583 (arr!20866 (Array (_ BitVec 32) (_ BitVec 64))) (size!21286 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43582)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802637 (= res!546608 (validKeyInArray!0 (select (arr!20866 a!3170) j!153)))))

(declare-fun b!802638 () Bool)

(declare-fun e!444970 () Bool)

(assert (=> b!802638 (= e!444968 e!444970)))

(declare-fun res!546616 () Bool)

(assert (=> b!802638 (=> (not res!546616) (not e!444970))))

(declare-datatypes ((SeekEntryResult!8413 0))(
  ( (MissingZero!8413 (index!36020 (_ BitVec 32))) (Found!8413 (index!36021 (_ BitVec 32))) (Intermediate!8413 (undefined!9225 Bool) (index!36022 (_ BitVec 32)) (x!67041 (_ BitVec 32))) (Undefined!8413) (MissingVacant!8413 (index!36023 (_ BitVec 32))) )
))
(declare-fun lt!358772 () SeekEntryResult!8413)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802638 (= res!546616 (or (= lt!358772 (MissingZero!8413 i!1163)) (= lt!358772 (MissingVacant!8413 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43582 (_ BitVec 32)) SeekEntryResult!8413)

(assert (=> b!802638 (= lt!358772 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802639 () Bool)

(declare-fun e!444966 () Bool)

(assert (=> b!802639 (= e!444966 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun lt!358775 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358778 () (_ BitVec 64))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!358776 () array!43582)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43582 (_ BitVec 32)) SeekEntryResult!8413)

(assert (=> b!802639 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358775 vacantAfter!23 lt!358778 lt!358776 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358775 vacantBefore!23 (select (arr!20866 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27451 0))(
  ( (Unit!27452) )
))
(declare-fun lt!358774 () Unit!27451)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43582 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27451)

(assert (=> b!802639 (= lt!358774 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358775 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802639 (= lt!358775 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun res!546613 () Bool)

(assert (=> start!68960 (=> (not res!546613) (not e!444968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68960 (= res!546613 (validMask!0 mask!3266))))

(assert (=> start!68960 e!444968))

(assert (=> start!68960 true))

(declare-fun array_inv!16725 (array!43582) Bool)

(assert (=> start!68960 (array_inv!16725 a!3170)))

(declare-fun b!802640 () Bool)

(declare-fun e!444967 () Bool)

(assert (=> b!802640 (= e!444970 e!444967)))

(declare-fun res!546611 () Bool)

(assert (=> b!802640 (=> (not res!546611) (not e!444967))))

(assert (=> b!802640 (= res!546611 (= (seekEntryOrOpen!0 lt!358778 lt!358776 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358778 lt!358776 mask!3266)))))

(assert (=> b!802640 (= lt!358778 (select (store (arr!20866 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802640 (= lt!358776 (array!43583 (store (arr!20866 a!3170) i!1163 k0!2044) (size!21286 a!3170)))))

(declare-fun b!802641 () Bool)

(declare-fun res!546612 () Bool)

(assert (=> b!802641 (=> (not res!546612) (not e!444970))))

(assert (=> b!802641 (= res!546612 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21286 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20866 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21286 a!3170)) (= (select (arr!20866 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802642 () Bool)

(declare-fun res!546610 () Bool)

(assert (=> b!802642 (=> (not res!546610) (not e!444970))))

(declare-datatypes ((List!14736 0))(
  ( (Nil!14733) (Cons!14732 (h!15867 (_ BitVec 64)) (t!21043 List!14736)) )
))
(declare-fun arrayNoDuplicates!0 (array!43582 (_ BitVec 32) List!14736) Bool)

(assert (=> b!802642 (= res!546610 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14733))))

(declare-fun b!802643 () Bool)

(declare-fun res!546609 () Bool)

(assert (=> b!802643 (=> (not res!546609) (not e!444968))))

(assert (=> b!802643 (= res!546609 (and (= (size!21286 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21286 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21286 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802644 () Bool)

(assert (=> b!802644 (= e!444967 e!444966)))

(declare-fun res!546617 () Bool)

(assert (=> b!802644 (=> (not res!546617) (not e!444966))))

(declare-fun lt!358773 () SeekEntryResult!8413)

(declare-fun lt!358777 () SeekEntryResult!8413)

(assert (=> b!802644 (= res!546617 (and (= lt!358773 lt!358777) (= lt!358777 (Found!8413 j!153)) (not (= (select (arr!20866 a!3170) index!1236) (select (arr!20866 a!3170) j!153)))))))

(assert (=> b!802644 (= lt!358777 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20866 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802644 (= lt!358773 (seekEntryOrOpen!0 (select (arr!20866 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802645 () Bool)

(declare-fun res!546615 () Bool)

(assert (=> b!802645 (=> (not res!546615) (not e!444968))))

(assert (=> b!802645 (= res!546615 (validKeyInArray!0 k0!2044))))

(declare-fun b!802646 () Bool)

(declare-fun res!546614 () Bool)

(assert (=> b!802646 (=> (not res!546614) (not e!444970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43582 (_ BitVec 32)) Bool)

(assert (=> b!802646 (= res!546614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802647 () Bool)

(declare-fun res!546618 () Bool)

(assert (=> b!802647 (=> (not res!546618) (not e!444968))))

(declare-fun arrayContainsKey!0 (array!43582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802647 (= res!546618 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68960 res!546613) b!802643))

(assert (= (and b!802643 res!546609) b!802637))

(assert (= (and b!802637 res!546608) b!802645))

(assert (= (and b!802645 res!546615) b!802647))

(assert (= (and b!802647 res!546618) b!802638))

(assert (= (and b!802638 res!546616) b!802646))

(assert (= (and b!802646 res!546614) b!802642))

(assert (= (and b!802642 res!546610) b!802641))

(assert (= (and b!802641 res!546612) b!802640))

(assert (= (and b!802640 res!546611) b!802644))

(assert (= (and b!802644 res!546617) b!802639))

(declare-fun m!744223 () Bool)

(assert (=> b!802641 m!744223))

(declare-fun m!744225 () Bool)

(assert (=> b!802641 m!744225))

(declare-fun m!744227 () Bool)

(assert (=> start!68960 m!744227))

(declare-fun m!744229 () Bool)

(assert (=> start!68960 m!744229))

(declare-fun m!744231 () Bool)

(assert (=> b!802645 m!744231))

(declare-fun m!744233 () Bool)

(assert (=> b!802640 m!744233))

(declare-fun m!744235 () Bool)

(assert (=> b!802640 m!744235))

(declare-fun m!744237 () Bool)

(assert (=> b!802640 m!744237))

(declare-fun m!744239 () Bool)

(assert (=> b!802640 m!744239))

(declare-fun m!744241 () Bool)

(assert (=> b!802642 m!744241))

(declare-fun m!744243 () Bool)

(assert (=> b!802647 m!744243))

(declare-fun m!744245 () Bool)

(assert (=> b!802639 m!744245))

(declare-fun m!744247 () Bool)

(assert (=> b!802639 m!744247))

(assert (=> b!802639 m!744245))

(declare-fun m!744249 () Bool)

(assert (=> b!802639 m!744249))

(declare-fun m!744251 () Bool)

(assert (=> b!802639 m!744251))

(declare-fun m!744253 () Bool)

(assert (=> b!802639 m!744253))

(assert (=> b!802637 m!744245))

(assert (=> b!802637 m!744245))

(declare-fun m!744255 () Bool)

(assert (=> b!802637 m!744255))

(declare-fun m!744257 () Bool)

(assert (=> b!802638 m!744257))

(declare-fun m!744259 () Bool)

(assert (=> b!802644 m!744259))

(assert (=> b!802644 m!744245))

(assert (=> b!802644 m!744245))

(declare-fun m!744261 () Bool)

(assert (=> b!802644 m!744261))

(assert (=> b!802644 m!744245))

(declare-fun m!744263 () Bool)

(assert (=> b!802644 m!744263))

(declare-fun m!744265 () Bool)

(assert (=> b!802646 m!744265))

(check-sat (not b!802642) (not b!802640) (not b!802644) (not b!802647) (not b!802638) (not b!802645) (not b!802646) (not b!802639) (not start!68960) (not b!802637))
(check-sat)
