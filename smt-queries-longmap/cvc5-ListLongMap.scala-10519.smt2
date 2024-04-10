; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124048 () Bool)

(assert start!124048)

(declare-fun b!1436409 () Bool)

(declare-fun res!969331 () Bool)

(declare-fun e!810607 () Bool)

(assert (=> b!1436409 (=> (not res!969331) (not e!810607))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97685 0))(
  ( (array!97686 (arr!47138 (Array (_ BitVec 32) (_ BitVec 64))) (size!47688 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97685)

(assert (=> b!1436409 (= res!969331 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47688 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47688 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47688 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47138 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436410 () Bool)

(declare-fun res!969326 () Bool)

(assert (=> b!1436410 (=> (not res!969326) (not e!810607))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97685 (_ BitVec 32)) Bool)

(assert (=> b!1436410 (= res!969326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436411 () Bool)

(declare-fun res!969330 () Bool)

(assert (=> b!1436411 (=> (not res!969330) (not e!810607))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436411 (= res!969330 (validKeyInArray!0 (select (arr!47138 a!2862) j!93)))))

(declare-fun b!1436412 () Bool)

(declare-fun res!969327 () Bool)

(assert (=> b!1436412 (=> (not res!969327) (not e!810607))))

(assert (=> b!1436412 (= res!969327 (and (= (size!47688 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47688 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47688 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436413 () Bool)

(declare-fun res!969325 () Bool)

(assert (=> b!1436413 (=> (not res!969325) (not e!810607))))

(declare-datatypes ((List!33639 0))(
  ( (Nil!33636) (Cons!33635 (h!34970 (_ BitVec 64)) (t!48333 List!33639)) )
))
(declare-fun arrayNoDuplicates!0 (array!97685 (_ BitVec 32) List!33639) Bool)

(assert (=> b!1436413 (= res!969325 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33636))))

(declare-fun b!1436414 () Bool)

(assert (=> b!1436414 (= e!810607 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632124 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436414 (= lt!632124 (toIndex!0 (select (arr!47138 a!2862) j!93) mask!2687))))

(declare-fun res!969328 () Bool)

(assert (=> start!124048 (=> (not res!969328) (not e!810607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124048 (= res!969328 (validMask!0 mask!2687))))

(assert (=> start!124048 e!810607))

(assert (=> start!124048 true))

(declare-fun array_inv!36166 (array!97685) Bool)

(assert (=> start!124048 (array_inv!36166 a!2862)))

(declare-fun b!1436415 () Bool)

(declare-fun res!969329 () Bool)

(assert (=> b!1436415 (=> (not res!969329) (not e!810607))))

(assert (=> b!1436415 (= res!969329 (validKeyInArray!0 (select (arr!47138 a!2862) i!1006)))))

(assert (= (and start!124048 res!969328) b!1436412))

(assert (= (and b!1436412 res!969327) b!1436415))

(assert (= (and b!1436415 res!969329) b!1436411))

(assert (= (and b!1436411 res!969330) b!1436410))

(assert (= (and b!1436410 res!969326) b!1436413))

(assert (= (and b!1436413 res!969325) b!1436409))

(assert (= (and b!1436409 res!969331) b!1436414))

(declare-fun m!1325719 () Bool)

(assert (=> start!124048 m!1325719))

(declare-fun m!1325721 () Bool)

(assert (=> start!124048 m!1325721))

(declare-fun m!1325723 () Bool)

(assert (=> b!1436413 m!1325723))

(declare-fun m!1325725 () Bool)

(assert (=> b!1436411 m!1325725))

(assert (=> b!1436411 m!1325725))

(declare-fun m!1325727 () Bool)

(assert (=> b!1436411 m!1325727))

(declare-fun m!1325729 () Bool)

(assert (=> b!1436410 m!1325729))

(declare-fun m!1325731 () Bool)

(assert (=> b!1436409 m!1325731))

(declare-fun m!1325733 () Bool)

(assert (=> b!1436409 m!1325733))

(assert (=> b!1436414 m!1325725))

(assert (=> b!1436414 m!1325725))

(declare-fun m!1325735 () Bool)

(assert (=> b!1436414 m!1325735))

(declare-fun m!1325737 () Bool)

(assert (=> b!1436415 m!1325737))

(assert (=> b!1436415 m!1325737))

(declare-fun m!1325739 () Bool)

(assert (=> b!1436415 m!1325739))

(push 1)

(assert (not b!1436410))

(assert (not b!1436414))

(assert (not b!1436415))

(assert (not b!1436411))

(assert (not b!1436413))

(assert (not start!124048))

(check-sat)

(pop 1)

