; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122808 () Bool)

(assert start!122808)

(declare-fun b!1424031 () Bool)

(declare-fun res!959471 () Bool)

(declare-fun e!804836 () Bool)

(assert (=> b!1424031 (=> (not res!959471) (not e!804836))))

(declare-datatypes ((SeekEntryResult!11189 0))(
  ( (MissingZero!11189 (index!47148 (_ BitVec 32))) (Found!11189 (index!47149 (_ BitVec 32))) (Intermediate!11189 (undefined!12001 Bool) (index!47150 (_ BitVec 32)) (x!128783 (_ BitVec 32))) (Undefined!11189) (MissingVacant!11189 (index!47151 (_ BitVec 32))) )
))
(declare-fun lt!627378 () SeekEntryResult!11189)

(declare-datatypes ((array!97173 0))(
  ( (array!97174 (arr!46904 (Array (_ BitVec 32) (_ BitVec 64))) (size!47454 (_ BitVec 32))) )
))
(declare-fun lt!627372 () array!97173)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627375 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97173 (_ BitVec 32)) SeekEntryResult!11189)

(assert (=> b!1424031 (= res!959471 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627375 lt!627372 mask!2608) lt!627378))))

(declare-fun b!1424032 () Bool)

(declare-fun e!804842 () Bool)

(assert (=> b!1424032 (= e!804842 true)))

(declare-fun lt!627374 () (_ BitVec 32))

(declare-fun lt!627377 () SeekEntryResult!11189)

(assert (=> b!1424032 (= lt!627377 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627374 lt!627375 lt!627372 mask!2608))))

(declare-fun b!1424034 () Bool)

(declare-fun res!959470 () Bool)

(declare-fun e!804839 () Bool)

(assert (=> b!1424034 (=> (not res!959470) (not e!804839))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun a!2831 () array!97173)

(assert (=> b!1424034 (= res!959470 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47454 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47454 a!2831))))))

(declare-fun b!1424035 () Bool)

(declare-fun e!804837 () Bool)

(assert (=> b!1424035 (= e!804837 e!804836)))

(declare-fun res!959466 () Bool)

