; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124054 () Bool)

(assert start!124054)

(declare-fun b!1436472 () Bool)

(declare-fun res!969388 () Bool)

(declare-fun e!810625 () Bool)

(assert (=> b!1436472 (=> (not res!969388) (not e!810625))))

(declare-datatypes ((array!97691 0))(
  ( (array!97692 (arr!47141 (Array (_ BitVec 32) (_ BitVec 64))) (size!47691 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97691)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436472 (= res!969388 (validKeyInArray!0 (select (arr!47141 a!2862) j!93)))))

(declare-fun res!969392 () Bool)

(assert (=> start!124054 (=> (not res!969392) (not e!810625))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124054 (= res!969392 (validMask!0 mask!2687))))

(assert (=> start!124054 e!810625))

(assert (=> start!124054 true))

(declare-fun array_inv!36169 (array!97691) Bool)

(assert (=> start!124054 (array_inv!36169 a!2862)))

(declare-fun b!1436473 () Bool)

(assert (=> b!1436473 (= e!810625 false)))

(declare-fun lt!632133 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436473 (= lt!632133 (toIndex!0 (select (arr!47141 a!2862) j!93) mask!2687))))

(declare-fun b!1436474 () Bool)

(declare-fun res!969394 () Bool)

(assert (=> b!1436474 (=> (not res!969394) (not e!810625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97691 (_ BitVec 32)) Bool)

(assert (=> b!1436474 (= res!969394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436475 () Bool)

(declare-fun res!969390 () Bool)

(assert (=> b!1436475 (=> (not res!969390) (not e!810625))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436475 (= res!969390 (validKeyInArray!0 (select (arr!47141 a!2862) i!1006)))))

(declare-fun b!1436476 () Bool)

(declare-fun res!969389 () Bool)

(assert (=> b!1436476 (=> (not res!969389) (not e!810625))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1436476 (= res!969389 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47691 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47691 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47691 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47141 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436477 () Bool)

(declare-fun res!969391 () Bool)

(assert (=> b!1436477 (=> (not res!969391) (not e!810625))))

(declare-datatypes ((List!33642 0))(
  ( (Nil!33639) (Cons!33638 (h!34973 (_ BitVec 64)) (t!48336 List!33642)) )
))
(declare-fun arrayNoDuplicates!0 (array!97691 (_ BitVec 32) List!33642) Bool)

(assert (=> b!1436477 (= res!969391 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33639))))

(declare-fun b!1436478 () Bool)

(declare-fun res!969393 () Bool)

(assert (=> b!1436478 (=> (not res!969393) (not e!810625))))

(assert (=> b!1436478 (= res!969393 (and (= (size!47691 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47691 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47691 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124054 res!969392) b!1436478))

(assert (= (and b!1436478 res!969393) b!1436475))

(assert (= (and b!1436475 res!969390) b!1436472))

(assert (= (and b!1436472 res!969388) b!1436474))

(assert (= (and b!1436474 res!969394) b!1436477))

(assert (= (and b!1436477 res!969391) b!1436476))

(assert (= (and b!1436476 res!969389) b!1436473))

(declare-fun m!1325785 () Bool)

(assert (=> b!1436475 m!1325785))

(assert (=> b!1436475 m!1325785))

(declare-fun m!1325787 () Bool)

(assert (=> b!1436475 m!1325787))

(declare-fun m!1325789 () Bool)

(assert (=> b!1436474 m!1325789))

(declare-fun m!1325791 () Bool)

(assert (=> b!1436476 m!1325791))

(declare-fun m!1325793 () Bool)

(assert (=> b!1436476 m!1325793))

(declare-fun m!1325795 () Bool)

(assert (=> b!1436473 m!1325795))

(assert (=> b!1436473 m!1325795))

(declare-fun m!1325797 () Bool)

(assert (=> b!1436473 m!1325797))

(declare-fun m!1325799 () Bool)

(assert (=> start!124054 m!1325799))

(declare-fun m!1325801 () Bool)

(assert (=> start!124054 m!1325801))

(declare-fun m!1325803 () Bool)

(assert (=> b!1436477 m!1325803))

(assert (=> b!1436472 m!1325795))

(assert (=> b!1436472 m!1325795))

(declare-fun m!1325805 () Bool)

(assert (=> b!1436472 m!1325805))

(push 1)

(assert (not b!1436472))

(assert (not b!1436473))

(assert (not b!1436474))

(assert (not b!1436477))

(assert (not b!1436475))

(assert (not start!124054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

