; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119182 () Bool)

(assert start!119182)

(declare-fun b!1390287 () Bool)

(declare-fun e!787355 () Bool)

(assert (=> b!1390287 (= e!787355 (not true))))

(declare-fun e!787354 () Bool)

(assert (=> b!1390287 e!787354))

(declare-fun res!930448 () Bool)

(assert (=> b!1390287 (=> (not res!930448) (not e!787354))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95119 0))(
  ( (array!95120 (arr!45925 (Array (_ BitVec 32) (_ BitVec 64))) (size!46475 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95119)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95119 (_ BitVec 32)) Bool)

(assert (=> b!1390287 (= res!930448 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46488 0))(
  ( (Unit!46489) )
))
(declare-fun lt!610781 () Unit!46488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46488)

(assert (=> b!1390287 (= lt!610781 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10242 0))(
  ( (MissingZero!10242 (index!43339 (_ BitVec 32))) (Found!10242 (index!43340 (_ BitVec 32))) (Intermediate!10242 (undefined!11054 Bool) (index!43341 (_ BitVec 32)) (x!125016 (_ BitVec 32))) (Undefined!10242) (MissingVacant!10242 (index!43342 (_ BitVec 32))) )
))
(declare-fun lt!610782 () SeekEntryResult!10242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95119 (_ BitVec 32)) SeekEntryResult!10242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390287 (= lt!610782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45925 a!2901) j!112) mask!2840) (select (arr!45925 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390288 () Bool)

(declare-fun res!930453 () Bool)

(assert (=> b!1390288 (=> (not res!930453) (not e!787355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390288 (= res!930453 (validKeyInArray!0 (select (arr!45925 a!2901) j!112)))))

(declare-fun b!1390289 () Bool)

(declare-fun res!930451 () Bool)

(assert (=> b!1390289 (=> (not res!930451) (not e!787355))))

(declare-datatypes ((List!32444 0))(
  ( (Nil!32441) (Cons!32440 (h!33658 (_ BitVec 64)) (t!47138 List!32444)) )
))
(declare-fun arrayNoDuplicates!0 (array!95119 (_ BitVec 32) List!32444) Bool)

(assert (=> b!1390289 (= res!930451 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32441))))

(declare-fun b!1390290 () Bool)

(declare-fun res!930449 () Bool)

(assert (=> b!1390290 (=> (not res!930449) (not e!787355))))

(assert (=> b!1390290 (= res!930449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390292 () Bool)

(declare-fun res!930452 () Bool)

(assert (=> b!1390292 (=> (not res!930452) (not e!787355))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390292 (= res!930452 (validKeyInArray!0 (select (arr!45925 a!2901) i!1037)))))

(declare-fun b!1390293 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95119 (_ BitVec 32)) SeekEntryResult!10242)

(assert (=> b!1390293 (= e!787354 (= (seekEntryOrOpen!0 (select (arr!45925 a!2901) j!112) a!2901 mask!2840) (Found!10242 j!112)))))

(declare-fun res!930450 () Bool)

(assert (=> start!119182 (=> (not res!930450) (not e!787355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119182 (= res!930450 (validMask!0 mask!2840))))

(assert (=> start!119182 e!787355))

(assert (=> start!119182 true))

(declare-fun array_inv!34953 (array!95119) Bool)

(assert (=> start!119182 (array_inv!34953 a!2901)))

(declare-fun b!1390291 () Bool)

(declare-fun res!930454 () Bool)

(assert (=> b!1390291 (=> (not res!930454) (not e!787355))))

(assert (=> b!1390291 (= res!930454 (and (= (size!46475 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46475 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46475 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119182 res!930450) b!1390291))

(assert (= (and b!1390291 res!930454) b!1390292))

(assert (= (and b!1390292 res!930452) b!1390288))

(assert (= (and b!1390288 res!930453) b!1390290))

(assert (= (and b!1390290 res!930449) b!1390289))

(assert (= (and b!1390289 res!930451) b!1390287))

(assert (= (and b!1390287 res!930448) b!1390293))

(declare-fun m!1276099 () Bool)

(assert (=> start!119182 m!1276099))

(declare-fun m!1276101 () Bool)

(assert (=> start!119182 m!1276101))

(declare-fun m!1276103 () Bool)

(assert (=> b!1390293 m!1276103))

(assert (=> b!1390293 m!1276103))

(declare-fun m!1276105 () Bool)

(assert (=> b!1390293 m!1276105))

(declare-fun m!1276107 () Bool)

(assert (=> b!1390290 m!1276107))

(declare-fun m!1276109 () Bool)

(assert (=> b!1390289 m!1276109))

(declare-fun m!1276111 () Bool)

(assert (=> b!1390292 m!1276111))

(assert (=> b!1390292 m!1276111))

(declare-fun m!1276113 () Bool)

(assert (=> b!1390292 m!1276113))

(assert (=> b!1390287 m!1276103))

(declare-fun m!1276115 () Bool)

(assert (=> b!1390287 m!1276115))

(assert (=> b!1390287 m!1276103))

(declare-fun m!1276117 () Bool)

(assert (=> b!1390287 m!1276117))

(assert (=> b!1390287 m!1276115))

(assert (=> b!1390287 m!1276103))

(declare-fun m!1276119 () Bool)

(assert (=> b!1390287 m!1276119))

(declare-fun m!1276121 () Bool)

(assert (=> b!1390287 m!1276121))

(assert (=> b!1390288 m!1276103))

(assert (=> b!1390288 m!1276103))

(declare-fun m!1276123 () Bool)

(assert (=> b!1390288 m!1276123))

(push 1)

(assert (not b!1390289))

(assert (not b!1390287))

(assert (not b!1390293))

(assert (not b!1390290))

(assert (not b!1390288))

(assert (not start!119182))

(assert (not b!1390292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