(assert (=> b!1424035 (=> (not res!959466) (not e!804836))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424035 (= res!959466 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627375 mask!2608) lt!627375 lt!627372 mask!2608) lt!627378))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424035 (= lt!627378 (Intermediate!11189 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424035 (= lt!627375 (select (store (arr!46904 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424035 (= lt!627372 (array!97174 (store (arr!46904 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47454 a!2831)))))

(declare-fun b!1424036 () Bool)

(declare-fun res!959478 () Bool)

(assert (=> b!1424036 (=> (not res!959478) (not e!804839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97173 (_ BitVec 32)) Bool)

(assert (=> b!1424036 (= res!959478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun e!804840 () Bool)

(declare-fun b!1424037 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97173 (_ BitVec 32)) SeekEntryResult!11189)

(assert (=> b!1424037 (= e!804840 (= (seekEntryOrOpen!0 (select (arr!46904 a!2831) j!81) a!2831 mask!2608) (Found!11189 j!81)))))

(declare-fun b!1424038 () Bool)

(declare-fun res!959472 () Bool)

(assert (=> b!1424038 (=> (not res!959472) (not e!804839))))

(declare-datatypes ((List!33414 0))(
  ( (Nil!33411) (Cons!33410 (h!34712 (_ BitVec 64)) (t!48108 List!33414)) )
))
(declare-fun arrayNoDuplicates!0 (array!97173 (_ BitVec 32) List!33414) Bool)

(assert (=> b!1424038 (= res!959472 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33411))))

(declare-fun b!1424039 () Bool)

(declare-fun res!959477 () Bool)

(assert (=> b!1424039 (=> (not res!959477) (not e!804836))))

(assert (=> b!1424039 (= res!959477 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424040 () Bool)

(declare-fun res!959464 () Bool)

(assert (=> b!1424040 (=> (not res!959464) (not e!804839))))

(assert (=> b!1424040 (= res!959464 (and (= (size!47454 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47454 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47454 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424041 () Bool)

(declare-fun res!959469 () Bool)

(assert (=> b!1424041 (=> (not res!959469) (not e!804839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424041 (= res!959469 (validKeyInArray!0 (select (arr!46904 a!2831) j!81)))))

(declare-fun b!1424042 () Bool)

(declare-fun res!959474 () Bool)

(assert (=> b!1424042 (=> (not res!959474) (not e!804839))))

(assert (=> b!1424042 (= res!959474 (validKeyInArray!0 (select (arr!46904 a!2831) i!982)))))

(declare-fun res!959479 () Bool)

(assert (=> start!122808 (=> (not res!959479) (not e!804839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122808 (= res!959479 (validMask!0 mask!2608))))

(assert (=> start!122808 e!804839))

(assert (=> start!122808 true))

(declare-fun array_inv!35932 (array!97173) Bool)

(assert (=> start!122808 (array_inv!35932 a!2831)))

(declare-fun b!1424033 () Bool)

(assert (=> b!1424033 (= e!804839 e!804837)))

(declare-fun res!959465 () Bool)

(assert (=> b!1424033 (=> (not res!959465) (not e!804837))))

(declare-fun lt!627373 () SeekEntryResult!11189)

(assert (=> b!1424033 (= res!959465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46904 a!2831) j!81) mask!2608) (select (arr!46904 a!2831) j!81) a!2831 mask!2608) lt!627373))))

(assert (=> b!1424033 (= lt!627373 (Intermediate!11189 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424043 () Bool)

(declare-fun e!804841 () Bool)

(assert (=> b!1424043 (= e!804841 e!804842)))

(declare-fun res!959468 () Bool)

(assert (=> b!1424043 (=> res!959468 e!804842)))

(assert (=> b!1424043 (= res!959468 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627374 #b00000000000000000000000000000000) (bvsge lt!627374 (size!47454 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424043 (= lt!627374 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424044 () Bool)

(declare-fun res!959467 () Bool)

(assert (=> b!1424044 (=> res!959467 e!804842)))

(assert (=> b!1424044 (= res!959467 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627374 (select (arr!46904 a!2831) j!81) a!2831 mask!2608) lt!627373)))))

(declare-fun b!1424045 () Bool)

(assert (=> b!1424045 (= e!804836 (not e!804841))))

(declare-fun res!959473 () Bool)

(assert (=> b!1424045 (=> res!959473 e!804841)))

(assert (=> b!1424045 (= res!959473 (or (= (select (arr!46904 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46904 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46904 a!2831) index!585) (select (arr!46904 a!2831) j!81)) (= (select (store (arr!46904 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424045 e!804840))

(declare-fun res!959475 () Bool)

(assert (=> b!1424045 (=> (not res!959475) (not e!804840))))

(assert (=> b!1424045 (= res!959475 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48214 0))(
  ( (Unit!48215) )
))
(declare-fun lt!627376 () Unit!48214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48214)

(assert (=> b!1424045 (= lt!627376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424046 () Bool)

(declare-fun res!959476 () Bool)

(assert (=> b!1424046 (=> (not res!959476) (not e!804836))))

(assert (=> b!1424046 (= res!959476 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46904 a!2831) j!81) a!2831 mask!2608) lt!627373))))

(assert (= (and start!122808 res!959479) b!1424040))

(assert (= (and b!1424040 res!959464) b!1424042))

(assert (= (and b!1424042 res!959474) b!1424041))

(assert (= (and b!1424041 res!959469) b!1424036))

(assert (= (and b!1424036 res!959478) b!1424038))

(assert (= (and b!1424038 res!959472) b!1424034))

(assert (= (and b!1424034 res!959470) b!1424033))

(assert (= (and b!1424033 res!959465) b!1424035))

(assert (= (and b!1424035 res!959466) b!1424046))

(assert (= (and b!1424046 res!959476) b!1424031))

(assert (= (and b!1424031 res!959471) b!1424039))

(assert (= (and b!1424039 res!959477) b!1424045))

(assert (= (and b!1424045 res!959475) b!1424037))

(assert (= (and b!1424045 (not res!959473)) b!1424043))

(assert (= (and b!1424043 (not res!959468)) b!1424044))

(assert (= (and b!1424044 (not res!959467)) b!1424032))

(declare-fun m!1314579 () Bool)

(assert (=> b!1424044 m!1314579))

(assert (=> b!1424044 m!1314579))

(declare-fun m!1314581 () Bool)

(assert (=> b!1424044 m!1314581))

(assert (=> b!1424041 m!1314579))

(assert (=> b!1424041 m!1314579))

(declare-fun m!1314583 () Bool)

(assert (=> b!1424041 m!1314583))

(declare-fun m!1314585 () Bool)

(assert (=> start!122808 m!1314585))

(declare-fun m!1314587 () Bool)

(assert (=> start!122808 m!1314587))

(assert (=> b!1424033 m!1314579))

(assert (=> b!1424033 m!1314579))

(declare-fun m!1314589 () Bool)

(assert (=> b!1424033 m!1314589))

(assert (=> b!1424033 m!1314589))

(assert (=> b!1424033 m!1314579))

(declare-fun m!1314591 () Bool)

(assert (=> b!1424033 m!1314591))

(declare-fun m!1314593 () Bool)

(assert (=> b!1424043 m!1314593))

(declare-fun m!1314595 () Bool)

(assert (=> b!1424031 m!1314595))

(declare-fun m!1314597 () Bool)

(assert (=> b!1424038 m!1314597))

(declare-fun m!1314599 () Bool)

(assert (=> b!1424042 m!1314599))

(assert (=> b!1424042 m!1314599))

(declare-fun m!1314601 () Bool)

(assert (=> b!1424042 m!1314601))

(declare-fun m!1314603 () Bool)

(assert (=> b!1424032 m!1314603))

(declare-fun m!1314605 () Bool)

(assert (=> b!1424035 m!1314605))

(assert (=> b!1424035 m!1314605))

(declare-fun m!1314607 () Bool)

(assert (=> b!1424035 m!1314607))

(declare-fun m!1314609 () Bool)

(assert (=> b!1424035 m!1314609))

(declare-fun m!1314611 () Bool)

(assert (=> b!1424035 m!1314611))

(assert (=> b!1424037 m!1314579))

(assert (=> b!1424037 m!1314579))

(declare-fun m!1314613 () Bool)

(assert (=> b!1424037 m!1314613))

(assert (=> b!1424045 m!1314609))

(declare-fun m!1314615 () Bool)

(assert (=> b!1424045 m!1314615))

(declare-fun m!1314617 () Bool)

(assert (=> b!1424045 m!1314617))

(declare-fun m!1314619 () Bool)

(assert (=> b!1424045 m!1314619))

(assert (=> b!1424045 m!1314579))

(declare-fun m!1314621 () Bool)

(assert (=> b!1424045 m!1314621))

(declare-fun m!1314623 () Bool)

(assert (=> b!1424036 m!1314623))

(assert (=> b!1424046 m!1314579))

(assert (=> b!1424046 m!1314579))

(declare-fun m!1314625 () Bool)

(assert (=> b!1424046 m!1314625))

(push 1)

