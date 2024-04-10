; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119808 () Bool)

(assert start!119808)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95439 0))(
  ( (array!95440 (arr!46076 (Array (_ BitVec 32) (_ BitVec 64))) (size!46626 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95439)

(declare-fun b!1395343 () Bool)

(declare-fun e!789962 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10393 0))(
  ( (MissingZero!10393 (index!43943 (_ BitVec 32))) (Found!10393 (index!43944 (_ BitVec 32))) (Intermediate!10393 (undefined!11205 Bool) (index!43945 (_ BitVec 32)) (x!125611 (_ BitVec 32))) (Undefined!10393) (MissingVacant!10393 (index!43946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95439 (_ BitVec 32)) SeekEntryResult!10393)

(assert (=> b!1395343 (= e!789962 (= (seekEntryOrOpen!0 (select (arr!46076 a!2901) j!112) a!2901 mask!2840) (Found!10393 j!112)))))

(declare-fun b!1395344 () Bool)

(declare-fun res!934594 () Bool)

(declare-fun e!789960 () Bool)

(assert (=> b!1395344 (=> (not res!934594) (not e!789960))))

(declare-datatypes ((List!32595 0))(
  ( (Nil!32592) (Cons!32591 (h!33827 (_ BitVec 64)) (t!47289 List!32595)) )
))
(declare-fun arrayNoDuplicates!0 (array!95439 (_ BitVec 32) List!32595) Bool)

(assert (=> b!1395344 (= res!934594 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32592))))

(declare-fun b!1395345 () Bool)

(declare-fun e!789961 () Bool)

(assert (=> b!1395345 (= e!789960 (not e!789961))))

(declare-fun res!934589 () Bool)

(assert (=> b!1395345 (=> res!934589 e!789961)))

(declare-fun lt!612960 () SeekEntryResult!10393)

(assert (=> b!1395345 (= res!934589 (or (not (is-Intermediate!10393 lt!612960)) (undefined!11205 lt!612960)))))

(assert (=> b!1395345 e!789962))

(declare-fun res!934591 () Bool)

(assert (=> b!1395345 (=> (not res!934591) (not e!789962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95439 (_ BitVec 32)) Bool)

(assert (=> b!1395345 (= res!934591 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46790 0))(
  ( (Unit!46791) )
))
(declare-fun lt!612959 () Unit!46790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46790)

(assert (=> b!1395345 (= lt!612959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95439 (_ BitVec 32)) SeekEntryResult!10393)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395345 (= lt!612960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46076 a!2901) j!112) mask!2840) (select (arr!46076 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395346 () Bool)

(declare-fun res!934590 () Bool)

(assert (=> b!1395346 (=> (not res!934590) (not e!789960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395346 (= res!934590 (validKeyInArray!0 (select (arr!46076 a!2901) j!112)))))

(declare-fun b!1395347 () Bool)

(declare-fun res!934588 () Bool)

(assert (=> b!1395347 (=> (not res!934588) (not e!789960))))

(assert (=> b!1395347 (= res!934588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395348 () Bool)

(declare-fun res!934586 () Bool)

(assert (=> b!1395348 (=> res!934586 e!789961)))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395348 (= res!934586 (= lt!612960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46076 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46076 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95440 (store (arr!46076 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46626 a!2901)) mask!2840)))))

(declare-fun b!1395349 () Bool)

(declare-fun res!934592 () Bool)

(assert (=> b!1395349 (=> (not res!934592) (not e!789960))))

(assert (=> b!1395349 (= res!934592 (validKeyInArray!0 (select (arr!46076 a!2901) i!1037)))))

(declare-fun res!934587 () Bool)

(assert (=> start!119808 (=> (not res!934587) (not e!789960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119808 (= res!934587 (validMask!0 mask!2840))))

(assert (=> start!119808 e!789960))

(assert (=> start!119808 true))

(declare-fun array_inv!35104 (array!95439) Bool)

(assert (=> start!119808 (array_inv!35104 a!2901)))

(declare-fun b!1395350 () Bool)

(declare-fun res!934593 () Bool)

(assert (=> b!1395350 (=> (not res!934593) (not e!789960))))

(assert (=> b!1395350 (= res!934593 (and (= (size!46626 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46626 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46626 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395351 () Bool)

(assert (=> b!1395351 (= e!789961 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (= (and start!119808 res!934587) b!1395350))

(assert (= (and b!1395350 res!934593) b!1395349))

(assert (= (and b!1395349 res!934592) b!1395346))

(assert (= (and b!1395346 res!934590) b!1395347))

(assert (= (and b!1395347 res!934588) b!1395344))

(assert (= (and b!1395344 res!934594) b!1395345))

(assert (= (and b!1395345 res!934591) b!1395343))

(assert (= (and b!1395345 (not res!934589)) b!1395348))

(assert (= (and b!1395348 (not res!934586)) b!1395351))

(declare-fun m!1281795 () Bool)

(assert (=> b!1395345 m!1281795))

(declare-fun m!1281797 () Bool)

(assert (=> b!1395345 m!1281797))

(assert (=> b!1395345 m!1281795))

(declare-fun m!1281799 () Bool)

(assert (=> b!1395345 m!1281799))

(assert (=> b!1395345 m!1281797))

(assert (=> b!1395345 m!1281795))

(declare-fun m!1281801 () Bool)

(assert (=> b!1395345 m!1281801))

(declare-fun m!1281803 () Bool)

(assert (=> b!1395345 m!1281803))

(assert (=> b!1395343 m!1281795))

(assert (=> b!1395343 m!1281795))

(declare-fun m!1281805 () Bool)

(assert (=> b!1395343 m!1281805))

(declare-fun m!1281807 () Bool)

(assert (=> start!119808 m!1281807))

(declare-fun m!1281809 () Bool)

(assert (=> start!119808 m!1281809))

(declare-fun m!1281811 () Bool)

(assert (=> b!1395349 m!1281811))

(assert (=> b!1395349 m!1281811))

(declare-fun m!1281813 () Bool)

(assert (=> b!1395349 m!1281813))

(assert (=> b!1395346 m!1281795))

(assert (=> b!1395346 m!1281795))

(declare-fun m!1281815 () Bool)

(assert (=> b!1395346 m!1281815))

(declare-fun m!1281817 () Bool)

(assert (=> b!1395344 m!1281817))

(declare-fun m!1281819 () Bool)

(assert (=> b!1395347 m!1281819))

(declare-fun m!1281821 () Bool)

(assert (=> b!1395348 m!1281821))

(declare-fun m!1281823 () Bool)

(assert (=> b!1395348 m!1281823))

(assert (=> b!1395348 m!1281823))

(declare-fun m!1281825 () Bool)

(assert (=> b!1395348 m!1281825))

(assert (=> b!1395348 m!1281825))

(assert (=> b!1395348 m!1281823))

(declare-fun m!1281827 () Bool)

(assert (=> b!1395348 m!1281827))

(push 1)

