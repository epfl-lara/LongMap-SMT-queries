; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121466 () Bool)

(assert start!121466)

(declare-fun b!1411309 () Bool)

(declare-fun res!948590 () Bool)

(declare-fun e!798658 () Bool)

(assert (=> b!1411309 (=> (not res!948590) (not e!798658))))

(declare-datatypes ((array!96420 0))(
  ( (array!96421 (arr!46549 (Array (_ BitVec 32) (_ BitVec 64))) (size!47101 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96420)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411309 (= res!948590 (validKeyInArray!0 (select (arr!46549 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!798661 () Bool)

(declare-fun b!1411310 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10886 0))(
  ( (MissingZero!10886 (index!45921 (_ BitVec 32))) (Found!10886 (index!45922 (_ BitVec 32))) (Intermediate!10886 (undefined!11698 Bool) (index!45923 (_ BitVec 32)) (x!127510 (_ BitVec 32))) (Undefined!10886) (MissingVacant!10886 (index!45924 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96420 (_ BitVec 32)) SeekEntryResult!10886)

(assert (=> b!1411310 (= e!798661 (= (seekEntryOrOpen!0 (select (arr!46549 a!2901) j!112) a!2901 mask!2840) (Found!10886 j!112)))))

(declare-fun b!1411311 () Bool)

(declare-fun e!798662 () Bool)

(declare-fun e!798660 () Bool)

(assert (=> b!1411311 (= e!798662 e!798660)))

(declare-fun res!948593 () Bool)

(assert (=> b!1411311 (=> res!948593 e!798660)))

(declare-fun lt!621492 () SeekEntryResult!10886)

(declare-fun lt!621494 () SeekEntryResult!10886)

(get-info :version)

(assert (=> b!1411311 (= res!948593 (or (= lt!621492 lt!621494) (not ((_ is Intermediate!10886) lt!621494))))))

(declare-fun lt!621493 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96420 (_ BitVec 32)) SeekEntryResult!10886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411311 (= lt!621494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621493 mask!2840) lt!621493 (array!96421 (store (arr!46549 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47101 a!2901)) mask!2840))))

(assert (=> b!1411311 (= lt!621493 (select (store (arr!46549 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411312 () Bool)

(declare-fun res!948591 () Bool)

(assert (=> b!1411312 (=> (not res!948591) (not e!798658))))

(declare-datatypes ((List!33146 0))(
  ( (Nil!33143) (Cons!33142 (h!34414 (_ BitVec 64)) (t!47832 List!33146)) )
))
(declare-fun arrayNoDuplicates!0 (array!96420 (_ BitVec 32) List!33146) Bool)

(assert (=> b!1411312 (= res!948591 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33143))))

(declare-fun b!1411313 () Bool)

(declare-fun res!948595 () Bool)

(assert (=> b!1411313 (=> (not res!948595) (not e!798658))))

(assert (=> b!1411313 (= res!948595 (and (= (size!47101 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47101 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47101 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411314 () Bool)

(declare-fun res!948589 () Bool)

(assert (=> b!1411314 (=> (not res!948589) (not e!798658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96420 (_ BitVec 32)) Bool)

(assert (=> b!1411314 (= res!948589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411315 () Bool)

(declare-fun res!948587 () Bool)

(assert (=> b!1411315 (=> (not res!948587) (not e!798658))))

(assert (=> b!1411315 (= res!948587 (validKeyInArray!0 (select (arr!46549 a!2901) j!112)))))

(declare-fun b!1411316 () Bool)

(assert (=> b!1411316 (= e!798660 (= (select (store (arr!46549 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45923 lt!621494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1411316 (and (not (undefined!11698 lt!621494)) (= (index!45923 lt!621494) i!1037) (bvslt (x!127510 lt!621494) (x!127510 lt!621492)))))

(declare-datatypes ((Unit!47589 0))(
  ( (Unit!47590) )
))
(declare-fun lt!621497 () Unit!47589)

(declare-fun lt!621495 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47589)

(assert (=> b!1411316 (= lt!621497 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621495 (x!127510 lt!621492) (index!45923 lt!621492) (x!127510 lt!621494) (index!45923 lt!621494) (undefined!11698 lt!621494) mask!2840))))

(declare-fun res!948594 () Bool)

(assert (=> start!121466 (=> (not res!948594) (not e!798658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121466 (= res!948594 (validMask!0 mask!2840))))

(assert (=> start!121466 e!798658))

(assert (=> start!121466 true))

(declare-fun array_inv!35782 (array!96420) Bool)

(assert (=> start!121466 (array_inv!35782 a!2901)))

(declare-fun b!1411317 () Bool)

(assert (=> b!1411317 (= e!798658 (not e!798662))))

(declare-fun res!948592 () Bool)

(assert (=> b!1411317 (=> res!948592 e!798662)))

(assert (=> b!1411317 (= res!948592 (or (not ((_ is Intermediate!10886) lt!621492)) (undefined!11698 lt!621492)))))

(assert (=> b!1411317 e!798661))

(declare-fun res!948588 () Bool)

(assert (=> b!1411317 (=> (not res!948588) (not e!798661))))

(assert (=> b!1411317 (= res!948588 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621496 () Unit!47589)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47589)

(assert (=> b!1411317 (= lt!621496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411317 (= lt!621492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621495 (select (arr!46549 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411317 (= lt!621495 (toIndex!0 (select (arr!46549 a!2901) j!112) mask!2840))))

(assert (= (and start!121466 res!948594) b!1411313))

(assert (= (and b!1411313 res!948595) b!1411309))

(assert (= (and b!1411309 res!948590) b!1411315))

(assert (= (and b!1411315 res!948587) b!1411314))

(assert (= (and b!1411314 res!948589) b!1411312))

(assert (= (and b!1411312 res!948591) b!1411317))

(assert (= (and b!1411317 res!948588) b!1411310))

(assert (= (and b!1411317 (not res!948592)) b!1411311))

(assert (= (and b!1411311 (not res!948593)) b!1411316))

(declare-fun m!1300681 () Bool)

(assert (=> b!1411317 m!1300681))

(declare-fun m!1300683 () Bool)

(assert (=> b!1411317 m!1300683))

(assert (=> b!1411317 m!1300681))

(assert (=> b!1411317 m!1300681))

(declare-fun m!1300685 () Bool)

(assert (=> b!1411317 m!1300685))

(declare-fun m!1300687 () Bool)

(assert (=> b!1411317 m!1300687))

(declare-fun m!1300689 () Bool)

(assert (=> b!1411317 m!1300689))

(declare-fun m!1300691 () Bool)

(assert (=> b!1411311 m!1300691))

(declare-fun m!1300693 () Bool)

(assert (=> b!1411311 m!1300693))

(assert (=> b!1411311 m!1300691))

(declare-fun m!1300695 () Bool)

(assert (=> b!1411311 m!1300695))

(declare-fun m!1300697 () Bool)

(assert (=> b!1411311 m!1300697))

(assert (=> b!1411315 m!1300681))

(assert (=> b!1411315 m!1300681))

(declare-fun m!1300699 () Bool)

(assert (=> b!1411315 m!1300699))

(declare-fun m!1300701 () Bool)

(assert (=> start!121466 m!1300701))

(declare-fun m!1300703 () Bool)

(assert (=> start!121466 m!1300703))

(declare-fun m!1300705 () Bool)

(assert (=> b!1411309 m!1300705))

(assert (=> b!1411309 m!1300705))

(declare-fun m!1300707 () Bool)

(assert (=> b!1411309 m!1300707))

(assert (=> b!1411316 m!1300693))

(declare-fun m!1300709 () Bool)

(assert (=> b!1411316 m!1300709))

(declare-fun m!1300711 () Bool)

(assert (=> b!1411316 m!1300711))

(assert (=> b!1411310 m!1300681))

(assert (=> b!1411310 m!1300681))

(declare-fun m!1300713 () Bool)

(assert (=> b!1411310 m!1300713))

(declare-fun m!1300715 () Bool)

(assert (=> b!1411312 m!1300715))

(declare-fun m!1300717 () Bool)

(assert (=> b!1411314 m!1300717))

(check-sat (not b!1411310) (not b!1411316) (not start!121466) (not b!1411314) (not b!1411315) (not b!1411312) (not b!1411317) (not b!1411311) (not b!1411309))
(check-sat)
