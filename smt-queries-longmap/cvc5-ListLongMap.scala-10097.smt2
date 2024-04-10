; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119040 () Bool)

(assert start!119040)

(declare-fun res!929402 () Bool)

(declare-fun e!786928 () Bool)

(assert (=> start!119040 (=> (not res!929402) (not e!786928))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119040 (= res!929402 (validMask!0 mask!2840))))

(assert (=> start!119040 e!786928))

(assert (=> start!119040 true))

(declare-datatypes ((array!95010 0))(
  ( (array!95011 (arr!45872 (Array (_ BitVec 32) (_ BitVec 64))) (size!46422 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95010)

(declare-fun array_inv!34900 (array!95010) Bool)

(assert (=> start!119040 (array_inv!34900 a!2901)))

(declare-fun b!1389208 () Bool)

(declare-fun res!929407 () Bool)

(assert (=> b!1389208 (=> (not res!929407) (not e!786928))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389208 (= res!929407 (validKeyInArray!0 (select (arr!45872 a!2901) i!1037)))))

(declare-fun b!1389209 () Bool)

(declare-fun res!929406 () Bool)

(assert (=> b!1389209 (=> (not res!929406) (not e!786928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95010 (_ BitVec 32)) Bool)

(assert (=> b!1389209 (= res!929406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389210 () Bool)

(declare-fun res!929404 () Bool)

(assert (=> b!1389210 (=> (not res!929404) (not e!786928))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389210 (= res!929404 (and (= (size!46422 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46422 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46422 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389211 () Bool)

(declare-fun res!929405 () Bool)

(assert (=> b!1389211 (=> (not res!929405) (not e!786928))))

(assert (=> b!1389211 (= res!929405 (validKeyInArray!0 (select (arr!45872 a!2901) j!112)))))

(declare-fun b!1389212 () Bool)

(declare-fun res!929403 () Bool)

(assert (=> b!1389212 (=> (not res!929403) (not e!786928))))

(declare-datatypes ((List!32391 0))(
  ( (Nil!32388) (Cons!32387 (h!33602 (_ BitVec 64)) (t!47085 List!32391)) )
))
(declare-fun arrayNoDuplicates!0 (array!95010 (_ BitVec 32) List!32391) Bool)

(assert (=> b!1389212 (= res!929403 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32388))))

(declare-fun b!1389213 () Bool)

(assert (=> b!1389213 (= e!786928 false)))

(declare-fun lt!610497 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389213 (= lt!610497 (toIndex!0 (select (arr!45872 a!2901) j!112) mask!2840))))

(assert (= (and start!119040 res!929402) b!1389210))

(assert (= (and b!1389210 res!929404) b!1389208))

(assert (= (and b!1389208 res!929407) b!1389211))

(assert (= (and b!1389211 res!929405) b!1389209))

(assert (= (and b!1389209 res!929406) b!1389212))

(assert (= (and b!1389212 res!929403) b!1389213))

(declare-fun m!1274883 () Bool)

(assert (=> b!1389209 m!1274883))

(declare-fun m!1274885 () Bool)

(assert (=> start!119040 m!1274885))

(declare-fun m!1274887 () Bool)

(assert (=> start!119040 m!1274887))

(declare-fun m!1274889 () Bool)

(assert (=> b!1389212 m!1274889))

(declare-fun m!1274891 () Bool)

(assert (=> b!1389213 m!1274891))

(assert (=> b!1389213 m!1274891))

(declare-fun m!1274893 () Bool)

(assert (=> b!1389213 m!1274893))

(assert (=> b!1389211 m!1274891))

(assert (=> b!1389211 m!1274891))

(declare-fun m!1274895 () Bool)

(assert (=> b!1389211 m!1274895))

(declare-fun m!1274897 () Bool)

(assert (=> b!1389208 m!1274897))

(assert (=> b!1389208 m!1274897))

(declare-fun m!1274899 () Bool)

(assert (=> b!1389208 m!1274899))

(push 1)

(assert (not b!1389208))

(assert (not start!119040))

(assert (not b!1389213))

(assert (not b!1389212))

(assert (not b!1389209))

(assert (not b!1389211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

