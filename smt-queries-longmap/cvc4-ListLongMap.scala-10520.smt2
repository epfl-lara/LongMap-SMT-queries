; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124058 () Bool)

(assert start!124058)

(declare-fun b!1436514 () Bool)

(declare-fun res!969430 () Bool)

(declare-fun e!810638 () Bool)

(assert (=> b!1436514 (=> (not res!969430) (not e!810638))))

(declare-datatypes ((array!97695 0))(
  ( (array!97696 (arr!47143 (Array (_ BitVec 32) (_ BitVec 64))) (size!47693 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97695)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97695 (_ BitVec 32)) Bool)

(assert (=> b!1436514 (= res!969430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436515 () Bool)

(declare-fun res!969433 () Bool)

(assert (=> b!1436515 (=> (not res!969433) (not e!810638))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436515 (= res!969433 (validKeyInArray!0 (select (arr!47143 a!2862) i!1006)))))

(declare-fun b!1436516 () Bool)

(declare-fun res!969436 () Bool)

(assert (=> b!1436516 (=> (not res!969436) (not e!810638))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436516 (= res!969436 (validKeyInArray!0 (select (arr!47143 a!2862) j!93)))))

(declare-fun b!1436517 () Bool)

(assert (=> b!1436517 (= e!810638 false)))

(declare-fun lt!632139 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436517 (= lt!632139 (toIndex!0 (select (arr!47143 a!2862) j!93) mask!2687))))

(declare-fun b!1436518 () Bool)

(declare-fun res!969435 () Bool)

(assert (=> b!1436518 (=> (not res!969435) (not e!810638))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436518 (= res!969435 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47693 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47693 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47693 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47143 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!969434 () Bool)

(assert (=> start!124058 (=> (not res!969434) (not e!810638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124058 (= res!969434 (validMask!0 mask!2687))))

(assert (=> start!124058 e!810638))

(assert (=> start!124058 true))

(declare-fun array_inv!36171 (array!97695) Bool)

(assert (=> start!124058 (array_inv!36171 a!2862)))

(declare-fun b!1436519 () Bool)

(declare-fun res!969431 () Bool)

(assert (=> b!1436519 (=> (not res!969431) (not e!810638))))

(assert (=> b!1436519 (= res!969431 (and (= (size!47693 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47693 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47693 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436520 () Bool)

(declare-fun res!969432 () Bool)

(assert (=> b!1436520 (=> (not res!969432) (not e!810638))))

(declare-datatypes ((List!33644 0))(
  ( (Nil!33641) (Cons!33640 (h!34975 (_ BitVec 64)) (t!48338 List!33644)) )
))
(declare-fun arrayNoDuplicates!0 (array!97695 (_ BitVec 32) List!33644) Bool)

(assert (=> b!1436520 (= res!969432 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33641))))

(assert (= (and start!124058 res!969434) b!1436519))

(assert (= (and b!1436519 res!969431) b!1436515))

(assert (= (and b!1436515 res!969433) b!1436516))

(assert (= (and b!1436516 res!969436) b!1436514))

(assert (= (and b!1436514 res!969430) b!1436520))

(assert (= (and b!1436520 res!969432) b!1436518))

(assert (= (and b!1436518 res!969435) b!1436517))

(declare-fun m!1325829 () Bool)

(assert (=> start!124058 m!1325829))

(declare-fun m!1325831 () Bool)

(assert (=> start!124058 m!1325831))

(declare-fun m!1325833 () Bool)

(assert (=> b!1436514 m!1325833))

(declare-fun m!1325835 () Bool)

(assert (=> b!1436516 m!1325835))

(assert (=> b!1436516 m!1325835))

(declare-fun m!1325837 () Bool)

(assert (=> b!1436516 m!1325837))

(assert (=> b!1436517 m!1325835))

(assert (=> b!1436517 m!1325835))

(declare-fun m!1325839 () Bool)

(assert (=> b!1436517 m!1325839))

(declare-fun m!1325841 () Bool)

(assert (=> b!1436520 m!1325841))

(declare-fun m!1325843 () Bool)

(assert (=> b!1436515 m!1325843))

(assert (=> b!1436515 m!1325843))

(declare-fun m!1325845 () Bool)

(assert (=> b!1436515 m!1325845))

(declare-fun m!1325847 () Bool)

(assert (=> b!1436518 m!1325847))

(declare-fun m!1325849 () Bool)

(assert (=> b!1436518 m!1325849))

(push 1)

(assert (not b!1436515))

(assert (not start!124058))

(assert (not b!1436516))

(assert (not b!1436514))

(assert (not b!1436517))

(assert (not b!1436520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

