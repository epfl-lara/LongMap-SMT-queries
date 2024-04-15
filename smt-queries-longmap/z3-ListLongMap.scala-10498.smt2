; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123548 () Bool)

(assert start!123548)

(declare-fun b!1432529 () Bool)

(declare-fun res!966504 () Bool)

(declare-fun e!808618 () Bool)

(assert (=> b!1432529 (=> (not res!966504) (not e!808618))))

(declare-datatypes ((array!97485 0))(
  ( (array!97486 (arr!47050 (Array (_ BitVec 32) (_ BitVec 64))) (size!47602 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97485)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432529 (= res!966504 (validKeyInArray!0 (select (arr!47050 a!2831) j!81)))))

(declare-fun b!1432530 () Bool)

(declare-fun res!966501 () Bool)

(assert (=> b!1432530 (=> (not res!966501) (not e!808618))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1432530 (= res!966501 (and (= (size!47602 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47602 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47602 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432531 () Bool)

(declare-fun res!966508 () Bool)

(assert (=> b!1432531 (=> (not res!966508) (not e!808618))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432531 (= res!966508 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47602 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47602 a!2831))))))

(declare-fun b!1432532 () Bool)

(declare-fun e!808620 () Bool)

(assert (=> b!1432532 (= e!808618 e!808620)))

(declare-fun res!966505 () Bool)

(assert (=> b!1432532 (=> (not res!966505) (not e!808620))))

(declare-datatypes ((SeekEntryResult!11356 0))(
  ( (MissingZero!11356 (index!47816 (_ BitVec 32))) (Found!11356 (index!47817 (_ BitVec 32))) (Intermediate!11356 (undefined!12168 Bool) (index!47818 (_ BitVec 32)) (x!129449 (_ BitVec 32))) (Undefined!11356) (MissingVacant!11356 (index!47819 (_ BitVec 32))) )
))
(declare-fun lt!630483 () SeekEntryResult!11356)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97485 (_ BitVec 32)) SeekEntryResult!11356)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432532 (= res!966505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47050 a!2831) j!81) mask!2608) (select (arr!47050 a!2831) j!81) a!2831 mask!2608) lt!630483))))

