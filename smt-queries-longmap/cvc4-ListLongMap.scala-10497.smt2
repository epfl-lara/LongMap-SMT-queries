; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123562 () Bool)

(assert start!123562)

(declare-fun b!1432655 () Bool)

(declare-fun res!966532 () Bool)

(declare-fun e!808696 () Bool)

(assert (=> b!1432655 (=> (not res!966532) (not e!808696))))

(declare-datatypes ((array!97534 0))(
  ( (array!97535 (arr!47074 (Array (_ BitVec 32) (_ BitVec 64))) (size!47624 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97534)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432655 (= res!966532 (validKeyInArray!0 (select (arr!47074 a!2831) j!81)))))

(declare-fun b!1432656 () Bool)

(declare-fun res!966520 () Bool)

(declare-fun e!808695 () Bool)

(assert (=> b!1432656 (=> (not res!966520) (not e!808695))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!630690 () array!97534)

(declare-fun lt!630686 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11353 0))(
  ( (MissingZero!11353 (index!47804 (_ BitVec 32))) (Found!11353 (index!47805 (_ BitVec 32))) (Intermediate!11353 (undefined!12165 Bool) (index!47806 (_ BitVec 32)) (x!129443 (_ BitVec 32))) (Undefined!11353) (MissingVacant!11353 (index!47807 (_ BitVec 32))) )
))
(declare-fun lt!630687 () SeekEntryResult!11353)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97534 (_ BitVec 32)) SeekEntryResult!11353)

(assert (=> b!1432656 (= res!966520 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630686 lt!630690 mask!2608) lt!630687))))

(declare-fun b!1432657 () Bool)

(declare-fun res!966531 () Bool)

