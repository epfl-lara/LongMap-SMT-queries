; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124082 () Bool)

(assert start!124082)

(declare-fun b!1436589 () Bool)

(declare-fun res!969591 () Bool)

(declare-fun e!810639 () Bool)

(assert (=> b!1436589 (=> (not res!969591) (not e!810639))))

(declare-datatypes ((array!97664 0))(
  ( (array!97665 (arr!47127 (Array (_ BitVec 32) (_ BitVec 64))) (size!47679 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97664)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436589 (= res!969591 (validKeyInArray!0 (select (arr!47127 a!2862) j!93)))))

(declare-fun res!969594 () Bool)

(assert (=> start!124082 (=> (not res!969594) (not e!810639))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124082 (= res!969594 (validMask!0 mask!2687))))

(assert (=> start!124082 e!810639))

(assert (=> start!124082 true))

(declare-fun array_inv!36360 (array!97664) Bool)

(assert (=> start!124082 (array_inv!36360 a!2862)))

(declare-fun b!1436590 () Bool)

(declare-fun res!969589 () Bool)

(assert (=> b!1436590 (=> (not res!969589) (not e!810639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97664 (_ BitVec 32)) Bool)

(assert (=> b!1436590 (= res!969589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436591 () Bool)

(declare-fun res!969595 () Bool)

(assert (=> b!1436591 (=> (not res!969595) (not e!810639))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436591 (= res!969595 (validKeyInArray!0 (select (arr!47127 a!2862) i!1006)))))

(declare-fun b!1436592 () Bool)

(declare-fun res!969590 () Bool)

(assert (=> b!1436592 (=> (not res!969590) (not e!810639))))

(declare-datatypes ((List!33706 0))(
  ( (Nil!33703) (Cons!33702 (h!35040 (_ BitVec 64)) (t!48392 List!33706)) )
))
(declare-fun arrayNoDuplicates!0 (array!97664 (_ BitVec 32) List!33706) Bool)

(assert (=> b!1436592 (= res!969590 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33703))))

(declare-fun b!1436593 () Bool)

(assert (=> b!1436593 (= e!810639 false)))

(declare-fun lt!631977 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436593 (= lt!631977 (toIndex!0 (select (arr!47127 a!2862) j!93) mask!2687))))

(declare-fun b!1436594 () Bool)

(declare-fun res!969592 () Bool)

(assert (=> b!1436594 (=> (not res!969592) (not e!810639))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436594 (= res!969592 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47679 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47679 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47679 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436595 () Bool)

(declare-fun res!969593 () Bool)

(assert (=> b!1436595 (=> (not res!969593) (not e!810639))))

(assert (=> b!1436595 (= res!969593 (and (= (size!47679 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47679 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47679 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124082 res!969594) b!1436595))

(assert (= (and b!1436595 res!969593) b!1436591))

(assert (= (and b!1436591 res!969595) b!1436589))

(assert (= (and b!1436589 res!969591) b!1436590))

(assert (= (and b!1436590 res!969589) b!1436592))

(assert (= (and b!1436592 res!969590) b!1436594))

(assert (= (and b!1436594 res!969592) b!1436593))

(declare-fun m!1325399 () Bool)

(assert (=> b!1436592 m!1325399))

(declare-fun m!1325401 () Bool)

(assert (=> start!124082 m!1325401))

(declare-fun m!1325403 () Bool)

(assert (=> start!124082 m!1325403))

(declare-fun m!1325405 () Bool)

(assert (=> b!1436589 m!1325405))

(assert (=> b!1436589 m!1325405))

(declare-fun m!1325407 () Bool)

(assert (=> b!1436589 m!1325407))

(declare-fun m!1325409 () Bool)

(assert (=> b!1436594 m!1325409))

(declare-fun m!1325411 () Bool)

(assert (=> b!1436594 m!1325411))

(declare-fun m!1325413 () Bool)

(assert (=> b!1436590 m!1325413))

(declare-fun m!1325415 () Bool)

(assert (=> b!1436591 m!1325415))

(assert (=> b!1436591 m!1325415))

(declare-fun m!1325417 () Bool)

(assert (=> b!1436591 m!1325417))

(assert (=> b!1436593 m!1325405))

(assert (=> b!1436593 m!1325405))

(declare-fun m!1325419 () Bool)

(assert (=> b!1436593 m!1325419))

(push 1)

(assert (not b!1436590))

(assert (not b!1436593))

(assert (not b!1436592))

(assert (not b!1436589))

(assert (not b!1436591))

(assert (not start!124082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

