; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124278 () Bool)

(assert start!124278)

(declare-fun res!970856 () Bool)

(declare-fun e!811321 () Bool)

(assert (=> start!124278 (=> (not res!970856) (not e!811321))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124278 (= res!970856 (validMask!0 mask!2687))))

(assert (=> start!124278 e!811321))

(assert (=> start!124278 true))

(declare-datatypes ((array!97804 0))(
  ( (array!97805 (arr!47193 (Array (_ BitVec 32) (_ BitVec 64))) (size!47743 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97804)

(declare-fun array_inv!36221 (array!97804) Bool)

(assert (=> start!124278 (array_inv!36221 a!2862)))

(declare-fun b!1438182 () Bool)

(declare-fun res!970861 () Bool)

(assert (=> b!1438182 (=> (not res!970861) (not e!811321))))

(declare-datatypes ((List!33694 0))(
  ( (Nil!33691) (Cons!33690 (h!35034 (_ BitVec 64)) (t!48388 List!33694)) )
))
(declare-fun arrayNoDuplicates!0 (array!97804 (_ BitVec 32) List!33694) Bool)

(assert (=> b!1438182 (= res!970861 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33691))))

(declare-fun b!1438183 () Bool)

(declare-fun res!970862 () Bool)

(assert (=> b!1438183 (=> (not res!970862) (not e!811321))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438183 (= res!970862 (validKeyInArray!0 (select (arr!47193 a!2862) j!93)))))

(declare-fun b!1438184 () Bool)

(declare-fun res!970864 () Bool)

(assert (=> b!1438184 (=> (not res!970864) (not e!811321))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438184 (= res!970864 (and (= (size!47743 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47743 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47743 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438185 () Bool)

(declare-fun e!811319 () Bool)

(assert (=> b!1438185 (= e!811319 (not (validKeyInArray!0 (select (store (arr!47193 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1438186 () Bool)

(declare-fun e!811322 () Bool)

(assert (=> b!1438186 (= e!811322 e!811319)))

(declare-fun res!970860 () Bool)

(assert (=> b!1438186 (=> (not res!970860) (not e!811319))))

(declare-fun lt!632511 () (_ BitVec 32))

(assert (=> b!1438186 (= res!970860 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632511 #b00000000000000000000000000000000) (bvslt lt!632511 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438186 (= lt!632511 (toIndex!0 (select (store (arr!47193 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438187 () Bool)

(declare-fun res!970855 () Bool)

(assert (=> b!1438187 (=> (not res!970855) (not e!811321))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438187 (= res!970855 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47743 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47743 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47743 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47193 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438188 () Bool)

(declare-fun res!970857 () Bool)

(assert (=> b!1438188 (=> (not res!970857) (not e!811321))))

(assert (=> b!1438188 (= res!970857 (validKeyInArray!0 (select (arr!47193 a!2862) i!1006)))))

(declare-fun b!1438189 () Bool)

(declare-fun res!970859 () Bool)

(assert (=> b!1438189 (=> (not res!970859) (not e!811322))))

(declare-datatypes ((SeekEntryResult!11445 0))(
  ( (MissingZero!11445 (index!48172 (_ BitVec 32))) (Found!11445 (index!48173 (_ BitVec 32))) (Intermediate!11445 (undefined!12257 Bool) (index!48174 (_ BitVec 32)) (x!129906 (_ BitVec 32))) (Undefined!11445) (MissingVacant!11445 (index!48175 (_ BitVec 32))) )
))
(declare-fun lt!632510 () SeekEntryResult!11445)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97804 (_ BitVec 32)) SeekEntryResult!11445)

(assert (=> b!1438189 (= res!970859 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47193 a!2862) j!93) a!2862 mask!2687) lt!632510))))

(declare-fun b!1438190 () Bool)

(assert (=> b!1438190 (= e!811321 e!811322)))

(declare-fun res!970863 () Bool)

(assert (=> b!1438190 (=> (not res!970863) (not e!811322))))

(assert (=> b!1438190 (= res!970863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47193 a!2862) j!93) mask!2687) (select (arr!47193 a!2862) j!93) a!2862 mask!2687) lt!632510))))

(assert (=> b!1438190 (= lt!632510 (Intermediate!11445 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438191 () Bool)

(declare-fun res!970858 () Bool)

(assert (=> b!1438191 (=> (not res!970858) (not e!811321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97804 (_ BitVec 32)) Bool)

(assert (=> b!1438191 (= res!970858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124278 res!970856) b!1438184))

(assert (= (and b!1438184 res!970864) b!1438188))

(assert (= (and b!1438188 res!970857) b!1438183))

(assert (= (and b!1438183 res!970862) b!1438191))

(assert (= (and b!1438191 res!970858) b!1438182))

(assert (= (and b!1438182 res!970861) b!1438187))

(assert (= (and b!1438187 res!970855) b!1438190))

(assert (= (and b!1438190 res!970863) b!1438189))

(assert (= (and b!1438189 res!970859) b!1438186))

(assert (= (and b!1438186 res!970860) b!1438185))

(declare-fun m!1327359 () Bool)

(assert (=> b!1438187 m!1327359))

(declare-fun m!1327361 () Bool)

(assert (=> b!1438187 m!1327361))

(declare-fun m!1327363 () Bool)

(assert (=> b!1438190 m!1327363))

(assert (=> b!1438190 m!1327363))

(declare-fun m!1327365 () Bool)

(assert (=> b!1438190 m!1327365))

(assert (=> b!1438190 m!1327365))

(assert (=> b!1438190 m!1327363))

(declare-fun m!1327367 () Bool)

(assert (=> b!1438190 m!1327367))

(assert (=> b!1438183 m!1327363))

(assert (=> b!1438183 m!1327363))

(declare-fun m!1327369 () Bool)

(assert (=> b!1438183 m!1327369))

(assert (=> b!1438185 m!1327359))

(declare-fun m!1327371 () Bool)

(assert (=> b!1438185 m!1327371))

(assert (=> b!1438185 m!1327371))

(declare-fun m!1327373 () Bool)

(assert (=> b!1438185 m!1327373))

(declare-fun m!1327375 () Bool)

(assert (=> b!1438191 m!1327375))

(declare-fun m!1327377 () Bool)

(assert (=> b!1438188 m!1327377))

(assert (=> b!1438188 m!1327377))

(declare-fun m!1327379 () Bool)

(assert (=> b!1438188 m!1327379))

(assert (=> b!1438186 m!1327359))

(assert (=> b!1438186 m!1327371))

(assert (=> b!1438186 m!1327371))

(declare-fun m!1327381 () Bool)

(assert (=> b!1438186 m!1327381))

(declare-fun m!1327383 () Bool)

(assert (=> b!1438182 m!1327383))

(assert (=> b!1438189 m!1327363))

(assert (=> b!1438189 m!1327363))

(declare-fun m!1327385 () Bool)

(assert (=> b!1438189 m!1327385))

(declare-fun m!1327387 () Bool)

(assert (=> start!124278 m!1327387))

(declare-fun m!1327389 () Bool)

(assert (=> start!124278 m!1327389))

(check-sat (not b!1438191) (not b!1438185) (not b!1438188) (not b!1438190) (not b!1438186) (not b!1438183) (not start!124278) (not b!1438182) (not b!1438189))
(check-sat)
