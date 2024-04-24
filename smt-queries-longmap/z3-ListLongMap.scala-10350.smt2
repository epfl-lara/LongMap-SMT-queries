; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121838 () Bool)

(assert start!121838)

(declare-fun b!1414506 () Bool)

(declare-fun e!800598 () Bool)

(declare-fun e!800595 () Bool)

(assert (=> b!1414506 (= e!800598 e!800595)))

(declare-fun res!950820 () Bool)

(assert (=> b!1414506 (=> res!950820 e!800595)))

(declare-datatypes ((SeekEntryResult!10898 0))(
  ( (MissingZero!10898 (index!45972 (_ BitVec 32))) (Found!10898 (index!45973 (_ BitVec 32))) (Intermediate!10898 (undefined!11710 Bool) (index!45974 (_ BitVec 32)) (x!127708 (_ BitVec 32))) (Undefined!10898) (MissingVacant!10898 (index!45975 (_ BitVec 32))) )
))
(declare-fun lt!623385 () SeekEntryResult!10898)

(declare-fun lt!623387 () SeekEntryResult!10898)

(get-info :version)

(assert (=> b!1414506 (= res!950820 (or (= lt!623385 lt!623387) (not ((_ is Intermediate!10898) lt!623387))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!623382 () (_ BitVec 64))

(declare-datatypes ((array!96698 0))(
  ( (array!96699 (arr!46684 (Array (_ BitVec 32) (_ BitVec 64))) (size!47235 (_ BitVec 32))) )
))
(declare-fun lt!623384 () array!96698)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96698 (_ BitVec 32)) SeekEntryResult!10898)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414506 (= lt!623387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623382 mask!2840) lt!623382 lt!623384 mask!2840))))

