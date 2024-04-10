; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87264 () Bool)

(assert start!87264)

(declare-fun b!1011502 () Bool)

(declare-fun res!679457 () Bool)

(declare-fun e!569044 () Bool)

(assert (=> b!1011502 (=> (not res!679457) (not e!569044))))

(declare-datatypes ((array!63668 0))(
  ( (array!63669 (arr!30649 (Array (_ BitVec 32) (_ BitVec 64))) (size!31151 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63668)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011502 (= res!679457 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31151 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31151 a!3219))))))

(declare-fun b!1011503 () Bool)

(declare-fun e!569045 () Bool)

(assert (=> b!1011503 (= e!569044 e!569045)))

(declare-fun res!679452 () Bool)

(assert (=> b!1011503 (=> (not res!679452) (not e!569045))))

(declare-datatypes ((SeekEntryResult!9581 0))(
  ( (MissingZero!9581 (index!40695 (_ BitVec 32))) (Found!9581 (index!40696 (_ BitVec 32))) (Intermediate!9581 (undefined!10393 Bool) (index!40697 (_ BitVec 32)) (x!88115 (_ BitVec 32))) (Undefined!9581) (MissingVacant!9581 (index!40698 (_ BitVec 32))) )
))
(declare-fun lt!447048 () SeekEntryResult!9581)

(declare-fun lt!447049 () SeekEntryResult!9581)

(assert (=> b!1011503 (= res!679452 (= lt!447048 lt!447049))))

(assert (=> b!1011503 (= lt!447049 (Intermediate!9581 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63668 (_ BitVec 32)) SeekEntryResult!9581)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011503 (= lt!447048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30649 a!3219) j!170) mask!3464) (select (arr!30649 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011504 () Bool)

(declare-fun res!679460 () Bool)

(declare-fun e!569050 () Bool)

(assert (=> b!1011504 (=> (not res!679460) (not e!569050))))

(declare-fun lt!447050 () (_ BitVec 64))

(declare-fun lt!447051 () SeekEntryResult!9581)

(declare-fun lt!447046 () array!63668)

(assert (=> b!1011504 (= res!679460 (not (= lt!447051 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447050 lt!447046 mask!3464))))))

(declare-fun b!1011505 () Bool)

(declare-fun e!569049 () Bool)

