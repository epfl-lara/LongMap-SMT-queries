; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119604 () Bool)

(assert start!119604)

(declare-fun b!1393154 () Bool)

(declare-fun res!932613 () Bool)

(declare-fun e!788879 () Bool)

(assert (=> b!1393154 (=> (not res!932613) (not e!788879))))

(declare-datatypes ((array!95239 0))(
  ( (array!95240 (arr!45978 (Array (_ BitVec 32) (_ BitVec 64))) (size!46530 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95239)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95239 (_ BitVec 32)) Bool)

(assert (=> b!1393154 (= res!932613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!788876 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1393156 () Bool)

(declare-datatypes ((SeekEntryResult!10321 0))(
  ( (MissingZero!10321 (index!43655 (_ BitVec 32))) (Found!10321 (index!43656 (_ BitVec 32))) (Intermediate!10321 (undefined!11133 Bool) (index!43657 (_ BitVec 32)) (x!125330 (_ BitVec 32))) (Undefined!10321) (MissingVacant!10321 (index!43658 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95239 (_ BitVec 32)) SeekEntryResult!10321)

(assert (=> b!1393156 (= e!788876 (= (seekEntryOrOpen!0 (select (arr!45978 a!2901) j!112) a!2901 mask!2840) (Found!10321 j!112)))))

(declare-fun b!1393157 () Bool)

(declare-fun res!932620 () Bool)

(assert (=> b!1393157 (=> (not res!932620) (not e!788879))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393157 (= res!932620 (validKeyInArray!0 (select (arr!45978 a!2901) i!1037)))))

(declare-fun b!1393158 () Bool)

(declare-fun res!932616 () Bool)

(assert (=> b!1393158 (=> (not res!932616) (not e!788879))))

(declare-datatypes ((List!32575 0))(
  ( (Nil!32572) (Cons!32571 (h!33804 (_ BitVec 64)) (t!47261 List!32575)) )
))
(declare-fun arrayNoDuplicates!0 (array!95239 (_ BitVec 32) List!32575) Bool)

(assert (=> b!1393158 (= res!932616 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32572))))

(declare-fun b!1393159 () Bool)

(declare-fun e!788878 () Bool)

(assert (=> b!1393159 (= e!788878 true)))

(declare-fun lt!611725 () SeekEntryResult!10321)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95239 (_ BitVec 32)) SeekEntryResult!10321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393159 (= lt!611725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45978 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45978 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95240 (store (arr!45978 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46530 a!2901)) mask!2840))))

(declare-fun b!1393160 () Bool)

(assert (=> b!1393160 (= e!788879 (not e!788878))))

(declare-fun res!932618 () Bool)

(assert (=> b!1393160 (=> res!932618 e!788878)))

(declare-fun lt!611726 () SeekEntryResult!10321)

(assert (=> b!1393160 (= res!932618 (or (not (is-Intermediate!10321 lt!611726)) (undefined!11133 lt!611726)))))

(assert (=> b!1393160 e!788876))

(declare-fun res!932615 () Bool)

(assert (=> b!1393160 (=> (not res!932615) (not e!788876))))

(assert (=> b!1393160 (= res!932615 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46489 0))(
  ( (Unit!46490) )
))
(declare-fun lt!611724 () Unit!46489)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46489)

(assert (=> b!1393160 (= lt!611724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393160 (= lt!611726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45978 a!2901) j!112) mask!2840) (select (arr!45978 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393161 () Bool)

(declare-fun res!932617 () Bool)

(assert (=> b!1393161 (=> (not res!932617) (not e!788879))))

(assert (=> b!1393161 (= res!932617 (validKeyInArray!0 (select (arr!45978 a!2901) j!112)))))

(declare-fun res!932619 () Bool)

(assert (=> start!119604 (=> (not res!932619) (not e!788879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119604 (= res!932619 (validMask!0 mask!2840))))

(assert (=> start!119604 e!788879))

(assert (=> start!119604 true))

(declare-fun array_inv!35211 (array!95239) Bool)

(assert (=> start!119604 (array_inv!35211 a!2901)))

(declare-fun b!1393155 () Bool)

(declare-fun res!932614 () Bool)

(assert (=> b!1393155 (=> (not res!932614) (not e!788879))))

(assert (=> b!1393155 (= res!932614 (and (= (size!46530 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46530 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46530 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119604 res!932619) b!1393155))

(assert (= (and b!1393155 res!932614) b!1393157))

(assert (= (and b!1393157 res!932620) b!1393161))

(assert (= (and b!1393161 res!932617) b!1393154))

(assert (= (and b!1393154 res!932613) b!1393158))

(assert (= (and b!1393158 res!932616) b!1393160))

(assert (= (and b!1393160 res!932615) b!1393156))

(assert (= (and b!1393160 (not res!932618)) b!1393159))

(declare-fun m!1278525 () Bool)

(assert (=> b!1393161 m!1278525))

(assert (=> b!1393161 m!1278525))

(declare-fun m!1278527 () Bool)

(assert (=> b!1393161 m!1278527))

(declare-fun m!1278529 () Bool)

(assert (=> start!119604 m!1278529))

(declare-fun m!1278531 () Bool)

(assert (=> start!119604 m!1278531))

(declare-fun m!1278533 () Bool)

(assert (=> b!1393159 m!1278533))

(declare-fun m!1278535 () Bool)

(assert (=> b!1393159 m!1278535))

(assert (=> b!1393159 m!1278535))

(declare-fun m!1278537 () Bool)

(assert (=> b!1393159 m!1278537))

(assert (=> b!1393159 m!1278537))

(assert (=> b!1393159 m!1278535))

(declare-fun m!1278539 () Bool)

(assert (=> b!1393159 m!1278539))

(assert (=> b!1393160 m!1278525))

(declare-fun m!1278541 () Bool)

(assert (=> b!1393160 m!1278541))

(assert (=> b!1393160 m!1278525))

(declare-fun m!1278543 () Bool)

(assert (=> b!1393160 m!1278543))

(assert (=> b!1393160 m!1278541))

(assert (=> b!1393160 m!1278525))

(declare-fun m!1278545 () Bool)

(assert (=> b!1393160 m!1278545))

(declare-fun m!1278547 () Bool)

(assert (=> b!1393160 m!1278547))

(declare-fun m!1278549 () Bool)

(assert (=> b!1393154 m!1278549))

(declare-fun m!1278551 () Bool)

(assert (=> b!1393157 m!1278551))

(assert (=> b!1393157 m!1278551))

(declare-fun m!1278553 () Bool)

(assert (=> b!1393157 m!1278553))

(assert (=> b!1393156 m!1278525))

(assert (=> b!1393156 m!1278525))

(declare-fun m!1278555 () Bool)

(assert (=> b!1393156 m!1278555))

(declare-fun m!1278557 () Bool)

(assert (=> b!1393158 m!1278557))

(push 1)

(assert (not b!1393160))

(assert (not b!1393159))

(assert (not b!1393158))

(assert (not b!1393161))

(assert (not b!1393157))

(assert (not b!1393156))

(assert (not start!119604))

(assert (not b!1393154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

