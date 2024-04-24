; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121422 () Bool)

(assert start!121422)

(declare-fun b!1410794 () Bool)

(declare-fun res!947834 () Bool)

(declare-fun e!798442 () Bool)

(assert (=> b!1410794 (=> (not res!947834) (not e!798442))))

(declare-datatypes ((array!96498 0))(
  ( (array!96499 (arr!46590 (Array (_ BitVec 32) (_ BitVec 64))) (size!47141 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96498)

(declare-datatypes ((List!33096 0))(
  ( (Nil!33093) (Cons!33092 (h!34363 (_ BitVec 64)) (t!47782 List!33096)) )
))
(declare-fun arrayNoDuplicates!0 (array!96498 (_ BitVec 32) List!33096) Bool)

(assert (=> b!1410794 (= res!947834 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33093))))

(declare-fun b!1410795 () Bool)

(declare-fun res!947835 () Bool)

(assert (=> b!1410795 (=> (not res!947835) (not e!798442))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410795 (= res!947835 (validKeyInArray!0 (select (arr!46590 a!2901) i!1037)))))

(declare-fun b!1410796 () Bool)

(declare-fun res!947839 () Bool)

(assert (=> b!1410796 (=> (not res!947839) (not e!798442))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410796 (= res!947839 (and (= (size!47141 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47141 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47141 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410797 () Bool)

(declare-fun res!947836 () Bool)

(assert (=> b!1410797 (=> (not res!947836) (not e!798442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96498 (_ BitVec 32)) Bool)

(assert (=> b!1410797 (= res!947836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!798440 () Bool)

(declare-fun b!1410798 () Bool)

(declare-datatypes ((SeekEntryResult!10804 0))(
  ( (MissingZero!10804 (index!45593 (_ BitVec 32))) (Found!10804 (index!45594 (_ BitVec 32))) (Intermediate!10804 (undefined!11616 Bool) (index!45595 (_ BitVec 32)) (x!127328 (_ BitVec 32))) (Undefined!10804) (MissingVacant!10804 (index!45596 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96498 (_ BitVec 32)) SeekEntryResult!10804)

(assert (=> b!1410798 (= e!798440 (= (seekEntryOrOpen!0 (select (arr!46590 a!2901) j!112) a!2901 mask!2840) (Found!10804 j!112)))))

(declare-fun b!1410799 () Bool)

(declare-fun e!798443 () Bool)

(assert (=> b!1410799 (= e!798442 (not e!798443))))

(declare-fun res!947832 () Bool)

(assert (=> b!1410799 (=> res!947832 e!798443)))

(declare-fun lt!621201 () SeekEntryResult!10804)

(assert (=> b!1410799 (= res!947832 (or (not (is-Intermediate!10804 lt!621201)) (undefined!11616 lt!621201)))))

(assert (=> b!1410799 e!798440))

(declare-fun res!947837 () Bool)

(assert (=> b!1410799 (=> (not res!947837) (not e!798440))))

(assert (=> b!1410799 (= res!947837 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47609 0))(
  ( (Unit!47610) )
))
(declare-fun lt!621203 () Unit!47609)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47609)

(assert (=> b!1410799 (= lt!621203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96498 (_ BitVec 32)) SeekEntryResult!10804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410799 (= lt!621201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46590 a!2901) j!112) mask!2840) (select (arr!46590 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410801 () Bool)

(assert (=> b!1410801 (= e!798443 true)))

(declare-fun lt!621202 () SeekEntryResult!10804)

(assert (=> b!1410801 (= lt!621202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46590 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46590 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96499 (store (arr!46590 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47141 a!2901)) mask!2840))))

(declare-fun b!1410800 () Bool)

(declare-fun res!947833 () Bool)

(assert (=> b!1410800 (=> (not res!947833) (not e!798442))))

(assert (=> b!1410800 (= res!947833 (validKeyInArray!0 (select (arr!46590 a!2901) j!112)))))

(declare-fun res!947838 () Bool)

(assert (=> start!121422 (=> (not res!947838) (not e!798442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121422 (= res!947838 (validMask!0 mask!2840))))

(assert (=> start!121422 e!798442))

(assert (=> start!121422 true))

(declare-fun array_inv!35871 (array!96498) Bool)

(assert (=> start!121422 (array_inv!35871 a!2901)))

(assert (= (and start!121422 res!947838) b!1410796))

(assert (= (and b!1410796 res!947839) b!1410795))

(assert (= (and b!1410795 res!947835) b!1410800))

(assert (= (and b!1410800 res!947833) b!1410797))

(assert (= (and b!1410797 res!947836) b!1410794))

(assert (= (and b!1410794 res!947834) b!1410799))

(assert (= (and b!1410799 res!947837) b!1410798))

(assert (= (and b!1410799 (not res!947832)) b!1410801))

(declare-fun m!1300833 () Bool)

(assert (=> start!121422 m!1300833))

(declare-fun m!1300835 () Bool)

(assert (=> start!121422 m!1300835))

(declare-fun m!1300837 () Bool)

(assert (=> b!1410794 m!1300837))

(declare-fun m!1300839 () Bool)

(assert (=> b!1410797 m!1300839))

(declare-fun m!1300841 () Bool)

(assert (=> b!1410795 m!1300841))

(assert (=> b!1410795 m!1300841))

(declare-fun m!1300843 () Bool)

(assert (=> b!1410795 m!1300843))

(declare-fun m!1300845 () Bool)

(assert (=> b!1410801 m!1300845))

(declare-fun m!1300847 () Bool)

(assert (=> b!1410801 m!1300847))

(assert (=> b!1410801 m!1300847))

(declare-fun m!1300849 () Bool)

(assert (=> b!1410801 m!1300849))

(assert (=> b!1410801 m!1300849))

(assert (=> b!1410801 m!1300847))

(declare-fun m!1300851 () Bool)

(assert (=> b!1410801 m!1300851))

(declare-fun m!1300853 () Bool)

(assert (=> b!1410799 m!1300853))

(declare-fun m!1300855 () Bool)

(assert (=> b!1410799 m!1300855))

(assert (=> b!1410799 m!1300853))

(declare-fun m!1300857 () Bool)

(assert (=> b!1410799 m!1300857))

(assert (=> b!1410799 m!1300855))

(assert (=> b!1410799 m!1300853))

(declare-fun m!1300859 () Bool)

(assert (=> b!1410799 m!1300859))

(declare-fun m!1300861 () Bool)

(assert (=> b!1410799 m!1300861))

(assert (=> b!1410798 m!1300853))

(assert (=> b!1410798 m!1300853))

(declare-fun m!1300863 () Bool)

(assert (=> b!1410798 m!1300863))

(assert (=> b!1410800 m!1300853))

(assert (=> b!1410800 m!1300853))

(declare-fun m!1300865 () Bool)

(assert (=> b!1410800 m!1300865))

(push 1)

(assert (not b!1410798))

(assert (not start!121422))

(assert (not b!1410799))

(assert (not b!1410795))

(assert (not b!1410800))

(assert (not b!1410794))

(assert (not b!1410797))

(assert (not b!1410801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

