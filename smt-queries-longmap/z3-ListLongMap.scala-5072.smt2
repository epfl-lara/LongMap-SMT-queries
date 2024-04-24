; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69110 () Bool)

(assert start!69110)

(declare-fun res!549103 () Bool)

(declare-fun e!446143 () Bool)

(assert (=> start!69110 (=> (not res!549103) (not e!446143))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69110 (= res!549103 (validMask!0 mask!3266))))

(assert (=> start!69110 e!446143))

(assert (=> start!69110 true))

(declare-datatypes ((array!43732 0))(
  ( (array!43733 (arr!20941 (Array (_ BitVec 32) (_ BitVec 64))) (size!21361 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43732)

(declare-fun array_inv!16800 (array!43732) Bool)

(assert (=> start!69110 (array_inv!16800 a!3170)))

(declare-fun b!805131 () Bool)

(declare-fun res!549104 () Bool)

(declare-fun e!446141 () Bool)

(assert (=> b!805131 (=> (not res!549104) (not e!446141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43732 (_ BitVec 32)) Bool)

(assert (=> b!805131 (= res!549104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805132 () Bool)

(declare-fun res!549102 () Bool)

(assert (=> b!805132 (=> (not res!549102) (not e!446143))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805132 (= res!549102 (validKeyInArray!0 k0!2044))))

(declare-fun b!805133 () Bool)

(declare-fun res!549106 () Bool)

(assert (=> b!805133 (=> (not res!549106) (not e!446143))))

(declare-fun arrayContainsKey!0 (array!43732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805133 (= res!549106 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805134 () Bool)

(assert (=> b!805134 (= e!446143 e!446141)))

(declare-fun res!549107 () Bool)

(assert (=> b!805134 (=> (not res!549107) (not e!446141))))

(declare-datatypes ((SeekEntryResult!8488 0))(
  ( (MissingZero!8488 (index!36320 (_ BitVec 32))) (Found!8488 (index!36321 (_ BitVec 32))) (Intermediate!8488 (undefined!9300 Bool) (index!36322 (_ BitVec 32)) (x!67316 (_ BitVec 32))) (Undefined!8488) (MissingVacant!8488 (index!36323 (_ BitVec 32))) )
))
(declare-fun lt!360455 () SeekEntryResult!8488)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805134 (= res!549107 (or (= lt!360455 (MissingZero!8488 i!1163)) (= lt!360455 (MissingVacant!8488 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43732 (_ BitVec 32)) SeekEntryResult!8488)

(assert (=> b!805134 (= lt!360455 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805135 () Bool)

(declare-fun res!549108 () Bool)

(assert (=> b!805135 (=> (not res!549108) (not e!446143))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805135 (= res!549108 (validKeyInArray!0 (select (arr!20941 a!3170) j!153)))))

(declare-fun b!805136 () Bool)

(assert (=> b!805136 (= e!446141 false)))

(declare-fun lt!360454 () Bool)

(declare-datatypes ((List!14811 0))(
  ( (Nil!14808) (Cons!14807 (h!15942 (_ BitVec 64)) (t!21118 List!14811)) )
))
(declare-fun arrayNoDuplicates!0 (array!43732 (_ BitVec 32) List!14811) Bool)

(assert (=> b!805136 (= lt!360454 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14808))))

(declare-fun b!805137 () Bool)

(declare-fun res!549105 () Bool)

(assert (=> b!805137 (=> (not res!549105) (not e!446143))))

(assert (=> b!805137 (= res!549105 (and (= (size!21361 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21361 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21361 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69110 res!549103) b!805137))

(assert (= (and b!805137 res!549105) b!805135))

(assert (= (and b!805135 res!549108) b!805132))

(assert (= (and b!805132 res!549102) b!805133))

(assert (= (and b!805133 res!549106) b!805134))

(assert (= (and b!805134 res!549107) b!805131))

(assert (= (and b!805131 res!549104) b!805136))

(declare-fun m!747403 () Bool)

(assert (=> start!69110 m!747403))

(declare-fun m!747405 () Bool)

(assert (=> start!69110 m!747405))

(declare-fun m!747407 () Bool)

(assert (=> b!805136 m!747407))

(declare-fun m!747409 () Bool)

(assert (=> b!805131 m!747409))

(declare-fun m!747411 () Bool)

(assert (=> b!805134 m!747411))

(declare-fun m!747413 () Bool)

(assert (=> b!805135 m!747413))

(assert (=> b!805135 m!747413))

(declare-fun m!747415 () Bool)

(assert (=> b!805135 m!747415))

(declare-fun m!747417 () Bool)

(assert (=> b!805132 m!747417))

(declare-fun m!747419 () Bool)

(assert (=> b!805133 m!747419))

(check-sat (not b!805136) (not b!805135) (not b!805134) (not b!805133) (not start!69110) (not b!805131) (not b!805132))
(check-sat)
