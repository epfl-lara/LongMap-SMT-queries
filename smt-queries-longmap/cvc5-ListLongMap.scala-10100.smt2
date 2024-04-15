; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119094 () Bool)

(assert start!119094)

(declare-fun b!1389406 () Bool)

(declare-fun res!929619 () Bool)

(declare-fun e!787019 () Bool)

(assert (=> b!1389406 (=> (not res!929619) (not e!787019))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!94984 0))(
  ( (array!94985 (arr!45858 (Array (_ BitVec 32) (_ BitVec 64))) (size!46410 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94984)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389406 (= res!929619 (and (= (size!46410 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46410 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46410 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389407 () Bool)

(declare-fun res!929623 () Bool)

(assert (=> b!1389407 (=> (not res!929623) (not e!787019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94984 (_ BitVec 32)) Bool)

(assert (=> b!1389407 (= res!929623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389408 () Bool)

(assert (=> b!1389408 (= e!787019 false)))

(declare-fun lt!610385 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389408 (= lt!610385 (toIndex!0 (select (arr!45858 a!2901) j!112) mask!2840))))

(declare-fun b!1389409 () Bool)

(declare-fun res!929622 () Bool)

(assert (=> b!1389409 (=> (not res!929622) (not e!787019))))

(declare-datatypes ((List!32455 0))(
  ( (Nil!32452) (Cons!32451 (h!33669 (_ BitVec 64)) (t!47141 List!32455)) )
))
(declare-fun arrayNoDuplicates!0 (array!94984 (_ BitVec 32) List!32455) Bool)

(assert (=> b!1389409 (= res!929622 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32452))))

(declare-fun b!1389411 () Bool)

(declare-fun res!929620 () Bool)

(assert (=> b!1389411 (=> (not res!929620) (not e!787019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389411 (= res!929620 (validKeyInArray!0 (select (arr!45858 a!2901) j!112)))))

(declare-fun b!1389410 () Bool)

(declare-fun res!929621 () Bool)

(assert (=> b!1389410 (=> (not res!929621) (not e!787019))))

(assert (=> b!1389410 (= res!929621 (validKeyInArray!0 (select (arr!45858 a!2901) i!1037)))))

(declare-fun res!929618 () Bool)

(assert (=> start!119094 (=> (not res!929618) (not e!787019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119094 (= res!929618 (validMask!0 mask!2840))))

(assert (=> start!119094 e!787019))

(assert (=> start!119094 true))

(declare-fun array_inv!35091 (array!94984) Bool)

(assert (=> start!119094 (array_inv!35091 a!2901)))

(assert (= (and start!119094 res!929618) b!1389406))

(assert (= (and b!1389406 res!929619) b!1389410))

(assert (= (and b!1389410 res!929621) b!1389411))

(assert (= (and b!1389411 res!929620) b!1389407))

(assert (= (and b!1389407 res!929623) b!1389409))

(assert (= (and b!1389409 res!929622) b!1389408))

(declare-fun m!1274593 () Bool)

(assert (=> b!1389410 m!1274593))

(assert (=> b!1389410 m!1274593))

(declare-fun m!1274595 () Bool)

(assert (=> b!1389410 m!1274595))

(declare-fun m!1274597 () Bool)

(assert (=> b!1389407 m!1274597))

(declare-fun m!1274599 () Bool)

(assert (=> start!119094 m!1274599))

(declare-fun m!1274601 () Bool)

(assert (=> start!119094 m!1274601))

(declare-fun m!1274603 () Bool)

(assert (=> b!1389411 m!1274603))

(assert (=> b!1389411 m!1274603))

(declare-fun m!1274605 () Bool)

(assert (=> b!1389411 m!1274605))

(assert (=> b!1389408 m!1274603))

(assert (=> b!1389408 m!1274603))

(declare-fun m!1274607 () Bool)

(assert (=> b!1389408 m!1274607))

(declare-fun m!1274609 () Bool)

(assert (=> b!1389409 m!1274609))

(push 1)

(assert (not b!1389409))

(assert (not b!1389410))

(assert (not start!119094))

(assert (not b!1389407))

(assert (not b!1389411))

(assert (not b!1389408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

