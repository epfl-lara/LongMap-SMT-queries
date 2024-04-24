; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121676 () Bool)

(assert start!121676)

(declare-fun b!1412773 () Bool)

(declare-fun res!949321 () Bool)

(declare-fun e!799574 () Bool)

(assert (=> b!1412773 (=> (not res!949321) (not e!799574))))

(declare-datatypes ((array!96599 0))(
  ( (array!96600 (arr!46636 (Array (_ BitVec 32) (_ BitVec 64))) (size!47187 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96599)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412773 (= res!949321 (validKeyInArray!0 (select (arr!46636 a!2901) j!112)))))

(declare-fun b!1412774 () Bool)

(declare-fun res!949318 () Bool)

(assert (=> b!1412774 (=> (not res!949318) (not e!799574))))

(declare-datatypes ((List!33142 0))(
  ( (Nil!33139) (Cons!33138 (h!34418 (_ BitVec 64)) (t!47828 List!33142)) )
))
(declare-fun arrayNoDuplicates!0 (array!96599 (_ BitVec 32) List!33142) Bool)

(assert (=> b!1412774 (= res!949318 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33139))))

(declare-fun b!1412775 () Bool)

(declare-fun res!949322 () Bool)

(assert (=> b!1412775 (=> (not res!949322) (not e!799574))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96599 (_ BitVec 32)) Bool)

(assert (=> b!1412775 (= res!949322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412776 () Bool)

(declare-fun e!799573 () Bool)

(declare-fun e!799571 () Bool)

(assert (=> b!1412776 (= e!799573 e!799571)))

(declare-fun res!949319 () Bool)

(assert (=> b!1412776 (=> res!949319 e!799571)))

(declare-datatypes ((SeekEntryResult!10850 0))(
  ( (MissingZero!10850 (index!45777 (_ BitVec 32))) (Found!10850 (index!45778 (_ BitVec 32))) (Intermediate!10850 (undefined!11662 Bool) (index!45779 (_ BitVec 32)) (x!127520 (_ BitVec 32))) (Undefined!10850) (MissingVacant!10850 (index!45780 (_ BitVec 32))) )
))
(declare-fun lt!622242 () SeekEntryResult!10850)

(declare-fun lt!622243 () SeekEntryResult!10850)

(get-info :version)

(assert (=> b!1412776 (= res!949319 (or (= lt!622242 lt!622243) (not ((_ is Intermediate!10850) lt!622243))))))

(declare-fun lt!622244 () (_ BitVec 64))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96599 (_ BitVec 32)) SeekEntryResult!10850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412776 (= lt!622243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622244 mask!2840) lt!622244 (array!96600 (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47187 a!2901)) mask!2840))))

