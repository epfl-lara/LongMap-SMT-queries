; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121014 () Bool)

(assert start!121014)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96243 0))(
  ( (array!96244 (arr!46467 (Array (_ BitVec 32) (_ BitVec 64))) (size!47018 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96243)

(declare-fun e!796488 () Bool)

(declare-fun b!1406996 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10681 0))(
  ( (MissingZero!10681 (index!45101 (_ BitVec 32))) (Found!10681 (index!45102 (_ BitVec 32))) (Intermediate!10681 (undefined!11493 Bool) (index!45103 (_ BitVec 32)) (x!126859 (_ BitVec 32))) (Undefined!10681) (MissingVacant!10681 (index!45104 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96243 (_ BitVec 32)) SeekEntryResult!10681)

(assert (=> b!1406996 (= e!796488 (= (seekEntryOrOpen!0 (select (arr!46467 a!2901) j!112) a!2901 mask!2840) (Found!10681 j!112)))))

(declare-fun b!1406997 () Bool)

(declare-fun res!944531 () Bool)

(declare-fun e!796489 () Bool)

(assert (=> b!1406997 (=> (not res!944531) (not e!796489))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406997 (= res!944531 (and (= (size!47018 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47018 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47018 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944532 () Bool)

(assert (=> start!121014 (=> (not res!944532) (not e!796489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121014 (= res!944532 (validMask!0 mask!2840))))

(assert (=> start!121014 e!796489))

(assert (=> start!121014 true))

(declare-fun array_inv!35748 (array!96243) Bool)

(assert (=> start!121014 (array_inv!35748 a!2901)))

(declare-fun b!1406998 () Bool)

(declare-fun res!944536 () Bool)

(assert (=> b!1406998 (=> (not res!944536) (not e!796489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406998 (= res!944536 (validKeyInArray!0 (select (arr!46467 a!2901) j!112)))))

(declare-fun b!1406999 () Bool)

(declare-fun res!944533 () Bool)

(assert (=> b!1406999 (=> (not res!944533) (not e!796489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96243 (_ BitVec 32)) Bool)

(assert (=> b!1406999 (= res!944533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407000 () Bool)

(declare-fun res!944535 () Bool)

(assert (=> b!1407000 (=> (not res!944535) (not e!796489))))

(declare-datatypes ((List!32973 0))(
  ( (Nil!32970) (Cons!32969 (h!34231 (_ BitVec 64)) (t!47659 List!32973)) )
))
(declare-fun arrayNoDuplicates!0 (array!96243 (_ BitVec 32) List!32973) Bool)

(assert (=> b!1407000 (= res!944535 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32970))))

(declare-fun b!1407001 () Bool)

(declare-fun res!944529 () Bool)

(assert (=> b!1407001 (=> (not res!944529) (not e!796489))))

(assert (=> b!1407001 (= res!944529 (validKeyInArray!0 (select (arr!46467 a!2901) i!1037)))))

(declare-fun b!1407002 () Bool)

(declare-fun e!796490 () Bool)

(assert (=> b!1407002 (= e!796490 true)))

(declare-fun lt!619565 () SeekEntryResult!10681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96243 (_ BitVec 32)) SeekEntryResult!10681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407002 (= lt!619565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96244 (store (arr!46467 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47018 a!2901)) mask!2840))))

(declare-fun b!1407003 () Bool)

(assert (=> b!1407003 (= e!796489 (not e!796490))))

(declare-fun res!944534 () Bool)

(assert (=> b!1407003 (=> res!944534 e!796490)))

(declare-fun lt!619564 () SeekEntryResult!10681)

(assert (=> b!1407003 (= res!944534 (or (not (is-Intermediate!10681 lt!619564)) (undefined!11493 lt!619564)))))

(assert (=> b!1407003 e!796488))

(declare-fun res!944530 () Bool)

(assert (=> b!1407003 (=> (not res!944530) (not e!796488))))

(assert (=> b!1407003 (= res!944530 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47363 0))(
  ( (Unit!47364) )
))
(declare-fun lt!619563 () Unit!47363)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47363)

(assert (=> b!1407003 (= lt!619563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407003 (= lt!619564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46467 a!2901) j!112) mask!2840) (select (arr!46467 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121014 res!944532) b!1406997))

(assert (= (and b!1406997 res!944531) b!1407001))

(assert (= (and b!1407001 res!944529) b!1406998))

(assert (= (and b!1406998 res!944536) b!1406999))

(assert (= (and b!1406999 res!944533) b!1407000))

(assert (= (and b!1407000 res!944535) b!1407003))

(assert (= (and b!1407003 res!944530) b!1406996))

(assert (= (and b!1407003 (not res!944534)) b!1407002))

(declare-fun m!1296129 () Bool)

(assert (=> b!1406998 m!1296129))

(assert (=> b!1406998 m!1296129))

(declare-fun m!1296131 () Bool)

(assert (=> b!1406998 m!1296131))

(declare-fun m!1296133 () Bool)

(assert (=> b!1407001 m!1296133))

(assert (=> b!1407001 m!1296133))

(declare-fun m!1296135 () Bool)

(assert (=> b!1407001 m!1296135))

(declare-fun m!1296137 () Bool)

(assert (=> b!1407002 m!1296137))

(declare-fun m!1296139 () Bool)

(assert (=> b!1407002 m!1296139))

(assert (=> b!1407002 m!1296139))

(declare-fun m!1296141 () Bool)

(assert (=> b!1407002 m!1296141))

(assert (=> b!1407002 m!1296141))

(assert (=> b!1407002 m!1296139))

(declare-fun m!1296143 () Bool)

(assert (=> b!1407002 m!1296143))

(declare-fun m!1296145 () Bool)

(assert (=> b!1406999 m!1296145))

(declare-fun m!1296147 () Bool)

(assert (=> start!121014 m!1296147))

(declare-fun m!1296149 () Bool)

(assert (=> start!121014 m!1296149))

(assert (=> b!1406996 m!1296129))

(assert (=> b!1406996 m!1296129))

(declare-fun m!1296151 () Bool)

(assert (=> b!1406996 m!1296151))

(declare-fun m!1296153 () Bool)

(assert (=> b!1407000 m!1296153))

(assert (=> b!1407003 m!1296129))

(declare-fun m!1296155 () Bool)

(assert (=> b!1407003 m!1296155))

(assert (=> b!1407003 m!1296129))

(declare-fun m!1296157 () Bool)

(assert (=> b!1407003 m!1296157))

(assert (=> b!1407003 m!1296155))

(assert (=> b!1407003 m!1296129))

(declare-fun m!1296159 () Bool)

(assert (=> b!1407003 m!1296159))

(declare-fun m!1296161 () Bool)

(assert (=> b!1407003 m!1296161))

(push 1)

(assert (not b!1406996))

(assert (not b!1406999))

(assert (not start!121014))

(assert (not b!1407001))

(assert (not b!1407003))

(assert (not b!1406998))

(assert (not b!1407000))

(assert (not b!1407002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

