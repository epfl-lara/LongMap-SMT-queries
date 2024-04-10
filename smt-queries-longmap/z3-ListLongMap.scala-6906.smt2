; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86800 () Bool)

(assert start!86800)

(declare-fun b!1006451 () Bool)

(declare-fun e!566500 () Bool)

(declare-fun e!566503 () Bool)

(assert (=> b!1006451 (= e!566500 e!566503)))

(declare-fun res!675541 () Bool)

(assert (=> b!1006451 (=> (not res!675541) (not e!566503))))

(declare-datatypes ((array!63499 0))(
  ( (array!63500 (arr!30572 (Array (_ BitVec 32) (_ BitVec 64))) (size!31074 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63499)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9504 0))(
  ( (MissingZero!9504 (index!40387 (_ BitVec 32))) (Found!9504 (index!40388 (_ BitVec 32))) (Intermediate!9504 (undefined!10316 Bool) (index!40389 (_ BitVec 32)) (x!87784 (_ BitVec 32))) (Undefined!9504) (MissingVacant!9504 (index!40390 (_ BitVec 32))) )
))
(declare-fun lt!444791 () SeekEntryResult!9504)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63499 (_ BitVec 32)) SeekEntryResult!9504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006451 (= res!675541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30572 a!3219) j!170) mask!3464) (select (arr!30572 a!3219) j!170) a!3219 mask!3464) lt!444791))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006451 (= lt!444791 (Intermediate!9504 false resIndex!38 resX!38))))

(declare-fun b!1006452 () Bool)

(declare-fun res!675544 () Bool)

(assert (=> b!1006452 (=> (not res!675544) (not e!566500))))

(declare-datatypes ((List!21248 0))(
  ( (Nil!21245) (Cons!21244 (h!22427 (_ BitVec 64)) (t!30249 List!21248)) )
))
(declare-fun arrayNoDuplicates!0 (array!63499 (_ BitVec 32) List!21248) Bool)

(assert (=> b!1006452 (= res!675544 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21245))))

(declare-fun b!1006453 () Bool)

(declare-fun res!675547 () Bool)

(declare-fun e!566502 () Bool)

