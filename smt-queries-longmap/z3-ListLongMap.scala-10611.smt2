; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124806 () Bool)

(assert start!124806)

(declare-datatypes ((SeekEntryResult!11667 0))(
  ( (MissingZero!11667 (index!49060 (_ BitVec 32))) (Found!11667 (index!49061 (_ BitVec 32))) (Intermediate!11667 (undefined!12479 Bool) (index!49062 (_ BitVec 32)) (x!130732 (_ BitVec 32))) (Undefined!11667) (MissingVacant!11667 (index!49063 (_ BitVec 32))) )
))
(declare-fun lt!635444 () SeekEntryResult!11667)

(declare-fun b!1448199 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98254 0))(
  ( (array!98255 (arr!47415 (Array (_ BitVec 32) (_ BitVec 64))) (size!47965 (_ BitVec 32))) )
))
(declare-fun lt!635445 () array!98254)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635443 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!815593 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98254 (_ BitVec 32)) SeekEntryResult!11667)

(assert (=> b!1448199 (= e!815593 (= lt!635444 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635443 lt!635445 mask!2687)))))

(declare-fun b!1448200 () Bool)

(declare-fun e!815590 () Bool)

(declare-fun e!815592 () Bool)

(assert (=> b!1448200 (= e!815590 e!815592)))

(declare-fun res!979782 () Bool)

(assert (=> b!1448200 (=> (not res!979782) (not e!815592))))

(declare-fun lt!635442 () SeekEntryResult!11667)

(declare-fun a!2862 () array!98254)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98254 (_ BitVec 32)) SeekEntryResult!11667)

