; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86830 () Bool)

(assert start!86830)

(declare-fun b!1005595 () Bool)

(declare-fun e!566374 () Bool)

(assert (=> b!1005595 (= e!566374 false)))

(declare-fun lt!444612 () (_ BitVec 64))

(declare-fun lt!444613 () (_ BitVec 32))

(declare-datatypes ((array!63450 0))(
  ( (array!63451 (arr!30544 (Array (_ BitVec 32) (_ BitVec 64))) (size!31047 (_ BitVec 32))) )
))
(declare-fun lt!444617 () array!63450)

(declare-datatypes ((SeekEntryResult!9412 0))(
  ( (MissingZero!9412 (index!40019 (_ BitVec 32))) (Found!9412 (index!40020 (_ BitVec 32))) (Intermediate!9412 (undefined!10224 Bool) (index!40021 (_ BitVec 32)) (x!87580 (_ BitVec 32))) (Undefined!9412) (MissingVacant!9412 (index!40022 (_ BitVec 32))) )
))
(declare-fun lt!444616 () SeekEntryResult!9412)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63450 (_ BitVec 32)) SeekEntryResult!9412)

(assert (=> b!1005595 (= lt!444616 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444613 lt!444612 lt!444617 mask!3464))))

(declare-fun b!1005596 () Bool)

(declare-fun e!566373 () Bool)

(declare-fun e!566376 () Bool)

(assert (=> b!1005596 (= e!566373 e!566376)))

(declare-fun res!674325 () Bool)

(assert (=> b!1005596 (=> (not res!674325) (not e!566376))))

(declare-fun lt!444610 () SeekEntryResult!9412)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005596 (= res!674325 (not (= lt!444610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444612 mask!3464) lt!444612 lt!444617 mask!3464))))))