(assert (=> b!1412776 (= lt!622244 (select (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1412777 () Bool)

(assert (=> b!1412777 (= e!799574 (not e!799573))))

(declare-fun res!949324 () Bool)

(assert (=> b!1412777 (=> res!949324 e!799573)))

(assert (=> b!1412777 (= res!949324 (or (not ((_ is Intermediate!10850) lt!622242)) (undefined!11662 lt!622242)))))

(declare-fun e!799570 () Bool)

(assert (=> b!1412777 e!799570))

(declare-fun res!949323 () Bool)

(assert (=> b!1412777 (=> (not res!949323) (not e!799570))))

(assert (=> b!1412777 (= res!949323 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47701 0))(
  ( (Unit!47702) )
))
(declare-fun lt!622246 () Unit!47701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47701)

(assert (=> b!1412777 (= lt!622246 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622247 () (_ BitVec 32))

(assert (=> b!1412777 (= lt!622242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622247 (select (arr!46636 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412777 (= lt!622247 (toIndex!0 (select (arr!46636 a!2901) j!112) mask!2840))))

(declare-fun res!949317 () Bool)

(assert (=> start!121676 (=> (not res!949317) (not e!799574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121676 (= res!949317 (validMask!0 mask!2840))))

(assert (=> start!121676 e!799574))

(assert (=> start!121676 true))

(declare-fun array_inv!35917 (array!96599) Bool)

(assert (=> start!121676 (array_inv!35917 a!2901)))

(declare-fun b!1412778 () Bool)

(declare-fun res!949320 () Bool)

(assert (=> b!1412778 (=> (not res!949320) (not e!799574))))

(assert (=> b!1412778 (= res!949320 (and (= (size!47187 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47187 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47187 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412779 () Bool)

(assert (=> b!1412779 (= e!799571 true)))

(assert (=> b!1412779 (and (not (undefined!11662 lt!622243)) (= (index!45779 lt!622243) i!1037) (bvslt (x!127520 lt!622243) (x!127520 lt!622242)) (= (select (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45779 lt!622243)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!622245 () Unit!47701)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47701)

(assert (=> b!1412779 (= lt!622245 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622247 (x!127520 lt!622242) (index!45779 lt!622242) (x!127520 lt!622243) (index!45779 lt!622243) (undefined!11662 lt!622243) mask!2840))))

(declare-fun b!1412780 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96599 (_ BitVec 32)) SeekEntryResult!10850)

(assert (=> b!1412780 (= e!799570 (= (seekEntryOrOpen!0 (select (arr!46636 a!2901) j!112) a!2901 mask!2840) (Found!10850 j!112)))))

(declare-fun b!1412781 () Bool)

(declare-fun res!949316 () Bool)

(assert (=> b!1412781 (=> (not res!949316) (not e!799574))))

(assert (=> b!1412781 (= res!949316 (validKeyInArray!0 (select (arr!46636 a!2901) i!1037)))))

(assert (= (and start!121676 res!949317) b!1412778))

(assert (= (and b!1412778 res!949320) b!1412781))

(assert (= (and b!1412781 res!949316) b!1412773))

(assert (= (and b!1412773 res!949321) b!1412775))

(assert (= (and b!1412775 res!949322) b!1412774))

(assert (= (and b!1412774 res!949318) b!1412777))

(assert (= (and b!1412777 res!949323) b!1412780))

(assert (= (and b!1412777 (not res!949324)) b!1412776))

(assert (= (and b!1412776 (not res!949319)) b!1412779))

(declare-fun m!1302931 () Bool)

(assert (=> b!1412773 m!1302931))

(assert (=> b!1412773 m!1302931))

(declare-fun m!1302933 () Bool)

(assert (=> b!1412773 m!1302933))

(declare-fun m!1302935 () Bool)

(assert (=> b!1412774 m!1302935))

(declare-fun m!1302937 () Bool)

(assert (=> b!1412775 m!1302937))

(declare-fun m!1302939 () Bool)

(assert (=> b!1412776 m!1302939))

(declare-fun m!1302941 () Bool)

(assert (=> b!1412776 m!1302941))

(assert (=> b!1412776 m!1302939))

(declare-fun m!1302943 () Bool)

(assert (=> b!1412776 m!1302943))

(declare-fun m!1302945 () Bool)

(assert (=> b!1412776 m!1302945))

(declare-fun m!1302947 () Bool)

(assert (=> b!1412781 m!1302947))

(assert (=> b!1412781 m!1302947))

(declare-fun m!1302949 () Bool)

(assert (=> b!1412781 m!1302949))

(declare-fun m!1302951 () Bool)

(assert (=> start!121676 m!1302951))

(declare-fun m!1302953 () Bool)

(assert (=> start!121676 m!1302953))

(assert (=> b!1412780 m!1302931))

(assert (=> b!1412780 m!1302931))

(declare-fun m!1302955 () Bool)

(assert (=> b!1412780 m!1302955))

(assert (=> b!1412779 m!1302941))

(declare-fun m!1302957 () Bool)

(assert (=> b!1412779 m!1302957))

(declare-fun m!1302959 () Bool)

(assert (=> b!1412779 m!1302959))

(assert (=> b!1412777 m!1302931))

(declare-fun m!1302961 () Bool)

(assert (=> b!1412777 m!1302961))

(assert (=> b!1412777 m!1302931))

(declare-fun m!1302963 () Bool)

(assert (=> b!1412777 m!1302963))

(assert (=> b!1412777 m!1302931))

(declare-fun m!1302965 () Bool)

(assert (=> b!1412777 m!1302965))

(declare-fun m!1302967 () Bool)

(assert (=> b!1412777 m!1302967))

(check-sat (not b!1412774) (not b!1412773) (not b!1412780) (not b!1412781) (not b!1412776) (not start!121676) (not b!1412777) (not b!1412779) (not b!1412775))
(check-sat)
