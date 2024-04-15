; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121628 () Bool)

(assert start!121628)

(declare-fun b!1413015 () Bool)

(declare-fun res!950063 () Bool)

(declare-fun e!799661 () Bool)

(assert (=> b!1413015 (=> (not res!950063) (not e!799661))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96519 0))(
  ( (array!96520 (arr!46597 (Array (_ BitVec 32) (_ BitVec 64))) (size!47149 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96519)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413015 (= res!950063 (and (= (size!47149 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47149 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47149 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413016 () Bool)

(declare-fun res!950056 () Bool)

(assert (=> b!1413016 (=> (not res!950056) (not e!799661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413016 (= res!950056 (validKeyInArray!0 (select (arr!46597 a!2901) i!1037)))))

(declare-fun e!799658 () Bool)

(declare-fun b!1413017 () Bool)

(declare-datatypes ((SeekEntryResult!10934 0))(
  ( (MissingZero!10934 (index!46116 (_ BitVec 32))) (Found!10934 (index!46117 (_ BitVec 32))) (Intermediate!10934 (undefined!11746 Bool) (index!46118 (_ BitVec 32)) (x!127698 (_ BitVec 32))) (Undefined!10934) (MissingVacant!10934 (index!46119 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96519 (_ BitVec 32)) SeekEntryResult!10934)

(assert (=> b!1413017 (= e!799658 (= (seekEntryOrOpen!0 (select (arr!46597 a!2901) j!112) a!2901 mask!2840) (Found!10934 j!112)))))

(declare-fun b!1413018 () Bool)

(declare-fun res!950059 () Bool)

(assert (=> b!1413018 (=> (not res!950059) (not e!799661))))

(assert (=> b!1413018 (= res!950059 (validKeyInArray!0 (select (arr!46597 a!2901) j!112)))))

(declare-fun b!1413019 () Bool)

(declare-fun e!799657 () Bool)

(declare-fun e!799659 () Bool)

(assert (=> b!1413019 (= e!799657 e!799659)))

(declare-fun res!950057 () Bool)

(assert (=> b!1413019 (=> res!950057 e!799659)))

(declare-fun lt!622606 () SeekEntryResult!10934)

(declare-fun lt!622609 () SeekEntryResult!10934)

(get-info :version)

(assert (=> b!1413019 (= res!950057 (or (= lt!622606 lt!622609) (not ((_ is Intermediate!10934) lt!622609))))))

(declare-fun lt!622607 () (_ BitVec 64))

(declare-fun lt!622605 () array!96519)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96519 (_ BitVec 32)) SeekEntryResult!10934)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413019 (= lt!622609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622607 mask!2840) lt!622607 lt!622605 mask!2840))))

(assert (=> b!1413019 (= lt!622607 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413019 (= lt!622605 (array!96520 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47149 a!2901)))))

(declare-fun b!1413020 () Bool)

(assert (=> b!1413020 (= e!799659 true)))

(declare-fun e!799656 () Bool)

(assert (=> b!1413020 e!799656))

(declare-fun res!950058 () Bool)

(assert (=> b!1413020 (=> (not res!950058) (not e!799656))))

(assert (=> b!1413020 (= res!950058 (and (not (undefined!11746 lt!622609)) (= (index!46118 lt!622609) i!1037) (bvslt (x!127698 lt!622609) (x!127698 lt!622606)) (= (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46118 lt!622609)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622610 () (_ BitVec 32))

(declare-datatypes ((Unit!47685 0))(
  ( (Unit!47686) )
))
(declare-fun lt!622604 () Unit!47685)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47685)

(assert (=> b!1413020 (= lt!622604 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622610 (x!127698 lt!622606) (index!46118 lt!622606) (x!127698 lt!622609) (index!46118 lt!622609) (undefined!11746 lt!622609) mask!2840))))

(declare-fun b!1413022 () Bool)

(assert (=> b!1413022 (= e!799661 (not e!799657))))

(declare-fun res!950061 () Bool)

(assert (=> b!1413022 (=> res!950061 e!799657)))

(assert (=> b!1413022 (= res!950061 (or (not ((_ is Intermediate!10934) lt!622606)) (undefined!11746 lt!622606)))))

(assert (=> b!1413022 e!799658))

(declare-fun res!950065 () Bool)

(assert (=> b!1413022 (=> (not res!950065) (not e!799658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96519 (_ BitVec 32)) Bool)

(assert (=> b!1413022 (= res!950065 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622608 () Unit!47685)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47685)

(assert (=> b!1413022 (= lt!622608 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413022 (= lt!622606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622610 (select (arr!46597 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413022 (= lt!622610 (toIndex!0 (select (arr!46597 a!2901) j!112) mask!2840))))

(declare-fun b!1413023 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96519 (_ BitVec 32)) SeekEntryResult!10934)

(assert (=> b!1413023 (= e!799656 (= (seekEntryOrOpen!0 lt!622607 lt!622605 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127698 lt!622609) (index!46118 lt!622609) (index!46118 lt!622609) (select (arr!46597 a!2901) j!112) lt!622605 mask!2840)))))

(declare-fun b!1413024 () Bool)

(declare-fun res!950064 () Bool)

(assert (=> b!1413024 (=> (not res!950064) (not e!799661))))

(assert (=> b!1413024 (= res!950064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413021 () Bool)

(declare-fun res!950060 () Bool)

(assert (=> b!1413021 (=> (not res!950060) (not e!799661))))

(declare-datatypes ((List!33194 0))(
  ( (Nil!33191) (Cons!33190 (h!34465 (_ BitVec 64)) (t!47880 List!33194)) )
))
(declare-fun arrayNoDuplicates!0 (array!96519 (_ BitVec 32) List!33194) Bool)

(assert (=> b!1413021 (= res!950060 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33191))))

(declare-fun res!950062 () Bool)

(assert (=> start!121628 (=> (not res!950062) (not e!799661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121628 (= res!950062 (validMask!0 mask!2840))))

(assert (=> start!121628 e!799661))

(assert (=> start!121628 true))

(declare-fun array_inv!35830 (array!96519) Bool)

(assert (=> start!121628 (array_inv!35830 a!2901)))

(assert (= (and start!121628 res!950062) b!1413015))

(assert (= (and b!1413015 res!950063) b!1413016))

(assert (= (and b!1413016 res!950056) b!1413018))

(assert (= (and b!1413018 res!950059) b!1413024))

(assert (= (and b!1413024 res!950064) b!1413021))

(assert (= (and b!1413021 res!950060) b!1413022))

(assert (= (and b!1413022 res!950065) b!1413017))

(assert (= (and b!1413022 (not res!950061)) b!1413019))

(assert (= (and b!1413019 (not res!950057)) b!1413020))

(assert (= (and b!1413020 res!950058) b!1413023))

(declare-fun m!1302847 () Bool)

(assert (=> b!1413021 m!1302847))

(declare-fun m!1302849 () Bool)

(assert (=> b!1413017 m!1302849))

(assert (=> b!1413017 m!1302849))

(declare-fun m!1302851 () Bool)

(assert (=> b!1413017 m!1302851))

(declare-fun m!1302853 () Bool)

(assert (=> start!121628 m!1302853))

(declare-fun m!1302855 () Bool)

(assert (=> start!121628 m!1302855))

(declare-fun m!1302857 () Bool)

(assert (=> b!1413020 m!1302857))

(declare-fun m!1302859 () Bool)

(assert (=> b!1413020 m!1302859))

(declare-fun m!1302861 () Bool)

(assert (=> b!1413020 m!1302861))

(declare-fun m!1302863 () Bool)

(assert (=> b!1413023 m!1302863))

(assert (=> b!1413023 m!1302849))

(assert (=> b!1413023 m!1302849))

(declare-fun m!1302865 () Bool)

(assert (=> b!1413023 m!1302865))

(assert (=> b!1413018 m!1302849))

(assert (=> b!1413018 m!1302849))

(declare-fun m!1302867 () Bool)

(assert (=> b!1413018 m!1302867))

(declare-fun m!1302869 () Bool)

(assert (=> b!1413016 m!1302869))

(assert (=> b!1413016 m!1302869))

(declare-fun m!1302871 () Bool)

(assert (=> b!1413016 m!1302871))

(declare-fun m!1302873 () Bool)

(assert (=> b!1413024 m!1302873))

(declare-fun m!1302875 () Bool)

(assert (=> b!1413019 m!1302875))

(assert (=> b!1413019 m!1302875))

(declare-fun m!1302877 () Bool)

(assert (=> b!1413019 m!1302877))

(assert (=> b!1413019 m!1302857))

(declare-fun m!1302879 () Bool)

(assert (=> b!1413019 m!1302879))

(assert (=> b!1413022 m!1302849))

(declare-fun m!1302881 () Bool)

(assert (=> b!1413022 m!1302881))

(assert (=> b!1413022 m!1302849))

(declare-fun m!1302883 () Bool)

(assert (=> b!1413022 m!1302883))

(assert (=> b!1413022 m!1302849))

(declare-fun m!1302885 () Bool)

(assert (=> b!1413022 m!1302885))

(declare-fun m!1302887 () Bool)

(assert (=> b!1413022 m!1302887))

(check-sat (not b!1413018) (not b!1413016) (not b!1413023) (not b!1413020) (not b!1413019) (not b!1413024) (not b!1413017) (not b!1413022) (not b!1413021) (not start!121628))
(check-sat)
