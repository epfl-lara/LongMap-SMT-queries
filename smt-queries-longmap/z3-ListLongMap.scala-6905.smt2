; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86794 () Bool)

(assert start!86794)

(declare-fun b!1006352 () Bool)

(declare-fun res!675446 () Bool)

(declare-fun e!566466 () Bool)

(assert (=> b!1006352 (=> (not res!675446) (not e!566466))))

(declare-datatypes ((array!63493 0))(
  ( (array!63494 (arr!30569 (Array (_ BitVec 32) (_ BitVec 64))) (size!31071 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63493)

(declare-datatypes ((List!21245 0))(
  ( (Nil!21242) (Cons!21241 (h!22424 (_ BitVec 64)) (t!30246 List!21245)) )
))
(declare-fun arrayNoDuplicates!0 (array!63493 (_ BitVec 32) List!21245) Bool)

(assert (=> b!1006352 (= res!675446 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21242))))

(declare-fun b!1006353 () Bool)

(declare-fun res!675447 () Bool)

(declare-fun e!566465 () Bool)

(assert (=> b!1006353 (=> (not res!675447) (not e!566465))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006353 (= res!675447 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006354 () Bool)

(declare-fun e!566467 () Bool)

(assert (=> b!1006354 (= e!566467 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9501 0))(
  ( (MissingZero!9501 (index!40375 (_ BitVec 32))) (Found!9501 (index!40376 (_ BitVec 32))) (Intermediate!9501 (undefined!10313 Bool) (index!40377 (_ BitVec 32)) (x!87773 (_ BitVec 32))) (Undefined!9501) (MissingVacant!9501 (index!40378 (_ BitVec 32))) )
))
(declare-fun lt!444764 () SeekEntryResult!9501)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63493 (_ BitVec 32)) SeekEntryResult!9501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006354 (= lt!444764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30569 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30569 a!3219) i!1194 k0!2224) j!170) (array!63494 (store (arr!30569 a!3219) i!1194 k0!2224) (size!31071 a!3219)) mask!3464))))

(declare-fun res!675449 () Bool)