(assert (=> b!1448200 (= res!979782 (= lt!635442 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47415 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448201 () Bool)

(declare-fun res!979770 () Bool)

(declare-fun e!815587 () Bool)

(assert (=> b!1448201 (=> (not res!979770) (not e!815587))))

(declare-datatypes ((List!33916 0))(
  ( (Nil!33913) (Cons!33912 (h!35262 (_ BitVec 64)) (t!48610 List!33916)) )
))
(declare-fun arrayNoDuplicates!0 (array!98254 (_ BitVec 32) List!33916) Bool)

(assert (=> b!1448201 (= res!979770 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33913))))

(declare-fun b!1448202 () Bool)

(declare-fun e!815594 () Bool)

(assert (=> b!1448202 (= e!815587 e!815594)))

(declare-fun res!979773 () Bool)

(assert (=> b!1448202 (=> (not res!979773) (not e!815594))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448202 (= res!979773 (= (select (store (arr!47415 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448202 (= lt!635445 (array!98255 (store (arr!47415 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47965 a!2862)))))

(declare-fun b!1448203 () Bool)

(declare-fun res!979784 () Bool)

(declare-fun e!815589 () Bool)

(assert (=> b!1448203 (=> (not res!979784) (not e!815589))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448203 (= res!979784 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448204 () Bool)

(declare-fun res!979774 () Bool)

(assert (=> b!1448204 (=> (not res!979774) (not e!815587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448204 (= res!979774 (validKeyInArray!0 (select (arr!47415 a!2862) i!1006)))))

(declare-fun b!1448205 () Bool)

(declare-fun e!815591 () Bool)

(assert (=> b!1448205 (= e!815591 e!815590)))

(declare-fun res!979776 () Bool)

(assert (=> b!1448205 (=> res!979776 e!815590)))

(assert (=> b!1448205 (= res!979776 (or (and (= (select (arr!47415 a!2862) index!646) (select (store (arr!47415 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47415 a!2862) index!646) (select (arr!47415 a!2862) j!93))) (not (= (select (arr!47415 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448206 () Bool)

(declare-fun res!979785 () Bool)

(assert (=> b!1448206 (=> (not res!979785) (not e!815587))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448206 (= res!979785 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47965 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47965 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47965 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448207 () Bool)

(declare-fun e!815588 () Bool)

(assert (=> b!1448207 (= e!815594 e!815588)))

(declare-fun res!979780 () Bool)

(assert (=> b!1448207 (=> (not res!979780) (not e!815588))))

(declare-fun lt!635448 () SeekEntryResult!11667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448207 (= res!979780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47415 a!2862) j!93) mask!2687) (select (arr!47415 a!2862) j!93) a!2862 mask!2687) lt!635448))))

(assert (=> b!1448207 (= lt!635448 (Intermediate!11667 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448208 () Bool)

(declare-fun res!979778 () Bool)

(assert (=> b!1448208 (=> (not res!979778) (not e!815587))))

(assert (=> b!1448208 (= res!979778 (validKeyInArray!0 (select (arr!47415 a!2862) j!93)))))

(declare-fun b!1448209 () Bool)

(declare-fun res!979786 () Bool)

(assert (=> b!1448209 (=> (not res!979786) (not e!815588))))

(assert (=> b!1448209 (= res!979786 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47415 a!2862) j!93) a!2862 mask!2687) lt!635448))))

(declare-fun b!1448210 () Bool)

(declare-fun e!815586 () Bool)

(assert (=> b!1448210 (= e!815589 (not e!815586))))

(declare-fun res!979783 () Bool)

(assert (=> b!1448210 (=> res!979783 e!815586)))

(assert (=> b!1448210 (= res!979783 (or (and (= (select (arr!47415 a!2862) index!646) (select (store (arr!47415 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47415 a!2862) index!646) (select (arr!47415 a!2862) j!93))) (not (= (select (arr!47415 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47415 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448210 e!815591))

(declare-fun res!979772 () Bool)

(assert (=> b!1448210 (=> (not res!979772) (not e!815591))))

(assert (=> b!1448210 (= res!979772 (and (= lt!635442 (Found!11667 j!93)) (or (= (select (arr!47415 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47415 a!2862) intermediateBeforeIndex!19) (select (arr!47415 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98254 (_ BitVec 32)) SeekEntryResult!11667)

(assert (=> b!1448210 (= lt!635442 (seekEntryOrOpen!0 (select (arr!47415 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98254 (_ BitVec 32)) Bool)

(assert (=> b!1448210 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48830 0))(
  ( (Unit!48831) )
))
(declare-fun lt!635446 () Unit!48830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48830)

(assert (=> b!1448210 (= lt!635446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448211 () Bool)

(declare-fun res!979771 () Bool)

(assert (=> b!1448211 (=> (not res!979771) (not e!815587))))

(assert (=> b!1448211 (= res!979771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448212 () Bool)

(assert (=> b!1448212 (= e!815588 e!815589)))

(declare-fun res!979777 () Bool)

(assert (=> b!1448212 (=> (not res!979777) (not e!815589))))

(assert (=> b!1448212 (= res!979777 (= lt!635444 (Intermediate!11667 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448212 (= lt!635444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635443 mask!2687) lt!635443 lt!635445 mask!2687))))

(assert (=> b!1448212 (= lt!635443 (select (store (arr!47415 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448213 () Bool)

(declare-fun res!979779 () Bool)

(assert (=> b!1448213 (=> (not res!979779) (not e!815587))))

(assert (=> b!1448213 (= res!979779 (and (= (size!47965 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47965 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47965 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448214 () Bool)

(assert (=> b!1448214 (= e!815586 true)))

(declare-fun lt!635447 () SeekEntryResult!11667)

(assert (=> b!1448214 (= lt!635447 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47415 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448215 () Bool)

(assert (=> b!1448215 (= e!815593 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635443 lt!635445 mask!2687) (seekEntryOrOpen!0 lt!635443 lt!635445 mask!2687)))))

(declare-fun b!1448216 () Bool)

(declare-fun res!979781 () Bool)

(assert (=> b!1448216 (=> (not res!979781) (not e!815589))))

(assert (=> b!1448216 (= res!979781 e!815593)))

(declare-fun c!133725 () Bool)

(assert (=> b!1448216 (= c!133725 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!979775 () Bool)

(assert (=> start!124806 (=> (not res!979775) (not e!815587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124806 (= res!979775 (validMask!0 mask!2687))))

(assert (=> start!124806 e!815587))

(assert (=> start!124806 true))

(declare-fun array_inv!36443 (array!98254) Bool)

(assert (=> start!124806 (array_inv!36443 a!2862)))

(declare-fun b!1448217 () Bool)

(assert (=> b!1448217 (= e!815592 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124806 res!979775) b!1448213))

(assert (= (and b!1448213 res!979779) b!1448204))

(assert (= (and b!1448204 res!979774) b!1448208))

(assert (= (and b!1448208 res!979778) b!1448211))

(assert (= (and b!1448211 res!979771) b!1448201))

(assert (= (and b!1448201 res!979770) b!1448206))

(assert (= (and b!1448206 res!979785) b!1448202))

(assert (= (and b!1448202 res!979773) b!1448207))

(assert (= (and b!1448207 res!979780) b!1448209))

(assert (= (and b!1448209 res!979786) b!1448212))

(assert (= (and b!1448212 res!979777) b!1448216))

(assert (= (and b!1448216 c!133725) b!1448199))

(assert (= (and b!1448216 (not c!133725)) b!1448215))

(assert (= (and b!1448216 res!979781) b!1448203))

(assert (= (and b!1448203 res!979784) b!1448210))

(assert (= (and b!1448210 res!979772) b!1448205))

(assert (= (and b!1448205 (not res!979776)) b!1448200))

(assert (= (and b!1448200 res!979782) b!1448217))

(assert (= (and b!1448210 (not res!979783)) b!1448214))

(declare-fun m!1336975 () Bool)

(assert (=> b!1448211 m!1336975))

(declare-fun m!1336977 () Bool)

(assert (=> b!1448202 m!1336977))

(declare-fun m!1336979 () Bool)

(assert (=> b!1448202 m!1336979))

(declare-fun m!1336981 () Bool)

(assert (=> b!1448214 m!1336981))

(assert (=> b!1448214 m!1336981))

(declare-fun m!1336983 () Bool)

(assert (=> b!1448214 m!1336983))

(assert (=> b!1448207 m!1336981))

(assert (=> b!1448207 m!1336981))

(declare-fun m!1336985 () Bool)

(assert (=> b!1448207 m!1336985))

(assert (=> b!1448207 m!1336985))

(assert (=> b!1448207 m!1336981))

(declare-fun m!1336987 () Bool)

(assert (=> b!1448207 m!1336987))

(assert (=> b!1448209 m!1336981))

(assert (=> b!1448209 m!1336981))

(declare-fun m!1336989 () Bool)

(assert (=> b!1448209 m!1336989))

(declare-fun m!1336991 () Bool)

(assert (=> b!1448205 m!1336991))

(assert (=> b!1448205 m!1336977))

(declare-fun m!1336993 () Bool)

(assert (=> b!1448205 m!1336993))

(assert (=> b!1448205 m!1336981))

(declare-fun m!1336995 () Bool)

(assert (=> start!124806 m!1336995))

(declare-fun m!1336997 () Bool)

(assert (=> start!124806 m!1336997))

(declare-fun m!1336999 () Bool)

(assert (=> b!1448210 m!1336999))

(assert (=> b!1448210 m!1336977))

(declare-fun m!1337001 () Bool)

(assert (=> b!1448210 m!1337001))

(assert (=> b!1448210 m!1336993))

(assert (=> b!1448210 m!1336991))

(assert (=> b!1448210 m!1336981))

(declare-fun m!1337003 () Bool)

(assert (=> b!1448210 m!1337003))

(declare-fun m!1337005 () Bool)

(assert (=> b!1448210 m!1337005))

(assert (=> b!1448210 m!1336981))

(assert (=> b!1448200 m!1336981))

(assert (=> b!1448200 m!1336981))

(declare-fun m!1337007 () Bool)

(assert (=> b!1448200 m!1337007))

(declare-fun m!1337009 () Bool)

(assert (=> b!1448215 m!1337009))

(declare-fun m!1337011 () Bool)

(assert (=> b!1448215 m!1337011))

(declare-fun m!1337013 () Bool)

(assert (=> b!1448212 m!1337013))

(assert (=> b!1448212 m!1337013))

(declare-fun m!1337015 () Bool)

(assert (=> b!1448212 m!1337015))

(assert (=> b!1448212 m!1336977))

(declare-fun m!1337017 () Bool)

(assert (=> b!1448212 m!1337017))

(declare-fun m!1337019 () Bool)

(assert (=> b!1448201 m!1337019))

(declare-fun m!1337021 () Bool)

(assert (=> b!1448204 m!1337021))

(assert (=> b!1448204 m!1337021))

(declare-fun m!1337023 () Bool)

(assert (=> b!1448204 m!1337023))

(assert (=> b!1448208 m!1336981))

(assert (=> b!1448208 m!1336981))

(declare-fun m!1337025 () Bool)

(assert (=> b!1448208 m!1337025))

(declare-fun m!1337027 () Bool)

(assert (=> b!1448199 m!1337027))

(check-sat (not b!1448207) (not b!1448201) (not b!1448208) (not b!1448210) (not b!1448204) (not b!1448209) (not b!1448214) (not b!1448212) (not start!124806) (not b!1448215) (not b!1448211) (not b!1448200) (not b!1448199))
(check-sat)
