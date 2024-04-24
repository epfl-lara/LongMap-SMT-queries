; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119850 () Bool)

(assert start!119850)

(declare-fun res!933750 () Bool)

(declare-fun e!789978 () Bool)

(assert (=> start!119850 (=> (not res!933750) (not e!789978))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119850 (= res!933750 (validMask!0 mask!2840))))

(assert (=> start!119850 e!789978))

(assert (=> start!119850 true))

(declare-datatypes ((array!95454 0))(
  ( (array!95455 (arr!46083 (Array (_ BitVec 32) (_ BitVec 64))) (size!46634 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95454)

(declare-fun array_inv!35364 (array!95454) Bool)

(assert (=> start!119850 (array_inv!35364 a!2901)))

(declare-fun b!1395023 () Bool)

(declare-fun res!933749 () Bool)

(assert (=> b!1395023 (=> (not res!933749) (not e!789978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95454 (_ BitVec 32)) Bool)

(assert (=> b!1395023 (= res!933749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395024 () Bool)

(declare-fun e!789977 () Bool)

(assert (=> b!1395024 (= e!789978 (not e!789977))))

(declare-fun res!933754 () Bool)

(assert (=> b!1395024 (=> res!933754 e!789977)))

(declare-datatypes ((SeekEntryResult!10303 0))(
  ( (MissingZero!10303 (index!43583 (_ BitVec 32))) (Found!10303 (index!43584 (_ BitVec 32))) (Intermediate!10303 (undefined!11115 Bool) (index!43585 (_ BitVec 32)) (x!125406 (_ BitVec 32))) (Undefined!10303) (MissingVacant!10303 (index!43586 (_ BitVec 32))) )
))
(declare-fun lt!612556 () SeekEntryResult!10303)

(assert (=> b!1395024 (= res!933754 (or (not (is-Intermediate!10303 lt!612556)) (undefined!11115 lt!612556)))))

(declare-fun e!789979 () Bool)

(assert (=> b!1395024 e!789979))

(declare-fun res!933753 () Bool)

(assert (=> b!1395024 (=> (not res!933753) (not e!789979))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395024 (= res!933753 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46637 0))(
  ( (Unit!46638) )
))
(declare-fun lt!612557 () Unit!46637)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46637)

(assert (=> b!1395024 (= lt!612557 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95454 (_ BitVec 32)) SeekEntryResult!10303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395024 (= lt!612556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) (select (arr!46083 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395025 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95454 (_ BitVec 32)) SeekEntryResult!10303)

(assert (=> b!1395025 (= e!789979 (= (seekEntryOrOpen!0 (select (arr!46083 a!2901) j!112) a!2901 mask!2840) (Found!10303 j!112)))))

(declare-fun b!1395026 () Bool)

(declare-fun res!933752 () Bool)

(assert (=> b!1395026 (=> (not res!933752) (not e!789978))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395026 (= res!933752 (validKeyInArray!0 (select (arr!46083 a!2901) i!1037)))))

(declare-fun b!1395027 () Bool)

(assert (=> b!1395027 (= e!789977 true)))

(declare-fun lt!612555 () SeekEntryResult!10303)

(assert (=> b!1395027 (= lt!612555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95455 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901)) mask!2840))))

(declare-fun b!1395028 () Bool)

(declare-fun res!933751 () Bool)

(assert (=> b!1395028 (=> (not res!933751) (not e!789978))))

(declare-datatypes ((List!32589 0))(
  ( (Nil!32586) (Cons!32585 (h!33826 (_ BitVec 64)) (t!47275 List!32589)) )
))
(declare-fun arrayNoDuplicates!0 (array!95454 (_ BitVec 32) List!32589) Bool)

(assert (=> b!1395028 (= res!933751 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32586))))

(declare-fun b!1395029 () Bool)

(declare-fun res!933747 () Bool)

(assert (=> b!1395029 (=> (not res!933747) (not e!789978))))

(assert (=> b!1395029 (= res!933747 (validKeyInArray!0 (select (arr!46083 a!2901) j!112)))))

(declare-fun b!1395030 () Bool)

(declare-fun res!933748 () Bool)

(assert (=> b!1395030 (=> (not res!933748) (not e!789978))))

(assert (=> b!1395030 (= res!933748 (and (= (size!46634 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46634 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46634 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119850 res!933750) b!1395030))

(assert (= (and b!1395030 res!933748) b!1395026))

(assert (= (and b!1395026 res!933752) b!1395029))

(assert (= (and b!1395029 res!933747) b!1395023))

(assert (= (and b!1395023 res!933749) b!1395028))

(assert (= (and b!1395028 res!933751) b!1395024))

(assert (= (and b!1395024 res!933753) b!1395025))

(assert (= (and b!1395024 (not res!933754)) b!1395027))

(declare-fun m!1281351 () Bool)

(assert (=> b!1395025 m!1281351))

(assert (=> b!1395025 m!1281351))

(declare-fun m!1281353 () Bool)

(assert (=> b!1395025 m!1281353))

(declare-fun m!1281355 () Bool)

(assert (=> b!1395023 m!1281355))

(declare-fun m!1281357 () Bool)

(assert (=> b!1395028 m!1281357))

(declare-fun m!1281359 () Bool)

(assert (=> b!1395026 m!1281359))

(assert (=> b!1395026 m!1281359))

(declare-fun m!1281361 () Bool)

(assert (=> b!1395026 m!1281361))

(assert (=> b!1395029 m!1281351))

(assert (=> b!1395029 m!1281351))

(declare-fun m!1281363 () Bool)

(assert (=> b!1395029 m!1281363))

(assert (=> b!1395024 m!1281351))

(declare-fun m!1281365 () Bool)

(assert (=> b!1395024 m!1281365))

(assert (=> b!1395024 m!1281351))

(declare-fun m!1281367 () Bool)

(assert (=> b!1395024 m!1281367))

(assert (=> b!1395024 m!1281365))

(assert (=> b!1395024 m!1281351))

(declare-fun m!1281369 () Bool)

(assert (=> b!1395024 m!1281369))

(declare-fun m!1281371 () Bool)

(assert (=> b!1395024 m!1281371))

(declare-fun m!1281373 () Bool)

(assert (=> b!1395027 m!1281373))

(declare-fun m!1281375 () Bool)

(assert (=> b!1395027 m!1281375))

(assert (=> b!1395027 m!1281375))

(declare-fun m!1281377 () Bool)

(assert (=> b!1395027 m!1281377))

(assert (=> b!1395027 m!1281377))

(assert (=> b!1395027 m!1281375))

(declare-fun m!1281379 () Bool)

(assert (=> b!1395027 m!1281379))

(declare-fun m!1281381 () Bool)

(assert (=> start!119850 m!1281381))

(declare-fun m!1281383 () Bool)

(assert (=> start!119850 m!1281383))

(push 1)

(assert (not b!1395025))

(assert (not b!1395029))

(assert (not b!1395027))

(assert (not b!1395023))

(assert (not b!1395026))

(assert (not b!1395028))

(assert (not start!119850))

(assert (not b!1395024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

