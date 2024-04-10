; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86788 () Bool)

(assert start!86788)

(declare-fun b!1006253 () Bool)

(declare-fun res!675342 () Bool)

(declare-fun e!566431 () Bool)

(assert (=> b!1006253 (=> (not res!675342) (not e!566431))))

(declare-datatypes ((array!63487 0))(
  ( (array!63488 (arr!30566 (Array (_ BitVec 32) (_ BitVec 64))) (size!31068 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63487)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9498 0))(
  ( (MissingZero!9498 (index!40363 (_ BitVec 32))) (Found!9498 (index!40364 (_ BitVec 32))) (Intermediate!9498 (undefined!10310 Bool) (index!40365 (_ BitVec 32)) (x!87762 (_ BitVec 32))) (Undefined!9498) (MissingVacant!9498 (index!40366 (_ BitVec 32))) )
))
(declare-fun lt!444735 () SeekEntryResult!9498)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63487 (_ BitVec 32)) SeekEntryResult!9498)

(assert (=> b!1006253 (= res!675342 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30566 a!3219) j!170) a!3219 mask!3464) lt!444735))))

(declare-fun b!1006254 () Bool)

(declare-fun res!675343 () Bool)

(declare-fun e!566430 () Bool)

(assert (=> b!1006254 (=> (not res!675343) (not e!566430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63487 (_ BitVec 32)) Bool)

(assert (=> b!1006254 (= res!675343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006255 () Bool)

(declare-fun res!675350 () Bool)

(assert (=> b!1006255 (=> (not res!675350) (not e!566430))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006255 (= res!675350 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31068 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31068 a!3219))))))

(declare-fun b!1006256 () Bool)

(declare-fun res!675348 () Bool)

(declare-fun e!566429 () Bool)

(assert (=> b!1006256 (=> (not res!675348) (not e!566429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006256 (= res!675348 (validKeyInArray!0 (select (arr!30566 a!3219) j!170)))))

(declare-fun b!1006257 () Bool)

(assert (=> b!1006257 (= e!566429 e!566430)))

(declare-fun res!675347 () Bool)

(assert (=> b!1006257 (=> (not res!675347) (not e!566430))))

(declare-fun lt!444736 () SeekEntryResult!9498)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006257 (= res!675347 (or (= lt!444736 (MissingVacant!9498 i!1194)) (= lt!444736 (MissingZero!9498 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63487 (_ BitVec 32)) SeekEntryResult!9498)

(assert (=> b!1006257 (= lt!444736 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006258 () Bool)

(assert (=> b!1006258 (= e!566431 false)))

(declare-fun lt!444737 () SeekEntryResult!9498)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006258 (= lt!444737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30566 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30566 a!3219) i!1194 k0!2224) j!170) (array!63488 (store (arr!30566 a!3219) i!1194 k0!2224) (size!31068 a!3219)) mask!3464))))

(declare-fun b!1006259 () Bool)

(declare-fun res!675345 () Bool)

(assert (=> b!1006259 (=> (not res!675345) (not e!566430))))

(declare-datatypes ((List!21242 0))(
  ( (Nil!21239) (Cons!21238 (h!22421 (_ BitVec 64)) (t!30243 List!21242)) )
))
(declare-fun arrayNoDuplicates!0 (array!63487 (_ BitVec 32) List!21242) Bool)

(assert (=> b!1006259 (= res!675345 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21239))))

(declare-fun b!1006260 () Bool)

(declare-fun res!675344 () Bool)

(assert (=> b!1006260 (=> (not res!675344) (not e!566429))))

