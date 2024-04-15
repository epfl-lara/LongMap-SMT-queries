; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120522 () Bool)

(assert start!120522)

(declare-fun b!1403357 () Bool)

(declare-fun e!794603 () Bool)

(declare-fun e!794604 () Bool)

(assert (=> b!1403357 (= e!794603 (not e!794604))))

(declare-fun res!941919 () Bool)

(assert (=> b!1403357 (=> res!941919 e!794604)))

(declare-datatypes ((SeekEntryResult!10636 0))(
  ( (MissingZero!10636 (index!44921 (_ BitVec 32))) (Found!10636 (index!44922 (_ BitVec 32))) (Intermediate!10636 (undefined!11448 Bool) (index!44923 (_ BitVec 32)) (x!126524 (_ BitVec 32))) (Undefined!10636) (MissingVacant!10636 (index!44924 (_ BitVec 32))) )
))
(declare-fun lt!618210 () SeekEntryResult!10636)

(assert (=> b!1403357 (= res!941919 (or (not (is-Intermediate!10636 lt!618210)) (undefined!11448 lt!618210)))))

(declare-fun e!794606 () Bool)

(assert (=> b!1403357 e!794606))

(declare-fun res!941924 () Bool)

(assert (=> b!1403357 (=> (not res!941924) (not e!794606))))

(declare-datatypes ((array!95884 0))(
  ( (array!95885 (arr!46293 (Array (_ BitVec 32) (_ BitVec 64))) (size!46845 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95884)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95884 (_ BitVec 32)) Bool)

(assert (=> b!1403357 (= res!941924 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47119 0))(
  ( (Unit!47120) )
))
(declare-fun lt!618212 () Unit!47119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47119)

(assert (=> b!1403357 (= lt!618212 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95884 (_ BitVec 32)) SeekEntryResult!10636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403357 (= lt!618210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46293 a!2901) j!112) mask!2840) (select (arr!46293 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403358 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95884 (_ BitVec 32)) SeekEntryResult!10636)

(assert (=> b!1403358 (= e!794606 (= (seekEntryOrOpen!0 (select (arr!46293 a!2901) j!112) a!2901 mask!2840) (Found!10636 j!112)))))

(declare-fun b!1403359 () Bool)

(assert (=> b!1403359 (= e!794604 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618211 () SeekEntryResult!10636)

(assert (=> b!1403359 (= lt!618211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46293 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46293 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95885 (store (arr!46293 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46845 a!2901)) mask!2840))))

(declare-fun b!1403360 () Bool)

(declare-fun res!941921 () Bool)

(assert (=> b!1403360 (=> (not res!941921) (not e!794603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403360 (= res!941921 (validKeyInArray!0 (select (arr!46293 a!2901) j!112)))))

(declare-fun b!1403361 () Bool)

(declare-fun res!941920 () Bool)

(assert (=> b!1403361 (=> (not res!941920) (not e!794603))))

(assert (=> b!1403361 (= res!941920 (validKeyInArray!0 (select (arr!46293 a!2901) i!1037)))))

(declare-fun b!1403362 () Bool)

(declare-fun res!941923 () Bool)

(assert (=> b!1403362 (=> (not res!941923) (not e!794603))))

(assert (=> b!1403362 (= res!941923 (and (= (size!46845 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46845 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46845 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403363 () Bool)

(declare-fun res!941926 () Bool)

(assert (=> b!1403363 (=> (not res!941926) (not e!794603))))

(assert (=> b!1403363 (= res!941926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!941922 () Bool)

(assert (=> start!120522 (=> (not res!941922) (not e!794603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120522 (= res!941922 (validMask!0 mask!2840))))

(assert (=> start!120522 e!794603))

(assert (=> start!120522 true))

(declare-fun array_inv!35526 (array!95884) Bool)

(assert (=> start!120522 (array_inv!35526 a!2901)))

(declare-fun b!1403364 () Bool)

(declare-fun res!941925 () Bool)

(assert (=> b!1403364 (=> (not res!941925) (not e!794603))))

(declare-datatypes ((List!32890 0))(
  ( (Nil!32887) (Cons!32886 (h!34134 (_ BitVec 64)) (t!47576 List!32890)) )
))
(declare-fun arrayNoDuplicates!0 (array!95884 (_ BitVec 32) List!32890) Bool)

(assert (=> b!1403364 (= res!941925 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32887))))

(assert (= (and start!120522 res!941922) b!1403362))

(assert (= (and b!1403362 res!941923) b!1403361))

(assert (= (and b!1403361 res!941920) b!1403360))

(assert (= (and b!1403360 res!941921) b!1403363))

(assert (= (and b!1403363 res!941926) b!1403364))

(assert (= (and b!1403364 res!941925) b!1403357))

(assert (= (and b!1403357 res!941924) b!1403358))

(assert (= (and b!1403357 (not res!941919)) b!1403359))

(declare-fun m!1291539 () Bool)

(assert (=> b!1403363 m!1291539))

(declare-fun m!1291541 () Bool)

(assert (=> b!1403361 m!1291541))

(assert (=> b!1403361 m!1291541))

(declare-fun m!1291543 () Bool)

(assert (=> b!1403361 m!1291543))

(declare-fun m!1291545 () Bool)

(assert (=> b!1403358 m!1291545))

(assert (=> b!1403358 m!1291545))

(declare-fun m!1291547 () Bool)

(assert (=> b!1403358 m!1291547))

(declare-fun m!1291549 () Bool)

(assert (=> start!120522 m!1291549))

(declare-fun m!1291551 () Bool)

(assert (=> start!120522 m!1291551))

(assert (=> b!1403360 m!1291545))

(assert (=> b!1403360 m!1291545))

(declare-fun m!1291553 () Bool)

(assert (=> b!1403360 m!1291553))

(assert (=> b!1403357 m!1291545))

(declare-fun m!1291555 () Bool)

(assert (=> b!1403357 m!1291555))

(assert (=> b!1403357 m!1291545))

(declare-fun m!1291557 () Bool)

(assert (=> b!1403357 m!1291557))

(assert (=> b!1403357 m!1291555))

(assert (=> b!1403357 m!1291545))

(declare-fun m!1291559 () Bool)

(assert (=> b!1403357 m!1291559))

(declare-fun m!1291561 () Bool)

(assert (=> b!1403357 m!1291561))

(declare-fun m!1291563 () Bool)

(assert (=> b!1403359 m!1291563))

(declare-fun m!1291565 () Bool)

(assert (=> b!1403359 m!1291565))

(assert (=> b!1403359 m!1291565))

(declare-fun m!1291567 () Bool)

(assert (=> b!1403359 m!1291567))

(assert (=> b!1403359 m!1291567))

(assert (=> b!1403359 m!1291565))

(declare-fun m!1291569 () Bool)

(assert (=> b!1403359 m!1291569))

(declare-fun m!1291571 () Bool)

(assert (=> b!1403364 m!1291571))

(push 1)

(assert (not b!1403361))

(assert (not b!1403363))

(assert (not b!1403364))

(assert (not b!1403360))

(assert (not b!1403357))

(assert (not start!120522))

(assert (not b!1403359))

(assert (not b!1403358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