(assert (=> b!1432657 (=> (not res!966531) (not e!808696))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432657 (= res!966531 (and (= (size!47624 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47624 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47624 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432658 () Bool)

(declare-fun e!808697 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97534 (_ BitVec 32)) SeekEntryResult!11353)

(assert (=> b!1432658 (= e!808697 (= (seekEntryOrOpen!0 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) (Found!11353 j!81)))))

(declare-fun b!1432659 () Bool)

(declare-fun e!808693 () Bool)

(assert (=> b!1432659 (= e!808693 e!808695)))

(declare-fun res!966521 () Bool)

(assert (=> b!1432659 (=> (not res!966521) (not e!808695))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432659 (= res!966521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630686 mask!2608) lt!630686 lt!630690 mask!2608) lt!630687))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432659 (= lt!630687 (Intermediate!11353 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432659 (= lt!630686 (select (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432659 (= lt!630690 (array!97535 (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47624 a!2831)))))

(declare-fun b!1432660 () Bool)

(declare-fun e!808694 () Bool)

(assert (=> b!1432660 (= e!808695 (not e!808694))))

(declare-fun res!966519 () Bool)

(assert (=> b!1432660 (=> res!966519 e!808694)))

(assert (=> b!1432660 (= res!966519 (or (= (select (arr!47074 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47074 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47074 a!2831) index!585) (select (arr!47074 a!2831) j!81)) (= (select (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432660 e!808697))

(declare-fun res!966525 () Bool)

(assert (=> b!1432660 (=> (not res!966525) (not e!808697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97534 (_ BitVec 32)) Bool)

(assert (=> b!1432660 (= res!966525 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48452 0))(
  ( (Unit!48453) )
))
(declare-fun lt!630689 () Unit!48452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48452)

(assert (=> b!1432660 (= lt!630689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432661 () Bool)

(assert (=> b!1432661 (= e!808694 true)))

(declare-fun lt!630688 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432661 (= lt!630688 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432662 () Bool)

(declare-fun res!966523 () Bool)

(assert (=> b!1432662 (=> (not res!966523) (not e!808696))))

(assert (=> b!1432662 (= res!966523 (validKeyInArray!0 (select (arr!47074 a!2831) i!982)))))

(declare-fun b!1432663 () Bool)

(declare-fun res!966522 () Bool)

(assert (=> b!1432663 (=> (not res!966522) (not e!808695))))

(declare-fun lt!630685 () SeekEntryResult!11353)

(assert (=> b!1432663 (= res!966522 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!630685))))

(declare-fun res!966527 () Bool)

(assert (=> start!123562 (=> (not res!966527) (not e!808696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123562 (= res!966527 (validMask!0 mask!2608))))

(assert (=> start!123562 e!808696))

(assert (=> start!123562 true))

(declare-fun array_inv!36102 (array!97534) Bool)

(assert (=> start!123562 (array_inv!36102 a!2831)))

(declare-fun b!1432664 () Bool)

(declare-fun res!966528 () Bool)

(assert (=> b!1432664 (=> (not res!966528) (not e!808695))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432664 (= res!966528 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432665 () Bool)

(declare-fun res!966530 () Bool)

(assert (=> b!1432665 (=> (not res!966530) (not e!808696))))

(assert (=> b!1432665 (= res!966530 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47624 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47624 a!2831))))))

(declare-fun b!1432666 () Bool)

(declare-fun res!966529 () Bool)

(assert (=> b!1432666 (=> (not res!966529) (not e!808696))))

(assert (=> b!1432666 (= res!966529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432667 () Bool)

(declare-fun res!966526 () Bool)

(assert (=> b!1432667 (=> (not res!966526) (not e!808696))))

(declare-datatypes ((List!33584 0))(
  ( (Nil!33581) (Cons!33580 (h!34903 (_ BitVec 64)) (t!48278 List!33584)) )
))
(declare-fun arrayNoDuplicates!0 (array!97534 (_ BitVec 32) List!33584) Bool)

(assert (=> b!1432667 (= res!966526 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33581))))

(declare-fun b!1432668 () Bool)

(assert (=> b!1432668 (= e!808696 e!808693)))

(declare-fun res!966524 () Bool)

(assert (=> b!1432668 (=> (not res!966524) (not e!808693))))

(assert (=> b!1432668 (= res!966524 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!630685))))

(assert (=> b!1432668 (= lt!630685 (Intermediate!11353 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123562 res!966527) b!1432657))

(assert (= (and b!1432657 res!966531) b!1432662))

(assert (= (and b!1432662 res!966523) b!1432655))

(assert (= (and b!1432655 res!966532) b!1432666))

(assert (= (and b!1432666 res!966529) b!1432667))

(assert (= (and b!1432667 res!966526) b!1432665))

(assert (= (and b!1432665 res!966530) b!1432668))

(assert (= (and b!1432668 res!966524) b!1432659))

(assert (= (and b!1432659 res!966521) b!1432663))

(assert (= (and b!1432663 res!966522) b!1432656))

(assert (= (and b!1432656 res!966520) b!1432664))

(assert (= (and b!1432664 res!966528) b!1432660))

(assert (= (and b!1432660 res!966525) b!1432658))

(assert (= (and b!1432660 (not res!966519)) b!1432661))

(declare-fun m!1322473 () Bool)

(assert (=> b!1432656 m!1322473))

(declare-fun m!1322475 () Bool)

(assert (=> b!1432663 m!1322475))

(assert (=> b!1432663 m!1322475))

(declare-fun m!1322477 () Bool)

(assert (=> b!1432663 m!1322477))

(declare-fun m!1322479 () Bool)

(assert (=> b!1432666 m!1322479))

(declare-fun m!1322481 () Bool)

(assert (=> b!1432659 m!1322481))

(assert (=> b!1432659 m!1322481))

(declare-fun m!1322483 () Bool)

(assert (=> b!1432659 m!1322483))

(declare-fun m!1322485 () Bool)

(assert (=> b!1432659 m!1322485))

(declare-fun m!1322487 () Bool)

(assert (=> b!1432659 m!1322487))

(assert (=> b!1432658 m!1322475))

(assert (=> b!1432658 m!1322475))

(declare-fun m!1322489 () Bool)

(assert (=> b!1432658 m!1322489))

(declare-fun m!1322491 () Bool)

(assert (=> b!1432667 m!1322491))

(assert (=> b!1432660 m!1322485))

(declare-fun m!1322493 () Bool)

(assert (=> b!1432660 m!1322493))

(declare-fun m!1322495 () Bool)

(assert (=> b!1432660 m!1322495))

(declare-fun m!1322497 () Bool)

(assert (=> b!1432660 m!1322497))

(assert (=> b!1432660 m!1322475))

(declare-fun m!1322499 () Bool)

(assert (=> b!1432660 m!1322499))

(declare-fun m!1322501 () Bool)

(assert (=> b!1432661 m!1322501))

(declare-fun m!1322503 () Bool)

(assert (=> b!1432662 m!1322503))

(assert (=> b!1432662 m!1322503))

(declare-fun m!1322505 () Bool)

(assert (=> b!1432662 m!1322505))

(assert (=> b!1432655 m!1322475))

(assert (=> b!1432655 m!1322475))

(declare-fun m!1322507 () Bool)

(assert (=> b!1432655 m!1322507))

(assert (=> b!1432668 m!1322475))

(assert (=> b!1432668 m!1322475))

(declare-fun m!1322509 () Bool)

(assert (=> b!1432668 m!1322509))

(assert (=> b!1432668 m!1322509))

(assert (=> b!1432668 m!1322475))

(declare-fun m!1322511 () Bool)

(assert (=> b!1432668 m!1322511))

(declare-fun m!1322513 () Bool)

(assert (=> start!123562 m!1322513))

(declare-fun m!1322515 () Bool)

(assert (=> start!123562 m!1322515))

(push 1)

