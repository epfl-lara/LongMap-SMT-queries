; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124108 () Bool)

(assert start!124108)

(declare-fun b!1436742 () Bool)

(declare-fun res!969631 () Bool)

(declare-fun e!810742 () Bool)

(assert (=> b!1436742 (=> (not res!969631) (not e!810742))))

(declare-datatypes ((array!97712 0))(
  ( (array!97713 (arr!47150 (Array (_ BitVec 32) (_ BitVec 64))) (size!47700 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97712)

(declare-datatypes ((List!33651 0))(
  ( (Nil!33648) (Cons!33647 (h!34985 (_ BitVec 64)) (t!48345 List!33651)) )
))
(declare-fun arrayNoDuplicates!0 (array!97712 (_ BitVec 32) List!33651) Bool)

(assert (=> b!1436742 (= res!969631 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33648))))

(declare-fun b!1436743 () Bool)

(declare-fun res!969628 () Bool)

(assert (=> b!1436743 (=> (not res!969628) (not e!810742))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436743 (= res!969628 (validKeyInArray!0 (select (arr!47150 a!2862) i!1006)))))

(declare-fun res!969625 () Bool)

(assert (=> start!124108 (=> (not res!969625) (not e!810742))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124108 (= res!969625 (validMask!0 mask!2687))))

(assert (=> start!124108 e!810742))

(assert (=> start!124108 true))

(declare-fun array_inv!36178 (array!97712) Bool)

(assert (=> start!124108 (array_inv!36178 a!2862)))

(declare-fun b!1436744 () Bool)

(declare-fun res!969626 () Bool)

(assert (=> b!1436744 (=> (not res!969626) (not e!810742))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436744 (= res!969626 (validKeyInArray!0 (select (arr!47150 a!2862) j!93)))))

(declare-fun b!1436745 () Bool)

(declare-fun res!969629 () Bool)

(assert (=> b!1436745 (=> (not res!969629) (not e!810742))))

(assert (=> b!1436745 (= res!969629 (and (= (size!47700 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47700 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47700 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436746 () Bool)

(declare-fun res!969630 () Bool)

(assert (=> b!1436746 (=> (not res!969630) (not e!810742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97712 (_ BitVec 32)) Bool)

(assert (=> b!1436746 (= res!969630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436747 () Bool)

(declare-fun res!969627 () Bool)

(assert (=> b!1436747 (=> (not res!969627) (not e!810742))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436747 (= res!969627 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47700 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47700 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47700 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47150 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436748 () Bool)

(assert (=> b!1436748 (= e!810742 false)))

(declare-fun lt!632205 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436748 (= lt!632205 (toIndex!0 (select (arr!47150 a!2862) j!93) mask!2687))))

(assert (= (and start!124108 res!969625) b!1436745))

(assert (= (and b!1436745 res!969629) b!1436743))

(assert (= (and b!1436743 res!969628) b!1436744))

(assert (= (and b!1436744 res!969626) b!1436746))

(assert (= (and b!1436746 res!969630) b!1436742))

(assert (= (and b!1436742 res!969631) b!1436747))

(assert (= (and b!1436747 res!969627) b!1436748))

(declare-fun m!1326031 () Bool)

(assert (=> b!1436748 m!1326031))

(assert (=> b!1436748 m!1326031))

(declare-fun m!1326033 () Bool)

(assert (=> b!1436748 m!1326033))

(declare-fun m!1326035 () Bool)

(assert (=> b!1436746 m!1326035))

(declare-fun m!1326037 () Bool)

(assert (=> b!1436742 m!1326037))

(declare-fun m!1326039 () Bool)

(assert (=> b!1436747 m!1326039))

(declare-fun m!1326041 () Bool)

(assert (=> b!1436747 m!1326041))

(declare-fun m!1326043 () Bool)

(assert (=> b!1436743 m!1326043))

(assert (=> b!1436743 m!1326043))

(declare-fun m!1326045 () Bool)

(assert (=> b!1436743 m!1326045))

(assert (=> b!1436744 m!1326031))

(assert (=> b!1436744 m!1326031))

(declare-fun m!1326047 () Bool)

(assert (=> b!1436744 m!1326047))

(declare-fun m!1326049 () Bool)

(assert (=> start!124108 m!1326049))

(declare-fun m!1326051 () Bool)

(assert (=> start!124108 m!1326051))

(push 1)

(assert (not b!1436746))

(assert (not b!1436748))

(assert (not b!1436743))

(assert (not b!1436742))

(assert (not b!1436744))

(assert (not start!124108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

