; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124572 () Bool)

(assert start!124572)

(declare-fun b!1441987 () Bool)

(declare-fun res!974266 () Bool)

(declare-fun e!812795 () Bool)

(assert (=> b!1441987 (=> (not res!974266) (not e!812795))))

(declare-datatypes ((array!98020 0))(
  ( (array!98021 (arr!47298 (Array (_ BitVec 32) (_ BitVec 64))) (size!47848 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98020)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441987 (= res!974266 (validKeyInArray!0 (select (arr!47298 a!2862) i!1006)))))

(declare-fun b!1441988 () Bool)

(declare-fun e!812794 () Bool)

(declare-fun e!812797 () Bool)

(assert (=> b!1441988 (= e!812794 e!812797)))

(declare-fun res!974271 () Bool)

(assert (=> b!1441988 (=> (not res!974271) (not e!812797))))

(declare-datatypes ((SeekEntryResult!11550 0))(
  ( (MissingZero!11550 (index!48592 (_ BitVec 32))) (Found!11550 (index!48593 (_ BitVec 32))) (Intermediate!11550 (undefined!12362 Bool) (index!48594 (_ BitVec 32)) (x!130303 (_ BitVec 32))) (Undefined!11550) (MissingVacant!11550 (index!48595 (_ BitVec 32))) )
))
(declare-fun lt!633427 () SeekEntryResult!11550)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98020 (_ BitVec 32)) SeekEntryResult!11550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441988 (= res!974271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47298 a!2862) j!93) mask!2687) (select (arr!47298 a!2862) j!93) a!2862 mask!2687) lt!633427))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441988 (= lt!633427 (Intermediate!11550 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441989 () Bool)

(declare-fun e!812796 () Bool)

(assert (=> b!1441989 (= e!812797 e!812796)))

(declare-fun res!974265 () Bool)

(assert (=> b!1441989 (=> (not res!974265) (not e!812796))))

(declare-fun lt!633425 () SeekEntryResult!11550)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441989 (= res!974265 (= lt!633425 (Intermediate!11550 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633428 () array!98020)

(declare-fun lt!633429 () (_ BitVec 64))

(assert (=> b!1441989 (= lt!633425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633429 mask!2687) lt!633429 lt!633428 mask!2687))))

(assert (=> b!1441989 (= lt!633429 (select (store (arr!47298 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441990 () Bool)

(declare-fun res!974264 () Bool)

(assert (=> b!1441990 (=> (not res!974264) (not e!812795))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441990 (= res!974264 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47848 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47848 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47848 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441991 () Bool)

(declare-fun e!812798 () Bool)

(assert (=> b!1441991 (= e!812798 (= lt!633425 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633429 lt!633428 mask!2687)))))

(declare-fun b!1441992 () Bool)

(declare-fun res!974269 () Bool)

(assert (=> b!1441992 (=> (not res!974269) (not e!812796))))

(assert (=> b!1441992 (= res!974269 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441993 () Bool)

(assert (=> b!1441993 (= e!812796 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98020 (_ BitVec 32)) Bool)

(assert (=> b!1441993 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48596 0))(
  ( (Unit!48597) )
))
(declare-fun lt!633426 () Unit!48596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48596)

(assert (=> b!1441993 (= lt!633426 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441995 () Bool)

(declare-fun res!974260 () Bool)

(assert (=> b!1441995 (=> (not res!974260) (not e!812797))))

(assert (=> b!1441995 (= res!974260 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47298 a!2862) j!93) a!2862 mask!2687) lt!633427))))

(declare-fun b!1441996 () Bool)

(declare-fun res!974270 () Bool)

(assert (=> b!1441996 (=> (not res!974270) (not e!812795))))

(assert (=> b!1441996 (= res!974270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441997 () Bool)

(declare-fun res!974272 () Bool)

(assert (=> b!1441997 (=> (not res!974272) (not e!812795))))

(assert (=> b!1441997 (= res!974272 (and (= (size!47848 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47848 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47848 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441998 () Bool)

(declare-fun res!974262 () Bool)

(assert (=> b!1441998 (=> (not res!974262) (not e!812796))))

(assert (=> b!1441998 (= res!974262 e!812798)))

(declare-fun c!133374 () Bool)

(assert (=> b!1441998 (= c!133374 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441999 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98020 (_ BitVec 32)) SeekEntryResult!11550)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98020 (_ BitVec 32)) SeekEntryResult!11550)

(assert (=> b!1441999 (= e!812798 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633429 lt!633428 mask!2687) (seekEntryOrOpen!0 lt!633429 lt!633428 mask!2687)))))

(declare-fun b!1442000 () Bool)

(declare-fun res!974261 () Bool)

(assert (=> b!1442000 (=> (not res!974261) (not e!812795))))

(declare-datatypes ((List!33799 0))(
  ( (Nil!33796) (Cons!33795 (h!35145 (_ BitVec 64)) (t!48493 List!33799)) )
))
(declare-fun arrayNoDuplicates!0 (array!98020 (_ BitVec 32) List!33799) Bool)

(assert (=> b!1442000 (= res!974261 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33796))))

(declare-fun b!1442001 () Bool)

(declare-fun res!974267 () Bool)

(assert (=> b!1442001 (=> (not res!974267) (not e!812795))))

(assert (=> b!1442001 (= res!974267 (validKeyInArray!0 (select (arr!47298 a!2862) j!93)))))

(declare-fun b!1441994 () Bool)

(assert (=> b!1441994 (= e!812795 e!812794)))

(declare-fun res!974268 () Bool)

(assert (=> b!1441994 (=> (not res!974268) (not e!812794))))

(assert (=> b!1441994 (= res!974268 (= (select (store (arr!47298 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441994 (= lt!633428 (array!98021 (store (arr!47298 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47848 a!2862)))))

(declare-fun res!974263 () Bool)

(assert (=> start!124572 (=> (not res!974263) (not e!812795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124572 (= res!974263 (validMask!0 mask!2687))))

(assert (=> start!124572 e!812795))

(assert (=> start!124572 true))

(declare-fun array_inv!36326 (array!98020) Bool)

(assert (=> start!124572 (array_inv!36326 a!2862)))

(assert (= (and start!124572 res!974263) b!1441997))

(assert (= (and b!1441997 res!974272) b!1441987))

(assert (= (and b!1441987 res!974266) b!1442001))

(assert (= (and b!1442001 res!974267) b!1441996))

(assert (= (and b!1441996 res!974270) b!1442000))

(assert (= (and b!1442000 res!974261) b!1441990))

(assert (= (and b!1441990 res!974264) b!1441994))

(assert (= (and b!1441994 res!974268) b!1441988))

(assert (= (and b!1441988 res!974271) b!1441995))

(assert (= (and b!1441995 res!974260) b!1441989))

(assert (= (and b!1441989 res!974265) b!1441998))

(assert (= (and b!1441998 c!133374) b!1441991))

(assert (= (and b!1441998 (not c!133374)) b!1441999))

(assert (= (and b!1441998 res!974262) b!1441992))

(assert (= (and b!1441992 res!974269) b!1441993))

(declare-fun m!1331173 () Bool)

(assert (=> b!1441995 m!1331173))

(assert (=> b!1441995 m!1331173))

(declare-fun m!1331175 () Bool)

(assert (=> b!1441995 m!1331175))

(declare-fun m!1331177 () Bool)

(assert (=> b!1441996 m!1331177))

(declare-fun m!1331179 () Bool)

(assert (=> b!1441994 m!1331179))

(declare-fun m!1331181 () Bool)

(assert (=> b!1441994 m!1331181))

(declare-fun m!1331183 () Bool)

(assert (=> start!124572 m!1331183))

(declare-fun m!1331185 () Bool)

(assert (=> start!124572 m!1331185))

(declare-fun m!1331187 () Bool)

(assert (=> b!1441991 m!1331187))

(declare-fun m!1331189 () Bool)

(assert (=> b!1441987 m!1331189))

(assert (=> b!1441987 m!1331189))

(declare-fun m!1331191 () Bool)

(assert (=> b!1441987 m!1331191))

(declare-fun m!1331193 () Bool)

(assert (=> b!1441989 m!1331193))

(assert (=> b!1441989 m!1331193))

(declare-fun m!1331195 () Bool)

(assert (=> b!1441989 m!1331195))

(assert (=> b!1441989 m!1331179))

(declare-fun m!1331197 () Bool)

(assert (=> b!1441989 m!1331197))

(assert (=> b!1442001 m!1331173))

(assert (=> b!1442001 m!1331173))

(declare-fun m!1331199 () Bool)

(assert (=> b!1442001 m!1331199))

(declare-fun m!1331201 () Bool)

(assert (=> b!1441993 m!1331201))

(declare-fun m!1331203 () Bool)

(assert (=> b!1441993 m!1331203))

(declare-fun m!1331205 () Bool)

(assert (=> b!1442000 m!1331205))

(declare-fun m!1331207 () Bool)

(assert (=> b!1441999 m!1331207))

(declare-fun m!1331209 () Bool)

(assert (=> b!1441999 m!1331209))

(assert (=> b!1441988 m!1331173))

(assert (=> b!1441988 m!1331173))

(declare-fun m!1331211 () Bool)

(assert (=> b!1441988 m!1331211))

(assert (=> b!1441988 m!1331211))

(assert (=> b!1441988 m!1331173))

(declare-fun m!1331213 () Bool)

(assert (=> b!1441988 m!1331213))

(check-sat (not b!1441991) (not b!1441999) (not b!1441995) (not b!1442001) (not b!1442000) (not b!1441993) (not b!1441988) (not b!1441996) (not b!1441989) (not start!124572) (not b!1441987))
(check-sat)
