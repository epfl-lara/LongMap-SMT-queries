; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123236 () Bool)

(assert start!123236)

(declare-fun b!1428861 () Bool)

(declare-fun res!963541 () Bool)

(declare-fun e!806908 () Bool)

(assert (=> b!1428861 (=> (not res!963541) (not e!806908))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428861 (= res!963541 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428862 () Bool)

(declare-fun res!963548 () Bool)

(declare-fun e!806912 () Bool)

(assert (=> b!1428862 (=> (not res!963548) (not e!806912))))

(declare-datatypes ((array!97350 0))(
  ( (array!97351 (arr!46987 (Array (_ BitVec 32) (_ BitVec 64))) (size!47539 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97350)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428862 (= res!963548 (validKeyInArray!0 (select (arr!46987 a!2831) i!982)))))

(declare-fun b!1428863 () Bool)

(declare-fun e!806909 () Bool)

(assert (=> b!1428863 (= e!806912 e!806909)))

(declare-fun res!963545 () Bool)

(assert (=> b!1428863 (=> (not res!963545) (not e!806909))))

(declare-datatypes ((SeekEntryResult!11293 0))(
  ( (MissingZero!11293 (index!47564 (_ BitVec 32))) (Found!11293 (index!47565 (_ BitVec 32))) (Intermediate!11293 (undefined!12105 Bool) (index!47566 (_ BitVec 32)) (x!129196 (_ BitVec 32))) (Undefined!11293) (MissingVacant!11293 (index!47567 (_ BitVec 32))) )
))
(declare-fun lt!628988 () SeekEntryResult!11293)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97350 (_ BitVec 32)) SeekEntryResult!11293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428863 (= res!963545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46987 a!2831) j!81) mask!2608) (select (arr!46987 a!2831) j!81) a!2831 mask!2608) lt!628988))))

(assert (=> b!1428863 (= lt!628988 (Intermediate!11293 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428864 () Bool)

(declare-fun res!963544 () Bool)

(assert (=> b!1428864 (=> (not res!963544) (not e!806908))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428864 (= res!963544 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46987 a!2831) j!81) a!2831 mask!2608) lt!628988))))

(declare-fun b!1428865 () Bool)

(declare-fun res!963551 () Bool)

