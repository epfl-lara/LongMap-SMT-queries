; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124012 () Bool)

(assert start!124012)

(declare-fun b!1436245 () Bool)

(declare-fun res!969200 () Bool)

(declare-fun e!810520 () Bool)

(assert (=> b!1436245 (=> (not res!969200) (not e!810520))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97675 0))(
  ( (array!97676 (arr!47134 (Array (_ BitVec 32) (_ BitVec 64))) (size!47684 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97675)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1436245 (= res!969200 (and (= (size!47684 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47684 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47684 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436246 () Bool)

(declare-fun res!969199 () Bool)

(assert (=> b!1436246 (=> (not res!969199) (not e!810520))))

(declare-datatypes ((List!33635 0))(
  ( (Nil!33632) (Cons!33631 (h!34966 (_ BitVec 64)) (t!48329 List!33635)) )
))
(declare-fun arrayNoDuplicates!0 (array!97675 (_ BitVec 32) List!33635) Bool)

(assert (=> b!1436246 (= res!969199 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33632))))

(declare-fun b!1436247 () Bool)

(declare-fun res!969197 () Bool)

(assert (=> b!1436247 (=> (not res!969197) (not e!810520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436247 (= res!969197 (validKeyInArray!0 (select (arr!47134 a!2862) j!93)))))

(declare-fun b!1436248 () Bool)

(declare-fun res!969198 () Bool)

(assert (=> b!1436248 (=> (not res!969198) (not e!810520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97675 (_ BitVec 32)) Bool)

(assert (=> b!1436248 (= res!969198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1436249 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436249 (= e!810520 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47684 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47684 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47684 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47134 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1436250 () Bool)

(declare-fun res!969202 () Bool)

(assert (=> b!1436250 (=> (not res!969202) (not e!810520))))

(assert (=> b!1436250 (= res!969202 (validKeyInArray!0 (select (arr!47134 a!2862) i!1006)))))

(declare-fun res!969201 () Bool)

(assert (=> start!124012 (=> (not res!969201) (not e!810520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124012 (= res!969201 (validMask!0 mask!2687))))

(assert (=> start!124012 e!810520))

(assert (=> start!124012 true))

(declare-fun array_inv!36162 (array!97675) Bool)

(assert (=> start!124012 (array_inv!36162 a!2862)))

(assert (= (and start!124012 res!969201) b!1436245))

(assert (= (and b!1436245 res!969200) b!1436250))

(assert (= (and b!1436250 res!969202) b!1436247))

(assert (= (and b!1436247 res!969197) b!1436248))

(assert (= (and b!1436248 res!969198) b!1436246))

(assert (= (and b!1436246 res!969199) b!1436249))

(declare-fun m!1325593 () Bool)

(assert (=> b!1436250 m!1325593))

(assert (=> b!1436250 m!1325593))

(declare-fun m!1325595 () Bool)

(assert (=> b!1436250 m!1325595))

(declare-fun m!1325597 () Bool)

(assert (=> b!1436249 m!1325597))

(declare-fun m!1325599 () Bool)

(assert (=> b!1436249 m!1325599))

(declare-fun m!1325601 () Bool)

(assert (=> start!124012 m!1325601))

(declare-fun m!1325603 () Bool)

(assert (=> start!124012 m!1325603))

(declare-fun m!1325605 () Bool)

(assert (=> b!1436248 m!1325605))

(declare-fun m!1325607 () Bool)

(assert (=> b!1436247 m!1325607))

(assert (=> b!1436247 m!1325607))

(declare-fun m!1325609 () Bool)

(assert (=> b!1436247 m!1325609))

(declare-fun m!1325611 () Bool)

(assert (=> b!1436246 m!1325611))

(push 1)

(assert (not b!1436246))

(assert (not b!1436247))

(assert (not b!1436250))

(assert (not start!124012))

(assert (not b!1436248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

