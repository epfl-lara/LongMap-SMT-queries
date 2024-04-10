; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124630 () Bool)

(assert start!124630)

(declare-fun res!975585 () Bool)

(declare-fun e!813421 () Bool)

(assert (=> start!124630 (=> (not res!975585) (not e!813421))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124630 (= res!975585 (validMask!0 mask!2687))))

(assert (=> start!124630 e!813421))

(assert (=> start!124630 true))

(declare-datatypes ((array!98078 0))(
  ( (array!98079 (arr!47327 (Array (_ BitVec 32) (_ BitVec 64))) (size!47877 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98078)

(declare-fun array_inv!36355 (array!98078) Bool)

(assert (=> start!124630 (array_inv!36355 a!2862)))

(declare-datatypes ((SeekEntryResult!11579 0))(
  ( (MissingZero!11579 (index!48708 (_ BitVec 32))) (Found!11579 (index!48709 (_ BitVec 32))) (Intermediate!11579 (undefined!12391 Bool) (index!48710 (_ BitVec 32)) (x!130412 (_ BitVec 32))) (Undefined!11579) (MissingVacant!11579 (index!48711 (_ BitVec 32))) )
))
(declare-fun lt!633875 () SeekEntryResult!11579)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633871 () (_ BitVec 64))

(declare-fun b!1443476 () Bool)

(declare-fun e!813422 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!633874 () array!98078)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98078 (_ BitVec 32)) SeekEntryResult!11579)

(assert (=> b!1443476 (= e!813422 (= lt!633875 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633871 lt!633874 mask!2687)))))

(declare-fun b!1443477 () Bool)

(declare-fun e!813419 () Bool)

(assert (=> b!1443477 (= e!813419 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1443478 () Bool)

(declare-fun res!975583 () Bool)

(declare-fun e!813420 () Bool)

(assert (=> b!1443478 (=> (not res!975583) (not e!813420))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443478 (= res!975583 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443479 () Bool)

(declare-fun res!975582 () Bool)

(assert (=> b!1443479 (=> (not res!975582) (not e!813421))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443479 (= res!975582 (and (= (size!47877 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47877 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47877 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443480 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98078 (_ BitVec 32)) SeekEntryResult!11579)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98078 (_ BitVec 32)) SeekEntryResult!11579)

(assert (=> b!1443480 (= e!813422 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633871 lt!633874 mask!2687) (seekEntryOrOpen!0 lt!633871 lt!633874 mask!2687)))))

(declare-fun b!1443481 () Bool)

(declare-fun res!975577 () Bool)

(declare-fun e!813416 () Bool)

(assert (=> b!1443481 (=> (not res!975577) (not e!813416))))

(declare-fun lt!633873 () SeekEntryResult!11579)

(assert (=> b!1443481 (= res!975577 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47327 a!2862) j!93) a!2862 mask!2687) lt!633873))))

(declare-fun b!1443482 () Bool)

(declare-fun res!975587 () Bool)

(assert (=> b!1443482 (=> (not res!975587) (not e!813421))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443482 (= res!975587 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47877 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47877 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47877 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443483 () Bool)

(declare-fun res!975579 () Bool)

(assert (=> b!1443483 (=> (not res!975579) (not e!813421))))

(declare-datatypes ((List!33828 0))(
  ( (Nil!33825) (Cons!33824 (h!35174 (_ BitVec 64)) (t!48522 List!33828)) )
))
(declare-fun arrayNoDuplicates!0 (array!98078 (_ BitVec 32) List!33828) Bool)

(assert (=> b!1443483 (= res!975579 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33825))))

(declare-fun b!1443484 () Bool)

(declare-fun e!813417 () Bool)

(assert (=> b!1443484 (= e!813417 e!813416)))

(declare-fun res!975586 () Bool)

(assert (=> b!1443484 (=> (not res!975586) (not e!813416))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443484 (= res!975586 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47327 a!2862) j!93) mask!2687) (select (arr!47327 a!2862) j!93) a!2862 mask!2687) lt!633873))))

