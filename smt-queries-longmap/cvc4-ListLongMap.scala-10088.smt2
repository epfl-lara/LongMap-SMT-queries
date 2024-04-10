; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118870 () Bool)

(assert start!118870)

(declare-fun b!1388514 () Bool)

(declare-fun e!786566 () Bool)

(declare-datatypes ((array!94948 0))(
  ( (array!94949 (arr!45847 (Array (_ BitVec 32) (_ BitVec 64))) (size!46397 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94948)

(assert (=> b!1388514 (= e!786566 (bvsgt #b00000000000000000000000000000000 (size!46397 a!2901)))))

(declare-fun b!1388511 () Bool)

(declare-fun res!928797 () Bool)

(assert (=> b!1388511 (=> (not res!928797) (not e!786566))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388511 (= res!928797 (and (= (size!46397 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46397 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46397 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!928796 () Bool)

(assert (=> start!118870 (=> (not res!928796) (not e!786566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118870 (= res!928796 (validMask!0 mask!2840))))

(assert (=> start!118870 e!786566))

(assert (=> start!118870 true))

(declare-fun array_inv!34875 (array!94948) Bool)

(assert (=> start!118870 (array_inv!34875 a!2901)))

(declare-fun b!1388513 () Bool)

(declare-fun res!928795 () Bool)

(assert (=> b!1388513 (=> (not res!928795) (not e!786566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388513 (= res!928795 (validKeyInArray!0 (select (arr!45847 a!2901) j!112)))))

(declare-fun b!1388512 () Bool)

(declare-fun res!928798 () Bool)

(assert (=> b!1388512 (=> (not res!928798) (not e!786566))))

(assert (=> b!1388512 (= res!928798 (validKeyInArray!0 (select (arr!45847 a!2901) i!1037)))))

(assert (= (and start!118870 res!928796) b!1388511))

(assert (= (and b!1388511 res!928797) b!1388512))

(assert (= (and b!1388512 res!928798) b!1388513))

(assert (= (and b!1388513 res!928795) b!1388514))

(declare-fun m!1274265 () Bool)

(assert (=> start!118870 m!1274265))

(declare-fun m!1274267 () Bool)

(assert (=> start!118870 m!1274267))

(declare-fun m!1274269 () Bool)

(assert (=> b!1388513 m!1274269))

(assert (=> b!1388513 m!1274269))

(declare-fun m!1274271 () Bool)

(assert (=> b!1388513 m!1274271))

(declare-fun m!1274273 () Bool)

(assert (=> b!1388512 m!1274273))

(assert (=> b!1388512 m!1274273))

(declare-fun m!1274275 () Bool)

(assert (=> b!1388512 m!1274275))

(push 1)

(assert (not b!1388512))

(assert (not b!1388513))

(assert (not start!118870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

