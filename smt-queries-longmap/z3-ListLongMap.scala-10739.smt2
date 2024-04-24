; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125850 () Bool)

(assert start!125850)

(declare-fun b!1470988 () Bool)

(declare-fun res!998411 () Bool)

(declare-fun e!825944 () Bool)

(assert (=> b!1470988 (=> (not res!998411) (not e!825944))))

(declare-datatypes ((array!99136 0))(
  ( (array!99137 (arr!47851 (Array (_ BitVec 32) (_ BitVec 64))) (size!48402 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99136)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470988 (= res!998411 (validKeyInArray!0 (select (arr!47851 a!2862) i!1006)))))

(declare-fun b!1470989 () Bool)

(declare-fun e!825943 () Bool)

(assert (=> b!1470989 (= e!825943 false)))

(declare-fun lt!643139 () Bool)

(declare-fun e!825947 () Bool)

(assert (=> b!1470989 (= lt!643139 e!825947)))

(declare-fun c!135811 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470989 (= c!135811 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470990 () Bool)

(declare-fun res!998409 () Bool)

(declare-fun e!825948 () Bool)

(assert (=> b!1470990 (=> (not res!998409) (not e!825948))))

(declare-datatypes ((SeekEntryResult!11988 0))(
  ( (MissingZero!11988 (index!50344 (_ BitVec 32))) (Found!11988 (index!50345 (_ BitVec 32))) (Intermediate!11988 (undefined!12800 Bool) (index!50346 (_ BitVec 32)) (x!132110 (_ BitVec 32))) (Undefined!11988) (MissingVacant!11988 (index!50347 (_ BitVec 32))) )
))
(declare-fun lt!643140 () SeekEntryResult!11988)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99136 (_ BitVec 32)) SeekEntryResult!11988)

(assert (=> b!1470990 (= res!998409 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47851 a!2862) j!93) a!2862 mask!2687) lt!643140))))

(declare-fun lt!643137 () (_ BitVec 64))

(declare-fun lt!643141 () array!99136)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1470991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99136 (_ BitVec 32)) SeekEntryResult!11988)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99136 (_ BitVec 32)) SeekEntryResult!11988)

(assert (=> b!1470991 (= e!825947 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643137 lt!643141 mask!2687) (seekEntryOrOpen!0 lt!643137 lt!643141 mask!2687))))))

(declare-fun b!1470992 () Bool)

(assert (=> b!1470992 (= e!825948 e!825943)))

(declare-fun res!998407 () Bool)

(assert (=> b!1470992 (=> (not res!998407) (not e!825943))))

(declare-fun lt!643138 () SeekEntryResult!11988)

