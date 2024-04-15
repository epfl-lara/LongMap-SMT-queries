; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121490 () Bool)

(assert start!121490)

(declare-fun b!1411633 () Bool)

(declare-fun e!798841 () Bool)

(assert (=> b!1411633 (= e!798841 true)))

(declare-datatypes ((array!96444 0))(
  ( (array!96445 (arr!46561 (Array (_ BitVec 32) (_ BitVec 64))) (size!47113 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96444)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10898 0))(
  ( (MissingZero!10898 (index!45969 (_ BitVec 32))) (Found!10898 (index!45970 (_ BitVec 32))) (Intermediate!10898 (undefined!11710 Bool) (index!45971 (_ BitVec 32)) (x!127554 (_ BitVec 32))) (Undefined!10898) (MissingVacant!10898 (index!45972 (_ BitVec 32))) )
))
(declare-fun lt!621713 () SeekEntryResult!10898)

(declare-fun lt!621710 () SeekEntryResult!10898)

(assert (=> b!1411633 (and (not (undefined!11710 lt!621710)) (= (index!45971 lt!621710) i!1037) (bvslt (x!127554 lt!621710) (x!127554 lt!621713)) (= (select (store (arr!46561 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45971 lt!621710)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47613 0))(
  ( (Unit!47614) )
))
(declare-fun lt!621708 () Unit!47613)

(declare-fun lt!621712 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47613)

(assert (=> b!1411633 (= lt!621708 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621712 (x!127554 lt!621713) (index!45971 lt!621713) (x!127554 lt!621710) (index!45971 lt!621710) (undefined!11710 lt!621710) mask!2840))))

(declare-fun b!1411634 () Bool)

(declare-fun res!948914 () Bool)

(declare-fun e!798839 () Bool)

(assert (=> b!1411634 (=> (not res!948914) (not e!798839))))

(declare-datatypes ((List!33158 0))(
  ( (Nil!33155) (Cons!33154 (h!34426 (_ BitVec 64)) (t!47844 List!33158)) )
))
(declare-fun arrayNoDuplicates!0 (array!96444 (_ BitVec 32) List!33158) Bool)

(assert (=> b!1411634 (= res!948914 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33155))))

(declare-fun b!1411635 () Bool)

(declare-fun e!798842 () Bool)

(assert (=> b!1411635 (= e!798839 (not e!798842))))

(declare-fun res!948913 () Bool)

(assert (=> b!1411635 (=> res!948913 e!798842)))

(get-info :version)

(assert (=> b!1411635 (= res!948913 (or (not ((_ is Intermediate!10898) lt!621713)) (undefined!11710 lt!621713)))))

(declare-fun e!798838 () Bool)

(assert (=> b!1411635 e!798838))

(declare-fun res!948917 () Bool)

(assert (=> b!1411635 (=> (not res!948917) (not e!798838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96444 (_ BitVec 32)) Bool)

(assert (=> b!1411635 (= res!948917 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621711 () Unit!47613)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47613)

(assert (=> b!1411635 (= lt!621711 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96444 (_ BitVec 32)) SeekEntryResult!10898)

(assert (=> b!1411635 (= lt!621713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621712 (select (arr!46561 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411635 (= lt!621712 (toIndex!0 (select (arr!46561 a!2901) j!112) mask!2840))))

(declare-fun b!1411636 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96444 (_ BitVec 32)) SeekEntryResult!10898)

(assert (=> b!1411636 (= e!798838 (= (seekEntryOrOpen!0 (select (arr!46561 a!2901) j!112) a!2901 mask!2840) (Found!10898 j!112)))))

(declare-fun b!1411637 () Bool)

(declare-fun res!948918 () Bool)

(assert (=> b!1411637 (=> (not res!948918) (not e!798839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411637 (= res!948918 (validKeyInArray!0 (select (arr!46561 a!2901) j!112)))))

(declare-fun b!1411638 () Bool)

(assert (=> b!1411638 (= e!798842 e!798841)))

(declare-fun res!948916 () Bool)

(assert (=> b!1411638 (=> res!948916 e!798841)))

(assert (=> b!1411638 (= res!948916 (or (= lt!621713 lt!621710) (not ((_ is Intermediate!10898) lt!621710))))))

(declare-fun lt!621709 () (_ BitVec 64))

(assert (=> b!1411638 (= lt!621710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621709 mask!2840) lt!621709 (array!96445 (store (arr!46561 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47113 a!2901)) mask!2840))))

(assert (=> b!1411638 (= lt!621709 (select (store (arr!46561 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411639 () Bool)

(declare-fun res!948912 () Bool)

(assert (=> b!1411639 (=> (not res!948912) (not e!798839))))

(assert (=> b!1411639 (= res!948912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!948915 () Bool)

(assert (=> start!121490 (=> (not res!948915) (not e!798839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121490 (= res!948915 (validMask!0 mask!2840))))

(assert (=> start!121490 e!798839))

(assert (=> start!121490 true))

(declare-fun array_inv!35794 (array!96444) Bool)

(assert (=> start!121490 (array_inv!35794 a!2901)))

(declare-fun b!1411640 () Bool)

(declare-fun res!948919 () Bool)

(assert (=> b!1411640 (=> (not res!948919) (not e!798839))))

(assert (=> b!1411640 (= res!948919 (validKeyInArray!0 (select (arr!46561 a!2901) i!1037)))))

(declare-fun b!1411641 () Bool)

(declare-fun res!948911 () Bool)

(assert (=> b!1411641 (=> (not res!948911) (not e!798839))))

(assert (=> b!1411641 (= res!948911 (and (= (size!47113 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47113 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47113 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121490 res!948915) b!1411641))

(assert (= (and b!1411641 res!948911) b!1411640))

(assert (= (and b!1411640 res!948919) b!1411637))

(assert (= (and b!1411637 res!948918) b!1411639))

(assert (= (and b!1411639 res!948912) b!1411634))

(assert (= (and b!1411634 res!948914) b!1411635))

(assert (= (and b!1411635 res!948917) b!1411636))

(assert (= (and b!1411635 (not res!948913)) b!1411638))

(assert (= (and b!1411638 (not res!948916)) b!1411633))

(declare-fun m!1301137 () Bool)

(assert (=> b!1411637 m!1301137))

(assert (=> b!1411637 m!1301137))

(declare-fun m!1301139 () Bool)

(assert (=> b!1411637 m!1301139))

(declare-fun m!1301141 () Bool)

(assert (=> start!121490 m!1301141))

(declare-fun m!1301143 () Bool)

(assert (=> start!121490 m!1301143))

(declare-fun m!1301145 () Bool)

(assert (=> b!1411639 m!1301145))

(assert (=> b!1411635 m!1301137))

(declare-fun m!1301147 () Bool)

(assert (=> b!1411635 m!1301147))

(declare-fun m!1301149 () Bool)

(assert (=> b!1411635 m!1301149))

(declare-fun m!1301151 () Bool)

(assert (=> b!1411635 m!1301151))

(assert (=> b!1411635 m!1301137))

(declare-fun m!1301153 () Bool)

(assert (=> b!1411635 m!1301153))

(assert (=> b!1411635 m!1301137))

(declare-fun m!1301155 () Bool)

(assert (=> b!1411634 m!1301155))

(declare-fun m!1301157 () Bool)

(assert (=> b!1411638 m!1301157))

(declare-fun m!1301159 () Bool)

(assert (=> b!1411638 m!1301159))

(assert (=> b!1411638 m!1301157))

(declare-fun m!1301161 () Bool)

(assert (=> b!1411638 m!1301161))

(declare-fun m!1301163 () Bool)

(assert (=> b!1411638 m!1301163))

(assert (=> b!1411636 m!1301137))

(assert (=> b!1411636 m!1301137))

(declare-fun m!1301165 () Bool)

(assert (=> b!1411636 m!1301165))

(assert (=> b!1411633 m!1301159))

(declare-fun m!1301167 () Bool)

(assert (=> b!1411633 m!1301167))

(declare-fun m!1301169 () Bool)

(assert (=> b!1411633 m!1301169))

(declare-fun m!1301171 () Bool)

(assert (=> b!1411640 m!1301171))

(assert (=> b!1411640 m!1301171))

(declare-fun m!1301173 () Bool)

(assert (=> b!1411640 m!1301173))

(check-sat (not b!1411638) (not b!1411639) (not b!1411635) (not b!1411640) (not b!1411634) (not b!1411637) (not b!1411636) (not b!1411633) (not start!121490))
(check-sat)
