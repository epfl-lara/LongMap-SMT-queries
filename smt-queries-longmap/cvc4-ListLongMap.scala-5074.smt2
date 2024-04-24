; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69124 () Bool)

(assert start!69124)

(declare-fun b!805278 () Bool)

(declare-fun res!549252 () Bool)

(declare-fun e!446205 () Bool)

(assert (=> b!805278 (=> (not res!549252) (not e!446205))))

(declare-datatypes ((array!43746 0))(
  ( (array!43747 (arr!20948 (Array (_ BitVec 32) (_ BitVec 64))) (size!21368 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43746)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43746 (_ BitVec 32)) Bool)

(assert (=> b!805278 (= res!549252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805279 () Bool)

(declare-fun res!549251 () Bool)

(declare-fun e!446206 () Bool)

(assert (=> b!805279 (=> (not res!549251) (not e!446206))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805279 (= res!549251 (validKeyInArray!0 (select (arr!20948 a!3170) j!153)))))

(declare-fun b!805280 () Bool)

(declare-fun res!549253 () Bool)

(assert (=> b!805280 (=> (not res!549253) (not e!446206))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805280 (= res!549253 (and (= (size!21368 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21368 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21368 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805281 () Bool)

(declare-fun res!549250 () Bool)

(assert (=> b!805281 (=> (not res!549250) (not e!446206))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805281 (= res!549250 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!549254 () Bool)

(assert (=> start!69124 (=> (not res!549254) (not e!446206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69124 (= res!549254 (validMask!0 mask!3266))))

(assert (=> start!69124 e!446206))

(assert (=> start!69124 true))

(declare-fun array_inv!16807 (array!43746) Bool)

(assert (=> start!69124 (array_inv!16807 a!3170)))

(declare-fun b!805282 () Bool)

(assert (=> b!805282 (= e!446206 e!446205)))

(declare-fun res!549255 () Bool)

(assert (=> b!805282 (=> (not res!549255) (not e!446205))))

(declare-datatypes ((SeekEntryResult!8495 0))(
  ( (MissingZero!8495 (index!36348 (_ BitVec 32))) (Found!8495 (index!36349 (_ BitVec 32))) (Intermediate!8495 (undefined!9307 Bool) (index!36350 (_ BitVec 32)) (x!67339 (_ BitVec 32))) (Undefined!8495) (MissingVacant!8495 (index!36351 (_ BitVec 32))) )
))
(declare-fun lt!360496 () SeekEntryResult!8495)

(assert (=> b!805282 (= res!549255 (or (= lt!360496 (MissingZero!8495 i!1163)) (= lt!360496 (MissingVacant!8495 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43746 (_ BitVec 32)) SeekEntryResult!8495)

(assert (=> b!805282 (= lt!360496 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805283 () Bool)

(declare-fun res!549249 () Bool)

(assert (=> b!805283 (=> (not res!549249) (not e!446206))))

(assert (=> b!805283 (= res!549249 (validKeyInArray!0 k!2044))))

(declare-fun b!805284 () Bool)

(assert (=> b!805284 (= e!446205 false)))

(declare-fun lt!360497 () Bool)

(declare-datatypes ((List!14818 0))(
  ( (Nil!14815) (Cons!14814 (h!15949 (_ BitVec 64)) (t!21125 List!14818)) )
))
(declare-fun arrayNoDuplicates!0 (array!43746 (_ BitVec 32) List!14818) Bool)

(assert (=> b!805284 (= lt!360497 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14815))))

(assert (= (and start!69124 res!549254) b!805280))

(assert (= (and b!805280 res!549253) b!805279))

(assert (= (and b!805279 res!549251) b!805283))

(assert (= (and b!805283 res!549249) b!805281))

(assert (= (and b!805281 res!549250) b!805282))

(assert (= (and b!805282 res!549255) b!805278))

(assert (= (and b!805278 res!549252) b!805284))

(declare-fun m!747529 () Bool)

(assert (=> b!805282 m!747529))

(declare-fun m!747531 () Bool)

(assert (=> b!805281 m!747531))

(declare-fun m!747533 () Bool)

(assert (=> b!805279 m!747533))

(assert (=> b!805279 m!747533))

(declare-fun m!747535 () Bool)

(assert (=> b!805279 m!747535))

(declare-fun m!747537 () Bool)

(assert (=> b!805278 m!747537))

(declare-fun m!747539 () Bool)

(assert (=> b!805283 m!747539))

(declare-fun m!747541 () Bool)

(assert (=> start!69124 m!747541))

(declare-fun m!747543 () Bool)

(assert (=> start!69124 m!747543))

(declare-fun m!747545 () Bool)

(assert (=> b!805284 m!747545))

(push 1)

(assert (not b!805283))

(assert (not b!805278))

(assert (not b!805279))

(assert (not b!805281))

(assert (not b!805282))

(assert (not b!805284))

(assert (not start!69124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

