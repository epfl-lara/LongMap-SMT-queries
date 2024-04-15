; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125440 () Bool)

(assert start!125440)

(declare-fun b!1467664 () Bool)

(declare-fun res!996328 () Bool)

(declare-fun e!824272 () Bool)

(assert (=> b!1467664 (=> (not res!996328) (not e!824272))))

(declare-datatypes ((array!98866 0))(
  ( (array!98867 (arr!47722 (Array (_ BitVec 32) (_ BitVec 64))) (size!48274 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98866)

(declare-datatypes ((List!34301 0))(
  ( (Nil!34298) (Cons!34297 (h!35647 (_ BitVec 64)) (t!48987 List!34301)) )
))
(declare-fun arrayNoDuplicates!0 (array!98866 (_ BitVec 32) List!34301) Bool)

(assert (=> b!1467664 (= res!996328 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34298))))

(declare-fun b!1467665 () Bool)

(declare-fun res!996323 () Bool)

(assert (=> b!1467665 (=> (not res!996323) (not e!824272))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467665 (= res!996323 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48274 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48274 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48274 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467666 () Bool)

(declare-fun res!996320 () Bool)

(assert (=> b!1467666 (=> (not res!996320) (not e!824272))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467666 (= res!996320 (and (= (size!48274 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48274 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48274 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!996326 () Bool)

(assert (=> start!125440 (=> (not res!996326) (not e!824272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125440 (= res!996326 (validMask!0 mask!2687))))

(assert (=> start!125440 e!824272))

(assert (=> start!125440 true))

(declare-fun array_inv!36955 (array!98866) Bool)

(assert (=> start!125440 (array_inv!36955 a!2862)))

(declare-fun b!1467667 () Bool)

(declare-fun res!996322 () Bool)

(assert (=> b!1467667 (=> (not res!996322) (not e!824272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98866 (_ BitVec 32)) Bool)

(assert (=> b!1467667 (= res!996322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467668 () Bool)

(declare-fun e!824274 () Bool)

(assert (=> b!1467668 (= e!824274 false)))

(declare-fun lt!641927 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467668 (= lt!641927 (toIndex!0 (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1467669 () Bool)

(declare-fun res!996325 () Bool)

(assert (=> b!1467669 (=> (not res!996325) (not e!824272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467669 (= res!996325 (validKeyInArray!0 (select (arr!47722 a!2862) j!93)))))

(declare-fun b!1467670 () Bool)

(assert (=> b!1467670 (= e!824272 e!824274)))

(declare-fun res!996324 () Bool)

(assert (=> b!1467670 (=> (not res!996324) (not e!824274))))

(declare-datatypes ((SeekEntryResult!11987 0))(
  ( (MissingZero!11987 (index!50340 (_ BitVec 32))) (Found!11987 (index!50341 (_ BitVec 32))) (Intermediate!11987 (undefined!12799 Bool) (index!50342 (_ BitVec 32)) (x!131935 (_ BitVec 32))) (Undefined!11987) (MissingVacant!11987 (index!50343 (_ BitVec 32))) )
))
(declare-fun lt!641928 () SeekEntryResult!11987)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98866 (_ BitVec 32)) SeekEntryResult!11987)

(assert (=> b!1467670 (= res!996324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47722 a!2862) j!93) mask!2687) (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!641928))))

(assert (=> b!1467670 (= lt!641928 (Intermediate!11987 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467671 () Bool)

(declare-fun res!996321 () Bool)

(assert (=> b!1467671 (=> (not res!996321) (not e!824274))))

(assert (=> b!1467671 (= res!996321 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!641928))))

(declare-fun b!1467672 () Bool)

(declare-fun res!996327 () Bool)

(assert (=> b!1467672 (=> (not res!996327) (not e!824272))))

(assert (=> b!1467672 (= res!996327 (validKeyInArray!0 (select (arr!47722 a!2862) i!1006)))))

(assert (= (and start!125440 res!996326) b!1467666))

(assert (= (and b!1467666 res!996320) b!1467672))

(assert (= (and b!1467672 res!996327) b!1467669))

(assert (= (and b!1467669 res!996325) b!1467667))

(assert (= (and b!1467667 res!996322) b!1467664))

(assert (= (and b!1467664 res!996328) b!1467665))

(assert (= (and b!1467665 res!996323) b!1467670))

(assert (= (and b!1467670 res!996324) b!1467671))

(assert (= (and b!1467671 res!996321) b!1467668))

(declare-fun m!1354149 () Bool)

(assert (=> b!1467670 m!1354149))

(assert (=> b!1467670 m!1354149))

(declare-fun m!1354151 () Bool)

(assert (=> b!1467670 m!1354151))

(assert (=> b!1467670 m!1354151))

(assert (=> b!1467670 m!1354149))

(declare-fun m!1354153 () Bool)

(assert (=> b!1467670 m!1354153))

(declare-fun m!1354155 () Bool)

(assert (=> b!1467665 m!1354155))

(declare-fun m!1354157 () Bool)

(assert (=> b!1467665 m!1354157))

(assert (=> b!1467668 m!1354155))

(declare-fun m!1354159 () Bool)

(assert (=> b!1467668 m!1354159))

(assert (=> b!1467668 m!1354159))

(declare-fun m!1354161 () Bool)

(assert (=> b!1467668 m!1354161))

(declare-fun m!1354163 () Bool)

(assert (=> b!1467664 m!1354163))

(declare-fun m!1354165 () Bool)

(assert (=> b!1467667 m!1354165))

(declare-fun m!1354167 () Bool)

(assert (=> start!125440 m!1354167))

(declare-fun m!1354169 () Bool)

(assert (=> start!125440 m!1354169))

(declare-fun m!1354171 () Bool)

(assert (=> b!1467672 m!1354171))

(assert (=> b!1467672 m!1354171))

(declare-fun m!1354173 () Bool)

(assert (=> b!1467672 m!1354173))

(assert (=> b!1467671 m!1354149))

(assert (=> b!1467671 m!1354149))

(declare-fun m!1354175 () Bool)

(assert (=> b!1467671 m!1354175))

(assert (=> b!1467669 m!1354149))

(assert (=> b!1467669 m!1354149))

(declare-fun m!1354177 () Bool)

(assert (=> b!1467669 m!1354177))

(check-sat (not b!1467668) (not b!1467664) (not b!1467672) (not b!1467667) (not start!125440) (not b!1467670) (not b!1467671) (not b!1467669))
(check-sat)
