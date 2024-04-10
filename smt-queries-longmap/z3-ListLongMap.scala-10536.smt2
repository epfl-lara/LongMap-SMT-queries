; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124272 () Bool)

(assert start!124272)

(declare-fun b!1438096 () Bool)

(declare-fun res!970774 () Bool)

(declare-fun e!811287 () Bool)

(assert (=> b!1438096 (=> (not res!970774) (not e!811287))))

(declare-datatypes ((array!97798 0))(
  ( (array!97799 (arr!47190 (Array (_ BitVec 32) (_ BitVec 64))) (size!47740 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97798)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438096 (= res!970774 (validKeyInArray!0 (select (arr!47190 a!2862) i!1006)))))

(declare-fun b!1438097 () Bool)

(declare-fun res!970769 () Bool)

(assert (=> b!1438097 (=> (not res!970769) (not e!811287))))

(declare-datatypes ((List!33691 0))(
  ( (Nil!33688) (Cons!33687 (h!35031 (_ BitVec 64)) (t!48385 List!33691)) )
))
(declare-fun arrayNoDuplicates!0 (array!97798 (_ BitVec 32) List!33691) Bool)

(assert (=> b!1438097 (= res!970769 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33688))))

(declare-fun b!1438098 () Bool)

(declare-fun res!970776 () Bool)

(assert (=> b!1438098 (=> (not res!970776) (not e!811287))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438098 (= res!970776 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47740 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47740 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47740 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438099 () Bool)

(declare-fun res!970777 () Bool)

(assert (=> b!1438099 (=> (not res!970777) (not e!811287))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1438099 (= res!970777 (validKeyInArray!0 (select (arr!47190 a!2862) j!93)))))

(declare-fun b!1438100 () Bool)

(declare-fun e!811289 () Bool)

(assert (=> b!1438100 (= e!811289 false)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!632493 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438100 (= lt!632493 (toIndex!0 (select (store (arr!47190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438101 () Bool)

(assert (=> b!1438101 (= e!811287 e!811289)))

(declare-fun res!970775 () Bool)

(assert (=> b!1438101 (=> (not res!970775) (not e!811289))))

(declare-datatypes ((SeekEntryResult!11442 0))(
  ( (MissingZero!11442 (index!48160 (_ BitVec 32))) (Found!11442 (index!48161 (_ BitVec 32))) (Intermediate!11442 (undefined!12254 Bool) (index!48162 (_ BitVec 32)) (x!129895 (_ BitVec 32))) (Undefined!11442) (MissingVacant!11442 (index!48163 (_ BitVec 32))) )
))
(declare-fun lt!632492 () SeekEntryResult!11442)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97798 (_ BitVec 32)) SeekEntryResult!11442)

(assert (=> b!1438101 (= res!970775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47190 a!2862) j!93) mask!2687) (select (arr!47190 a!2862) j!93) a!2862 mask!2687) lt!632492))))

(assert (=> b!1438101 (= lt!632492 (Intermediate!11442 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438102 () Bool)

(declare-fun res!970770 () Bool)

(assert (=> b!1438102 (=> (not res!970770) (not e!811289))))

(assert (=> b!1438102 (= res!970770 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47190 a!2862) j!93) a!2862 mask!2687) lt!632492))))

(declare-fun b!1438103 () Bool)

(declare-fun res!970773 () Bool)

(assert (=> b!1438103 (=> (not res!970773) (not e!811287))))

(assert (=> b!1438103 (= res!970773 (and (= (size!47740 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47740 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47740 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438104 () Bool)

(declare-fun res!970772 () Bool)

(assert (=> b!1438104 (=> (not res!970772) (not e!811287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97798 (_ BitVec 32)) Bool)

(assert (=> b!1438104 (= res!970772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!970771 () Bool)

(assert (=> start!124272 (=> (not res!970771) (not e!811287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124272 (= res!970771 (validMask!0 mask!2687))))

(assert (=> start!124272 e!811287))

(assert (=> start!124272 true))

(declare-fun array_inv!36218 (array!97798) Bool)

(assert (=> start!124272 (array_inv!36218 a!2862)))

(assert (= (and start!124272 res!970771) b!1438103))

(assert (= (and b!1438103 res!970773) b!1438096))

(assert (= (and b!1438096 res!970774) b!1438099))

(assert (= (and b!1438099 res!970777) b!1438104))

(assert (= (and b!1438104 res!970772) b!1438097))

(assert (= (and b!1438097 res!970769) b!1438098))

(assert (= (and b!1438098 res!970776) b!1438101))

(assert (= (and b!1438101 res!970775) b!1438102))

(assert (= (and b!1438102 res!970770) b!1438100))

(declare-fun m!1327267 () Bool)

(assert (=> start!124272 m!1327267))

(declare-fun m!1327269 () Bool)

(assert (=> start!124272 m!1327269))

(declare-fun m!1327271 () Bool)

(assert (=> b!1438100 m!1327271))

(declare-fun m!1327273 () Bool)

(assert (=> b!1438100 m!1327273))

(assert (=> b!1438100 m!1327273))

(declare-fun m!1327275 () Bool)

(assert (=> b!1438100 m!1327275))

(assert (=> b!1438098 m!1327271))

(declare-fun m!1327277 () Bool)

(assert (=> b!1438098 m!1327277))

(declare-fun m!1327279 () Bool)

(assert (=> b!1438101 m!1327279))

(assert (=> b!1438101 m!1327279))

(declare-fun m!1327281 () Bool)

(assert (=> b!1438101 m!1327281))

(assert (=> b!1438101 m!1327281))

(assert (=> b!1438101 m!1327279))

(declare-fun m!1327283 () Bool)

(assert (=> b!1438101 m!1327283))

(assert (=> b!1438099 m!1327279))

(assert (=> b!1438099 m!1327279))

(declare-fun m!1327285 () Bool)

(assert (=> b!1438099 m!1327285))

(declare-fun m!1327287 () Bool)

(assert (=> b!1438104 m!1327287))

(assert (=> b!1438102 m!1327279))

(assert (=> b!1438102 m!1327279))

(declare-fun m!1327289 () Bool)

(assert (=> b!1438102 m!1327289))

(declare-fun m!1327291 () Bool)

(assert (=> b!1438097 m!1327291))

(declare-fun m!1327293 () Bool)

(assert (=> b!1438096 m!1327293))

(assert (=> b!1438096 m!1327293))

(declare-fun m!1327295 () Bool)

(assert (=> b!1438096 m!1327295))

(check-sat (not start!124272) (not b!1438099) (not b!1438096) (not b!1438102) (not b!1438100) (not b!1438101) (not b!1438097) (not b!1438104))
