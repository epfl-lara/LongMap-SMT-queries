; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123772 () Bool)

(assert start!123772)

(declare-fun b!1433564 () Bool)

(declare-fun res!966597 () Bool)

(declare-fun e!809374 () Bool)

(assert (=> b!1433564 (=> (not res!966597) (not e!809374))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433564 (= res!966597 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!966593 () Bool)

(declare-fun e!809370 () Bool)

(assert (=> start!123772 (=> (not res!966593) (not e!809370))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123772 (= res!966593 (validMask!0 mask!2608))))

(assert (=> start!123772 e!809370))

(assert (=> start!123772 true))

(declare-datatypes ((array!97625 0))(
  ( (array!97626 (arr!47116 (Array (_ BitVec 32) (_ BitVec 64))) (size!47667 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97625)

(declare-fun array_inv!36397 (array!97625) Bool)

(assert (=> start!123772 (array_inv!36397 a!2831)))

(declare-fun b!1433565 () Bool)

(declare-fun e!809375 () Bool)

(assert (=> b!1433565 (= e!809370 e!809375)))

(declare-fun res!966592 () Bool)

(assert (=> b!1433565 (=> (not res!966592) (not e!809375))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11297 0))(
  ( (MissingZero!11297 (index!47580 (_ BitVec 32))) (Found!11297 (index!47581 (_ BitVec 32))) (Intermediate!11297 (undefined!12109 Bool) (index!47582 (_ BitVec 32)) (x!129387 (_ BitVec 32))) (Undefined!11297) (MissingVacant!11297 (index!47583 (_ BitVec 32))) )
))
(declare-fun lt!630988 () SeekEntryResult!11297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97625 (_ BitVec 32)) SeekEntryResult!11297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433565 (= res!966592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47116 a!2831) j!81) mask!2608) (select (arr!47116 a!2831) j!81) a!2831 mask!2608) lt!630988))))

(assert (=> b!1433565 (= lt!630988 (Intermediate!11297 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433566 () Bool)

(declare-fun res!966600 () Bool)

(assert (=> b!1433566 (=> (not res!966600) (not e!809370))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433566 (= res!966600 (validKeyInArray!0 (select (arr!47116 a!2831) i!982)))))

(declare-fun b!1433567 () Bool)

(declare-fun res!966602 () Bool)

(assert (=> b!1433567 (=> (not res!966602) (not e!809370))))

(assert (=> b!1433567 (= res!966602 (validKeyInArray!0 (select (arr!47116 a!2831) j!81)))))

(declare-fun b!1433568 () Bool)

(declare-fun res!966594 () Bool)

(assert (=> b!1433568 (=> (not res!966594) (not e!809374))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1433568 (= res!966594 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47116 a!2831) j!81) a!2831 mask!2608) lt!630988))))

(declare-fun b!1433569 () Bool)

(declare-fun e!809373 () Bool)

(assert (=> b!1433569 (= e!809374 (not e!809373))))

(declare-fun res!966596 () Bool)

(assert (=> b!1433569 (=> res!966596 e!809373)))

