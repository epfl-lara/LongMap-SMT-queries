; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125766 () Bool)

(assert start!125766)

(declare-fun b!1471703 () Bool)

(declare-fun e!826049 () Bool)

(declare-fun e!826051 () Bool)

(assert (=> b!1471703 (= e!826049 e!826051)))

(declare-fun res!999457 () Bool)

(assert (=> b!1471703 (=> (not res!999457) (not e!826051))))

(declare-datatypes ((SeekEntryResult!12075 0))(
  ( (MissingZero!12075 (index!50692 (_ BitVec 32))) (Found!12075 (index!50693 (_ BitVec 32))) (Intermediate!12075 (undefined!12887 Bool) (index!50694 (_ BitVec 32)) (x!132278 (_ BitVec 32))) (Undefined!12075) (MissingVacant!12075 (index!50695 (_ BitVec 32))) )
))
(declare-fun lt!643358 () SeekEntryResult!12075)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471703 (= res!999457 (= lt!643358 (Intermediate!12075 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99100 0))(
  ( (array!99101 (arr!47835 (Array (_ BitVec 32) (_ BitVec 64))) (size!48385 (_ BitVec 32))) )
))
(declare-fun lt!643355 () array!99100)

(declare-fun lt!643359 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99100 (_ BitVec 32)) SeekEntryResult!12075)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471703 (= lt!643358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643359 mask!2687) lt!643359 lt!643355 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99100)

