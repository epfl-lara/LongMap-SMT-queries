; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120492 () Bool)

(assert start!120492)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95901 0))(
  ( (array!95902 (arr!46301 (Array (_ BitVec 32) (_ BitVec 64))) (size!46851 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95901)

(declare-fun b!1403030 () Bool)

(declare-fun e!794441 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10618 0))(
  ( (MissingZero!10618 (index!44849 (_ BitVec 32))) (Found!10618 (index!44850 (_ BitVec 32))) (Intermediate!10618 (undefined!11430 Bool) (index!44851 (_ BitVec 32)) (x!126469 (_ BitVec 32))) (Undefined!10618) (MissingVacant!10618 (index!44852 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95901 (_ BitVec 32)) SeekEntryResult!10618)

(assert (=> b!1403030 (= e!794441 (= (seekEntryOrOpen!0 (select (arr!46301 a!2901) j!112) a!2901 mask!2840) (Found!10618 j!112)))))

(declare-fun b!1403031 () Bool)

(declare-fun e!794438 () Bool)

(declare-fun e!794439 () Bool)

(assert (=> b!1403031 (= e!794438 (not e!794439))))

(declare-fun res!941548 () Bool)

(assert (=> b!1403031 (=> res!941548 e!794439)))

(declare-fun lt!618247 () SeekEntryResult!10618)

(assert (=> b!1403031 (= res!941548 (or (not (is-Intermediate!10618 lt!618247)) (undefined!11430 lt!618247)))))

(assert (=> b!1403031 e!794441))

(declare-fun res!941547 () Bool)

(assert (=> b!1403031 (=> (not res!941547) (not e!794441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95901 (_ BitVec 32)) Bool)

(assert (=> b!1403031 (= res!941547 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47240 0))(
  ( (Unit!47241) )
))
(declare-fun lt!618249 () Unit!47240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47240)

(assert (=> b!1403031 (= lt!618249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95901 (_ BitVec 32)) SeekEntryResult!10618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403031 (= lt!618247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46301 a!2901) j!112) mask!2840) (select (arr!46301 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403032 () Bool)

(assert (=> b!1403032 (= e!794439 true)))

(declare-fun lt!618248 () SeekEntryResult!10618)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403032 (= lt!618248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46301 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46301 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95902 (store (arr!46301 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46851 a!2901)) mask!2840))))

(declare-fun b!1403033 () Bool)

(declare-fun res!941543 () Bool)

(assert (=> b!1403033 (=> (not res!941543) (not e!794438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403033 (= res!941543 (validKeyInArray!0 (select (arr!46301 a!2901) j!112)))))

(declare-fun res!941546 () Bool)

(assert (=> start!120492 (=> (not res!941546) (not e!794438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120492 (= res!941546 (validMask!0 mask!2840))))

(assert (=> start!120492 e!794438))

(assert (=> start!120492 true))

(declare-fun array_inv!35329 (array!95901) Bool)

(assert (=> start!120492 (array_inv!35329 a!2901)))

(declare-fun b!1403034 () Bool)

(declare-fun res!941545 () Bool)

(assert (=> b!1403034 (=> (not res!941545) (not e!794438))))

(assert (=> b!1403034 (= res!941545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403035 () Bool)

(declare-fun res!941542 () Bool)

(assert (=> b!1403035 (=> (not res!941542) (not e!794438))))

(assert (=> b!1403035 (= res!941542 (and (= (size!46851 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46851 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46851 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403036 () Bool)

(declare-fun res!941544 () Bool)

(assert (=> b!1403036 (=> (not res!941544) (not e!794438))))

(assert (=> b!1403036 (= res!941544 (validKeyInArray!0 (select (arr!46301 a!2901) i!1037)))))

(declare-fun b!1403037 () Bool)

(declare-fun res!941541 () Bool)

(assert (=> b!1403037 (=> (not res!941541) (not e!794438))))

(declare-datatypes ((List!32820 0))(
  ( (Nil!32817) (Cons!32816 (h!34064 (_ BitVec 64)) (t!47514 List!32820)) )
))
(declare-fun arrayNoDuplicates!0 (array!95901 (_ BitVec 32) List!32820) Bool)

(assert (=> b!1403037 (= res!941541 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32817))))

(assert (= (and start!120492 res!941546) b!1403035))

(assert (= (and b!1403035 res!941542) b!1403036))

(assert (= (and b!1403036 res!941544) b!1403033))

(assert (= (and b!1403033 res!941543) b!1403034))

(assert (= (and b!1403034 res!941545) b!1403037))

(assert (= (and b!1403037 res!941541) b!1403031))

(assert (= (and b!1403031 res!941547) b!1403030))

(assert (= (and b!1403031 (not res!941548)) b!1403032))

(declare-fun m!1291497 () Bool)

(assert (=> b!1403030 m!1291497))

(assert (=> b!1403030 m!1291497))

(declare-fun m!1291499 () Bool)

(assert (=> b!1403030 m!1291499))

(assert (=> b!1403031 m!1291497))

(declare-fun m!1291501 () Bool)

(assert (=> b!1403031 m!1291501))

(assert (=> b!1403031 m!1291497))

(declare-fun m!1291503 () Bool)

(assert (=> b!1403031 m!1291503))

(assert (=> b!1403031 m!1291501))

(assert (=> b!1403031 m!1291497))

(declare-fun m!1291505 () Bool)

(assert (=> b!1403031 m!1291505))

(declare-fun m!1291507 () Bool)

(assert (=> b!1403031 m!1291507))

(declare-fun m!1291509 () Bool)

(assert (=> b!1403036 m!1291509))

(assert (=> b!1403036 m!1291509))

(declare-fun m!1291511 () Bool)

(assert (=> b!1403036 m!1291511))

(assert (=> b!1403033 m!1291497))

(assert (=> b!1403033 m!1291497))

(declare-fun m!1291513 () Bool)

(assert (=> b!1403033 m!1291513))

(declare-fun m!1291515 () Bool)

(assert (=> b!1403034 m!1291515))

(declare-fun m!1291517 () Bool)

(assert (=> start!120492 m!1291517))

(declare-fun m!1291519 () Bool)

(assert (=> start!120492 m!1291519))

(declare-fun m!1291521 () Bool)

(assert (=> b!1403037 m!1291521))

(declare-fun m!1291523 () Bool)

(assert (=> b!1403032 m!1291523))

(declare-fun m!1291525 () Bool)

(assert (=> b!1403032 m!1291525))

(assert (=> b!1403032 m!1291525))

(declare-fun m!1291527 () Bool)

(assert (=> b!1403032 m!1291527))

(assert (=> b!1403032 m!1291527))

(assert (=> b!1403032 m!1291525))

(declare-fun m!1291529 () Bool)

(assert (=> b!1403032 m!1291529))

(push 1)

(assert (not b!1403033))

(assert (not b!1403032))

(assert (not start!120492))

(assert (not b!1403031))

(assert (not b!1403037))

(assert (not b!1403036))

(assert (not b!1403034))

(assert (not b!1403030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

