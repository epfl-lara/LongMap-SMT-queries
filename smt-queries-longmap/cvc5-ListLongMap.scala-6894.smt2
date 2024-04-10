; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86726 () Bool)

(assert start!86726)

(declare-fun b!1005339 () Bool)

(declare-fun res!674428 () Bool)

(declare-fun e!566128 () Bool)

(assert (=> b!1005339 (=> (not res!674428) (not e!566128))))

(declare-datatypes ((array!63425 0))(
  ( (array!63426 (arr!30535 (Array (_ BitVec 32) (_ BitVec 64))) (size!31037 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63425)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005339 (= res!674428 (validKeyInArray!0 (select (arr!30535 a!3219) j!170)))))

(declare-fun b!1005340 () Bool)

(declare-fun e!566126 () Bool)

(assert (=> b!1005340 (= e!566126 false)))

(declare-fun lt!444527 () Bool)

(declare-datatypes ((List!21211 0))(
  ( (Nil!21208) (Cons!21207 (h!22390 (_ BitVec 64)) (t!30212 List!21211)) )
))
(declare-fun arrayNoDuplicates!0 (array!63425 (_ BitVec 32) List!21211) Bool)

(assert (=> b!1005340 (= lt!444527 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21208))))

(declare-fun b!1005341 () Bool)

(assert (=> b!1005341 (= e!566128 e!566126)))

(declare-fun res!674430 () Bool)

(assert (=> b!1005341 (=> (not res!674430) (not e!566126))))

(declare-datatypes ((SeekEntryResult!9467 0))(
  ( (MissingZero!9467 (index!40239 (_ BitVec 32))) (Found!9467 (index!40240 (_ BitVec 32))) (Intermediate!9467 (undefined!10279 Bool) (index!40241 (_ BitVec 32)) (x!87651 (_ BitVec 32))) (Undefined!9467) (MissingVacant!9467 (index!40242 (_ BitVec 32))) )
))
(declare-fun lt!444526 () SeekEntryResult!9467)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005341 (= res!674430 (or (= lt!444526 (MissingVacant!9467 i!1194)) (= lt!444526 (MissingZero!9467 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63425 (_ BitVec 32)) SeekEntryResult!9467)

(assert (=> b!1005341 (= lt!444526 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005342 () Bool)

(declare-fun res!674427 () Bool)

(assert (=> b!1005342 (=> (not res!674427) (not e!566128))))

(declare-fun arrayContainsKey!0 (array!63425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005342 (= res!674427 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005343 () Bool)

(declare-fun res!674433 () Bool)

(assert (=> b!1005343 (=> (not res!674433) (not e!566128))))

(assert (=> b!1005343 (= res!674433 (and (= (size!31037 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31037 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31037 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005344 () Bool)

(declare-fun res!674432 () Bool)

(assert (=> b!1005344 (=> (not res!674432) (not e!566128))))

(assert (=> b!1005344 (= res!674432 (validKeyInArray!0 k!2224))))

(declare-fun res!674431 () Bool)

(assert (=> start!86726 (=> (not res!674431) (not e!566128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86726 (= res!674431 (validMask!0 mask!3464))))

(assert (=> start!86726 e!566128))

(declare-fun array_inv!23659 (array!63425) Bool)

(assert (=> start!86726 (array_inv!23659 a!3219)))

(assert (=> start!86726 true))

(declare-fun b!1005345 () Bool)

(declare-fun res!674429 () Bool)

(assert (=> b!1005345 (=> (not res!674429) (not e!566126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63425 (_ BitVec 32)) Bool)

(assert (=> b!1005345 (= res!674429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86726 res!674431) b!1005343))

(assert (= (and b!1005343 res!674433) b!1005339))

(assert (= (and b!1005339 res!674428) b!1005344))

(assert (= (and b!1005344 res!674432) b!1005342))

(assert (= (and b!1005342 res!674427) b!1005341))

(assert (= (and b!1005341 res!674430) b!1005345))

(assert (= (and b!1005345 res!674429) b!1005340))

(declare-fun m!930605 () Bool)

(assert (=> b!1005344 m!930605))

(declare-fun m!930607 () Bool)

(assert (=> b!1005340 m!930607))

(declare-fun m!930609 () Bool)

(assert (=> b!1005339 m!930609))

(assert (=> b!1005339 m!930609))

(declare-fun m!930611 () Bool)

(assert (=> b!1005339 m!930611))

(declare-fun m!930613 () Bool)

(assert (=> b!1005345 m!930613))

(declare-fun m!930615 () Bool)

(assert (=> b!1005342 m!930615))

(declare-fun m!930617 () Bool)

(assert (=> b!1005341 m!930617))

(declare-fun m!930619 () Bool)

(assert (=> start!86726 m!930619))

(declare-fun m!930621 () Bool)

(assert (=> start!86726 m!930621))

(push 1)

