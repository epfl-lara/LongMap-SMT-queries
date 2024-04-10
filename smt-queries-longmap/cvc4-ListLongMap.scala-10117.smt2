; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119200 () Bool)

(assert start!119200)

(declare-fun b!1390476 () Bool)

(declare-fun res!930642 () Bool)

(declare-fun e!787434 () Bool)

(assert (=> b!1390476 (=> (not res!930642) (not e!787434))))

(declare-datatypes ((array!95137 0))(
  ( (array!95138 (arr!45934 (Array (_ BitVec 32) (_ BitVec 64))) (size!46484 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95137)

(declare-datatypes ((List!32453 0))(
  ( (Nil!32450) (Cons!32449 (h!33667 (_ BitVec 64)) (t!47147 List!32453)) )
))
(declare-fun arrayNoDuplicates!0 (array!95137 (_ BitVec 32) List!32453) Bool)

(assert (=> b!1390476 (= res!930642 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32450))))

(declare-fun res!930639 () Bool)

(assert (=> start!119200 (=> (not res!930639) (not e!787434))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119200 (= res!930639 (validMask!0 mask!2840))))

(assert (=> start!119200 e!787434))

(assert (=> start!119200 true))

(declare-fun array_inv!34962 (array!95137) Bool)

(assert (=> start!119200 (array_inv!34962 a!2901)))

(declare-fun b!1390477 () Bool)

(declare-fun res!930638 () Bool)

(assert (=> b!1390477 (=> (not res!930638) (not e!787434))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390477 (= res!930638 (and (= (size!46484 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46484 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46484 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390478 () Bool)

(declare-fun e!787436 () Bool)

(declare-datatypes ((SeekEntryResult!10251 0))(
  ( (MissingZero!10251 (index!43375 (_ BitVec 32))) (Found!10251 (index!43376 (_ BitVec 32))) (Intermediate!10251 (undefined!11063 Bool) (index!43377 (_ BitVec 32)) (x!125049 (_ BitVec 32))) (Undefined!10251) (MissingVacant!10251 (index!43378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95137 (_ BitVec 32)) SeekEntryResult!10251)

(assert (=> b!1390478 (= e!787436 (= (seekEntryOrOpen!0 (select (arr!45934 a!2901) j!112) a!2901 mask!2840) (Found!10251 j!112)))))

(declare-fun b!1390479 () Bool)

(declare-fun res!930643 () Bool)

(assert (=> b!1390479 (=> (not res!930643) (not e!787434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390479 (= res!930643 (validKeyInArray!0 (select (arr!45934 a!2901) i!1037)))))

(declare-fun b!1390480 () Bool)

(declare-fun res!930637 () Bool)

(assert (=> b!1390480 (=> (not res!930637) (not e!787434))))

(assert (=> b!1390480 (= res!930637 (validKeyInArray!0 (select (arr!45934 a!2901) j!112)))))

(declare-fun b!1390481 () Bool)

(assert (=> b!1390481 (= e!787434 (not true))))

(assert (=> b!1390481 e!787436))

(declare-fun res!930641 () Bool)

(assert (=> b!1390481 (=> (not res!930641) (not e!787436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95137 (_ BitVec 32)) Bool)

(assert (=> b!1390481 (= res!930641 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46506 0))(
  ( (Unit!46507) )
))
(declare-fun lt!610835 () Unit!46506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46506)

(assert (=> b!1390481 (= lt!610835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610836 () SeekEntryResult!10251)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95137 (_ BitVec 32)) SeekEntryResult!10251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390481 (= lt!610836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45934 a!2901) j!112) mask!2840) (select (arr!45934 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390482 () Bool)

(declare-fun res!930640 () Bool)

(assert (=> b!1390482 (=> (not res!930640) (not e!787434))))

(assert (=> b!1390482 (= res!930640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119200 res!930639) b!1390477))

(assert (= (and b!1390477 res!930638) b!1390479))

(assert (= (and b!1390479 res!930643) b!1390480))

(assert (= (and b!1390480 res!930637) b!1390482))

(assert (= (and b!1390482 res!930640) b!1390476))

(assert (= (and b!1390476 res!930642) b!1390481))

(assert (= (and b!1390481 res!930641) b!1390478))

(declare-fun m!1276333 () Bool)

(assert (=> b!1390481 m!1276333))

(declare-fun m!1276335 () Bool)

(assert (=> b!1390481 m!1276335))

(assert (=> b!1390481 m!1276333))

(declare-fun m!1276337 () Bool)

(assert (=> b!1390481 m!1276337))

(assert (=> b!1390481 m!1276335))

(assert (=> b!1390481 m!1276333))

(declare-fun m!1276339 () Bool)

(assert (=> b!1390481 m!1276339))

(declare-fun m!1276341 () Bool)

(assert (=> b!1390481 m!1276341))

(assert (=> b!1390478 m!1276333))

(assert (=> b!1390478 m!1276333))

(declare-fun m!1276343 () Bool)

(assert (=> b!1390478 m!1276343))

(assert (=> b!1390480 m!1276333))

(assert (=> b!1390480 m!1276333))

(declare-fun m!1276345 () Bool)

(assert (=> b!1390480 m!1276345))

(declare-fun m!1276347 () Bool)

(assert (=> b!1390479 m!1276347))

(assert (=> b!1390479 m!1276347))

(declare-fun m!1276349 () Bool)

(assert (=> b!1390479 m!1276349))

(declare-fun m!1276351 () Bool)

(assert (=> b!1390482 m!1276351))

(declare-fun m!1276353 () Bool)

(assert (=> b!1390476 m!1276353))

(declare-fun m!1276355 () Bool)

(assert (=> start!119200 m!1276355))

(declare-fun m!1276357 () Bool)

(assert (=> start!119200 m!1276357))

(push 1)

(assert (not b!1390481))

(assert (not b!1390482))

(assert (not b!1390478))

(assert (not b!1390476))

(assert (not b!1390480))

(assert (not b!1390479))

(assert (not start!119200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

