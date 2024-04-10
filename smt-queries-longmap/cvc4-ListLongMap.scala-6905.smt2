; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86796 () Bool)

(assert start!86796)

(declare-fun b!1006385 () Bool)

(declare-fun res!675483 () Bool)

(declare-fun e!566477 () Bool)

(assert (=> b!1006385 (=> (not res!675483) (not e!566477))))

(declare-datatypes ((array!63495 0))(
  ( (array!63496 (arr!30570 (Array (_ BitVec 32) (_ BitVec 64))) (size!31072 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63495)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006385 (= res!675483 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31072 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31072 a!3219))))))

(declare-fun b!1006387 () Bool)

(declare-fun res!675474 () Bool)

(declare-fun e!566479 () Bool)

(assert (=> b!1006387 (=> (not res!675474) (not e!566479))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006387 (= res!675474 (validKeyInArray!0 (select (arr!30570 a!3219) j!170)))))

(declare-fun b!1006388 () Bool)

(declare-fun e!566476 () Bool)

(assert (=> b!1006388 (= e!566476 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9502 0))(
  ( (MissingZero!9502 (index!40379 (_ BitVec 32))) (Found!9502 (index!40380 (_ BitVec 32))) (Intermediate!9502 (undefined!10314 Bool) (index!40381 (_ BitVec 32)) (x!87774 (_ BitVec 32))) (Undefined!9502) (MissingVacant!9502 (index!40382 (_ BitVec 32))) )
))
(declare-fun lt!444773 () SeekEntryResult!9502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63495 (_ BitVec 32)) SeekEntryResult!9502)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006388 (= lt!444773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30570 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30570 a!3219) i!1194 k!2224) j!170) (array!63496 (store (arr!30570 a!3219) i!1194 k!2224) (size!31072 a!3219)) mask!3464))))

(declare-fun b!1006389 () Bool)

(declare-fun res!675475 () Bool)

(assert (=> b!1006389 (=> (not res!675475) (not e!566476))))

(declare-fun lt!444771 () SeekEntryResult!9502)

(assert (=> b!1006389 (= res!675475 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30570 a!3219) j!170) a!3219 mask!3464) lt!444771))))

(declare-fun b!1006390 () Bool)

(declare-fun res!675482 () Bool)

(assert (=> b!1006390 (=> (not res!675482) (not e!566479))))

(assert (=> b!1006390 (= res!675482 (validKeyInArray!0 k!2224))))

(declare-fun b!1006391 () Bool)

(assert (=> b!1006391 (= e!566479 e!566477)))

(declare-fun res!675479 () Bool)

(assert (=> b!1006391 (=> (not res!675479) (not e!566477))))

(declare-fun lt!444772 () SeekEntryResult!9502)