(assert (=> b!1433569 (= res!966596 (or (= (select (arr!47116 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47116 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47116 a!2831) index!585) (select (arr!47116 a!2831) j!81)) (= (select (store (arr!47116 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809372 () Bool)

(assert (=> b!1433569 e!809372))

(declare-fun res!966591 () Bool)

(assert (=> b!1433569 (=> (not res!966591) (not e!809372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97625 (_ BitVec 32)) Bool)

(assert (=> b!1433569 (= res!966591 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48371 0))(
  ( (Unit!48372) )
))
(declare-fun lt!630991 () Unit!48371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48371)

(assert (=> b!1433569 (= lt!630991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433570 () Bool)

(declare-fun res!966604 () Bool)

(assert (=> b!1433570 (=> (not res!966604) (not e!809370))))

(declare-datatypes ((List!33613 0))(
  ( (Nil!33610) (Cons!33609 (h!34943 (_ BitVec 64)) (t!48299 List!33613)) )
))
(declare-fun arrayNoDuplicates!0 (array!97625 (_ BitVec 32) List!33613) Bool)

(assert (=> b!1433570 (= res!966604 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33610))))

(declare-fun b!1433571 () Bool)

(assert (=> b!1433571 (= e!809373 true)))

(declare-fun lt!630990 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433571 (= lt!630990 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1433572 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97625 (_ BitVec 32)) SeekEntryResult!11297)

(assert (=> b!1433572 (= e!809372 (= (seekEntryOrOpen!0 (select (arr!47116 a!2831) j!81) a!2831 mask!2608) (Found!11297 j!81)))))

(declare-fun b!1433573 () Bool)

(assert (=> b!1433573 (= e!809375 e!809374)))

(declare-fun res!966601 () Bool)

(assert (=> b!1433573 (=> (not res!966601) (not e!809374))))

(declare-fun lt!630989 () (_ BitVec 64))

(declare-fun lt!630992 () SeekEntryResult!11297)

(declare-fun lt!630987 () array!97625)

(assert (=> b!1433573 (= res!966601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630989 mask!2608) lt!630989 lt!630987 mask!2608) lt!630992))))

(assert (=> b!1433573 (= lt!630992 (Intermediate!11297 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433573 (= lt!630989 (select (store (arr!47116 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433573 (= lt!630987 (array!97626 (store (arr!47116 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47667 a!2831)))))

(declare-fun b!1433574 () Bool)

(declare-fun res!966595 () Bool)

(assert (=> b!1433574 (=> (not res!966595) (not e!809370))))

(assert (=> b!1433574 (= res!966595 (and (= (size!47667 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47667 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47667 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433575 () Bool)

(declare-fun res!966599 () Bool)

(assert (=> b!1433575 (=> (not res!966599) (not e!809370))))

(assert (=> b!1433575 (= res!966599 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47667 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47667 a!2831))))))

(declare-fun b!1433576 () Bool)

(declare-fun res!966598 () Bool)

(assert (=> b!1433576 (=> (not res!966598) (not e!809374))))

(assert (=> b!1433576 (= res!966598 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630989 lt!630987 mask!2608) lt!630992))))

(declare-fun b!1433577 () Bool)

(declare-fun res!966603 () Bool)

(assert (=> b!1433577 (=> (not res!966603) (not e!809370))))

(assert (=> b!1433577 (= res!966603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123772 res!966593) b!1433574))

(assert (= (and b!1433574 res!966595) b!1433566))

(assert (= (and b!1433566 res!966600) b!1433567))

(assert (= (and b!1433567 res!966602) b!1433577))

(assert (= (and b!1433577 res!966603) b!1433570))

(assert (= (and b!1433570 res!966604) b!1433575))

(assert (= (and b!1433575 res!966599) b!1433565))

(assert (= (and b!1433565 res!966592) b!1433573))

(assert (= (and b!1433573 res!966601) b!1433568))

(assert (= (and b!1433568 res!966594) b!1433576))

(assert (= (and b!1433576 res!966598) b!1433564))

(assert (= (and b!1433564 res!966597) b!1433569))

(assert (= (and b!1433569 res!966591) b!1433572))

(assert (= (and b!1433569 (not res!966596)) b!1433571))

(declare-fun m!1323463 () Bool)

(assert (=> b!1433570 m!1323463))

(declare-fun m!1323465 () Bool)

(assert (=> b!1433569 m!1323465))

(declare-fun m!1323467 () Bool)

(assert (=> b!1433569 m!1323467))

(declare-fun m!1323469 () Bool)

(assert (=> b!1433569 m!1323469))

(declare-fun m!1323471 () Bool)

(assert (=> b!1433569 m!1323471))

(declare-fun m!1323473 () Bool)

(assert (=> b!1433569 m!1323473))

(declare-fun m!1323475 () Bool)

(assert (=> b!1433569 m!1323475))

(declare-fun m!1323477 () Bool)

(assert (=> b!1433571 m!1323477))

(declare-fun m!1323479 () Bool)

(assert (=> b!1433576 m!1323479))

(declare-fun m!1323481 () Bool)

(assert (=> b!1433573 m!1323481))

(assert (=> b!1433573 m!1323481))

(declare-fun m!1323483 () Bool)

(assert (=> b!1433573 m!1323483))

(assert (=> b!1433573 m!1323465))

(declare-fun m!1323485 () Bool)

(assert (=> b!1433573 m!1323485))

(declare-fun m!1323487 () Bool)

(assert (=> b!1433577 m!1323487))

(declare-fun m!1323489 () Bool)

(assert (=> b!1433566 m!1323489))

(assert (=> b!1433566 m!1323489))

(declare-fun m!1323491 () Bool)

(assert (=> b!1433566 m!1323491))

(assert (=> b!1433568 m!1323473))

(assert (=> b!1433568 m!1323473))

(declare-fun m!1323493 () Bool)

(assert (=> b!1433568 m!1323493))

(assert (=> b!1433565 m!1323473))

(assert (=> b!1433565 m!1323473))

(declare-fun m!1323495 () Bool)

(assert (=> b!1433565 m!1323495))

(assert (=> b!1433565 m!1323495))

(assert (=> b!1433565 m!1323473))

(declare-fun m!1323497 () Bool)

(assert (=> b!1433565 m!1323497))

(declare-fun m!1323499 () Bool)

(assert (=> start!123772 m!1323499))

(declare-fun m!1323501 () Bool)

(assert (=> start!123772 m!1323501))

(assert (=> b!1433567 m!1323473))

(assert (=> b!1433567 m!1323473))

(declare-fun m!1323503 () Bool)

(assert (=> b!1433567 m!1323503))

(assert (=> b!1433572 m!1323473))

(assert (=> b!1433572 m!1323473))

(declare-fun m!1323505 () Bool)

(assert (=> b!1433572 m!1323505))

(check-sat (not b!1433572) (not b!1433566) (not b!1433569) (not start!123772) (not b!1433567) (not b!1433571) (not b!1433565) (not b!1433577) (not b!1433568) (not b!1433576) (not b!1433573) (not b!1433570))
(check-sat)