(assert (=> b!1006260 (= res!675344 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006262 () Bool)

(declare-fun res!675349 () Bool)

(assert (=> b!1006262 (=> (not res!675349) (not e!566429))))

(declare-fun arrayContainsKey!0 (array!63487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006262 (= res!675349 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006263 () Bool)

(declare-fun res!675341 () Bool)

(assert (=> b!1006263 (=> (not res!675341) (not e!566429))))

(assert (=> b!1006263 (= res!675341 (and (= (size!31068 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31068 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31068 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006261 () Bool)

(assert (=> b!1006261 (= e!566430 e!566431)))

(declare-fun res!675351 () Bool)

(assert (=> b!1006261 (=> (not res!675351) (not e!566431))))

(assert (=> b!1006261 (= res!675351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30566 a!3219) j!170) mask!3464) (select (arr!30566 a!3219) j!170) a!3219 mask!3464) lt!444735))))

(assert (=> b!1006261 (= lt!444735 (Intermediate!9498 false resIndex!38 resX!38))))

(declare-fun res!675346 () Bool)

(assert (=> start!86788 (=> (not res!675346) (not e!566429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86788 (= res!675346 (validMask!0 mask!3464))))

(assert (=> start!86788 e!566429))

(declare-fun array_inv!23690 (array!63487) Bool)

(assert (=> start!86788 (array_inv!23690 a!3219)))

(assert (=> start!86788 true))

(assert (= (and start!86788 res!675346) b!1006263))

(assert (= (and b!1006263 res!675341) b!1006256))

(assert (= (and b!1006256 res!675348) b!1006260))

(assert (= (and b!1006260 res!675344) b!1006262))

(assert (= (and b!1006262 res!675349) b!1006257))

(assert (= (and b!1006257 res!675347) b!1006254))

(assert (= (and b!1006254 res!675343) b!1006259))

(assert (= (and b!1006259 res!675345) b!1006255))

(assert (= (and b!1006255 res!675350) b!1006261))

(assert (= (and b!1006261 res!675351) b!1006253))

(assert (= (and b!1006253 res!675342) b!1006258))

(declare-fun m!931357 () Bool)

(assert (=> b!1006259 m!931357))

(declare-fun m!931359 () Bool)

(assert (=> b!1006253 m!931359))

(assert (=> b!1006253 m!931359))

(declare-fun m!931361 () Bool)

(assert (=> b!1006253 m!931361))

(declare-fun m!931363 () Bool)

(assert (=> b!1006262 m!931363))

(declare-fun m!931365 () Bool)

(assert (=> start!86788 m!931365))

(declare-fun m!931367 () Bool)

(assert (=> start!86788 m!931367))

(assert (=> b!1006261 m!931359))

(assert (=> b!1006261 m!931359))

(declare-fun m!931369 () Bool)

(assert (=> b!1006261 m!931369))

(assert (=> b!1006261 m!931369))

(assert (=> b!1006261 m!931359))

(declare-fun m!931371 () Bool)

(assert (=> b!1006261 m!931371))

(declare-fun m!931373 () Bool)

(assert (=> b!1006258 m!931373))

(declare-fun m!931375 () Bool)

(assert (=> b!1006258 m!931375))

(assert (=> b!1006258 m!931375))

(declare-fun m!931377 () Bool)

(assert (=> b!1006258 m!931377))

(assert (=> b!1006258 m!931377))

(assert (=> b!1006258 m!931375))

(declare-fun m!931379 () Bool)

(assert (=> b!1006258 m!931379))

(declare-fun m!931381 () Bool)

(assert (=> b!1006254 m!931381))

(declare-fun m!931383 () Bool)

(assert (=> b!1006260 m!931383))

(declare-fun m!931385 () Bool)

(assert (=> b!1006257 m!931385))

(assert (=> b!1006256 m!931359))

(assert (=> b!1006256 m!931359))

(declare-fun m!931387 () Bool)

(assert (=> b!1006256 m!931387))

(check-sat (not start!86788) (not b!1006257) (not b!1006253) (not b!1006260) (not b!1006256) (not b!1006261) (not b!1006254) (not b!1006259) (not b!1006262) (not b!1006258))
(check-sat)
