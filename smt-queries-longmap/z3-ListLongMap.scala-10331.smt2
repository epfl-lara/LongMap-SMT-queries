; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121472 () Bool)

(assert start!121472)

(declare-fun b!1411417 () Bool)

(declare-fun res!948649 () Bool)

(declare-fun e!798713 () Bool)

(assert (=> b!1411417 (=> (not res!948649) (not e!798713))))

(declare-datatypes ((array!96473 0))(
  ( (array!96474 (arr!46575 (Array (_ BitVec 32) (_ BitVec 64))) (size!47125 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96473)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411417 (= res!948649 (validKeyInArray!0 (select (arr!46575 a!2901) i!1037)))))

(declare-fun b!1411418 () Bool)

(declare-fun e!798715 () Bool)

(declare-fun e!798716 () Bool)

(assert (=> b!1411418 (= e!798715 e!798716)))

(declare-fun res!948644 () Bool)

(assert (=> b!1411418 (=> res!948644 e!798716)))

(declare-datatypes ((SeekEntryResult!10886 0))(
  ( (MissingZero!10886 (index!45921 (_ BitVec 32))) (Found!10886 (index!45922 (_ BitVec 32))) (Intermediate!10886 (undefined!11698 Bool) (index!45923 (_ BitVec 32)) (x!127513 (_ BitVec 32))) (Undefined!10886) (MissingVacant!10886 (index!45924 (_ BitVec 32))) )
))
(declare-fun lt!621705 () SeekEntryResult!10886)

(declare-fun lt!621702 () SeekEntryResult!10886)

(get-info :version)

(assert (=> b!1411418 (= res!948644 (or (= lt!621705 lt!621702) (not ((_ is Intermediate!10886) lt!621702))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621701 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96473 (_ BitVec 32)) SeekEntryResult!10886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411418 (= lt!621702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621701 mask!2840) lt!621701 (array!96474 (store (arr!46575 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47125 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411418 (= lt!621701 (select (store (arr!46575 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411419 () Bool)

(declare-fun res!948645 () Bool)

(assert (=> b!1411419 (=> (not res!948645) (not e!798713))))

(assert (=> b!1411419 (= res!948645 (and (= (size!47125 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47125 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47125 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!798712 () Bool)

(declare-fun b!1411420 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96473 (_ BitVec 32)) SeekEntryResult!10886)

(assert (=> b!1411420 (= e!798712 (= (seekEntryOrOpen!0 (select (arr!46575 a!2901) j!112) a!2901 mask!2840) (Found!10886 j!112)))))

(declare-fun b!1411421 () Bool)

(assert (=> b!1411421 (= e!798716 (= (select (store (arr!46575 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45923 lt!621702)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1411421 (and (not (undefined!11698 lt!621702)) (= (index!45923 lt!621702) i!1037) (bvslt (x!127513 lt!621702) (x!127513 lt!621705)))))

(declare-fun lt!621700 () (_ BitVec 32))

(declare-datatypes ((Unit!47746 0))(
  ( (Unit!47747) )
))
(declare-fun lt!621703 () Unit!47746)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47746)

(assert (=> b!1411421 (= lt!621703 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621700 (x!127513 lt!621705) (index!45923 lt!621705) (x!127513 lt!621702) (index!45923 lt!621702) (undefined!11698 lt!621702) mask!2840))))

(declare-fun b!1411422 () Bool)

(assert (=> b!1411422 (= e!798713 (not e!798715))))

(declare-fun res!948646 () Bool)

(assert (=> b!1411422 (=> res!948646 e!798715)))

(assert (=> b!1411422 (= res!948646 (or (not ((_ is Intermediate!10886) lt!621705)) (undefined!11698 lt!621705)))))

(assert (=> b!1411422 e!798712))

(declare-fun res!948650 () Bool)

(assert (=> b!1411422 (=> (not res!948650) (not e!798712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96473 (_ BitVec 32)) Bool)

(assert (=> b!1411422 (= res!948650 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621704 () Unit!47746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47746)

(assert (=> b!1411422 (= lt!621704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411422 (= lt!621705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621700 (select (arr!46575 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411422 (= lt!621700 (toIndex!0 (select (arr!46575 a!2901) j!112) mask!2840))))

(declare-fun b!1411423 () Bool)

(declare-fun res!948648 () Bool)

(assert (=> b!1411423 (=> (not res!948648) (not e!798713))))

(assert (=> b!1411423 (= res!948648 (validKeyInArray!0 (select (arr!46575 a!2901) j!112)))))

(declare-fun res!948652 () Bool)

(assert (=> start!121472 (=> (not res!948652) (not e!798713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121472 (= res!948652 (validMask!0 mask!2840))))

(assert (=> start!121472 e!798713))

(assert (=> start!121472 true))

(declare-fun array_inv!35603 (array!96473) Bool)

(assert (=> start!121472 (array_inv!35603 a!2901)))

(declare-fun b!1411424 () Bool)

(declare-fun res!948647 () Bool)

(assert (=> b!1411424 (=> (not res!948647) (not e!798713))))

(declare-datatypes ((List!33094 0))(
  ( (Nil!33091) (Cons!33090 (h!34362 (_ BitVec 64)) (t!47788 List!33094)) )
))
(declare-fun arrayNoDuplicates!0 (array!96473 (_ BitVec 32) List!33094) Bool)

(assert (=> b!1411424 (= res!948647 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33091))))

(declare-fun b!1411425 () Bool)

(declare-fun res!948651 () Bool)

(assert (=> b!1411425 (=> (not res!948651) (not e!798713))))

(assert (=> b!1411425 (= res!948651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121472 res!948652) b!1411419))

(assert (= (and b!1411419 res!948645) b!1411417))

(assert (= (and b!1411417 res!948649) b!1411423))

(assert (= (and b!1411423 res!948648) b!1411425))

(assert (= (and b!1411425 res!948651) b!1411424))

(assert (= (and b!1411424 res!948647) b!1411422))

(assert (= (and b!1411422 res!948650) b!1411420))

(assert (= (and b!1411422 (not res!948646)) b!1411418))

(assert (= (and b!1411418 (not res!948644)) b!1411421))

(declare-fun m!1301255 () Bool)

(assert (=> start!121472 m!1301255))

(declare-fun m!1301257 () Bool)

(assert (=> start!121472 m!1301257))

(declare-fun m!1301259 () Bool)

(assert (=> b!1411418 m!1301259))

(declare-fun m!1301261 () Bool)

(assert (=> b!1411418 m!1301261))

(assert (=> b!1411418 m!1301259))

(declare-fun m!1301263 () Bool)

(assert (=> b!1411418 m!1301263))

(declare-fun m!1301265 () Bool)

(assert (=> b!1411418 m!1301265))

(declare-fun m!1301267 () Bool)

(assert (=> b!1411422 m!1301267))

(declare-fun m!1301269 () Bool)

(assert (=> b!1411422 m!1301269))

(assert (=> b!1411422 m!1301267))

(declare-fun m!1301271 () Bool)

(assert (=> b!1411422 m!1301271))

(assert (=> b!1411422 m!1301267))

(declare-fun m!1301273 () Bool)

(assert (=> b!1411422 m!1301273))

(declare-fun m!1301275 () Bool)

(assert (=> b!1411422 m!1301275))

(declare-fun m!1301277 () Bool)

(assert (=> b!1411424 m!1301277))

(assert (=> b!1411420 m!1301267))

(assert (=> b!1411420 m!1301267))

(declare-fun m!1301279 () Bool)

(assert (=> b!1411420 m!1301279))

(declare-fun m!1301281 () Bool)

(assert (=> b!1411425 m!1301281))

(assert (=> b!1411421 m!1301261))

(declare-fun m!1301283 () Bool)

(assert (=> b!1411421 m!1301283))

(declare-fun m!1301285 () Bool)

(assert (=> b!1411421 m!1301285))

(declare-fun m!1301287 () Bool)

(assert (=> b!1411417 m!1301287))

(assert (=> b!1411417 m!1301287))

(declare-fun m!1301289 () Bool)

(assert (=> b!1411417 m!1301289))

(assert (=> b!1411423 m!1301267))

(assert (=> b!1411423 m!1301267))

(declare-fun m!1301291 () Bool)

(assert (=> b!1411423 m!1301291))

(check-sat (not b!1411417) (not b!1411423) (not b!1411424) (not b!1411418) (not b!1411425) (not b!1411422) (not b!1411420) (not b!1411421) (not start!121472))
(check-sat)
