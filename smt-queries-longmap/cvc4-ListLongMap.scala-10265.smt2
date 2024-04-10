; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120754 () Bool)

(assert start!120754)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1405074 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!795400 () Bool)

(declare-datatypes ((array!96061 0))(
  ( (array!96062 (arr!46378 (Array (_ BitVec 32) (_ BitVec 64))) (size!46928 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96061)

(declare-datatypes ((SeekEntryResult!10689 0))(
  ( (MissingZero!10689 (index!45133 (_ BitVec 32))) (Found!10689 (index!45134 (_ BitVec 32))) (Intermediate!10689 (undefined!11501 Bool) (index!45135 (_ BitVec 32)) (x!126752 (_ BitVec 32))) (Undefined!10689) (MissingVacant!10689 (index!45136 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96061 (_ BitVec 32)) SeekEntryResult!10689)

(assert (=> b!1405074 (= e!795400 (= (seekEntryOrOpen!0 (select (arr!46378 a!2901) j!112) a!2901 mask!2840) (Found!10689 j!112)))))

(declare-fun b!1405075 () Bool)

(declare-fun res!943296 () Bool)

(declare-fun e!795401 () Bool)

(assert (=> b!1405075 (=> (not res!943296) (not e!795401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405075 (= res!943296 (validKeyInArray!0 (select (arr!46378 a!2901) j!112)))))

(declare-fun b!1405076 () Bool)

(assert (=> b!1405076 (= e!795401 (not true))))

(assert (=> b!1405076 e!795400))

(declare-fun res!943295 () Bool)

(assert (=> b!1405076 (=> (not res!943295) (not e!795400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96061 (_ BitVec 32)) Bool)

(assert (=> b!1405076 (= res!943295 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47352 0))(
  ( (Unit!47353) )
))
(declare-fun lt!618924 () Unit!47352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47352)

(assert (=> b!1405076 (= lt!618924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618923 () SeekEntryResult!10689)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96061 (_ BitVec 32)) SeekEntryResult!10689)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405076 (= lt!618923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46378 a!2901) j!112) mask!2840) (select (arr!46378 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405077 () Bool)

(declare-fun res!943292 () Bool)

(assert (=> b!1405077 (=> (not res!943292) (not e!795401))))

(declare-datatypes ((List!32897 0))(
  ( (Nil!32894) (Cons!32893 (h!34147 (_ BitVec 64)) (t!47591 List!32897)) )
))
(declare-fun arrayNoDuplicates!0 (array!96061 (_ BitVec 32) List!32897) Bool)

(assert (=> b!1405077 (= res!943292 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32894))))

(declare-fun b!1405078 () Bool)

(declare-fun res!943293 () Bool)

(assert (=> b!1405078 (=> (not res!943293) (not e!795401))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405078 (= res!943293 (validKeyInArray!0 (select (arr!46378 a!2901) i!1037)))))

(declare-fun res!943297 () Bool)

(assert (=> start!120754 (=> (not res!943297) (not e!795401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120754 (= res!943297 (validMask!0 mask!2840))))

(assert (=> start!120754 e!795401))

(assert (=> start!120754 true))

(declare-fun array_inv!35406 (array!96061) Bool)

(assert (=> start!120754 (array_inv!35406 a!2901)))

(declare-fun b!1405079 () Bool)

(declare-fun res!943294 () Bool)

(assert (=> b!1405079 (=> (not res!943294) (not e!795401))))

(assert (=> b!1405079 (= res!943294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405080 () Bool)

(declare-fun res!943291 () Bool)

(assert (=> b!1405080 (=> (not res!943291) (not e!795401))))

(assert (=> b!1405080 (= res!943291 (and (= (size!46928 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46928 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46928 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120754 res!943297) b!1405080))

(assert (= (and b!1405080 res!943291) b!1405078))

(assert (= (and b!1405078 res!943293) b!1405075))

(assert (= (and b!1405075 res!943296) b!1405079))

(assert (= (and b!1405079 res!943294) b!1405077))

(assert (= (and b!1405077 res!943292) b!1405076))

(assert (= (and b!1405076 res!943295) b!1405074))

(declare-fun m!1293769 () Bool)

(assert (=> b!1405075 m!1293769))

(assert (=> b!1405075 m!1293769))

(declare-fun m!1293771 () Bool)

(assert (=> b!1405075 m!1293771))

(assert (=> b!1405076 m!1293769))

(declare-fun m!1293773 () Bool)

(assert (=> b!1405076 m!1293773))

(assert (=> b!1405076 m!1293769))

(declare-fun m!1293775 () Bool)

(assert (=> b!1405076 m!1293775))

(assert (=> b!1405076 m!1293773))

(assert (=> b!1405076 m!1293769))

(declare-fun m!1293777 () Bool)

(assert (=> b!1405076 m!1293777))

(declare-fun m!1293779 () Bool)

(assert (=> b!1405076 m!1293779))

(declare-fun m!1293781 () Bool)

(assert (=> b!1405078 m!1293781))

(assert (=> b!1405078 m!1293781))

(declare-fun m!1293783 () Bool)

(assert (=> b!1405078 m!1293783))

(declare-fun m!1293785 () Bool)

(assert (=> b!1405079 m!1293785))

(assert (=> b!1405074 m!1293769))

(assert (=> b!1405074 m!1293769))

(declare-fun m!1293787 () Bool)

(assert (=> b!1405074 m!1293787))

(declare-fun m!1293789 () Bool)

(assert (=> start!120754 m!1293789))

(declare-fun m!1293791 () Bool)

(assert (=> start!120754 m!1293791))

(declare-fun m!1293793 () Bool)

(assert (=> b!1405077 m!1293793))

(push 1)

(assert (not b!1405075))

(assert (not b!1405074))

(assert (not b!1405078))

(assert (not b!1405076))

(assert (not b!1405079))

(assert (not start!120754))

(assert (not b!1405077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

