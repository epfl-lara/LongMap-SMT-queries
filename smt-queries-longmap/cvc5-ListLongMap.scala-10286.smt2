; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121068 () Bool)

(assert start!121068)

(declare-fun b!1407644 () Bool)

(declare-fun res!945183 () Bool)

(declare-fun e!796813 () Bool)

(assert (=> b!1407644 (=> (not res!945183) (not e!796813))))

(declare-datatypes ((array!96297 0))(
  ( (array!96298 (arr!46494 (Array (_ BitVec 32) (_ BitVec 64))) (size!47045 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96297)

(declare-datatypes ((List!33000 0))(
  ( (Nil!32997) (Cons!32996 (h!34258 (_ BitVec 64)) (t!47686 List!33000)) )
))
(declare-fun arrayNoDuplicates!0 (array!96297 (_ BitVec 32) List!33000) Bool)

(assert (=> b!1407644 (= res!945183 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32997))))

(declare-fun b!1407645 () Bool)

(declare-fun res!945180 () Bool)

(assert (=> b!1407645 (=> (not res!945180) (not e!796813))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407645 (= res!945180 (validKeyInArray!0 (select (arr!46494 a!2901) i!1037)))))

(declare-fun b!1407646 () Bool)

(declare-fun e!796814 () Bool)

(assert (=> b!1407646 (= e!796814 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10708 0))(
  ( (MissingZero!10708 (index!45209 (_ BitVec 32))) (Found!10708 (index!45210 (_ BitVec 32))) (Intermediate!10708 (undefined!11520 Bool) (index!45211 (_ BitVec 32)) (x!126958 (_ BitVec 32))) (Undefined!10708) (MissingVacant!10708 (index!45212 (_ BitVec 32))) )
))
(declare-fun lt!619807 () SeekEntryResult!10708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96297 (_ BitVec 32)) SeekEntryResult!10708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407646 (= lt!619807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96298 (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47045 a!2901)) mask!2840))))

(declare-fun b!1407647 () Bool)

(declare-fun e!796811 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96297 (_ BitVec 32)) SeekEntryResult!10708)

(assert (=> b!1407647 (= e!796811 (= (seekEntryOrOpen!0 (select (arr!46494 a!2901) j!112) a!2901 mask!2840) (Found!10708 j!112)))))

(declare-fun b!1407648 () Bool)

(assert (=> b!1407648 (= e!796813 (not e!796814))))

(declare-fun res!945179 () Bool)

(assert (=> b!1407648 (=> res!945179 e!796814)))

(declare-fun lt!619806 () SeekEntryResult!10708)

(assert (=> b!1407648 (= res!945179 (or (not (is-Intermediate!10708 lt!619806)) (undefined!11520 lt!619806)))))

(assert (=> b!1407648 e!796811))

(declare-fun res!945178 () Bool)

(assert (=> b!1407648 (=> (not res!945178) (not e!796811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96297 (_ BitVec 32)) Bool)

(assert (=> b!1407648 (= res!945178 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47417 0))(
  ( (Unit!47418) )
))
(declare-fun lt!619808 () Unit!47417)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47417)

(assert (=> b!1407648 (= lt!619808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407648 (= lt!619806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46494 a!2901) j!112) mask!2840) (select (arr!46494 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407649 () Bool)

(declare-fun res!945182 () Bool)

(assert (=> b!1407649 (=> (not res!945182) (not e!796813))))

(assert (=> b!1407649 (= res!945182 (validKeyInArray!0 (select (arr!46494 a!2901) j!112)))))

(declare-fun b!1407650 () Bool)

(declare-fun res!945184 () Bool)

(assert (=> b!1407650 (=> (not res!945184) (not e!796813))))

(assert (=> b!1407650 (= res!945184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!945177 () Bool)

(assert (=> start!121068 (=> (not res!945177) (not e!796813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121068 (= res!945177 (validMask!0 mask!2840))))

(assert (=> start!121068 e!796813))

(assert (=> start!121068 true))

(declare-fun array_inv!35775 (array!96297) Bool)

(assert (=> start!121068 (array_inv!35775 a!2901)))

(declare-fun b!1407651 () Bool)

(declare-fun res!945181 () Bool)

(assert (=> b!1407651 (=> (not res!945181) (not e!796813))))

(assert (=> b!1407651 (= res!945181 (and (= (size!47045 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47045 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47045 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121068 res!945177) b!1407651))

(assert (= (and b!1407651 res!945181) b!1407645))

(assert (= (and b!1407645 res!945180) b!1407649))

(assert (= (and b!1407649 res!945182) b!1407650))

(assert (= (and b!1407650 res!945184) b!1407644))

(assert (= (and b!1407644 res!945183) b!1407648))

(assert (= (and b!1407648 res!945178) b!1407647))

(assert (= (and b!1407648 (not res!945179)) b!1407646))

(declare-fun m!1297047 () Bool)

(assert (=> b!1407646 m!1297047))

(declare-fun m!1297049 () Bool)

(assert (=> b!1407646 m!1297049))

(assert (=> b!1407646 m!1297049))

(declare-fun m!1297051 () Bool)

(assert (=> b!1407646 m!1297051))

(assert (=> b!1407646 m!1297051))

(assert (=> b!1407646 m!1297049))

(declare-fun m!1297053 () Bool)

(assert (=> b!1407646 m!1297053))

(declare-fun m!1297055 () Bool)

(assert (=> start!121068 m!1297055))

(declare-fun m!1297057 () Bool)

(assert (=> start!121068 m!1297057))

(declare-fun m!1297059 () Bool)

(assert (=> b!1407644 m!1297059))

(declare-fun m!1297061 () Bool)

(assert (=> b!1407647 m!1297061))

(assert (=> b!1407647 m!1297061))

(declare-fun m!1297063 () Bool)

(assert (=> b!1407647 m!1297063))

(declare-fun m!1297065 () Bool)

(assert (=> b!1407645 m!1297065))

(assert (=> b!1407645 m!1297065))

(declare-fun m!1297067 () Bool)

(assert (=> b!1407645 m!1297067))

(declare-fun m!1297069 () Bool)

(assert (=> b!1407650 m!1297069))

(assert (=> b!1407649 m!1297061))

(assert (=> b!1407649 m!1297061))

(declare-fun m!1297071 () Bool)

(assert (=> b!1407649 m!1297071))

(assert (=> b!1407648 m!1297061))

(declare-fun m!1297073 () Bool)

(assert (=> b!1407648 m!1297073))

(assert (=> b!1407648 m!1297061))

(declare-fun m!1297075 () Bool)

(assert (=> b!1407648 m!1297075))

(assert (=> b!1407648 m!1297073))

(assert (=> b!1407648 m!1297061))

(declare-fun m!1297077 () Bool)

(assert (=> b!1407648 m!1297077))

(declare-fun m!1297079 () Bool)

(assert (=> b!1407648 m!1297079))

(push 1)

(assert (not b!1407649))

(assert (not b!1407645))

(assert (not b!1407646))

(assert (not b!1407648))

(assert (not b!1407650))

(assert (not b!1407647))

(assert (not b!1407644))

(assert (not start!121068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

