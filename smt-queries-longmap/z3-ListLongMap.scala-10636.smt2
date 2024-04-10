; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124956 () Bool)

(assert start!124956)

(declare-fun b!1452410 () Bool)

(declare-fun res!983544 () Bool)

(declare-fun e!817625 () Bool)

(assert (=> b!1452410 (=> (not res!983544) (not e!817625))))

(declare-datatypes ((array!98404 0))(
  ( (array!98405 (arr!47490 (Array (_ BitVec 32) (_ BitVec 64))) (size!48040 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98404)

(declare-datatypes ((List!33991 0))(
  ( (Nil!33988) (Cons!33987 (h!35337 (_ BitVec 64)) (t!48685 List!33991)) )
))
(declare-fun arrayNoDuplicates!0 (array!98404 (_ BitVec 32) List!33991) Bool)

(assert (=> b!1452410 (= res!983544 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33988))))

(declare-fun b!1452411 () Bool)

(declare-fun res!983537 () Bool)

(declare-fun e!817628 () Bool)

(assert (=> b!1452411 (=> (not res!983537) (not e!817628))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11742 0))(
  ( (MissingZero!11742 (index!49360 (_ BitVec 32))) (Found!11742 (index!49361 (_ BitVec 32))) (Intermediate!11742 (undefined!12554 Bool) (index!49362 (_ BitVec 32)) (x!131007 (_ BitVec 32))) (Undefined!11742) (MissingVacant!11742 (index!49363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98404 (_ BitVec 32)) SeekEntryResult!11742)

(assert (=> b!1452411 (= res!983537 (= (seekEntryOrOpen!0 (select (arr!47490 a!2862) j!93) a!2862 mask!2687) (Found!11742 j!93)))))

(declare-fun b!1452412 () Bool)

(declare-fun e!817626 () Bool)

(assert (=> b!1452412 (= e!817626 (not true))))

(assert (=> b!1452412 e!817628))

(declare-fun res!983540 () Bool)

(assert (=> b!1452412 (=> (not res!983540) (not e!817628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98404 (_ BitVec 32)) Bool)

(assert (=> b!1452412 (= res!983540 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48980 0))(
  ( (Unit!48981) )
))
(declare-fun lt!636937 () Unit!48980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48980)

(assert (=> b!1452412 (= lt!636937 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452413 () Bool)

(declare-fun e!817623 () Bool)

(assert (=> b!1452413 (= e!817623 e!817626)))

(declare-fun res!983539 () Bool)

(assert (=> b!1452413 (=> (not res!983539) (not e!817626))))

(declare-fun lt!636935 () SeekEntryResult!11742)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452413 (= res!983539 (= lt!636935 (Intermediate!11742 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636939 () array!98404)

(declare-fun lt!636938 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98404 (_ BitVec 32)) SeekEntryResult!11742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452413 (= lt!636935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636938 mask!2687) lt!636938 lt!636939 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452413 (= lt!636938 (select (store (arr!47490 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452414 () Bool)

(declare-fun res!983535 () Bool)

(assert (=> b!1452414 (=> (not res!983535) (not e!817625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452414 (= res!983535 (validKeyInArray!0 (select (arr!47490 a!2862) j!93)))))

(declare-fun b!1452415 () Bool)

(declare-fun res!983538 () Bool)

(assert (=> b!1452415 (=> (not res!983538) (not e!817626))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1452415 (= res!983538 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452416 () Bool)

(declare-fun res!983534 () Bool)

(assert (=> b!1452416 (=> (not res!983534) (not e!817625))))

(assert (=> b!1452416 (= res!983534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!817622 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1452417 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98404 (_ BitVec 32)) SeekEntryResult!11742)

(assert (=> b!1452417 (= e!817622 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636938 lt!636939 mask!2687) (seekEntryOrOpen!0 lt!636938 lt!636939 mask!2687)))))

(declare-fun b!1452418 () Bool)

(assert (=> b!1452418 (= e!817622 (= lt!636935 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636938 lt!636939 mask!2687)))))

(declare-fun b!1452419 () Bool)

(declare-fun res!983531 () Bool)

(assert (=> b!1452419 (=> (not res!983531) (not e!817626))))

(assert (=> b!1452419 (= res!983531 e!817622)))

(declare-fun c!133950 () Bool)

(assert (=> b!1452419 (= c!133950 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!983533 () Bool)

(assert (=> start!124956 (=> (not res!983533) (not e!817625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124956 (= res!983533 (validMask!0 mask!2687))))

(assert (=> start!124956 e!817625))

(assert (=> start!124956 true))

(declare-fun array_inv!36518 (array!98404) Bool)

(assert (=> start!124956 (array_inv!36518 a!2862)))

(declare-fun b!1452420 () Bool)

(declare-fun e!817627 () Bool)

(assert (=> b!1452420 (= e!817627 e!817623)))

(declare-fun res!983543 () Bool)

(assert (=> b!1452420 (=> (not res!983543) (not e!817623))))

(declare-fun lt!636936 () SeekEntryResult!11742)

(assert (=> b!1452420 (= res!983543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47490 a!2862) j!93) mask!2687) (select (arr!47490 a!2862) j!93) a!2862 mask!2687) lt!636936))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1452420 (= lt!636936 (Intermediate!11742 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452421 () Bool)

(declare-fun res!983542 () Bool)

(assert (=> b!1452421 (=> (not res!983542) (not e!817625))))

(assert (=> b!1452421 (= res!983542 (and (= (size!48040 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48040 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48040 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452422 () Bool)

(declare-fun res!983536 () Bool)

(assert (=> b!1452422 (=> (not res!983536) (not e!817625))))

(assert (=> b!1452422 (= res!983536 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48040 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48040 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48040 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452423 () Bool)

(declare-fun res!983545 () Bool)

(assert (=> b!1452423 (=> (not res!983545) (not e!817623))))

(assert (=> b!1452423 (= res!983545 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47490 a!2862) j!93) a!2862 mask!2687) lt!636936))))

(declare-fun b!1452424 () Bool)

(declare-fun res!983532 () Bool)

(assert (=> b!1452424 (=> (not res!983532) (not e!817625))))

(assert (=> b!1452424 (= res!983532 (validKeyInArray!0 (select (arr!47490 a!2862) i!1006)))))

(declare-fun b!1452425 () Bool)

(assert (=> b!1452425 (= e!817625 e!817627)))

(declare-fun res!983541 () Bool)

(assert (=> b!1452425 (=> (not res!983541) (not e!817627))))

(assert (=> b!1452425 (= res!983541 (= (select (store (arr!47490 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452425 (= lt!636939 (array!98405 (store (arr!47490 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48040 a!2862)))))

(declare-fun b!1452426 () Bool)

(assert (=> b!1452426 (= e!817628 (and (or (= (select (arr!47490 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47490 a!2862) intermediateBeforeIndex!19) (select (arr!47490 a!2862) j!93))) (or (and (= (select (arr!47490 a!2862) index!646) (select (store (arr!47490 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47490 a!2862) index!646) (select (arr!47490 a!2862) j!93))) (= (select (arr!47490 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47490 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!124956 res!983533) b!1452421))

(assert (= (and b!1452421 res!983542) b!1452424))

(assert (= (and b!1452424 res!983532) b!1452414))

(assert (= (and b!1452414 res!983535) b!1452416))

(assert (= (and b!1452416 res!983534) b!1452410))

(assert (= (and b!1452410 res!983544) b!1452422))

(assert (= (and b!1452422 res!983536) b!1452425))

(assert (= (and b!1452425 res!983541) b!1452420))

(assert (= (and b!1452420 res!983543) b!1452423))

(assert (= (and b!1452423 res!983545) b!1452413))

(assert (= (and b!1452413 res!983539) b!1452419))

(assert (= (and b!1452419 c!133950) b!1452418))

(assert (= (and b!1452419 (not c!133950)) b!1452417))

(assert (= (and b!1452419 res!983531) b!1452415))

(assert (= (and b!1452415 res!983538) b!1452412))

(assert (= (and b!1452412 res!983540) b!1452411))

(assert (= (and b!1452411 res!983537) b!1452426))

(declare-fun m!1340985 () Bool)

(assert (=> b!1452418 m!1340985))

(declare-fun m!1340987 () Bool)

(assert (=> b!1452411 m!1340987))

(assert (=> b!1452411 m!1340987))

(declare-fun m!1340989 () Bool)

(assert (=> b!1452411 m!1340989))

(assert (=> b!1452414 m!1340987))

(assert (=> b!1452414 m!1340987))

(declare-fun m!1340991 () Bool)

(assert (=> b!1452414 m!1340991))

(declare-fun m!1340993 () Bool)

(assert (=> b!1452425 m!1340993))

(declare-fun m!1340995 () Bool)

(assert (=> b!1452425 m!1340995))

(declare-fun m!1340997 () Bool)

(assert (=> b!1452424 m!1340997))

(assert (=> b!1452424 m!1340997))

(declare-fun m!1340999 () Bool)

(assert (=> b!1452424 m!1340999))

(assert (=> b!1452426 m!1340993))

(declare-fun m!1341001 () Bool)

(assert (=> b!1452426 m!1341001))

(declare-fun m!1341003 () Bool)

(assert (=> b!1452426 m!1341003))

(declare-fun m!1341005 () Bool)

(assert (=> b!1452426 m!1341005))

(assert (=> b!1452426 m!1340987))

(assert (=> b!1452423 m!1340987))

(assert (=> b!1452423 m!1340987))

(declare-fun m!1341007 () Bool)

(assert (=> b!1452423 m!1341007))

(declare-fun m!1341009 () Bool)

(assert (=> b!1452417 m!1341009))

(declare-fun m!1341011 () Bool)

(assert (=> b!1452417 m!1341011))

(declare-fun m!1341013 () Bool)

(assert (=> start!124956 m!1341013))

(declare-fun m!1341015 () Bool)

(assert (=> start!124956 m!1341015))

(declare-fun m!1341017 () Bool)

(assert (=> b!1452416 m!1341017))

(declare-fun m!1341019 () Bool)

(assert (=> b!1452410 m!1341019))

(assert (=> b!1452420 m!1340987))

(assert (=> b!1452420 m!1340987))

(declare-fun m!1341021 () Bool)

(assert (=> b!1452420 m!1341021))

(assert (=> b!1452420 m!1341021))

(assert (=> b!1452420 m!1340987))

(declare-fun m!1341023 () Bool)

(assert (=> b!1452420 m!1341023))

(declare-fun m!1341025 () Bool)

(assert (=> b!1452412 m!1341025))

(declare-fun m!1341027 () Bool)

(assert (=> b!1452412 m!1341027))

(declare-fun m!1341029 () Bool)

(assert (=> b!1452413 m!1341029))

(assert (=> b!1452413 m!1341029))

(declare-fun m!1341031 () Bool)

(assert (=> b!1452413 m!1341031))

(assert (=> b!1452413 m!1340993))

(declare-fun m!1341033 () Bool)

(assert (=> b!1452413 m!1341033))

(check-sat (not b!1452420) (not b!1452418) (not b!1452411) (not b!1452417) (not b!1452423) (not b!1452412) (not b!1452410) (not b!1452413) (not b!1452414) (not b!1452424) (not b!1452416) (not start!124956))
(check-sat)
