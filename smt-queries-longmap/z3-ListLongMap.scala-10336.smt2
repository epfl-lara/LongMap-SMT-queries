; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121496 () Bool)

(assert start!121496)

(declare-fun b!1411714 () Bool)

(declare-fun res!948992 () Bool)

(declare-fun e!798885 () Bool)

(assert (=> b!1411714 (=> (not res!948992) (not e!798885))))

(declare-datatypes ((array!96450 0))(
  ( (array!96451 (arr!46564 (Array (_ BitVec 32) (_ BitVec 64))) (size!47116 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96450)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96450 (_ BitVec 32)) Bool)

(assert (=> b!1411714 (= res!948992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411715 () Bool)

(declare-fun res!948997 () Bool)

(assert (=> b!1411715 (=> (not res!948997) (not e!798885))))

(declare-datatypes ((List!33161 0))(
  ( (Nil!33158) (Cons!33157 (h!34429 (_ BitVec 64)) (t!47847 List!33161)) )
))
(declare-fun arrayNoDuplicates!0 (array!96450 (_ BitVec 32) List!33161) Bool)

(assert (=> b!1411715 (= res!948997 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33158))))

(declare-fun b!1411716 () Bool)

(declare-fun e!798887 () Bool)

(assert (=> b!1411716 (= e!798885 (not e!798887))))

(declare-fun res!948996 () Bool)

(assert (=> b!1411716 (=> res!948996 e!798887)))

(declare-datatypes ((SeekEntryResult!10901 0))(
  ( (MissingZero!10901 (index!45981 (_ BitVec 32))) (Found!10901 (index!45982 (_ BitVec 32))) (Intermediate!10901 (undefined!11713 Bool) (index!45983 (_ BitVec 32)) (x!127565 (_ BitVec 32))) (Undefined!10901) (MissingVacant!10901 (index!45984 (_ BitVec 32))) )
))
(declare-fun lt!621763 () SeekEntryResult!10901)

(get-info :version)

(assert (=> b!1411716 (= res!948996 (or (not ((_ is Intermediate!10901) lt!621763)) (undefined!11713 lt!621763)))))

(declare-fun e!798886 () Bool)

(assert (=> b!1411716 e!798886))

(declare-fun res!948995 () Bool)

(assert (=> b!1411716 (=> (not res!948995) (not e!798886))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411716 (= res!948995 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47619 0))(
  ( (Unit!47620) )
))
(declare-fun lt!621762 () Unit!47619)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47619)

(assert (=> b!1411716 (= lt!621762 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621764 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96450 (_ BitVec 32)) SeekEntryResult!10901)

(assert (=> b!1411716 (= lt!621763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621764 (select (arr!46564 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411716 (= lt!621764 (toIndex!0 (select (arr!46564 a!2901) j!112) mask!2840))))

(declare-fun b!1411717 () Bool)

(declare-fun e!798884 () Bool)

(assert (=> b!1411717 (= e!798884 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621766 () SeekEntryResult!10901)

(assert (=> b!1411717 (and (not (undefined!11713 lt!621766)) (= (index!45983 lt!621766) i!1037) (bvslt (x!127565 lt!621766) (x!127565 lt!621763)) (= (select (store (arr!46564 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45983 lt!621766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621765 () Unit!47619)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47619)

(assert (=> b!1411717 (= lt!621765 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621764 (x!127565 lt!621763) (index!45983 lt!621763) (x!127565 lt!621766) (index!45983 lt!621766) (undefined!11713 lt!621766) mask!2840))))

(declare-fun b!1411718 () Bool)

(declare-fun res!948998 () Bool)

(assert (=> b!1411718 (=> (not res!948998) (not e!798885))))

(assert (=> b!1411718 (= res!948998 (and (= (size!47116 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47116 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47116 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411719 () Bool)

(assert (=> b!1411719 (= e!798887 e!798884)))

(declare-fun res!949000 () Bool)

(assert (=> b!1411719 (=> res!949000 e!798884)))

(assert (=> b!1411719 (= res!949000 (or (= lt!621763 lt!621766) (not ((_ is Intermediate!10901) lt!621766))))))

(declare-fun lt!621767 () (_ BitVec 64))

(assert (=> b!1411719 (= lt!621766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621767 mask!2840) lt!621767 (array!96451 (store (arr!46564 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47116 a!2901)) mask!2840))))

(assert (=> b!1411719 (= lt!621767 (select (store (arr!46564 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun res!948994 () Bool)

(assert (=> start!121496 (=> (not res!948994) (not e!798885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121496 (= res!948994 (validMask!0 mask!2840))))

(assert (=> start!121496 e!798885))

(assert (=> start!121496 true))

(declare-fun array_inv!35797 (array!96450) Bool)

(assert (=> start!121496 (array_inv!35797 a!2901)))

(declare-fun b!1411720 () Bool)

(declare-fun res!948999 () Bool)

(assert (=> b!1411720 (=> (not res!948999) (not e!798885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411720 (= res!948999 (validKeyInArray!0 (select (arr!46564 a!2901) j!112)))))

(declare-fun b!1411721 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96450 (_ BitVec 32)) SeekEntryResult!10901)

(assert (=> b!1411721 (= e!798886 (= (seekEntryOrOpen!0 (select (arr!46564 a!2901) j!112) a!2901 mask!2840) (Found!10901 j!112)))))

(declare-fun b!1411722 () Bool)

(declare-fun res!948993 () Bool)

(assert (=> b!1411722 (=> (not res!948993) (not e!798885))))

(assert (=> b!1411722 (= res!948993 (validKeyInArray!0 (select (arr!46564 a!2901) i!1037)))))

(assert (= (and start!121496 res!948994) b!1411718))

(assert (= (and b!1411718 res!948998) b!1411722))

(assert (= (and b!1411722 res!948993) b!1411720))

(assert (= (and b!1411720 res!948999) b!1411714))

(assert (= (and b!1411714 res!948992) b!1411715))

(assert (= (and b!1411715 res!948997) b!1411716))

(assert (= (and b!1411716 res!948995) b!1411721))

(assert (= (and b!1411716 (not res!948996)) b!1411719))

(assert (= (and b!1411719 (not res!949000)) b!1411717))

(declare-fun m!1301251 () Bool)

(assert (=> b!1411721 m!1301251))

(assert (=> b!1411721 m!1301251))

(declare-fun m!1301253 () Bool)

(assert (=> b!1411721 m!1301253))

(declare-fun m!1301255 () Bool)

(assert (=> b!1411714 m!1301255))

(declare-fun m!1301257 () Bool)

(assert (=> b!1411722 m!1301257))

(assert (=> b!1411722 m!1301257))

(declare-fun m!1301259 () Bool)

(assert (=> b!1411722 m!1301259))

(assert (=> b!1411720 m!1301251))

(assert (=> b!1411720 m!1301251))

(declare-fun m!1301261 () Bool)

(assert (=> b!1411720 m!1301261))

(declare-fun m!1301263 () Bool)

(assert (=> b!1411719 m!1301263))

(declare-fun m!1301265 () Bool)

(assert (=> b!1411719 m!1301265))

(assert (=> b!1411719 m!1301263))

(declare-fun m!1301267 () Bool)

(assert (=> b!1411719 m!1301267))

(declare-fun m!1301269 () Bool)

(assert (=> b!1411719 m!1301269))

(declare-fun m!1301271 () Bool)

(assert (=> b!1411715 m!1301271))

(assert (=> b!1411716 m!1301251))

(declare-fun m!1301273 () Bool)

(assert (=> b!1411716 m!1301273))

(assert (=> b!1411716 m!1301251))

(declare-fun m!1301275 () Bool)

(assert (=> b!1411716 m!1301275))

(assert (=> b!1411716 m!1301251))

(declare-fun m!1301277 () Bool)

(assert (=> b!1411716 m!1301277))

(declare-fun m!1301279 () Bool)

(assert (=> b!1411716 m!1301279))

(declare-fun m!1301281 () Bool)

(assert (=> start!121496 m!1301281))

(declare-fun m!1301283 () Bool)

(assert (=> start!121496 m!1301283))

(assert (=> b!1411717 m!1301265))

(declare-fun m!1301285 () Bool)

(assert (=> b!1411717 m!1301285))

(declare-fun m!1301287 () Bool)

(assert (=> b!1411717 m!1301287))

(check-sat (not b!1411720) (not b!1411722) (not start!121496) (not b!1411721) (not b!1411715) (not b!1411714) (not b!1411716) (not b!1411717) (not b!1411719))
(check-sat)
