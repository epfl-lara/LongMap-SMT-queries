; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124112 () Bool)

(assert start!124112)

(declare-fun b!1436922 () Bool)

(declare-fun res!969924 () Bool)

(declare-fun e!810728 () Bool)

(assert (=> b!1436922 (=> (not res!969924) (not e!810728))))

(declare-datatypes ((array!97694 0))(
  ( (array!97695 (arr!47142 (Array (_ BitVec 32) (_ BitVec 64))) (size!47694 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97694)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436922 (= res!969924 (validKeyInArray!0 (select (arr!47142 a!2862) j!93)))))

(declare-fun b!1436923 () Bool)

(declare-fun res!969928 () Bool)

(assert (=> b!1436923 (=> (not res!969928) (not e!810728))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1436923 (= res!969928 (and (= (size!47694 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47694 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47694 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436924 () Bool)

(declare-fun res!969925 () Bool)

(assert (=> b!1436924 (=> (not res!969925) (not e!810728))))

(declare-datatypes ((List!33721 0))(
  ( (Nil!33718) (Cons!33717 (h!35055 (_ BitVec 64)) (t!48407 List!33721)) )
))
(declare-fun arrayNoDuplicates!0 (array!97694 (_ BitVec 32) List!33721) Bool)

(assert (=> b!1436924 (= res!969925 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33718))))

(declare-fun b!1436925 () Bool)

(declare-fun res!969926 () Bool)

(assert (=> b!1436925 (=> (not res!969926) (not e!810728))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1436925 (= res!969926 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47694 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47694 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47694 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436926 () Bool)

(assert (=> b!1436926 (= e!810728 false)))

(declare-datatypes ((SeekEntryResult!11419 0))(
  ( (MissingZero!11419 (index!48068 (_ BitVec 32))) (Found!11419 (index!48069 (_ BitVec 32))) (Intermediate!11419 (undefined!12231 Bool) (index!48070 (_ BitVec 32)) (x!129791 (_ BitVec 32))) (Undefined!11419) (MissingVacant!11419 (index!48071 (_ BitVec 32))) )
))
(declare-fun lt!632004 () SeekEntryResult!11419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97694 (_ BitVec 32)) SeekEntryResult!11419)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436926 (= lt!632004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47142 a!2862) j!93) mask!2687) (select (arr!47142 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436927 () Bool)

(declare-fun res!969923 () Bool)

(assert (=> b!1436927 (=> (not res!969923) (not e!810728))))

(assert (=> b!1436927 (= res!969923 (validKeyInArray!0 (select (arr!47142 a!2862) i!1006)))))

(declare-fun res!969922 () Bool)

(assert (=> start!124112 (=> (not res!969922) (not e!810728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124112 (= res!969922 (validMask!0 mask!2687))))

(assert (=> start!124112 e!810728))

(assert (=> start!124112 true))

(declare-fun array_inv!36375 (array!97694) Bool)

(assert (=> start!124112 (array_inv!36375 a!2862)))

(declare-fun b!1436928 () Bool)

(declare-fun res!969927 () Bool)

(assert (=> b!1436928 (=> (not res!969927) (not e!810728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97694 (_ BitVec 32)) Bool)

(assert (=> b!1436928 (= res!969927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124112 res!969922) b!1436923))

(assert (= (and b!1436923 res!969928) b!1436927))

(assert (= (and b!1436927 res!969923) b!1436922))

(assert (= (and b!1436922 res!969924) b!1436928))

(assert (= (and b!1436928 res!969927) b!1436924))

(assert (= (and b!1436924 res!969925) b!1436925))

(assert (= (and b!1436925 res!969926) b!1436926))

(declare-fun m!1325757 () Bool)

(assert (=> b!1436922 m!1325757))

(assert (=> b!1436922 m!1325757))

(declare-fun m!1325759 () Bool)

(assert (=> b!1436922 m!1325759))

(declare-fun m!1325761 () Bool)

(assert (=> b!1436924 m!1325761))

(declare-fun m!1325763 () Bool)

(assert (=> b!1436927 m!1325763))

(assert (=> b!1436927 m!1325763))

(declare-fun m!1325765 () Bool)

(assert (=> b!1436927 m!1325765))

(declare-fun m!1325767 () Bool)

(assert (=> b!1436928 m!1325767))

(assert (=> b!1436926 m!1325757))

(assert (=> b!1436926 m!1325757))

(declare-fun m!1325769 () Bool)

(assert (=> b!1436926 m!1325769))

(assert (=> b!1436926 m!1325769))

(assert (=> b!1436926 m!1325757))

(declare-fun m!1325771 () Bool)

(assert (=> b!1436926 m!1325771))

(declare-fun m!1325773 () Bool)

(assert (=> start!124112 m!1325773))

(declare-fun m!1325775 () Bool)

(assert (=> start!124112 m!1325775))

(declare-fun m!1325777 () Bool)

(assert (=> b!1436925 m!1325777))

(declare-fun m!1325779 () Bool)

(assert (=> b!1436925 m!1325779))

(push 1)

(assert (not b!1436928))

(assert (not b!1436926))

(assert (not start!124112))

(assert (not b!1436927))

(assert (not b!1436924))

(assert (not b!1436922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

