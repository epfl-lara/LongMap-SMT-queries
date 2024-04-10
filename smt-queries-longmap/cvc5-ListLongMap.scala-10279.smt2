; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120834 () Bool)

(assert start!120834)

(declare-fun res!944175 () Bool)

(declare-fun e!795797 () Bool)

(assert (=> start!120834 (=> (not res!944175) (not e!795797))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120834 (= res!944175 (validMask!0 mask!2840))))

(assert (=> start!120834 e!795797))

(assert (=> start!120834 true))

(declare-datatypes ((array!96141 0))(
  ( (array!96142 (arr!46418 (Array (_ BitVec 32) (_ BitVec 64))) (size!46968 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96141)

(declare-fun array_inv!35446 (array!96141) Bool)

(assert (=> start!120834 (array_inv!35446 a!2901)))

(declare-fun b!1405952 () Bool)

(declare-fun e!795798 () Bool)

(assert (=> b!1405952 (= e!795797 (not e!795798))))

(declare-fun res!944173 () Bool)

(assert (=> b!1405952 (=> res!944173 e!795798)))

(declare-datatypes ((SeekEntryResult!10729 0))(
  ( (MissingZero!10729 (index!45293 (_ BitVec 32))) (Found!10729 (index!45294 (_ BitVec 32))) (Intermediate!10729 (undefined!11541 Bool) (index!45295 (_ BitVec 32)) (x!126904 (_ BitVec 32))) (Undefined!10729) (MissingVacant!10729 (index!45296 (_ BitVec 32))) )
))
(declare-fun lt!619201 () SeekEntryResult!10729)

(assert (=> b!1405952 (= res!944173 (or (not (is-Intermediate!10729 lt!619201)) (undefined!11541 lt!619201)))))

(declare-fun e!795799 () Bool)

(assert (=> b!1405952 e!795799))

(declare-fun res!944174 () Bool)

(assert (=> b!1405952 (=> (not res!944174) (not e!795799))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96141 (_ BitVec 32)) Bool)

(assert (=> b!1405952 (= res!944174 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47432 0))(
  ( (Unit!47433) )
))
(declare-fun lt!619203 () Unit!47432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47432)

(assert (=> b!1405952 (= lt!619203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96141 (_ BitVec 32)) SeekEntryResult!10729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405952 (= lt!619201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46418 a!2901) j!112) mask!2840) (select (arr!46418 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405953 () Bool)

(declare-fun res!944170 () Bool)

(assert (=> b!1405953 (=> (not res!944170) (not e!795797))))

(assert (=> b!1405953 (= res!944170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405954 () Bool)

(assert (=> b!1405954 (= e!795798 true)))

(declare-fun lt!619202 () SeekEntryResult!10729)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405954 (= lt!619202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46418 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46418 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96142 (store (arr!46418 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46968 a!2901)) mask!2840))))

(declare-fun b!1405955 () Bool)

(declare-fun res!944171 () Bool)

(assert (=> b!1405955 (=> (not res!944171) (not e!795797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405955 (= res!944171 (validKeyInArray!0 (select (arr!46418 a!2901) i!1037)))))

(declare-fun b!1405956 () Bool)

(declare-fun res!944176 () Bool)

(assert (=> b!1405956 (=> (not res!944176) (not e!795797))))

(assert (=> b!1405956 (= res!944176 (validKeyInArray!0 (select (arr!46418 a!2901) j!112)))))

(declare-fun b!1405957 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96141 (_ BitVec 32)) SeekEntryResult!10729)

(assert (=> b!1405957 (= e!795799 (= (seekEntryOrOpen!0 (select (arr!46418 a!2901) j!112) a!2901 mask!2840) (Found!10729 j!112)))))

(declare-fun b!1405958 () Bool)

(declare-fun res!944169 () Bool)

(assert (=> b!1405958 (=> (not res!944169) (not e!795797))))

(assert (=> b!1405958 (= res!944169 (and (= (size!46968 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46968 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46968 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405959 () Bool)

(declare-fun res!944172 () Bool)

(assert (=> b!1405959 (=> (not res!944172) (not e!795797))))

(declare-datatypes ((List!32937 0))(
  ( (Nil!32934) (Cons!32933 (h!34187 (_ BitVec 64)) (t!47631 List!32937)) )
))
(declare-fun arrayNoDuplicates!0 (array!96141 (_ BitVec 32) List!32937) Bool)

(assert (=> b!1405959 (= res!944172 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32934))))

(assert (= (and start!120834 res!944175) b!1405958))

(assert (= (and b!1405958 res!944169) b!1405955))

(assert (= (and b!1405955 res!944171) b!1405956))

(assert (= (and b!1405956 res!944176) b!1405953))

(assert (= (and b!1405953 res!944170) b!1405959))

(assert (= (and b!1405959 res!944172) b!1405952))

(assert (= (and b!1405952 res!944174) b!1405957))

(assert (= (and b!1405952 (not res!944173)) b!1405954))

(declare-fun m!1294893 () Bool)

(assert (=> b!1405952 m!1294893))

(declare-fun m!1294895 () Bool)

(assert (=> b!1405952 m!1294895))

(assert (=> b!1405952 m!1294893))

(declare-fun m!1294897 () Bool)

(assert (=> b!1405952 m!1294897))

(assert (=> b!1405952 m!1294895))

(assert (=> b!1405952 m!1294893))

(declare-fun m!1294899 () Bool)

(assert (=> b!1405952 m!1294899))

(declare-fun m!1294901 () Bool)

(assert (=> b!1405952 m!1294901))

(declare-fun m!1294903 () Bool)

(assert (=> start!120834 m!1294903))

(declare-fun m!1294905 () Bool)

(assert (=> start!120834 m!1294905))

(declare-fun m!1294907 () Bool)

(assert (=> b!1405955 m!1294907))

(assert (=> b!1405955 m!1294907))

(declare-fun m!1294909 () Bool)

(assert (=> b!1405955 m!1294909))

(declare-fun m!1294911 () Bool)

(assert (=> b!1405954 m!1294911))

(declare-fun m!1294913 () Bool)

(assert (=> b!1405954 m!1294913))

(assert (=> b!1405954 m!1294913))

(declare-fun m!1294915 () Bool)

(assert (=> b!1405954 m!1294915))

(assert (=> b!1405954 m!1294915))

(assert (=> b!1405954 m!1294913))

(declare-fun m!1294917 () Bool)

(assert (=> b!1405954 m!1294917))

(assert (=> b!1405957 m!1294893))

(assert (=> b!1405957 m!1294893))

(declare-fun m!1294919 () Bool)

(assert (=> b!1405957 m!1294919))

(declare-fun m!1294921 () Bool)

(assert (=> b!1405953 m!1294921))

(assert (=> b!1405956 m!1294893))

(assert (=> b!1405956 m!1294893))

(declare-fun m!1294923 () Bool)

(assert (=> b!1405956 m!1294923))

(declare-fun m!1294925 () Bool)

(assert (=> b!1405959 m!1294925))

(push 1)

(assert (not b!1405955))

(assert (not b!1405956))

(assert (not b!1405957))

(assert (not b!1405959))

(assert (not b!1405952))

(assert (not start!120834))

(assert (not b!1405953))

(assert (not b!1405954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

