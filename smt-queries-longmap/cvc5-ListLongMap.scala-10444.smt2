; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122826 () Bool)

(assert start!122826)

(declare-fun b!1424463 () Bool)

(declare-fun res!959899 () Bool)

(declare-fun e!805026 () Bool)

(assert (=> b!1424463 (=> (not res!959899) (not e!805026))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97191 0))(
  ( (array!97192 (arr!46913 (Array (_ BitVec 32) (_ BitVec 64))) (size!47463 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97191)

(declare-datatypes ((SeekEntryResult!11198 0))(
  ( (MissingZero!11198 (index!47184 (_ BitVec 32))) (Found!11198 (index!47185 (_ BitVec 32))) (Intermediate!11198 (undefined!12010 Bool) (index!47186 (_ BitVec 32)) (x!128816 (_ BitVec 32))) (Undefined!11198) (MissingVacant!11198 (index!47187 (_ BitVec 32))) )
))
(declare-fun lt!627565 () SeekEntryResult!11198)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97191 (_ BitVec 32)) SeekEntryResult!11198)

(assert (=> b!1424463 (= res!959899 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46913 a!2831) j!81) a!2831 mask!2608) lt!627565))))

(declare-fun b!1424464 () Bool)

(declare-fun res!959911 () Bool)

(declare-fun e!805029 () Bool)

(assert (=> b!1424464 (=> (not res!959911) (not e!805029))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424464 (= res!959911 (validKeyInArray!0 (select (arr!46913 a!2831) i!982)))))

(declare-fun b!1424465 () Bool)

(declare-fun res!959898 () Bool)

(assert (=> b!1424465 (=> (not res!959898) (not e!805029))))

(assert (=> b!1424465 (= res!959898 (validKeyInArray!0 (select (arr!46913 a!2831) j!81)))))

(declare-fun b!1424466 () Bool)

(declare-fun res!959906 () Bool)

(assert (=> b!1424466 (=> (not res!959906) (not e!805026))))

(declare-fun lt!627563 () SeekEntryResult!11198)

(declare-fun lt!627562 () array!97191)

(declare-fun lt!627564 () (_ BitVec 64))

(assert (=> b!1424466 (= res!959906 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627564 lt!627562 mask!2608) lt!627563))))

(declare-fun b!1424467 () Bool)

(declare-fun e!805025 () Bool)

(assert (=> b!1424467 (= e!805025 e!805026)))

(declare-fun res!959910 () Bool)

