; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121502 () Bool)

(assert start!121502)

(declare-fun b!1411822 () Bool)

(declare-fun res!949051 () Bool)

(declare-fun e!798939 () Bool)

(assert (=> b!1411822 (=> (not res!949051) (not e!798939))))

(declare-datatypes ((array!96503 0))(
  ( (array!96504 (arr!46590 (Array (_ BitVec 32) (_ BitVec 64))) (size!47140 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96503)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96503 (_ BitVec 32)) Bool)

(assert (=> b!1411822 (= res!949051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411823 () Bool)

(declare-fun e!798938 () Bool)

(assert (=> b!1411823 (= e!798938 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10901 0))(
  ( (MissingZero!10901 (index!45981 (_ BitVec 32))) (Found!10901 (index!45982 (_ BitVec 32))) (Intermediate!10901 (undefined!11713 Bool) (index!45983 (_ BitVec 32)) (x!127568 (_ BitVec 32))) (Undefined!10901) (MissingVacant!10901 (index!45984 (_ BitVec 32))) )
))
(declare-fun lt!621973 () SeekEntryResult!10901)

(declare-fun lt!621970 () SeekEntryResult!10901)

(assert (=> b!1411823 (and (not (undefined!11713 lt!621970)) (= (index!45983 lt!621970) i!1037) (bvslt (x!127568 lt!621970) (x!127568 lt!621973)) (= (select (store (arr!46590 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45983 lt!621970)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47776 0))(
  ( (Unit!47777) )
))
(declare-fun lt!621975 () Unit!47776)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!621972 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47776)

(assert (=> b!1411823 (= lt!621975 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621972 (x!127568 lt!621973) (index!45983 lt!621973) (x!127568 lt!621970) (index!45983 lt!621970) (undefined!11713 lt!621970) mask!2840))))

(declare-fun res!949049 () Bool)

(assert (=> start!121502 (=> (not res!949049) (not e!798939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121502 (= res!949049 (validMask!0 mask!2840))))

(assert (=> start!121502 e!798939))

(assert (=> start!121502 true))

(declare-fun array_inv!35618 (array!96503) Bool)

(assert (=> start!121502 (array_inv!35618 a!2901)))

(declare-fun e!798941 () Bool)

(declare-fun b!1411824 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96503 (_ BitVec 32)) SeekEntryResult!10901)

(assert (=> b!1411824 (= e!798941 (= (seekEntryOrOpen!0 (select (arr!46590 a!2901) j!112) a!2901 mask!2840) (Found!10901 j!112)))))

(declare-fun b!1411825 () Bool)

(declare-fun e!798937 () Bool)

(assert (=> b!1411825 (= e!798937 e!798938)))

(declare-fun res!949050 () Bool)

(assert (=> b!1411825 (=> res!949050 e!798938)))

(get-info :version)

(assert (=> b!1411825 (= res!949050 (or (= lt!621973 lt!621970) (not ((_ is Intermediate!10901) lt!621970))))))

(declare-fun lt!621971 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96503 (_ BitVec 32)) SeekEntryResult!10901)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411825 (= lt!621970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621971 mask!2840) lt!621971 (array!96504 (store (arr!46590 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47140 a!2901)) mask!2840))))

(assert (=> b!1411825 (= lt!621971 (select (store (arr!46590 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411826 () Bool)

(declare-fun res!949056 () Bool)

(assert (=> b!1411826 (=> (not res!949056) (not e!798939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411826 (= res!949056 (validKeyInArray!0 (select (arr!46590 a!2901) j!112)))))

(declare-fun b!1411827 () Bool)

(declare-fun res!949053 () Bool)

(assert (=> b!1411827 (=> (not res!949053) (not e!798939))))

(assert (=> b!1411827 (= res!949053 (and (= (size!47140 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47140 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47140 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411828 () Bool)

(assert (=> b!1411828 (= e!798939 (not e!798937))))

(declare-fun res!949055 () Bool)

(assert (=> b!1411828 (=> res!949055 e!798937)))

(assert (=> b!1411828 (= res!949055 (or (not ((_ is Intermediate!10901) lt!621973)) (undefined!11713 lt!621973)))))

(assert (=> b!1411828 e!798941))

(declare-fun res!949057 () Bool)

(assert (=> b!1411828 (=> (not res!949057) (not e!798941))))

(assert (=> b!1411828 (= res!949057 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621974 () Unit!47776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47776)

(assert (=> b!1411828 (= lt!621974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411828 (= lt!621973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621972 (select (arr!46590 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411828 (= lt!621972 (toIndex!0 (select (arr!46590 a!2901) j!112) mask!2840))))

(declare-fun b!1411829 () Bool)

(declare-fun res!949054 () Bool)

(assert (=> b!1411829 (=> (not res!949054) (not e!798939))))

(assert (=> b!1411829 (= res!949054 (validKeyInArray!0 (select (arr!46590 a!2901) i!1037)))))

(declare-fun b!1411830 () Bool)

(declare-fun res!949052 () Bool)

(assert (=> b!1411830 (=> (not res!949052) (not e!798939))))

(declare-datatypes ((List!33109 0))(
  ( (Nil!33106) (Cons!33105 (h!34377 (_ BitVec 64)) (t!47803 List!33109)) )
))
(declare-fun arrayNoDuplicates!0 (array!96503 (_ BitVec 32) List!33109) Bool)

(assert (=> b!1411830 (= res!949052 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33106))))

(assert (= (and start!121502 res!949049) b!1411827))

(assert (= (and b!1411827 res!949053) b!1411829))

(assert (= (and b!1411829 res!949054) b!1411826))

(assert (= (and b!1411826 res!949056) b!1411822))

(assert (= (and b!1411822 res!949051) b!1411830))

(assert (= (and b!1411830 res!949052) b!1411828))

(assert (= (and b!1411828 res!949057) b!1411824))

(assert (= (and b!1411828 (not res!949055)) b!1411825))

(assert (= (and b!1411825 (not res!949050)) b!1411823))

(declare-fun m!1301825 () Bool)

(assert (=> b!1411830 m!1301825))

(declare-fun m!1301827 () Bool)

(assert (=> b!1411822 m!1301827))

(declare-fun m!1301829 () Bool)

(assert (=> start!121502 m!1301829))

(declare-fun m!1301831 () Bool)

(assert (=> start!121502 m!1301831))

(declare-fun m!1301833 () Bool)

(assert (=> b!1411823 m!1301833))

(declare-fun m!1301835 () Bool)

(assert (=> b!1411823 m!1301835))

(declare-fun m!1301837 () Bool)

(assert (=> b!1411823 m!1301837))

(declare-fun m!1301839 () Bool)

(assert (=> b!1411824 m!1301839))

(assert (=> b!1411824 m!1301839))

(declare-fun m!1301841 () Bool)

(assert (=> b!1411824 m!1301841))

(assert (=> b!1411826 m!1301839))

(assert (=> b!1411826 m!1301839))

(declare-fun m!1301843 () Bool)

(assert (=> b!1411826 m!1301843))

(declare-fun m!1301845 () Bool)

(assert (=> b!1411825 m!1301845))

(assert (=> b!1411825 m!1301833))

(assert (=> b!1411825 m!1301845))

(declare-fun m!1301847 () Bool)

(assert (=> b!1411825 m!1301847))

(declare-fun m!1301849 () Bool)

(assert (=> b!1411825 m!1301849))

(declare-fun m!1301851 () Bool)

(assert (=> b!1411829 m!1301851))

(assert (=> b!1411829 m!1301851))

(declare-fun m!1301853 () Bool)

(assert (=> b!1411829 m!1301853))

(assert (=> b!1411828 m!1301839))

(declare-fun m!1301855 () Bool)

(assert (=> b!1411828 m!1301855))

(assert (=> b!1411828 m!1301839))

(assert (=> b!1411828 m!1301839))

(declare-fun m!1301857 () Bool)

(assert (=> b!1411828 m!1301857))

(declare-fun m!1301859 () Bool)

(assert (=> b!1411828 m!1301859))

(declare-fun m!1301861 () Bool)

(assert (=> b!1411828 m!1301861))

(check-sat (not start!121502) (not b!1411830) (not b!1411825) (not b!1411829) (not b!1411826) (not b!1411828) (not b!1411823) (not b!1411824) (not b!1411822))
(check-sat)
