; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124016 () Bool)

(assert start!124016)

(declare-fun b!1436193 () Bool)

(declare-fun res!969231 () Bool)

(declare-fun e!810486 () Bool)

(assert (=> b!1436193 (=> (not res!969231) (not e!810486))))

(declare-datatypes ((array!97631 0))(
  ( (array!97632 (arr!47112 (Array (_ BitVec 32) (_ BitVec 64))) (size!47664 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97631)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436193 (= res!969231 (validKeyInArray!0 (select (arr!47112 a!2862) j!93)))))

(declare-fun b!1436194 () Bool)

(declare-fun res!969226 () Bool)

(assert (=> b!1436194 (=> (not res!969226) (not e!810486))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97631 (_ BitVec 32)) Bool)

(assert (=> b!1436194 (= res!969226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436195 () Bool)

(declare-fun res!969232 () Bool)

(assert (=> b!1436195 (=> (not res!969232) (not e!810486))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436195 (= res!969232 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47664 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47664 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47664 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436196 () Bool)

(declare-fun res!969227 () Bool)

(assert (=> b!1436196 (=> (not res!969227) (not e!810486))))

(assert (=> b!1436196 (= res!969227 (and (= (size!47664 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47664 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47664 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436197 () Bool)

(assert (=> b!1436197 (= e!810486 false)))

(declare-fun lt!631887 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436197 (= lt!631887 (toIndex!0 (select (arr!47112 a!2862) j!93) mask!2687))))

(declare-fun res!969228 () Bool)

(assert (=> start!124016 (=> (not res!969228) (not e!810486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124016 (= res!969228 (validMask!0 mask!2687))))

(assert (=> start!124016 e!810486))

(assert (=> start!124016 true))

(declare-fun array_inv!36345 (array!97631) Bool)

(assert (=> start!124016 (array_inv!36345 a!2862)))

(declare-fun b!1436198 () Bool)

(declare-fun res!969229 () Bool)

(assert (=> b!1436198 (=> (not res!969229) (not e!810486))))

(assert (=> b!1436198 (= res!969229 (validKeyInArray!0 (select (arr!47112 a!2862) i!1006)))))

(declare-fun b!1436199 () Bool)

(declare-fun res!969230 () Bool)

(assert (=> b!1436199 (=> (not res!969230) (not e!810486))))

(declare-datatypes ((List!33691 0))(
  ( (Nil!33688) (Cons!33687 (h!35022 (_ BitVec 64)) (t!48377 List!33691)) )
))
(declare-fun arrayNoDuplicates!0 (array!97631 (_ BitVec 32) List!33691) Bool)

(assert (=> b!1436199 (= res!969230 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33688))))

(assert (= (and start!124016 res!969228) b!1436196))

(assert (= (and b!1436196 res!969227) b!1436198))

(assert (= (and b!1436198 res!969229) b!1436193))

(assert (= (and b!1436193 res!969231) b!1436194))

(assert (= (and b!1436194 res!969226) b!1436199))

(assert (= (and b!1436199 res!969230) b!1436195))

(assert (= (and b!1436195 res!969232) b!1436197))

(declare-fun m!1325021 () Bool)

(assert (=> b!1436199 m!1325021))

(declare-fun m!1325023 () Bool)

(assert (=> b!1436194 m!1325023))

(declare-fun m!1325025 () Bool)

(assert (=> b!1436195 m!1325025))

(declare-fun m!1325027 () Bool)

(assert (=> b!1436195 m!1325027))

(declare-fun m!1325029 () Bool)

(assert (=> start!124016 m!1325029))

(declare-fun m!1325031 () Bool)

(assert (=> start!124016 m!1325031))

(declare-fun m!1325033 () Bool)

(assert (=> b!1436193 m!1325033))

(assert (=> b!1436193 m!1325033))

(declare-fun m!1325035 () Bool)

(assert (=> b!1436193 m!1325035))

(assert (=> b!1436197 m!1325033))

(assert (=> b!1436197 m!1325033))

(declare-fun m!1325037 () Bool)

(assert (=> b!1436197 m!1325037))

(declare-fun m!1325039 () Bool)

(assert (=> b!1436198 m!1325039))

(assert (=> b!1436198 m!1325039))

(declare-fun m!1325041 () Bool)

(assert (=> b!1436198 m!1325041))

(push 1)

(assert (not b!1436197))

(assert (not b!1436198))

(assert (not b!1436199))

(assert (not b!1436194))

(assert (not b!1436193))

(assert (not start!124016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