(assert (=> b!1424467 (=> (not res!959910) (not e!805026))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424467 (= res!959910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627564 mask!2608) lt!627564 lt!627562 mask!2608) lt!627563))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424467 (= lt!627563 (Intermediate!11198 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424467 (= lt!627564 (select (store (arr!46913 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424467 (= lt!627562 (array!97192 (store (arr!46913 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47463 a!2831)))))

(declare-fun b!1424468 () Bool)

(declare-fun res!959908 () Bool)

(assert (=> b!1424468 (=> (not res!959908) (not e!805029))))

(declare-datatypes ((List!33423 0))(
  ( (Nil!33420) (Cons!33419 (h!34721 (_ BitVec 64)) (t!48117 List!33423)) )
))
(declare-fun arrayNoDuplicates!0 (array!97191 (_ BitVec 32) List!33423) Bool)

(assert (=> b!1424468 (= res!959908 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33420))))

(declare-fun b!1424469 () Bool)

(declare-fun res!959905 () Bool)

(assert (=> b!1424469 (=> (not res!959905) (not e!805029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97191 (_ BitVec 32)) Bool)

(assert (=> b!1424469 (= res!959905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424470 () Bool)

(declare-fun res!959907 () Bool)

(assert (=> b!1424470 (=> (not res!959907) (not e!805029))))

(assert (=> b!1424470 (= res!959907 (and (= (size!47463 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47463 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47463 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424471 () Bool)

(declare-fun e!805028 () Bool)

(assert (=> b!1424471 (= e!805028 true)))

(declare-fun lt!627561 () (_ BitVec 32))

(declare-fun lt!627567 () SeekEntryResult!11198)

(assert (=> b!1424471 (= lt!627567 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627561 lt!627564 lt!627562 mask!2608))))

(declare-fun b!1424472 () Bool)

(declare-fun res!959901 () Bool)

(assert (=> b!1424472 (=> (not res!959901) (not e!805026))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1424472 (= res!959901 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424473 () Bool)

(declare-fun res!959904 () Bool)

(assert (=> b!1424473 (=> (not res!959904) (not e!805029))))

(assert (=> b!1424473 (= res!959904 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47463 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47463 a!2831))))))

(declare-fun b!1424474 () Bool)

(declare-fun e!805031 () Bool)

(assert (=> b!1424474 (= e!805026 (not e!805031))))

(declare-fun res!959903 () Bool)

(assert (=> b!1424474 (=> res!959903 e!805031)))

(assert (=> b!1424474 (= res!959903 (or (= (select (arr!46913 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46913 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46913 a!2831) index!585) (select (arr!46913 a!2831) j!81)) (= (select (store (arr!46913 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805030 () Bool)

(assert (=> b!1424474 e!805030))

(declare-fun res!959900 () Bool)

(assert (=> b!1424474 (=> (not res!959900) (not e!805030))))

(assert (=> b!1424474 (= res!959900 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48232 0))(
  ( (Unit!48233) )
))
(declare-fun lt!627566 () Unit!48232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48232)

(assert (=> b!1424474 (= lt!627566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424475 () Bool)

(assert (=> b!1424475 (= e!805029 e!805025)))

(declare-fun res!959902 () Bool)

(assert (=> b!1424475 (=> (not res!959902) (not e!805025))))

(assert (=> b!1424475 (= res!959902 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46913 a!2831) j!81) mask!2608) (select (arr!46913 a!2831) j!81) a!2831 mask!2608) lt!627565))))

(assert (=> b!1424475 (= lt!627565 (Intermediate!11198 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424476 () Bool)

(declare-fun res!959909 () Bool)

(assert (=> b!1424476 (=> res!959909 e!805028)))

(assert (=> b!1424476 (= res!959909 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627561 (select (arr!46913 a!2831) j!81) a!2831 mask!2608) lt!627565)))))

(declare-fun res!959897 () Bool)

(assert (=> start!122826 (=> (not res!959897) (not e!805029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122826 (= res!959897 (validMask!0 mask!2608))))

(assert (=> start!122826 e!805029))

(assert (=> start!122826 true))

(declare-fun array_inv!35941 (array!97191) Bool)

(assert (=> start!122826 (array_inv!35941 a!2831)))

(declare-fun b!1424477 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97191 (_ BitVec 32)) SeekEntryResult!11198)

(assert (=> b!1424477 (= e!805030 (= (seekEntryOrOpen!0 (select (arr!46913 a!2831) j!81) a!2831 mask!2608) (Found!11198 j!81)))))

(declare-fun b!1424478 () Bool)

(assert (=> b!1424478 (= e!805031 e!805028)))

(declare-fun res!959896 () Bool)

(assert (=> b!1424478 (=> res!959896 e!805028)))

(assert (=> b!1424478 (= res!959896 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627561 #b00000000000000000000000000000000) (bvsge lt!627561 (size!47463 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424478 (= lt!627561 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122826 res!959897) b!1424470))

(assert (= (and b!1424470 res!959907) b!1424464))

(assert (= (and b!1424464 res!959911) b!1424465))

(assert (= (and b!1424465 res!959898) b!1424469))

(assert (= (and b!1424469 res!959905) b!1424468))

(assert (= (and b!1424468 res!959908) b!1424473))

(assert (= (and b!1424473 res!959904) b!1424475))

(assert (= (and b!1424475 res!959902) b!1424467))

(assert (= (and b!1424467 res!959910) b!1424463))

(assert (= (and b!1424463 res!959899) b!1424466))

(assert (= (and b!1424466 res!959906) b!1424472))

(assert (= (and b!1424472 res!959901) b!1424474))

(assert (= (and b!1424474 res!959900) b!1424477))

(assert (= (and b!1424474 (not res!959903)) b!1424478))

(assert (= (and b!1424478 (not res!959896)) b!1424476))

(assert (= (and b!1424476 (not res!959909)) b!1424471))

(declare-fun m!1315011 () Bool)

(assert (=> start!122826 m!1315011))

(declare-fun m!1315013 () Bool)

(assert (=> start!122826 m!1315013))

(declare-fun m!1315015 () Bool)

(assert (=> b!1424475 m!1315015))

(assert (=> b!1424475 m!1315015))

(declare-fun m!1315017 () Bool)

(assert (=> b!1424475 m!1315017))

(assert (=> b!1424475 m!1315017))

(assert (=> b!1424475 m!1315015))

(declare-fun m!1315019 () Bool)

(assert (=> b!1424475 m!1315019))

(assert (=> b!1424477 m!1315015))

(assert (=> b!1424477 m!1315015))

(declare-fun m!1315021 () Bool)

(assert (=> b!1424477 m!1315021))

(declare-fun m!1315023 () Bool)

(assert (=> b!1424474 m!1315023))

(declare-fun m!1315025 () Bool)

(assert (=> b!1424474 m!1315025))

(declare-fun m!1315027 () Bool)

(assert (=> b!1424474 m!1315027))

(declare-fun m!1315029 () Bool)

(assert (=> b!1424474 m!1315029))

(assert (=> b!1424474 m!1315015))

(declare-fun m!1315031 () Bool)

(assert (=> b!1424474 m!1315031))

(declare-fun m!1315033 () Bool)

(assert (=> b!1424469 m!1315033))

(declare-fun m!1315035 () Bool)

(assert (=> b!1424464 m!1315035))

(assert (=> b!1424464 m!1315035))

(declare-fun m!1315037 () Bool)

(assert (=> b!1424464 m!1315037))

(declare-fun m!1315039 () Bool)

(assert (=> b!1424468 m!1315039))

(assert (=> b!1424476 m!1315015))

(assert (=> b!1424476 m!1315015))

(declare-fun m!1315041 () Bool)

(assert (=> b!1424476 m!1315041))

(declare-fun m!1315043 () Bool)

(assert (=> b!1424466 m!1315043))

(assert (=> b!1424465 m!1315015))

(assert (=> b!1424465 m!1315015))

(declare-fun m!1315045 () Bool)

(assert (=> b!1424465 m!1315045))

(assert (=> b!1424463 m!1315015))

(assert (=> b!1424463 m!1315015))

(declare-fun m!1315047 () Bool)

(assert (=> b!1424463 m!1315047))

(declare-fun m!1315049 () Bool)

(assert (=> b!1424471 m!1315049))

(declare-fun m!1315051 () Bool)

(assert (=> b!1424467 m!1315051))

(assert (=> b!1424467 m!1315051))

(declare-fun m!1315053 () Bool)

(assert (=> b!1424467 m!1315053))

(assert (=> b!1424467 m!1315023))

(declare-fun m!1315055 () Bool)

(assert (=> b!1424467 m!1315055))

(declare-fun m!1315057 () Bool)

(assert (=> b!1424478 m!1315057))

(push 1)

