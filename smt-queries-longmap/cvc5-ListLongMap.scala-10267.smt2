; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120762 () Bool)

(assert start!120762)

(declare-fun b!1405158 () Bool)

(declare-fun res!943378 () Bool)

(declare-fun e!795436 () Bool)

(assert (=> b!1405158 (=> (not res!943378) (not e!795436))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96069 0))(
  ( (array!96070 (arr!46382 (Array (_ BitVec 32) (_ BitVec 64))) (size!46932 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96069)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405158 (= res!943378 (and (= (size!46932 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46932 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46932 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405159 () Bool)

(assert (=> b!1405159 (= e!795436 (not true))))

(declare-fun e!795435 () Bool)

(assert (=> b!1405159 e!795435))

(declare-fun res!943375 () Bool)

(assert (=> b!1405159 (=> (not res!943375) (not e!795435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96069 (_ BitVec 32)) Bool)

(assert (=> b!1405159 (= res!943375 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47360 0))(
  ( (Unit!47361) )
))
(declare-fun lt!618948 () Unit!47360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47360)

(assert (=> b!1405159 (= lt!618948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10693 0))(
  ( (MissingZero!10693 (index!45149 (_ BitVec 32))) (Found!10693 (index!45150 (_ BitVec 32))) (Intermediate!10693 (undefined!11505 Bool) (index!45151 (_ BitVec 32)) (x!126772 (_ BitVec 32))) (Undefined!10693) (MissingVacant!10693 (index!45152 (_ BitVec 32))) )
))
(declare-fun lt!618947 () SeekEntryResult!10693)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96069 (_ BitVec 32)) SeekEntryResult!10693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405159 (= lt!618947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46382 a!2901) j!112) mask!2840) (select (arr!46382 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943381 () Bool)

(assert (=> start!120762 (=> (not res!943381) (not e!795436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120762 (= res!943381 (validMask!0 mask!2840))))

(assert (=> start!120762 e!795436))

(assert (=> start!120762 true))

(declare-fun array_inv!35410 (array!96069) Bool)

(assert (=> start!120762 (array_inv!35410 a!2901)))

(declare-fun b!1405160 () Bool)

(declare-fun res!943377 () Bool)

(assert (=> b!1405160 (=> (not res!943377) (not e!795436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405160 (= res!943377 (validKeyInArray!0 (select (arr!46382 a!2901) j!112)))))

(declare-fun b!1405161 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96069 (_ BitVec 32)) SeekEntryResult!10693)

(assert (=> b!1405161 (= e!795435 (= (seekEntryOrOpen!0 (select (arr!46382 a!2901) j!112) a!2901 mask!2840) (Found!10693 j!112)))))

(declare-fun b!1405162 () Bool)

(declare-fun res!943380 () Bool)

(assert (=> b!1405162 (=> (not res!943380) (not e!795436))))

(declare-datatypes ((List!32901 0))(
  ( (Nil!32898) (Cons!32897 (h!34151 (_ BitVec 64)) (t!47595 List!32901)) )
))
(declare-fun arrayNoDuplicates!0 (array!96069 (_ BitVec 32) List!32901) Bool)

(assert (=> b!1405162 (= res!943380 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32898))))

(declare-fun b!1405163 () Bool)

(declare-fun res!943379 () Bool)

(assert (=> b!1405163 (=> (not res!943379) (not e!795436))))

(assert (=> b!1405163 (= res!943379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405164 () Bool)

(declare-fun res!943376 () Bool)

(assert (=> b!1405164 (=> (not res!943376) (not e!795436))))

(assert (=> b!1405164 (= res!943376 (validKeyInArray!0 (select (arr!46382 a!2901) i!1037)))))

(assert (= (and start!120762 res!943381) b!1405158))

(assert (= (and b!1405158 res!943378) b!1405164))

(assert (= (and b!1405164 res!943376) b!1405160))

(assert (= (and b!1405160 res!943377) b!1405163))

(assert (= (and b!1405163 res!943379) b!1405162))

(assert (= (and b!1405162 res!943380) b!1405159))

(assert (= (and b!1405159 res!943375) b!1405161))

(declare-fun m!1293873 () Bool)

(assert (=> start!120762 m!1293873))

(declare-fun m!1293875 () Bool)

(assert (=> start!120762 m!1293875))

(declare-fun m!1293877 () Bool)

(assert (=> b!1405164 m!1293877))

(assert (=> b!1405164 m!1293877))

(declare-fun m!1293879 () Bool)

(assert (=> b!1405164 m!1293879))

(declare-fun m!1293881 () Bool)

(assert (=> b!1405161 m!1293881))

(assert (=> b!1405161 m!1293881))

(declare-fun m!1293883 () Bool)

(assert (=> b!1405161 m!1293883))

(assert (=> b!1405160 m!1293881))

(assert (=> b!1405160 m!1293881))

(declare-fun m!1293885 () Bool)

(assert (=> b!1405160 m!1293885))

(declare-fun m!1293887 () Bool)

(assert (=> b!1405163 m!1293887))

(assert (=> b!1405159 m!1293881))

(declare-fun m!1293889 () Bool)

(assert (=> b!1405159 m!1293889))

(assert (=> b!1405159 m!1293881))

(declare-fun m!1293891 () Bool)

(assert (=> b!1405159 m!1293891))

(assert (=> b!1405159 m!1293889))

(assert (=> b!1405159 m!1293881))

(declare-fun m!1293893 () Bool)

(assert (=> b!1405159 m!1293893))

(declare-fun m!1293895 () Bool)

(assert (=> b!1405159 m!1293895))

(declare-fun m!1293897 () Bool)

(assert (=> b!1405162 m!1293897))

(push 1)

(assert (not b!1405164))

(assert (not b!1405160))

(assert (not b!1405163))

(assert (not start!120762))

(assert (not b!1405159))

(assert (not b!1405162))

(assert (not b!1405161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

