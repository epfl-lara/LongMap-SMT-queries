; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124534 () Bool)

(assert start!124534)

(declare-fun b!1441612 () Bool)

(declare-fun res!974034 () Bool)

(declare-fun e!812605 () Bool)

(assert (=> b!1441612 (=> (not res!974034) (not e!812605))))

(declare-datatypes ((array!97960 0))(
  ( (array!97961 (arr!47269 (Array (_ BitVec 32) (_ BitVec 64))) (size!47821 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97960)

(declare-datatypes ((List!33848 0))(
  ( (Nil!33845) (Cons!33844 (h!35194 (_ BitVec 64)) (t!48534 List!33848)) )
))
(declare-fun arrayNoDuplicates!0 (array!97960 (_ BitVec 32) List!33848) Bool)

(assert (=> b!1441612 (= res!974034 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33845))))

(declare-fun res!974027 () Bool)

(assert (=> start!124534 (=> (not res!974027) (not e!812605))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124534 (= res!974027 (validMask!0 mask!2687))))

(assert (=> start!124534 e!812605))

(assert (=> start!124534 true))

(declare-fun array_inv!36502 (array!97960) Bool)

(assert (=> start!124534 (array_inv!36502 a!2862)))

(declare-fun b!1441613 () Bool)

(declare-fun res!974028 () Bool)

(assert (=> b!1441613 (=> (not res!974028) (not e!812605))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441613 (= res!974028 (validKeyInArray!0 (select (arr!47269 a!2862) i!1006)))))

(declare-fun b!1441614 () Bool)

(declare-fun e!812608 () Bool)

(declare-fun e!812609 () Bool)

(assert (=> b!1441614 (= e!812608 e!812609)))

(declare-fun res!974035 () Bool)

(assert (=> b!1441614 (=> (not res!974035) (not e!812609))))

(declare-datatypes ((SeekEntryResult!11546 0))(
  ( (MissingZero!11546 (index!48576 (_ BitVec 32))) (Found!11546 (index!48577 (_ BitVec 32))) (Intermediate!11546 (undefined!12358 Bool) (index!48578 (_ BitVec 32)) (x!130286 (_ BitVec 32))) (Undefined!11546) (MissingVacant!11546 (index!48579 (_ BitVec 32))) )
))
(declare-fun lt!633134 () SeekEntryResult!11546)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441614 (= res!974035 (= lt!633134 (Intermediate!11546 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633133 () (_ BitVec 64))

(declare-fun lt!633131 () array!97960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97960 (_ BitVec 32)) SeekEntryResult!11546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441614 (= lt!633134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633133 mask!2687) lt!633133 lt!633131 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441614 (= lt!633133 (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441615 () Bool)

(declare-fun res!974033 () Bool)

(assert (=> b!1441615 (=> (not res!974033) (not e!812605))))

(assert (=> b!1441615 (= res!974033 (validKeyInArray!0 (select (arr!47269 a!2862) j!93)))))

(declare-fun b!1441616 () Bool)

(declare-fun res!974036 () Bool)

(assert (=> b!1441616 (=> (not res!974036) (not e!812609))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441616 (= res!974036 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441617 () Bool)

(declare-fun res!974029 () Bool)

(assert (=> b!1441617 (=> (not res!974029) (not e!812605))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441617 (= res!974029 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47821 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47821 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47821 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441618 () Bool)

(declare-fun e!812607 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97960 (_ BitVec 32)) SeekEntryResult!11546)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97960 (_ BitVec 32)) SeekEntryResult!11546)

(assert (=> b!1441618 (= e!812607 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633133 lt!633131 mask!2687) (seekEntryOrOpen!0 lt!633133 lt!633131 mask!2687)))))

(declare-fun b!1441619 () Bool)

(declare-fun e!812606 () Bool)

(assert (=> b!1441619 (= e!812606 e!812608)))

(declare-fun res!974031 () Bool)

(assert (=> b!1441619 (=> (not res!974031) (not e!812608))))

(declare-fun lt!633132 () SeekEntryResult!11546)

(assert (=> b!1441619 (= res!974031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47269 a!2862) j!93) mask!2687) (select (arr!47269 a!2862) j!93) a!2862 mask!2687) lt!633132))))

