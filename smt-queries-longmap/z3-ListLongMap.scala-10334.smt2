; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121484 () Bool)

(assert start!121484)

(declare-fun b!1411552 () Bool)

(declare-fun res!948837 () Bool)

(declare-fun e!798797 () Bool)

(assert (=> b!1411552 (=> (not res!948837) (not e!798797))))

(declare-datatypes ((array!96438 0))(
  ( (array!96439 (arr!46558 (Array (_ BitVec 32) (_ BitVec 64))) (size!47110 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96438)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411552 (= res!948837 (validKeyInArray!0 (select (arr!46558 a!2901) i!1037)))))

(declare-fun b!1411553 () Bool)

(declare-fun e!798794 () Bool)

(assert (=> b!1411553 (= e!798797 (not e!798794))))

(declare-fun res!948832 () Bool)

(assert (=> b!1411553 (=> res!948832 e!798794)))

(declare-datatypes ((SeekEntryResult!10895 0))(
  ( (MissingZero!10895 (index!45957 (_ BitVec 32))) (Found!10895 (index!45958 (_ BitVec 32))) (Intermediate!10895 (undefined!11707 Bool) (index!45959 (_ BitVec 32)) (x!127543 (_ BitVec 32))) (Undefined!10895) (MissingVacant!10895 (index!45960 (_ BitVec 32))) )
))
(declare-fun lt!621657 () SeekEntryResult!10895)

(get-info :version)

(assert (=> b!1411553 (= res!948832 (or (not ((_ is Intermediate!10895) lt!621657)) (undefined!11707 lt!621657)))))

(declare-fun e!798796 () Bool)

(assert (=> b!1411553 e!798796))

(declare-fun res!948830 () Bool)

(assert (=> b!1411553 (=> (not res!948830) (not e!798796))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96438 (_ BitVec 32)) Bool)

(assert (=> b!1411553 (= res!948830 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47607 0))(
  ( (Unit!47608) )
))
(declare-fun lt!621656 () Unit!47607)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47607)

(assert (=> b!1411553 (= lt!621656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621655 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96438 (_ BitVec 32)) SeekEntryResult!10895)

(assert (=> b!1411553 (= lt!621657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621655 (select (arr!46558 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411553 (= lt!621655 (toIndex!0 (select (arr!46558 a!2901) j!112) mask!2840))))

(declare-fun b!1411554 () Bool)

(declare-fun e!798795 () Bool)

(assert (=> b!1411554 (= e!798794 e!798795)))

(declare-fun res!948838 () Bool)

(assert (=> b!1411554 (=> res!948838 e!798795)))

(declare-fun lt!621659 () SeekEntryResult!10895)

(assert (=> b!1411554 (= res!948838 (or (= lt!621657 lt!621659) (not ((_ is Intermediate!10895) lt!621659))))))

(declare-fun lt!621658 () (_ BitVec 64))

(assert (=> b!1411554 (= lt!621659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621658 mask!2840) lt!621658 (array!96439 (store (arr!46558 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47110 a!2901)) mask!2840))))

(assert (=> b!1411554 (= lt!621658 (select (store (arr!46558 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411555 () Bool)

(declare-fun res!948836 () Bool)

(assert (=> b!1411555 (=> (not res!948836) (not e!798797))))

(assert (=> b!1411555 (= res!948836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411556 () Bool)

(declare-fun res!948833 () Bool)

(assert (=> b!1411556 (=> (not res!948833) (not e!798797))))

(declare-datatypes ((List!33155 0))(
  ( (Nil!33152) (Cons!33151 (h!34423 (_ BitVec 64)) (t!47841 List!33155)) )
))
(declare-fun arrayNoDuplicates!0 (array!96438 (_ BitVec 32) List!33155) Bool)

(assert (=> b!1411556 (= res!948833 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33152))))

(declare-fun b!1411557 () Bool)

(assert (=> b!1411557 (= e!798795 true)))

(assert (=> b!1411557 (and (not (undefined!11707 lt!621659)) (= (index!45959 lt!621659) i!1037) (bvslt (x!127543 lt!621659) (x!127543 lt!621657)) (= (select (store (arr!46558 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45959 lt!621659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621654 () Unit!47607)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47607)

(assert (=> b!1411557 (= lt!621654 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621655 (x!127543 lt!621657) (index!45959 lt!621657) (x!127543 lt!621659) (index!45959 lt!621659) (undefined!11707 lt!621659) mask!2840))))

(declare-fun b!1411558 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96438 (_ BitVec 32)) SeekEntryResult!10895)

(assert (=> b!1411558 (= e!798796 (= (seekEntryOrOpen!0 (select (arr!46558 a!2901) j!112) a!2901 mask!2840) (Found!10895 j!112)))))

(declare-fun res!948831 () Bool)

(assert (=> start!121484 (=> (not res!948831) (not e!798797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121484 (= res!948831 (validMask!0 mask!2840))))

(assert (=> start!121484 e!798797))

(assert (=> start!121484 true))

(declare-fun array_inv!35791 (array!96438) Bool)

(assert (=> start!121484 (array_inv!35791 a!2901)))

(declare-fun b!1411559 () Bool)

(declare-fun res!948834 () Bool)

(assert (=> b!1411559 (=> (not res!948834) (not e!798797))))

(assert (=> b!1411559 (= res!948834 (validKeyInArray!0 (select (arr!46558 a!2901) j!112)))))

(declare-fun b!1411560 () Bool)

(declare-fun res!948835 () Bool)

(assert (=> b!1411560 (=> (not res!948835) (not e!798797))))

(assert (=> b!1411560 (= res!948835 (and (= (size!47110 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47110 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47110 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121484 res!948831) b!1411560))

(assert (= (and b!1411560 res!948835) b!1411552))

(assert (= (and b!1411552 res!948837) b!1411559))

(assert (= (and b!1411559 res!948834) b!1411555))

(assert (= (and b!1411555 res!948836) b!1411556))

(assert (= (and b!1411556 res!948833) b!1411553))

(assert (= (and b!1411553 res!948830) b!1411558))

(assert (= (and b!1411553 (not res!948832)) b!1411554))

(assert (= (and b!1411554 (not res!948838)) b!1411557))

(declare-fun m!1301023 () Bool)

(assert (=> b!1411559 m!1301023))

(assert (=> b!1411559 m!1301023))

(declare-fun m!1301025 () Bool)

(assert (=> b!1411559 m!1301025))

(declare-fun m!1301027 () Bool)

(assert (=> b!1411552 m!1301027))

(assert (=> b!1411552 m!1301027))

(declare-fun m!1301029 () Bool)

(assert (=> b!1411552 m!1301029))

(declare-fun m!1301031 () Bool)

(assert (=> b!1411556 m!1301031))

(declare-fun m!1301033 () Bool)

(assert (=> b!1411555 m!1301033))

(assert (=> b!1411553 m!1301023))

(declare-fun m!1301035 () Bool)

(assert (=> b!1411553 m!1301035))

(assert (=> b!1411553 m!1301023))

(assert (=> b!1411553 m!1301023))

(declare-fun m!1301037 () Bool)

(assert (=> b!1411553 m!1301037))

(declare-fun m!1301039 () Bool)

(assert (=> b!1411553 m!1301039))

(declare-fun m!1301041 () Bool)

(assert (=> b!1411553 m!1301041))

(declare-fun m!1301043 () Bool)

(assert (=> b!1411554 m!1301043))

(declare-fun m!1301045 () Bool)

(assert (=> b!1411554 m!1301045))

(assert (=> b!1411554 m!1301043))

(declare-fun m!1301047 () Bool)

(assert (=> b!1411554 m!1301047))

(declare-fun m!1301049 () Bool)

(assert (=> b!1411554 m!1301049))

(assert (=> b!1411557 m!1301045))

(declare-fun m!1301051 () Bool)

(assert (=> b!1411557 m!1301051))

(declare-fun m!1301053 () Bool)

(assert (=> b!1411557 m!1301053))

(assert (=> b!1411558 m!1301023))

(assert (=> b!1411558 m!1301023))

(declare-fun m!1301055 () Bool)

(assert (=> b!1411558 m!1301055))

(declare-fun m!1301057 () Bool)

(assert (=> start!121484 m!1301057))

(declare-fun m!1301059 () Bool)

(assert (=> start!121484 m!1301059))

(check-sat (not b!1411554) (not b!1411559) (not start!121484) (not b!1411555) (not b!1411552) (not b!1411556) (not b!1411553) (not b!1411558) (not b!1411557))
(check-sat)
