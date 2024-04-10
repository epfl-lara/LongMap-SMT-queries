; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119038 () Bool)

(assert start!119038)

(declare-fun res!929384 () Bool)

(declare-fun e!786923 () Bool)

(assert (=> start!119038 (=> (not res!929384) (not e!786923))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119038 (= res!929384 (validMask!0 mask!2840))))

(assert (=> start!119038 e!786923))

(assert (=> start!119038 true))

(declare-datatypes ((array!95008 0))(
  ( (array!95009 (arr!45871 (Array (_ BitVec 32) (_ BitVec 64))) (size!46421 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95008)

(declare-fun array_inv!34899 (array!95008) Bool)

(assert (=> start!119038 (array_inv!34899 a!2901)))

(declare-fun b!1389190 () Bool)

(declare-fun res!929387 () Bool)

(assert (=> b!1389190 (=> (not res!929387) (not e!786923))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389190 (= res!929387 (validKeyInArray!0 (select (arr!45871 a!2901) i!1037)))))

(declare-fun b!1389191 () Bool)

(assert (=> b!1389191 (= e!786923 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!610494 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389191 (= lt!610494 (toIndex!0 (select (arr!45871 a!2901) j!112) mask!2840))))

(declare-fun b!1389192 () Bool)

(declare-fun res!929385 () Bool)

(assert (=> b!1389192 (=> (not res!929385) (not e!786923))))

(assert (=> b!1389192 (= res!929385 (validKeyInArray!0 (select (arr!45871 a!2901) j!112)))))

(declare-fun b!1389193 () Bool)

(declare-fun res!929389 () Bool)

(assert (=> b!1389193 (=> (not res!929389) (not e!786923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95008 (_ BitVec 32)) Bool)

(assert (=> b!1389193 (= res!929389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389194 () Bool)

(declare-fun res!929388 () Bool)

(assert (=> b!1389194 (=> (not res!929388) (not e!786923))))

(assert (=> b!1389194 (= res!929388 (and (= (size!46421 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46421 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46421 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389195 () Bool)

(declare-fun res!929386 () Bool)

(assert (=> b!1389195 (=> (not res!929386) (not e!786923))))

(declare-datatypes ((List!32390 0))(
  ( (Nil!32387) (Cons!32386 (h!33601 (_ BitVec 64)) (t!47084 List!32390)) )
))
(declare-fun arrayNoDuplicates!0 (array!95008 (_ BitVec 32) List!32390) Bool)

(assert (=> b!1389195 (= res!929386 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32387))))

(assert (= (and start!119038 res!929384) b!1389194))

(assert (= (and b!1389194 res!929388) b!1389190))

(assert (= (and b!1389190 res!929387) b!1389192))

(assert (= (and b!1389192 res!929385) b!1389193))

(assert (= (and b!1389193 res!929389) b!1389195))

(assert (= (and b!1389195 res!929386) b!1389191))

(declare-fun m!1274865 () Bool)

(assert (=> b!1389191 m!1274865))

(assert (=> b!1389191 m!1274865))

(declare-fun m!1274867 () Bool)

(assert (=> b!1389191 m!1274867))

(declare-fun m!1274869 () Bool)

(assert (=> b!1389193 m!1274869))

(declare-fun m!1274871 () Bool)

(assert (=> start!119038 m!1274871))

(declare-fun m!1274873 () Bool)

(assert (=> start!119038 m!1274873))

(assert (=> b!1389192 m!1274865))

(assert (=> b!1389192 m!1274865))

(declare-fun m!1274875 () Bool)

(assert (=> b!1389192 m!1274875))

(declare-fun m!1274877 () Bool)

(assert (=> b!1389190 m!1274877))

(assert (=> b!1389190 m!1274877))

(declare-fun m!1274879 () Bool)

(assert (=> b!1389190 m!1274879))

(declare-fun m!1274881 () Bool)

(assert (=> b!1389195 m!1274881))

(push 1)

(assert (not b!1389193))

(assert (not b!1389192))

(assert (not start!119038))

(assert (not b!1389191))

(assert (not b!1389195))

(assert (not b!1389190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

