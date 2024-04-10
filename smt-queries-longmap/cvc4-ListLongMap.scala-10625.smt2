; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124892 () Bool)

(assert start!124892)

(declare-fun b!1450703 () Bool)

(declare-fun e!816876 () Bool)

(declare-fun e!816882 () Bool)

(assert (=> b!1450703 (= e!816876 e!816882)))

(declare-fun res!982028 () Bool)

(assert (=> b!1450703 (=> (not res!982028) (not e!816882))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98340 0))(
  ( (array!98341 (arr!47458 (Array (_ BitVec 32) (_ BitVec 64))) (size!48008 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98340)

(assert (=> b!1450703 (= res!982028 (= (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636400 () array!98340)

(assert (=> b!1450703 (= lt!636400 (array!98341 (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48008 a!2862)))))

(declare-fun b!1450704 () Bool)

(declare-fun res!982027 () Bool)

(assert (=> b!1450704 (=> (not res!982027) (not e!816876))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1450704 (= res!982027 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48008 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48008 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48008 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450705 () Bool)

(declare-fun res!982021 () Bool)

(declare-fun e!816880 () Bool)

(assert (=> b!1450705 (=> (not res!982021) (not e!816880))))

(declare-fun e!816881 () Bool)

(assert (=> b!1450705 (= res!982021 e!816881)))

(declare-fun c!133854 () Bool)

(assert (=> b!1450705 (= c!133854 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450706 () Bool)

(declare-fun e!816884 () Bool)

(declare-fun e!816883 () Bool)

(assert (=> b!1450706 (= e!816884 e!816883)))

(declare-fun res!982022 () Bool)

(assert (=> b!1450706 (=> res!982022 e!816883)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1450706 (= res!982022 (or (and (= (select (arr!47458 a!2862) index!646) (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47458 a!2862) index!646) (select (arr!47458 a!2862) j!93))) (not (= (select (arr!47458 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1450707 () Bool)

(declare-fun lt!636399 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11710 0))(
  ( (MissingZero!11710 (index!49232 (_ BitVec 32))) (Found!11710 (index!49233 (_ BitVec 32))) (Intermediate!11710 (undefined!12522 Bool) (index!49234 (_ BitVec 32)) (x!130887 (_ BitVec 32))) (Undefined!11710) (MissingVacant!11710 (index!49235 (_ BitVec 32))) )
))
(declare-fun lt!636405 () SeekEntryResult!11710)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98340 (_ BitVec 32)) SeekEntryResult!11710)

(assert (=> b!1450707 (= e!816881 (= lt!636405 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636399 lt!636400 mask!2687)))))

(declare-fun b!1450708 () Bool)

(declare-fun e!816875 () Bool)

(assert (=> b!1450708 (= e!816882 e!816875)))

(declare-fun res!982032 () Bool)

(assert (=> b!1450708 (=> (not res!982032) (not e!816875))))

(declare-fun lt!636403 () SeekEntryResult!11710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450708 (= res!982032 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47458 a!2862) j!93) mask!2687) (select (arr!47458 a!2862) j!93) a!2862 mask!2687) lt!636403))))

(assert (=> b!1450708 (= lt!636403 (Intermediate!11710 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!982017 () Bool)

(assert (=> start!124892 (=> (not res!982017) (not e!816876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124892 (= res!982017 (validMask!0 mask!2687))))

(assert (=> start!124892 e!816876))

(assert (=> start!124892 true))

(declare-fun array_inv!36486 (array!98340) Bool)

(assert (=> start!124892 (array_inv!36486 a!2862)))

(declare-fun b!1450709 () Bool)

(declare-fun res!982026 () Bool)

(assert (=> b!1450709 (=> (not res!982026) (not e!816876))))

(assert (=> b!1450709 (= res!982026 (and (= (size!48008 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48008 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48008 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450710 () Bool)

(assert (=> b!1450710 (= e!816875 e!816880)))

(declare-fun res!982016 () Bool)

(assert (=> b!1450710 (=> (not res!982016) (not e!816880))))

(assert (=> b!1450710 (= res!982016 (= lt!636405 (Intermediate!11710 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1450710 (= lt!636405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636399 mask!2687) lt!636399 lt!636400 mask!2687))))

(assert (=> b!1450710 (= lt!636399 (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!816879 () Bool)

(declare-fun b!1450711 () Bool)

(assert (=> b!1450711 (= e!816879 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450712 () Bool)

(declare-fun res!982030 () Bool)

(assert (=> b!1450712 (=> (not res!982030) (not e!816876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98340 (_ BitVec 32)) Bool)

(assert (=> b!1450712 (= res!982030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450713 () Bool)

(declare-fun res!982018 () Bool)

(assert (=> b!1450713 (=> (not res!982018) (not e!816875))))

(assert (=> b!1450713 (= res!982018 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47458 a!2862) j!93) a!2862 mask!2687) lt!636403))))

(declare-fun b!1450714 () Bool)

(declare-fun res!982025 () Bool)

(assert (=> b!1450714 (=> (not res!982025) (not e!816880))))

(assert (=> b!1450714 (= res!982025 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450715 () Bool)

(declare-fun res!982019 () Bool)

(assert (=> b!1450715 (=> (not res!982019) (not e!816876))))

(declare-datatypes ((List!33959 0))(
  ( (Nil!33956) (Cons!33955 (h!35305 (_ BitVec 64)) (t!48653 List!33959)) )
))
(declare-fun arrayNoDuplicates!0 (array!98340 (_ BitVec 32) List!33959) Bool)

(assert (=> b!1450715 (= res!982019 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33956))))

(declare-fun b!1450716 () Bool)

(declare-fun res!982033 () Bool)

(declare-fun e!816878 () Bool)

(assert (=> b!1450716 (=> res!982033 e!816878)))

(declare-fun lt!636402 () SeekEntryResult!11710)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98340 (_ BitVec 32)) SeekEntryResult!11710)

(assert (=> b!1450716 (= res!982033 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47458 a!2862) j!93) a!2862 mask!2687) lt!636402)))))

(declare-fun b!1450717 () Bool)

(assert (=> b!1450717 (= e!816878 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1450717 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636399 lt!636400 mask!2687) lt!636402)))

(declare-datatypes ((Unit!48916 0))(
  ( (Unit!48917) )
))
(declare-fun lt!636398 () Unit!48916)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48916)

(assert (=> b!1450717 (= lt!636398 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450718 () Bool)

(declare-fun res!982031 () Bool)

(assert (=> b!1450718 (=> (not res!982031) (not e!816876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450718 (= res!982031 (validKeyInArray!0 (select (arr!47458 a!2862) i!1006)))))

(declare-fun b!1450719 () Bool)

(assert (=> b!1450719 (= e!816883 e!816879)))

(declare-fun res!982023 () Bool)

(assert (=> b!1450719 (=> (not res!982023) (not e!816879))))

(declare-fun lt!636404 () SeekEntryResult!11710)

(assert (=> b!1450719 (= res!982023 (= lt!636404 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47458 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450720 () Bool)

(assert (=> b!1450720 (= e!816880 (not e!816878))))

(declare-fun res!982024 () Bool)

(assert (=> b!1450720 (=> res!982024 e!816878)))

(assert (=> b!1450720 (= res!982024 (or (and (= (select (arr!47458 a!2862) index!646) (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47458 a!2862) index!646) (select (arr!47458 a!2862) j!93))) (not (= (select (arr!47458 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450720 e!816884))

(declare-fun res!982020 () Bool)

(assert (=> b!1450720 (=> (not res!982020) (not e!816884))))

(assert (=> b!1450720 (= res!982020 (and (= lt!636404 lt!636402) (or (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) (select (arr!47458 a!2862) j!93)))))))

(assert (=> b!1450720 (= lt!636402 (Found!11710 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98340 (_ BitVec 32)) SeekEntryResult!11710)

(assert (=> b!1450720 (= lt!636404 (seekEntryOrOpen!0 (select (arr!47458 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450720 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636401 () Unit!48916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48916)

(assert (=> b!1450720 (= lt!636401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450721 () Bool)

(declare-fun res!982029 () Bool)

(assert (=> b!1450721 (=> (not res!982029) (not e!816876))))

(assert (=> b!1450721 (= res!982029 (validKeyInArray!0 (select (arr!47458 a!2862) j!93)))))

(declare-fun b!1450722 () Bool)

(assert (=> b!1450722 (= e!816881 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636399 lt!636400 mask!2687) (seekEntryOrOpen!0 lt!636399 lt!636400 mask!2687)))))

(assert (= (and start!124892 res!982017) b!1450709))

(assert (= (and b!1450709 res!982026) b!1450718))

(assert (= (and b!1450718 res!982031) b!1450721))

(assert (= (and b!1450721 res!982029) b!1450712))

(assert (= (and b!1450712 res!982030) b!1450715))

(assert (= (and b!1450715 res!982019) b!1450704))

(assert (= (and b!1450704 res!982027) b!1450703))

(assert (= (and b!1450703 res!982028) b!1450708))

(assert (= (and b!1450708 res!982032) b!1450713))

(assert (= (and b!1450713 res!982018) b!1450710))

(assert (= (and b!1450710 res!982016) b!1450705))

(assert (= (and b!1450705 c!133854) b!1450707))

(assert (= (and b!1450705 (not c!133854)) b!1450722))

(assert (= (and b!1450705 res!982021) b!1450714))

(assert (= (and b!1450714 res!982025) b!1450720))

(assert (= (and b!1450720 res!982020) b!1450706))

(assert (= (and b!1450706 (not res!982022)) b!1450719))

(assert (= (and b!1450719 res!982023) b!1450711))

(assert (= (and b!1450720 (not res!982024)) b!1450716))

(assert (= (and b!1450716 (not res!982033)) b!1450717))

(declare-fun m!1339331 () Bool)

(assert (=> b!1450720 m!1339331))

(declare-fun m!1339333 () Bool)

(assert (=> b!1450720 m!1339333))

(declare-fun m!1339335 () Bool)

(assert (=> b!1450720 m!1339335))

(declare-fun m!1339337 () Bool)

(assert (=> b!1450720 m!1339337))

(declare-fun m!1339339 () Bool)

(assert (=> b!1450720 m!1339339))

(declare-fun m!1339341 () Bool)

(assert (=> b!1450720 m!1339341))

(declare-fun m!1339343 () Bool)

(assert (=> b!1450720 m!1339343))

(declare-fun m!1339345 () Bool)

(assert (=> b!1450720 m!1339345))

(assert (=> b!1450720 m!1339341))

(assert (=> b!1450719 m!1339341))

(assert (=> b!1450719 m!1339341))

(declare-fun m!1339347 () Bool)

(assert (=> b!1450719 m!1339347))

(declare-fun m!1339349 () Bool)

(assert (=> start!124892 m!1339349))

(declare-fun m!1339351 () Bool)

(assert (=> start!124892 m!1339351))

(declare-fun m!1339353 () Bool)

(assert (=> b!1450715 m!1339353))

(assert (=> b!1450706 m!1339339))

(assert (=> b!1450706 m!1339333))

(assert (=> b!1450706 m!1339337))

(assert (=> b!1450706 m!1339341))

(declare-fun m!1339355 () Bool)

(assert (=> b!1450722 m!1339355))

(declare-fun m!1339357 () Bool)

(assert (=> b!1450722 m!1339357))

(declare-fun m!1339359 () Bool)

(assert (=> b!1450707 m!1339359))

(assert (=> b!1450717 m!1339355))

(declare-fun m!1339361 () Bool)

(assert (=> b!1450717 m!1339361))

(assert (=> b!1450713 m!1339341))

(assert (=> b!1450713 m!1339341))

(declare-fun m!1339363 () Bool)

(assert (=> b!1450713 m!1339363))

(assert (=> b!1450703 m!1339333))

(declare-fun m!1339365 () Bool)

(assert (=> b!1450703 m!1339365))

(declare-fun m!1339367 () Bool)

(assert (=> b!1450718 m!1339367))

(assert (=> b!1450718 m!1339367))

(declare-fun m!1339369 () Bool)

(assert (=> b!1450718 m!1339369))

(declare-fun m!1339371 () Bool)

(assert (=> b!1450710 m!1339371))

(assert (=> b!1450710 m!1339371))

(declare-fun m!1339373 () Bool)

(assert (=> b!1450710 m!1339373))

(assert (=> b!1450710 m!1339333))

(declare-fun m!1339375 () Bool)

(assert (=> b!1450710 m!1339375))

(assert (=> b!1450716 m!1339341))

(assert (=> b!1450716 m!1339341))

(declare-fun m!1339377 () Bool)

(assert (=> b!1450716 m!1339377))

(assert (=> b!1450721 m!1339341))

(assert (=> b!1450721 m!1339341))

(declare-fun m!1339379 () Bool)

(assert (=> b!1450721 m!1339379))

(declare-fun m!1339381 () Bool)

(assert (=> b!1450712 m!1339381))

(assert (=> b!1450708 m!1339341))

(assert (=> b!1450708 m!1339341))

(declare-fun m!1339383 () Bool)

(assert (=> b!1450708 m!1339383))

(assert (=> b!1450708 m!1339383))

(assert (=> b!1450708 m!1339341))

(declare-fun m!1339385 () Bool)

(assert (=> b!1450708 m!1339385))

(push 1)

