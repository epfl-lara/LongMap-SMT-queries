; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119112 () Bool)

(assert start!119112)

(declare-fun b!1389613 () Bool)

(declare-fun res!929776 () Bool)

(declare-fun e!787099 () Bool)

(assert (=> b!1389613 (=> (not res!929776) (not e!787099))))

(declare-datatypes ((array!95049 0))(
  ( (array!95050 (arr!45890 (Array (_ BitVec 32) (_ BitVec 64))) (size!46440 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95049)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95049 (_ BitVec 32)) Bool)

(assert (=> b!1389613 (= res!929776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389614 () Bool)

(declare-fun res!929778 () Bool)

(assert (=> b!1389614 (=> (not res!929778) (not e!787099))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389614 (= res!929778 (and (= (size!46440 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46440 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46440 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929775 () Bool)

(assert (=> start!119112 (=> (not res!929775) (not e!787099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119112 (= res!929775 (validMask!0 mask!2840))))

(assert (=> start!119112 e!787099))

(assert (=> start!119112 true))

(declare-fun array_inv!34918 (array!95049) Bool)

(assert (=> start!119112 (array_inv!34918 a!2901)))

(declare-fun b!1389615 () Bool)

(declare-fun res!929774 () Bool)

(assert (=> b!1389615 (=> (not res!929774) (not e!787099))))

(declare-datatypes ((List!32409 0))(
  ( (Nil!32406) (Cons!32405 (h!33623 (_ BitVec 64)) (t!47103 List!32409)) )
))
(declare-fun arrayNoDuplicates!0 (array!95049 (_ BitVec 32) List!32409) Bool)

(assert (=> b!1389615 (= res!929774 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32406))))

(declare-fun b!1389616 () Bool)

(declare-fun res!929777 () Bool)

(assert (=> b!1389616 (=> (not res!929777) (not e!787099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389616 (= res!929777 (validKeyInArray!0 (select (arr!45890 a!2901) i!1037)))))

(declare-fun b!1389617 () Bool)

(declare-fun res!929779 () Bool)

(assert (=> b!1389617 (=> (not res!929779) (not e!787099))))

(assert (=> b!1389617 (= res!929779 (validKeyInArray!0 (select (arr!45890 a!2901) j!112)))))

(declare-fun b!1389618 () Bool)

(assert (=> b!1389618 (= e!787099 false)))

(declare-datatypes ((SeekEntryResult!10207 0))(
  ( (MissingZero!10207 (index!43199 (_ BitVec 32))) (Found!10207 (index!43200 (_ BitVec 32))) (Intermediate!10207 (undefined!11019 Bool) (index!43201 (_ BitVec 32)) (x!124893 (_ BitVec 32))) (Undefined!10207) (MissingVacant!10207 (index!43202 (_ BitVec 32))) )
))
(declare-fun lt!610596 () SeekEntryResult!10207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95049 (_ BitVec 32)) SeekEntryResult!10207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389618 (= lt!610596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45890 a!2901) j!112) mask!2840) (select (arr!45890 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119112 res!929775) b!1389614))

(assert (= (and b!1389614 res!929778) b!1389616))

(assert (= (and b!1389616 res!929777) b!1389617))

(assert (= (and b!1389617 res!929779) b!1389613))

(assert (= (and b!1389613 res!929776) b!1389615))

(assert (= (and b!1389615 res!929774) b!1389618))

(declare-fun m!1275267 () Bool)

(assert (=> b!1389616 m!1275267))

(assert (=> b!1389616 m!1275267))

(declare-fun m!1275269 () Bool)

(assert (=> b!1389616 m!1275269))

(declare-fun m!1275271 () Bool)

(assert (=> b!1389615 m!1275271))

(declare-fun m!1275273 () Bool)

(assert (=> start!119112 m!1275273))

(declare-fun m!1275275 () Bool)

(assert (=> start!119112 m!1275275))

(declare-fun m!1275277 () Bool)

(assert (=> b!1389613 m!1275277))

(declare-fun m!1275279 () Bool)

(assert (=> b!1389618 m!1275279))

(assert (=> b!1389618 m!1275279))

(declare-fun m!1275281 () Bool)

(assert (=> b!1389618 m!1275281))

(assert (=> b!1389618 m!1275281))

(assert (=> b!1389618 m!1275279))

(declare-fun m!1275283 () Bool)

(assert (=> b!1389618 m!1275283))

(assert (=> b!1389617 m!1275279))

(assert (=> b!1389617 m!1275279))

(declare-fun m!1275285 () Bool)

(assert (=> b!1389617 m!1275285))

(push 1)

(assert (not b!1389617))

(assert (not b!1389615))

(assert (not b!1389618))

(assert (not start!119112))

(assert (not b!1389616))

(assert (not b!1389613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

