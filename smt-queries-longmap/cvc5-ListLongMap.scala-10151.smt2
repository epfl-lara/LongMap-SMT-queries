; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119670 () Bool)

(assert start!119670)

(declare-fun b!1393946 () Bool)

(declare-fun e!789274 () Bool)

(declare-fun e!789273 () Bool)

(assert (=> b!1393946 (= e!789274 (not e!789273))))

(declare-fun res!933411 () Bool)

(assert (=> b!1393946 (=> res!933411 e!789273)))

(declare-datatypes ((SeekEntryResult!10354 0))(
  ( (MissingZero!10354 (index!43787 (_ BitVec 32))) (Found!10354 (index!43788 (_ BitVec 32))) (Intermediate!10354 (undefined!11166 Bool) (index!43789 (_ BitVec 32)) (x!125451 (_ BitVec 32))) (Undefined!10354) (MissingVacant!10354 (index!43790 (_ BitVec 32))) )
))
(declare-fun lt!612022 () SeekEntryResult!10354)

(assert (=> b!1393946 (= res!933411 (or (not (is-Intermediate!10354 lt!612022)) (undefined!11166 lt!612022)))))

(declare-fun e!789275 () Bool)

(assert (=> b!1393946 e!789275))

(declare-fun res!933409 () Bool)

(assert (=> b!1393946 (=> (not res!933409) (not e!789275))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95305 0))(
  ( (array!95306 (arr!46011 (Array (_ BitVec 32) (_ BitVec 64))) (size!46563 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95305)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95305 (_ BitVec 32)) Bool)

(assert (=> b!1393946 (= res!933409 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46555 0))(
  ( (Unit!46556) )
))
(declare-fun lt!612023 () Unit!46555)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46555)

(assert (=> b!1393946 (= lt!612023 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95305 (_ BitVec 32)) SeekEntryResult!10354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393946 (= lt!612022 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46011 a!2901) j!112) mask!2840) (select (arr!46011 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!933406 () Bool)

(assert (=> start!119670 (=> (not res!933406) (not e!789274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119670 (= res!933406 (validMask!0 mask!2840))))

(assert (=> start!119670 e!789274))

(assert (=> start!119670 true))

(declare-fun array_inv!35244 (array!95305) Bool)

(assert (=> start!119670 (array_inv!35244 a!2901)))

(declare-fun b!1393947 () Bool)

(declare-fun res!933412 () Bool)

(assert (=> b!1393947 (=> (not res!933412) (not e!789274))))

(declare-datatypes ((List!32608 0))(
  ( (Nil!32605) (Cons!32604 (h!33837 (_ BitVec 64)) (t!47294 List!32608)) )
))
(declare-fun arrayNoDuplicates!0 (array!95305 (_ BitVec 32) List!32608) Bool)

(assert (=> b!1393947 (= res!933412 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32605))))

(declare-fun b!1393948 () Bool)

(assert (=> b!1393948 (= e!789273 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612021 () SeekEntryResult!10354)

(assert (=> b!1393948 (= lt!612021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46011 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46011 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95306 (store (arr!46011 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46563 a!2901)) mask!2840))))

(declare-fun b!1393949 () Bool)

(declare-fun res!933408 () Bool)

(assert (=> b!1393949 (=> (not res!933408) (not e!789274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393949 (= res!933408 (validKeyInArray!0 (select (arr!46011 a!2901) j!112)))))

(declare-fun b!1393950 () Bool)

(declare-fun res!933405 () Bool)

(assert (=> b!1393950 (=> (not res!933405) (not e!789274))))

(assert (=> b!1393950 (= res!933405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393951 () Bool)

(declare-fun res!933410 () Bool)

(assert (=> b!1393951 (=> (not res!933410) (not e!789274))))

(assert (=> b!1393951 (= res!933410 (and (= (size!46563 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46563 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46563 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393952 () Bool)

(declare-fun res!933407 () Bool)

(assert (=> b!1393952 (=> (not res!933407) (not e!789274))))

(assert (=> b!1393952 (= res!933407 (validKeyInArray!0 (select (arr!46011 a!2901) i!1037)))))

(declare-fun b!1393953 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95305 (_ BitVec 32)) SeekEntryResult!10354)

(assert (=> b!1393953 (= e!789275 (= (seekEntryOrOpen!0 (select (arr!46011 a!2901) j!112) a!2901 mask!2840) (Found!10354 j!112)))))

(assert (= (and start!119670 res!933406) b!1393951))

(assert (= (and b!1393951 res!933410) b!1393952))

(assert (= (and b!1393952 res!933407) b!1393949))

(assert (= (and b!1393949 res!933408) b!1393950))

(assert (= (and b!1393950 res!933405) b!1393947))

(assert (= (and b!1393947 res!933412) b!1393946))

(assert (= (and b!1393946 res!933409) b!1393953))

(assert (= (and b!1393946 (not res!933411)) b!1393948))

(declare-fun m!1279647 () Bool)

(assert (=> b!1393952 m!1279647))

(assert (=> b!1393952 m!1279647))

(declare-fun m!1279649 () Bool)

(assert (=> b!1393952 m!1279649))

(declare-fun m!1279651 () Bool)

(assert (=> b!1393953 m!1279651))

(assert (=> b!1393953 m!1279651))

(declare-fun m!1279653 () Bool)

(assert (=> b!1393953 m!1279653))

(assert (=> b!1393949 m!1279651))

(assert (=> b!1393949 m!1279651))

(declare-fun m!1279655 () Bool)

(assert (=> b!1393949 m!1279655))

(declare-fun m!1279657 () Bool)

(assert (=> start!119670 m!1279657))

(declare-fun m!1279659 () Bool)

(assert (=> start!119670 m!1279659))

(assert (=> b!1393946 m!1279651))

(declare-fun m!1279661 () Bool)

(assert (=> b!1393946 m!1279661))

(assert (=> b!1393946 m!1279651))

(declare-fun m!1279663 () Bool)

(assert (=> b!1393946 m!1279663))

(assert (=> b!1393946 m!1279661))

(assert (=> b!1393946 m!1279651))

(declare-fun m!1279665 () Bool)

(assert (=> b!1393946 m!1279665))

(declare-fun m!1279667 () Bool)

(assert (=> b!1393946 m!1279667))

(declare-fun m!1279669 () Bool)

(assert (=> b!1393948 m!1279669))

(declare-fun m!1279671 () Bool)

(assert (=> b!1393948 m!1279671))

(assert (=> b!1393948 m!1279671))

(declare-fun m!1279673 () Bool)

(assert (=> b!1393948 m!1279673))

(assert (=> b!1393948 m!1279673))

(assert (=> b!1393948 m!1279671))

(declare-fun m!1279675 () Bool)

(assert (=> b!1393948 m!1279675))

(declare-fun m!1279677 () Bool)

(assert (=> b!1393947 m!1279677))

(declare-fun m!1279679 () Bool)

(assert (=> b!1393950 m!1279679))

(push 1)

(assert (not b!1393952))

(assert (not b!1393948))

(assert (not b!1393949))

(assert (not b!1393946))

(assert (not start!119670))

(assert (not b!1393953))

(assert (not b!1393947))

(assert (not b!1393950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

