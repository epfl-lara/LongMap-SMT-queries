; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124310 () Bool)

(assert start!124310)

(declare-fun b!1438495 () Bool)

(declare-fun res!971170 () Bool)

(declare-fun e!811435 () Bool)

(assert (=> b!1438495 (=> (not res!971170) (not e!811435))))

(declare-datatypes ((array!97775 0))(
  ( (array!97776 (arr!47178 (Array (_ BitVec 32) (_ BitVec 64))) (size!47730 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97775)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97775 (_ BitVec 32)) Bool)

(assert (=> b!1438495 (= res!971170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438496 () Bool)

(declare-fun e!811436 () Bool)

(assert (=> b!1438496 (= e!811436 false)))

(declare-datatypes ((SeekEntryResult!11455 0))(
  ( (MissingZero!11455 (index!48212 (_ BitVec 32))) (Found!11455 (index!48213 (_ BitVec 32))) (Intermediate!11455 (undefined!12267 Bool) (index!48214 (_ BitVec 32)) (x!129941 (_ BitVec 32))) (Undefined!11455) (MissingVacant!11455 (index!48215 (_ BitVec 32))) )
))
(declare-fun lt!632400 () SeekEntryResult!11455)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97775 (_ BitVec 32)) SeekEntryResult!11455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438496 (= lt!632400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97776 (store (arr!47178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47730 a!2862)) mask!2687))))

(declare-fun b!1438498 () Bool)

(declare-fun res!971164 () Bool)

(assert (=> b!1438498 (=> (not res!971164) (not e!811435))))

(assert (=> b!1438498 (= res!971164 (and (= (size!47730 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47730 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47730 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438499 () Bool)

(declare-fun res!971167 () Bool)

(assert (=> b!1438499 (=> (not res!971167) (not e!811435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438499 (= res!971167 (validKeyInArray!0 (select (arr!47178 a!2862) j!93)))))

(declare-fun b!1438500 () Bool)

(declare-fun res!971163 () Bool)

(assert (=> b!1438500 (=> (not res!971163) (not e!811435))))

(declare-datatypes ((List!33757 0))(
  ( (Nil!33754) (Cons!33753 (h!35100 (_ BitVec 64)) (t!48443 List!33757)) )
))
(declare-fun arrayNoDuplicates!0 (array!97775 (_ BitVec 32) List!33757) Bool)

(assert (=> b!1438500 (= res!971163 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33754))))

(declare-fun b!1438501 () Bool)

(declare-fun res!971162 () Bool)

(assert (=> b!1438501 (=> (not res!971162) (not e!811435))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438501 (= res!971162 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47730 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47730 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47730 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!971166 () Bool)

(assert (=> start!124310 (=> (not res!971166) (not e!811435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124310 (= res!971166 (validMask!0 mask!2687))))

(assert (=> start!124310 e!811435))

(assert (=> start!124310 true))

(declare-fun array_inv!36411 (array!97775) Bool)

(assert (=> start!124310 (array_inv!36411 a!2862)))

(declare-fun b!1438497 () Bool)

(assert (=> b!1438497 (= e!811435 e!811436)))

(declare-fun res!971165 () Bool)

(assert (=> b!1438497 (=> (not res!971165) (not e!811436))))

(declare-fun lt!632399 () SeekEntryResult!11455)

(assert (=> b!1438497 (= res!971165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47178 a!2862) j!93) mask!2687) (select (arr!47178 a!2862) j!93) a!2862 mask!2687) lt!632399))))

(assert (=> b!1438497 (= lt!632399 (Intermediate!11455 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438502 () Bool)

(declare-fun res!971168 () Bool)

(assert (=> b!1438502 (=> (not res!971168) (not e!811435))))

(assert (=> b!1438502 (= res!971168 (validKeyInArray!0 (select (arr!47178 a!2862) i!1006)))))

(declare-fun b!1438503 () Bool)

(declare-fun res!971169 () Bool)

(assert (=> b!1438503 (=> (not res!971169) (not e!811436))))

(assert (=> b!1438503 (= res!971169 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47178 a!2862) j!93) a!2862 mask!2687) lt!632399))))

(assert (= (and start!124310 res!971166) b!1438498))

(assert (= (and b!1438498 res!971164) b!1438502))

(assert (= (and b!1438502 res!971168) b!1438499))

(assert (= (and b!1438499 res!971167) b!1438495))

(assert (= (and b!1438495 res!971170) b!1438500))

(assert (= (and b!1438500 res!971163) b!1438501))

(assert (= (and b!1438501 res!971162) b!1438497))

(assert (= (and b!1438497 res!971165) b!1438503))

(assert (= (and b!1438503 res!971169) b!1438496))

(declare-fun m!1327123 () Bool)

(assert (=> b!1438496 m!1327123))

(declare-fun m!1327125 () Bool)

(assert (=> b!1438496 m!1327125))

(assert (=> b!1438496 m!1327125))

(declare-fun m!1327127 () Bool)

(assert (=> b!1438496 m!1327127))

(assert (=> b!1438496 m!1327127))

(assert (=> b!1438496 m!1327125))

(declare-fun m!1327129 () Bool)

(assert (=> b!1438496 m!1327129))

(declare-fun m!1327131 () Bool)

(assert (=> b!1438502 m!1327131))

(assert (=> b!1438502 m!1327131))

(declare-fun m!1327133 () Bool)

(assert (=> b!1438502 m!1327133))

(declare-fun m!1327135 () Bool)

(assert (=> start!124310 m!1327135))

(declare-fun m!1327137 () Bool)

(assert (=> start!124310 m!1327137))

(declare-fun m!1327139 () Bool)

(assert (=> b!1438495 m!1327139))

(assert (=> b!1438501 m!1327123))

(declare-fun m!1327141 () Bool)

(assert (=> b!1438501 m!1327141))

(declare-fun m!1327143 () Bool)

(assert (=> b!1438497 m!1327143))

(assert (=> b!1438497 m!1327143))

(declare-fun m!1327145 () Bool)

(assert (=> b!1438497 m!1327145))

(assert (=> b!1438497 m!1327145))

(assert (=> b!1438497 m!1327143))

(declare-fun m!1327147 () Bool)

(assert (=> b!1438497 m!1327147))

(declare-fun m!1327149 () Bool)

(assert (=> b!1438500 m!1327149))

(assert (=> b!1438499 m!1327143))

(assert (=> b!1438499 m!1327143))

(declare-fun m!1327151 () Bool)

(assert (=> b!1438499 m!1327151))

(assert (=> b!1438503 m!1327143))

(assert (=> b!1438503 m!1327143))

(declare-fun m!1327153 () Bool)

(assert (=> b!1438503 m!1327153))

(push 1)

(assert (not b!1438497))

(assert (not b!1438503))

(assert (not b!1438496))

(assert (not b!1438495))

(assert (not b!1438499))

(assert (not b!1438502))

(assert (not b!1438500))

(assert (not start!124310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

