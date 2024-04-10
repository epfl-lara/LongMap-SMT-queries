; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124008 () Bool)

(assert start!124008)

(declare-fun res!969166 () Bool)

(declare-fun e!810508 () Bool)

(assert (=> start!124008 (=> (not res!969166) (not e!810508))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124008 (= res!969166 (validMask!0 mask!2687))))

(assert (=> start!124008 e!810508))

(assert (=> start!124008 true))

(declare-datatypes ((array!97671 0))(
  ( (array!97672 (arr!47132 (Array (_ BitVec 32) (_ BitVec 64))) (size!47682 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97671)

(declare-fun array_inv!36160 (array!97671) Bool)

(assert (=> start!124008 (array_inv!36160 a!2862)))

(declare-fun b!1436209 () Bool)

(declare-fun res!969161 () Bool)

(assert (=> b!1436209 (=> (not res!969161) (not e!810508))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436209 (= res!969161 (and (= (size!47682 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47682 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47682 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436210 () Bool)

(declare-fun res!969165 () Bool)

(assert (=> b!1436210 (=> (not res!969165) (not e!810508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436210 (= res!969165 (validKeyInArray!0 (select (arr!47132 a!2862) i!1006)))))

(declare-fun b!1436211 () Bool)

(declare-fun res!969163 () Bool)

(assert (=> b!1436211 (=> (not res!969163) (not e!810508))))

(assert (=> b!1436211 (= res!969163 (validKeyInArray!0 (select (arr!47132 a!2862) j!93)))))

(declare-fun b!1436212 () Bool)

(declare-fun res!969164 () Bool)

(assert (=> b!1436212 (=> (not res!969164) (not e!810508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97671 (_ BitVec 32)) Bool)

(assert (=> b!1436212 (= res!969164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1436213 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436213 (= e!810508 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47682 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47682 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47682 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47132 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1436214 () Bool)

(declare-fun res!969162 () Bool)

(assert (=> b!1436214 (=> (not res!969162) (not e!810508))))

(declare-datatypes ((List!33633 0))(
  ( (Nil!33630) (Cons!33629 (h!34964 (_ BitVec 64)) (t!48327 List!33633)) )
))
(declare-fun arrayNoDuplicates!0 (array!97671 (_ BitVec 32) List!33633) Bool)

(assert (=> b!1436214 (= res!969162 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33630))))

(assert (= (and start!124008 res!969166) b!1436209))

(assert (= (and b!1436209 res!969161) b!1436210))

(assert (= (and b!1436210 res!969165) b!1436211))

(assert (= (and b!1436211 res!969163) b!1436212))

(assert (= (and b!1436212 res!969164) b!1436214))

(assert (= (and b!1436214 res!969162) b!1436213))

(declare-fun m!1325553 () Bool)

(assert (=> b!1436211 m!1325553))

(assert (=> b!1436211 m!1325553))

(declare-fun m!1325555 () Bool)

(assert (=> b!1436211 m!1325555))

(declare-fun m!1325557 () Bool)

(assert (=> b!1436210 m!1325557))

(assert (=> b!1436210 m!1325557))

(declare-fun m!1325559 () Bool)

(assert (=> b!1436210 m!1325559))

(declare-fun m!1325561 () Bool)

(assert (=> b!1436214 m!1325561))

(declare-fun m!1325563 () Bool)

(assert (=> start!124008 m!1325563))

(declare-fun m!1325565 () Bool)

(assert (=> start!124008 m!1325565))

(declare-fun m!1325567 () Bool)

(assert (=> b!1436213 m!1325567))

(declare-fun m!1325569 () Bool)

(assert (=> b!1436213 m!1325569))

(declare-fun m!1325571 () Bool)

(assert (=> b!1436212 m!1325571))

(push 1)

(assert (not b!1436210))

(assert (not start!124008))

(assert (not b!1436212))

(assert (not b!1436211))

(assert (not b!1436214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

