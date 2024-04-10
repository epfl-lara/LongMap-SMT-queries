; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120828 () Bool)

(assert start!120828)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96135 0))(
  ( (array!96136 (arr!46415 (Array (_ BitVec 32) (_ BitVec 64))) (size!46965 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96135)

(declare-fun e!795762 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1405880 () Bool)

(declare-datatypes ((SeekEntryResult!10726 0))(
  ( (MissingZero!10726 (index!45281 (_ BitVec 32))) (Found!10726 (index!45282 (_ BitVec 32))) (Intermediate!10726 (undefined!11538 Bool) (index!45283 (_ BitVec 32)) (x!126893 (_ BitVec 32))) (Undefined!10726) (MissingVacant!10726 (index!45284 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96135 (_ BitVec 32)) SeekEntryResult!10726)

(assert (=> b!1405880 (= e!795762 (= (seekEntryOrOpen!0 (select (arr!46415 a!2901) j!112) a!2901 mask!2840) (Found!10726 j!112)))))

(declare-fun b!1405881 () Bool)

(declare-fun res!944101 () Bool)

(declare-fun e!795764 () Bool)

(assert (=> b!1405881 (=> (not res!944101) (not e!795764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405881 (= res!944101 (validKeyInArray!0 (select (arr!46415 a!2901) j!112)))))

(declare-fun res!944099 () Bool)

(assert (=> start!120828 (=> (not res!944099) (not e!795764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120828 (= res!944099 (validMask!0 mask!2840))))

(assert (=> start!120828 e!795764))

(assert (=> start!120828 true))

(declare-fun array_inv!35443 (array!96135) Bool)

(assert (=> start!120828 (array_inv!35443 a!2901)))

(declare-fun b!1405882 () Bool)

(declare-fun res!944098 () Bool)

(assert (=> b!1405882 (=> (not res!944098) (not e!795764))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405882 (= res!944098 (and (= (size!46965 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46965 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46965 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405883 () Bool)

(declare-fun e!795763 () Bool)

(assert (=> b!1405883 (= e!795763 true)))

(declare-fun lt!619175 () SeekEntryResult!10726)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96135 (_ BitVec 32)) SeekEntryResult!10726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405883 (= lt!619175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46415 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46415 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96136 (store (arr!46415 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46965 a!2901)) mask!2840))))

(declare-fun b!1405884 () Bool)

(declare-fun res!944100 () Bool)

(assert (=> b!1405884 (=> (not res!944100) (not e!795764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96135 (_ BitVec 32)) Bool)

(assert (=> b!1405884 (= res!944100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405885 () Bool)

(declare-fun res!944104 () Bool)

(assert (=> b!1405885 (=> (not res!944104) (not e!795764))))

(assert (=> b!1405885 (= res!944104 (validKeyInArray!0 (select (arr!46415 a!2901) i!1037)))))

(declare-fun b!1405886 () Bool)

(assert (=> b!1405886 (= e!795764 (not e!795763))))

(declare-fun res!944102 () Bool)

(assert (=> b!1405886 (=> res!944102 e!795763)))

(declare-fun lt!619176 () SeekEntryResult!10726)

(assert (=> b!1405886 (= res!944102 (or (not (is-Intermediate!10726 lt!619176)) (undefined!11538 lt!619176)))))

(assert (=> b!1405886 e!795762))

(declare-fun res!944103 () Bool)

(assert (=> b!1405886 (=> (not res!944103) (not e!795762))))

(assert (=> b!1405886 (= res!944103 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47426 0))(
  ( (Unit!47427) )
))
(declare-fun lt!619174 () Unit!47426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47426)

(assert (=> b!1405886 (= lt!619174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405886 (= lt!619176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46415 a!2901) j!112) mask!2840) (select (arr!46415 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405887 () Bool)

(declare-fun res!944097 () Bool)

(assert (=> b!1405887 (=> (not res!944097) (not e!795764))))

(declare-datatypes ((List!32934 0))(
  ( (Nil!32931) (Cons!32930 (h!34184 (_ BitVec 64)) (t!47628 List!32934)) )
))
(declare-fun arrayNoDuplicates!0 (array!96135 (_ BitVec 32) List!32934) Bool)

(assert (=> b!1405887 (= res!944097 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32931))))

(assert (= (and start!120828 res!944099) b!1405882))

(assert (= (and b!1405882 res!944098) b!1405885))

(assert (= (and b!1405885 res!944104) b!1405881))

(assert (= (and b!1405881 res!944101) b!1405884))

(assert (= (and b!1405884 res!944100) b!1405887))

(assert (= (and b!1405887 res!944097) b!1405886))

(assert (= (and b!1405886 res!944103) b!1405880))

(assert (= (and b!1405886 (not res!944102)) b!1405883))

(declare-fun m!1294791 () Bool)

(assert (=> b!1405885 m!1294791))

(assert (=> b!1405885 m!1294791))

(declare-fun m!1294793 () Bool)

(assert (=> b!1405885 m!1294793))

(declare-fun m!1294795 () Bool)

(assert (=> b!1405881 m!1294795))

(assert (=> b!1405881 m!1294795))

(declare-fun m!1294797 () Bool)

(assert (=> b!1405881 m!1294797))

(declare-fun m!1294799 () Bool)

(assert (=> b!1405887 m!1294799))

(assert (=> b!1405886 m!1294795))

(declare-fun m!1294801 () Bool)

(assert (=> b!1405886 m!1294801))

(assert (=> b!1405886 m!1294795))

(declare-fun m!1294803 () Bool)

(assert (=> b!1405886 m!1294803))

(assert (=> b!1405886 m!1294801))

(assert (=> b!1405886 m!1294795))

(declare-fun m!1294805 () Bool)

(assert (=> b!1405886 m!1294805))

(declare-fun m!1294807 () Bool)

(assert (=> b!1405886 m!1294807))

(declare-fun m!1294809 () Bool)

(assert (=> b!1405884 m!1294809))

(declare-fun m!1294811 () Bool)

(assert (=> start!120828 m!1294811))

(declare-fun m!1294813 () Bool)

(assert (=> start!120828 m!1294813))

(assert (=> b!1405880 m!1294795))

(assert (=> b!1405880 m!1294795))

(declare-fun m!1294815 () Bool)

(assert (=> b!1405880 m!1294815))

(declare-fun m!1294817 () Bool)

(assert (=> b!1405883 m!1294817))

(declare-fun m!1294819 () Bool)

(assert (=> b!1405883 m!1294819))

(assert (=> b!1405883 m!1294819))

(declare-fun m!1294821 () Bool)

(assert (=> b!1405883 m!1294821))

(assert (=> b!1405883 m!1294821))

(assert (=> b!1405883 m!1294819))

(declare-fun m!1294823 () Bool)

(assert (=> b!1405883 m!1294823))

(push 1)

(assert (not b!1405881))

(assert (not b!1405883))

(assert (not b!1405885))

(assert (not b!1405886))

(assert (not b!1405887))

(assert (not b!1405880))

(assert (not start!120828))

(assert (not b!1405884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

