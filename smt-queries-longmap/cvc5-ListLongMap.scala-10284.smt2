; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121056 () Bool)

(assert start!121056)

(declare-fun b!1407500 () Bool)

(declare-fun res!945038 () Bool)

(declare-fun e!796742 () Bool)

(assert (=> b!1407500 (=> (not res!945038) (not e!796742))))

(declare-datatypes ((array!96285 0))(
  ( (array!96286 (arr!46488 (Array (_ BitVec 32) (_ BitVec 64))) (size!47039 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96285)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407500 (= res!945038 (validKeyInArray!0 (select (arr!46488 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!796739 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1407501 () Bool)

(declare-datatypes ((SeekEntryResult!10702 0))(
  ( (MissingZero!10702 (index!45185 (_ BitVec 32))) (Found!10702 (index!45186 (_ BitVec 32))) (Intermediate!10702 (undefined!11514 Bool) (index!45187 (_ BitVec 32)) (x!126936 (_ BitVec 32))) (Undefined!10702) (MissingVacant!10702 (index!45188 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96285 (_ BitVec 32)) SeekEntryResult!10702)

(assert (=> b!1407501 (= e!796739 (= (seekEntryOrOpen!0 (select (arr!46488 a!2901) j!112) a!2901 mask!2840) (Found!10702 j!112)))))

(declare-fun b!1407502 () Bool)

(declare-fun res!945039 () Bool)

(assert (=> b!1407502 (=> (not res!945039) (not e!796742))))

(assert (=> b!1407502 (= res!945039 (and (= (size!47039 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47039 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47039 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407503 () Bool)

(declare-fun e!796740 () Bool)

(assert (=> b!1407503 (= e!796742 (not e!796740))))

(declare-fun res!945034 () Bool)

(assert (=> b!1407503 (=> res!945034 e!796740)))

(declare-fun lt!619752 () SeekEntryResult!10702)

(assert (=> b!1407503 (= res!945034 (or (not (is-Intermediate!10702 lt!619752)) (undefined!11514 lt!619752)))))

(assert (=> b!1407503 e!796739))

(declare-fun res!945040 () Bool)

(assert (=> b!1407503 (=> (not res!945040) (not e!796739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96285 (_ BitVec 32)) Bool)

(assert (=> b!1407503 (= res!945040 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47405 0))(
  ( (Unit!47406) )
))
(declare-fun lt!619753 () Unit!47405)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47405)

(assert (=> b!1407503 (= lt!619753 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96285 (_ BitVec 32)) SeekEntryResult!10702)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407503 (= lt!619752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46488 a!2901) j!112) mask!2840) (select (arr!46488 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407504 () Bool)

(declare-fun res!945033 () Bool)

(assert (=> b!1407504 (=> (not res!945033) (not e!796742))))

(declare-datatypes ((List!32994 0))(
  ( (Nil!32991) (Cons!32990 (h!34252 (_ BitVec 64)) (t!47680 List!32994)) )
))
(declare-fun arrayNoDuplicates!0 (array!96285 (_ BitVec 32) List!32994) Bool)

(assert (=> b!1407504 (= res!945033 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32991))))

(declare-fun b!1407505 () Bool)

(declare-fun res!945036 () Bool)

(assert (=> b!1407505 (=> (not res!945036) (not e!796742))))

(assert (=> b!1407505 (= res!945036 (validKeyInArray!0 (select (arr!46488 a!2901) j!112)))))

(declare-fun b!1407507 () Bool)

(assert (=> b!1407507 (= e!796740 true)))

(declare-fun lt!619754 () SeekEntryResult!10702)

(assert (=> b!1407507 (= lt!619754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96286 (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47039 a!2901)) mask!2840))))

(declare-fun b!1407506 () Bool)

(declare-fun res!945035 () Bool)

(assert (=> b!1407506 (=> (not res!945035) (not e!796742))))

(assert (=> b!1407506 (= res!945035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!945037 () Bool)

(assert (=> start!121056 (=> (not res!945037) (not e!796742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121056 (= res!945037 (validMask!0 mask!2840))))

(assert (=> start!121056 e!796742))

(assert (=> start!121056 true))

(declare-fun array_inv!35769 (array!96285) Bool)

(assert (=> start!121056 (array_inv!35769 a!2901)))

(assert (= (and start!121056 res!945037) b!1407502))

(assert (= (and b!1407502 res!945039) b!1407500))

(assert (= (and b!1407500 res!945038) b!1407505))

(assert (= (and b!1407505 res!945036) b!1407506))

(assert (= (and b!1407506 res!945035) b!1407504))

(assert (= (and b!1407504 res!945033) b!1407503))

(assert (= (and b!1407503 res!945040) b!1407501))

(assert (= (and b!1407503 (not res!945034)) b!1407507))

(declare-fun m!1296843 () Bool)

(assert (=> start!121056 m!1296843))

(declare-fun m!1296845 () Bool)

(assert (=> start!121056 m!1296845))

(declare-fun m!1296847 () Bool)

(assert (=> b!1407507 m!1296847))

(declare-fun m!1296849 () Bool)

(assert (=> b!1407507 m!1296849))

(assert (=> b!1407507 m!1296849))

(declare-fun m!1296851 () Bool)

(assert (=> b!1407507 m!1296851))

(assert (=> b!1407507 m!1296851))

(assert (=> b!1407507 m!1296849))

(declare-fun m!1296853 () Bool)

(assert (=> b!1407507 m!1296853))

(declare-fun m!1296855 () Bool)

(assert (=> b!1407505 m!1296855))

(assert (=> b!1407505 m!1296855))

(declare-fun m!1296857 () Bool)

(assert (=> b!1407505 m!1296857))

(declare-fun m!1296859 () Bool)

(assert (=> b!1407506 m!1296859))

(declare-fun m!1296861 () Bool)

(assert (=> b!1407504 m!1296861))

(assert (=> b!1407503 m!1296855))

(declare-fun m!1296863 () Bool)

(assert (=> b!1407503 m!1296863))

(assert (=> b!1407503 m!1296855))

(declare-fun m!1296865 () Bool)

(assert (=> b!1407503 m!1296865))

(assert (=> b!1407503 m!1296863))

(assert (=> b!1407503 m!1296855))

(declare-fun m!1296867 () Bool)

(assert (=> b!1407503 m!1296867))

(declare-fun m!1296869 () Bool)

(assert (=> b!1407503 m!1296869))

(declare-fun m!1296871 () Bool)

(assert (=> b!1407500 m!1296871))

(assert (=> b!1407500 m!1296871))

(declare-fun m!1296873 () Bool)

(assert (=> b!1407500 m!1296873))

(assert (=> b!1407501 m!1296855))

(assert (=> b!1407501 m!1296855))

(declare-fun m!1296875 () Bool)

(assert (=> b!1407501 m!1296875))

(push 1)

(assert (not start!121056))

(assert (not b!1407503))

(assert (not b!1407505))

(assert (not b!1407504))

(assert (not b!1407506))

(assert (not b!1407501))

(assert (not b!1407500))

(assert (not b!1407507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

