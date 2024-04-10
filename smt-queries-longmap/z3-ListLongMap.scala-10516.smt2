; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124004 () Bool)

(assert start!124004)

(declare-fun res!969125 () Bool)

(declare-fun e!810496 () Bool)

(assert (=> start!124004 (=> (not res!969125) (not e!810496))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124004 (= res!969125 (validMask!0 mask!2687))))

(assert (=> start!124004 e!810496))

(assert (=> start!124004 true))

(declare-datatypes ((array!97667 0))(
  ( (array!97668 (arr!47130 (Array (_ BitVec 32) (_ BitVec 64))) (size!47680 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97667)

(declare-fun array_inv!36158 (array!97667) Bool)

(assert (=> start!124004 (array_inv!36158 a!2862)))

(declare-fun b!1436173 () Bool)

(declare-fun res!969130 () Bool)

(assert (=> b!1436173 (=> (not res!969130) (not e!810496))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436173 (= res!969130 (validKeyInArray!0 (select (arr!47130 a!2862) j!93)))))

(declare-fun b!1436174 () Bool)

(declare-fun res!969129 () Bool)

(assert (=> b!1436174 (=> (not res!969129) (not e!810496))))

(declare-datatypes ((List!33631 0))(
  ( (Nil!33628) (Cons!33627 (h!34962 (_ BitVec 64)) (t!48325 List!33631)) )
))
(declare-fun arrayNoDuplicates!0 (array!97667 (_ BitVec 32) List!33631) Bool)

(assert (=> b!1436174 (= res!969129 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33628))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1436175 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436175 (= e!810496 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47680 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47680 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47680 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1436176 () Bool)

(declare-fun res!969126 () Bool)

(assert (=> b!1436176 (=> (not res!969126) (not e!810496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97667 (_ BitVec 32)) Bool)

(assert (=> b!1436176 (= res!969126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436177 () Bool)

(declare-fun res!969128 () Bool)

(assert (=> b!1436177 (=> (not res!969128) (not e!810496))))

(assert (=> b!1436177 (= res!969128 (and (= (size!47680 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47680 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47680 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436178 () Bool)

(declare-fun res!969127 () Bool)

(assert (=> b!1436178 (=> (not res!969127) (not e!810496))))

(assert (=> b!1436178 (= res!969127 (validKeyInArray!0 (select (arr!47130 a!2862) i!1006)))))

(assert (= (and start!124004 res!969125) b!1436177))

(assert (= (and b!1436177 res!969128) b!1436178))

(assert (= (and b!1436178 res!969127) b!1436173))

(assert (= (and b!1436173 res!969130) b!1436176))

(assert (= (and b!1436176 res!969126) b!1436174))

(assert (= (and b!1436174 res!969129) b!1436175))

(declare-fun m!1325513 () Bool)

(assert (=> b!1436173 m!1325513))

(assert (=> b!1436173 m!1325513))

(declare-fun m!1325515 () Bool)

(assert (=> b!1436173 m!1325515))

(declare-fun m!1325517 () Bool)

(assert (=> start!124004 m!1325517))

(declare-fun m!1325519 () Bool)

(assert (=> start!124004 m!1325519))

(declare-fun m!1325521 () Bool)

(assert (=> b!1436176 m!1325521))

(declare-fun m!1325523 () Bool)

(assert (=> b!1436178 m!1325523))

(assert (=> b!1436178 m!1325523))

(declare-fun m!1325525 () Bool)

(assert (=> b!1436178 m!1325525))

(declare-fun m!1325527 () Bool)

(assert (=> b!1436175 m!1325527))

(declare-fun m!1325529 () Bool)

(assert (=> b!1436175 m!1325529))

(declare-fun m!1325531 () Bool)

(assert (=> b!1436174 m!1325531))

(check-sat (not b!1436176) (not b!1436174) (not b!1436173) (not b!1436178) (not start!124004))
(check-sat)