(assert (=> b!1011505 (= e!569049 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1245)) (bvsub #b01111111111111111111111111111110 x!1245)))))

(declare-fun b!1011506 () Bool)

(declare-fun e!569048 () Bool)

(assert (=> b!1011506 (= e!569048 e!569049)))

(declare-fun res!679467 () Bool)

(assert (=> b!1011506 (=> (not res!679467) (not e!569049))))

(declare-fun lt!447045 () SeekEntryResult!9581)

(assert (=> b!1011506 (= res!679467 (= lt!447045 lt!447049))))

(declare-fun lt!447047 () (_ BitVec 32))

(assert (=> b!1011506 (= lt!447045 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447047 (select (arr!30649 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011507 () Bool)

(declare-fun res!679451 () Bool)

(declare-fun e!569046 () Bool)

(assert (=> b!1011507 (=> (not res!679451) (not e!569046))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011507 (= res!679451 (and (= (size!31151 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31151 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31151 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!679459 () Bool)

(assert (=> start!87264 (=> (not res!679459) (not e!569046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87264 (= res!679459 (validMask!0 mask!3464))))

(assert (=> start!87264 e!569046))

(declare-fun array_inv!23773 (array!63668) Bool)

(assert (=> start!87264 (array_inv!23773 a!3219)))

(assert (=> start!87264 true))

(declare-fun b!1011508 () Bool)

(declare-fun res!679463 () Bool)

(assert (=> b!1011508 (=> (not res!679463) (not e!569044))))

(declare-datatypes ((List!21325 0))(
  ( (Nil!21322) (Cons!21321 (h!22519 (_ BitVec 64)) (t!30326 List!21325)) )
))
(declare-fun arrayNoDuplicates!0 (array!63668 (_ BitVec 32) List!21325) Bool)

(assert (=> b!1011508 (= res!679463 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21322))))

(declare-fun b!1011509 () Bool)

(declare-fun e!569043 () Bool)

(assert (=> b!1011509 (= e!569043 e!569050)))

(declare-fun res!679462 () Bool)

(assert (=> b!1011509 (=> (not res!679462) (not e!569050))))

(assert (=> b!1011509 (= res!679462 (not (= lt!447048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447050 mask!3464) lt!447050 lt!447046 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1011509 (= lt!447050 (select (store (arr!30649 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1011509 (= lt!447046 (array!63669 (store (arr!30649 a!3219) i!1194 k!2224) (size!31151 a!3219)))))

(declare-fun b!1011510 () Bool)

(declare-fun res!679458 () Bool)

(assert (=> b!1011510 (=> (not res!679458) (not e!569049))))

(assert (=> b!1011510 (= res!679458 (not (= lt!447045 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447047 lt!447050 lt!447046 mask!3464))))))

(declare-fun b!1011511 () Bool)

(declare-fun res!679464 () Bool)

(assert (=> b!1011511 (=> (not res!679464) (not e!569046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011511 (= res!679464 (validKeyInArray!0 (select (arr!30649 a!3219) j!170)))))

(declare-fun b!1011512 () Bool)

(declare-fun res!679466 () Bool)

(assert (=> b!1011512 (=> (not res!679466) (not e!569046))))

(assert (=> b!1011512 (= res!679466 (validKeyInArray!0 k!2224))))

(declare-fun b!1011513 () Bool)

(declare-fun res!679454 () Bool)

(assert (=> b!1011513 (=> (not res!679454) (not e!569050))))

(assert (=> b!1011513 (= res!679454 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011514 () Bool)

(assert (=> b!1011514 (= e!569045 e!569043)))

(declare-fun res!679455 () Bool)

(assert (=> b!1011514 (=> (not res!679455) (not e!569043))))

(assert (=> b!1011514 (= res!679455 (= lt!447051 lt!447049))))

(assert (=> b!1011514 (= lt!447051 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30649 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011515 () Bool)

(assert (=> b!1011515 (= e!569046 e!569044)))

(declare-fun res!679456 () Bool)

(assert (=> b!1011515 (=> (not res!679456) (not e!569044))))

(declare-fun lt!447044 () SeekEntryResult!9581)

(assert (=> b!1011515 (= res!679456 (or (= lt!447044 (MissingVacant!9581 i!1194)) (= lt!447044 (MissingZero!9581 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63668 (_ BitVec 32)) SeekEntryResult!9581)

(assert (=> b!1011515 (= lt!447044 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1011516 () Bool)

(assert (=> b!1011516 (= e!569050 e!569048)))

(declare-fun res!679453 () Bool)

(assert (=> b!1011516 (=> (not res!679453) (not e!569048))))

(assert (=> b!1011516 (= res!679453 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447047 #b00000000000000000000000000000000) (bvslt lt!447047 (size!31151 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011516 (= lt!447047 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011517 () Bool)

(declare-fun res!679465 () Bool)

(assert (=> b!1011517 (=> (not res!679465) (not e!569046))))

(declare-fun arrayContainsKey!0 (array!63668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011517 (= res!679465 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011518 () Bool)

(declare-fun res!679461 () Bool)

(assert (=> b!1011518 (=> (not res!679461) (not e!569044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63668 (_ BitVec 32)) Bool)

(assert (=> b!1011518 (= res!679461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!87264 res!679459) b!1011507))

(assert (= (and b!1011507 res!679451) b!1011511))

(assert (= (and b!1011511 res!679464) b!1011512))

(assert (= (and b!1011512 res!679466) b!1011517))

(assert (= (and b!1011517 res!679465) b!1011515))

(assert (= (and b!1011515 res!679456) b!1011518))

(assert (= (and b!1011518 res!679461) b!1011508))

(assert (= (and b!1011508 res!679463) b!1011502))

(assert (= (and b!1011502 res!679457) b!1011503))

(assert (= (and b!1011503 res!679452) b!1011514))

(assert (= (and b!1011514 res!679455) b!1011509))

(assert (= (and b!1011509 res!679462) b!1011504))

(assert (= (and b!1011504 res!679460) b!1011513))

(assert (= (and b!1011513 res!679454) b!1011516))

(assert (= (and b!1011516 res!679453) b!1011506))

(assert (= (and b!1011506 res!679467) b!1011510))

(assert (= (and b!1011510 res!679458) b!1011505))

(declare-fun m!935493 () Bool)

(assert (=> b!1011503 m!935493))

(assert (=> b!1011503 m!935493))

(declare-fun m!935495 () Bool)

(assert (=> b!1011503 m!935495))

(assert (=> b!1011503 m!935495))

(assert (=> b!1011503 m!935493))

(declare-fun m!935497 () Bool)

(assert (=> b!1011503 m!935497))

(assert (=> b!1011511 m!935493))

(assert (=> b!1011511 m!935493))

(declare-fun m!935499 () Bool)

(assert (=> b!1011511 m!935499))

(declare-fun m!935501 () Bool)

(assert (=> b!1011510 m!935501))

(declare-fun m!935503 () Bool)

(assert (=> b!1011517 m!935503))

(declare-fun m!935505 () Bool)

(assert (=> b!1011515 m!935505))

(declare-fun m!935507 () Bool)

(assert (=> start!87264 m!935507))

(declare-fun m!935509 () Bool)

(assert (=> start!87264 m!935509))

(declare-fun m!935511 () Bool)

(assert (=> b!1011518 m!935511))

(declare-fun m!935513 () Bool)

(assert (=> b!1011509 m!935513))

(assert (=> b!1011509 m!935513))

(declare-fun m!935515 () Bool)

(assert (=> b!1011509 m!935515))

(declare-fun m!935517 () Bool)

(assert (=> b!1011509 m!935517))

(declare-fun m!935519 () Bool)

(assert (=> b!1011509 m!935519))

(declare-fun m!935521 () Bool)

(assert (=> b!1011516 m!935521))

(declare-fun m!935523 () Bool)

(assert (=> b!1011508 m!935523))

(declare-fun m!935525 () Bool)

(assert (=> b!1011504 m!935525))

(assert (=> b!1011506 m!935493))

(assert (=> b!1011506 m!935493))

(declare-fun m!935527 () Bool)

(assert (=> b!1011506 m!935527))

(assert (=> b!1011514 m!935493))

(assert (=> b!1011514 m!935493))

(declare-fun m!935529 () Bool)

(assert (=> b!1011514 m!935529))

(declare-fun m!935531 () Bool)

(assert (=> b!1011512 m!935531))

(push 1)

(assert (not b!1011508))

(assert (not b!1011506))

(assert (not b!1011503))

(assert (not b!1011518))

(assert (not b!1011517))

(assert (not b!1011515))

(assert (not start!87264))

(assert (not b!1011514))

(assert (not b!1011511))

(assert (not b!1011512))

(assert (not b!1011504))

(assert (not b!1011509))

(assert (not b!1011516))

(assert (not b!1011510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

