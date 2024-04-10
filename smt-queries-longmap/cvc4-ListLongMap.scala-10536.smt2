; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124274 () Bool)

(assert start!124274)

(declare-fun b!1438123 () Bool)

(declare-fun e!811298 () Bool)

(declare-fun e!811296 () Bool)

(assert (=> b!1438123 (= e!811298 e!811296)))

(declare-fun res!970804 () Bool)

(assert (=> b!1438123 (=> (not res!970804) (not e!811296))))

(declare-datatypes ((SeekEntryResult!11443 0))(
  ( (MissingZero!11443 (index!48164 (_ BitVec 32))) (Found!11443 (index!48165 (_ BitVec 32))) (Intermediate!11443 (undefined!12255 Bool) (index!48166 (_ BitVec 32)) (x!129896 (_ BitVec 32))) (Undefined!11443) (MissingVacant!11443 (index!48167 (_ BitVec 32))) )
))
(declare-fun lt!632498 () SeekEntryResult!11443)

(declare-datatypes ((array!97800 0))(
  ( (array!97801 (arr!47191 (Array (_ BitVec 32) (_ BitVec 64))) (size!47741 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97800)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97800 (_ BitVec 32)) SeekEntryResult!11443)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438123 (= res!970804 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47191 a!2862) j!93) mask!2687) (select (arr!47191 a!2862) j!93) a!2862 mask!2687) lt!632498))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438123 (= lt!632498 (Intermediate!11443 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438124 () Bool)

(declare-fun res!970797 () Bool)

(assert (=> b!1438124 (=> (not res!970797) (not e!811298))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438124 (= res!970797 (and (= (size!47741 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47741 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47741 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438125 () Bool)

(declare-fun res!970801 () Bool)

(assert (=> b!1438125 (=> (not res!970801) (not e!811298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438125 (= res!970801 (validKeyInArray!0 (select (arr!47191 a!2862) i!1006)))))

(declare-fun b!1438126 () Bool)

(declare-fun res!970802 () Bool)

(assert (=> b!1438126 (=> (not res!970802) (not e!811296))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438126 (= res!970802 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47191 a!2862) j!93) a!2862 mask!2687) lt!632498))))

(declare-fun b!1438127 () Bool)

(assert (=> b!1438127 (= e!811296 false)))

(declare-fun lt!632499 () (_ BitVec 32))

(assert (=> b!1438127 (= lt!632499 (toIndex!0 (select (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438128 () Bool)

(declare-fun res!970798 () Bool)

(assert (=> b!1438128 (=> (not res!970798) (not e!811298))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438128 (= res!970798 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47741 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47741 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47741 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438129 () Bool)

(declare-fun res!970800 () Bool)

(assert (=> b!1438129 (=> (not res!970800) (not e!811298))))

(assert (=> b!1438129 (= res!970800 (validKeyInArray!0 (select (arr!47191 a!2862) j!93)))))

(declare-fun b!1438130 () Bool)

(declare-fun res!970803 () Bool)

(assert (=> b!1438130 (=> (not res!970803) (not e!811298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97800 (_ BitVec 32)) Bool)

(assert (=> b!1438130 (= res!970803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!970796 () Bool)

(assert (=> start!124274 (=> (not res!970796) (not e!811298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124274 (= res!970796 (validMask!0 mask!2687))))

(assert (=> start!124274 e!811298))

(assert (=> start!124274 true))

(declare-fun array_inv!36219 (array!97800) Bool)

(assert (=> start!124274 (array_inv!36219 a!2862)))

(declare-fun b!1438131 () Bool)

(declare-fun res!970799 () Bool)

(assert (=> b!1438131 (=> (not res!970799) (not e!811298))))

(declare-datatypes ((List!33692 0))(
  ( (Nil!33689) (Cons!33688 (h!35032 (_ BitVec 64)) (t!48386 List!33692)) )
))
(declare-fun arrayNoDuplicates!0 (array!97800 (_ BitVec 32) List!33692) Bool)

(assert (=> b!1438131 (= res!970799 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33689))))

(assert (= (and start!124274 res!970796) b!1438124))

(assert (= (and b!1438124 res!970797) b!1438125))

(assert (= (and b!1438125 res!970801) b!1438129))

(assert (= (and b!1438129 res!970800) b!1438130))

(assert (= (and b!1438130 res!970803) b!1438131))

(assert (= (and b!1438131 res!970799) b!1438128))

(assert (= (and b!1438128 res!970798) b!1438123))

(assert (= (and b!1438123 res!970804) b!1438126))

(assert (= (and b!1438126 res!970802) b!1438127))

(declare-fun m!1327297 () Bool)

(assert (=> b!1438131 m!1327297))

(declare-fun m!1327299 () Bool)

(assert (=> start!124274 m!1327299))

(declare-fun m!1327301 () Bool)

(assert (=> start!124274 m!1327301))

(declare-fun m!1327303 () Bool)

(assert (=> b!1438126 m!1327303))

(assert (=> b!1438126 m!1327303))

(declare-fun m!1327305 () Bool)

(assert (=> b!1438126 m!1327305))

(assert (=> b!1438123 m!1327303))

(assert (=> b!1438123 m!1327303))

(declare-fun m!1327307 () Bool)

(assert (=> b!1438123 m!1327307))

(assert (=> b!1438123 m!1327307))

(assert (=> b!1438123 m!1327303))

(declare-fun m!1327309 () Bool)

(assert (=> b!1438123 m!1327309))

(declare-fun m!1327311 () Bool)

(assert (=> b!1438127 m!1327311))

(declare-fun m!1327313 () Bool)

(assert (=> b!1438127 m!1327313))

(assert (=> b!1438127 m!1327313))

(declare-fun m!1327315 () Bool)

(assert (=> b!1438127 m!1327315))

(declare-fun m!1327317 () Bool)

(assert (=> b!1438130 m!1327317))

(declare-fun m!1327319 () Bool)

(assert (=> b!1438125 m!1327319))

(assert (=> b!1438125 m!1327319))

(declare-fun m!1327321 () Bool)

(assert (=> b!1438125 m!1327321))

(assert (=> b!1438128 m!1327311))

(declare-fun m!1327323 () Bool)

(assert (=> b!1438128 m!1327323))

(assert (=> b!1438129 m!1327303))

(assert (=> b!1438129 m!1327303))

(declare-fun m!1327325 () Bool)

(assert (=> b!1438129 m!1327325))

(push 1)

(assert (not b!1438127))

(assert (not b!1438126))

(assert (not b!1438125))

(assert (not b!1438123))

(assert (not b!1438129))

(assert (not b!1438131))

(assert (not b!1438130))

(assert (not start!124274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

