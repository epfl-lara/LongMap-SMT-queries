; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123500 () Bool)

(assert start!123500)

(declare-fun b!1431521 () Bool)

(declare-fun res!965503 () Bool)

(declare-fun e!808186 () Bool)

(assert (=> b!1431521 (=> (not res!965503) (not e!808186))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431521 (= res!965503 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431522 () Bool)

(declare-fun res!965497 () Bool)

(declare-fun e!808188 () Bool)

(assert (=> b!1431522 (=> (not res!965497) (not e!808188))))

(declare-datatypes ((array!97437 0))(
  ( (array!97438 (arr!47026 (Array (_ BitVec 32) (_ BitVec 64))) (size!47578 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97437)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431522 (= res!965497 (validKeyInArray!0 (select (arr!47026 a!2831) j!81)))))

(declare-fun b!1431523 () Bool)

(declare-fun res!965499 () Bool)

(assert (=> b!1431523 (=> (not res!965499) (not e!808186))))

(declare-fun lt!630046 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11332 0))(
  ( (MissingZero!11332 (index!47720 (_ BitVec 32))) (Found!11332 (index!47721 (_ BitVec 32))) (Intermediate!11332 (undefined!12144 Bool) (index!47722 (_ BitVec 32)) (x!129361 (_ BitVec 32))) (Undefined!11332) (MissingVacant!11332 (index!47723 (_ BitVec 32))) )
))
(declare-fun lt!630049 () SeekEntryResult!11332)

(declare-fun lt!630051 () array!97437)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97437 (_ BitVec 32)) SeekEntryResult!11332)

(assert (=> b!1431523 (= res!965499 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630046 lt!630051 mask!2608) lt!630049))))

(declare-fun b!1431524 () Bool)

(declare-fun res!965490 () Bool)

(assert (=> b!1431524 (=> (not res!965490) (not e!808188))))

(assert (=> b!1431524 (= res!965490 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47578 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47578 a!2831))))))

(declare-fun b!1431526 () Bool)

(declare-fun res!965494 () Bool)

