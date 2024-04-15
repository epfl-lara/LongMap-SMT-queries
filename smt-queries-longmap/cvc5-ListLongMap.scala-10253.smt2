; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120570 () Bool)

(assert start!120570)

(declare-fun b!1403871 () Bool)

(declare-fun res!942434 () Bool)

(declare-fun e!794831 () Bool)

(assert (=> b!1403871 (=> (not res!942434) (not e!794831))))

(declare-datatypes ((array!95932 0))(
  ( (array!95933 (arr!46317 (Array (_ BitVec 32) (_ BitVec 64))) (size!46869 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95932)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403871 (= res!942434 (validKeyInArray!0 (select (arr!46317 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!794829 () Bool)

(declare-fun b!1403872 () Bool)

(declare-datatypes ((SeekEntryResult!10660 0))(
  ( (MissingZero!10660 (index!45017 (_ BitVec 32))) (Found!10660 (index!45018 (_ BitVec 32))) (Intermediate!10660 (undefined!11472 Bool) (index!45019 (_ BitVec 32)) (x!126612 (_ BitVec 32))) (Undefined!10660) (MissingVacant!10660 (index!45020 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95932 (_ BitVec 32)) SeekEntryResult!10660)

(assert (=> b!1403872 (= e!794829 (= (seekEntryOrOpen!0 (select (arr!46317 a!2901) j!112) a!2901 mask!2840) (Found!10660 j!112)))))

(declare-fun b!1403873 () Bool)

(declare-fun res!942435 () Bool)

(assert (=> b!1403873 (=> (not res!942435) (not e!794831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95932 (_ BitVec 32)) Bool)

(assert (=> b!1403873 (= res!942435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403874 () Bool)

(declare-fun res!942436 () Bool)

(assert (=> b!1403874 (=> (not res!942436) (not e!794831))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403874 (= res!942436 (validKeyInArray!0 (select (arr!46317 a!2901) i!1037)))))

(declare-fun b!1403875 () Bool)

(assert (=> b!1403875 (= e!794831 (not true))))

(assert (=> b!1403875 e!794829))

(declare-fun res!942437 () Bool)

(assert (=> b!1403875 (=> (not res!942437) (not e!794829))))

(assert (=> b!1403875 (= res!942437 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47167 0))(
  ( (Unit!47168) )
))
(declare-fun lt!618364 () Unit!47167)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47167)

(assert (=> b!1403875 (= lt!618364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618365 () SeekEntryResult!10660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95932 (_ BitVec 32)) SeekEntryResult!10660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403875 (= lt!618365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46317 a!2901) j!112) mask!2840) (select (arr!46317 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942433 () Bool)

(assert (=> start!120570 (=> (not res!942433) (not e!794831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120570 (= res!942433 (validMask!0 mask!2840))))

(assert (=> start!120570 e!794831))

(assert (=> start!120570 true))

(declare-fun array_inv!35550 (array!95932) Bool)

(assert (=> start!120570 (array_inv!35550 a!2901)))

(declare-fun b!1403876 () Bool)

(declare-fun res!942438 () Bool)

(assert (=> b!1403876 (=> (not res!942438) (not e!794831))))

(assert (=> b!1403876 (= res!942438 (and (= (size!46869 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46869 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46869 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403877 () Bool)

(declare-fun res!942439 () Bool)

(assert (=> b!1403877 (=> (not res!942439) (not e!794831))))

(declare-datatypes ((List!32914 0))(
  ( (Nil!32911) (Cons!32910 (h!34158 (_ BitVec 64)) (t!47600 List!32914)) )
))
(declare-fun arrayNoDuplicates!0 (array!95932 (_ BitVec 32) List!32914) Bool)

(assert (=> b!1403877 (= res!942439 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32911))))

(assert (= (and start!120570 res!942433) b!1403876))

(assert (= (and b!1403876 res!942438) b!1403874))

(assert (= (and b!1403874 res!942436) b!1403871))

(assert (= (and b!1403871 res!942434) b!1403873))

(assert (= (and b!1403873 res!942435) b!1403877))

(assert (= (and b!1403877 res!942439) b!1403875))

(assert (= (and b!1403875 res!942437) b!1403872))

(declare-fun m!1292195 () Bool)

(assert (=> b!1403872 m!1292195))

(assert (=> b!1403872 m!1292195))

(declare-fun m!1292197 () Bool)

(assert (=> b!1403872 m!1292197))

(declare-fun m!1292199 () Bool)

(assert (=> b!1403873 m!1292199))

(declare-fun m!1292201 () Bool)

(assert (=> b!1403874 m!1292201))

(assert (=> b!1403874 m!1292201))

(declare-fun m!1292203 () Bool)

(assert (=> b!1403874 m!1292203))

(assert (=> b!1403875 m!1292195))

(declare-fun m!1292205 () Bool)

(assert (=> b!1403875 m!1292205))

(assert (=> b!1403875 m!1292195))

(declare-fun m!1292207 () Bool)

(assert (=> b!1403875 m!1292207))

(assert (=> b!1403875 m!1292205))

(assert (=> b!1403875 m!1292195))

(declare-fun m!1292209 () Bool)

(assert (=> b!1403875 m!1292209))

(declare-fun m!1292211 () Bool)

(assert (=> b!1403875 m!1292211))

(assert (=> b!1403871 m!1292195))

(assert (=> b!1403871 m!1292195))

(declare-fun m!1292213 () Bool)

(assert (=> b!1403871 m!1292213))

(declare-fun m!1292215 () Bool)

(assert (=> b!1403877 m!1292215))

(declare-fun m!1292217 () Bool)

(assert (=> start!120570 m!1292217))

(declare-fun m!1292219 () Bool)

(assert (=> start!120570 m!1292219))

(push 1)

(assert (not b!1403873))

(assert (not b!1403872))

(assert (not start!120570))

(assert (not b!1403871))

(assert (not b!1403875))

(assert (not b!1403877))

(assert (not b!1403874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

