; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121618 () Bool)

(assert start!121618)

(declare-fun res!949882 () Bool)

(declare-fun e!799569 () Bool)

(assert (=> start!121618 (=> (not res!949882) (not e!799569))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121618 (= res!949882 (validMask!0 mask!2840))))

(assert (=> start!121618 e!799569))

(assert (=> start!121618 true))

(declare-datatypes ((array!96556 0))(
  ( (array!96557 (arr!46615 (Array (_ BitVec 32) (_ BitVec 64))) (size!47165 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96556)

(declare-fun array_inv!35643 (array!96556) Bool)

(assert (=> start!121618 (array_inv!35643 a!2901)))

(declare-fun b!1412886 () Bool)

(declare-fun e!799574 () Bool)

(assert (=> b!1412886 (= e!799569 (not e!799574))))

(declare-fun res!949883 () Bool)

(assert (=> b!1412886 (=> res!949883 e!799574)))

(declare-datatypes ((SeekEntryResult!10926 0))(
  ( (MissingZero!10926 (index!46084 (_ BitVec 32))) (Found!10926 (index!46085 (_ BitVec 32))) (Intermediate!10926 (undefined!11738 Bool) (index!46086 (_ BitVec 32)) (x!127669 (_ BitVec 32))) (Undefined!10926) (MissingVacant!10926 (index!46087 (_ BitVec 32))) )
))
(declare-fun lt!622653 () SeekEntryResult!10926)

(assert (=> b!1412886 (= res!949883 (or (not (is-Intermediate!10926 lt!622653)) (undefined!11738 lt!622653)))))

(declare-fun e!799570 () Bool)

(assert (=> b!1412886 e!799570))

(declare-fun res!949876 () Bool)

(assert (=> b!1412886 (=> (not res!949876) (not e!799570))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96556 (_ BitVec 32)) Bool)

(assert (=> b!1412886 (= res!949876 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47826 0))(
  ( (Unit!47827) )
))
(declare-fun lt!622652 () Unit!47826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47826)

(assert (=> b!1412886 (= lt!622652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622649 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96556 (_ BitVec 32)) SeekEntryResult!10926)

(assert (=> b!1412886 (= lt!622653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622649 (select (arr!46615 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412886 (= lt!622649 (toIndex!0 (select (arr!46615 a!2901) j!112) mask!2840))))

(declare-fun b!1412887 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96556 (_ BitVec 32)) SeekEntryResult!10926)

(assert (=> b!1412887 (= e!799570 (= (seekEntryOrOpen!0 (select (arr!46615 a!2901) j!112) a!2901 mask!2840) (Found!10926 j!112)))))

(declare-fun b!1412888 () Bool)

(declare-fun res!949884 () Bool)

(assert (=> b!1412888 (=> (not res!949884) (not e!799569))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412888 (= res!949884 (validKeyInArray!0 (select (arr!46615 a!2901) i!1037)))))

(declare-fun b!1412889 () Bool)

(declare-fun res!949880 () Bool)

(assert (=> b!1412889 (=> (not res!949880) (not e!799569))))

(declare-datatypes ((List!33134 0))(
  ( (Nil!33131) (Cons!33130 (h!34405 (_ BitVec 64)) (t!47828 List!33134)) )
))
(declare-fun arrayNoDuplicates!0 (array!96556 (_ BitVec 32) List!33134) Bool)

(assert (=> b!1412889 (= res!949880 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33131))))

(declare-fun b!1412890 () Bool)

(declare-fun res!949881 () Bool)

(assert (=> b!1412890 (=> (not res!949881) (not e!799569))))

(assert (=> b!1412890 (= res!949881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!799573 () Bool)

(declare-fun lt!622650 () array!96556)

(declare-fun b!1412891 () Bool)

(declare-fun lt!622648 () SeekEntryResult!10926)

(declare-fun lt!622647 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96556 (_ BitVec 32)) SeekEntryResult!10926)

(assert (=> b!1412891 (= e!799573 (= (seekEntryOrOpen!0 lt!622647 lt!622650 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127669 lt!622648) (index!46086 lt!622648) (index!46086 lt!622648) (select (arr!46615 a!2901) j!112) lt!622650 mask!2840)))))

(declare-fun b!1412892 () Bool)

(declare-fun e!799572 () Bool)

(assert (=> b!1412892 (= e!799572 true)))

(assert (=> b!1412892 e!799573))

(declare-fun res!949885 () Bool)

(assert (=> b!1412892 (=> (not res!949885) (not e!799573))))

(assert (=> b!1412892 (= res!949885 (and (not (undefined!11738 lt!622648)) (= (index!46086 lt!622648) i!1037) (bvslt (x!127669 lt!622648) (x!127669 lt!622653)) (= (select (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46086 lt!622648)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622651 () Unit!47826)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47826)

(assert (=> b!1412892 (= lt!622651 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622649 (x!127669 lt!622653) (index!46086 lt!622653) (x!127669 lt!622648) (index!46086 lt!622648) (undefined!11738 lt!622648) mask!2840))))

(declare-fun b!1412893 () Bool)

(declare-fun res!949877 () Bool)

(assert (=> b!1412893 (=> (not res!949877) (not e!799569))))

(assert (=> b!1412893 (= res!949877 (validKeyInArray!0 (select (arr!46615 a!2901) j!112)))))

(declare-fun b!1412894 () Bool)

(declare-fun res!949879 () Bool)

(assert (=> b!1412894 (=> (not res!949879) (not e!799569))))

(assert (=> b!1412894 (= res!949879 (and (= (size!47165 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47165 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47165 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412895 () Bool)

(assert (=> b!1412895 (= e!799574 e!799572)))

(declare-fun res!949878 () Bool)

(assert (=> b!1412895 (=> res!949878 e!799572)))

(assert (=> b!1412895 (= res!949878 (or (= lt!622653 lt!622648) (not (is-Intermediate!10926 lt!622648))))))

(assert (=> b!1412895 (= lt!622648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622647 mask!2840) lt!622647 lt!622650 mask!2840))))

(assert (=> b!1412895 (= lt!622647 (select (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412895 (= lt!622650 (array!96557 (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47165 a!2901)))))

(assert (= (and start!121618 res!949882) b!1412894))

(assert (= (and b!1412894 res!949879) b!1412888))

(assert (= (and b!1412888 res!949884) b!1412893))

(assert (= (and b!1412893 res!949877) b!1412890))

(assert (= (and b!1412890 res!949881) b!1412889))

(assert (= (and b!1412889 res!949880) b!1412886))

(assert (= (and b!1412886 res!949876) b!1412887))

(assert (= (and b!1412886 (not res!949883)) b!1412895))

(assert (= (and b!1412895 (not res!949878)) b!1412892))

(assert (= (and b!1412892 res!949885) b!1412891))

(declare-fun m!1303089 () Bool)

(assert (=> b!1412887 m!1303089))

(assert (=> b!1412887 m!1303089))

(declare-fun m!1303091 () Bool)

(assert (=> b!1412887 m!1303091))

(declare-fun m!1303093 () Bool)

(assert (=> b!1412895 m!1303093))

(assert (=> b!1412895 m!1303093))

(declare-fun m!1303095 () Bool)

(assert (=> b!1412895 m!1303095))

(declare-fun m!1303097 () Bool)

(assert (=> b!1412895 m!1303097))

(declare-fun m!1303099 () Bool)

(assert (=> b!1412895 m!1303099))

(declare-fun m!1303101 () Bool)

(assert (=> start!121618 m!1303101))

(declare-fun m!1303103 () Bool)

(assert (=> start!121618 m!1303103))

(declare-fun m!1303105 () Bool)

(assert (=> b!1412890 m!1303105))

(assert (=> b!1412893 m!1303089))

(assert (=> b!1412893 m!1303089))

(declare-fun m!1303107 () Bool)

(assert (=> b!1412893 m!1303107))

(declare-fun m!1303109 () Bool)

(assert (=> b!1412889 m!1303109))

(declare-fun m!1303111 () Bool)

(assert (=> b!1412891 m!1303111))

(assert (=> b!1412891 m!1303089))

(assert (=> b!1412891 m!1303089))

(declare-fun m!1303113 () Bool)

(assert (=> b!1412891 m!1303113))

(assert (=> b!1412886 m!1303089))

(declare-fun m!1303115 () Bool)

(assert (=> b!1412886 m!1303115))

(assert (=> b!1412886 m!1303089))

(declare-fun m!1303117 () Bool)

(assert (=> b!1412886 m!1303117))

(assert (=> b!1412886 m!1303089))

(declare-fun m!1303119 () Bool)

(assert (=> b!1412886 m!1303119))

(declare-fun m!1303121 () Bool)

(assert (=> b!1412886 m!1303121))

(assert (=> b!1412892 m!1303097))

(declare-fun m!1303123 () Bool)

(assert (=> b!1412892 m!1303123))

(declare-fun m!1303125 () Bool)

(assert (=> b!1412892 m!1303125))

(declare-fun m!1303127 () Bool)

(assert (=> b!1412888 m!1303127))

(assert (=> b!1412888 m!1303127))

(declare-fun m!1303129 () Bool)

(assert (=> b!1412888 m!1303129))

(push 1)

