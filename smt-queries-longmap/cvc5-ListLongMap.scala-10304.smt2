; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121146 () Bool)

(assert start!121146)

(declare-fun b!1408598 () Bool)

(declare-fun res!946325 () Bool)

(declare-fun e!797174 () Bool)

(assert (=> b!1408598 (=> (not res!946325) (not e!797174))))

(declare-datatypes ((array!96300 0))(
  ( (array!96301 (arr!46493 (Array (_ BitVec 32) (_ BitVec 64))) (size!47043 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96300)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96300 (_ BitVec 32)) Bool)

(assert (=> b!1408598 (= res!946325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!946321 () Bool)

(assert (=> start!121146 (=> (not res!946321) (not e!797174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121146 (= res!946321 (validMask!0 mask!2840))))

(assert (=> start!121146 e!797174))

(assert (=> start!121146 true))

(declare-fun array_inv!35521 (array!96300) Bool)

(assert (=> start!121146 (array_inv!35521 a!2901)))

(declare-fun b!1408599 () Bool)

(declare-fun res!946326 () Bool)

(assert (=> b!1408599 (=> (not res!946326) (not e!797174))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408599 (= res!946326 (validKeyInArray!0 (select (arr!46493 a!2901) i!1037)))))

(declare-fun b!1408600 () Bool)

(declare-fun e!797175 () Bool)

(assert (=> b!1408600 (= e!797175 true)))

(declare-datatypes ((SeekEntryResult!10804 0))(
  ( (MissingZero!10804 (index!45593 (_ BitVec 32))) (Found!10804 (index!45594 (_ BitVec 32))) (Intermediate!10804 (undefined!11616 Bool) (index!45595 (_ BitVec 32)) (x!127197 (_ BitVec 32))) (Undefined!10804) (MissingVacant!10804 (index!45596 (_ BitVec 32))) )
))
(declare-fun lt!620407 () SeekEntryResult!10804)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96300 (_ BitVec 32)) SeekEntryResult!10804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408600 (= lt!620407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46493 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46493 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96301 (store (arr!46493 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47043 a!2901)) mask!2840))))

(declare-fun b!1408601 () Bool)

(declare-fun res!946324 () Bool)

(assert (=> b!1408601 (=> (not res!946324) (not e!797174))))

(assert (=> b!1408601 (= res!946324 (and (= (size!47043 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47043 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47043 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408602 () Bool)

(assert (=> b!1408602 (= e!797174 (not e!797175))))

(declare-fun res!946322 () Bool)

(assert (=> b!1408602 (=> res!946322 e!797175)))

(declare-fun lt!620409 () SeekEntryResult!10804)

(assert (=> b!1408602 (= res!946322 (or (not (is-Intermediate!10804 lt!620409)) (undefined!11616 lt!620409)))))

(declare-fun e!797177 () Bool)

(assert (=> b!1408602 e!797177))

(declare-fun res!946323 () Bool)

(assert (=> b!1408602 (=> (not res!946323) (not e!797177))))

(assert (=> b!1408602 (= res!946323 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47582 0))(
  ( (Unit!47583) )
))
(declare-fun lt!620408 () Unit!47582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47582)

(assert (=> b!1408602 (= lt!620408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408602 (= lt!620409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46493 a!2901) j!112) mask!2840) (select (arr!46493 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408603 () Bool)

(declare-fun res!946327 () Bool)

(assert (=> b!1408603 (=> (not res!946327) (not e!797174))))

(declare-datatypes ((List!33012 0))(
  ( (Nil!33009) (Cons!33008 (h!34271 (_ BitVec 64)) (t!47706 List!33012)) )
))
(declare-fun arrayNoDuplicates!0 (array!96300 (_ BitVec 32) List!33012) Bool)

(assert (=> b!1408603 (= res!946327 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33009))))

(declare-fun b!1408604 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96300 (_ BitVec 32)) SeekEntryResult!10804)

(assert (=> b!1408604 (= e!797177 (= (seekEntryOrOpen!0 (select (arr!46493 a!2901) j!112) a!2901 mask!2840) (Found!10804 j!112)))))

(declare-fun b!1408605 () Bool)

(declare-fun res!946320 () Bool)

(assert (=> b!1408605 (=> (not res!946320) (not e!797174))))

(assert (=> b!1408605 (= res!946320 (validKeyInArray!0 (select (arr!46493 a!2901) j!112)))))

(assert (= (and start!121146 res!946321) b!1408601))

(assert (= (and b!1408601 res!946324) b!1408599))

(assert (= (and b!1408599 res!946326) b!1408605))

(assert (= (and b!1408605 res!946320) b!1408598))

(assert (= (and b!1408598 res!946325) b!1408603))

(assert (= (and b!1408603 res!946327) b!1408602))

(assert (= (and b!1408602 res!946323) b!1408604))

(assert (= (and b!1408602 (not res!946322)) b!1408600))

(declare-fun m!1297965 () Bool)

(assert (=> b!1408599 m!1297965))

(assert (=> b!1408599 m!1297965))

(declare-fun m!1297967 () Bool)

(assert (=> b!1408599 m!1297967))

(declare-fun m!1297969 () Bool)

(assert (=> b!1408600 m!1297969))

(declare-fun m!1297971 () Bool)

(assert (=> b!1408600 m!1297971))

(assert (=> b!1408600 m!1297971))

(declare-fun m!1297973 () Bool)

(assert (=> b!1408600 m!1297973))

(assert (=> b!1408600 m!1297973))

(assert (=> b!1408600 m!1297971))

(declare-fun m!1297975 () Bool)

(assert (=> b!1408600 m!1297975))

(declare-fun m!1297977 () Bool)

(assert (=> b!1408604 m!1297977))

(assert (=> b!1408604 m!1297977))

(declare-fun m!1297979 () Bool)

(assert (=> b!1408604 m!1297979))

(declare-fun m!1297981 () Bool)

(assert (=> start!121146 m!1297981))

(declare-fun m!1297983 () Bool)

(assert (=> start!121146 m!1297983))

(assert (=> b!1408602 m!1297977))

(declare-fun m!1297985 () Bool)

(assert (=> b!1408602 m!1297985))

(assert (=> b!1408602 m!1297977))

(declare-fun m!1297987 () Bool)

(assert (=> b!1408602 m!1297987))

(assert (=> b!1408602 m!1297985))

(assert (=> b!1408602 m!1297977))

(declare-fun m!1297989 () Bool)

(assert (=> b!1408602 m!1297989))

(declare-fun m!1297991 () Bool)

(assert (=> b!1408602 m!1297991))

(declare-fun m!1297993 () Bool)

(assert (=> b!1408598 m!1297993))

(declare-fun m!1297995 () Bool)

(assert (=> b!1408603 m!1297995))

(assert (=> b!1408605 m!1297977))

(assert (=> b!1408605 m!1297977))

(declare-fun m!1297997 () Bool)

(assert (=> b!1408605 m!1297997))

(push 1)

(assert (not b!1408603))

(assert (not b!1408599))

(assert (not b!1408604))

(assert (not b!1408605))

(assert (not b!1408598))

(assert (not b!1408600))

(assert (not start!121146))

(assert (not b!1408602))

(check-sat)