(assert (=> b!1443484 (= lt!633873 (Intermediate!11579 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443485 () Bool)

(declare-fun res!975576 () Bool)

(assert (=> b!1443485 (=> (not res!975576) (not e!813421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443485 (= res!975576 (validKeyInArray!0 (select (arr!47327 a!2862) i!1006)))))

(declare-fun b!1443486 () Bool)

(declare-fun res!975589 () Bool)

(assert (=> b!1443486 (=> (not res!975589) (not e!813421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98078 (_ BitVec 32)) Bool)

(assert (=> b!1443486 (= res!975589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443487 () Bool)

(assert (=> b!1443487 (= e!813421 e!813417)))

(declare-fun res!975584 () Bool)

(assert (=> b!1443487 (=> (not res!975584) (not e!813417))))

(assert (=> b!1443487 (= res!975584 (= (select (store (arr!47327 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443487 (= lt!633874 (array!98079 (store (arr!47327 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47877 a!2862)))))

(declare-fun b!1443488 () Bool)

(assert (=> b!1443488 (= e!813420 (not e!813419))))

(declare-fun res!975580 () Bool)

(assert (=> b!1443488 (=> res!975580 e!813419)))

(assert (=> b!1443488 (= res!975580 (or (not (= (select (arr!47327 a!2862) index!646) (select (store (arr!47327 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47327 a!2862) index!646) (select (arr!47327 a!2862) j!93)))))))

(declare-fun lt!633876 () SeekEntryResult!11579)

(assert (=> b!1443488 (and (= lt!633876 (Found!11579 j!93)) (or (= (select (arr!47327 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47327 a!2862) intermediateBeforeIndex!19) (select (arr!47327 a!2862) j!93))))))

(assert (=> b!1443488 (= lt!633876 (seekEntryOrOpen!0 (select (arr!47327 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1443488 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48654 0))(
  ( (Unit!48655) )
))
(declare-fun lt!633872 () Unit!48654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48654)

(assert (=> b!1443488 (= lt!633872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443489 () Bool)

(assert (=> b!1443489 (= e!813416 e!813420)))

(declare-fun res!975581 () Bool)

(assert (=> b!1443489 (=> (not res!975581) (not e!813420))))

(assert (=> b!1443489 (= res!975581 (= lt!633875 (Intermediate!11579 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443489 (= lt!633875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633871 mask!2687) lt!633871 lt!633874 mask!2687))))

(assert (=> b!1443489 (= lt!633871 (select (store (arr!47327 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443490 () Bool)

(declare-fun res!975588 () Bool)

(assert (=> b!1443490 (=> (not res!975588) (not e!813420))))

(assert (=> b!1443490 (= res!975588 e!813422)))

(declare-fun c!133461 () Bool)

(assert (=> b!1443490 (= c!133461 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443491 () Bool)

(declare-fun res!975575 () Bool)

(assert (=> b!1443491 (=> res!975575 e!813419)))

(assert (=> b!1443491 (= res!975575 (not (= lt!633876 (seekEntryOrOpen!0 lt!633871 lt!633874 mask!2687))))))

(declare-fun b!1443492 () Bool)

(declare-fun res!975578 () Bool)

(assert (=> b!1443492 (=> (not res!975578) (not e!813421))))

(assert (=> b!1443492 (= res!975578 (validKeyInArray!0 (select (arr!47327 a!2862) j!93)))))

(assert (= (and start!124630 res!975585) b!1443479))

(assert (= (and b!1443479 res!975582) b!1443485))

(assert (= (and b!1443485 res!975576) b!1443492))

(assert (= (and b!1443492 res!975578) b!1443486))

(assert (= (and b!1443486 res!975589) b!1443483))

(assert (= (and b!1443483 res!975579) b!1443482))

(assert (= (and b!1443482 res!975587) b!1443487))

(assert (= (and b!1443487 res!975584) b!1443484))

(assert (= (and b!1443484 res!975586) b!1443481))

(assert (= (and b!1443481 res!975577) b!1443489))

(assert (= (and b!1443489 res!975581) b!1443490))

(assert (= (and b!1443490 c!133461) b!1443476))

(assert (= (and b!1443490 (not c!133461)) b!1443480))

(assert (= (and b!1443490 res!975588) b!1443478))

(assert (= (and b!1443478 res!975583) b!1443488))

(assert (= (and b!1443488 (not res!975580)) b!1443491))

(assert (= (and b!1443491 (not res!975575)) b!1443477))

(declare-fun m!1332553 () Bool)

(assert (=> b!1443476 m!1332553))

(declare-fun m!1332555 () Bool)

(assert (=> b!1443483 m!1332555))

(declare-fun m!1332557 () Bool)

(assert (=> b!1443480 m!1332557))

(declare-fun m!1332559 () Bool)

(assert (=> b!1443480 m!1332559))

(declare-fun m!1332561 () Bool)

(assert (=> b!1443489 m!1332561))

(assert (=> b!1443489 m!1332561))

(declare-fun m!1332563 () Bool)

(assert (=> b!1443489 m!1332563))

(declare-fun m!1332565 () Bool)

(assert (=> b!1443489 m!1332565))

(declare-fun m!1332567 () Bool)

(assert (=> b!1443489 m!1332567))

(declare-fun m!1332569 () Bool)

(assert (=> b!1443486 m!1332569))

(declare-fun m!1332571 () Bool)

(assert (=> b!1443484 m!1332571))

(assert (=> b!1443484 m!1332571))

(declare-fun m!1332573 () Bool)

(assert (=> b!1443484 m!1332573))

(assert (=> b!1443484 m!1332573))

(assert (=> b!1443484 m!1332571))

(declare-fun m!1332575 () Bool)

(assert (=> b!1443484 m!1332575))

(declare-fun m!1332577 () Bool)

(assert (=> start!124630 m!1332577))

(declare-fun m!1332579 () Bool)

(assert (=> start!124630 m!1332579))

(assert (=> b!1443491 m!1332559))

(assert (=> b!1443487 m!1332565))

(declare-fun m!1332581 () Bool)

(assert (=> b!1443487 m!1332581))

(declare-fun m!1332583 () Bool)

(assert (=> b!1443488 m!1332583))

(assert (=> b!1443488 m!1332565))

(declare-fun m!1332585 () Bool)

(assert (=> b!1443488 m!1332585))

(declare-fun m!1332587 () Bool)

(assert (=> b!1443488 m!1332587))

(declare-fun m!1332589 () Bool)

(assert (=> b!1443488 m!1332589))

(assert (=> b!1443488 m!1332571))

(declare-fun m!1332591 () Bool)

(assert (=> b!1443488 m!1332591))

(declare-fun m!1332593 () Bool)

(assert (=> b!1443488 m!1332593))

(assert (=> b!1443488 m!1332571))

(assert (=> b!1443481 m!1332571))

(assert (=> b!1443481 m!1332571))

(declare-fun m!1332595 () Bool)

(assert (=> b!1443481 m!1332595))

(declare-fun m!1332597 () Bool)

(assert (=> b!1443485 m!1332597))

(assert (=> b!1443485 m!1332597))

(declare-fun m!1332599 () Bool)

(assert (=> b!1443485 m!1332599))

(assert (=> b!1443492 m!1332571))

(assert (=> b!1443492 m!1332571))

(declare-fun m!1332601 () Bool)

(assert (=> b!1443492 m!1332601))

(push 1)

