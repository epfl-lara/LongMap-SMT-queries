; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121158 () Bool)

(assert start!121158)

(declare-fun b!1408742 () Bool)

(declare-fun res!946467 () Bool)

(declare-fun e!797246 () Bool)

(assert (=> b!1408742 (=> (not res!946467) (not e!797246))))

(declare-datatypes ((array!96312 0))(
  ( (array!96313 (arr!46499 (Array (_ BitVec 32) (_ BitVec 64))) (size!47049 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96312)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408742 (= res!946467 (validKeyInArray!0 (select (arr!46499 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!797248 () Bool)

(declare-fun b!1408743 () Bool)

(declare-datatypes ((SeekEntryResult!10810 0))(
  ( (MissingZero!10810 (index!45617 (_ BitVec 32))) (Found!10810 (index!45618 (_ BitVec 32))) (Intermediate!10810 (undefined!11622 Bool) (index!45619 (_ BitVec 32)) (x!127219 (_ BitVec 32))) (Undefined!10810) (MissingVacant!10810 (index!45620 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96312 (_ BitVec 32)) SeekEntryResult!10810)

(assert (=> b!1408743 (= e!797248 (= (seekEntryOrOpen!0 (select (arr!46499 a!2901) j!112) a!2901 mask!2840) (Found!10810 j!112)))))

(declare-fun res!946468 () Bool)

(assert (=> start!121158 (=> (not res!946468) (not e!797246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121158 (= res!946468 (validMask!0 mask!2840))))

(assert (=> start!121158 e!797246))

(assert (=> start!121158 true))

(declare-fun array_inv!35527 (array!96312) Bool)

(assert (=> start!121158 (array_inv!35527 a!2901)))

(declare-fun b!1408744 () Bool)

(declare-fun res!946471 () Bool)

(assert (=> b!1408744 (=> (not res!946471) (not e!797246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96312 (_ BitVec 32)) Bool)

(assert (=> b!1408744 (= res!946471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408745 () Bool)

(declare-fun res!946469 () Bool)

(assert (=> b!1408745 (=> (not res!946469) (not e!797246))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408745 (= res!946469 (and (= (size!47049 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47049 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47049 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408746 () Bool)

(declare-fun res!946465 () Bool)

(assert (=> b!1408746 (=> (not res!946465) (not e!797246))))

(assert (=> b!1408746 (= res!946465 (validKeyInArray!0 (select (arr!46499 a!2901) i!1037)))))

(declare-fun b!1408747 () Bool)

(declare-fun e!797249 () Bool)

(assert (=> b!1408747 (= e!797246 (not e!797249))))

(declare-fun res!946466 () Bool)

(assert (=> b!1408747 (=> res!946466 e!797249)))

(declare-fun lt!620463 () SeekEntryResult!10810)

(assert (=> b!1408747 (= res!946466 (or (not (is-Intermediate!10810 lt!620463)) (undefined!11622 lt!620463)))))

(assert (=> b!1408747 e!797248))

(declare-fun res!946464 () Bool)

(assert (=> b!1408747 (=> (not res!946464) (not e!797248))))

(assert (=> b!1408747 (= res!946464 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47594 0))(
  ( (Unit!47595) )
))
(declare-fun lt!620462 () Unit!47594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47594)

(assert (=> b!1408747 (= lt!620462 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96312 (_ BitVec 32)) SeekEntryResult!10810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408747 (= lt!620463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46499 a!2901) j!112) mask!2840) (select (arr!46499 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408748 () Bool)

(assert (=> b!1408748 (= e!797249 true)))

(declare-fun lt!620461 () SeekEntryResult!10810)

(assert (=> b!1408748 (= lt!620461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46499 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46499 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96313 (store (arr!46499 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47049 a!2901)) mask!2840))))

(declare-fun b!1408749 () Bool)

(declare-fun res!946470 () Bool)

(assert (=> b!1408749 (=> (not res!946470) (not e!797246))))

(declare-datatypes ((List!33018 0))(
  ( (Nil!33015) (Cons!33014 (h!34277 (_ BitVec 64)) (t!47712 List!33018)) )
))
(declare-fun arrayNoDuplicates!0 (array!96312 (_ BitVec 32) List!33018) Bool)

(assert (=> b!1408749 (= res!946470 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33015))))

(assert (= (and start!121158 res!946468) b!1408745))

(assert (= (and b!1408745 res!946469) b!1408746))

(assert (= (and b!1408746 res!946465) b!1408742))

(assert (= (and b!1408742 res!946467) b!1408744))

(assert (= (and b!1408744 res!946471) b!1408749))

(assert (= (and b!1408749 res!946470) b!1408747))

(assert (= (and b!1408747 res!946464) b!1408743))

(assert (= (and b!1408747 (not res!946466)) b!1408748))

(declare-fun m!1298169 () Bool)

(assert (=> b!1408744 m!1298169))

(declare-fun m!1298171 () Bool)

(assert (=> b!1408748 m!1298171))

(declare-fun m!1298173 () Bool)

(assert (=> b!1408748 m!1298173))

(assert (=> b!1408748 m!1298173))

(declare-fun m!1298175 () Bool)

(assert (=> b!1408748 m!1298175))

(assert (=> b!1408748 m!1298175))

(assert (=> b!1408748 m!1298173))

(declare-fun m!1298177 () Bool)

(assert (=> b!1408748 m!1298177))

(declare-fun m!1298179 () Bool)

(assert (=> b!1408743 m!1298179))

(assert (=> b!1408743 m!1298179))

(declare-fun m!1298181 () Bool)

(assert (=> b!1408743 m!1298181))

(declare-fun m!1298183 () Bool)

(assert (=> b!1408746 m!1298183))

(assert (=> b!1408746 m!1298183))

(declare-fun m!1298185 () Bool)

(assert (=> b!1408746 m!1298185))

(declare-fun m!1298187 () Bool)

(assert (=> start!121158 m!1298187))

(declare-fun m!1298189 () Bool)

(assert (=> start!121158 m!1298189))

(assert (=> b!1408742 m!1298179))

(assert (=> b!1408742 m!1298179))

(declare-fun m!1298191 () Bool)

(assert (=> b!1408742 m!1298191))

(declare-fun m!1298193 () Bool)

(assert (=> b!1408749 m!1298193))

(assert (=> b!1408747 m!1298179))

(declare-fun m!1298195 () Bool)

(assert (=> b!1408747 m!1298195))

(assert (=> b!1408747 m!1298179))

(declare-fun m!1298197 () Bool)

(assert (=> b!1408747 m!1298197))

(assert (=> b!1408747 m!1298195))

(assert (=> b!1408747 m!1298179))

(declare-fun m!1298199 () Bool)

(assert (=> b!1408747 m!1298199))

(declare-fun m!1298201 () Bool)

(assert (=> b!1408747 m!1298201))

(push 1)

(assert (not b!1408749))

(assert (not b!1408748))

(assert (not start!121158))

(assert (not b!1408742))

(assert (not b!1408747))

(assert (not b!1408746))

(assert (not b!1408743))

(assert (not b!1408744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

