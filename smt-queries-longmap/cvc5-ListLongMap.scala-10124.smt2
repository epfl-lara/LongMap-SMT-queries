; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119538 () Bool)

(assert start!119538)

(declare-fun b!1392514 () Bool)

(declare-fun e!788649 () Bool)

(assert (=> b!1392514 (= e!788649 (not true))))

(declare-fun e!788650 () Bool)

(assert (=> b!1392514 e!788650))

(declare-fun res!931699 () Bool)

(assert (=> b!1392514 (=> (not res!931699) (not e!788650))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95295 0))(
  ( (array!95296 (arr!46008 (Array (_ BitVec 32) (_ BitVec 64))) (size!46559 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95295)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95295 (_ BitVec 32)) Bool)

(assert (=> b!1392514 (= res!931699 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46487 0))(
  ( (Unit!46488) )
))
(declare-fun lt!611585 () Unit!46487)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46487)

(assert (=> b!1392514 (= lt!611585 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10228 0))(
  ( (MissingZero!10228 (index!43283 (_ BitVec 32))) (Found!10228 (index!43284 (_ BitVec 32))) (Intermediate!10228 (undefined!11040 Bool) (index!43285 (_ BitVec 32)) (x!125113 (_ BitVec 32))) (Undefined!10228) (MissingVacant!10228 (index!43286 (_ BitVec 32))) )
))
(declare-fun lt!611584 () SeekEntryResult!10228)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95295 (_ BitVec 32)) SeekEntryResult!10228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392514 (= lt!611584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46008 a!2901) j!112) mask!2840) (select (arr!46008 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392515 () Bool)

(declare-fun res!931702 () Bool)

(assert (=> b!1392515 (=> (not res!931702) (not e!788649))))

(declare-datatypes ((List!32514 0))(
  ( (Nil!32511) (Cons!32510 (h!33742 (_ BitVec 64)) (t!47200 List!32514)) )
))
(declare-fun arrayNoDuplicates!0 (array!95295 (_ BitVec 32) List!32514) Bool)

(assert (=> b!1392515 (= res!931702 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32511))))

(declare-fun b!1392516 () Bool)

(declare-fun res!931696 () Bool)

(assert (=> b!1392516 (=> (not res!931696) (not e!788649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392516 (= res!931696 (validKeyInArray!0 (select (arr!46008 a!2901) j!112)))))

(declare-fun b!1392517 () Bool)

(declare-fun res!931701 () Bool)

(assert (=> b!1392517 (=> (not res!931701) (not e!788649))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392517 (= res!931701 (validKeyInArray!0 (select (arr!46008 a!2901) i!1037)))))

(declare-fun res!931698 () Bool)

(assert (=> start!119538 (=> (not res!931698) (not e!788649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119538 (= res!931698 (validMask!0 mask!2840))))

(assert (=> start!119538 e!788649))

(assert (=> start!119538 true))

(declare-fun array_inv!35289 (array!95295) Bool)

(assert (=> start!119538 (array_inv!35289 a!2901)))

(declare-fun b!1392513 () Bool)

(declare-fun res!931700 () Bool)

(assert (=> b!1392513 (=> (not res!931700) (not e!788649))))

(assert (=> b!1392513 (= res!931700 (and (= (size!46559 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46559 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46559 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392518 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95295 (_ BitVec 32)) SeekEntryResult!10228)

(assert (=> b!1392518 (= e!788650 (= (seekEntryOrOpen!0 (select (arr!46008 a!2901) j!112) a!2901 mask!2840) (Found!10228 j!112)))))

(declare-fun b!1392519 () Bool)

(declare-fun res!931697 () Bool)

(assert (=> b!1392519 (=> (not res!931697) (not e!788649))))

(assert (=> b!1392519 (= res!931697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119538 res!931698) b!1392513))

(assert (= (and b!1392513 res!931700) b!1392517))

(assert (= (and b!1392517 res!931701) b!1392516))

(assert (= (and b!1392516 res!931696) b!1392519))

(assert (= (and b!1392519 res!931697) b!1392515))

(assert (= (and b!1392515 res!931702) b!1392514))

(assert (= (and b!1392514 res!931699) b!1392518))

(declare-fun m!1278509 () Bool)

(assert (=> start!119538 m!1278509))

(declare-fun m!1278511 () Bool)

(assert (=> start!119538 m!1278511))

(declare-fun m!1278513 () Bool)

(assert (=> b!1392518 m!1278513))

(assert (=> b!1392518 m!1278513))

(declare-fun m!1278515 () Bool)

(assert (=> b!1392518 m!1278515))

(assert (=> b!1392514 m!1278513))

(declare-fun m!1278517 () Bool)

(assert (=> b!1392514 m!1278517))

(assert (=> b!1392514 m!1278513))

(declare-fun m!1278519 () Bool)

(assert (=> b!1392514 m!1278519))

(assert (=> b!1392514 m!1278517))

(assert (=> b!1392514 m!1278513))

(declare-fun m!1278521 () Bool)

(assert (=> b!1392514 m!1278521))

(declare-fun m!1278523 () Bool)

(assert (=> b!1392514 m!1278523))

(assert (=> b!1392516 m!1278513))

(assert (=> b!1392516 m!1278513))

(declare-fun m!1278525 () Bool)

(assert (=> b!1392516 m!1278525))

(declare-fun m!1278527 () Bool)

(assert (=> b!1392515 m!1278527))

(declare-fun m!1278529 () Bool)

(assert (=> b!1392517 m!1278529))

(assert (=> b!1392517 m!1278529))

(declare-fun m!1278531 () Bool)

(assert (=> b!1392517 m!1278531))

(declare-fun m!1278533 () Bool)

(assert (=> b!1392519 m!1278533))

(push 1)

(assert (not b!1392517))

(assert (not b!1392516))

(assert (not b!1392519))

(assert (not b!1392514))

(assert (not start!119538))

(assert (not b!1392515))

(assert (not b!1392518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