(assert (=> b!1432532 (= lt!630483 (Intermediate!11356 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432533 () Bool)

(declare-fun res!966500 () Bool)

(declare-fun e!808615 () Bool)

(assert (=> b!1432533 (=> (not res!966500) (not e!808615))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432533 (= res!966500 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432534 () Bool)

(declare-fun e!808617 () Bool)

(assert (=> b!1432534 (= e!808615 (not e!808617))))

(declare-fun res!966502 () Bool)

(assert (=> b!1432534 (=> res!966502 e!808617)))

(assert (=> b!1432534 (= res!966502 (or (= (select (arr!47050 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47050 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47050 a!2831) index!585) (select (arr!47050 a!2831) j!81)) (= (select (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808619 () Bool)

(assert (=> b!1432534 e!808619))

(declare-fun res!966507 () Bool)

(assert (=> b!1432534 (=> (not res!966507) (not e!808619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97485 (_ BitVec 32)) Bool)

(assert (=> b!1432534 (= res!966507 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48297 0))(
  ( (Unit!48298) )
))
(declare-fun lt!630479 () Unit!48297)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48297)

(assert (=> b!1432534 (= lt!630479 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432535 () Bool)

(assert (=> b!1432535 (= e!808620 e!808615)))

(declare-fun res!966498 () Bool)

(assert (=> b!1432535 (=> (not res!966498) (not e!808615))))

(declare-fun lt!630478 () (_ BitVec 64))

(declare-fun lt!630482 () SeekEntryResult!11356)

(declare-fun lt!630481 () array!97485)

(assert (=> b!1432535 (= res!966498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630478 mask!2608) lt!630478 lt!630481 mask!2608) lt!630482))))

(assert (=> b!1432535 (= lt!630482 (Intermediate!11356 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432535 (= lt!630478 (select (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432535 (= lt!630481 (array!97486 (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47602 a!2831)))))

(declare-fun b!1432537 () Bool)

(declare-fun res!966511 () Bool)

(assert (=> b!1432537 (=> (not res!966511) (not e!808618))))

(declare-datatypes ((List!33638 0))(
  ( (Nil!33635) (Cons!33634 (h!34957 (_ BitVec 64)) (t!48324 List!33638)) )
))
(declare-fun arrayNoDuplicates!0 (array!97485 (_ BitVec 32) List!33638) Bool)

(assert (=> b!1432537 (= res!966511 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33635))))

(declare-fun b!1432538 () Bool)

(assert (=> b!1432538 (= e!808617 true)))

(declare-fun lt!630480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432538 (= lt!630480 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432539 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97485 (_ BitVec 32)) SeekEntryResult!11356)

(assert (=> b!1432539 (= e!808619 (= (seekEntryOrOpen!0 (select (arr!47050 a!2831) j!81) a!2831 mask!2608) (Found!11356 j!81)))))

(declare-fun b!1432540 () Bool)

(declare-fun res!966506 () Bool)

(assert (=> b!1432540 (=> (not res!966506) (not e!808618))))

(assert (=> b!1432540 (= res!966506 (validKeyInArray!0 (select (arr!47050 a!2831) i!982)))))

(declare-fun b!1432541 () Bool)

(declare-fun res!966509 () Bool)

(assert (=> b!1432541 (=> (not res!966509) (not e!808615))))

(assert (=> b!1432541 (= res!966509 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630478 lt!630481 mask!2608) lt!630482))))

(declare-fun b!1432542 () Bool)

(declare-fun res!966503 () Bool)

(assert (=> b!1432542 (=> (not res!966503) (not e!808615))))

(assert (=> b!1432542 (= res!966503 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47050 a!2831) j!81) a!2831 mask!2608) lt!630483))))

(declare-fun b!1432536 () Bool)

(declare-fun res!966499 () Bool)

(assert (=> b!1432536 (=> (not res!966499) (not e!808618))))

(assert (=> b!1432536 (= res!966499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!966510 () Bool)

(assert (=> start!123548 (=> (not res!966510) (not e!808618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123548 (= res!966510 (validMask!0 mask!2608))))

(assert (=> start!123548 e!808618))

(assert (=> start!123548 true))

(declare-fun array_inv!36283 (array!97485) Bool)

(assert (=> start!123548 (array_inv!36283 a!2831)))

(assert (= (and start!123548 res!966510) b!1432530))

(assert (= (and b!1432530 res!966501) b!1432540))

(assert (= (and b!1432540 res!966506) b!1432529))

(assert (= (and b!1432529 res!966504) b!1432536))

(assert (= (and b!1432536 res!966499) b!1432537))

(assert (= (and b!1432537 res!966511) b!1432531))

(assert (= (and b!1432531 res!966508) b!1432532))

(assert (= (and b!1432532 res!966505) b!1432535))

(assert (= (and b!1432535 res!966498) b!1432542))

(assert (= (and b!1432542 res!966503) b!1432541))

(assert (= (and b!1432541 res!966509) b!1432533))

(assert (= (and b!1432533 res!966500) b!1432534))

(assert (= (and b!1432534 res!966507) b!1432539))

(assert (= (and b!1432534 (not res!966502)) b!1432538))

(declare-fun m!1321865 () Bool)

(assert (=> b!1432529 m!1321865))

(assert (=> b!1432529 m!1321865))

(declare-fun m!1321867 () Bool)

(assert (=> b!1432529 m!1321867))

(declare-fun m!1321869 () Bool)

(assert (=> b!1432541 m!1321869))

(declare-fun m!1321871 () Bool)

(assert (=> b!1432536 m!1321871))

(declare-fun m!1321873 () Bool)

(assert (=> b!1432538 m!1321873))

(assert (=> b!1432532 m!1321865))

(assert (=> b!1432532 m!1321865))

(declare-fun m!1321875 () Bool)

(assert (=> b!1432532 m!1321875))

(assert (=> b!1432532 m!1321875))

(assert (=> b!1432532 m!1321865))

(declare-fun m!1321877 () Bool)

(assert (=> b!1432532 m!1321877))

(declare-fun m!1321879 () Bool)

(assert (=> b!1432534 m!1321879))

(declare-fun m!1321881 () Bool)

(assert (=> b!1432534 m!1321881))

(declare-fun m!1321883 () Bool)

(assert (=> b!1432534 m!1321883))

(declare-fun m!1321885 () Bool)

(assert (=> b!1432534 m!1321885))

(assert (=> b!1432534 m!1321865))

(declare-fun m!1321887 () Bool)

(assert (=> b!1432534 m!1321887))

(declare-fun m!1321889 () Bool)

(assert (=> b!1432535 m!1321889))

(assert (=> b!1432535 m!1321889))

(declare-fun m!1321891 () Bool)

(assert (=> b!1432535 m!1321891))

(assert (=> b!1432535 m!1321879))

(declare-fun m!1321893 () Bool)

(assert (=> b!1432535 m!1321893))

(assert (=> b!1432539 m!1321865))

(assert (=> b!1432539 m!1321865))

(declare-fun m!1321895 () Bool)

(assert (=> b!1432539 m!1321895))

(declare-fun m!1321897 () Bool)

(assert (=> b!1432537 m!1321897))

(declare-fun m!1321899 () Bool)

(assert (=> b!1432540 m!1321899))

(assert (=> b!1432540 m!1321899))

(declare-fun m!1321901 () Bool)

(assert (=> b!1432540 m!1321901))

(assert (=> b!1432542 m!1321865))

(assert (=> b!1432542 m!1321865))

(declare-fun m!1321903 () Bool)

(assert (=> b!1432542 m!1321903))

(declare-fun m!1321905 () Bool)

(assert (=> start!123548 m!1321905))

(declare-fun m!1321907 () Bool)

(assert (=> start!123548 m!1321907))

(check-sat (not b!1432529) (not b!1432532) (not start!123548) (not b!1432540) (not b!1432537) (not b!1432538) (not b!1432534) (not b!1432536) (not b!1432541) (not b!1432539) (not b!1432535) (not b!1432542))
(check-sat)