(declare-fun a!2901 () array!96698)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1414506 (= lt!623382 (select (store (arr!46684 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414506 (= lt!623384 (array!96699 (store (arr!46684 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47235 a!2901)))))

(declare-fun b!1414507 () Bool)

(declare-fun e!800600 () Bool)

(assert (=> b!1414507 (= e!800600 (not e!800598))))

(declare-fun res!950815 () Bool)

(assert (=> b!1414507 (=> res!950815 e!800598)))

(assert (=> b!1414507 (= res!950815 (or (not ((_ is Intermediate!10898) lt!623385)) (undefined!11710 lt!623385)))))

(declare-fun e!800599 () Bool)

(assert (=> b!1414507 e!800599))

(declare-fun res!950817 () Bool)

(assert (=> b!1414507 (=> (not res!950817) (not e!800599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96698 (_ BitVec 32)) Bool)

(assert (=> b!1414507 (= res!950817 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47797 0))(
  ( (Unit!47798) )
))
(declare-fun lt!623386 () Unit!47797)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47797)

(assert (=> b!1414507 (= lt!623386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623381 () (_ BitVec 32))

(assert (=> b!1414507 (= lt!623385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623381 (select (arr!46684 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414507 (= lt!623381 (toIndex!0 (select (arr!46684 a!2901) j!112) mask!2840))))

(declare-fun b!1414508 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96698 (_ BitVec 32)) SeekEntryResult!10898)

(assert (=> b!1414508 (= e!800599 (= (seekEntryOrOpen!0 (select (arr!46684 a!2901) j!112) a!2901 mask!2840) (Found!10898 j!112)))))

(declare-fun b!1414509 () Bool)

(assert (=> b!1414509 (= e!800595 true)))

(declare-fun e!800597 () Bool)

(assert (=> b!1414509 e!800597))

(declare-fun res!950816 () Bool)

(assert (=> b!1414509 (=> (not res!950816) (not e!800597))))

(assert (=> b!1414509 (= res!950816 (and (not (undefined!11710 lt!623387)) (= (index!45974 lt!623387) i!1037) (bvslt (x!127708 lt!623387) (x!127708 lt!623385)) (= (select (store (arr!46684 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45974 lt!623387)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623383 () Unit!47797)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47797)

(assert (=> b!1414509 (= lt!623383 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623381 (x!127708 lt!623385) (index!45974 lt!623385) (x!127708 lt!623387) (index!45974 lt!623387) (undefined!11710 lt!623387) mask!2840))))

(declare-fun b!1414510 () Bool)

(declare-fun res!950818 () Bool)

(assert (=> b!1414510 (=> (not res!950818) (not e!800600))))

(assert (=> b!1414510 (= res!950818 (and (= (size!47235 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47235 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47235 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414511 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96698 (_ BitVec 32)) SeekEntryResult!10898)

(assert (=> b!1414511 (= e!800597 (= (seekEntryOrOpen!0 lt!623382 lt!623384 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127708 lt!623387) (index!45974 lt!623387) (index!45974 lt!623387) (select (arr!46684 a!2901) j!112) lt!623384 mask!2840)))))

(declare-fun b!1414512 () Bool)

(declare-fun res!950814 () Bool)

(assert (=> b!1414512 (=> (not res!950814) (not e!800600))))

(assert (=> b!1414512 (= res!950814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414513 () Bool)

(declare-fun res!950821 () Bool)

(assert (=> b!1414513 (=> (not res!950821) (not e!800600))))

(declare-datatypes ((List!33190 0))(
  ( (Nil!33187) (Cons!33186 (h!34469 (_ BitVec 64)) (t!47876 List!33190)) )
))
(declare-fun arrayNoDuplicates!0 (array!96698 (_ BitVec 32) List!33190) Bool)

(assert (=> b!1414513 (= res!950821 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33187))))

(declare-fun res!950813 () Bool)

(assert (=> start!121838 (=> (not res!950813) (not e!800600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121838 (= res!950813 (validMask!0 mask!2840))))

(assert (=> start!121838 e!800600))

(assert (=> start!121838 true))

(declare-fun array_inv!35965 (array!96698) Bool)

(assert (=> start!121838 (array_inv!35965 a!2901)))

(declare-fun b!1414514 () Bool)

(declare-fun res!950812 () Bool)

(assert (=> b!1414514 (=> (not res!950812) (not e!800600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414514 (= res!950812 (validKeyInArray!0 (select (arr!46684 a!2901) j!112)))))

(declare-fun b!1414515 () Bool)

(declare-fun res!950819 () Bool)

(assert (=> b!1414515 (=> (not res!950819) (not e!800600))))

(assert (=> b!1414515 (= res!950819 (validKeyInArray!0 (select (arr!46684 a!2901) i!1037)))))

(assert (= (and start!121838 res!950813) b!1414510))

(assert (= (and b!1414510 res!950818) b!1414515))

(assert (= (and b!1414515 res!950819) b!1414514))

(assert (= (and b!1414514 res!950812) b!1414512))

(assert (= (and b!1414512 res!950814) b!1414513))

(assert (= (and b!1414513 res!950821) b!1414507))

(assert (= (and b!1414507 res!950817) b!1414508))

(assert (= (and b!1414507 (not res!950815)) b!1414506))

(assert (= (and b!1414506 (not res!950820)) b!1414509))

(assert (= (and b!1414509 res!950816) b!1414511))

(declare-fun m!1305133 () Bool)

(assert (=> b!1414515 m!1305133))

(assert (=> b!1414515 m!1305133))

(declare-fun m!1305135 () Bool)

(assert (=> b!1414515 m!1305135))

(declare-fun m!1305137 () Bool)

(assert (=> b!1414507 m!1305137))

(declare-fun m!1305139 () Bool)

(assert (=> b!1414507 m!1305139))

(assert (=> b!1414507 m!1305137))

(declare-fun m!1305141 () Bool)

(assert (=> b!1414507 m!1305141))

(assert (=> b!1414507 m!1305137))

(declare-fun m!1305143 () Bool)

(assert (=> b!1414507 m!1305143))

(declare-fun m!1305145 () Bool)

(assert (=> b!1414507 m!1305145))

(assert (=> b!1414514 m!1305137))

(assert (=> b!1414514 m!1305137))

(declare-fun m!1305147 () Bool)

(assert (=> b!1414514 m!1305147))

(declare-fun m!1305149 () Bool)

(assert (=> b!1414506 m!1305149))

(assert (=> b!1414506 m!1305149))

(declare-fun m!1305151 () Bool)

(assert (=> b!1414506 m!1305151))

(declare-fun m!1305153 () Bool)

(assert (=> b!1414506 m!1305153))

(declare-fun m!1305155 () Bool)

(assert (=> b!1414506 m!1305155))

(assert (=> b!1414509 m!1305153))

(declare-fun m!1305157 () Bool)

(assert (=> b!1414509 m!1305157))

(declare-fun m!1305159 () Bool)

(assert (=> b!1414509 m!1305159))

(declare-fun m!1305161 () Bool)

(assert (=> b!1414512 m!1305161))

(declare-fun m!1305163 () Bool)

(assert (=> start!121838 m!1305163))

(declare-fun m!1305165 () Bool)

(assert (=> start!121838 m!1305165))

(declare-fun m!1305167 () Bool)

(assert (=> b!1414513 m!1305167))

(declare-fun m!1305169 () Bool)

(assert (=> b!1414511 m!1305169))

(assert (=> b!1414511 m!1305137))

(assert (=> b!1414511 m!1305137))

(declare-fun m!1305171 () Bool)

(assert (=> b!1414511 m!1305171))

(assert (=> b!1414508 m!1305137))

(assert (=> b!1414508 m!1305137))

(declare-fun m!1305173 () Bool)

(assert (=> b!1414508 m!1305173))

(check-sat (not b!1414506) (not b!1414513) (not b!1414512) (not b!1414514) (not b!1414507) (not start!121838) (not b!1414511) (not b!1414515) (not b!1414508) (not b!1414509))
(check-sat)
