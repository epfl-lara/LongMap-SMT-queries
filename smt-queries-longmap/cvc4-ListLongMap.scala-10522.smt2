; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124106 () Bool)

(assert start!124106)

(declare-fun b!1436721 () Bool)

(declare-fun res!969604 () Bool)

(declare-fun e!810736 () Bool)

(assert (=> b!1436721 (=> (not res!969604) (not e!810736))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97710 0))(
  ( (array!97711 (arr!47149 (Array (_ BitVec 32) (_ BitVec 64))) (size!47699 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97710)

(assert (=> b!1436721 (= res!969604 (and (= (size!47699 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47699 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47699 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436722 () Bool)

(declare-fun res!969607 () Bool)

(assert (=> b!1436722 (=> (not res!969607) (not e!810736))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436722 (= res!969607 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47699 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47699 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47699 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47149 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!969609 () Bool)

(assert (=> start!124106 (=> (not res!969609) (not e!810736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124106 (= res!969609 (validMask!0 mask!2687))))

(assert (=> start!124106 e!810736))

(assert (=> start!124106 true))

(declare-fun array_inv!36177 (array!97710) Bool)

(assert (=> start!124106 (array_inv!36177 a!2862)))

(declare-fun b!1436723 () Bool)

(assert (=> b!1436723 (= e!810736 false)))

(declare-fun lt!632202 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436723 (= lt!632202 (toIndex!0 (select (arr!47149 a!2862) j!93) mask!2687))))

(declare-fun b!1436724 () Bool)

(declare-fun res!969606 () Bool)

(assert (=> b!1436724 (=> (not res!969606) (not e!810736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436724 (= res!969606 (validKeyInArray!0 (select (arr!47149 a!2862) j!93)))))

(declare-fun b!1436725 () Bool)

(declare-fun res!969610 () Bool)

(assert (=> b!1436725 (=> (not res!969610) (not e!810736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97710 (_ BitVec 32)) Bool)

(assert (=> b!1436725 (= res!969610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436726 () Bool)

(declare-fun res!969605 () Bool)

(assert (=> b!1436726 (=> (not res!969605) (not e!810736))))

(declare-datatypes ((List!33650 0))(
  ( (Nil!33647) (Cons!33646 (h!34984 (_ BitVec 64)) (t!48344 List!33650)) )
))
(declare-fun arrayNoDuplicates!0 (array!97710 (_ BitVec 32) List!33650) Bool)

(assert (=> b!1436726 (= res!969605 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33647))))

(declare-fun b!1436727 () Bool)

(declare-fun res!969608 () Bool)

(assert (=> b!1436727 (=> (not res!969608) (not e!810736))))

(assert (=> b!1436727 (= res!969608 (validKeyInArray!0 (select (arr!47149 a!2862) i!1006)))))

(assert (= (and start!124106 res!969609) b!1436721))

(assert (= (and b!1436721 res!969604) b!1436727))

(assert (= (and b!1436727 res!969608) b!1436724))

(assert (= (and b!1436724 res!969606) b!1436725))

(assert (= (and b!1436725 res!969610) b!1436726))

(assert (= (and b!1436726 res!969605) b!1436722))

(assert (= (and b!1436722 res!969607) b!1436723))

(declare-fun m!1326009 () Bool)

(assert (=> b!1436723 m!1326009))

(assert (=> b!1436723 m!1326009))

(declare-fun m!1326011 () Bool)

(assert (=> b!1436723 m!1326011))

(declare-fun m!1326013 () Bool)

(assert (=> b!1436726 m!1326013))

(declare-fun m!1326015 () Bool)

(assert (=> b!1436722 m!1326015))

(declare-fun m!1326017 () Bool)

(assert (=> b!1436722 m!1326017))

(assert (=> b!1436724 m!1326009))

(assert (=> b!1436724 m!1326009))

(declare-fun m!1326019 () Bool)

(assert (=> b!1436724 m!1326019))

(declare-fun m!1326021 () Bool)

(assert (=> b!1436727 m!1326021))

(assert (=> b!1436727 m!1326021))

(declare-fun m!1326023 () Bool)

(assert (=> b!1436727 m!1326023))

(declare-fun m!1326025 () Bool)

(assert (=> b!1436725 m!1326025))

(declare-fun m!1326027 () Bool)

(assert (=> start!124106 m!1326027))

(declare-fun m!1326029 () Bool)

(assert (=> start!124106 m!1326029))

(push 1)

(assert (not start!124106))

(assert (not b!1436723))

(assert (not b!1436726))

(assert (not b!1436724))

(assert (not b!1436727))

(assert (not b!1436725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

