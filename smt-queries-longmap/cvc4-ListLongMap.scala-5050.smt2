; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68814 () Bool)

(assert start!68814)

(declare-fun b!802112 () Bool)

(declare-fun e!444561 () Bool)

(declare-fun e!444560 () Bool)

(assert (=> b!802112 (= e!444561 e!444560)))

(declare-fun res!546636 () Bool)

(assert (=> b!802112 (=> (not res!546636) (not e!444560))))

(declare-datatypes ((SeekEntryResult!8473 0))(
  ( (MissingZero!8473 (index!36260 (_ BitVec 32))) (Found!8473 (index!36261 (_ BitVec 32))) (Intermediate!8473 (undefined!9285 Bool) (index!36262 (_ BitVec 32)) (x!67111 (_ BitVec 32))) (Undefined!8473) (MissingVacant!8473 (index!36263 (_ BitVec 32))) )
))
(declare-fun lt!358647 () SeekEntryResult!8473)

(declare-fun lt!358648 () SeekEntryResult!8473)

(declare-datatypes ((array!43604 0))(
  ( (array!43605 (arr!20882 (Array (_ BitVec 32) (_ BitVec 64))) (size!21303 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43604)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802112 (= res!546636 (and (= lt!358648 lt!358647) (= lt!358647 (Found!8473 j!153)) (not (= (select (arr!20882 a!3170) index!1236) (select (arr!20882 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43604 (_ BitVec 32)) SeekEntryResult!8473)

(assert (=> b!802112 (= lt!358647 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20882 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43604 (_ BitVec 32)) SeekEntryResult!8473)

(assert (=> b!802112 (= lt!358648 (seekEntryOrOpen!0 (select (arr!20882 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802113 () Bool)

(declare-fun res!546638 () Bool)

(declare-fun e!444562 () Bool)

(assert (=> b!802113 (=> (not res!546638) (not e!444562))))

(declare-datatypes ((List!14845 0))(
  ( (Nil!14842) (Cons!14841 (h!15970 (_ BitVec 64)) (t!21160 List!14845)) )
))
(declare-fun arrayNoDuplicates!0 (array!43604 (_ BitVec 32) List!14845) Bool)

(assert (=> b!802113 (= res!546638 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14842))))

(declare-fun b!802114 () Bool)

(declare-fun res!546635 () Bool)

(assert (=> b!802114 (=> (not res!546635) (not e!444562))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802114 (= res!546635 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21303 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20882 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21303 a!3170)) (= (select (arr!20882 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802115 () Bool)

(declare-fun e!444559 () Bool)

(assert (=> b!802115 (= e!444559 e!444562)))

(declare-fun res!546637 () Bool)

(assert (=> b!802115 (=> (not res!546637) (not e!444562))))

(declare-fun lt!358652 () SeekEntryResult!8473)

(assert (=> b!802115 (= res!546637 (or (= lt!358652 (MissingZero!8473 i!1163)) (= lt!358652 (MissingVacant!8473 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!802115 (= lt!358652 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802116 () Bool)

(declare-fun res!546641 () Bool)

(assert (=> b!802116 (=> (not res!546641) (not e!444562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43604 (_ BitVec 32)) Bool)

(assert (=> b!802116 (= res!546641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802118 () Bool)

(declare-fun res!546639 () Bool)

(assert (=> b!802118 (=> (not res!546639) (not e!444559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802118 (= res!546639 (validKeyInArray!0 k!2044))))

(declare-fun res!546632 () Bool)

(assert (=> start!68814 (=> (not res!546632) (not e!444559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68814 (= res!546632 (validMask!0 mask!3266))))

(assert (=> start!68814 e!444559))

(assert (=> start!68814 true))

(declare-fun array_inv!16678 (array!43604) Bool)

(assert (=> start!68814 (array_inv!16678 a!3170)))

(declare-fun b!802117 () Bool)

(declare-fun res!546634 () Bool)

(assert (=> b!802117 (=> (not res!546634) (not e!444559))))

(assert (=> b!802117 (= res!546634 (validKeyInArray!0 (select (arr!20882 a!3170) j!153)))))

(declare-fun b!802119 () Bool)

(declare-fun res!546633 () Bool)

(assert (=> b!802119 (=> (not res!546633) (not e!444559))))

(assert (=> b!802119 (= res!546633 (and (= (size!21303 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21303 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21303 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802120 () Bool)

(assert (=> b!802120 (= e!444560 (not true))))

(declare-fun lt!358650 () (_ BitVec 32))

(declare-fun lt!358649 () array!43604)

(declare-fun lt!358646 () (_ BitVec 64))

(assert (=> b!802120 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358650 vacantAfter!23 lt!358646 lt!358649 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358650 vacantBefore!23 (select (arr!20882 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27486 0))(
  ( (Unit!27487) )
))
(declare-fun lt!358651 () Unit!27486)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43604 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27486)

(assert (=> b!802120 (= lt!358651 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358650 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802120 (= lt!358650 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802121 () Bool)

(declare-fun res!546640 () Bool)

(assert (=> b!802121 (=> (not res!546640) (not e!444559))))

(declare-fun arrayContainsKey!0 (array!43604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802121 (= res!546640 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802122 () Bool)

(assert (=> b!802122 (= e!444562 e!444561)))

(declare-fun res!546631 () Bool)

(assert (=> b!802122 (=> (not res!546631) (not e!444561))))

(assert (=> b!802122 (= res!546631 (= (seekEntryOrOpen!0 lt!358646 lt!358649 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358646 lt!358649 mask!3266)))))

(assert (=> b!802122 (= lt!358646 (select (store (arr!20882 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802122 (= lt!358649 (array!43605 (store (arr!20882 a!3170) i!1163 k!2044) (size!21303 a!3170)))))

(assert (= (and start!68814 res!546632) b!802119))

(assert (= (and b!802119 res!546633) b!802117))

(assert (= (and b!802117 res!546634) b!802118))

(assert (= (and b!802118 res!546639) b!802121))

(assert (= (and b!802121 res!546640) b!802115))

(assert (= (and b!802115 res!546637) b!802116))

(assert (= (and b!802116 res!546641) b!802113))

(assert (= (and b!802113 res!546638) b!802114))

(assert (= (and b!802114 res!546635) b!802122))

(assert (= (and b!802122 res!546631) b!802112))

(assert (= (and b!802112 res!546636) b!802120))

(declare-fun m!743451 () Bool)

(assert (=> b!802120 m!743451))

(declare-fun m!743453 () Bool)

(assert (=> b!802120 m!743453))

(assert (=> b!802120 m!743451))

(declare-fun m!743455 () Bool)

(assert (=> b!802120 m!743455))

(declare-fun m!743457 () Bool)

(assert (=> b!802120 m!743457))

(declare-fun m!743459 () Bool)

(assert (=> b!802120 m!743459))

(declare-fun m!743461 () Bool)

(assert (=> b!802121 m!743461))

(declare-fun m!743463 () Bool)

(assert (=> b!802122 m!743463))

(declare-fun m!743465 () Bool)

(assert (=> b!802122 m!743465))

(declare-fun m!743467 () Bool)

(assert (=> b!802122 m!743467))

(declare-fun m!743469 () Bool)

(assert (=> b!802122 m!743469))

(declare-fun m!743471 () Bool)

(assert (=> b!802114 m!743471))

(declare-fun m!743473 () Bool)

(assert (=> b!802114 m!743473))

(declare-fun m!743475 () Bool)

(assert (=> b!802116 m!743475))

(assert (=> b!802117 m!743451))

(assert (=> b!802117 m!743451))

(declare-fun m!743477 () Bool)

(assert (=> b!802117 m!743477))

(declare-fun m!743479 () Bool)

(assert (=> b!802112 m!743479))

(assert (=> b!802112 m!743451))

(assert (=> b!802112 m!743451))

(declare-fun m!743481 () Bool)

(assert (=> b!802112 m!743481))

(assert (=> b!802112 m!743451))

(declare-fun m!743483 () Bool)

(assert (=> b!802112 m!743483))

(declare-fun m!743485 () Bool)

(assert (=> start!68814 m!743485))

(declare-fun m!743487 () Bool)

(assert (=> start!68814 m!743487))

(declare-fun m!743489 () Bool)

(assert (=> b!802115 m!743489))

(declare-fun m!743491 () Bool)

(assert (=> b!802118 m!743491))

(declare-fun m!743493 () Bool)

(assert (=> b!802113 m!743493))

(push 1)

(assert (not b!802117))

(assert (not b!802113))

(assert (not start!68814))

