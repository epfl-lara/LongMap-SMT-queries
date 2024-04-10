; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69164 () Bool)

(assert start!69164)

(declare-fun b!806537 () Bool)

(declare-fun res!550664 () Bool)

(declare-fun e!446635 () Bool)

(assert (=> b!806537 (=> (not res!550664) (not e!446635))))

(declare-datatypes ((array!43864 0))(
  ( (array!43865 (arr!21009 (Array (_ BitVec 32) (_ BitVec 64))) (size!21430 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43864)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806537 (= res!550664 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806538 () Bool)

(declare-fun e!446636 () Bool)

(declare-fun e!446638 () Bool)

(assert (=> b!806538 (= e!446636 e!446638)))

(declare-fun res!550661 () Bool)

(assert (=> b!806538 (=> (not res!550661) (not e!446638))))

(declare-datatypes ((SeekEntryResult!8600 0))(
  ( (MissingZero!8600 (index!36768 (_ BitVec 32))) (Found!8600 (index!36769 (_ BitVec 32))) (Intermediate!8600 (undefined!9412 Bool) (index!36770 (_ BitVec 32)) (x!67588 (_ BitVec 32))) (Undefined!8600) (MissingVacant!8600 (index!36771 (_ BitVec 32))) )
))
(declare-fun lt!361202 () SeekEntryResult!8600)

(declare-fun lt!361199 () SeekEntryResult!8600)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806538 (= res!550661 (and (= lt!361199 lt!361202) (= lt!361202 (Found!8600 j!153)) (= (select (arr!21009 a!3170) index!1236) (select (arr!21009 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43864 (_ BitVec 32)) SeekEntryResult!8600)

(assert (=> b!806538 (= lt!361202 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21009 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43864 (_ BitVec 32)) SeekEntryResult!8600)

(assert (=> b!806538 (= lt!361199 (seekEntryOrOpen!0 (select (arr!21009 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!550666 () Bool)

(assert (=> start!69164 (=> (not res!550666) (not e!446635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69164 (= res!550666 (validMask!0 mask!3266))))

(assert (=> start!69164 e!446635))

(assert (=> start!69164 true))

(declare-fun array_inv!16805 (array!43864) Bool)

(assert (=> start!69164 (array_inv!16805 a!3170)))

(declare-fun b!806539 () Bool)

(declare-fun res!550667 () Bool)

(assert (=> b!806539 (=> (not res!550667) (not e!446635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806539 (= res!550667 (validKeyInArray!0 k!2044))))

(declare-fun b!806540 () Bool)

(declare-fun res!550665 () Bool)

(declare-fun e!446639 () Bool)

(assert (=> b!806540 (=> (not res!550665) (not e!446639))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806540 (= res!550665 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21430 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21009 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21430 a!3170)) (= (select (arr!21009 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806541 () Bool)

(declare-fun res!550663 () Bool)

(assert (=> b!806541 (=> (not res!550663) (not e!446639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43864 (_ BitVec 32)) Bool)

(assert (=> b!806541 (= res!550663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806542 () Bool)

(declare-fun res!550662 () Bool)

(assert (=> b!806542 (=> (not res!550662) (not e!446635))))

(assert (=> b!806542 (= res!550662 (validKeyInArray!0 (select (arr!21009 a!3170) j!153)))))

(declare-fun b!806543 () Bool)

(assert (=> b!806543 (= e!446635 e!446639)))

(declare-fun res!550669 () Bool)

(assert (=> b!806543 (=> (not res!550669) (not e!446639))))

(declare-fun lt!361203 () SeekEntryResult!8600)

(assert (=> b!806543 (= res!550669 (or (= lt!361203 (MissingZero!8600 i!1163)) (= lt!361203 (MissingVacant!8600 i!1163))))))

(assert (=> b!806543 (= lt!361203 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806544 () Bool)

(declare-fun res!550668 () Bool)

(assert (=> b!806544 (=> (not res!550668) (not e!446639))))

(declare-datatypes ((List!14972 0))(
  ( (Nil!14969) (Cons!14968 (h!16097 (_ BitVec 64)) (t!21287 List!14972)) )
))
(declare-fun arrayNoDuplicates!0 (array!43864 (_ BitVec 32) List!14972) Bool)

(assert (=> b!806544 (= res!550668 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14969))))

(declare-fun b!806545 () Bool)

(assert (=> b!806545 (= e!446638 (not true))))

(declare-fun lt!361205 () SeekEntryResult!8600)

(assert (=> b!806545 (= lt!361205 (Found!8600 index!1236))))

(declare-fun b!806546 () Bool)

(declare-fun res!550670 () Bool)

(assert (=> b!806546 (=> (not res!550670) (not e!446635))))

(assert (=> b!806546 (= res!550670 (and (= (size!21430 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21430 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21430 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806547 () Bool)

(assert (=> b!806547 (= e!446639 e!446636)))

(declare-fun res!550660 () Bool)

(assert (=> b!806547 (=> (not res!550660) (not e!446636))))

(declare-fun lt!361204 () SeekEntryResult!8600)

(assert (=> b!806547 (= res!550660 (= lt!361204 lt!361205))))

(declare-fun lt!361200 () array!43864)

(declare-fun lt!361201 () (_ BitVec 64))

(assert (=> b!806547 (= lt!361205 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361201 lt!361200 mask!3266))))

(assert (=> b!806547 (= lt!361204 (seekEntryOrOpen!0 lt!361201 lt!361200 mask!3266))))

(assert (=> b!806547 (= lt!361201 (select (store (arr!21009 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806547 (= lt!361200 (array!43865 (store (arr!21009 a!3170) i!1163 k!2044) (size!21430 a!3170)))))

(assert (= (and start!69164 res!550666) b!806546))

(assert (= (and b!806546 res!550670) b!806542))

(assert (= (and b!806542 res!550662) b!806539))

(assert (= (and b!806539 res!550667) b!806537))

(assert (= (and b!806537 res!550664) b!806543))

(assert (= (and b!806543 res!550669) b!806541))

(assert (= (and b!806541 res!550663) b!806544))

(assert (= (and b!806544 res!550668) b!806540))

(assert (= (and b!806540 res!550665) b!806547))

(assert (= (and b!806547 res!550660) b!806538))

(assert (= (and b!806538 res!550661) b!806545))

(declare-fun m!748469 () Bool)

(assert (=> b!806541 m!748469))

(declare-fun m!748471 () Bool)

(assert (=> b!806538 m!748471))

(declare-fun m!748473 () Bool)

(assert (=> b!806538 m!748473))

(assert (=> b!806538 m!748473))

(declare-fun m!748475 () Bool)

(assert (=> b!806538 m!748475))

(assert (=> b!806538 m!748473))

(declare-fun m!748477 () Bool)

(assert (=> b!806538 m!748477))

(declare-fun m!748479 () Bool)

(assert (=> b!806544 m!748479))

(declare-fun m!748481 () Bool)

(assert (=> b!806537 m!748481))

(declare-fun m!748483 () Bool)

(assert (=> b!806547 m!748483))

(declare-fun m!748485 () Bool)

(assert (=> b!806547 m!748485))

(declare-fun m!748487 () Bool)

(assert (=> b!806547 m!748487))

(declare-fun m!748489 () Bool)

(assert (=> b!806547 m!748489))

(declare-fun m!748491 () Bool)

(assert (=> b!806540 m!748491))

(declare-fun m!748493 () Bool)

(assert (=> b!806540 m!748493))

(declare-fun m!748495 () Bool)

(assert (=> b!806543 m!748495))

(declare-fun m!748497 () Bool)

(assert (=> start!69164 m!748497))

(declare-fun m!748499 () Bool)

(assert (=> start!69164 m!748499))

(assert (=> b!806542 m!748473))

(assert (=> b!806542 m!748473))

(declare-fun m!748501 () Bool)

(assert (=> b!806542 m!748501))

(declare-fun m!748503 () Bool)

(assert (=> b!806539 m!748503))

(push 1)

