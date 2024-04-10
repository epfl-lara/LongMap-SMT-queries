; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119504 () Bool)

(assert start!119504)

(declare-fun b!1392353 () Bool)

(declare-fun res!931932 () Bool)

(declare-fun e!788447 () Bool)

(assert (=> b!1392353 (=> (not res!931932) (not e!788447))))

(declare-datatypes ((array!95237 0))(
  ( (array!95238 (arr!45978 (Array (_ BitVec 32) (_ BitVec 64))) (size!46528 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95237)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392353 (= res!931932 (validKeyInArray!0 (select (arr!45978 a!2901) j!112)))))

(declare-fun b!1392354 () Bool)

(declare-fun res!931926 () Bool)

(assert (=> b!1392354 (=> (not res!931926) (not e!788447))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392354 (= res!931926 (and (= (size!46528 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46528 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46528 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931933 () Bool)

(assert (=> start!119504 (=> (not res!931933) (not e!788447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119504 (= res!931933 (validMask!0 mask!2840))))

(assert (=> start!119504 e!788447))

(assert (=> start!119504 true))

(declare-fun array_inv!35006 (array!95237) Bool)

(assert (=> start!119504 (array_inv!35006 a!2901)))

(declare-fun b!1392355 () Bool)

(declare-fun res!931931 () Bool)

(assert (=> b!1392355 (=> (not res!931931) (not e!788447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95237 (_ BitVec 32)) Bool)

(assert (=> b!1392355 (= res!931931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392356 () Bool)

(declare-fun res!931927 () Bool)

(assert (=> b!1392356 (=> (not res!931927) (not e!788447))))

(assert (=> b!1392356 (= res!931927 (validKeyInArray!0 (select (arr!45978 a!2901) i!1037)))))

(declare-fun e!788450 () Bool)

(declare-fun b!1392357 () Bool)

(declare-datatypes ((SeekEntryResult!10295 0))(
  ( (MissingZero!10295 (index!43551 (_ BitVec 32))) (Found!10295 (index!43552 (_ BitVec 32))) (Intermediate!10295 (undefined!11107 Bool) (index!43553 (_ BitVec 32)) (x!125237 (_ BitVec 32))) (Undefined!10295) (MissingVacant!10295 (index!43554 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95237 (_ BitVec 32)) SeekEntryResult!10295)

(assert (=> b!1392357 (= e!788450 (= (seekEntryOrOpen!0 (select (arr!45978 a!2901) j!112) a!2901 mask!2840) (Found!10295 j!112)))))

(declare-fun b!1392358 () Bool)

(declare-fun e!788448 () Bool)

(assert (=> b!1392358 (= e!788447 (not e!788448))))

(declare-fun res!931930 () Bool)

(assert (=> b!1392358 (=> res!931930 e!788448)))

(declare-fun lt!611589 () SeekEntryResult!10295)

(get-info :version)

(assert (=> b!1392358 (= res!931930 (or (not ((_ is Intermediate!10295) lt!611589)) (undefined!11107 lt!611589)))))

(assert (=> b!1392358 e!788450))

(declare-fun res!931929 () Bool)

(assert (=> b!1392358 (=> (not res!931929) (not e!788450))))

(assert (=> b!1392358 (= res!931929 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46594 0))(
  ( (Unit!46595) )
))
(declare-fun lt!611587 () Unit!46594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46594)

(assert (=> b!1392358 (= lt!611587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95237 (_ BitVec 32)) SeekEntryResult!10295)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392358 (= lt!611589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45978 a!2901) j!112) mask!2840) (select (arr!45978 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392359 () Bool)

(assert (=> b!1392359 (= e!788448 true)))

(declare-fun lt!611588 () (_ BitVec 32))

(assert (=> b!1392359 (= lt!611588 (toIndex!0 (select (store (arr!45978 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392360 () Bool)

(declare-fun res!931928 () Bool)

(assert (=> b!1392360 (=> (not res!931928) (not e!788447))))

(declare-datatypes ((List!32497 0))(
  ( (Nil!32494) (Cons!32493 (h!33723 (_ BitVec 64)) (t!47191 List!32497)) )
))
(declare-fun arrayNoDuplicates!0 (array!95237 (_ BitVec 32) List!32497) Bool)

(assert (=> b!1392360 (= res!931928 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32494))))

(assert (= (and start!119504 res!931933) b!1392354))

(assert (= (and b!1392354 res!931926) b!1392356))

(assert (= (and b!1392356 res!931927) b!1392353))

(assert (= (and b!1392353 res!931932) b!1392355))

(assert (= (and b!1392355 res!931931) b!1392360))

(assert (= (and b!1392360 res!931928) b!1392358))

(assert (= (and b!1392358 res!931929) b!1392357))

(assert (= (and b!1392358 (not res!931930)) b!1392359))

(declare-fun m!1278065 () Bool)

(assert (=> start!119504 m!1278065))

(declare-fun m!1278067 () Bool)

(assert (=> start!119504 m!1278067))

(declare-fun m!1278069 () Bool)

(assert (=> b!1392357 m!1278069))

(assert (=> b!1392357 m!1278069))

(declare-fun m!1278071 () Bool)

(assert (=> b!1392357 m!1278071))

(declare-fun m!1278073 () Bool)

(assert (=> b!1392355 m!1278073))

(assert (=> b!1392353 m!1278069))

(assert (=> b!1392353 m!1278069))

(declare-fun m!1278075 () Bool)

(assert (=> b!1392353 m!1278075))

(declare-fun m!1278077 () Bool)

(assert (=> b!1392356 m!1278077))

(assert (=> b!1392356 m!1278077))

(declare-fun m!1278079 () Bool)

(assert (=> b!1392356 m!1278079))

(declare-fun m!1278081 () Bool)

(assert (=> b!1392360 m!1278081))

(assert (=> b!1392358 m!1278069))

(declare-fun m!1278083 () Bool)

(assert (=> b!1392358 m!1278083))

(assert (=> b!1392358 m!1278069))

(declare-fun m!1278085 () Bool)

(assert (=> b!1392358 m!1278085))

(assert (=> b!1392358 m!1278083))

(assert (=> b!1392358 m!1278069))

(declare-fun m!1278087 () Bool)

(assert (=> b!1392358 m!1278087))

(declare-fun m!1278089 () Bool)

(assert (=> b!1392358 m!1278089))

(declare-fun m!1278091 () Bool)

(assert (=> b!1392359 m!1278091))

(declare-fun m!1278093 () Bool)

(assert (=> b!1392359 m!1278093))

(assert (=> b!1392359 m!1278093))

(declare-fun m!1278095 () Bool)

(assert (=> b!1392359 m!1278095))

(check-sat (not b!1392359) (not b!1392355) (not b!1392358) (not start!119504) (not b!1392356) (not b!1392353) (not b!1392360) (not b!1392357))