(assert (=> b!1471703 (= lt!643359 (select (store (arr!47835 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471704 () Bool)

(declare-fun res!999455 () Bool)

(assert (=> b!1471704 (=> (not res!999455) (not e!826051))))

(declare-fun e!826046 () Bool)

(assert (=> b!1471704 (= res!999455 e!826046)))

(declare-fun c!135639 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1471704 (= c!135639 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471705 () Bool)

(declare-fun res!999459 () Bool)

(declare-fun e!826047 () Bool)

(assert (=> b!1471705 (=> (not res!999459) (not e!826047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471705 (= res!999459 (validKeyInArray!0 (select (arr!47835 a!2862) j!93)))))

(declare-fun b!1471706 () Bool)

(assert (=> b!1471706 (= e!826051 (not true))))

(declare-fun e!826050 () Bool)

(assert (=> b!1471706 e!826050))

(declare-fun res!999465 () Bool)

(assert (=> b!1471706 (=> (not res!999465) (not e!826050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99100 (_ BitVec 32)) Bool)

(assert (=> b!1471706 (= res!999465 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49490 0))(
  ( (Unit!49491) )
))
(declare-fun lt!643357 () Unit!49490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49490)

(assert (=> b!1471706 (= lt!643357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471708 () Bool)

(declare-fun e!826048 () Bool)

(assert (=> b!1471708 (= e!826048 e!826049)))

(declare-fun res!999454 () Bool)

(assert (=> b!1471708 (=> (not res!999454) (not e!826049))))

(declare-fun lt!643356 () SeekEntryResult!12075)

(assert (=> b!1471708 (= res!999454 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47835 a!2862) j!93) mask!2687) (select (arr!47835 a!2862) j!93) a!2862 mask!2687) lt!643356))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471708 (= lt!643356 (Intermediate!12075 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471709 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99100 (_ BitVec 32)) SeekEntryResult!12075)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99100 (_ BitVec 32)) SeekEntryResult!12075)

(assert (=> b!1471709 (= e!826046 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643359 lt!643355 mask!2687) (seekEntryOrOpen!0 lt!643359 lt!643355 mask!2687)))))

(declare-fun b!1471710 () Bool)

(declare-fun res!999466 () Bool)

(assert (=> b!1471710 (=> (not res!999466) (not e!826047))))

(declare-datatypes ((List!34336 0))(
  ( (Nil!34333) (Cons!34332 (h!35688 (_ BitVec 64)) (t!49030 List!34336)) )
))
(declare-fun arrayNoDuplicates!0 (array!99100 (_ BitVec 32) List!34336) Bool)

(assert (=> b!1471710 (= res!999466 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34333))))

(declare-fun b!1471711 () Bool)

(declare-fun res!999452 () Bool)

(assert (=> b!1471711 (=> (not res!999452) (not e!826047))))

(assert (=> b!1471711 (= res!999452 (validKeyInArray!0 (select (arr!47835 a!2862) i!1006)))))

(declare-fun b!1471712 () Bool)

(assert (=> b!1471712 (= e!826050 (or (= (select (arr!47835 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47835 a!2862) intermediateBeforeIndex!19) (select (arr!47835 a!2862) j!93))))))

(declare-fun b!1471713 () Bool)

(assert (=> b!1471713 (= e!826047 e!826048)))

(declare-fun res!999461 () Bool)

(assert (=> b!1471713 (=> (not res!999461) (not e!826048))))

(assert (=> b!1471713 (= res!999461 (= (select (store (arr!47835 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471713 (= lt!643355 (array!99101 (store (arr!47835 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48385 a!2862)))))

(declare-fun b!1471714 () Bool)

(declare-fun res!999463 () Bool)

(assert (=> b!1471714 (=> (not res!999463) (not e!826050))))

(assert (=> b!1471714 (= res!999463 (= (seekEntryOrOpen!0 (select (arr!47835 a!2862) j!93) a!2862 mask!2687) (Found!12075 j!93)))))

(declare-fun b!1471715 () Bool)

(declare-fun res!999458 () Bool)

(assert (=> b!1471715 (=> (not res!999458) (not e!826047))))

(assert (=> b!1471715 (= res!999458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471716 () Bool)

(declare-fun res!999460 () Bool)

(assert (=> b!1471716 (=> (not res!999460) (not e!826047))))

(assert (=> b!1471716 (= res!999460 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48385 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48385 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48385 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471717 () Bool)

(assert (=> b!1471717 (= e!826046 (= lt!643358 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643359 lt!643355 mask!2687)))))

(declare-fun b!1471718 () Bool)

(declare-fun res!999462 () Bool)

(assert (=> b!1471718 (=> (not res!999462) (not e!826049))))

(assert (=> b!1471718 (= res!999462 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47835 a!2862) j!93) a!2862 mask!2687) lt!643356))))

(declare-fun b!1471719 () Bool)

(declare-fun res!999453 () Bool)

(assert (=> b!1471719 (=> (not res!999453) (not e!826051))))

(assert (=> b!1471719 (= res!999453 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!999456 () Bool)

(assert (=> start!125766 (=> (not res!999456) (not e!826047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125766 (= res!999456 (validMask!0 mask!2687))))

(assert (=> start!125766 e!826047))

(assert (=> start!125766 true))

(declare-fun array_inv!36863 (array!99100) Bool)

(assert (=> start!125766 (array_inv!36863 a!2862)))

(declare-fun b!1471707 () Bool)

(declare-fun res!999464 () Bool)

(assert (=> b!1471707 (=> (not res!999464) (not e!826047))))

(assert (=> b!1471707 (= res!999464 (and (= (size!48385 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48385 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48385 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125766 res!999456) b!1471707))

(assert (= (and b!1471707 res!999464) b!1471711))

(assert (= (and b!1471711 res!999452) b!1471705))

(assert (= (and b!1471705 res!999459) b!1471715))

(assert (= (and b!1471715 res!999458) b!1471710))

(assert (= (and b!1471710 res!999466) b!1471716))

(assert (= (and b!1471716 res!999460) b!1471713))

(assert (= (and b!1471713 res!999461) b!1471708))

(assert (= (and b!1471708 res!999454) b!1471718))

(assert (= (and b!1471718 res!999462) b!1471703))

(assert (= (and b!1471703 res!999457) b!1471704))

(assert (= (and b!1471704 c!135639) b!1471717))

(assert (= (and b!1471704 (not c!135639)) b!1471709))

(assert (= (and b!1471704 res!999455) b!1471719))

(assert (= (and b!1471719 res!999453) b!1471706))

(assert (= (and b!1471706 res!999465) b!1471714))

(assert (= (and b!1471714 res!999463) b!1471712))

(declare-fun m!1358489 () Bool)

(assert (=> b!1471718 m!1358489))

(assert (=> b!1471718 m!1358489))

(declare-fun m!1358491 () Bool)

(assert (=> b!1471718 m!1358491))

(declare-fun m!1358493 () Bool)

(assert (=> b!1471712 m!1358493))

(assert (=> b!1471712 m!1358489))

(declare-fun m!1358495 () Bool)

(assert (=> b!1471710 m!1358495))

(declare-fun m!1358497 () Bool)

(assert (=> b!1471703 m!1358497))

(assert (=> b!1471703 m!1358497))

(declare-fun m!1358499 () Bool)

(assert (=> b!1471703 m!1358499))

(declare-fun m!1358501 () Bool)

(assert (=> b!1471703 m!1358501))

(declare-fun m!1358503 () Bool)

(assert (=> b!1471703 m!1358503))

(assert (=> b!1471714 m!1358489))

(assert (=> b!1471714 m!1358489))

(declare-fun m!1358505 () Bool)

(assert (=> b!1471714 m!1358505))

(declare-fun m!1358507 () Bool)

(assert (=> b!1471706 m!1358507))

(declare-fun m!1358509 () Bool)

(assert (=> b!1471706 m!1358509))

(declare-fun m!1358511 () Bool)

(assert (=> start!125766 m!1358511))

(declare-fun m!1358513 () Bool)

(assert (=> start!125766 m!1358513))

(assert (=> b!1471705 m!1358489))

(assert (=> b!1471705 m!1358489))

(declare-fun m!1358515 () Bool)

(assert (=> b!1471705 m!1358515))

(assert (=> b!1471708 m!1358489))

(assert (=> b!1471708 m!1358489))

(declare-fun m!1358517 () Bool)

(assert (=> b!1471708 m!1358517))

(assert (=> b!1471708 m!1358517))

(assert (=> b!1471708 m!1358489))

(declare-fun m!1358519 () Bool)

(assert (=> b!1471708 m!1358519))

(declare-fun m!1358521 () Bool)

(assert (=> b!1471709 m!1358521))

(declare-fun m!1358523 () Bool)

(assert (=> b!1471709 m!1358523))

(declare-fun m!1358525 () Bool)

(assert (=> b!1471715 m!1358525))

(declare-fun m!1358527 () Bool)

(assert (=> b!1471717 m!1358527))

(assert (=> b!1471713 m!1358501))

(declare-fun m!1358529 () Bool)

(assert (=> b!1471713 m!1358529))

(declare-fun m!1358531 () Bool)

(assert (=> b!1471711 m!1358531))

(assert (=> b!1471711 m!1358531))

(declare-fun m!1358533 () Bool)

(assert (=> b!1471711 m!1358533))

(check-sat (not b!1471718) (not b!1471717) (not b!1471709) (not b!1471703) (not b!1471711) (not start!125766) (not b!1471710) (not b!1471705) (not b!1471715) (not b!1471714) (not b!1471706) (not b!1471708))
(check-sat)