(assert (=> b!1006453 (=> (not res!675547) (not e!566502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006453 (= res!675547 (validKeyInArray!0 (select (arr!30572 a!3219) j!170)))))

(declare-fun b!1006454 () Bool)

(declare-fun res!675543 () Bool)

(assert (=> b!1006454 (=> (not res!675543) (not e!566500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63499 (_ BitVec 32)) Bool)

(assert (=> b!1006454 (= res!675543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006455 () Bool)

(declare-fun res!675549 () Bool)

(assert (=> b!1006455 (=> (not res!675549) (not e!566500))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1006455 (= res!675549 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31074 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31074 a!3219))))))

(declare-fun b!1006456 () Bool)

(declare-fun res!675540 () Bool)

(assert (=> b!1006456 (=> (not res!675540) (not e!566502))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1006456 (= res!675540 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006457 () Bool)

(declare-fun res!675545 () Bool)

(assert (=> b!1006457 (=> (not res!675545) (not e!566502))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006457 (= res!675545 (and (= (size!31074 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31074 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31074 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006458 () Bool)

(assert (=> b!1006458 (= e!566502 e!566500)))

(declare-fun res!675539 () Bool)

(assert (=> b!1006458 (=> (not res!675539) (not e!566500))))

(declare-fun lt!444790 () SeekEntryResult!9504)

(assert (=> b!1006458 (= res!675539 (or (= lt!444790 (MissingVacant!9504 i!1194)) (= lt!444790 (MissingZero!9504 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63499 (_ BitVec 32)) SeekEntryResult!9504)

(assert (=> b!1006458 (= lt!444790 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006459 () Bool)

(declare-fun res!675548 () Bool)

(assert (=> b!1006459 (=> (not res!675548) (not e!566503))))

(assert (=> b!1006459 (= res!675548 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30572 a!3219) j!170) a!3219 mask!3464) lt!444791))))

(declare-fun res!675542 () Bool)

(assert (=> start!86800 (=> (not res!675542) (not e!566502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86800 (= res!675542 (validMask!0 mask!3464))))

(assert (=> start!86800 e!566502))

(declare-fun array_inv!23696 (array!63499) Bool)

(assert (=> start!86800 (array_inv!23696 a!3219)))

(assert (=> start!86800 true))

(declare-fun b!1006460 () Bool)

(assert (=> b!1006460 (= e!566503 false)))

(declare-fun lt!444789 () SeekEntryResult!9504)

(assert (=> b!1006460 (= lt!444789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30572 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30572 a!3219) i!1194 k0!2224) j!170) (array!63500 (store (arr!30572 a!3219) i!1194 k0!2224) (size!31074 a!3219)) mask!3464))))

(declare-fun b!1006461 () Bool)

(declare-fun res!675546 () Bool)

(assert (=> b!1006461 (=> (not res!675546) (not e!566502))))

(declare-fun arrayContainsKey!0 (array!63499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006461 (= res!675546 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86800 res!675542) b!1006457))

(assert (= (and b!1006457 res!675545) b!1006453))

(assert (= (and b!1006453 res!675547) b!1006456))

(assert (= (and b!1006456 res!675540) b!1006461))

(assert (= (and b!1006461 res!675546) b!1006458))

(assert (= (and b!1006458 res!675539) b!1006454))

(assert (= (and b!1006454 res!675543) b!1006452))

(assert (= (and b!1006452 res!675544) b!1006455))

(assert (= (and b!1006455 res!675549) b!1006451))

(assert (= (and b!1006451 res!675541) b!1006459))

(assert (= (and b!1006459 res!675548) b!1006460))

(declare-fun m!931549 () Bool)

(assert (=> start!86800 m!931549))

(declare-fun m!931551 () Bool)

(assert (=> start!86800 m!931551))

(declare-fun m!931553 () Bool)

(assert (=> b!1006460 m!931553))

(declare-fun m!931555 () Bool)

(assert (=> b!1006460 m!931555))

(assert (=> b!1006460 m!931555))

(declare-fun m!931557 () Bool)

(assert (=> b!1006460 m!931557))

(assert (=> b!1006460 m!931557))

(assert (=> b!1006460 m!931555))

(declare-fun m!931559 () Bool)

(assert (=> b!1006460 m!931559))

(declare-fun m!931561 () Bool)

(assert (=> b!1006453 m!931561))

(assert (=> b!1006453 m!931561))

(declare-fun m!931563 () Bool)

(assert (=> b!1006453 m!931563))

(declare-fun m!931565 () Bool)

(assert (=> b!1006461 m!931565))

(assert (=> b!1006451 m!931561))

(assert (=> b!1006451 m!931561))

(declare-fun m!931567 () Bool)

(assert (=> b!1006451 m!931567))

(assert (=> b!1006451 m!931567))

(assert (=> b!1006451 m!931561))

(declare-fun m!931569 () Bool)

(assert (=> b!1006451 m!931569))

(declare-fun m!931571 () Bool)

(assert (=> b!1006454 m!931571))

(assert (=> b!1006459 m!931561))

(assert (=> b!1006459 m!931561))

(declare-fun m!931573 () Bool)

(assert (=> b!1006459 m!931573))

(declare-fun m!931575 () Bool)

(assert (=> b!1006452 m!931575))

(declare-fun m!931577 () Bool)

(assert (=> b!1006456 m!931577))

(declare-fun m!931579 () Bool)

(assert (=> b!1006458 m!931579))

(check-sat (not b!1006459) (not b!1006460) (not start!86800) (not b!1006461) (not b!1006458) (not b!1006451) (not b!1006453) (not b!1006454) (not b!1006452) (not b!1006456))
(check-sat)
