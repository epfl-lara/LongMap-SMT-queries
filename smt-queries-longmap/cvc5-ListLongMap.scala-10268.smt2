; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120768 () Bool)

(assert start!120768)

(declare-fun b!1405221 () Bool)

(declare-fun res!943443 () Bool)

(declare-fun e!795463 () Bool)

(assert (=> b!1405221 (=> (not res!943443) (not e!795463))))

(declare-datatypes ((array!96075 0))(
  ( (array!96076 (arr!46385 (Array (_ BitVec 32) (_ BitVec 64))) (size!46935 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96075)

(declare-datatypes ((List!32904 0))(
  ( (Nil!32901) (Cons!32900 (h!34154 (_ BitVec 64)) (t!47598 List!32904)) )
))
(declare-fun arrayNoDuplicates!0 (array!96075 (_ BitVec 32) List!32904) Bool)

(assert (=> b!1405221 (= res!943443 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32901))))

(declare-fun res!943444 () Bool)

(assert (=> start!120768 (=> (not res!943444) (not e!795463))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120768 (= res!943444 (validMask!0 mask!2840))))

(assert (=> start!120768 e!795463))

(assert (=> start!120768 true))

(declare-fun array_inv!35413 (array!96075) Bool)

(assert (=> start!120768 (array_inv!35413 a!2901)))

(declare-fun b!1405222 () Bool)

(declare-fun res!943438 () Bool)

(assert (=> b!1405222 (=> (not res!943438) (not e!795463))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405222 (= res!943438 (and (= (size!46935 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46935 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46935 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405223 () Bool)

(assert (=> b!1405223 (= e!795463 (not true))))

(declare-fun e!795462 () Bool)

(assert (=> b!1405223 e!795462))

(declare-fun res!943441 () Bool)

(assert (=> b!1405223 (=> (not res!943441) (not e!795462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96075 (_ BitVec 32)) Bool)

(assert (=> b!1405223 (= res!943441 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47366 0))(
  ( (Unit!47367) )
))
(declare-fun lt!618966 () Unit!47366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47366)

(assert (=> b!1405223 (= lt!618966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10696 0))(
  ( (MissingZero!10696 (index!45161 (_ BitVec 32))) (Found!10696 (index!45162 (_ BitVec 32))) (Intermediate!10696 (undefined!11508 Bool) (index!45163 (_ BitVec 32)) (x!126783 (_ BitVec 32))) (Undefined!10696) (MissingVacant!10696 (index!45164 (_ BitVec 32))) )
))
(declare-fun lt!618965 () SeekEntryResult!10696)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96075 (_ BitVec 32)) SeekEntryResult!10696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405223 (= lt!618965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46385 a!2901) j!112) mask!2840) (select (arr!46385 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405224 () Bool)

(declare-fun res!943442 () Bool)

(assert (=> b!1405224 (=> (not res!943442) (not e!795463))))

(assert (=> b!1405224 (= res!943442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405225 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96075 (_ BitVec 32)) SeekEntryResult!10696)

(assert (=> b!1405225 (= e!795462 (= (seekEntryOrOpen!0 (select (arr!46385 a!2901) j!112) a!2901 mask!2840) (Found!10696 j!112)))))

(declare-fun b!1405226 () Bool)

(declare-fun res!943440 () Bool)

(assert (=> b!1405226 (=> (not res!943440) (not e!795463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405226 (= res!943440 (validKeyInArray!0 (select (arr!46385 a!2901) j!112)))))

(declare-fun b!1405227 () Bool)

(declare-fun res!943439 () Bool)

(assert (=> b!1405227 (=> (not res!943439) (not e!795463))))

(assert (=> b!1405227 (= res!943439 (validKeyInArray!0 (select (arr!46385 a!2901) i!1037)))))

(assert (= (and start!120768 res!943444) b!1405222))

(assert (= (and b!1405222 res!943438) b!1405227))

(assert (= (and b!1405227 res!943439) b!1405226))

(assert (= (and b!1405226 res!943440) b!1405224))

(assert (= (and b!1405224 res!943442) b!1405221))

(assert (= (and b!1405221 res!943443) b!1405223))

(assert (= (and b!1405223 res!943441) b!1405225))

(declare-fun m!1293951 () Bool)

(assert (=> b!1405227 m!1293951))

(assert (=> b!1405227 m!1293951))

(declare-fun m!1293953 () Bool)

(assert (=> b!1405227 m!1293953))

(declare-fun m!1293955 () Bool)

(assert (=> b!1405226 m!1293955))

(assert (=> b!1405226 m!1293955))

(declare-fun m!1293957 () Bool)

(assert (=> b!1405226 m!1293957))

(assert (=> b!1405225 m!1293955))

(assert (=> b!1405225 m!1293955))

(declare-fun m!1293959 () Bool)

(assert (=> b!1405225 m!1293959))

(declare-fun m!1293961 () Bool)

(assert (=> b!1405221 m!1293961))

(assert (=> b!1405223 m!1293955))

(declare-fun m!1293963 () Bool)

(assert (=> b!1405223 m!1293963))

(assert (=> b!1405223 m!1293955))

(declare-fun m!1293965 () Bool)

(assert (=> b!1405223 m!1293965))

(assert (=> b!1405223 m!1293963))

(assert (=> b!1405223 m!1293955))

(declare-fun m!1293967 () Bool)

(assert (=> b!1405223 m!1293967))

(declare-fun m!1293969 () Bool)

(assert (=> b!1405223 m!1293969))

(declare-fun m!1293971 () Bool)

(assert (=> b!1405224 m!1293971))

(declare-fun m!1293973 () Bool)

(assert (=> start!120768 m!1293973))

(declare-fun m!1293975 () Bool)

(assert (=> start!120768 m!1293975))

(push 1)

(assert (not b!1405221))

(assert (not b!1405227))

(assert (not b!1405224))

(assert (not b!1405223))

(assert (not start!120768))

(assert (not b!1405225))

(assert (not b!1405226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

