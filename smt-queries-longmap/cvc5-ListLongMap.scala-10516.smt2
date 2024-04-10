; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124002 () Bool)

(assert start!124002)

(declare-fun b!1436155 () Bool)

(declare-fun res!969111 () Bool)

(declare-fun e!810490 () Bool)

(assert (=> b!1436155 (=> (not res!969111) (not e!810490))))

(declare-datatypes ((array!97665 0))(
  ( (array!97666 (arr!47129 (Array (_ BitVec 32) (_ BitVec 64))) (size!47679 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97665)

(declare-datatypes ((List!33630 0))(
  ( (Nil!33627) (Cons!33626 (h!34961 (_ BitVec 64)) (t!48324 List!33630)) )
))
(declare-fun arrayNoDuplicates!0 (array!97665 (_ BitVec 32) List!33630) Bool)

(assert (=> b!1436155 (= res!969111 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33627))))

(declare-fun b!1436156 () Bool)

(declare-fun res!969110 () Bool)

(assert (=> b!1436156 (=> (not res!969110) (not e!810490))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436156 (= res!969110 (and (= (size!47679 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47679 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47679 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1436157 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436157 (= e!810490 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47679 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47679 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47679 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47129 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1436158 () Bool)

(declare-fun res!969112 () Bool)

(assert (=> b!1436158 (=> (not res!969112) (not e!810490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436158 (= res!969112 (validKeyInArray!0 (select (arr!47129 a!2862) j!93)))))

(declare-fun res!969109 () Bool)

(assert (=> start!124002 (=> (not res!969109) (not e!810490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124002 (= res!969109 (validMask!0 mask!2687))))

(assert (=> start!124002 e!810490))

(assert (=> start!124002 true))

(declare-fun array_inv!36157 (array!97665) Bool)

(assert (=> start!124002 (array_inv!36157 a!2862)))

(declare-fun b!1436159 () Bool)

(declare-fun res!969107 () Bool)

(assert (=> b!1436159 (=> (not res!969107) (not e!810490))))

(assert (=> b!1436159 (= res!969107 (validKeyInArray!0 (select (arr!47129 a!2862) i!1006)))))

(declare-fun b!1436160 () Bool)

(declare-fun res!969108 () Bool)

(assert (=> b!1436160 (=> (not res!969108) (not e!810490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97665 (_ BitVec 32)) Bool)

(assert (=> b!1436160 (= res!969108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124002 res!969109) b!1436156))

(assert (= (and b!1436156 res!969110) b!1436159))

(assert (= (and b!1436159 res!969107) b!1436158))

(assert (= (and b!1436158 res!969112) b!1436160))

(assert (= (and b!1436160 res!969108) b!1436155))

(assert (= (and b!1436155 res!969111) b!1436157))

(declare-fun m!1325493 () Bool)

(assert (=> b!1436157 m!1325493))

(declare-fun m!1325495 () Bool)

(assert (=> b!1436157 m!1325495))

(declare-fun m!1325497 () Bool)

(assert (=> b!1436159 m!1325497))

(assert (=> b!1436159 m!1325497))

(declare-fun m!1325499 () Bool)

(assert (=> b!1436159 m!1325499))

(declare-fun m!1325501 () Bool)

(assert (=> b!1436160 m!1325501))

(declare-fun m!1325503 () Bool)

(assert (=> b!1436155 m!1325503))

(declare-fun m!1325505 () Bool)

(assert (=> b!1436158 m!1325505))

(assert (=> b!1436158 m!1325505))

(declare-fun m!1325507 () Bool)

(assert (=> b!1436158 m!1325507))

(declare-fun m!1325509 () Bool)

(assert (=> start!124002 m!1325509))

(declare-fun m!1325511 () Bool)

(assert (=> start!124002 m!1325511))

(push 1)

(assert (not start!124002))

(assert (not b!1436160))

(assert (not b!1436159))

(assert (not b!1436158))

(assert (not b!1436155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

