; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86728 () Bool)

(assert start!86728)

(declare-fun b!1005360 () Bool)

(declare-fun res!674449 () Bool)

(declare-fun e!566137 () Bool)

(assert (=> b!1005360 (=> (not res!674449) (not e!566137))))

(declare-datatypes ((array!63427 0))(
  ( (array!63428 (arr!30536 (Array (_ BitVec 32) (_ BitVec 64))) (size!31038 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63427)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005360 (= res!674449 (validKeyInArray!0 (select (arr!30536 a!3219) j!170)))))

(declare-fun b!1005361 () Bool)

(declare-fun e!566135 () Bool)

(assert (=> b!1005361 (= e!566135 false)))

(declare-fun lt!444532 () Bool)

(declare-datatypes ((List!21212 0))(
  ( (Nil!21209) (Cons!21208 (h!22391 (_ BitVec 64)) (t!30213 List!21212)) )
))
(declare-fun arrayNoDuplicates!0 (array!63427 (_ BitVec 32) List!21212) Bool)

(assert (=> b!1005361 (= lt!444532 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21209))))

(declare-fun b!1005362 () Bool)

(declare-fun res!674448 () Bool)

(assert (=> b!1005362 (=> (not res!674448) (not e!566137))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005362 (= res!674448 (and (= (size!31038 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31038 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31038 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005363 () Bool)

(assert (=> b!1005363 (= e!566137 e!566135)))

(declare-fun res!674451 () Bool)

(assert (=> b!1005363 (=> (not res!674451) (not e!566135))))

(declare-datatypes ((SeekEntryResult!9468 0))(
  ( (MissingZero!9468 (index!40243 (_ BitVec 32))) (Found!9468 (index!40244 (_ BitVec 32))) (Intermediate!9468 (undefined!10280 Bool) (index!40245 (_ BitVec 32)) (x!87652 (_ BitVec 32))) (Undefined!9468) (MissingVacant!9468 (index!40246 (_ BitVec 32))) )
))
(declare-fun lt!444533 () SeekEntryResult!9468)

(assert (=> b!1005363 (= res!674451 (or (= lt!444533 (MissingVacant!9468 i!1194)) (= lt!444533 (MissingZero!9468 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63427 (_ BitVec 32)) SeekEntryResult!9468)

(assert (=> b!1005363 (= lt!444533 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!674450 () Bool)

(assert (=> start!86728 (=> (not res!674450) (not e!566137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86728 (= res!674450 (validMask!0 mask!3464))))

(assert (=> start!86728 e!566137))

(declare-fun array_inv!23660 (array!63427) Bool)

(assert (=> start!86728 (array_inv!23660 a!3219)))

(assert (=> start!86728 true))

(declare-fun b!1005364 () Bool)

(declare-fun res!674453 () Bool)

(assert (=> b!1005364 (=> (not res!674453) (not e!566137))))

(declare-fun arrayContainsKey!0 (array!63427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005364 (= res!674453 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005365 () Bool)

(declare-fun res!674454 () Bool)

(assert (=> b!1005365 (=> (not res!674454) (not e!566135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63427 (_ BitVec 32)) Bool)

(assert (=> b!1005365 (= res!674454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005366 () Bool)

(declare-fun res!674452 () Bool)

(assert (=> b!1005366 (=> (not res!674452) (not e!566137))))

(assert (=> b!1005366 (= res!674452 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86728 res!674450) b!1005362))

(assert (= (and b!1005362 res!674448) b!1005360))

(assert (= (and b!1005360 res!674449) b!1005366))

(assert (= (and b!1005366 res!674452) b!1005364))

(assert (= (and b!1005364 res!674453) b!1005363))

(assert (= (and b!1005363 res!674451) b!1005365))

(assert (= (and b!1005365 res!674454) b!1005361))

(declare-fun m!930623 () Bool)

(assert (=> b!1005364 m!930623))

(declare-fun m!930625 () Bool)

(assert (=> b!1005363 m!930625))

(declare-fun m!930627 () Bool)

(assert (=> start!86728 m!930627))

(declare-fun m!930629 () Bool)

(assert (=> start!86728 m!930629))

(declare-fun m!930631 () Bool)

(assert (=> b!1005361 m!930631))

(declare-fun m!930633 () Bool)

(assert (=> b!1005365 m!930633))

(declare-fun m!930635 () Bool)

(assert (=> b!1005360 m!930635))

(assert (=> b!1005360 m!930635))

(declare-fun m!930637 () Bool)

(assert (=> b!1005360 m!930637))

(declare-fun m!930639 () Bool)

(assert (=> b!1005366 m!930639))

(check-sat (not b!1005363) (not b!1005366) (not b!1005364) (not b!1005361) (not start!86728) (not b!1005365) (not b!1005360))
(check-sat)
