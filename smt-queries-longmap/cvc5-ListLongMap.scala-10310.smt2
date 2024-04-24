; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121374 () Bool)

(assert start!121374)

(declare-fun b!1410218 () Bool)

(declare-fun res!947258 () Bool)

(declare-fun e!798152 () Bool)

(assert (=> b!1410218 (=> (not res!947258) (not e!798152))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96450 0))(
  ( (array!96451 (arr!46566 (Array (_ BitVec 32) (_ BitVec 64))) (size!47117 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96450)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410218 (= res!947258 (and (= (size!47117 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47117 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47117 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410219 () Bool)

(declare-fun res!947262 () Bool)

(assert (=> b!1410219 (=> (not res!947262) (not e!798152))))

(declare-datatypes ((List!33072 0))(
  ( (Nil!33069) (Cons!33068 (h!34339 (_ BitVec 64)) (t!47758 List!33072)) )
))
(declare-fun arrayNoDuplicates!0 (array!96450 (_ BitVec 32) List!33072) Bool)

(assert (=> b!1410219 (= res!947262 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33069))))

(declare-fun res!947257 () Bool)

(assert (=> start!121374 (=> (not res!947257) (not e!798152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121374 (= res!947257 (validMask!0 mask!2840))))

(assert (=> start!121374 e!798152))

(assert (=> start!121374 true))

(declare-fun array_inv!35847 (array!96450) Bool)

(assert (=> start!121374 (array_inv!35847 a!2901)))

(declare-fun b!1410220 () Bool)

(declare-fun res!947260 () Bool)

(assert (=> b!1410220 (=> (not res!947260) (not e!798152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96450 (_ BitVec 32)) Bool)

(assert (=> b!1410220 (= res!947260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410221 () Bool)

(declare-fun res!947256 () Bool)

(assert (=> b!1410221 (=> (not res!947256) (not e!798152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410221 (= res!947256 (validKeyInArray!0 (select (arr!46566 a!2901) j!112)))))

(declare-fun b!1410222 () Bool)

(declare-fun res!947259 () Bool)

(assert (=> b!1410222 (=> (not res!947259) (not e!798152))))

(assert (=> b!1410222 (= res!947259 (validKeyInArray!0 (select (arr!46566 a!2901) i!1037)))))

(declare-fun e!798153 () Bool)

(declare-fun b!1410223 () Bool)

(declare-datatypes ((SeekEntryResult!10780 0))(
  ( (MissingZero!10780 (index!45497 (_ BitVec 32))) (Found!10780 (index!45498 (_ BitVec 32))) (Intermediate!10780 (undefined!11592 Bool) (index!45499 (_ BitVec 32)) (x!127240 (_ BitVec 32))) (Undefined!10780) (MissingVacant!10780 (index!45500 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96450 (_ BitVec 32)) SeekEntryResult!10780)

(assert (=> b!1410223 (= e!798153 (= (seekEntryOrOpen!0 (select (arr!46566 a!2901) j!112) a!2901 mask!2840) (Found!10780 j!112)))))

(declare-fun b!1410224 () Bool)

(declare-fun e!798154 () Bool)

(assert (=> b!1410224 (= e!798154 true)))

(declare-fun lt!620986 () SeekEntryResult!10780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96450 (_ BitVec 32)) SeekEntryResult!10780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410224 (= lt!620986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46566 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46566 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96451 (store (arr!46566 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47117 a!2901)) mask!2840))))

(declare-fun b!1410225 () Bool)

(assert (=> b!1410225 (= e!798152 (not e!798154))))

(declare-fun res!947263 () Bool)

(assert (=> b!1410225 (=> res!947263 e!798154)))

(declare-fun lt!620987 () SeekEntryResult!10780)

(assert (=> b!1410225 (= res!947263 (or (not (is-Intermediate!10780 lt!620987)) (undefined!11592 lt!620987)))))

(assert (=> b!1410225 e!798153))

(declare-fun res!947261 () Bool)

(assert (=> b!1410225 (=> (not res!947261) (not e!798153))))

(assert (=> b!1410225 (= res!947261 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47561 0))(
  ( (Unit!47562) )
))
(declare-fun lt!620985 () Unit!47561)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47561)

(assert (=> b!1410225 (= lt!620985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410225 (= lt!620987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46566 a!2901) j!112) mask!2840) (select (arr!46566 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121374 res!947257) b!1410218))

(assert (= (and b!1410218 res!947258) b!1410222))

(assert (= (and b!1410222 res!947259) b!1410221))

(assert (= (and b!1410221 res!947256) b!1410220))

(assert (= (and b!1410220 res!947260) b!1410219))

(assert (= (and b!1410219 res!947262) b!1410225))

(assert (= (and b!1410225 res!947261) b!1410223))

(assert (= (and b!1410225 (not res!947263)) b!1410224))

(declare-fun m!1300017 () Bool)

(assert (=> b!1410219 m!1300017))

(declare-fun m!1300019 () Bool)

(assert (=> b!1410220 m!1300019))

(declare-fun m!1300021 () Bool)

(assert (=> start!121374 m!1300021))

(declare-fun m!1300023 () Bool)

(assert (=> start!121374 m!1300023))

(declare-fun m!1300025 () Bool)

(assert (=> b!1410221 m!1300025))

(assert (=> b!1410221 m!1300025))

(declare-fun m!1300027 () Bool)

(assert (=> b!1410221 m!1300027))

(assert (=> b!1410223 m!1300025))

(assert (=> b!1410223 m!1300025))

(declare-fun m!1300029 () Bool)

(assert (=> b!1410223 m!1300029))

(assert (=> b!1410225 m!1300025))

(declare-fun m!1300031 () Bool)

(assert (=> b!1410225 m!1300031))

(assert (=> b!1410225 m!1300025))

(declare-fun m!1300033 () Bool)

(assert (=> b!1410225 m!1300033))

(assert (=> b!1410225 m!1300031))

(assert (=> b!1410225 m!1300025))

(declare-fun m!1300035 () Bool)

(assert (=> b!1410225 m!1300035))

(declare-fun m!1300037 () Bool)

(assert (=> b!1410225 m!1300037))

(declare-fun m!1300039 () Bool)

(assert (=> b!1410224 m!1300039))

(declare-fun m!1300041 () Bool)

(assert (=> b!1410224 m!1300041))

(assert (=> b!1410224 m!1300041))

(declare-fun m!1300043 () Bool)

(assert (=> b!1410224 m!1300043))

(assert (=> b!1410224 m!1300043))

(assert (=> b!1410224 m!1300041))

(declare-fun m!1300045 () Bool)

(assert (=> b!1410224 m!1300045))

(declare-fun m!1300047 () Bool)

(assert (=> b!1410222 m!1300047))

(assert (=> b!1410222 m!1300047))

(declare-fun m!1300049 () Bool)

(assert (=> b!1410222 m!1300049))

(push 1)

(assert (not b!1410223))

(assert (not b!1410221))

(assert (not b!1410224))

(assert (not b!1410219))

(assert (not b!1410222))

(assert (not b!1410220))

(assert (not start!121374))

(assert (not b!1410225))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

