; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122670 () Bool)

(assert start!122670)

(declare-fun b!1421013 () Bool)

(declare-fun e!803588 () Bool)

(declare-fun e!803590 () Bool)

(assert (=> b!1421013 (= e!803588 e!803590)))

(declare-fun res!956446 () Bool)

(assert (=> b!1421013 (=> (not res!956446) (not e!803590))))

(declare-datatypes ((array!97035 0))(
  ( (array!97036 (arr!46835 (Array (_ BitVec 32) (_ BitVec 64))) (size!47385 (_ BitVec 32))) )
))
(declare-fun lt!626088 () array!97035)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!626091 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11120 0))(
  ( (MissingZero!11120 (index!46872 (_ BitVec 32))) (Found!11120 (index!46873 (_ BitVec 32))) (Intermediate!11120 (undefined!11932 Bool) (index!46874 (_ BitVec 32)) (x!128530 (_ BitVec 32))) (Undefined!11120) (MissingVacant!11120 (index!46875 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97035 (_ BitVec 32)) SeekEntryResult!11120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421013 (= res!956446 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626091 mask!2608) lt!626091 lt!626088 mask!2608) (Intermediate!11120 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97035)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421013 (= lt!626091 (select (store (arr!46835 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421013 (= lt!626088 (array!97036 (store (arr!46835 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47385 a!2831)))))

(declare-fun b!1421014 () Bool)

(declare-fun res!956454 () Bool)

(declare-fun e!803589 () Bool)

(assert (=> b!1421014 (=> (not res!956454) (not e!803589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421014 (= res!956454 (validKeyInArray!0 (select (arr!46835 a!2831) j!81)))))

(declare-fun res!956453 () Bool)

(assert (=> start!122670 (=> (not res!956453) (not e!803589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122670 (= res!956453 (validMask!0 mask!2608))))

(assert (=> start!122670 e!803589))

(assert (=> start!122670 true))

(declare-fun array_inv!35863 (array!97035) Bool)

(assert (=> start!122670 (array_inv!35863 a!2831)))

(declare-fun b!1421015 () Bool)

(declare-fun res!956452 () Bool)

(assert (=> b!1421015 (=> (not res!956452) (not e!803589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97035 (_ BitVec 32)) Bool)

(assert (=> b!1421015 (= res!956452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421016 () Bool)

(declare-fun res!956448 () Bool)

(assert (=> b!1421016 (=> (not res!956448) (not e!803589))))

(declare-datatypes ((List!33345 0))(
  ( (Nil!33342) (Cons!33341 (h!34643 (_ BitVec 64)) (t!48039 List!33345)) )
))
(declare-fun arrayNoDuplicates!0 (array!97035 (_ BitVec 32) List!33345) Bool)

(assert (=> b!1421016 (= res!956448 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33342))))

(declare-fun b!1421017 () Bool)

(assert (=> b!1421017 (= e!803589 e!803588)))

(declare-fun res!956451 () Bool)

(assert (=> b!1421017 (=> (not res!956451) (not e!803588))))

(declare-fun lt!626089 () SeekEntryResult!11120)

(assert (=> b!1421017 (= res!956451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46835 a!2831) j!81) mask!2608) (select (arr!46835 a!2831) j!81) a!2831 mask!2608) lt!626089))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421017 (= lt!626089 (Intermediate!11120 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421018 () Bool)

(declare-fun res!956447 () Bool)

(assert (=> b!1421018 (=> (not res!956447) (not e!803590))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421018 (= res!956447 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46835 a!2831) j!81) a!2831 mask!2608) lt!626089))))

(declare-fun b!1421019 () Bool)

(assert (=> b!1421019 (= e!803590 false)))

(declare-fun lt!626090 () SeekEntryResult!11120)

(assert (=> b!1421019 (= lt!626090 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626091 lt!626088 mask!2608))))

(declare-fun b!1421020 () Bool)

(declare-fun res!956450 () Bool)

(assert (=> b!1421020 (=> (not res!956450) (not e!803589))))

(assert (=> b!1421020 (= res!956450 (and (= (size!47385 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47385 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47385 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421021 () Bool)

(declare-fun res!956449 () Bool)

(assert (=> b!1421021 (=> (not res!956449) (not e!803589))))

(assert (=> b!1421021 (= res!956449 (validKeyInArray!0 (select (arr!46835 a!2831) i!982)))))

(declare-fun b!1421022 () Bool)

(declare-fun res!956455 () Bool)

(assert (=> b!1421022 (=> (not res!956455) (not e!803589))))

(assert (=> b!1421022 (= res!956455 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47385 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47385 a!2831))))))

(assert (= (and start!122670 res!956453) b!1421020))

(assert (= (and b!1421020 res!956450) b!1421021))

(assert (= (and b!1421021 res!956449) b!1421014))

(assert (= (and b!1421014 res!956454) b!1421015))

(assert (= (and b!1421015 res!956452) b!1421016))

(assert (= (and b!1421016 res!956448) b!1421022))

(assert (= (and b!1421022 res!956455) b!1421017))

(assert (= (and b!1421017 res!956451) b!1421013))

(assert (= (and b!1421013 res!956446) b!1421018))

(assert (= (and b!1421018 res!956447) b!1421019))

(declare-fun m!1311555 () Bool)

(assert (=> b!1421014 m!1311555))

(assert (=> b!1421014 m!1311555))

(declare-fun m!1311557 () Bool)

(assert (=> b!1421014 m!1311557))

(assert (=> b!1421017 m!1311555))

(assert (=> b!1421017 m!1311555))

(declare-fun m!1311559 () Bool)

(assert (=> b!1421017 m!1311559))

(assert (=> b!1421017 m!1311559))

(assert (=> b!1421017 m!1311555))

(declare-fun m!1311561 () Bool)

(assert (=> b!1421017 m!1311561))

(declare-fun m!1311563 () Bool)

(assert (=> start!122670 m!1311563))

(declare-fun m!1311565 () Bool)

(assert (=> start!122670 m!1311565))

(declare-fun m!1311567 () Bool)

(assert (=> b!1421016 m!1311567))

(declare-fun m!1311569 () Bool)

(assert (=> b!1421013 m!1311569))

(assert (=> b!1421013 m!1311569))

(declare-fun m!1311571 () Bool)

(assert (=> b!1421013 m!1311571))

(declare-fun m!1311573 () Bool)

(assert (=> b!1421013 m!1311573))

(declare-fun m!1311575 () Bool)

(assert (=> b!1421013 m!1311575))

(assert (=> b!1421018 m!1311555))

(assert (=> b!1421018 m!1311555))

(declare-fun m!1311577 () Bool)

(assert (=> b!1421018 m!1311577))

(declare-fun m!1311579 () Bool)

(assert (=> b!1421015 m!1311579))

(declare-fun m!1311581 () Bool)

(assert (=> b!1421019 m!1311581))

(declare-fun m!1311583 () Bool)

(assert (=> b!1421021 m!1311583))

(assert (=> b!1421021 m!1311583))

(declare-fun m!1311585 () Bool)

(assert (=> b!1421021 m!1311585))

(push 1)

