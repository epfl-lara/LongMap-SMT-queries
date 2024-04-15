; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124076 () Bool)

(assert start!124076)

(declare-fun b!1436526 () Bool)

(declare-fun res!969528 () Bool)

(declare-fun e!810620 () Bool)

(assert (=> b!1436526 (=> (not res!969528) (not e!810620))))

(declare-datatypes ((array!97658 0))(
  ( (array!97659 (arr!47124 (Array (_ BitVec 32) (_ BitVec 64))) (size!47676 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97658)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436526 (= res!969528 (validKeyInArray!0 (select (arr!47124 a!2862) i!1006)))))

(declare-fun b!1436527 () Bool)

(declare-fun res!969532 () Bool)

(assert (=> b!1436527 (=> (not res!969532) (not e!810620))))

(declare-datatypes ((List!33703 0))(
  ( (Nil!33700) (Cons!33699 (h!35037 (_ BitVec 64)) (t!48389 List!33703)) )
))
(declare-fun arrayNoDuplicates!0 (array!97658 (_ BitVec 32) List!33703) Bool)

(assert (=> b!1436527 (= res!969532 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33700))))

(declare-fun b!1436528 () Bool)

(declare-fun res!969526 () Bool)

(assert (=> b!1436528 (=> (not res!969526) (not e!810620))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436528 (= res!969526 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47676 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47676 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47676 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!969531 () Bool)

(assert (=> start!124076 (=> (not res!969531) (not e!810620))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124076 (= res!969531 (validMask!0 mask!2687))))

(assert (=> start!124076 e!810620))

(assert (=> start!124076 true))

(declare-fun array_inv!36357 (array!97658) Bool)

(assert (=> start!124076 (array_inv!36357 a!2862)))

(declare-fun b!1436529 () Bool)

(declare-fun res!969527 () Bool)

(assert (=> b!1436529 (=> (not res!969527) (not e!810620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97658 (_ BitVec 32)) Bool)

(assert (=> b!1436529 (= res!969527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436530 () Bool)

(declare-fun res!969530 () Bool)

(assert (=> b!1436530 (=> (not res!969530) (not e!810620))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436530 (= res!969530 (and (= (size!47676 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47676 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47676 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436531 () Bool)

(declare-fun res!969529 () Bool)

(assert (=> b!1436531 (=> (not res!969529) (not e!810620))))

(assert (=> b!1436531 (= res!969529 (validKeyInArray!0 (select (arr!47124 a!2862) j!93)))))

(declare-fun b!1436532 () Bool)

(assert (=> b!1436532 (= e!810620 false)))

(declare-fun lt!631968 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436532 (= lt!631968 (toIndex!0 (select (arr!47124 a!2862) j!93) mask!2687))))

(assert (= (and start!124076 res!969531) b!1436530))

(assert (= (and b!1436530 res!969530) b!1436526))

(assert (= (and b!1436526 res!969528) b!1436531))

(assert (= (and b!1436531 res!969529) b!1436529))

(assert (= (and b!1436529 res!969527) b!1436527))

(assert (= (and b!1436527 res!969532) b!1436528))

(assert (= (and b!1436528 res!969526) b!1436532))

(declare-fun m!1325333 () Bool)

(assert (=> b!1436527 m!1325333))

(declare-fun m!1325335 () Bool)

(assert (=> start!124076 m!1325335))

(declare-fun m!1325337 () Bool)

(assert (=> start!124076 m!1325337))

(declare-fun m!1325339 () Bool)

(assert (=> b!1436532 m!1325339))

(assert (=> b!1436532 m!1325339))

(declare-fun m!1325341 () Bool)

(assert (=> b!1436532 m!1325341))

(declare-fun m!1325343 () Bool)

(assert (=> b!1436528 m!1325343))

(declare-fun m!1325345 () Bool)

(assert (=> b!1436528 m!1325345))

(declare-fun m!1325347 () Bool)

(assert (=> b!1436529 m!1325347))

(declare-fun m!1325349 () Bool)

(assert (=> b!1436526 m!1325349))

(assert (=> b!1436526 m!1325349))

(declare-fun m!1325351 () Bool)

(assert (=> b!1436526 m!1325351))

(assert (=> b!1436531 m!1325339))

(assert (=> b!1436531 m!1325339))

(declare-fun m!1325353 () Bool)

(assert (=> b!1436531 m!1325353))

(push 1)

(assert (not b!1436531))

(assert (not b!1436527))

(assert (not b!1436529))

(assert (not b!1436526))

(assert (not b!1436532))

(assert (not start!124076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