(assert (=> b!1441619 (= lt!633132 (Intermediate!11546 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441620 () Bool)

(declare-fun res!974032 () Bool)

(assert (=> b!1441620 (=> (not res!974032) (not e!812605))))

(assert (=> b!1441620 (= res!974032 (and (= (size!47821 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47821 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47821 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441621 () Bool)

(assert (=> b!1441621 (= e!812607 (= lt!633134 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633133 lt!633131 mask!2687)))))

(declare-fun b!1441622 () Bool)

(assert (=> b!1441622 (= e!812605 e!812606)))

(declare-fun res!974038 () Bool)

(assert (=> b!1441622 (=> (not res!974038) (not e!812606))))

(assert (=> b!1441622 (= res!974038 (= (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441622 (= lt!633131 (array!97961 (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47821 a!2862)))))

(declare-fun b!1441623 () Bool)

(declare-fun res!974026 () Bool)

(assert (=> b!1441623 (=> (not res!974026) (not e!812609))))

(assert (=> b!1441623 (= res!974026 e!812607)))

(declare-fun c!133306 () Bool)

(assert (=> b!1441623 (= c!133306 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441624 () Bool)

(assert (=> b!1441624 (= e!812609 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97960 (_ BitVec 32)) Bool)

(assert (=> b!1441624 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48429 0))(
  ( (Unit!48430) )
))
(declare-fun lt!633135 () Unit!48429)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48429)

(assert (=> b!1441624 (= lt!633135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441625 () Bool)

(declare-fun res!974030 () Bool)

(assert (=> b!1441625 (=> (not res!974030) (not e!812605))))

(assert (=> b!1441625 (= res!974030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441626 () Bool)

(declare-fun res!974037 () Bool)

(assert (=> b!1441626 (=> (not res!974037) (not e!812608))))

(assert (=> b!1441626 (= res!974037 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47269 a!2862) j!93) a!2862 mask!2687) lt!633132))))

(assert (= (and start!124534 res!974027) b!1441620))

(assert (= (and b!1441620 res!974032) b!1441613))

(assert (= (and b!1441613 res!974028) b!1441615))

(assert (= (and b!1441615 res!974033) b!1441625))

(assert (= (and b!1441625 res!974030) b!1441612))

(assert (= (and b!1441612 res!974034) b!1441617))

(assert (= (and b!1441617 res!974029) b!1441622))

(assert (= (and b!1441622 res!974038) b!1441619))

(assert (= (and b!1441619 res!974031) b!1441626))

(assert (= (and b!1441626 res!974037) b!1441614))

(assert (= (and b!1441614 res!974035) b!1441623))

(assert (= (and b!1441623 c!133306) b!1441621))

(assert (= (and b!1441623 (not c!133306)) b!1441618))

(assert (= (and b!1441623 res!974026) b!1441616))

(assert (= (and b!1441616 res!974036) b!1441624))

(declare-fun m!1330329 () Bool)

(assert (=> b!1441613 m!1330329))

(assert (=> b!1441613 m!1330329))

(declare-fun m!1330331 () Bool)

(assert (=> b!1441613 m!1330331))

(declare-fun m!1330333 () Bool)

(assert (=> b!1441612 m!1330333))

(declare-fun m!1330335 () Bool)

(assert (=> b!1441624 m!1330335))

(declare-fun m!1330337 () Bool)

(assert (=> b!1441624 m!1330337))

(declare-fun m!1330339 () Bool)

(assert (=> b!1441618 m!1330339))

(declare-fun m!1330341 () Bool)

(assert (=> b!1441618 m!1330341))

(declare-fun m!1330343 () Bool)

(assert (=> start!124534 m!1330343))

(declare-fun m!1330345 () Bool)

(assert (=> start!124534 m!1330345))

(declare-fun m!1330347 () Bool)

(assert (=> b!1441622 m!1330347))

(declare-fun m!1330349 () Bool)

(assert (=> b!1441622 m!1330349))

(declare-fun m!1330351 () Bool)

(assert (=> b!1441626 m!1330351))

(assert (=> b!1441626 m!1330351))

(declare-fun m!1330353 () Bool)

(assert (=> b!1441626 m!1330353))

(declare-fun m!1330355 () Bool)

(assert (=> b!1441614 m!1330355))

(assert (=> b!1441614 m!1330355))

(declare-fun m!1330357 () Bool)

(assert (=> b!1441614 m!1330357))

(assert (=> b!1441614 m!1330347))

(declare-fun m!1330359 () Bool)

(assert (=> b!1441614 m!1330359))

(assert (=> b!1441619 m!1330351))

(assert (=> b!1441619 m!1330351))

(declare-fun m!1330361 () Bool)

(assert (=> b!1441619 m!1330361))

(assert (=> b!1441619 m!1330361))

(assert (=> b!1441619 m!1330351))

(declare-fun m!1330363 () Bool)

(assert (=> b!1441619 m!1330363))

(assert (=> b!1441615 m!1330351))

(assert (=> b!1441615 m!1330351))

(declare-fun m!1330365 () Bool)

(assert (=> b!1441615 m!1330365))

(declare-fun m!1330367 () Bool)

(assert (=> b!1441621 m!1330367))

(declare-fun m!1330369 () Bool)

(assert (=> b!1441625 m!1330369))

(check-sat (not b!1441615) (not b!1441624) (not b!1441614) (not b!1441613) (not b!1441625) (not b!1441621) (not b!1441626) (not start!124534) (not b!1441618) (not b!1441619) (not b!1441612))
(check-sat)
