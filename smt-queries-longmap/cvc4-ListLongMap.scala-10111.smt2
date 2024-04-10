; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119164 () Bool)

(assert start!119164)

(declare-fun b!1390098 () Bool)

(declare-fun res!930263 () Bool)

(declare-fun e!787274 () Bool)

(assert (=> b!1390098 (=> (not res!930263) (not e!787274))))

(declare-datatypes ((array!95101 0))(
  ( (array!95102 (arr!45916 (Array (_ BitVec 32) (_ BitVec 64))) (size!46466 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95101)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95101 (_ BitVec 32)) Bool)

(assert (=> b!1390098 (= res!930263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!787273 () Bool)

(declare-fun b!1390099 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10233 0))(
  ( (MissingZero!10233 (index!43303 (_ BitVec 32))) (Found!10233 (index!43304 (_ BitVec 32))) (Intermediate!10233 (undefined!11045 Bool) (index!43305 (_ BitVec 32)) (x!124983 (_ BitVec 32))) (Undefined!10233) (MissingVacant!10233 (index!43306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95101 (_ BitVec 32)) SeekEntryResult!10233)

(assert (=> b!1390099 (= e!787273 (= (seekEntryOrOpen!0 (select (arr!45916 a!2901) j!112) a!2901 mask!2840) (Found!10233 j!112)))))

(declare-fun b!1390100 () Bool)

(declare-fun res!930262 () Bool)

(assert (=> b!1390100 (=> (not res!930262) (not e!787274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390100 (= res!930262 (validKeyInArray!0 (select (arr!45916 a!2901) j!112)))))

(declare-fun b!1390101 () Bool)

(declare-fun res!930260 () Bool)

(assert (=> b!1390101 (=> (not res!930260) (not e!787274))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390101 (= res!930260 (validKeyInArray!0 (select (arr!45916 a!2901) i!1037)))))

(declare-fun b!1390102 () Bool)

(declare-fun res!930261 () Bool)

(assert (=> b!1390102 (=> (not res!930261) (not e!787274))))

(declare-datatypes ((List!32435 0))(
  ( (Nil!32432) (Cons!32431 (h!33649 (_ BitVec 64)) (t!47129 List!32435)) )
))
(declare-fun arrayNoDuplicates!0 (array!95101 (_ BitVec 32) List!32435) Bool)

(assert (=> b!1390102 (= res!930261 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32432))))

(declare-fun b!1390103 () Bool)

(declare-fun res!930265 () Bool)

(assert (=> b!1390103 (=> (not res!930265) (not e!787274))))

(assert (=> b!1390103 (= res!930265 (and (= (size!46466 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46466 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46466 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930264 () Bool)

(assert (=> start!119164 (=> (not res!930264) (not e!787274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119164 (= res!930264 (validMask!0 mask!2840))))

(assert (=> start!119164 e!787274))

(assert (=> start!119164 true))

(declare-fun array_inv!34944 (array!95101) Bool)

(assert (=> start!119164 (array_inv!34944 a!2901)))

(declare-fun b!1390104 () Bool)

(assert (=> b!1390104 (= e!787274 (not true))))

(assert (=> b!1390104 e!787273))

(declare-fun res!930259 () Bool)

(assert (=> b!1390104 (=> (not res!930259) (not e!787273))))

(assert (=> b!1390104 (= res!930259 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46470 0))(
  ( (Unit!46471) )
))
(declare-fun lt!610728 () Unit!46470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46470)

(assert (=> b!1390104 (= lt!610728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610727 () SeekEntryResult!10233)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95101 (_ BitVec 32)) SeekEntryResult!10233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390104 (= lt!610727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45916 a!2901) j!112) mask!2840) (select (arr!45916 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119164 res!930264) b!1390103))

(assert (= (and b!1390103 res!930265) b!1390101))

(assert (= (and b!1390101 res!930260) b!1390100))

(assert (= (and b!1390100 res!930262) b!1390098))

(assert (= (and b!1390098 res!930263) b!1390102))

(assert (= (and b!1390102 res!930261) b!1390104))

(assert (= (and b!1390104 res!930259) b!1390099))

(declare-fun m!1275865 () Bool)

(assert (=> b!1390102 m!1275865))

(declare-fun m!1275867 () Bool)

(assert (=> b!1390098 m!1275867))

(declare-fun m!1275869 () Bool)

(assert (=> b!1390099 m!1275869))

(assert (=> b!1390099 m!1275869))

(declare-fun m!1275871 () Bool)

(assert (=> b!1390099 m!1275871))

(declare-fun m!1275873 () Bool)

(assert (=> b!1390101 m!1275873))

(assert (=> b!1390101 m!1275873))

(declare-fun m!1275875 () Bool)

(assert (=> b!1390101 m!1275875))

(assert (=> b!1390100 m!1275869))

(assert (=> b!1390100 m!1275869))

(declare-fun m!1275877 () Bool)

(assert (=> b!1390100 m!1275877))

(assert (=> b!1390104 m!1275869))

(declare-fun m!1275879 () Bool)

(assert (=> b!1390104 m!1275879))

(assert (=> b!1390104 m!1275869))

(declare-fun m!1275881 () Bool)

(assert (=> b!1390104 m!1275881))

(assert (=> b!1390104 m!1275879))

(assert (=> b!1390104 m!1275869))

(declare-fun m!1275883 () Bool)

(assert (=> b!1390104 m!1275883))

(declare-fun m!1275885 () Bool)

(assert (=> b!1390104 m!1275885))

(declare-fun m!1275887 () Bool)

(assert (=> start!119164 m!1275887))

(declare-fun m!1275889 () Bool)

(assert (=> start!119164 m!1275889))

(push 1)

(assert (not start!119164))

(assert (not b!1390098))

(assert (not b!1390099))

(assert (not b!1390104))

(assert (not b!1390101))

(assert (not b!1390100))

(assert (not b!1390102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

