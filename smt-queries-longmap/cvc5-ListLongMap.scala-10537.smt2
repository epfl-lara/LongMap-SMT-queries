; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124276 () Bool)

(assert start!124276)

(declare-fun b!1438152 () Bool)

(declare-fun res!970834 () Bool)

(declare-fun e!811309 () Bool)

(assert (=> b!1438152 (=> (not res!970834) (not e!811309))))

(declare-datatypes ((array!97802 0))(
  ( (array!97803 (arr!47192 (Array (_ BitVec 32) (_ BitVec 64))) (size!47742 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97802)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97802 (_ BitVec 32)) Bool)

(assert (=> b!1438152 (= res!970834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438153 () Bool)

(declare-fun e!811307 () Bool)

(assert (=> b!1438153 (= e!811309 e!811307)))

(declare-fun res!970826 () Bool)

(assert (=> b!1438153 (=> (not res!970826) (not e!811307))))

(declare-datatypes ((SeekEntryResult!11444 0))(
  ( (MissingZero!11444 (index!48168 (_ BitVec 32))) (Found!11444 (index!48169 (_ BitVec 32))) (Intermediate!11444 (undefined!12256 Bool) (index!48170 (_ BitVec 32)) (x!129905 (_ BitVec 32))) (Undefined!11444) (MissingVacant!11444 (index!48171 (_ BitVec 32))) )
))
(declare-fun lt!632504 () SeekEntryResult!11444)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97802 (_ BitVec 32)) SeekEntryResult!11444)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438153 (= res!970826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47192 a!2862) j!93) mask!2687) (select (arr!47192 a!2862) j!93) a!2862 mask!2687) lt!632504))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438153 (= lt!632504 (Intermediate!11444 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438154 () Bool)

(declare-fun res!970833 () Bool)

(assert (=> b!1438154 (=> (not res!970833) (not e!811309))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438154 (= res!970833 (validKeyInArray!0 (select (arr!47192 a!2862) i!1006)))))

(declare-fun b!1438155 () Bool)

(declare-fun res!970832 () Bool)

(assert (=> b!1438155 (=> (not res!970832) (not e!811309))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438155 (= res!970832 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47742 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47742 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47742 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47192 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438156 () Bool)

(declare-fun res!970825 () Bool)

(assert (=> b!1438156 (=> (not res!970825) (not e!811307))))

(assert (=> b!1438156 (= res!970825 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47192 a!2862) j!93) a!2862 mask!2687) lt!632504))))

(declare-fun b!1438157 () Bool)

(declare-fun res!970831 () Bool)

(assert (=> b!1438157 (=> (not res!970831) (not e!811309))))

(assert (=> b!1438157 (= res!970831 (validKeyInArray!0 (select (arr!47192 a!2862) j!93)))))

(declare-fun b!1438158 () Bool)

(declare-fun e!811308 () Bool)

(assert (=> b!1438158 (= e!811307 e!811308)))

(declare-fun res!970829 () Bool)

(assert (=> b!1438158 (=> (not res!970829) (not e!811308))))

(declare-fun lt!632505 () (_ BitVec 32))

(assert (=> b!1438158 (= res!970829 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632505 #b00000000000000000000000000000000) (bvslt lt!632505 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (=> b!1438158 (= lt!632505 (toIndex!0 (select (store (arr!47192 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438159 () Bool)

(declare-fun res!970828 () Bool)

(assert (=> b!1438159 (=> (not res!970828) (not e!811309))))

(assert (=> b!1438159 (= res!970828 (and (= (size!47742 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47742 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47742 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!970827 () Bool)

(assert (=> start!124276 (=> (not res!970827) (not e!811309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124276 (= res!970827 (validMask!0 mask!2687))))

(assert (=> start!124276 e!811309))

(assert (=> start!124276 true))

(declare-fun array_inv!36220 (array!97802) Bool)

(assert (=> start!124276 (array_inv!36220 a!2862)))

(declare-fun b!1438160 () Bool)

(assert (=> b!1438160 (= e!811308 (not (validKeyInArray!0 (select (store (arr!47192 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1438161 () Bool)

(declare-fun res!970830 () Bool)

(assert (=> b!1438161 (=> (not res!970830) (not e!811309))))

(declare-datatypes ((List!33693 0))(
  ( (Nil!33690) (Cons!33689 (h!35033 (_ BitVec 64)) (t!48387 List!33693)) )
))
(declare-fun arrayNoDuplicates!0 (array!97802 (_ BitVec 32) List!33693) Bool)

(assert (=> b!1438161 (= res!970830 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33690))))

(assert (= (and start!124276 res!970827) b!1438159))

(assert (= (and b!1438159 res!970828) b!1438154))

(assert (= (and b!1438154 res!970833) b!1438157))

(assert (= (and b!1438157 res!970831) b!1438152))

(assert (= (and b!1438152 res!970834) b!1438161))

(assert (= (and b!1438161 res!970830) b!1438155))

(assert (= (and b!1438155 res!970832) b!1438153))

(assert (= (and b!1438153 res!970826) b!1438156))

(assert (= (and b!1438156 res!970825) b!1438158))

(assert (= (and b!1438158 res!970829) b!1438160))

(declare-fun m!1327327 () Bool)

(assert (=> b!1438161 m!1327327))

(declare-fun m!1327329 () Bool)

(assert (=> b!1438156 m!1327329))

(assert (=> b!1438156 m!1327329))

(declare-fun m!1327331 () Bool)

(assert (=> b!1438156 m!1327331))

(declare-fun m!1327333 () Bool)

(assert (=> b!1438152 m!1327333))

(declare-fun m!1327335 () Bool)

(assert (=> start!124276 m!1327335))

(declare-fun m!1327337 () Bool)

(assert (=> start!124276 m!1327337))

(declare-fun m!1327339 () Bool)

(assert (=> b!1438158 m!1327339))

(declare-fun m!1327341 () Bool)

(assert (=> b!1438158 m!1327341))

(assert (=> b!1438158 m!1327341))

(declare-fun m!1327343 () Bool)

(assert (=> b!1438158 m!1327343))

(assert (=> b!1438160 m!1327339))

(assert (=> b!1438160 m!1327341))

(assert (=> b!1438160 m!1327341))

(declare-fun m!1327345 () Bool)

(assert (=> b!1438160 m!1327345))

(assert (=> b!1438157 m!1327329))

(assert (=> b!1438157 m!1327329))

(declare-fun m!1327347 () Bool)

(assert (=> b!1438157 m!1327347))

(assert (=> b!1438153 m!1327329))

(assert (=> b!1438153 m!1327329))

(declare-fun m!1327349 () Bool)

(assert (=> b!1438153 m!1327349))

(assert (=> b!1438153 m!1327349))

(assert (=> b!1438153 m!1327329))

(declare-fun m!1327351 () Bool)

(assert (=> b!1438153 m!1327351))

(declare-fun m!1327353 () Bool)

(assert (=> b!1438154 m!1327353))

(assert (=> b!1438154 m!1327353))

(declare-fun m!1327355 () Bool)

(assert (=> b!1438154 m!1327355))

(assert (=> b!1438155 m!1327339))

(declare-fun m!1327357 () Bool)

(assert (=> b!1438155 m!1327357))

(push 1)

