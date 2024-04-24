; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121832 () Bool)

(assert start!121832)

(declare-fun b!1414416 () Bool)

(declare-fun res!950731 () Bool)

(declare-fun e!800546 () Bool)

(assert (=> b!1414416 (=> (not res!950731) (not e!800546))))

(declare-datatypes ((array!96692 0))(
  ( (array!96693 (arr!46681 (Array (_ BitVec 32) (_ BitVec 64))) (size!47232 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96692)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414416 (= res!950731 (validKeyInArray!0 (select (arr!46681 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10895 0))(
  ( (MissingZero!10895 (index!45960 (_ BitVec 32))) (Found!10895 (index!45961 (_ BitVec 32))) (Intermediate!10895 (undefined!11707 Bool) (index!45962 (_ BitVec 32)) (x!127697 (_ BitVec 32))) (Undefined!10895) (MissingVacant!10895 (index!45963 (_ BitVec 32))) )
))
(declare-fun lt!623321 () SeekEntryResult!10895)

(declare-fun lt!623324 () (_ BitVec 64))

(declare-fun e!800542 () Bool)

(declare-fun lt!623318 () array!96692)

(declare-fun b!1414417 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96692 (_ BitVec 32)) SeekEntryResult!10895)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96692 (_ BitVec 32)) SeekEntryResult!10895)

(assert (=> b!1414417 (= e!800542 (= (seekEntryOrOpen!0 lt!623324 lt!623318 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127697 lt!623321) (index!45962 lt!623321) (index!45962 lt!623321) (select (arr!46681 a!2901) j!112) lt!623318 mask!2840)))))

(declare-fun b!1414418 () Bool)

(declare-fun res!950730 () Bool)

(assert (=> b!1414418 (=> (not res!950730) (not e!800546))))

(assert (=> b!1414418 (= res!950730 (and (= (size!47232 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47232 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47232 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!800545 () Bool)

(declare-fun b!1414419 () Bool)

(assert (=> b!1414419 (= e!800545 (= (seekEntryOrOpen!0 (select (arr!46681 a!2901) j!112) a!2901 mask!2840) (Found!10895 j!112)))))

(declare-fun b!1414420 () Bool)

(declare-fun e!800543 () Bool)

(assert (=> b!1414420 (= e!800546 (not e!800543))))

(declare-fun res!950729 () Bool)

(assert (=> b!1414420 (=> res!950729 e!800543)))

(declare-fun lt!623322 () SeekEntryResult!10895)

(get-info :version)

(assert (=> b!1414420 (= res!950729 (or (not ((_ is Intermediate!10895) lt!623322)) (undefined!11707 lt!623322)))))

(assert (=> b!1414420 e!800545))

(declare-fun res!950725 () Bool)

(assert (=> b!1414420 (=> (not res!950725) (not e!800545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96692 (_ BitVec 32)) Bool)

(assert (=> b!1414420 (= res!950725 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47791 0))(
  ( (Unit!47792) )
))
(declare-fun lt!623319 () Unit!47791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47791)

(assert (=> b!1414420 (= lt!623319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623320 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96692 (_ BitVec 32)) SeekEntryResult!10895)

(assert (=> b!1414420 (= lt!623322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623320 (select (arr!46681 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414420 (= lt!623320 (toIndex!0 (select (arr!46681 a!2901) j!112) mask!2840))))

(declare-fun b!1414421 () Bool)

(declare-fun res!950722 () Bool)

(assert (=> b!1414421 (=> (not res!950722) (not e!800546))))

(declare-datatypes ((List!33187 0))(
  ( (Nil!33184) (Cons!33183 (h!34466 (_ BitVec 64)) (t!47873 List!33187)) )
))
(declare-fun arrayNoDuplicates!0 (array!96692 (_ BitVec 32) List!33187) Bool)

(assert (=> b!1414421 (= res!950722 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33184))))

(declare-fun b!1414422 () Bool)

(declare-fun e!800544 () Bool)

(assert (=> b!1414422 (= e!800543 e!800544)))

(declare-fun res!950723 () Bool)

(assert (=> b!1414422 (=> res!950723 e!800544)))

(assert (=> b!1414422 (= res!950723 (or (= lt!623322 lt!623321) (not ((_ is Intermediate!10895) lt!623321))))))

(assert (=> b!1414422 (= lt!623321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623324 mask!2840) lt!623324 lt!623318 mask!2840))))

(assert (=> b!1414422 (= lt!623324 (select (store (arr!46681 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414422 (= lt!623318 (array!96693 (store (arr!46681 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47232 a!2901)))))

(declare-fun res!950726 () Bool)

(assert (=> start!121832 (=> (not res!950726) (not e!800546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121832 (= res!950726 (validMask!0 mask!2840))))

(assert (=> start!121832 e!800546))

(assert (=> start!121832 true))

(declare-fun array_inv!35962 (array!96692) Bool)

(assert (=> start!121832 (array_inv!35962 a!2901)))

(declare-fun b!1414423 () Bool)

(declare-fun res!950724 () Bool)

(assert (=> b!1414423 (=> (not res!950724) (not e!800546))))

(assert (=> b!1414423 (= res!950724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414424 () Bool)

(declare-fun res!950727 () Bool)

(assert (=> b!1414424 (=> (not res!950727) (not e!800546))))

(assert (=> b!1414424 (= res!950727 (validKeyInArray!0 (select (arr!46681 a!2901) j!112)))))

(declare-fun b!1414425 () Bool)

(assert (=> b!1414425 (= e!800544 true)))

(assert (=> b!1414425 e!800542))

(declare-fun res!950728 () Bool)

(assert (=> b!1414425 (=> (not res!950728) (not e!800542))))

(assert (=> b!1414425 (= res!950728 (and (not (undefined!11707 lt!623321)) (= (index!45962 lt!623321) i!1037) (bvslt (x!127697 lt!623321) (x!127697 lt!623322)) (= (select (store (arr!46681 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45962 lt!623321)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623323 () Unit!47791)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47791)

(assert (=> b!1414425 (= lt!623323 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623320 (x!127697 lt!623322) (index!45962 lt!623322) (x!127697 lt!623321) (index!45962 lt!623321) (undefined!11707 lt!623321) mask!2840))))

(assert (= (and start!121832 res!950726) b!1414418))

(assert (= (and b!1414418 res!950730) b!1414416))

(assert (= (and b!1414416 res!950731) b!1414424))

(assert (= (and b!1414424 res!950727) b!1414423))

(assert (= (and b!1414423 res!950724) b!1414421))

(assert (= (and b!1414421 res!950722) b!1414420))

(assert (= (and b!1414420 res!950725) b!1414419))

(assert (= (and b!1414420 (not res!950729)) b!1414422))

(assert (= (and b!1414422 (not res!950723)) b!1414425))

(assert (= (and b!1414425 res!950728) b!1414417))

(declare-fun m!1305007 () Bool)

(assert (=> b!1414425 m!1305007))

(declare-fun m!1305009 () Bool)

(assert (=> b!1414425 m!1305009))

(declare-fun m!1305011 () Bool)

(assert (=> b!1414425 m!1305011))

(declare-fun m!1305013 () Bool)

(assert (=> b!1414422 m!1305013))

(assert (=> b!1414422 m!1305013))

(declare-fun m!1305015 () Bool)

(assert (=> b!1414422 m!1305015))

(assert (=> b!1414422 m!1305007))

(declare-fun m!1305017 () Bool)

(assert (=> b!1414422 m!1305017))

(declare-fun m!1305019 () Bool)

(assert (=> start!121832 m!1305019))

(declare-fun m!1305021 () Bool)

(assert (=> start!121832 m!1305021))

(declare-fun m!1305023 () Bool)

(assert (=> b!1414417 m!1305023))

(declare-fun m!1305025 () Bool)

(assert (=> b!1414417 m!1305025))

(assert (=> b!1414417 m!1305025))

(declare-fun m!1305027 () Bool)

(assert (=> b!1414417 m!1305027))

(declare-fun m!1305029 () Bool)

(assert (=> b!1414421 m!1305029))

(assert (=> b!1414424 m!1305025))

(assert (=> b!1414424 m!1305025))

(declare-fun m!1305031 () Bool)

(assert (=> b!1414424 m!1305031))

(assert (=> b!1414420 m!1305025))

(declare-fun m!1305033 () Bool)

(assert (=> b!1414420 m!1305033))

(assert (=> b!1414420 m!1305025))

(declare-fun m!1305035 () Bool)

(assert (=> b!1414420 m!1305035))

(assert (=> b!1414420 m!1305025))

(declare-fun m!1305037 () Bool)

(assert (=> b!1414420 m!1305037))

(declare-fun m!1305039 () Bool)

(assert (=> b!1414420 m!1305039))

(declare-fun m!1305041 () Bool)

(assert (=> b!1414423 m!1305041))

(assert (=> b!1414419 m!1305025))

(assert (=> b!1414419 m!1305025))

(declare-fun m!1305043 () Bool)

(assert (=> b!1414419 m!1305043))

(declare-fun m!1305045 () Bool)

(assert (=> b!1414416 m!1305045))

(assert (=> b!1414416 m!1305045))

(declare-fun m!1305047 () Bool)

(assert (=> b!1414416 m!1305047))

(check-sat (not b!1414421) (not b!1414419) (not b!1414424) (not b!1414422) (not b!1414417) (not b!1414423) (not b!1414420) (not b!1414425) (not b!1414416) (not start!121832))
(check-sat)