(assert (=> b!1431526 (=> (not res!965494) (not e!808188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97437 (_ BitVec 32)) Bool)

(assert (=> b!1431526 (= res!965494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431527 () Bool)

(declare-fun res!965500 () Bool)

(assert (=> b!1431527 (=> (not res!965500) (not e!808188))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431527 (= res!965500 (and (= (size!47578 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47578 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47578 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431528 () Bool)

(declare-fun res!965502 () Bool)

(assert (=> b!1431528 (=> (not res!965502) (not e!808186))))

(declare-fun lt!630048 () SeekEntryResult!11332)

(assert (=> b!1431528 (= res!965502 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47026 a!2831) j!81) a!2831 mask!2608) lt!630048))))

(declare-fun b!1431529 () Bool)

(declare-fun e!808187 () Bool)

(assert (=> b!1431529 (= e!808187 true)))

(declare-fun lt!630050 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431529 (= lt!630050 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431530 () Bool)

(declare-fun e!808185 () Bool)

(assert (=> b!1431530 (= e!808185 e!808186)))

(declare-fun res!965496 () Bool)

(assert (=> b!1431530 (=> (not res!965496) (not e!808186))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431530 (= res!965496 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630046 mask!2608) lt!630046 lt!630051 mask!2608) lt!630049))))

(assert (=> b!1431530 (= lt!630049 (Intermediate!11332 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431530 (= lt!630046 (select (store (arr!47026 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431530 (= lt!630051 (array!97438 (store (arr!47026 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47578 a!2831)))))

(declare-fun b!1431531 () Bool)

(declare-fun res!965491 () Bool)

(assert (=> b!1431531 (=> (not res!965491) (not e!808188))))

(declare-datatypes ((List!33614 0))(
  ( (Nil!33611) (Cons!33610 (h!34933 (_ BitVec 64)) (t!48300 List!33614)) )
))
(declare-fun arrayNoDuplicates!0 (array!97437 (_ BitVec 32) List!33614) Bool)

(assert (=> b!1431531 (= res!965491 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33611))))

(declare-fun b!1431532 () Bool)

(declare-fun e!808184 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97437 (_ BitVec 32)) SeekEntryResult!11332)

(assert (=> b!1431532 (= e!808184 (= (seekEntryOrOpen!0 (select (arr!47026 a!2831) j!81) a!2831 mask!2608) (Found!11332 j!81)))))

(declare-fun b!1431533 () Bool)

(assert (=> b!1431533 (= e!808188 e!808185)))

(declare-fun res!965501 () Bool)

(assert (=> b!1431533 (=> (not res!965501) (not e!808185))))

(assert (=> b!1431533 (= res!965501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47026 a!2831) j!81) mask!2608) (select (arr!47026 a!2831) j!81) a!2831 mask!2608) lt!630048))))

(assert (=> b!1431533 (= lt!630048 (Intermediate!11332 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431534 () Bool)

(assert (=> b!1431534 (= e!808186 (not e!808187))))

(declare-fun res!965498 () Bool)

(assert (=> b!1431534 (=> res!965498 e!808187)))

(assert (=> b!1431534 (= res!965498 (or (= (select (arr!47026 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47026 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47026 a!2831) index!585) (select (arr!47026 a!2831) j!81)) (= (select (store (arr!47026 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1431534 e!808184))

(declare-fun res!965492 () Bool)

(assert (=> b!1431534 (=> (not res!965492) (not e!808184))))

(assert (=> b!1431534 (= res!965492 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48249 0))(
  ( (Unit!48250) )
))
(declare-fun lt!630047 () Unit!48249)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48249)

(assert (=> b!1431534 (= lt!630047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!965493 () Bool)

(assert (=> start!123500 (=> (not res!965493) (not e!808188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123500 (= res!965493 (validMask!0 mask!2608))))

(assert (=> start!123500 e!808188))

(assert (=> start!123500 true))

(declare-fun array_inv!36259 (array!97437) Bool)

(assert (=> start!123500 (array_inv!36259 a!2831)))

(declare-fun b!1431525 () Bool)

(declare-fun res!965495 () Bool)

(assert (=> b!1431525 (=> (not res!965495) (not e!808188))))

(assert (=> b!1431525 (= res!965495 (validKeyInArray!0 (select (arr!47026 a!2831) i!982)))))

(assert (= (and start!123500 res!965493) b!1431527))

(assert (= (and b!1431527 res!965500) b!1431525))

(assert (= (and b!1431525 res!965495) b!1431522))

(assert (= (and b!1431522 res!965497) b!1431526))

(assert (= (and b!1431526 res!965494) b!1431531))

(assert (= (and b!1431531 res!965491) b!1431524))

(assert (= (and b!1431524 res!965490) b!1431533))

(assert (= (and b!1431533 res!965501) b!1431530))

(assert (= (and b!1431530 res!965496) b!1431528))

(assert (= (and b!1431528 res!965502) b!1431523))

(assert (= (and b!1431523 res!965499) b!1431521))

(assert (= (and b!1431521 res!965503) b!1431534))

(assert (= (and b!1431534 res!965492) b!1431532))

(assert (= (and b!1431534 (not res!965498)) b!1431529))

(declare-fun m!1320809 () Bool)

(assert (=> b!1431529 m!1320809))

(declare-fun m!1320811 () Bool)

(assert (=> b!1431522 m!1320811))

(assert (=> b!1431522 m!1320811))

(declare-fun m!1320813 () Bool)

(assert (=> b!1431522 m!1320813))

(declare-fun m!1320815 () Bool)

(assert (=> b!1431525 m!1320815))

(assert (=> b!1431525 m!1320815))

(declare-fun m!1320817 () Bool)

(assert (=> b!1431525 m!1320817))

(declare-fun m!1320819 () Bool)

(assert (=> start!123500 m!1320819))

(declare-fun m!1320821 () Bool)

(assert (=> start!123500 m!1320821))

(assert (=> b!1431533 m!1320811))

(assert (=> b!1431533 m!1320811))

(declare-fun m!1320823 () Bool)

(assert (=> b!1431533 m!1320823))

(assert (=> b!1431533 m!1320823))

(assert (=> b!1431533 m!1320811))

(declare-fun m!1320825 () Bool)

(assert (=> b!1431533 m!1320825))

(declare-fun m!1320827 () Bool)

(assert (=> b!1431523 m!1320827))

(assert (=> b!1431528 m!1320811))

(assert (=> b!1431528 m!1320811))

(declare-fun m!1320829 () Bool)

(assert (=> b!1431528 m!1320829))

(assert (=> b!1431532 m!1320811))

(assert (=> b!1431532 m!1320811))

(declare-fun m!1320831 () Bool)

(assert (=> b!1431532 m!1320831))

(declare-fun m!1320833 () Bool)

(assert (=> b!1431534 m!1320833))

(declare-fun m!1320835 () Bool)

(assert (=> b!1431534 m!1320835))

(declare-fun m!1320837 () Bool)

(assert (=> b!1431534 m!1320837))

(declare-fun m!1320839 () Bool)

(assert (=> b!1431534 m!1320839))

(assert (=> b!1431534 m!1320811))

(declare-fun m!1320841 () Bool)

(assert (=> b!1431534 m!1320841))

(declare-fun m!1320843 () Bool)

(assert (=> b!1431531 m!1320843))

(declare-fun m!1320845 () Bool)

(assert (=> b!1431526 m!1320845))

(declare-fun m!1320847 () Bool)

(assert (=> b!1431530 m!1320847))

(assert (=> b!1431530 m!1320847))

(declare-fun m!1320849 () Bool)

(assert (=> b!1431530 m!1320849))

(assert (=> b!1431530 m!1320833))

(declare-fun m!1320851 () Bool)

(assert (=> b!1431530 m!1320851))

(check-sat (not b!1431534) (not b!1431529) (not b!1431522) (not b!1431525) (not b!1431531) (not b!1431533) (not b!1431528) (not b!1431532) (not b!1431530) (not b!1431526) (not start!123500) (not b!1431523))
(check-sat)
