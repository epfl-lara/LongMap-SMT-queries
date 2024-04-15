; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123862 () Bool)

(assert start!123862)

(declare-fun b!1435487 () Bool)

(declare-fun e!810125 () Bool)

(declare-fun e!810128 () Bool)

(assert (=> b!1435487 (= e!810125 e!810128)))

(declare-fun res!968602 () Bool)

(assert (=> b!1435487 (=> (not res!968602) (not e!810128))))

(declare-datatypes ((SeekEntryResult!11393 0))(
  ( (MissingZero!11393 (index!47964 (_ BitVec 32))) (Found!11393 (index!47965 (_ BitVec 32))) (Intermediate!11393 (undefined!12205 Bool) (index!47966 (_ BitVec 32)) (x!129618 (_ BitVec 32))) (Undefined!11393) (MissingVacant!11393 (index!47967 (_ BitVec 32))) )
))
(declare-fun lt!631740 () SeekEntryResult!11393)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97571 0))(
  ( (array!97572 (arr!47087 (Array (_ BitVec 32) (_ BitVec 64))) (size!47639 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97571)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97571 (_ BitVec 32)) SeekEntryResult!11393)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435487 (= res!968602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47087 a!2831) j!81) mask!2608) (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631740))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1435487 (= lt!631740 (Intermediate!11393 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435488 () Bool)

(declare-fun e!810123 () Bool)

(declare-fun e!810124 () Bool)

(assert (=> b!1435488 (= e!810123 (not e!810124))))

(declare-fun res!968609 () Bool)

(assert (=> b!1435488 (=> res!968609 e!810124)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435488 (= res!968609 (or (= (select (arr!47087 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47087 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47087 a!2831) index!585) (select (arr!47087 a!2831) j!81)) (= (select (store (arr!47087 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810127 () Bool)

(assert (=> b!1435488 e!810127))

(declare-fun res!968610 () Bool)

(assert (=> b!1435488 (=> (not res!968610) (not e!810127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97571 (_ BitVec 32)) Bool)

(assert (=> b!1435488 (= res!968610 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48371 0))(
  ( (Unit!48372) )
))
(declare-fun lt!631746 () Unit!48371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48371)

(assert (=> b!1435488 (= lt!631746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435489 () Bool)

(declare-fun res!968606 () Bool)

(assert (=> b!1435489 (=> (not res!968606) (not e!810125))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1435489 (= res!968606 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47639 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47639 a!2831))))))

(declare-fun b!1435490 () Bool)

(declare-fun res!968601 () Bool)

(assert (=> b!1435490 (=> (not res!968601) (not e!810125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435490 (= res!968601 (validKeyInArray!0 (select (arr!47087 a!2831) j!81)))))

(declare-fun b!1435491 () Bool)

(declare-fun res!968598 () Bool)

(assert (=> b!1435491 (=> (not res!968598) (not e!810123))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435491 (= res!968598 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435492 () Bool)

(declare-fun e!810129 () Bool)

(assert (=> b!1435492 (= e!810129 true)))

(assert (=> b!1435492 (and (not undefinedAfter!5) (= intermediateAfterIndex!13 i!982) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))

(declare-fun lt!631745 () (_ BitVec 32))

(declare-fun lt!631744 () Unit!48371)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!97571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!48371)

(assert (=> b!1435492 (= lt!631744 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2831 i!982 j!81 (bvadd #b00000000000000000000000000000001 x!605) lt!631745 intermediateBeforeX!13 intermediateBeforeIndex!13 intermediateAfterX!13 intermediateAfterIndex!13 undefinedAfter!5 mask!2608))))

(declare-fun b!1435493 () Bool)

(declare-fun res!968607 () Bool)

(assert (=> b!1435493 (=> res!968607 e!810129)))

(assert (=> b!1435493 (= res!968607 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631745 (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631740)))))

(declare-fun b!1435494 () Bool)

(declare-fun res!968604 () Bool)

(assert (=> b!1435494 (=> (not res!968604) (not e!810125))))

(declare-datatypes ((List!33675 0))(
  ( (Nil!33672) (Cons!33671 (h!35006 (_ BitVec 64)) (t!48361 List!33675)) )
))
(declare-fun arrayNoDuplicates!0 (array!97571 (_ BitVec 32) List!33675) Bool)

(assert (=> b!1435494 (= res!968604 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33672))))

(declare-fun b!1435495 () Bool)

(declare-fun res!968612 () Bool)

(assert (=> b!1435495 (=> (not res!968612) (not e!810125))))

(assert (=> b!1435495 (= res!968612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435496 () Bool)

(declare-fun res!968608 () Bool)

(assert (=> b!1435496 (=> res!968608 e!810129)))

(declare-fun lt!631743 () SeekEntryResult!11393)

(declare-fun lt!631742 () (_ BitVec 64))

(declare-fun lt!631741 () array!97571)

(assert (=> b!1435496 (= res!968608 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631745 lt!631742 lt!631741 mask!2608) lt!631743)))))

(declare-fun b!1435498 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97571 (_ BitVec 32)) SeekEntryResult!11393)

(assert (=> b!1435498 (= e!810127 (= (seekEntryOrOpen!0 (select (arr!47087 a!2831) j!81) a!2831 mask!2608) (Found!11393 j!81)))))

(declare-fun b!1435499 () Bool)

(declare-fun res!968603 () Bool)

(assert (=> b!1435499 (=> (not res!968603) (not e!810125))))

(assert (=> b!1435499 (= res!968603 (and (= (size!47639 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47639 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47639 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435500 () Bool)

(declare-fun res!968611 () Bool)

(assert (=> b!1435500 (=> (not res!968611) (not e!810123))))

(assert (=> b!1435500 (= res!968611 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631742 lt!631741 mask!2608) lt!631743))))

(declare-fun b!1435501 () Bool)

(assert (=> b!1435501 (= e!810128 e!810123)))

(declare-fun res!968599 () Bool)

(assert (=> b!1435501 (=> (not res!968599) (not e!810123))))

(assert (=> b!1435501 (= res!968599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631742 mask!2608) lt!631742 lt!631741 mask!2608) lt!631743))))

(assert (=> b!1435501 (= lt!631743 (Intermediate!11393 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435501 (= lt!631742 (select (store (arr!47087 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435501 (= lt!631741 (array!97572 (store (arr!47087 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47639 a!2831)))))

(declare-fun b!1435502 () Bool)

(declare-fun res!968614 () Bool)

(assert (=> b!1435502 (=> (not res!968614) (not e!810125))))

(assert (=> b!1435502 (= res!968614 (validKeyInArray!0 (select (arr!47087 a!2831) i!982)))))

(declare-fun b!1435503 () Bool)

(declare-fun res!968613 () Bool)

(assert (=> b!1435503 (=> (not res!968613) (not e!810123))))

(assert (=> b!1435503 (= res!968613 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631740))))

(declare-fun b!1435497 () Bool)

(assert (=> b!1435497 (= e!810124 e!810129)))

(declare-fun res!968605 () Bool)

(assert (=> b!1435497 (=> res!968605 e!810129)))

(assert (=> b!1435497 (= res!968605 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631745 #b00000000000000000000000000000000) (bvsge lt!631745 (size!47639 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435497 (= lt!631745 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!968600 () Bool)

(assert (=> start!123862 (=> (not res!968600) (not e!810125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123862 (= res!968600 (validMask!0 mask!2608))))

(assert (=> start!123862 e!810125))

(assert (=> start!123862 true))

(declare-fun array_inv!36320 (array!97571) Bool)

(assert (=> start!123862 (array_inv!36320 a!2831)))

(assert (= (and start!123862 res!968600) b!1435499))

(assert (= (and b!1435499 res!968603) b!1435502))

(assert (= (and b!1435502 res!968614) b!1435490))

(assert (= (and b!1435490 res!968601) b!1435495))

(assert (= (and b!1435495 res!968612) b!1435494))

(assert (= (and b!1435494 res!968604) b!1435489))

(assert (= (and b!1435489 res!968606) b!1435487))

(assert (= (and b!1435487 res!968602) b!1435501))

(assert (= (and b!1435501 res!968599) b!1435503))

(assert (= (and b!1435503 res!968613) b!1435500))

(assert (= (and b!1435500 res!968611) b!1435491))

(assert (= (and b!1435491 res!968598) b!1435488))

(assert (= (and b!1435488 res!968610) b!1435498))

(assert (= (and b!1435488 (not res!968609)) b!1435497))

(assert (= (and b!1435497 (not res!968605)) b!1435493))

(assert (= (and b!1435493 (not res!968607)) b!1435496))

(assert (= (and b!1435496 (not res!968608)) b!1435492))

(declare-fun m!1324351 () Bool)

(assert (=> b!1435490 m!1324351))

(assert (=> b!1435490 m!1324351))

(declare-fun m!1324353 () Bool)

(assert (=> b!1435490 m!1324353))

(declare-fun m!1324355 () Bool)

(assert (=> b!1435495 m!1324355))

(declare-fun m!1324357 () Bool)

(assert (=> start!123862 m!1324357))

(declare-fun m!1324359 () Bool)

(assert (=> start!123862 m!1324359))

(assert (=> b!1435493 m!1324351))

(assert (=> b!1435493 m!1324351))

(declare-fun m!1324361 () Bool)

(assert (=> b!1435493 m!1324361))

(declare-fun m!1324363 () Bool)

(assert (=> b!1435496 m!1324363))

(declare-fun m!1324365 () Bool)

(assert (=> b!1435497 m!1324365))

(assert (=> b!1435503 m!1324351))

(assert (=> b!1435503 m!1324351))

(declare-fun m!1324367 () Bool)

(assert (=> b!1435503 m!1324367))

(assert (=> b!1435498 m!1324351))

(assert (=> b!1435498 m!1324351))

(declare-fun m!1324369 () Bool)

(assert (=> b!1435498 m!1324369))

(declare-fun m!1324371 () Bool)

(assert (=> b!1435502 m!1324371))

(assert (=> b!1435502 m!1324371))

(declare-fun m!1324373 () Bool)

(assert (=> b!1435502 m!1324373))

(declare-fun m!1324375 () Bool)

(assert (=> b!1435500 m!1324375))

(declare-fun m!1324377 () Bool)

(assert (=> b!1435488 m!1324377))

(declare-fun m!1324379 () Bool)

(assert (=> b!1435488 m!1324379))

(declare-fun m!1324381 () Bool)

(assert (=> b!1435488 m!1324381))

(declare-fun m!1324383 () Bool)

(assert (=> b!1435488 m!1324383))

(assert (=> b!1435488 m!1324351))

(declare-fun m!1324385 () Bool)

(assert (=> b!1435488 m!1324385))

(assert (=> b!1435487 m!1324351))

(assert (=> b!1435487 m!1324351))

(declare-fun m!1324387 () Bool)

(assert (=> b!1435487 m!1324387))

(assert (=> b!1435487 m!1324387))

(assert (=> b!1435487 m!1324351))

(declare-fun m!1324389 () Bool)

(assert (=> b!1435487 m!1324389))

(declare-fun m!1324391 () Bool)

(assert (=> b!1435494 m!1324391))

(declare-fun m!1324393 () Bool)

(assert (=> b!1435492 m!1324393))

(declare-fun m!1324395 () Bool)

(assert (=> b!1435501 m!1324395))

(assert (=> b!1435501 m!1324395))

(declare-fun m!1324397 () Bool)

(assert (=> b!1435501 m!1324397))

(assert (=> b!1435501 m!1324377))

(declare-fun m!1324399 () Bool)

(assert (=> b!1435501 m!1324399))

(push 1)

(assert (not b!1435488))

(assert (not b!1435502))

(assert (not b!1435500))

(assert (not b!1435493))

(assert (not b!1435495))

(assert (not b!1435501))

(assert (not b!1435492))

(assert (not b!1435498))

(assert (not b!1435497))

(assert (not b!1435496))

(assert (not start!123862))

(assert (not b!1435490))

(assert (not b!1435487))

(assert (not b!1435503))

(assert (not b!1435494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

