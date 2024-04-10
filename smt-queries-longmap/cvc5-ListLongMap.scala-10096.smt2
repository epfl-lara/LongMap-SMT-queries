; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119034 () Bool)

(assert start!119034)

(declare-fun b!1389154 () Bool)

(declare-fun e!786911 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1389154 (= e!786911 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((array!95004 0))(
  ( (array!95005 (arr!45869 (Array (_ BitVec 32) (_ BitVec 64))) (size!46419 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95004)

(declare-fun lt!610488 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389154 (= lt!610488 (toIndex!0 (select (arr!45869 a!2901) j!112) mask!2840))))

(declare-fun res!929352 () Bool)

(assert (=> start!119034 (=> (not res!929352) (not e!786911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119034 (= res!929352 (validMask!0 mask!2840))))

(assert (=> start!119034 e!786911))

(assert (=> start!119034 true))

(declare-fun array_inv!34897 (array!95004) Bool)

(assert (=> start!119034 (array_inv!34897 a!2901)))

(declare-fun b!1389155 () Bool)

(declare-fun res!929351 () Bool)

(assert (=> b!1389155 (=> (not res!929351) (not e!786911))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389155 (= res!929351 (validKeyInArray!0 (select (arr!45869 a!2901) i!1037)))))

(declare-fun b!1389156 () Bool)

(declare-fun res!929348 () Bool)

(assert (=> b!1389156 (=> (not res!929348) (not e!786911))))

(assert (=> b!1389156 (= res!929348 (and (= (size!46419 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46419 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46419 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389157 () Bool)

(declare-fun res!929349 () Bool)

(assert (=> b!1389157 (=> (not res!929349) (not e!786911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95004 (_ BitVec 32)) Bool)

(assert (=> b!1389157 (= res!929349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389158 () Bool)

(declare-fun res!929353 () Bool)

(assert (=> b!1389158 (=> (not res!929353) (not e!786911))))

(assert (=> b!1389158 (= res!929353 (validKeyInArray!0 (select (arr!45869 a!2901) j!112)))))

(declare-fun b!1389159 () Bool)

(declare-fun res!929350 () Bool)

(assert (=> b!1389159 (=> (not res!929350) (not e!786911))))

(declare-datatypes ((List!32388 0))(
  ( (Nil!32385) (Cons!32384 (h!33599 (_ BitVec 64)) (t!47082 List!32388)) )
))
(declare-fun arrayNoDuplicates!0 (array!95004 (_ BitVec 32) List!32388) Bool)

(assert (=> b!1389159 (= res!929350 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32385))))

(assert (= (and start!119034 res!929352) b!1389156))

(assert (= (and b!1389156 res!929348) b!1389155))

(assert (= (and b!1389155 res!929351) b!1389158))

(assert (= (and b!1389158 res!929353) b!1389157))

(assert (= (and b!1389157 res!929349) b!1389159))

(assert (= (and b!1389159 res!929350) b!1389154))

(declare-fun m!1274829 () Bool)

(assert (=> b!1389155 m!1274829))

(assert (=> b!1389155 m!1274829))

(declare-fun m!1274831 () Bool)

(assert (=> b!1389155 m!1274831))

(declare-fun m!1274833 () Bool)

(assert (=> b!1389158 m!1274833))

(assert (=> b!1389158 m!1274833))

(declare-fun m!1274835 () Bool)

(assert (=> b!1389158 m!1274835))

(assert (=> b!1389154 m!1274833))

(assert (=> b!1389154 m!1274833))

(declare-fun m!1274837 () Bool)

(assert (=> b!1389154 m!1274837))

(declare-fun m!1274839 () Bool)

(assert (=> b!1389159 m!1274839))

(declare-fun m!1274841 () Bool)

(assert (=> b!1389157 m!1274841))

(declare-fun m!1274843 () Bool)

(assert (=> start!119034 m!1274843))

(declare-fun m!1274845 () Bool)

(assert (=> start!119034 m!1274845))

(push 1)

(assert (not start!119034))

(assert (not b!1389154))

(assert (not b!1389155))

(assert (not b!1389157))

(assert (not b!1389158))

