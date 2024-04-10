; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119180 () Bool)

(assert start!119180)

(declare-fun b!1390266 () Bool)

(declare-fun res!930428 () Bool)

(declare-fun e!787345 () Bool)

(assert (=> b!1390266 (=> (not res!930428) (not e!787345))))

(declare-datatypes ((array!95117 0))(
  ( (array!95118 (arr!45924 (Array (_ BitVec 32) (_ BitVec 64))) (size!46474 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95117)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390266 (= res!930428 (validKeyInArray!0 (select (arr!45924 a!2901) j!112)))))

(declare-fun b!1390267 () Bool)

(declare-fun res!930431 () Bool)

(assert (=> b!1390267 (=> (not res!930431) (not e!787345))))

(declare-datatypes ((List!32443 0))(
  ( (Nil!32440) (Cons!32439 (h!33657 (_ BitVec 64)) (t!47137 List!32443)) )
))
(declare-fun arrayNoDuplicates!0 (array!95117 (_ BitVec 32) List!32443) Bool)

(assert (=> b!1390267 (= res!930431 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32440))))

(declare-fun b!1390268 () Bool)

(declare-fun res!930429 () Bool)

(assert (=> b!1390268 (=> (not res!930429) (not e!787345))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390268 (= res!930429 (validKeyInArray!0 (select (arr!45924 a!2901) i!1037)))))

(declare-fun res!930432 () Bool)

(assert (=> start!119180 (=> (not res!930432) (not e!787345))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119180 (= res!930432 (validMask!0 mask!2840))))

(assert (=> start!119180 e!787345))

(assert (=> start!119180 true))

(declare-fun array_inv!34952 (array!95117) Bool)

(assert (=> start!119180 (array_inv!34952 a!2901)))

(declare-fun b!1390269 () Bool)

(assert (=> b!1390269 (= e!787345 (not true))))

(declare-fun e!787346 () Bool)

(assert (=> b!1390269 e!787346))

(declare-fun res!930430 () Bool)

(assert (=> b!1390269 (=> (not res!930430) (not e!787346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95117 (_ BitVec 32)) Bool)

(assert (=> b!1390269 (= res!930430 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46486 0))(
  ( (Unit!46487) )
))
(declare-fun lt!610775 () Unit!46486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46486)

(assert (=> b!1390269 (= lt!610775 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10241 0))(
  ( (MissingZero!10241 (index!43335 (_ BitVec 32))) (Found!10241 (index!43336 (_ BitVec 32))) (Intermediate!10241 (undefined!11053 Bool) (index!43337 (_ BitVec 32)) (x!125015 (_ BitVec 32))) (Undefined!10241) (MissingVacant!10241 (index!43338 (_ BitVec 32))) )
))
(declare-fun lt!610776 () SeekEntryResult!10241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95117 (_ BitVec 32)) SeekEntryResult!10241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390269 (= lt!610776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45924 a!2901) j!112) mask!2840) (select (arr!45924 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390270 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95117 (_ BitVec 32)) SeekEntryResult!10241)

(assert (=> b!1390270 (= e!787346 (= (seekEntryOrOpen!0 (select (arr!45924 a!2901) j!112) a!2901 mask!2840) (Found!10241 j!112)))))

(declare-fun b!1390271 () Bool)

(declare-fun res!930427 () Bool)

(assert (=> b!1390271 (=> (not res!930427) (not e!787345))))

(assert (=> b!1390271 (= res!930427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390272 () Bool)

(declare-fun res!930433 () Bool)

(assert (=> b!1390272 (=> (not res!930433) (not e!787345))))

(assert (=> b!1390272 (= res!930433 (and (= (size!46474 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46474 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46474 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119180 res!930432) b!1390272))

(assert (= (and b!1390272 res!930433) b!1390268))

(assert (= (and b!1390268 res!930429) b!1390266))

(assert (= (and b!1390266 res!930428) b!1390271))

(assert (= (and b!1390271 res!930427) b!1390267))

(assert (= (and b!1390267 res!930431) b!1390269))

(assert (= (and b!1390269 res!930430) b!1390270))

(declare-fun m!1276073 () Bool)

(assert (=> b!1390267 m!1276073))

(declare-fun m!1276075 () Bool)

(assert (=> start!119180 m!1276075))

(declare-fun m!1276077 () Bool)

(assert (=> start!119180 m!1276077))

(declare-fun m!1276079 () Bool)

(assert (=> b!1390266 m!1276079))

(assert (=> b!1390266 m!1276079))

(declare-fun m!1276081 () Bool)

(assert (=> b!1390266 m!1276081))

(assert (=> b!1390269 m!1276079))

(declare-fun m!1276083 () Bool)

(assert (=> b!1390269 m!1276083))

(assert (=> b!1390269 m!1276079))

(declare-fun m!1276085 () Bool)

(assert (=> b!1390269 m!1276085))

(assert (=> b!1390269 m!1276083))

(assert (=> b!1390269 m!1276079))

(declare-fun m!1276087 () Bool)

(assert (=> b!1390269 m!1276087))

(declare-fun m!1276089 () Bool)

(assert (=> b!1390269 m!1276089))

(declare-fun m!1276091 () Bool)

(assert (=> b!1390271 m!1276091))

(declare-fun m!1276093 () Bool)

(assert (=> b!1390268 m!1276093))

(assert (=> b!1390268 m!1276093))

(declare-fun m!1276095 () Bool)

(assert (=> b!1390268 m!1276095))

(assert (=> b!1390270 m!1276079))

(assert (=> b!1390270 m!1276079))

(declare-fun m!1276097 () Bool)

(assert (=> b!1390270 m!1276097))

(check-sat (not b!1390266) (not b!1390270) (not b!1390267) (not b!1390269) (not start!119180) (not b!1390268) (not b!1390271))