(assert (=> start!86794 (=> (not res!675449) (not e!566465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86794 (= res!675449 (validMask!0 mask!3464))))

(assert (=> start!86794 e!566465))

(declare-fun array_inv!23693 (array!63493) Bool)

(assert (=> start!86794 (array_inv!23693 a!3219)))

(assert (=> start!86794 true))

(declare-fun b!1006355 () Bool)

(assert (=> b!1006355 (= e!566465 e!566466)))

(declare-fun res!675441 () Bool)

(assert (=> b!1006355 (=> (not res!675441) (not e!566466))))

(declare-fun lt!444763 () SeekEntryResult!9501)

(assert (=> b!1006355 (= res!675441 (or (= lt!444763 (MissingVacant!9501 i!1194)) (= lt!444763 (MissingZero!9501 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63493 (_ BitVec 32)) SeekEntryResult!9501)

(assert (=> b!1006355 (= lt!444763 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006356 () Bool)

(declare-fun res!675448 () Bool)

(assert (=> b!1006356 (=> (not res!675448) (not e!566465))))

(assert (=> b!1006356 (= res!675448 (and (= (size!31071 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31071 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31071 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006357 () Bool)

(declare-fun res!675450 () Bool)

(assert (=> b!1006357 (=> (not res!675450) (not e!566465))))

(assert (=> b!1006357 (= res!675450 (validKeyInArray!0 (select (arr!30569 a!3219) j!170)))))

(declare-fun b!1006358 () Bool)

(declare-fun res!675440 () Bool)

(assert (=> b!1006358 (=> (not res!675440) (not e!566466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63493 (_ BitVec 32)) Bool)

(assert (=> b!1006358 (= res!675440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006359 () Bool)

(declare-fun res!675445 () Bool)

(assert (=> b!1006359 (=> (not res!675445) (not e!566466))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1006359 (= res!675445 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31071 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31071 a!3219))))))

(declare-fun b!1006360 () Bool)

(declare-fun res!675444 () Bool)

(assert (=> b!1006360 (=> (not res!675444) (not e!566465))))

(declare-fun arrayContainsKey!0 (array!63493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006360 (= res!675444 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006361 () Bool)

(assert (=> b!1006361 (= e!566466 e!566467)))

(declare-fun res!675443 () Bool)

(assert (=> b!1006361 (=> (not res!675443) (not e!566467))))

(declare-fun lt!444762 () SeekEntryResult!9501)

(assert (=> b!1006361 (= res!675443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30569 a!3219) j!170) mask!3464) (select (arr!30569 a!3219) j!170) a!3219 mask!3464) lt!444762))))

(assert (=> b!1006361 (= lt!444762 (Intermediate!9501 false resIndex!38 resX!38))))

(declare-fun b!1006362 () Bool)

(declare-fun res!675442 () Bool)

(assert (=> b!1006362 (=> (not res!675442) (not e!566467))))

(assert (=> b!1006362 (= res!675442 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30569 a!3219) j!170) a!3219 mask!3464) lt!444762))))

(assert (= (and start!86794 res!675449) b!1006356))

(assert (= (and b!1006356 res!675448) b!1006357))

(assert (= (and b!1006357 res!675450) b!1006353))

(assert (= (and b!1006353 res!675447) b!1006360))

(assert (= (and b!1006360 res!675444) b!1006355))

(assert (= (and b!1006355 res!675441) b!1006358))

(assert (= (and b!1006358 res!675440) b!1006352))

(assert (= (and b!1006352 res!675446) b!1006359))

(assert (= (and b!1006359 res!675445) b!1006361))

(assert (= (and b!1006361 res!675443) b!1006362))

(assert (= (and b!1006362 res!675442) b!1006354))

(declare-fun m!931453 () Bool)

(assert (=> b!1006354 m!931453))

(declare-fun m!931455 () Bool)

(assert (=> b!1006354 m!931455))

(assert (=> b!1006354 m!931455))

(declare-fun m!931457 () Bool)

(assert (=> b!1006354 m!931457))

(assert (=> b!1006354 m!931457))

(assert (=> b!1006354 m!931455))

(declare-fun m!931459 () Bool)

(assert (=> b!1006354 m!931459))

(declare-fun m!931461 () Bool)

(assert (=> b!1006358 m!931461))

(declare-fun m!931463 () Bool)

(assert (=> b!1006353 m!931463))

(declare-fun m!931465 () Bool)

(assert (=> start!86794 m!931465))

(declare-fun m!931467 () Bool)

(assert (=> start!86794 m!931467))

(declare-fun m!931469 () Bool)

(assert (=> b!1006355 m!931469))

(declare-fun m!931471 () Bool)

(assert (=> b!1006352 m!931471))

(declare-fun m!931473 () Bool)

(assert (=> b!1006360 m!931473))

(declare-fun m!931475 () Bool)

(assert (=> b!1006357 m!931475))

(assert (=> b!1006357 m!931475))

(declare-fun m!931477 () Bool)

(assert (=> b!1006357 m!931477))

(assert (=> b!1006361 m!931475))

(assert (=> b!1006361 m!931475))

(declare-fun m!931479 () Bool)

(assert (=> b!1006361 m!931479))

(assert (=> b!1006361 m!931479))

(assert (=> b!1006361 m!931475))

(declare-fun m!931481 () Bool)

(assert (=> b!1006361 m!931481))

(assert (=> b!1006362 m!931475))

(assert (=> b!1006362 m!931475))

(declare-fun m!931483 () Bool)

(assert (=> b!1006362 m!931483))

(check-sat (not start!86794) (not b!1006362) (not b!1006355) (not b!1006353) (not b!1006357) (not b!1006352) (not b!1006361) (not b!1006354) (not b!1006360) (not b!1006358))
(check-sat)