(assert (=> b!1006391 (= res!675479 (or (= lt!444772 (MissingVacant!9502 i!1194)) (= lt!444772 (MissingZero!9502 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63495 (_ BitVec 32)) SeekEntryResult!9502)

(assert (=> b!1006391 (= lt!444772 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!675480 () Bool)

(assert (=> start!86796 (=> (not res!675480) (not e!566479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86796 (= res!675480 (validMask!0 mask!3464))))

(assert (=> start!86796 e!566479))

(declare-fun array_inv!23694 (array!63495) Bool)

(assert (=> start!86796 (array_inv!23694 a!3219)))

(assert (=> start!86796 true))

(declare-fun b!1006386 () Bool)

(declare-fun res!675477 () Bool)

(assert (=> b!1006386 (=> (not res!675477) (not e!566479))))

(assert (=> b!1006386 (= res!675477 (and (= (size!31072 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31072 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31072 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006392 () Bool)

(declare-fun res!675476 () Bool)

(assert (=> b!1006392 (=> (not res!675476) (not e!566479))))

(declare-fun arrayContainsKey!0 (array!63495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006392 (= res!675476 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006393 () Bool)

(assert (=> b!1006393 (= e!566477 e!566476)))

(declare-fun res!675478 () Bool)

(assert (=> b!1006393 (=> (not res!675478) (not e!566476))))

(assert (=> b!1006393 (= res!675478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30570 a!3219) j!170) mask!3464) (select (arr!30570 a!3219) j!170) a!3219 mask!3464) lt!444771))))

(assert (=> b!1006393 (= lt!444771 (Intermediate!9502 false resIndex!38 resX!38))))

(declare-fun b!1006394 () Bool)

(declare-fun res!675481 () Bool)

(assert (=> b!1006394 (=> (not res!675481) (not e!566477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63495 (_ BitVec 32)) Bool)

(assert (=> b!1006394 (= res!675481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006395 () Bool)

(declare-fun res!675473 () Bool)

(assert (=> b!1006395 (=> (not res!675473) (not e!566477))))

(declare-datatypes ((List!21246 0))(
  ( (Nil!21243) (Cons!21242 (h!22425 (_ BitVec 64)) (t!30247 List!21246)) )
))
(declare-fun arrayNoDuplicates!0 (array!63495 (_ BitVec 32) List!21246) Bool)

(assert (=> b!1006395 (= res!675473 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21243))))

(assert (= (and start!86796 res!675480) b!1006386))

(assert (= (and b!1006386 res!675477) b!1006387))

(assert (= (and b!1006387 res!675474) b!1006390))

(assert (= (and b!1006390 res!675482) b!1006392))

(assert (= (and b!1006392 res!675476) b!1006391))

(assert (= (and b!1006391 res!675479) b!1006394))

(assert (= (and b!1006394 res!675481) b!1006395))

(assert (= (and b!1006395 res!675473) b!1006385))

(assert (= (and b!1006385 res!675483) b!1006393))

(assert (= (and b!1006393 res!675478) b!1006389))

(assert (= (and b!1006389 res!675475) b!1006388))

(declare-fun m!931485 () Bool)

(assert (=> b!1006388 m!931485))

(declare-fun m!931487 () Bool)

(assert (=> b!1006388 m!931487))

(assert (=> b!1006388 m!931487))

(declare-fun m!931489 () Bool)

(assert (=> b!1006388 m!931489))

(assert (=> b!1006388 m!931489))

(assert (=> b!1006388 m!931487))

(declare-fun m!931491 () Bool)

(assert (=> b!1006388 m!931491))

(declare-fun m!931493 () Bool)

(assert (=> b!1006389 m!931493))

(assert (=> b!1006389 m!931493))

(declare-fun m!931495 () Bool)

(assert (=> b!1006389 m!931495))

(declare-fun m!931497 () Bool)

(assert (=> b!1006391 m!931497))

(declare-fun m!931499 () Bool)

(assert (=> b!1006395 m!931499))

(assert (=> b!1006393 m!931493))

(assert (=> b!1006393 m!931493))

(declare-fun m!931501 () Bool)

(assert (=> b!1006393 m!931501))

(assert (=> b!1006393 m!931501))

(assert (=> b!1006393 m!931493))

(declare-fun m!931503 () Bool)

(assert (=> b!1006393 m!931503))

(declare-fun m!931505 () Bool)

(assert (=> b!1006394 m!931505))

(declare-fun m!931507 () Bool)

(assert (=> b!1006390 m!931507))

(declare-fun m!931509 () Bool)

(assert (=> b!1006392 m!931509))

(declare-fun m!931511 () Bool)

(assert (=> start!86796 m!931511))

(declare-fun m!931513 () Bool)

(assert (=> start!86796 m!931513))

(assert (=> b!1006387 m!931493))

(assert (=> b!1006387 m!931493))

(declare-fun m!931515 () Bool)

(assert (=> b!1006387 m!931515))

(push 1)

(assert (not b!1006393))

(assert (not b!1006392))

(assert (not b!1006389))

