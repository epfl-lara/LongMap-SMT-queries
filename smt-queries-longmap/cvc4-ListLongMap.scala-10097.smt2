; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119044 () Bool)

(assert start!119044)

(declare-fun b!1389244 () Bool)

(declare-fun res!929439 () Bool)

(declare-fun e!786940 () Bool)

(assert (=> b!1389244 (=> (not res!929439) (not e!786940))))

(declare-datatypes ((array!95014 0))(
  ( (array!95015 (arr!45874 (Array (_ BitVec 32) (_ BitVec 64))) (size!46424 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95014)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95014 (_ BitVec 32)) Bool)

(assert (=> b!1389244 (= res!929439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389245 () Bool)

(assert (=> b!1389245 (= e!786940 false)))

(declare-fun lt!610503 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389245 (= lt!610503 (toIndex!0 (select (arr!45874 a!2901) j!112) mask!2840))))

(declare-fun b!1389246 () Bool)

(declare-fun res!929443 () Bool)

(assert (=> b!1389246 (=> (not res!929443) (not e!786940))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389246 (= res!929443 (and (= (size!46424 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46424 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46424 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389247 () Bool)

(declare-fun res!929438 () Bool)

(assert (=> b!1389247 (=> (not res!929438) (not e!786940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389247 (= res!929438 (validKeyInArray!0 (select (arr!45874 a!2901) j!112)))))

(declare-fun b!1389248 () Bool)

(declare-fun res!929442 () Bool)

(assert (=> b!1389248 (=> (not res!929442) (not e!786940))))

(declare-datatypes ((List!32393 0))(
  ( (Nil!32390) (Cons!32389 (h!33604 (_ BitVec 64)) (t!47087 List!32393)) )
))
(declare-fun arrayNoDuplicates!0 (array!95014 (_ BitVec 32) List!32393) Bool)

(assert (=> b!1389248 (= res!929442 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32390))))

(declare-fun res!929441 () Bool)

(assert (=> start!119044 (=> (not res!929441) (not e!786940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119044 (= res!929441 (validMask!0 mask!2840))))

(assert (=> start!119044 e!786940))

(assert (=> start!119044 true))

(declare-fun array_inv!34902 (array!95014) Bool)

(assert (=> start!119044 (array_inv!34902 a!2901)))

(declare-fun b!1389249 () Bool)

(declare-fun res!929440 () Bool)

(assert (=> b!1389249 (=> (not res!929440) (not e!786940))))

(assert (=> b!1389249 (= res!929440 (validKeyInArray!0 (select (arr!45874 a!2901) i!1037)))))

(assert (= (and start!119044 res!929441) b!1389246))

(assert (= (and b!1389246 res!929443) b!1389249))

(assert (= (and b!1389249 res!929440) b!1389247))

(assert (= (and b!1389247 res!929438) b!1389244))

(assert (= (and b!1389244 res!929439) b!1389248))

(assert (= (and b!1389248 res!929442) b!1389245))

(declare-fun m!1274919 () Bool)

(assert (=> b!1389247 m!1274919))

(assert (=> b!1389247 m!1274919))

(declare-fun m!1274921 () Bool)

(assert (=> b!1389247 m!1274921))

(assert (=> b!1389245 m!1274919))

(assert (=> b!1389245 m!1274919))

(declare-fun m!1274923 () Bool)

(assert (=> b!1389245 m!1274923))

(declare-fun m!1274925 () Bool)

(assert (=> start!119044 m!1274925))

(declare-fun m!1274927 () Bool)

(assert (=> start!119044 m!1274927))

(declare-fun m!1274929 () Bool)

(assert (=> b!1389248 m!1274929))

(declare-fun m!1274931 () Bool)

(assert (=> b!1389249 m!1274931))

(assert (=> b!1389249 m!1274931))

(declare-fun m!1274933 () Bool)

(assert (=> b!1389249 m!1274933))

(declare-fun m!1274935 () Bool)

(assert (=> b!1389244 m!1274935))

(push 1)

(assert (not b!1389248))

(assert (not b!1389247))

(assert (not b!1389245))

(assert (not b!1389244))

(assert (not b!1389249))

(assert (not start!119044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

