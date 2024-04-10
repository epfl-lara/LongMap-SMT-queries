; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121500 () Bool)

(assert start!121500)

(declare-fun b!1411795 () Bool)

(declare-fun res!949028 () Bool)

(declare-fun e!798926 () Bool)

(assert (=> b!1411795 (=> (not res!949028) (not e!798926))))

(declare-datatypes ((array!96501 0))(
  ( (array!96502 (arr!46589 (Array (_ BitVec 32) (_ BitVec 64))) (size!47139 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96501)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96501 (_ BitVec 32)) Bool)

(assert (=> b!1411795 (= res!949028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411796 () Bool)

(declare-fun e!798924 () Bool)

(assert (=> b!1411796 (= e!798926 (not e!798924))))

(declare-fun res!949029 () Bool)

(assert (=> b!1411796 (=> res!949029 e!798924)))

(declare-datatypes ((SeekEntryResult!10900 0))(
  ( (MissingZero!10900 (index!45977 (_ BitVec 32))) (Found!10900 (index!45978 (_ BitVec 32))) (Intermediate!10900 (undefined!11712 Bool) (index!45979 (_ BitVec 32)) (x!127567 (_ BitVec 32))) (Undefined!10900) (MissingVacant!10900 (index!45980 (_ BitVec 32))) )
))
(declare-fun lt!621954 () SeekEntryResult!10900)

(assert (=> b!1411796 (= res!949029 (or (not (is-Intermediate!10900 lt!621954)) (undefined!11712 lt!621954)))))

(declare-fun e!798922 () Bool)

(assert (=> b!1411796 e!798922))

(declare-fun res!949024 () Bool)

(assert (=> b!1411796 (=> (not res!949024) (not e!798922))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411796 (= res!949024 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47774 0))(
  ( (Unit!47775) )
))
(declare-fun lt!621956 () Unit!47774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47774)

(assert (=> b!1411796 (= lt!621956 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621953 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96501 (_ BitVec 32)) SeekEntryResult!10900)

(assert (=> b!1411796 (= lt!621954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621953 (select (arr!46589 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411796 (= lt!621953 (toIndex!0 (select (arr!46589 a!2901) j!112) mask!2840))))

(declare-fun b!1411797 () Bool)

(declare-fun res!949027 () Bool)

(assert (=> b!1411797 (=> (not res!949027) (not e!798926))))

(declare-datatypes ((List!33108 0))(
  ( (Nil!33105) (Cons!33104 (h!34376 (_ BitVec 64)) (t!47802 List!33108)) )
))
(declare-fun arrayNoDuplicates!0 (array!96501 (_ BitVec 32) List!33108) Bool)

(assert (=> b!1411797 (= res!949027 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33105))))

(declare-fun res!949022 () Bool)

(assert (=> start!121500 (=> (not res!949022) (not e!798926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121500 (= res!949022 (validMask!0 mask!2840))))

(assert (=> start!121500 e!798926))

(assert (=> start!121500 true))

(declare-fun array_inv!35617 (array!96501) Bool)

(assert (=> start!121500 (array_inv!35617 a!2901)))

(declare-fun b!1411798 () Bool)

(declare-fun e!798923 () Bool)

(assert (=> b!1411798 (= e!798924 e!798923)))

(declare-fun res!949023 () Bool)

(assert (=> b!1411798 (=> res!949023 e!798923)))

(declare-fun lt!621952 () SeekEntryResult!10900)

(assert (=> b!1411798 (= res!949023 (or (= lt!621954 lt!621952) (not (is-Intermediate!10900 lt!621952))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621955 () (_ BitVec 64))

(assert (=> b!1411798 (= lt!621952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621955 mask!2840) lt!621955 (array!96502 (store (arr!46589 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47139 a!2901)) mask!2840))))

(assert (=> b!1411798 (= lt!621955 (select (store (arr!46589 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411799 () Bool)

(declare-fun res!949025 () Bool)

(assert (=> b!1411799 (=> (not res!949025) (not e!798926))))

(assert (=> b!1411799 (= res!949025 (and (= (size!47139 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47139 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47139 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411800 () Bool)

(declare-fun res!949030 () Bool)

(assert (=> b!1411800 (=> (not res!949030) (not e!798926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411800 (= res!949030 (validKeyInArray!0 (select (arr!46589 a!2901) j!112)))))

(declare-fun b!1411801 () Bool)

(declare-fun res!949026 () Bool)

(assert (=> b!1411801 (=> (not res!949026) (not e!798926))))

(assert (=> b!1411801 (= res!949026 (validKeyInArray!0 (select (arr!46589 a!2901) i!1037)))))

(declare-fun b!1411802 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96501 (_ BitVec 32)) SeekEntryResult!10900)

(assert (=> b!1411802 (= e!798922 (= (seekEntryOrOpen!0 (select (arr!46589 a!2901) j!112) a!2901 mask!2840) (Found!10900 j!112)))))

(declare-fun b!1411803 () Bool)

(assert (=> b!1411803 (= e!798923 true)))

(assert (=> b!1411803 (and (not (undefined!11712 lt!621952)) (= (index!45979 lt!621952) i!1037) (bvslt (x!127567 lt!621952) (x!127567 lt!621954)) (= (select (store (arr!46589 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45979 lt!621952)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621957 () Unit!47774)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47774)

(assert (=> b!1411803 (= lt!621957 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621953 (x!127567 lt!621954) (index!45979 lt!621954) (x!127567 lt!621952) (index!45979 lt!621952) (undefined!11712 lt!621952) mask!2840))))

(assert (= (and start!121500 res!949022) b!1411799))

(assert (= (and b!1411799 res!949025) b!1411801))

(assert (= (and b!1411801 res!949026) b!1411800))

(assert (= (and b!1411800 res!949030) b!1411795))

(assert (= (and b!1411795 res!949028) b!1411797))

(assert (= (and b!1411797 res!949027) b!1411796))

(assert (= (and b!1411796 res!949024) b!1411802))

(assert (= (and b!1411796 (not res!949029)) b!1411798))

(assert (= (and b!1411798 (not res!949023)) b!1411803))

(declare-fun m!1301787 () Bool)

(assert (=> b!1411801 m!1301787))

(assert (=> b!1411801 m!1301787))

(declare-fun m!1301789 () Bool)

(assert (=> b!1411801 m!1301789))

(declare-fun m!1301791 () Bool)

(assert (=> b!1411796 m!1301791))

(declare-fun m!1301793 () Bool)

(assert (=> b!1411796 m!1301793))

(assert (=> b!1411796 m!1301791))

(assert (=> b!1411796 m!1301791))

(declare-fun m!1301795 () Bool)

(assert (=> b!1411796 m!1301795))

(declare-fun m!1301797 () Bool)

(assert (=> b!1411796 m!1301797))

(declare-fun m!1301799 () Bool)

(assert (=> b!1411796 m!1301799))

(declare-fun m!1301801 () Bool)

(assert (=> b!1411803 m!1301801))

(declare-fun m!1301803 () Bool)

(assert (=> b!1411803 m!1301803))

(declare-fun m!1301805 () Bool)

(assert (=> b!1411803 m!1301805))

(declare-fun m!1301807 () Bool)

(assert (=> start!121500 m!1301807))

(declare-fun m!1301809 () Bool)

(assert (=> start!121500 m!1301809))

(assert (=> b!1411800 m!1301791))

(assert (=> b!1411800 m!1301791))

(declare-fun m!1301811 () Bool)

(assert (=> b!1411800 m!1301811))

(declare-fun m!1301813 () Bool)

(assert (=> b!1411797 m!1301813))

(assert (=> b!1411802 m!1301791))

(assert (=> b!1411802 m!1301791))

(declare-fun m!1301815 () Bool)

(assert (=> b!1411802 m!1301815))

(declare-fun m!1301817 () Bool)

(assert (=> b!1411798 m!1301817))

(assert (=> b!1411798 m!1301801))

(assert (=> b!1411798 m!1301817))

(declare-fun m!1301819 () Bool)

(assert (=> b!1411798 m!1301819))

(declare-fun m!1301821 () Bool)

(assert (=> b!1411798 m!1301821))

(declare-fun m!1301823 () Bool)

(assert (=> b!1411795 m!1301823))

(push 1)

