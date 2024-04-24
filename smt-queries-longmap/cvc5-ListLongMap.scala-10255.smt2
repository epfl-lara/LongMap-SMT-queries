; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120774 () Bool)

(assert start!120774)

(declare-fun b!1405202 () Bool)

(declare-fun res!943031 () Bool)

(declare-fun e!795653 () Bool)

(assert (=> b!1405202 (=> (not res!943031) (not e!795653))))

(declare-datatypes ((array!96105 0))(
  ( (array!96106 (arr!46401 (Array (_ BitVec 32) (_ BitVec 64))) (size!46952 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96105)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405202 (= res!943031 (validKeyInArray!0 (select (arr!46401 a!2901) i!1037)))))

(declare-fun b!1405203 () Bool)

(declare-fun res!943029 () Bool)

(assert (=> b!1405203 (=> (not res!943029) (not e!795653))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405203 (= res!943029 (and (= (size!46952 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46952 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46952 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943032 () Bool)

(assert (=> start!120774 (=> (not res!943032) (not e!795653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120774 (= res!943032 (validMask!0 mask!2840))))

(assert (=> start!120774 e!795653))

(assert (=> start!120774 true))

(declare-fun array_inv!35682 (array!96105) Bool)

(assert (=> start!120774 (array_inv!35682 a!2901)))

(declare-fun b!1405204 () Bool)

(assert (=> b!1405204 (= e!795653 false)))

(declare-fun lt!618980 () Bool)

(declare-datatypes ((List!32907 0))(
  ( (Nil!32904) (Cons!32903 (h!34159 (_ BitVec 64)) (t!47593 List!32907)) )
))
(declare-fun arrayNoDuplicates!0 (array!96105 (_ BitVec 32) List!32907) Bool)

(assert (=> b!1405204 (= lt!618980 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32904))))

(declare-fun b!1405205 () Bool)

(declare-fun res!943030 () Bool)

(assert (=> b!1405205 (=> (not res!943030) (not e!795653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96105 (_ BitVec 32)) Bool)

(assert (=> b!1405205 (= res!943030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405206 () Bool)

(declare-fun res!943033 () Bool)

(assert (=> b!1405206 (=> (not res!943033) (not e!795653))))

(assert (=> b!1405206 (= res!943033 (validKeyInArray!0 (select (arr!46401 a!2901) j!112)))))

(assert (= (and start!120774 res!943032) b!1405203))

(assert (= (and b!1405203 res!943029) b!1405202))

(assert (= (and b!1405202 res!943031) b!1405206))

(assert (= (and b!1405206 res!943033) b!1405205))

(assert (= (and b!1405205 res!943030) b!1405204))

(declare-fun m!1294239 () Bool)

(assert (=> start!120774 m!1294239))

(declare-fun m!1294241 () Bool)

(assert (=> start!120774 m!1294241))

(declare-fun m!1294243 () Bool)

(assert (=> b!1405206 m!1294243))

(assert (=> b!1405206 m!1294243))

(declare-fun m!1294245 () Bool)

(assert (=> b!1405206 m!1294245))

(declare-fun m!1294247 () Bool)

(assert (=> b!1405204 m!1294247))

(declare-fun m!1294249 () Bool)

(assert (=> b!1405205 m!1294249))

(declare-fun m!1294251 () Bool)

(assert (=> b!1405202 m!1294251))

(assert (=> b!1405202 m!1294251))

(declare-fun m!1294253 () Bool)

(assert (=> b!1405202 m!1294253))

(push 1)

(assert (not b!1405204))

(assert (not b!1405205))

(assert (not b!1405206))

(assert (not b!1405202))

(assert (not start!120774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

