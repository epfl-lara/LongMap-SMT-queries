; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120858 () Bool)

(assert start!120858)

(declare-fun b!1406207 () Bool)

(declare-fun res!944478 () Bool)

(declare-fun e!795926 () Bool)

(assert (=> b!1406207 (=> (not res!944478) (not e!795926))))

(declare-datatypes ((array!96118 0))(
  ( (array!96119 (arr!46407 (Array (_ BitVec 32) (_ BitVec 64))) (size!46959 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96118)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406207 (= res!944478 (validKeyInArray!0 (select (arr!46407 a!2901) j!112)))))

(declare-fun b!1406208 () Bool)

(declare-fun res!944481 () Bool)

(assert (=> b!1406208 (=> (not res!944481) (not e!795926))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406208 (= res!944481 (and (= (size!46959 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46959 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46959 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406209 () Bool)

(declare-fun res!944476 () Bool)

(assert (=> b!1406209 (=> (not res!944476) (not e!795926))))

(declare-datatypes ((List!33004 0))(
  ( (Nil!33001) (Cons!33000 (h!34254 (_ BitVec 64)) (t!47690 List!33004)) )
))
(declare-fun arrayNoDuplicates!0 (array!96118 (_ BitVec 32) List!33004) Bool)

(assert (=> b!1406209 (= res!944476 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33001))))

(declare-fun res!944479 () Bool)

(assert (=> start!120858 (=> (not res!944479) (not e!795926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120858 (= res!944479 (validMask!0 mask!2840))))

(assert (=> start!120858 e!795926))

(assert (=> start!120858 true))

(declare-fun array_inv!35640 (array!96118) Bool)

(assert (=> start!120858 (array_inv!35640 a!2901)))

(declare-fun b!1406210 () Bool)

(declare-fun e!795929 () Bool)

(assert (=> b!1406210 (= e!795929 true)))

(declare-datatypes ((SeekEntryResult!10744 0))(
  ( (MissingZero!10744 (index!45353 (_ BitVec 32))) (Found!10744 (index!45354 (_ BitVec 32))) (Intermediate!10744 (undefined!11556 Bool) (index!45355 (_ BitVec 32)) (x!126948 (_ BitVec 32))) (Undefined!10744) (MissingVacant!10744 (index!45356 (_ BitVec 32))) )
))
(declare-fun lt!619137 () SeekEntryResult!10744)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96118 (_ BitVec 32)) SeekEntryResult!10744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406210 (= lt!619137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46407 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46407 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96119 (store (arr!46407 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46959 a!2901)) mask!2840))))

(declare-fun b!1406211 () Bool)

(declare-fun res!944477 () Bool)

(assert (=> b!1406211 (=> (not res!944477) (not e!795926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96118 (_ BitVec 32)) Bool)

(assert (=> b!1406211 (= res!944477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406212 () Bool)

(declare-fun res!944482 () Bool)

(assert (=> b!1406212 (=> (not res!944482) (not e!795926))))

(assert (=> b!1406212 (= res!944482 (validKeyInArray!0 (select (arr!46407 a!2901) i!1037)))))

(declare-fun b!1406213 () Bool)

(assert (=> b!1406213 (= e!795926 (not e!795929))))

(declare-fun res!944480 () Bool)

(assert (=> b!1406213 (=> res!944480 e!795929)))

(declare-fun lt!619138 () SeekEntryResult!10744)

(assert (=> b!1406213 (= res!944480 (or (not (is-Intermediate!10744 lt!619138)) (undefined!11556 lt!619138)))))

(declare-fun e!795927 () Bool)

(assert (=> b!1406213 e!795927))

(declare-fun res!944475 () Bool)

(assert (=> b!1406213 (=> (not res!944475) (not e!795927))))

(assert (=> b!1406213 (= res!944475 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47305 0))(
  ( (Unit!47306) )
))
(declare-fun lt!619139 () Unit!47305)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47305)

(assert (=> b!1406213 (= lt!619139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406213 (= lt!619138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46407 a!2901) j!112) mask!2840) (select (arr!46407 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406214 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96118 (_ BitVec 32)) SeekEntryResult!10744)

(assert (=> b!1406214 (= e!795927 (= (seekEntryOrOpen!0 (select (arr!46407 a!2901) j!112) a!2901 mask!2840) (Found!10744 j!112)))))

(assert (= (and start!120858 res!944479) b!1406208))

(assert (= (and b!1406208 res!944481) b!1406212))

(assert (= (and b!1406212 res!944482) b!1406207))

(assert (= (and b!1406207 res!944478) b!1406211))

(assert (= (and b!1406211 res!944477) b!1406209))

(assert (= (and b!1406209 res!944476) b!1406213))

(assert (= (and b!1406213 res!944475) b!1406214))

(assert (= (and b!1406213 (not res!944480)) b!1406210))

(declare-fun m!1294833 () Bool)

(assert (=> b!1406214 m!1294833))

(assert (=> b!1406214 m!1294833))

(declare-fun m!1294835 () Bool)

(assert (=> b!1406214 m!1294835))

(assert (=> b!1406207 m!1294833))

(assert (=> b!1406207 m!1294833))

(declare-fun m!1294837 () Bool)

(assert (=> b!1406207 m!1294837))

(assert (=> b!1406213 m!1294833))

(declare-fun m!1294839 () Bool)

(assert (=> b!1406213 m!1294839))

(assert (=> b!1406213 m!1294833))

(declare-fun m!1294841 () Bool)

(assert (=> b!1406213 m!1294841))

(assert (=> b!1406213 m!1294839))

(assert (=> b!1406213 m!1294833))

(declare-fun m!1294843 () Bool)

(assert (=> b!1406213 m!1294843))

(declare-fun m!1294845 () Bool)

(assert (=> b!1406213 m!1294845))

(declare-fun m!1294847 () Bool)

(assert (=> start!120858 m!1294847))

(declare-fun m!1294849 () Bool)

(assert (=> start!120858 m!1294849))

(declare-fun m!1294851 () Bool)

(assert (=> b!1406212 m!1294851))

(assert (=> b!1406212 m!1294851))

(declare-fun m!1294853 () Bool)

(assert (=> b!1406212 m!1294853))

(declare-fun m!1294855 () Bool)

(assert (=> b!1406210 m!1294855))

(declare-fun m!1294857 () Bool)

(assert (=> b!1406210 m!1294857))

(assert (=> b!1406210 m!1294857))

(declare-fun m!1294859 () Bool)

(assert (=> b!1406210 m!1294859))

(assert (=> b!1406210 m!1294859))

(assert (=> b!1406210 m!1294857))

(declare-fun m!1294861 () Bool)

(assert (=> b!1406210 m!1294861))

(declare-fun m!1294863 () Bool)

(assert (=> b!1406209 m!1294863))

(declare-fun m!1294865 () Bool)

(assert (=> b!1406211 m!1294865))

(push 1)

(assert (not b!1406207))

(assert (not start!120858))

(assert (not b!1406214))

(assert (not b!1406210))

(assert (not b!1406213))

(assert (not b!1406212))

(assert (not b!1406211))

(assert (not b!1406209))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

