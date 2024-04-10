; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119094 () Bool)

(assert start!119094)

(declare-fun b!1389451 () Bool)

(declare-fun res!929615 () Bool)

(declare-fun e!787045 () Bool)

(assert (=> b!1389451 (=> (not res!929615) (not e!787045))))

(declare-datatypes ((array!95031 0))(
  ( (array!95032 (arr!45881 (Array (_ BitVec 32) (_ BitVec 64))) (size!46431 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95031)

(declare-datatypes ((List!32400 0))(
  ( (Nil!32397) (Cons!32396 (h!33614 (_ BitVec 64)) (t!47094 List!32400)) )
))
(declare-fun arrayNoDuplicates!0 (array!95031 (_ BitVec 32) List!32400) Bool)

(assert (=> b!1389451 (= res!929615 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32397))))

(declare-fun b!1389452 () Bool)

(declare-fun res!929616 () Bool)

(assert (=> b!1389452 (=> (not res!929616) (not e!787045))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389452 (= res!929616 (validKeyInArray!0 (select (arr!45881 a!2901) i!1037)))))

(declare-fun b!1389453 () Bool)

(declare-fun res!929614 () Bool)

(assert (=> b!1389453 (=> (not res!929614) (not e!787045))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95031 (_ BitVec 32)) Bool)

(assert (=> b!1389453 (= res!929614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389454 () Bool)

(assert (=> b!1389454 (= e!787045 false)))

(declare-fun lt!610569 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389454 (= lt!610569 (toIndex!0 (select (arr!45881 a!2901) j!112) mask!2840))))

(declare-fun res!929612 () Bool)

(assert (=> start!119094 (=> (not res!929612) (not e!787045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119094 (= res!929612 (validMask!0 mask!2840))))

(assert (=> start!119094 e!787045))

(assert (=> start!119094 true))

(declare-fun array_inv!34909 (array!95031) Bool)

(assert (=> start!119094 (array_inv!34909 a!2901)))

(declare-fun b!1389455 () Bool)

(declare-fun res!929613 () Bool)

(assert (=> b!1389455 (=> (not res!929613) (not e!787045))))

(assert (=> b!1389455 (= res!929613 (validKeyInArray!0 (select (arr!45881 a!2901) j!112)))))

(declare-fun b!1389456 () Bool)

(declare-fun res!929617 () Bool)

(assert (=> b!1389456 (=> (not res!929617) (not e!787045))))

(assert (=> b!1389456 (= res!929617 (and (= (size!46431 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46431 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46431 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119094 res!929612) b!1389456))

(assert (= (and b!1389456 res!929617) b!1389452))

(assert (= (and b!1389452 res!929616) b!1389455))

(assert (= (and b!1389455 res!929613) b!1389453))

(assert (= (and b!1389453 res!929614) b!1389451))

(assert (= (and b!1389451 res!929615) b!1389454))

(declare-fun m!1275093 () Bool)

(assert (=> b!1389452 m!1275093))

(assert (=> b!1389452 m!1275093))

(declare-fun m!1275095 () Bool)

(assert (=> b!1389452 m!1275095))

(declare-fun m!1275097 () Bool)

(assert (=> b!1389451 m!1275097))

(declare-fun m!1275099 () Bool)

(assert (=> b!1389455 m!1275099))

(assert (=> b!1389455 m!1275099))

(declare-fun m!1275101 () Bool)

(assert (=> b!1389455 m!1275101))

(declare-fun m!1275103 () Bool)

(assert (=> start!119094 m!1275103))

(declare-fun m!1275105 () Bool)

(assert (=> start!119094 m!1275105))

(declare-fun m!1275107 () Bool)

(assert (=> b!1389453 m!1275107))

(assert (=> b!1389454 m!1275099))

(assert (=> b!1389454 m!1275099))

(declare-fun m!1275109 () Bool)

(assert (=> b!1389454 m!1275109))

(push 1)

(assert (not b!1389454))

(assert (not b!1389451))

(assert (not b!1389455))

(assert (not start!119094))

(assert (not b!1389452))

(assert (not b!1389453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

