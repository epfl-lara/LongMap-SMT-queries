; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121216 () Bool)

(assert start!121216)

(declare-fun res!947164 () Bool)

(declare-fun e!797595 () Bool)

(assert (=> start!121216 (=> (not res!947164) (not e!797595))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121216 (= res!947164 (validMask!0 mask!2840))))

(assert (=> start!121216 e!797595))

(assert (=> start!121216 true))

(declare-datatypes ((array!96370 0))(
  ( (array!96371 (arr!46528 (Array (_ BitVec 32) (_ BitVec 64))) (size!47078 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96370)

(declare-fun array_inv!35556 (array!96370) Bool)

(assert (=> start!121216 (array_inv!35556 a!2901)))

(declare-fun b!1409438 () Bool)

(declare-fun res!947160 () Bool)

(assert (=> b!1409438 (=> (not res!947160) (not e!797595))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409438 (= res!947160 (validKeyInArray!0 (select (arr!46528 a!2901) j!112)))))

(declare-fun b!1409439 () Bool)

(declare-fun res!947161 () Bool)

(assert (=> b!1409439 (=> (not res!947161) (not e!797595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96370 (_ BitVec 32)) Bool)

(assert (=> b!1409439 (= res!947161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409440 () Bool)

(declare-fun res!947166 () Bool)

(assert (=> b!1409440 (=> (not res!947166) (not e!797595))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409440 (= res!947166 (validKeyInArray!0 (select (arr!46528 a!2901) i!1037)))))

(declare-fun b!1409441 () Bool)

(declare-fun e!797596 () Bool)

(assert (=> b!1409441 (= e!797596 true)))

(declare-datatypes ((SeekEntryResult!10839 0))(
  ( (MissingZero!10839 (index!45733 (_ BitVec 32))) (Found!10839 (index!45734 (_ BitVec 32))) (Intermediate!10839 (undefined!11651 Bool) (index!45735 (_ BitVec 32)) (x!127320 (_ BitVec 32))) (Undefined!10839) (MissingVacant!10839 (index!45736 (_ BitVec 32))) )
))
(declare-fun lt!620723 () SeekEntryResult!10839)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96370 (_ BitVec 32)) SeekEntryResult!10839)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409441 (= lt!620723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46528 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46528 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96371 (store (arr!46528 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47078 a!2901)) mask!2840))))

(declare-fun b!1409442 () Bool)

(assert (=> b!1409442 (= e!797595 (not e!797596))))

(declare-fun res!947162 () Bool)

(assert (=> b!1409442 (=> res!947162 e!797596)))

(declare-fun lt!620722 () SeekEntryResult!10839)

(assert (=> b!1409442 (= res!947162 (or (not (is-Intermediate!10839 lt!620722)) (undefined!11651 lt!620722)))))

(declare-fun e!797594 () Bool)

(assert (=> b!1409442 e!797594))

(declare-fun res!947163 () Bool)

(assert (=> b!1409442 (=> (not res!947163) (not e!797594))))

(assert (=> b!1409442 (= res!947163 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47652 0))(
  ( (Unit!47653) )
))
(declare-fun lt!620724 () Unit!47652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47652)

(assert (=> b!1409442 (= lt!620724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409442 (= lt!620722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46528 a!2901) j!112) mask!2840) (select (arr!46528 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409443 () Bool)

(declare-fun res!947165 () Bool)

(assert (=> b!1409443 (=> (not res!947165) (not e!797595))))

(declare-datatypes ((List!33047 0))(
  ( (Nil!33044) (Cons!33043 (h!34306 (_ BitVec 64)) (t!47741 List!33047)) )
))
(declare-fun arrayNoDuplicates!0 (array!96370 (_ BitVec 32) List!33047) Bool)

(assert (=> b!1409443 (= res!947165 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33044))))

(declare-fun b!1409444 () Bool)

(declare-fun res!947167 () Bool)

(assert (=> b!1409444 (=> (not res!947167) (not e!797595))))

(assert (=> b!1409444 (= res!947167 (and (= (size!47078 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47078 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47078 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409445 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96370 (_ BitVec 32)) SeekEntryResult!10839)

(assert (=> b!1409445 (= e!797594 (= (seekEntryOrOpen!0 (select (arr!46528 a!2901) j!112) a!2901 mask!2840) (Found!10839 j!112)))))

(assert (= (and start!121216 res!947164) b!1409444))

(assert (= (and b!1409444 res!947167) b!1409440))

(assert (= (and b!1409440 res!947166) b!1409438))

(assert (= (and b!1409438 res!947160) b!1409439))

(assert (= (and b!1409439 res!947161) b!1409443))

(assert (= (and b!1409443 res!947165) b!1409442))

(assert (= (and b!1409442 res!947163) b!1409445))

(assert (= (and b!1409442 (not res!947162)) b!1409441))

(declare-fun m!1299155 () Bool)

(assert (=> b!1409443 m!1299155))

(declare-fun m!1299157 () Bool)

(assert (=> b!1409445 m!1299157))

(assert (=> b!1409445 m!1299157))

(declare-fun m!1299159 () Bool)

(assert (=> b!1409445 m!1299159))

(declare-fun m!1299161 () Bool)

(assert (=> b!1409440 m!1299161))

(assert (=> b!1409440 m!1299161))

(declare-fun m!1299163 () Bool)

(assert (=> b!1409440 m!1299163))

(declare-fun m!1299165 () Bool)

(assert (=> start!121216 m!1299165))

(declare-fun m!1299167 () Bool)

(assert (=> start!121216 m!1299167))

(declare-fun m!1299169 () Bool)

(assert (=> b!1409441 m!1299169))

(declare-fun m!1299171 () Bool)

(assert (=> b!1409441 m!1299171))

(assert (=> b!1409441 m!1299171))

(declare-fun m!1299173 () Bool)

(assert (=> b!1409441 m!1299173))

(assert (=> b!1409441 m!1299173))

(assert (=> b!1409441 m!1299171))

(declare-fun m!1299175 () Bool)

(assert (=> b!1409441 m!1299175))

(declare-fun m!1299177 () Bool)

(assert (=> b!1409439 m!1299177))

(assert (=> b!1409442 m!1299157))

(declare-fun m!1299179 () Bool)

(assert (=> b!1409442 m!1299179))

(assert (=> b!1409442 m!1299157))

(declare-fun m!1299181 () Bool)

(assert (=> b!1409442 m!1299181))

(assert (=> b!1409442 m!1299179))

(assert (=> b!1409442 m!1299157))

(declare-fun m!1299183 () Bool)

(assert (=> b!1409442 m!1299183))

(declare-fun m!1299185 () Bool)

(assert (=> b!1409442 m!1299185))

(assert (=> b!1409438 m!1299157))

(assert (=> b!1409438 m!1299157))

(declare-fun m!1299187 () Bool)

(assert (=> b!1409438 m!1299187))

(push 1)

(assert (not b!1409440))

(assert (not b!1409439))

(assert (not b!1409442))

(assert (not b!1409445))

(assert (not b!1409443))

(assert (not b!1409438))

(assert (not b!1409441))

(assert (not start!121216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

