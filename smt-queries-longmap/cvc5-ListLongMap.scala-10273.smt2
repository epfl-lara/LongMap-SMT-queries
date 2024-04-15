; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120798 () Bool)

(assert start!120798)

(declare-fun b!1405497 () Bool)

(declare-fun res!943766 () Bool)

(declare-fun e!795576 () Bool)

(assert (=> b!1405497 (=> (not res!943766) (not e!795576))))

(declare-datatypes ((array!96058 0))(
  ( (array!96059 (arr!46377 (Array (_ BitVec 32) (_ BitVec 64))) (size!46929 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96058)

(declare-datatypes ((List!32974 0))(
  ( (Nil!32971) (Cons!32970 (h!34224 (_ BitVec 64)) (t!47660 List!32974)) )
))
(declare-fun arrayNoDuplicates!0 (array!96058 (_ BitVec 32) List!32974) Bool)

(assert (=> b!1405497 (= res!943766 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32971))))

(declare-fun b!1405498 () Bool)

(declare-fun res!943765 () Bool)

(assert (=> b!1405498 (=> (not res!943765) (not e!795576))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96058 (_ BitVec 32)) Bool)

(assert (=> b!1405498 (= res!943765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405499 () Bool)

(declare-fun res!943769 () Bool)

(assert (=> b!1405499 (=> (not res!943769) (not e!795576))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405499 (= res!943769 (validKeyInArray!0 (select (arr!46377 a!2901) j!112)))))

(declare-fun res!943768 () Bool)

(assert (=> start!120798 (=> (not res!943768) (not e!795576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120798 (= res!943768 (validMask!0 mask!2840))))

(assert (=> start!120798 e!795576))

(assert (=> start!120798 true))

(declare-fun array_inv!35610 (array!96058) Bool)

(assert (=> start!120798 (array_inv!35610 a!2901)))

(declare-fun b!1405500 () Bool)

(assert (=> b!1405500 (= e!795576 (not true))))

(declare-fun e!795578 () Bool)

(assert (=> b!1405500 e!795578))

(declare-fun res!943770 () Bool)

(assert (=> b!1405500 (=> (not res!943770) (not e!795578))))

(assert (=> b!1405500 (= res!943770 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47245 0))(
  ( (Unit!47246) )
))
(declare-fun lt!618877 () Unit!47245)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47245)

(assert (=> b!1405500 (= lt!618877 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10714 0))(
  ( (MissingZero!10714 (index!45233 (_ BitVec 32))) (Found!10714 (index!45234 (_ BitVec 32))) (Intermediate!10714 (undefined!11526 Bool) (index!45235 (_ BitVec 32)) (x!126838 (_ BitVec 32))) (Undefined!10714) (MissingVacant!10714 (index!45236 (_ BitVec 32))) )
))
(declare-fun lt!618878 () SeekEntryResult!10714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96058 (_ BitVec 32)) SeekEntryResult!10714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405500 (= lt!618878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46377 a!2901) j!112) mask!2840) (select (arr!46377 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405501 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96058 (_ BitVec 32)) SeekEntryResult!10714)

(assert (=> b!1405501 (= e!795578 (= (seekEntryOrOpen!0 (select (arr!46377 a!2901) j!112) a!2901 mask!2840) (Found!10714 j!112)))))

(declare-fun b!1405502 () Bool)

(declare-fun res!943767 () Bool)

(assert (=> b!1405502 (=> (not res!943767) (not e!795576))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405502 (= res!943767 (and (= (size!46929 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46929 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46929 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405503 () Bool)

(declare-fun res!943771 () Bool)

(assert (=> b!1405503 (=> (not res!943771) (not e!795576))))

(assert (=> b!1405503 (= res!943771 (validKeyInArray!0 (select (arr!46377 a!2901) i!1037)))))

(assert (= (and start!120798 res!943768) b!1405502))

(assert (= (and b!1405502 res!943767) b!1405503))

(assert (= (and b!1405503 res!943771) b!1405499))

(assert (= (and b!1405499 res!943769) b!1405498))

(assert (= (and b!1405498 res!943765) b!1405497))

(assert (= (and b!1405497 res!943766) b!1405500))

(assert (= (and b!1405500 res!943770) b!1405501))

(declare-fun m!1293857 () Bool)

(assert (=> start!120798 m!1293857))

(declare-fun m!1293859 () Bool)

(assert (=> start!120798 m!1293859))

(declare-fun m!1293861 () Bool)

(assert (=> b!1405501 m!1293861))

(assert (=> b!1405501 m!1293861))

(declare-fun m!1293863 () Bool)

(assert (=> b!1405501 m!1293863))

(declare-fun m!1293865 () Bool)

(assert (=> b!1405503 m!1293865))

(assert (=> b!1405503 m!1293865))

(declare-fun m!1293867 () Bool)

(assert (=> b!1405503 m!1293867))

(declare-fun m!1293869 () Bool)

(assert (=> b!1405497 m!1293869))

(declare-fun m!1293871 () Bool)

(assert (=> b!1405498 m!1293871))

(assert (=> b!1405499 m!1293861))

(assert (=> b!1405499 m!1293861))

(declare-fun m!1293873 () Bool)

(assert (=> b!1405499 m!1293873))

(assert (=> b!1405500 m!1293861))

(declare-fun m!1293875 () Bool)

(assert (=> b!1405500 m!1293875))

(assert (=> b!1405500 m!1293861))

(declare-fun m!1293877 () Bool)

(assert (=> b!1405500 m!1293877))

(assert (=> b!1405500 m!1293875))

(assert (=> b!1405500 m!1293861))

(declare-fun m!1293879 () Bool)

(assert (=> b!1405500 m!1293879))

(declare-fun m!1293881 () Bool)

(assert (=> b!1405500 m!1293881))

(push 1)

(assert (not b!1405499))

(assert (not b!1405503))

(assert (not b!1405497))

(assert (not b!1405498))

(assert (not b!1405501))

(assert (not b!1405500))

(assert (not start!120798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

