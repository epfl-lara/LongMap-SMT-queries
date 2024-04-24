; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119174 () Bool)

(assert start!119174)

(declare-fun res!929600 () Bool)

(declare-fun e!787531 () Bool)

(assert (=> start!119174 (=> (not res!929600) (not e!787531))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119174 (= res!929600 (validMask!0 mask!2840))))

(assert (=> start!119174 e!787531))

(assert (=> start!119174 true))

(declare-datatypes ((array!95093 0))(
  ( (array!95094 (arr!45913 (Array (_ BitVec 32) (_ BitVec 64))) (size!46464 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95093)

(declare-fun array_inv!35194 (array!95093) Bool)

(assert (=> start!119174 (array_inv!35194 a!2901)))

(declare-fun b!1390051 () Bool)

(declare-fun res!929602 () Bool)

(assert (=> b!1390051 (=> (not res!929602) (not e!787531))))

(declare-datatypes ((List!32419 0))(
  ( (Nil!32416) (Cons!32415 (h!33638 (_ BitVec 64)) (t!47105 List!32419)) )
))
(declare-fun arrayNoDuplicates!0 (array!95093 (_ BitVec 32) List!32419) Bool)

(assert (=> b!1390051 (= res!929602 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32416))))

(declare-fun b!1390052 () Bool)

(declare-fun res!929597 () Bool)

(assert (=> b!1390052 (=> (not res!929597) (not e!787531))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390052 (= res!929597 (and (= (size!46464 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46464 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46464 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390053 () Bool)

(declare-fun res!929598 () Bool)

(assert (=> b!1390053 (=> (not res!929598) (not e!787531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390053 (= res!929598 (validKeyInArray!0 (select (arr!45913 a!2901) j!112)))))

(declare-fun b!1390054 () Bool)

(assert (=> b!1390054 (= e!787531 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1390055 () Bool)

(declare-fun res!929599 () Bool)

(assert (=> b!1390055 (=> (not res!929599) (not e!787531))))

(assert (=> b!1390055 (= res!929599 (validKeyInArray!0 (select (arr!45913 a!2901) i!1037)))))

(declare-fun b!1390056 () Bool)

(declare-fun res!929601 () Bool)

(assert (=> b!1390056 (=> (not res!929601) (not e!787531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95093 (_ BitVec 32)) Bool)

(assert (=> b!1390056 (= res!929601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119174 res!929600) b!1390052))

(assert (= (and b!1390052 res!929597) b!1390055))

(assert (= (and b!1390055 res!929599) b!1390053))

(assert (= (and b!1390053 res!929598) b!1390056))

(assert (= (and b!1390056 res!929601) b!1390051))

(assert (= (and b!1390051 res!929602) b!1390054))

(declare-fun m!1276003 () Bool)

(assert (=> start!119174 m!1276003))

(declare-fun m!1276005 () Bool)

(assert (=> start!119174 m!1276005))

(declare-fun m!1276007 () Bool)

(assert (=> b!1390055 m!1276007))

(assert (=> b!1390055 m!1276007))

(declare-fun m!1276009 () Bool)

(assert (=> b!1390055 m!1276009))

(declare-fun m!1276011 () Bool)

(assert (=> b!1390056 m!1276011))

(declare-fun m!1276013 () Bool)

(assert (=> b!1390053 m!1276013))

(assert (=> b!1390053 m!1276013))

(declare-fun m!1276015 () Bool)

(assert (=> b!1390053 m!1276015))

(declare-fun m!1276017 () Bool)

(assert (=> b!1390051 m!1276017))

(check-sat (not b!1390053) (not b!1390051) (not start!119174) (not b!1390055) (not b!1390056))
(check-sat)
