; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121488 () Bool)

(assert start!121488)

(declare-fun b!1411633 () Bool)

(declare-fun res!948868 () Bool)

(declare-fun e!798832 () Bool)

(assert (=> b!1411633 (=> (not res!948868) (not e!798832))))

(declare-datatypes ((array!96489 0))(
  ( (array!96490 (arr!46583 (Array (_ BitVec 32) (_ BitVec 64))) (size!47133 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96489)

(declare-datatypes ((List!33102 0))(
  ( (Nil!33099) (Cons!33098 (h!34370 (_ BitVec 64)) (t!47796 List!33102)) )
))
(declare-fun arrayNoDuplicates!0 (array!96489 (_ BitVec 32) List!33102) Bool)

(assert (=> b!1411633 (= res!948868 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33099))))

(declare-fun b!1411634 () Bool)

(declare-fun res!948861 () Bool)

(assert (=> b!1411634 (=> (not res!948861) (not e!798832))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411634 (= res!948861 (and (= (size!47133 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47133 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47133 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411635 () Bool)

(declare-fun res!948863 () Bool)

(assert (=> b!1411635 (=> (not res!948863) (not e!798832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411635 (= res!948863 (validKeyInArray!0 (select (arr!46583 a!2901) i!1037)))))

(declare-fun b!1411636 () Bool)

(declare-fun e!798833 () Bool)

(declare-fun e!798836 () Bool)

(assert (=> b!1411636 (= e!798833 e!798836)))

(declare-fun res!948864 () Bool)

(assert (=> b!1411636 (=> res!948864 e!798836)))

(declare-datatypes ((SeekEntryResult!10894 0))(
  ( (MissingZero!10894 (index!45953 (_ BitVec 32))) (Found!10894 (index!45954 (_ BitVec 32))) (Intermediate!10894 (undefined!11706 Bool) (index!45955 (_ BitVec 32)) (x!127545 (_ BitVec 32))) (Undefined!10894) (MissingVacant!10894 (index!45956 (_ BitVec 32))) )
))
(declare-fun lt!621844 () SeekEntryResult!10894)

(declare-fun lt!621848 () SeekEntryResult!10894)

(assert (=> b!1411636 (= res!948864 (or (= lt!621844 lt!621848) (not (is-Intermediate!10894 lt!621848))))))

(declare-fun lt!621846 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96489 (_ BitVec 32)) SeekEntryResult!10894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411636 (= lt!621848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621846 mask!2840) lt!621846 (array!96490 (store (arr!46583 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47133 a!2901)) mask!2840))))

(assert (=> b!1411636 (= lt!621846 (select (store (arr!46583 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun res!948862 () Bool)

(assert (=> start!121488 (=> (not res!948862) (not e!798832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121488 (= res!948862 (validMask!0 mask!2840))))

(assert (=> start!121488 e!798832))

(assert (=> start!121488 true))

(declare-fun array_inv!35611 (array!96489) Bool)

(assert (=> start!121488 (array_inv!35611 a!2901)))

(declare-fun b!1411637 () Bool)

(declare-fun e!798835 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96489 (_ BitVec 32)) SeekEntryResult!10894)

(assert (=> b!1411637 (= e!798835 (= (seekEntryOrOpen!0 (select (arr!46583 a!2901) j!112) a!2901 mask!2840) (Found!10894 j!112)))))

(declare-fun b!1411638 () Bool)

(declare-fun res!948865 () Bool)

(assert (=> b!1411638 (=> (not res!948865) (not e!798832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96489 (_ BitVec 32)) Bool)

(assert (=> b!1411638 (= res!948865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411639 () Bool)

(declare-fun res!948866 () Bool)

(assert (=> b!1411639 (=> (not res!948866) (not e!798832))))

(assert (=> b!1411639 (= res!948866 (validKeyInArray!0 (select (arr!46583 a!2901) j!112)))))

(declare-fun b!1411640 () Bool)

(assert (=> b!1411640 (= e!798832 (not e!798833))))

(declare-fun res!948860 () Bool)

(assert (=> b!1411640 (=> res!948860 e!798833)))

(assert (=> b!1411640 (= res!948860 (or (not (is-Intermediate!10894 lt!621844)) (undefined!11706 lt!621844)))))

(assert (=> b!1411640 e!798835))

(declare-fun res!948867 () Bool)

(assert (=> b!1411640 (=> (not res!948867) (not e!798835))))

(assert (=> b!1411640 (= res!948867 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47762 0))(
  ( (Unit!47763) )
))
(declare-fun lt!621845 () Unit!47762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47762)

(assert (=> b!1411640 (= lt!621845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621847 () (_ BitVec 32))

(assert (=> b!1411640 (= lt!621844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621847 (select (arr!46583 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411640 (= lt!621847 (toIndex!0 (select (arr!46583 a!2901) j!112) mask!2840))))

(declare-fun b!1411641 () Bool)

(assert (=> b!1411641 (= e!798836 true)))

(assert (=> b!1411641 (and (not (undefined!11706 lt!621848)) (= (index!45955 lt!621848) i!1037) (bvslt (x!127545 lt!621848) (x!127545 lt!621844)) (= (select (store (arr!46583 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45955 lt!621848)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621849 () Unit!47762)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47762)

(assert (=> b!1411641 (= lt!621849 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621847 (x!127545 lt!621844) (index!45955 lt!621844) (x!127545 lt!621848) (index!45955 lt!621848) (undefined!11706 lt!621848) mask!2840))))

(assert (= (and start!121488 res!948862) b!1411634))

(assert (= (and b!1411634 res!948861) b!1411635))

(assert (= (and b!1411635 res!948863) b!1411639))

(assert (= (and b!1411639 res!948866) b!1411638))

(assert (= (and b!1411638 res!948865) b!1411633))

(assert (= (and b!1411633 res!948868) b!1411640))

(assert (= (and b!1411640 res!948867) b!1411637))

(assert (= (and b!1411640 (not res!948860)) b!1411636))

(assert (= (and b!1411636 (not res!948864)) b!1411641))

(declare-fun m!1301559 () Bool)

(assert (=> b!1411639 m!1301559))

(assert (=> b!1411639 m!1301559))

(declare-fun m!1301561 () Bool)

(assert (=> b!1411639 m!1301561))

(declare-fun m!1301563 () Bool)

(assert (=> b!1411641 m!1301563))

(declare-fun m!1301565 () Bool)

(assert (=> b!1411641 m!1301565))

(declare-fun m!1301567 () Bool)

(assert (=> b!1411641 m!1301567))

(declare-fun m!1301569 () Bool)

(assert (=> b!1411633 m!1301569))

(declare-fun m!1301571 () Bool)

(assert (=> b!1411638 m!1301571))

(assert (=> b!1411640 m!1301559))

(declare-fun m!1301573 () Bool)

(assert (=> b!1411640 m!1301573))

(assert (=> b!1411640 m!1301559))

(assert (=> b!1411640 m!1301559))

(declare-fun m!1301575 () Bool)

(assert (=> b!1411640 m!1301575))

(declare-fun m!1301577 () Bool)

(assert (=> b!1411640 m!1301577))

(declare-fun m!1301579 () Bool)

(assert (=> b!1411640 m!1301579))

(declare-fun m!1301581 () Bool)

(assert (=> b!1411635 m!1301581))

(assert (=> b!1411635 m!1301581))

(declare-fun m!1301583 () Bool)

(assert (=> b!1411635 m!1301583))

(assert (=> b!1411637 m!1301559))

(assert (=> b!1411637 m!1301559))

(declare-fun m!1301585 () Bool)

(assert (=> b!1411637 m!1301585))

(declare-fun m!1301587 () Bool)

(assert (=> start!121488 m!1301587))

(declare-fun m!1301589 () Bool)

(assert (=> start!121488 m!1301589))

(declare-fun m!1301591 () Bool)

(assert (=> b!1411636 m!1301591))

(assert (=> b!1411636 m!1301563))

(assert (=> b!1411636 m!1301591))

(declare-fun m!1301593 () Bool)

(assert (=> b!1411636 m!1301593))

(declare-fun m!1301595 () Bool)

(assert (=> b!1411636 m!1301595))

(push 1)