(assert (=> b!1428865 (=> (not res!963551) (not e!806912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97350 (_ BitVec 32)) Bool)

(assert (=> b!1428865 (= res!963551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!963550 () Bool)

(assert (=> start!123236 (=> (not res!963550) (not e!806912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123236 (= res!963550 (validMask!0 mask!2608))))

(assert (=> start!123236 e!806912))

(assert (=> start!123236 true))

(declare-fun array_inv!36220 (array!97350) Bool)

(assert (=> start!123236 (array_inv!36220 a!2831)))

(declare-fun b!1428866 () Bool)

(declare-fun res!963553 () Bool)

(assert (=> b!1428866 (=> (not res!963553) (not e!806912))))

(declare-datatypes ((List!33575 0))(
  ( (Nil!33572) (Cons!33571 (h!34885 (_ BitVec 64)) (t!48261 List!33575)) )
))
(declare-fun arrayNoDuplicates!0 (array!97350 (_ BitVec 32) List!33575) Bool)

(assert (=> b!1428866 (= res!963553 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33572))))

(declare-fun b!1428867 () Bool)

(assert (=> b!1428867 (= e!806908 (not true))))

(declare-fun e!806911 () Bool)

(assert (=> b!1428867 e!806911))

(declare-fun res!963552 () Bool)

(assert (=> b!1428867 (=> (not res!963552) (not e!806911))))

(assert (=> b!1428867 (= res!963552 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48171 0))(
  ( (Unit!48172) )
))
(declare-fun lt!628987 () Unit!48171)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48171)

(assert (=> b!1428867 (= lt!628987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428868 () Bool)

(declare-fun res!963543 () Bool)

(assert (=> b!1428868 (=> (not res!963543) (not e!806912))))

(assert (=> b!1428868 (= res!963543 (validKeyInArray!0 (select (arr!46987 a!2831) j!81)))))

(declare-fun b!1428869 () Bool)

(assert (=> b!1428869 (= e!806909 e!806908)))

(declare-fun res!963549 () Bool)

(assert (=> b!1428869 (=> (not res!963549) (not e!806908))))

(declare-fun lt!628985 () SeekEntryResult!11293)

(declare-fun lt!628984 () array!97350)

(declare-fun lt!628986 () (_ BitVec 64))

(assert (=> b!1428869 (= res!963549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628986 mask!2608) lt!628986 lt!628984 mask!2608) lt!628985))))

(assert (=> b!1428869 (= lt!628985 (Intermediate!11293 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428869 (= lt!628986 (select (store (arr!46987 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428869 (= lt!628984 (array!97351 (store (arr!46987 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47539 a!2831)))))

(declare-fun b!1428870 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97350 (_ BitVec 32)) SeekEntryResult!11293)

(assert (=> b!1428870 (= e!806911 (= (seekEntryOrOpen!0 (select (arr!46987 a!2831) j!81) a!2831 mask!2608) (Found!11293 j!81)))))

(declare-fun b!1428871 () Bool)

(declare-fun res!963542 () Bool)

(assert (=> b!1428871 (=> (not res!963542) (not e!806912))))

(assert (=> b!1428871 (= res!963542 (and (= (size!47539 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47539 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47539 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428872 () Bool)

(declare-fun res!963547 () Bool)

(assert (=> b!1428872 (=> (not res!963547) (not e!806908))))

(assert (=> b!1428872 (= res!963547 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628986 lt!628984 mask!2608) lt!628985))))

(declare-fun b!1428873 () Bool)

(declare-fun res!963546 () Bool)

(assert (=> b!1428873 (=> (not res!963546) (not e!806912))))

(assert (=> b!1428873 (= res!963546 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47539 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47539 a!2831))))))

(assert (= (and start!123236 res!963550) b!1428871))

(assert (= (and b!1428871 res!963542) b!1428862))

(assert (= (and b!1428862 res!963548) b!1428868))

(assert (= (and b!1428868 res!963543) b!1428865))

(assert (= (and b!1428865 res!963551) b!1428866))

(assert (= (and b!1428866 res!963553) b!1428873))

(assert (= (and b!1428873 res!963546) b!1428863))

(assert (= (and b!1428863 res!963545) b!1428869))

(assert (= (and b!1428869 res!963549) b!1428864))

(assert (= (and b!1428864 res!963544) b!1428872))

(assert (= (and b!1428872 res!963547) b!1428861))

(assert (= (and b!1428861 res!963541) b!1428867))

(assert (= (and b!1428867 res!963552) b!1428870))

(declare-fun m!1318503 () Bool)

(assert (=> b!1428870 m!1318503))

(assert (=> b!1428870 m!1318503))

(declare-fun m!1318505 () Bool)

(assert (=> b!1428870 m!1318505))

(declare-fun m!1318507 () Bool)

(assert (=> b!1428867 m!1318507))

(declare-fun m!1318509 () Bool)

(assert (=> b!1428867 m!1318509))

(assert (=> b!1428864 m!1318503))

(assert (=> b!1428864 m!1318503))

(declare-fun m!1318511 () Bool)

(assert (=> b!1428864 m!1318511))

(declare-fun m!1318513 () Bool)

(assert (=> b!1428866 m!1318513))

(declare-fun m!1318515 () Bool)

(assert (=> b!1428862 m!1318515))

(assert (=> b!1428862 m!1318515))

(declare-fun m!1318517 () Bool)

(assert (=> b!1428862 m!1318517))

(assert (=> b!1428868 m!1318503))

(assert (=> b!1428868 m!1318503))

(declare-fun m!1318519 () Bool)

(assert (=> b!1428868 m!1318519))

(declare-fun m!1318521 () Bool)

(assert (=> b!1428869 m!1318521))

(assert (=> b!1428869 m!1318521))

(declare-fun m!1318523 () Bool)

(assert (=> b!1428869 m!1318523))

(declare-fun m!1318525 () Bool)

(assert (=> b!1428869 m!1318525))

(declare-fun m!1318527 () Bool)

(assert (=> b!1428869 m!1318527))

(declare-fun m!1318529 () Bool)

(assert (=> b!1428872 m!1318529))

(declare-fun m!1318531 () Bool)

(assert (=> start!123236 m!1318531))

(declare-fun m!1318533 () Bool)

(assert (=> start!123236 m!1318533))

(assert (=> b!1428863 m!1318503))

(assert (=> b!1428863 m!1318503))

(declare-fun m!1318535 () Bool)

(assert (=> b!1428863 m!1318535))

(assert (=> b!1428863 m!1318535))

(assert (=> b!1428863 m!1318503))

(declare-fun m!1318537 () Bool)

(assert (=> b!1428863 m!1318537))

(declare-fun m!1318539 () Bool)

(assert (=> b!1428865 m!1318539))

(check-sat (not b!1428862) (not b!1428866) (not start!123236) (not b!1428863) (not b!1428867) (not b!1428869) (not b!1428870) (not b!1428868) (not b!1428872) (not b!1428865) (not b!1428864))
(check-sat)
