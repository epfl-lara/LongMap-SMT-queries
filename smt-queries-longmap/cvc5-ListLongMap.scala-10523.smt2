; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124330 () Bool)

(assert start!124330)

(declare-fun b!1438111 () Bool)

(declare-fun res!970173 () Bool)

(declare-fun e!811593 () Bool)

(assert (=> b!1438111 (=> (not res!970173) (not e!811593))))

(declare-datatypes ((array!97829 0))(
  ( (array!97830 (arr!47205 (Array (_ BitVec 32) (_ BitVec 64))) (size!47756 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97829)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438111 (= res!970173 (validKeyInArray!0 (select (arr!47205 a!2862) j!93)))))

(declare-fun b!1438112 () Bool)

(declare-fun res!970171 () Bool)

(assert (=> b!1438112 (=> (not res!970171) (not e!811593))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438112 (= res!970171 (and (= (size!47756 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47756 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47756 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438113 () Bool)

(assert (=> b!1438113 (= e!811593 false)))

(declare-fun lt!632689 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438113 (= lt!632689 (toIndex!0 (select (arr!47205 a!2862) j!93) mask!2687))))

(declare-fun b!1438114 () Bool)

(declare-fun res!970169 () Bool)

(assert (=> b!1438114 (=> (not res!970169) (not e!811593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97829 (_ BitVec 32)) Bool)

(assert (=> b!1438114 (= res!970169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438115 () Bool)

(declare-fun res!970170 () Bool)

(assert (=> b!1438115 (=> (not res!970170) (not e!811593))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438115 (= res!970170 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47756 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47756 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47756 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438116 () Bool)

(declare-fun res!970174 () Bool)

(assert (=> b!1438116 (=> (not res!970174) (not e!811593))))

(declare-datatypes ((List!33693 0))(
  ( (Nil!33690) (Cons!33689 (h!35038 (_ BitVec 64)) (t!48379 List!33693)) )
))
(declare-fun arrayNoDuplicates!0 (array!97829 (_ BitVec 32) List!33693) Bool)

(assert (=> b!1438116 (= res!970174 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33690))))

(declare-fun b!1438117 () Bool)

(declare-fun res!970172 () Bool)

(assert (=> b!1438117 (=> (not res!970172) (not e!811593))))

(assert (=> b!1438117 (= res!970172 (validKeyInArray!0 (select (arr!47205 a!2862) i!1006)))))

(declare-fun res!970175 () Bool)

(assert (=> start!124330 (=> (not res!970175) (not e!811593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124330 (= res!970175 (validMask!0 mask!2687))))

(assert (=> start!124330 e!811593))

(assert (=> start!124330 true))

(declare-fun array_inv!36486 (array!97829) Bool)

(assert (=> start!124330 (array_inv!36486 a!2862)))

(assert (= (and start!124330 res!970175) b!1438112))

(assert (= (and b!1438112 res!970171) b!1438117))

(assert (= (and b!1438117 res!970172) b!1438111))

(assert (= (and b!1438111 res!970173) b!1438114))

(assert (= (and b!1438114 res!970169) b!1438116))

(assert (= (and b!1438116 res!970174) b!1438115))

(assert (= (and b!1438115 res!970170) b!1438113))

(declare-fun m!1327515 () Bool)

(assert (=> b!1438111 m!1327515))

(assert (=> b!1438111 m!1327515))

(declare-fun m!1327517 () Bool)

(assert (=> b!1438111 m!1327517))

(declare-fun m!1327519 () Bool)

(assert (=> b!1438116 m!1327519))

(declare-fun m!1327521 () Bool)

(assert (=> b!1438114 m!1327521))

(declare-fun m!1327523 () Bool)

(assert (=> start!124330 m!1327523))

(declare-fun m!1327525 () Bool)

(assert (=> start!124330 m!1327525))

(assert (=> b!1438113 m!1327515))

(assert (=> b!1438113 m!1327515))

(declare-fun m!1327527 () Bool)

(assert (=> b!1438113 m!1327527))

(declare-fun m!1327529 () Bool)

(assert (=> b!1438117 m!1327529))

(assert (=> b!1438117 m!1327529))

(declare-fun m!1327531 () Bool)

(assert (=> b!1438117 m!1327531))

(declare-fun m!1327533 () Bool)

(assert (=> b!1438115 m!1327533))

(declare-fun m!1327535 () Bool)

(assert (=> b!1438115 m!1327535))

(push 1)

(assert (not b!1438111))

(assert (not b!1438117))

(assert (not b!1438113))

(assert (not start!124330))

(assert (not b!1438114))

(assert (not b!1438116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

