; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124056 () Bool)

(assert start!124056)

(declare-fun b!1436493 () Bool)

(declare-fun res!969413 () Bool)

(declare-fun e!810631 () Bool)

(assert (=> b!1436493 (=> (not res!969413) (not e!810631))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97693 0))(
  ( (array!97694 (arr!47142 (Array (_ BitVec 32) (_ BitVec 64))) (size!47692 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97693)

(assert (=> b!1436493 (= res!969413 (and (= (size!47692 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47692 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47692 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436495 () Bool)

(assert (=> b!1436495 (= e!810631 false)))

(declare-fun lt!632136 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436495 (= lt!632136 (toIndex!0 (select (arr!47142 a!2862) j!93) mask!2687))))

(declare-fun b!1436496 () Bool)

(declare-fun res!969415 () Bool)

(assert (=> b!1436496 (=> (not res!969415) (not e!810631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436496 (= res!969415 (validKeyInArray!0 (select (arr!47142 a!2862) j!93)))))

(declare-fun b!1436497 () Bool)

(declare-fun res!969411 () Bool)

(assert (=> b!1436497 (=> (not res!969411) (not e!810631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97693 (_ BitVec 32)) Bool)

(assert (=> b!1436497 (= res!969411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436498 () Bool)

(declare-fun res!969414 () Bool)

(assert (=> b!1436498 (=> (not res!969414) (not e!810631))))

(assert (=> b!1436498 (= res!969414 (validKeyInArray!0 (select (arr!47142 a!2862) i!1006)))))

(declare-fun b!1436499 () Bool)

(declare-fun res!969412 () Bool)

(assert (=> b!1436499 (=> (not res!969412) (not e!810631))))

(declare-datatypes ((List!33643 0))(
  ( (Nil!33640) (Cons!33639 (h!34974 (_ BitVec 64)) (t!48337 List!33643)) )
))
(declare-fun arrayNoDuplicates!0 (array!97693 (_ BitVec 32) List!33643) Bool)

(assert (=> b!1436499 (= res!969412 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33640))))

(declare-fun res!969410 () Bool)

(assert (=> start!124056 (=> (not res!969410) (not e!810631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124056 (= res!969410 (validMask!0 mask!2687))))

(assert (=> start!124056 e!810631))

(assert (=> start!124056 true))

(declare-fun array_inv!36170 (array!97693) Bool)

(assert (=> start!124056 (array_inv!36170 a!2862)))

(declare-fun b!1436494 () Bool)

(declare-fun res!969409 () Bool)

(assert (=> b!1436494 (=> (not res!969409) (not e!810631))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436494 (= res!969409 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47692 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47692 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47692 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124056 res!969410) b!1436493))

(assert (= (and b!1436493 res!969413) b!1436498))

(assert (= (and b!1436498 res!969414) b!1436496))

(assert (= (and b!1436496 res!969415) b!1436497))

(assert (= (and b!1436497 res!969411) b!1436499))

(assert (= (and b!1436499 res!969412) b!1436494))

(assert (= (and b!1436494 res!969409) b!1436495))

(declare-fun m!1325807 () Bool)

(assert (=> b!1436494 m!1325807))

(declare-fun m!1325809 () Bool)

(assert (=> b!1436494 m!1325809))

(declare-fun m!1325811 () Bool)

(assert (=> b!1436496 m!1325811))

(assert (=> b!1436496 m!1325811))

(declare-fun m!1325813 () Bool)

(assert (=> b!1436496 m!1325813))

(declare-fun m!1325815 () Bool)

(assert (=> b!1436497 m!1325815))

(assert (=> b!1436495 m!1325811))

(assert (=> b!1436495 m!1325811))

(declare-fun m!1325817 () Bool)

(assert (=> b!1436495 m!1325817))

(declare-fun m!1325819 () Bool)

(assert (=> b!1436498 m!1325819))

(assert (=> b!1436498 m!1325819))

(declare-fun m!1325821 () Bool)

(assert (=> b!1436498 m!1325821))

(declare-fun m!1325823 () Bool)

(assert (=> b!1436499 m!1325823))

(declare-fun m!1325825 () Bool)

(assert (=> start!124056 m!1325825))

(declare-fun m!1325827 () Bool)

(assert (=> start!124056 m!1325827))

(check-sat (not b!1436496) (not b!1436497) (not b!1436499) (not start!124056) (not b!1436495) (not b!1436498))