(assert (=> b!1470992 (= res!998407 (= lt!643138 (Intermediate!11988 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470992 (= lt!643138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643137 mask!2687) lt!643137 lt!643141 mask!2687))))

(assert (=> b!1470992 (= lt!643137 (select (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470993 () Bool)

(assert (=> b!1470993 (= e!825947 (not (= lt!643138 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643137 lt!643141 mask!2687))))))

(declare-fun b!1470994 () Bool)

(declare-fun res!998415 () Bool)

(assert (=> b!1470994 (=> (not res!998415) (not e!825944))))

(assert (=> b!1470994 (= res!998415 (validKeyInArray!0 (select (arr!47851 a!2862) j!93)))))

(declare-fun b!1470995 () Bool)

(declare-fun res!998410 () Bool)

(assert (=> b!1470995 (=> (not res!998410) (not e!825944))))

(declare-datatypes ((List!34339 0))(
  ( (Nil!34336) (Cons!34335 (h!35699 (_ BitVec 64)) (t!49025 List!34339)) )
))
(declare-fun arrayNoDuplicates!0 (array!99136 (_ BitVec 32) List!34339) Bool)

(assert (=> b!1470995 (= res!998410 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34336))))

(declare-fun res!998416 () Bool)

(assert (=> start!125850 (=> (not res!998416) (not e!825944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125850 (= res!998416 (validMask!0 mask!2687))))

(assert (=> start!125850 e!825944))

(assert (=> start!125850 true))

(declare-fun array_inv!37132 (array!99136) Bool)

(assert (=> start!125850 (array_inv!37132 a!2862)))

(declare-fun b!1470996 () Bool)

(declare-fun e!825945 () Bool)

(assert (=> b!1470996 (= e!825945 e!825948)))

(declare-fun res!998408 () Bool)

(assert (=> b!1470996 (=> (not res!998408) (not e!825948))))

(assert (=> b!1470996 (= res!998408 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47851 a!2862) j!93) mask!2687) (select (arr!47851 a!2862) j!93) a!2862 mask!2687) lt!643140))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470996 (= lt!643140 (Intermediate!11988 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470997 () Bool)

(assert (=> b!1470997 (= e!825944 e!825945)))

(declare-fun res!998413 () Bool)

(assert (=> b!1470997 (=> (not res!998413) (not e!825945))))

(assert (=> b!1470997 (= res!998413 (= (select (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470997 (= lt!643141 (array!99137 (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48402 a!2862)))))

(declare-fun b!1470998 () Bool)

(declare-fun res!998414 () Bool)

(assert (=> b!1470998 (=> (not res!998414) (not e!825944))))

(assert (=> b!1470998 (= res!998414 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48402 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48402 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48402 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470999 () Bool)

(declare-fun res!998417 () Bool)

(assert (=> b!1470999 (=> (not res!998417) (not e!825944))))

(assert (=> b!1470999 (= res!998417 (and (= (size!48402 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48402 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48402 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471000 () Bool)

(declare-fun res!998412 () Bool)

(assert (=> b!1471000 (=> (not res!998412) (not e!825944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99136 (_ BitVec 32)) Bool)

(assert (=> b!1471000 (= res!998412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125850 res!998416) b!1470999))

(assert (= (and b!1470999 res!998417) b!1470988))

(assert (= (and b!1470988 res!998411) b!1470994))

(assert (= (and b!1470994 res!998415) b!1471000))

(assert (= (and b!1471000 res!998412) b!1470995))

(assert (= (and b!1470995 res!998410) b!1470998))

(assert (= (and b!1470998 res!998414) b!1470997))

(assert (= (and b!1470997 res!998413) b!1470996))

(assert (= (and b!1470996 res!998408) b!1470990))

(assert (= (and b!1470990 res!998409) b!1470992))

(assert (= (and b!1470992 res!998407) b!1470989))

(assert (= (and b!1470989 c!135811) b!1470993))

(assert (= (and b!1470989 (not c!135811)) b!1470991))

(declare-fun m!1358149 () Bool)

(assert (=> b!1471000 m!1358149))

(declare-fun m!1358151 () Bool)

(assert (=> b!1470991 m!1358151))

(declare-fun m!1358153 () Bool)

(assert (=> b!1470991 m!1358153))

(declare-fun m!1358155 () Bool)

(assert (=> b!1470996 m!1358155))

(assert (=> b!1470996 m!1358155))

(declare-fun m!1358157 () Bool)

(assert (=> b!1470996 m!1358157))

(assert (=> b!1470996 m!1358157))

(assert (=> b!1470996 m!1358155))

(declare-fun m!1358159 () Bool)

(assert (=> b!1470996 m!1358159))

(declare-fun m!1358161 () Bool)

(assert (=> b!1470993 m!1358161))

(declare-fun m!1358163 () Bool)

(assert (=> b!1470988 m!1358163))

(assert (=> b!1470988 m!1358163))

(declare-fun m!1358165 () Bool)

(assert (=> b!1470988 m!1358165))

(declare-fun m!1358167 () Bool)

(assert (=> b!1470997 m!1358167))

(declare-fun m!1358169 () Bool)

(assert (=> b!1470997 m!1358169))

(declare-fun m!1358171 () Bool)

(assert (=> start!125850 m!1358171))

(declare-fun m!1358173 () Bool)

(assert (=> start!125850 m!1358173))

(assert (=> b!1470994 m!1358155))

(assert (=> b!1470994 m!1358155))

(declare-fun m!1358175 () Bool)

(assert (=> b!1470994 m!1358175))

(declare-fun m!1358177 () Bool)

(assert (=> b!1470995 m!1358177))

(declare-fun m!1358179 () Bool)

(assert (=> b!1470992 m!1358179))

(assert (=> b!1470992 m!1358179))

(declare-fun m!1358181 () Bool)

(assert (=> b!1470992 m!1358181))

(assert (=> b!1470992 m!1358167))

(declare-fun m!1358183 () Bool)

(assert (=> b!1470992 m!1358183))

(assert (=> b!1470990 m!1358155))

(assert (=> b!1470990 m!1358155))

(declare-fun m!1358185 () Bool)

(assert (=> b!1470990 m!1358185))

(check-sat (not b!1471000) (not b!1470988) (not start!125850) (not b!1470992) (not b!1470994) (not b!1470995) (not b!1470996) (not b!1470990) (not b!1470993) (not b!1470991))
(check-sat)
