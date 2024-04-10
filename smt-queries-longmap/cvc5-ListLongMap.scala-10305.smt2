; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121152 () Bool)

(assert start!121152)

(declare-fun b!1408670 () Bool)

(declare-fun res!946393 () Bool)

(declare-fun e!797212 () Bool)

(assert (=> b!1408670 (=> (not res!946393) (not e!797212))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96306 0))(
  ( (array!96307 (arr!46496 (Array (_ BitVec 32) (_ BitVec 64))) (size!47046 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96306)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408670 (= res!946393 (and (= (size!47046 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47046 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47046 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408671 () Bool)

(declare-fun res!946397 () Bool)

(assert (=> b!1408671 (=> (not res!946397) (not e!797212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408671 (= res!946397 (validKeyInArray!0 (select (arr!46496 a!2901) j!112)))))

(declare-fun b!1408672 () Bool)

(declare-fun res!946396 () Bool)

(assert (=> b!1408672 (=> (not res!946396) (not e!797212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96306 (_ BitVec 32)) Bool)

(assert (=> b!1408672 (= res!946396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408673 () Bool)

(declare-fun e!797210 () Bool)

(assert (=> b!1408673 (= e!797210 true)))

(declare-datatypes ((SeekEntryResult!10807 0))(
  ( (MissingZero!10807 (index!45605 (_ BitVec 32))) (Found!10807 (index!45606 (_ BitVec 32))) (Intermediate!10807 (undefined!11619 Bool) (index!45607 (_ BitVec 32)) (x!127208 (_ BitVec 32))) (Undefined!10807) (MissingVacant!10807 (index!45608 (_ BitVec 32))) )
))
(declare-fun lt!620436 () SeekEntryResult!10807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96306 (_ BitVec 32)) SeekEntryResult!10807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408673 (= lt!620436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46496 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46496 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96307 (store (arr!46496 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47046 a!2901)) mask!2840))))

(declare-fun e!797211 () Bool)

(declare-fun b!1408674 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96306 (_ BitVec 32)) SeekEntryResult!10807)

(assert (=> b!1408674 (= e!797211 (= (seekEntryOrOpen!0 (select (arr!46496 a!2901) j!112) a!2901 mask!2840) (Found!10807 j!112)))))

(declare-fun res!946392 () Bool)

(assert (=> start!121152 (=> (not res!946392) (not e!797212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121152 (= res!946392 (validMask!0 mask!2840))))

(assert (=> start!121152 e!797212))

(assert (=> start!121152 true))

(declare-fun array_inv!35524 (array!96306) Bool)

(assert (=> start!121152 (array_inv!35524 a!2901)))

(declare-fun b!1408675 () Bool)

(assert (=> b!1408675 (= e!797212 (not e!797210))))

(declare-fun res!946398 () Bool)

(assert (=> b!1408675 (=> res!946398 e!797210)))

(declare-fun lt!620435 () SeekEntryResult!10807)

(assert (=> b!1408675 (= res!946398 (or (not (is-Intermediate!10807 lt!620435)) (undefined!11619 lt!620435)))))

(assert (=> b!1408675 e!797211))

(declare-fun res!946395 () Bool)

(assert (=> b!1408675 (=> (not res!946395) (not e!797211))))

(assert (=> b!1408675 (= res!946395 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47588 0))(
  ( (Unit!47589) )
))
(declare-fun lt!620434 () Unit!47588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47588)

(assert (=> b!1408675 (= lt!620434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408675 (= lt!620435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46496 a!2901) j!112) mask!2840) (select (arr!46496 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408676 () Bool)

(declare-fun res!946399 () Bool)

(assert (=> b!1408676 (=> (not res!946399) (not e!797212))))

(assert (=> b!1408676 (= res!946399 (validKeyInArray!0 (select (arr!46496 a!2901) i!1037)))))

(declare-fun b!1408677 () Bool)

(declare-fun res!946394 () Bool)

(assert (=> b!1408677 (=> (not res!946394) (not e!797212))))

(declare-datatypes ((List!33015 0))(
  ( (Nil!33012) (Cons!33011 (h!34274 (_ BitVec 64)) (t!47709 List!33015)) )
))
(declare-fun arrayNoDuplicates!0 (array!96306 (_ BitVec 32) List!33015) Bool)

(assert (=> b!1408677 (= res!946394 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33012))))

(assert (= (and start!121152 res!946392) b!1408670))

(assert (= (and b!1408670 res!946393) b!1408676))

(assert (= (and b!1408676 res!946399) b!1408671))

(assert (= (and b!1408671 res!946397) b!1408672))

(assert (= (and b!1408672 res!946396) b!1408677))

(assert (= (and b!1408677 res!946394) b!1408675))

(assert (= (and b!1408675 res!946395) b!1408674))

(assert (= (and b!1408675 (not res!946398)) b!1408673))

(declare-fun m!1298067 () Bool)

(assert (=> b!1408675 m!1298067))

(declare-fun m!1298069 () Bool)

(assert (=> b!1408675 m!1298069))

(assert (=> b!1408675 m!1298067))

(declare-fun m!1298071 () Bool)

(assert (=> b!1408675 m!1298071))

(assert (=> b!1408675 m!1298069))

(assert (=> b!1408675 m!1298067))

(declare-fun m!1298073 () Bool)

(assert (=> b!1408675 m!1298073))

(declare-fun m!1298075 () Bool)

(assert (=> b!1408675 m!1298075))

(assert (=> b!1408671 m!1298067))

(assert (=> b!1408671 m!1298067))

(declare-fun m!1298077 () Bool)

(assert (=> b!1408671 m!1298077))

(assert (=> b!1408674 m!1298067))

(assert (=> b!1408674 m!1298067))

(declare-fun m!1298079 () Bool)

(assert (=> b!1408674 m!1298079))

(declare-fun m!1298081 () Bool)

(assert (=> b!1408676 m!1298081))

(assert (=> b!1408676 m!1298081))

(declare-fun m!1298083 () Bool)

(assert (=> b!1408676 m!1298083))

(declare-fun m!1298085 () Bool)

(assert (=> b!1408672 m!1298085))

(declare-fun m!1298087 () Bool)

(assert (=> b!1408677 m!1298087))

(declare-fun m!1298089 () Bool)

(assert (=> start!121152 m!1298089))

(declare-fun m!1298091 () Bool)

(assert (=> start!121152 m!1298091))

(declare-fun m!1298093 () Bool)

(assert (=> b!1408673 m!1298093))

(declare-fun m!1298095 () Bool)

(assert (=> b!1408673 m!1298095))

(assert (=> b!1408673 m!1298095))

(declare-fun m!1298097 () Bool)

(assert (=> b!1408673 m!1298097))

(assert (=> b!1408673 m!1298097))

(assert (=> b!1408673 m!1298095))

(declare-fun m!1298099 () Bool)

(assert (=> b!1408673 m!1298099))

(push 1)

(assert (not b!1408677))

(assert (not b!1408672))

(assert (not b!1408675))

(assert (not b!1408674))

(assert (not start!121152))

(assert (not b!1408676))

(assert (not b!1408671))

(assert (not b!1408673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

