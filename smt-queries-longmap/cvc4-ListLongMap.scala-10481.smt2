; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123268 () Bool)

(assert start!123268)

(declare-fun b!1429488 () Bool)

(declare-fun e!807159 () Bool)

(declare-fun e!807158 () Bool)

(assert (=> b!1429488 (= e!807159 e!807158)))

(declare-fun res!964119 () Bool)

(assert (=> b!1429488 (=> (not res!964119) (not e!807158))))

(declare-datatypes ((SeekEntryResult!11305 0))(
  ( (MissingZero!11305 (index!47612 (_ BitVec 32))) (Found!11305 (index!47613 (_ BitVec 32))) (Intermediate!11305 (undefined!12117 Bool) (index!47614 (_ BitVec 32)) (x!129243 (_ BitVec 32))) (Undefined!11305) (MissingVacant!11305 (index!47615 (_ BitVec 32))) )
))
(declare-fun lt!629385 () SeekEntryResult!11305)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97429 0))(
  ( (array!97430 (arr!47026 (Array (_ BitVec 32) (_ BitVec 64))) (size!47576 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97429)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97429 (_ BitVec 32)) SeekEntryResult!11305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429488 (= res!964119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47026 a!2831) j!81) mask!2608) (select (arr!47026 a!2831) j!81) a!2831 mask!2608) lt!629385))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429488 (= lt!629385 (Intermediate!11305 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429489 () Bool)

(declare-fun res!964123 () Bool)

(assert (=> b!1429489 (=> (not res!964123) (not e!807159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97429 (_ BitVec 32)) Bool)

(assert (=> b!1429489 (= res!964123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429490 () Bool)

(declare-fun res!964128 () Bool)

(assert (=> b!1429490 (=> (not res!964128) (not e!807159))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429490 (= res!964128 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47576 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47576 a!2831))))))

(declare-fun b!1429491 () Bool)

(declare-fun e!807160 () Bool)

(assert (=> b!1429491 (= e!807160 (not true))))

(declare-fun e!807157 () Bool)

(assert (=> b!1429491 e!807157))

(declare-fun res!964126 () Bool)

(assert (=> b!1429491 (=> (not res!964126) (not e!807157))))

(assert (=> b!1429491 (= res!964126 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48356 0))(
  ( (Unit!48357) )
))
(declare-fun lt!629386 () Unit!48356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48356)

(assert (=> b!1429491 (= lt!629386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429492 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97429 (_ BitVec 32)) SeekEntryResult!11305)

(assert (=> b!1429492 (= e!807157 (= (seekEntryOrOpen!0 (select (arr!47026 a!2831) j!81) a!2831 mask!2608) (Found!11305 j!81)))))

(declare-fun b!1429493 () Bool)

(declare-fun res!964125 () Bool)

(assert (=> b!1429493 (=> (not res!964125) (not e!807160))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429493 (= res!964125 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429494 () Bool)

(declare-fun res!964127 () Bool)

(assert (=> b!1429494 (=> (not res!964127) (not e!807159))))

(declare-datatypes ((List!33536 0))(
  ( (Nil!33533) (Cons!33532 (h!34846 (_ BitVec 64)) (t!48230 List!33536)) )
))
(declare-fun arrayNoDuplicates!0 (array!97429 (_ BitVec 32) List!33536) Bool)

(assert (=> b!1429494 (= res!964127 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33533))))

(declare-fun b!1429495 () Bool)

(declare-fun res!964122 () Bool)

(assert (=> b!1429495 (=> (not res!964122) (not e!807159))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429495 (= res!964122 (and (= (size!47576 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47576 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47576 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429496 () Bool)

(declare-fun res!964129 () Bool)

(assert (=> b!1429496 (=> (not res!964129) (not e!807160))))

(declare-fun lt!629388 () array!97429)

(declare-fun lt!629387 () (_ BitVec 64))

(declare-fun lt!629384 () SeekEntryResult!11305)

(assert (=> b!1429496 (= res!964129 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629387 lt!629388 mask!2608) lt!629384))))

(declare-fun b!1429498 () Bool)

(declare-fun res!964120 () Bool)

(assert (=> b!1429498 (=> (not res!964120) (not e!807159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429498 (= res!964120 (validKeyInArray!0 (select (arr!47026 a!2831) i!982)))))

(declare-fun b!1429499 () Bool)

(declare-fun res!964124 () Bool)

(assert (=> b!1429499 (=> (not res!964124) (not e!807160))))

(assert (=> b!1429499 (= res!964124 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47026 a!2831) j!81) a!2831 mask!2608) lt!629385))))

(declare-fun b!1429500 () Bool)

(declare-fun res!964117 () Bool)

(assert (=> b!1429500 (=> (not res!964117) (not e!807159))))

(assert (=> b!1429500 (= res!964117 (validKeyInArray!0 (select (arr!47026 a!2831) j!81)))))

(declare-fun b!1429497 () Bool)

(assert (=> b!1429497 (= e!807158 e!807160)))

(declare-fun res!964118 () Bool)

(assert (=> b!1429497 (=> (not res!964118) (not e!807160))))

(assert (=> b!1429497 (= res!964118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629387 mask!2608) lt!629387 lt!629388 mask!2608) lt!629384))))

(assert (=> b!1429497 (= lt!629384 (Intermediate!11305 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429497 (= lt!629387 (select (store (arr!47026 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429497 (= lt!629388 (array!97430 (store (arr!47026 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47576 a!2831)))))

(declare-fun res!964121 () Bool)

(assert (=> start!123268 (=> (not res!964121) (not e!807159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123268 (= res!964121 (validMask!0 mask!2608))))

(assert (=> start!123268 e!807159))

(assert (=> start!123268 true))

(declare-fun array_inv!36054 (array!97429) Bool)

(assert (=> start!123268 (array_inv!36054 a!2831)))

(assert (= (and start!123268 res!964121) b!1429495))

(assert (= (and b!1429495 res!964122) b!1429498))

(assert (= (and b!1429498 res!964120) b!1429500))

(assert (= (and b!1429500 res!964117) b!1429489))

(assert (= (and b!1429489 res!964123) b!1429494))

(assert (= (and b!1429494 res!964127) b!1429490))

(assert (= (and b!1429490 res!964128) b!1429488))

(assert (= (and b!1429488 res!964119) b!1429497))

(assert (= (and b!1429497 res!964118) b!1429499))

(assert (= (and b!1429499 res!964124) b!1429496))

(assert (= (and b!1429496 res!964129) b!1429493))

(assert (= (and b!1429493 res!964125) b!1429491))

(assert (= (and b!1429491 res!964126) b!1429492))

(declare-fun m!1319587 () Bool)

(assert (=> b!1429499 m!1319587))

(assert (=> b!1429499 m!1319587))

(declare-fun m!1319589 () Bool)

(assert (=> b!1429499 m!1319589))

(declare-fun m!1319591 () Bool)

(assert (=> b!1429497 m!1319591))

(assert (=> b!1429497 m!1319591))

(declare-fun m!1319593 () Bool)

(assert (=> b!1429497 m!1319593))

(declare-fun m!1319595 () Bool)

(assert (=> b!1429497 m!1319595))

(declare-fun m!1319597 () Bool)

(assert (=> b!1429497 m!1319597))

(declare-fun m!1319599 () Bool)

(assert (=> b!1429489 m!1319599))

(declare-fun m!1319601 () Bool)

(assert (=> b!1429498 m!1319601))

(assert (=> b!1429498 m!1319601))

(declare-fun m!1319603 () Bool)

(assert (=> b!1429498 m!1319603))

(assert (=> b!1429500 m!1319587))

(assert (=> b!1429500 m!1319587))

(declare-fun m!1319605 () Bool)

(assert (=> b!1429500 m!1319605))

(assert (=> b!1429488 m!1319587))

(assert (=> b!1429488 m!1319587))

(declare-fun m!1319607 () Bool)

(assert (=> b!1429488 m!1319607))

(assert (=> b!1429488 m!1319607))

(assert (=> b!1429488 m!1319587))

(declare-fun m!1319609 () Bool)

(assert (=> b!1429488 m!1319609))

(declare-fun m!1319611 () Bool)

(assert (=> b!1429494 m!1319611))

(declare-fun m!1319613 () Bool)

(assert (=> b!1429491 m!1319613))

(declare-fun m!1319615 () Bool)

(assert (=> b!1429491 m!1319615))

(declare-fun m!1319617 () Bool)

(assert (=> start!123268 m!1319617))

(declare-fun m!1319619 () Bool)

(assert (=> start!123268 m!1319619))

(assert (=> b!1429492 m!1319587))

(assert (=> b!1429492 m!1319587))

(declare-fun m!1319621 () Bool)

(assert (=> b!1429492 m!1319621))

(declare-fun m!1319623 () Bool)

(assert (=> b!1429496 m!1319623))

(push 1)

