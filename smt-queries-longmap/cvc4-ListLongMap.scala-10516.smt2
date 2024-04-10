; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124006 () Bool)

(assert start!124006)

(declare-fun b!1436191 () Bool)

(declare-fun res!969145 () Bool)

(declare-fun e!810503 () Bool)

(assert (=> b!1436191 (=> (not res!969145) (not e!810503))))

(declare-datatypes ((array!97669 0))(
  ( (array!97670 (arr!47131 (Array (_ BitVec 32) (_ BitVec 64))) (size!47681 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97669)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97669 (_ BitVec 32)) Bool)

(assert (=> b!1436191 (= res!969145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969147 () Bool)

(assert (=> start!124006 (=> (not res!969147) (not e!810503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124006 (= res!969147 (validMask!0 mask!2687))))

(assert (=> start!124006 e!810503))

(assert (=> start!124006 true))

(declare-fun array_inv!36159 (array!97669) Bool)

(assert (=> start!124006 (array_inv!36159 a!2862)))

(declare-fun b!1436192 () Bool)

(declare-fun res!969146 () Bool)

(assert (=> b!1436192 (=> (not res!969146) (not e!810503))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436192 (= res!969146 (and (= (size!47681 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47681 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47681 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436193 () Bool)

(declare-fun res!969148 () Bool)

(assert (=> b!1436193 (=> (not res!969148) (not e!810503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436193 (= res!969148 (validKeyInArray!0 (select (arr!47131 a!2862) i!1006)))))

(declare-fun b!1436194 () Bool)

(declare-fun res!969144 () Bool)

(assert (=> b!1436194 (=> (not res!969144) (not e!810503))))

(declare-datatypes ((List!33632 0))(
  ( (Nil!33629) (Cons!33628 (h!34963 (_ BitVec 64)) (t!48326 List!33632)) )
))
(declare-fun arrayNoDuplicates!0 (array!97669 (_ BitVec 32) List!33632) Bool)

(assert (=> b!1436194 (= res!969144 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33629))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1436195 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1436195 (= e!810503 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47681 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47681 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47681 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47131 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1436196 () Bool)

(declare-fun res!969143 () Bool)

(assert (=> b!1436196 (=> (not res!969143) (not e!810503))))

(assert (=> b!1436196 (= res!969143 (validKeyInArray!0 (select (arr!47131 a!2862) j!93)))))

(assert (= (and start!124006 res!969147) b!1436192))

(assert (= (and b!1436192 res!969146) b!1436193))

(assert (= (and b!1436193 res!969148) b!1436196))

(assert (= (and b!1436196 res!969143) b!1436191))

(assert (= (and b!1436191 res!969145) b!1436194))

(assert (= (and b!1436194 res!969144) b!1436195))

(declare-fun m!1325533 () Bool)

(assert (=> start!124006 m!1325533))

(declare-fun m!1325535 () Bool)

(assert (=> start!124006 m!1325535))

(declare-fun m!1325537 () Bool)

(assert (=> b!1436195 m!1325537))

(declare-fun m!1325539 () Bool)

(assert (=> b!1436195 m!1325539))

(declare-fun m!1325541 () Bool)

(assert (=> b!1436193 m!1325541))

(assert (=> b!1436193 m!1325541))

(declare-fun m!1325543 () Bool)

(assert (=> b!1436193 m!1325543))

(declare-fun m!1325545 () Bool)

(assert (=> b!1436196 m!1325545))

(assert (=> b!1436196 m!1325545))

(declare-fun m!1325547 () Bool)

(assert (=> b!1436196 m!1325547))

(declare-fun m!1325549 () Bool)

(assert (=> b!1436194 m!1325549))

(declare-fun m!1325551 () Bool)

(assert (=> b!1436191 m!1325551))

(push 1)

(assert (not b!1436193))

(assert (not b!1436196))

(assert (not start!124006))

(assert (not b!1436194))

(assert (not b!1436191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

