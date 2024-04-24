; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87154 () Bool)

(assert start!87154)

(declare-fun b!1009425 () Bool)

(declare-fun e!568105 () Bool)

(declare-fun e!568108 () Bool)

(assert (=> b!1009425 (= e!568105 e!568108)))

(declare-fun res!677563 () Bool)

(assert (=> b!1009425 (=> (not res!677563) (not e!568108))))

(declare-datatypes ((SeekEntryResult!9493 0))(
  ( (MissingZero!9493 (index!40343 (_ BitVec 32))) (Found!9493 (index!40344 (_ BitVec 32))) (Intermediate!9493 (undefined!10305 Bool) (index!40345 (_ BitVec 32)) (x!87895 (_ BitVec 32))) (Undefined!9493) (MissingVacant!9493 (index!40346 (_ BitVec 32))) )
))
(declare-fun lt!446049 () SeekEntryResult!9493)

(declare-fun lt!446048 () SeekEntryResult!9493)

(assert (=> b!1009425 (= res!677563 (= lt!446049 lt!446048))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((array!63621 0))(
  ( (array!63622 (arr!30625 (Array (_ BitVec 32) (_ BitVec 64))) (size!31128 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63621)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63621 (_ BitVec 32)) SeekEntryResult!9493)

(assert (=> b!1009425 (= lt!446049 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30625 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009426 () Bool)

(declare-fun res!677565 () Bool)

(declare-fun e!568109 () Bool)

(assert (=> b!1009426 (=> (not res!677565) (not e!568109))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009426 (= res!677565 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31128 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31128 a!3219))))))

(declare-fun b!1009427 () Bool)

(assert (=> b!1009427 (= e!568109 e!568105)))

(declare-fun res!677566 () Bool)

(assert (=> b!1009427 (=> (not res!677566) (not e!568105))))

(declare-fun lt!446051 () SeekEntryResult!9493)

(assert (=> b!1009427 (= res!677566 (= lt!446051 lt!446048))))

(assert (=> b!1009427 (= lt!446048 (Intermediate!9493 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009427 (= lt!446051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30625 a!3219) j!170) mask!3464) (select (arr!30625 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009428 () Bool)

(declare-fun res!677559 () Bool)

(declare-fun e!568106 () Bool)

(assert (=> b!1009428 (=> (not res!677559) (not e!568106))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009428 (= res!677559 (and (= (size!31128 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31128 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31128 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009429 () Bool)

(declare-fun res!677560 () Bool)

(assert (=> b!1009429 (=> (not res!677560) (not e!568106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009429 (= res!677560 (validKeyInArray!0 (select (arr!30625 a!3219) j!170)))))

(declare-fun b!1009431 () Bool)

(declare-fun e!568107 () Bool)

(assert (=> b!1009431 (= e!568108 e!568107)))

(declare-fun res!677557 () Bool)

(assert (=> b!1009431 (=> (not res!677557) (not e!568107))))

(declare-fun lt!446050 () array!63621)

(declare-fun lt!446053 () (_ BitVec 64))

(assert (=> b!1009431 (= res!677557 (not (= lt!446051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446053 mask!3464) lt!446053 lt!446050 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009431 (= lt!446053 (select (store (arr!30625 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009431 (= lt!446050 (array!63622 (store (arr!30625 a!3219) i!1194 k0!2224) (size!31128 a!3219)))))

(declare-fun b!1009432 () Bool)

(assert (=> b!1009432 (= e!568106 e!568109)))

(declare-fun res!677568 () Bool)

(assert (=> b!1009432 (=> (not res!677568) (not e!568109))))

(declare-fun lt!446054 () SeekEntryResult!9493)

(assert (=> b!1009432 (= res!677568 (or (= lt!446054 (MissingVacant!9493 i!1194)) (= lt!446054 (MissingZero!9493 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63621 (_ BitVec 32)) SeekEntryResult!9493)

(assert (=> b!1009432 (= lt!446054 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009433 () Bool)

(declare-fun res!677570 () Bool)

(assert (=> b!1009433 (=> (not res!677570) (not e!568107))))

(assert (=> b!1009433 (= res!677570 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009434 () Bool)

(declare-fun res!677564 () Bool)

(assert (=> b!1009434 (=> (not res!677564) (not e!568106))))

(assert (=> b!1009434 (= res!677564 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009435 () Bool)

(declare-fun res!677561 () Bool)

(assert (=> b!1009435 (=> (not res!677561) (not e!568109))))

(declare-datatypes ((List!21272 0))(
  ( (Nil!21269) (Cons!21268 (h!22463 (_ BitVec 64)) (t!30265 List!21272)) )
))
(declare-fun arrayNoDuplicates!0 (array!63621 (_ BitVec 32) List!21272) Bool)

(assert (=> b!1009435 (= res!677561 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21269))))

(declare-fun b!1009436 () Bool)

(declare-fun res!677569 () Bool)

(assert (=> b!1009436 (=> (not res!677569) (not e!568109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63621 (_ BitVec 32)) Bool)

(assert (=> b!1009436 (= res!677569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009430 () Bool)

(assert (=> b!1009430 (= e!568107 false)))

(declare-fun lt!446052 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009430 (= lt!446052 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun res!677567 () Bool)

(assert (=> start!87154 (=> (not res!677567) (not e!568106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87154 (= res!677567 (validMask!0 mask!3464))))

(assert (=> start!87154 e!568106))

(declare-fun array_inv!23761 (array!63621) Bool)

(assert (=> start!87154 (array_inv!23761 a!3219)))

(assert (=> start!87154 true))

(declare-fun b!1009437 () Bool)

(declare-fun res!677558 () Bool)

(assert (=> b!1009437 (=> (not res!677558) (not e!568107))))

(assert (=> b!1009437 (= res!677558 (not (= lt!446049 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446053 lt!446050 mask!3464))))))

(declare-fun b!1009438 () Bool)

(declare-fun res!677562 () Bool)

(assert (=> b!1009438 (=> (not res!677562) (not e!568106))))

(declare-fun arrayContainsKey!0 (array!63621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009438 (= res!677562 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87154 res!677567) b!1009428))

(assert (= (and b!1009428 res!677559) b!1009429))

(assert (= (and b!1009429 res!677560) b!1009434))

(assert (= (and b!1009434 res!677564) b!1009438))

(assert (= (and b!1009438 res!677562) b!1009432))

(assert (= (and b!1009432 res!677568) b!1009436))

(assert (= (and b!1009436 res!677569) b!1009435))

(assert (= (and b!1009435 res!677561) b!1009426))

(assert (= (and b!1009426 res!677565) b!1009427))

(assert (= (and b!1009427 res!677566) b!1009425))

(assert (= (and b!1009425 res!677563) b!1009431))

(assert (= (and b!1009431 res!677557) b!1009437))

(assert (= (and b!1009437 res!677558) b!1009433))

(assert (= (and b!1009433 res!677570) b!1009430))

(declare-fun m!934487 () Bool)

(assert (=> b!1009435 m!934487))

(declare-fun m!934489 () Bool)

(assert (=> b!1009434 m!934489))

(declare-fun m!934491 () Bool)

(assert (=> b!1009425 m!934491))

(assert (=> b!1009425 m!934491))

(declare-fun m!934493 () Bool)

(assert (=> b!1009425 m!934493))

(assert (=> b!1009427 m!934491))

(assert (=> b!1009427 m!934491))

(declare-fun m!934495 () Bool)

(assert (=> b!1009427 m!934495))

(assert (=> b!1009427 m!934495))

(assert (=> b!1009427 m!934491))

(declare-fun m!934497 () Bool)

(assert (=> b!1009427 m!934497))

(declare-fun m!934499 () Bool)

(assert (=> b!1009431 m!934499))

(assert (=> b!1009431 m!934499))

(declare-fun m!934501 () Bool)

(assert (=> b!1009431 m!934501))

(declare-fun m!934503 () Bool)

(assert (=> b!1009431 m!934503))

(declare-fun m!934505 () Bool)

(assert (=> b!1009431 m!934505))

(declare-fun m!934507 () Bool)

(assert (=> b!1009438 m!934507))

(declare-fun m!934509 () Bool)

(assert (=> b!1009436 m!934509))

(assert (=> b!1009429 m!934491))

(assert (=> b!1009429 m!934491))

(declare-fun m!934511 () Bool)

(assert (=> b!1009429 m!934511))

(declare-fun m!934513 () Bool)

(assert (=> start!87154 m!934513))

(declare-fun m!934515 () Bool)

(assert (=> start!87154 m!934515))

(declare-fun m!934517 () Bool)

(assert (=> b!1009430 m!934517))

(declare-fun m!934519 () Bool)

(assert (=> b!1009437 m!934519))

(declare-fun m!934521 () Bool)

(assert (=> b!1009432 m!934521))

(check-sat (not b!1009435) (not b!1009431) (not b!1009427) (not b!1009434) (not b!1009425) (not b!1009436) (not b!1009429) (not b!1009430) (not b!1009437) (not b!1009438) (not start!87154) (not b!1009432))
(check-sat)