(declare-fun a!3219 () array!63450)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1005596 (= lt!444612 (select (store (arr!30544 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1005596 (= lt!444617 (array!63451 (store (arr!30544 a!3219) i!1194 k0!2224) (size!31047 a!3219)))))

(declare-fun b!1005597 () Bool)

(declare-fun e!566370 () Bool)

(declare-fun e!566372 () Bool)

(assert (=> b!1005597 (= e!566370 e!566372)))

(declare-fun res!674324 () Bool)

(assert (=> b!1005597 (=> (not res!674324) (not e!566372))))

(declare-fun lt!444615 () SeekEntryResult!9412)

(assert (=> b!1005597 (= res!674324 (= lt!444610 lt!444615))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005597 (= lt!444615 (Intermediate!9412 false resIndex!38 resX!38))))

(assert (=> b!1005597 (= lt!444610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30544 a!3219) j!170) mask!3464) (select (arr!30544 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!674318 () Bool)

(declare-fun e!566375 () Bool)

(assert (=> start!86830 (=> (not res!674318) (not e!566375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86830 (= res!674318 (validMask!0 mask!3464))))

(assert (=> start!86830 e!566375))

(declare-fun array_inv!23680 (array!63450) Bool)

(assert (=> start!86830 (array_inv!23680 a!3219)))

(assert (=> start!86830 true))

(declare-fun b!1005598 () Bool)

(declare-fun res!674314 () Bool)

(assert (=> b!1005598 (=> (not res!674314) (not e!566375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005598 (= res!674314 (validKeyInArray!0 (select (arr!30544 a!3219) j!170)))))

(declare-fun b!1005599 () Bool)

(declare-fun res!674313 () Bool)

(assert (=> b!1005599 (=> (not res!674313) (not e!566375))))

(assert (=> b!1005599 (= res!674313 (and (= (size!31047 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31047 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31047 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005600 () Bool)

(declare-fun res!674315 () Bool)

(assert (=> b!1005600 (=> (not res!674315) (not e!566375))))

(assert (=> b!1005600 (= res!674315 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005601 () Bool)

(declare-fun res!674317 () Bool)

(assert (=> b!1005601 (=> (not res!674317) (not e!566376))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1005601 (= res!674317 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1005602 () Bool)

(declare-fun res!674321 () Bool)

(assert (=> b!1005602 (=> (not res!674321) (not e!566370))))

(assert (=> b!1005602 (= res!674321 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31047 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31047 a!3219))))))

(declare-fun b!1005603 () Bool)

(declare-fun res!674322 () Bool)

(assert (=> b!1005603 (=> (not res!674322) (not e!566375))))

(declare-fun arrayContainsKey!0 (array!63450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005603 (= res!674322 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005604 () Bool)

(declare-fun res!674316 () Bool)

(assert (=> b!1005604 (=> (not res!674316) (not e!566370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63450 (_ BitVec 32)) Bool)

(assert (=> b!1005604 (= res!674316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005605 () Bool)

(assert (=> b!1005605 (= e!566376 e!566374)))

(declare-fun res!674312 () Bool)

(assert (=> b!1005605 (=> (not res!674312) (not e!566374))))

(assert (=> b!1005605 (= res!674312 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444613 #b00000000000000000000000000000000) (bvslt lt!444613 (size!31047 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005605 (= lt!444613 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1005606 () Bool)

(declare-fun res!674323 () Bool)

(assert (=> b!1005606 (=> (not res!674323) (not e!566376))))

(declare-fun lt!444611 () SeekEntryResult!9412)

(assert (=> b!1005606 (= res!674323 (not (= lt!444611 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444612 lt!444617 mask!3464))))))

(declare-fun b!1005607 () Bool)

(assert (=> b!1005607 (= e!566375 e!566370)))

(declare-fun res!674319 () Bool)

(assert (=> b!1005607 (=> (not res!674319) (not e!566370))))

(declare-fun lt!444614 () SeekEntryResult!9412)

(assert (=> b!1005607 (= res!674319 (or (= lt!444614 (MissingVacant!9412 i!1194)) (= lt!444614 (MissingZero!9412 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63450 (_ BitVec 32)) SeekEntryResult!9412)

(assert (=> b!1005607 (= lt!444614 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005608 () Bool)

(declare-fun res!674320 () Bool)

(assert (=> b!1005608 (=> (not res!674320) (not e!566374))))

(assert (=> b!1005608 (= res!674320 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444613 (select (arr!30544 a!3219) j!170) a!3219 mask!3464) lt!444615))))

(declare-fun b!1005609 () Bool)

(assert (=> b!1005609 (= e!566372 e!566373)))

(declare-fun res!674327 () Bool)

(assert (=> b!1005609 (=> (not res!674327) (not e!566373))))

(assert (=> b!1005609 (= res!674327 (= lt!444611 lt!444615))))

(assert (=> b!1005609 (= lt!444611 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30544 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005610 () Bool)

(declare-fun res!674326 () Bool)

(assert (=> b!1005610 (=> (not res!674326) (not e!566370))))

(declare-datatypes ((List!21191 0))(
  ( (Nil!21188) (Cons!21187 (h!22373 (_ BitVec 64)) (t!30184 List!21191)) )
))
(declare-fun arrayNoDuplicates!0 (array!63450 (_ BitVec 32) List!21191) Bool)

(assert (=> b!1005610 (= res!674326 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21188))))

(assert (= (and start!86830 res!674318) b!1005599))

(assert (= (and b!1005599 res!674313) b!1005598))

(assert (= (and b!1005598 res!674314) b!1005600))

(assert (= (and b!1005600 res!674315) b!1005603))

(assert (= (and b!1005603 res!674322) b!1005607))

(assert (= (and b!1005607 res!674319) b!1005604))

(assert (= (and b!1005604 res!674316) b!1005610))

(assert (= (and b!1005610 res!674326) b!1005602))

(assert (= (and b!1005602 res!674321) b!1005597))

(assert (= (and b!1005597 res!674324) b!1005609))

(assert (= (and b!1005609 res!674327) b!1005596))

(assert (= (and b!1005596 res!674325) b!1005606))

(assert (= (and b!1005606 res!674323) b!1005601))

(assert (= (and b!1005601 res!674317) b!1005605))

(assert (= (and b!1005605 res!674312) b!1005608))

(assert (= (and b!1005608 res!674320) b!1005595))

(declare-fun m!931433 () Bool)

(assert (=> start!86830 m!931433))

(declare-fun m!931435 () Bool)

(assert (=> start!86830 m!931435))

(declare-fun m!931437 () Bool)

(assert (=> b!1005604 m!931437))

(declare-fun m!931439 () Bool)

(assert (=> b!1005598 m!931439))

(assert (=> b!1005598 m!931439))

(declare-fun m!931441 () Bool)

(assert (=> b!1005598 m!931441))

(assert (=> b!1005597 m!931439))

(assert (=> b!1005597 m!931439))

(declare-fun m!931443 () Bool)

(assert (=> b!1005597 m!931443))

(assert (=> b!1005597 m!931443))

(assert (=> b!1005597 m!931439))

(declare-fun m!931445 () Bool)

(assert (=> b!1005597 m!931445))

(declare-fun m!931447 () Bool)

(assert (=> b!1005605 m!931447))

(declare-fun m!931449 () Bool)

(assert (=> b!1005606 m!931449))

(assert (=> b!1005608 m!931439))

(assert (=> b!1005608 m!931439))

(declare-fun m!931451 () Bool)

(assert (=> b!1005608 m!931451))

(declare-fun m!931453 () Bool)

(assert (=> b!1005607 m!931453))

(assert (=> b!1005609 m!931439))

(assert (=> b!1005609 m!931439))

(declare-fun m!931455 () Bool)

(assert (=> b!1005609 m!931455))

(declare-fun m!931457 () Bool)

(assert (=> b!1005610 m!931457))

(declare-fun m!931459 () Bool)

(assert (=> b!1005595 m!931459))

(declare-fun m!931461 () Bool)

(assert (=> b!1005600 m!931461))

(declare-fun m!931463 () Bool)

(assert (=> b!1005596 m!931463))

(assert (=> b!1005596 m!931463))

(declare-fun m!931465 () Bool)

(assert (=> b!1005596 m!931465))

(declare-fun m!931467 () Bool)

(assert (=> b!1005596 m!931467))

(declare-fun m!931469 () Bool)

(assert (=> b!1005596 m!931469))

(declare-fun m!931471 () Bool)

(assert (=> b!1005603 m!931471))

(check-sat (not b!1005610) (not b!1005598) (not b!1005596) (not b!1005605) (not b!1005608) (not b!1005597) (not b!1005595) (not b!1005606) (not b!1005607) (not b!1005600) (not b!1005603) (not b!1005609) (not start!86830) (not b!1005604))
(check-sat)
