; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121032 () Bool)

(assert start!121032)

(declare-fun b!1407212 () Bool)

(declare-fun res!944745 () Bool)

(declare-fun e!796597 () Bool)

(assert (=> b!1407212 (=> (not res!944745) (not e!796597))))

(declare-datatypes ((array!96261 0))(
  ( (array!96262 (arr!46476 (Array (_ BitVec 32) (_ BitVec 64))) (size!47027 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96261)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96261 (_ BitVec 32)) Bool)

(assert (=> b!1407212 (= res!944745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407213 () Bool)

(declare-fun res!944751 () Bool)

(assert (=> b!1407213 (=> (not res!944751) (not e!796597))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407213 (= res!944751 (validKeyInArray!0 (select (arr!46476 a!2901) j!112)))))

(declare-fun b!1407214 () Bool)

(declare-fun res!944750 () Bool)

(assert (=> b!1407214 (=> (not res!944750) (not e!796597))))

(declare-datatypes ((List!32982 0))(
  ( (Nil!32979) (Cons!32978 (h!34240 (_ BitVec 64)) (t!47668 List!32982)) )
))
(declare-fun arrayNoDuplicates!0 (array!96261 (_ BitVec 32) List!32982) Bool)

(assert (=> b!1407214 (= res!944750 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32979))))

(declare-fun b!1407216 () Bool)

(declare-fun res!944747 () Bool)

(assert (=> b!1407216 (=> (not res!944747) (not e!796597))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407216 (= res!944747 (and (= (size!47027 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47027 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47027 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407217 () Bool)

(declare-fun e!796596 () Bool)

(assert (=> b!1407217 (= e!796597 (not e!796596))))

(declare-fun res!944749 () Bool)

(assert (=> b!1407217 (=> res!944749 e!796596)))

(declare-datatypes ((SeekEntryResult!10690 0))(
  ( (MissingZero!10690 (index!45137 (_ BitVec 32))) (Found!10690 (index!45138 (_ BitVec 32))) (Intermediate!10690 (undefined!11502 Bool) (index!45139 (_ BitVec 32)) (x!126892 (_ BitVec 32))) (Undefined!10690) (MissingVacant!10690 (index!45140 (_ BitVec 32))) )
))
(declare-fun lt!619644 () SeekEntryResult!10690)

(assert (=> b!1407217 (= res!944749 (or (not (is-Intermediate!10690 lt!619644)) (undefined!11502 lt!619644)))))

(declare-fun e!796598 () Bool)

(assert (=> b!1407217 e!796598))

(declare-fun res!944748 () Bool)

(assert (=> b!1407217 (=> (not res!944748) (not e!796598))))

(assert (=> b!1407217 (= res!944748 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47381 0))(
  ( (Unit!47382) )
))
(declare-fun lt!619646 () Unit!47381)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47381)

(assert (=> b!1407217 (= lt!619646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96261 (_ BitVec 32)) SeekEntryResult!10690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407217 (= lt!619644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46476 a!2901) j!112) mask!2840) (select (arr!46476 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407218 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96261 (_ BitVec 32)) SeekEntryResult!10690)

(assert (=> b!1407218 (= e!796598 (= (seekEntryOrOpen!0 (select (arr!46476 a!2901) j!112) a!2901 mask!2840) (Found!10690 j!112)))))

(declare-fun b!1407219 () Bool)

(declare-fun res!944746 () Bool)

(assert (=> b!1407219 (=> (not res!944746) (not e!796597))))

(assert (=> b!1407219 (= res!944746 (validKeyInArray!0 (select (arr!46476 a!2901) i!1037)))))

(declare-fun b!1407215 () Bool)

(assert (=> b!1407215 (= e!796596 true)))

(declare-fun lt!619645 () SeekEntryResult!10690)

(assert (=> b!1407215 (= lt!619645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96262 (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47027 a!2901)) mask!2840))))

(declare-fun res!944752 () Bool)

(assert (=> start!121032 (=> (not res!944752) (not e!796597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121032 (= res!944752 (validMask!0 mask!2840))))

(assert (=> start!121032 e!796597))

(assert (=> start!121032 true))

(declare-fun array_inv!35757 (array!96261) Bool)

(assert (=> start!121032 (array_inv!35757 a!2901)))

(assert (= (and start!121032 res!944752) b!1407216))

(assert (= (and b!1407216 res!944747) b!1407219))

(assert (= (and b!1407219 res!944746) b!1407213))

(assert (= (and b!1407213 res!944751) b!1407212))

(assert (= (and b!1407212 res!944745) b!1407214))

(assert (= (and b!1407214 res!944750) b!1407217))

(assert (= (and b!1407217 res!944748) b!1407218))

(assert (= (and b!1407217 (not res!944749)) b!1407215))

(declare-fun m!1296435 () Bool)

(assert (=> start!121032 m!1296435))

(declare-fun m!1296437 () Bool)

(assert (=> start!121032 m!1296437))

(declare-fun m!1296439 () Bool)

(assert (=> b!1407219 m!1296439))

(assert (=> b!1407219 m!1296439))

(declare-fun m!1296441 () Bool)

(assert (=> b!1407219 m!1296441))

(declare-fun m!1296443 () Bool)

(assert (=> b!1407217 m!1296443))

(declare-fun m!1296445 () Bool)

(assert (=> b!1407217 m!1296445))

(assert (=> b!1407217 m!1296443))

(declare-fun m!1296447 () Bool)

(assert (=> b!1407217 m!1296447))

(assert (=> b!1407217 m!1296445))

(assert (=> b!1407217 m!1296443))

(declare-fun m!1296449 () Bool)

(assert (=> b!1407217 m!1296449))

(declare-fun m!1296451 () Bool)

(assert (=> b!1407217 m!1296451))

(declare-fun m!1296453 () Bool)

(assert (=> b!1407215 m!1296453))

(declare-fun m!1296455 () Bool)

(assert (=> b!1407215 m!1296455))

(assert (=> b!1407215 m!1296455))

(declare-fun m!1296457 () Bool)

(assert (=> b!1407215 m!1296457))

(assert (=> b!1407215 m!1296457))

(assert (=> b!1407215 m!1296455))

(declare-fun m!1296459 () Bool)

(assert (=> b!1407215 m!1296459))

(assert (=> b!1407213 m!1296443))

(assert (=> b!1407213 m!1296443))

(declare-fun m!1296461 () Bool)

(assert (=> b!1407213 m!1296461))

(assert (=> b!1407218 m!1296443))

(assert (=> b!1407218 m!1296443))

(declare-fun m!1296463 () Bool)

(assert (=> b!1407218 m!1296463))

(declare-fun m!1296465 () Bool)

(assert (=> b!1407214 m!1296465))

(declare-fun m!1296467 () Bool)

(assert (=> b!1407212 m!1296467))

(push 1)

(assert (not start!121032))

(assert (not b!1407218))

(assert (not b!1407213))

(assert (not b!1407217))

(assert (not b!1407212))

(assert (not b!1407219))

(assert (not b!1407214))

(assert (not b!1407215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

