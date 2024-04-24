; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121772 () Bool)

(assert start!121772)

(declare-fun b!1413516 () Bool)

(declare-fun e!800001 () Bool)

(declare-fun e!800004 () Bool)

(assert (=> b!1413516 (= e!800001 e!800004)))

(declare-fun res!949829 () Bool)

(assert (=> b!1413516 (=> res!949829 e!800004)))

(declare-datatypes ((SeekEntryResult!10865 0))(
  ( (MissingZero!10865 (index!45840 (_ BitVec 32))) (Found!10865 (index!45841 (_ BitVec 32))) (Intermediate!10865 (undefined!11677 Bool) (index!45842 (_ BitVec 32)) (x!127587 (_ BitVec 32))) (Undefined!10865) (MissingVacant!10865 (index!45843 (_ BitVec 32))) )
))
(declare-fun lt!622690 () SeekEntryResult!10865)

(declare-fun lt!622688 () SeekEntryResult!10865)

(get-info :version)

(assert (=> b!1413516 (= res!949829 (or (= lt!622690 lt!622688) (not ((_ is Intermediate!10865) lt!622688))))))

(declare-fun lt!622692 () (_ BitVec 64))

(declare-datatypes ((array!96632 0))(
  ( (array!96633 (arr!46651 (Array (_ BitVec 32) (_ BitVec 64))) (size!47202 (_ BitVec 32))) )
))
(declare-fun lt!622689 () array!96632)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96632 (_ BitVec 32)) SeekEntryResult!10865)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413516 (= lt!622688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622692 mask!2840) lt!622692 lt!622689 mask!2840))))

(declare-fun a!2901 () array!96632)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413516 (= lt!622692 (select (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413516 (= lt!622689 (array!96633 (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47202 a!2901)))))

(declare-fun b!1413517 () Bool)

(declare-fun res!949826 () Bool)

(declare-fun e!800002 () Bool)

(assert (=> b!1413517 (=> (not res!949826) (not e!800002))))

(declare-datatypes ((List!33157 0))(
  ( (Nil!33154) (Cons!33153 (h!34436 (_ BitVec 64)) (t!47843 List!33157)) )
))
(declare-fun arrayNoDuplicates!0 (array!96632 (_ BitVec 32) List!33157) Bool)

(assert (=> b!1413517 (= res!949826 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33154))))

(declare-fun b!1413518 () Bool)

(declare-fun e!800003 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96632 (_ BitVec 32)) SeekEntryResult!10865)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96632 (_ BitVec 32)) SeekEntryResult!10865)

(assert (=> b!1413518 (= e!800003 (= (seekEntryOrOpen!0 lt!622692 lt!622689 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127587 lt!622688) (index!45842 lt!622688) (index!45842 lt!622688) (select (arr!46651 a!2901) j!112) lt!622689 mask!2840)))))

(declare-fun b!1413519 () Bool)

(declare-fun res!949827 () Bool)

(assert (=> b!1413519 (=> (not res!949827) (not e!800002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96632 (_ BitVec 32)) Bool)

(assert (=> b!1413519 (= res!949827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413521 () Bool)

(declare-fun res!949828 () Bool)

(assert (=> b!1413521 (=> (not res!949828) (not e!800002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413521 (= res!949828 (validKeyInArray!0 (select (arr!46651 a!2901) j!112)))))

(declare-fun e!800005 () Bool)

(declare-fun b!1413522 () Bool)

(assert (=> b!1413522 (= e!800005 (= (seekEntryOrOpen!0 (select (arr!46651 a!2901) j!112) a!2901 mask!2840) (Found!10865 j!112)))))

(declare-fun b!1413523 () Bool)

(assert (=> b!1413523 (= e!800004 true)))

(assert (=> b!1413523 e!800003))

(declare-fun res!949823 () Bool)

(assert (=> b!1413523 (=> (not res!949823) (not e!800003))))

(assert (=> b!1413523 (= res!949823 (and (not (undefined!11677 lt!622688)) (= (index!45842 lt!622688) i!1037) (bvslt (x!127587 lt!622688) (x!127587 lt!622690)) (= (select (store (arr!46651 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45842 lt!622688)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622693 () (_ BitVec 32))

(declare-datatypes ((Unit!47731 0))(
  ( (Unit!47732) )
))
(declare-fun lt!622694 () Unit!47731)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47731)

(assert (=> b!1413523 (= lt!622694 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622693 (x!127587 lt!622690) (index!45842 lt!622690) (x!127587 lt!622688) (index!45842 lt!622688) (undefined!11677 lt!622688) mask!2840))))

(declare-fun b!1413524 () Bool)

(assert (=> b!1413524 (= e!800002 (not e!800001))))

(declare-fun res!949825 () Bool)

(assert (=> b!1413524 (=> res!949825 e!800001)))

(assert (=> b!1413524 (= res!949825 (or (not ((_ is Intermediate!10865) lt!622690)) (undefined!11677 lt!622690)))))

(assert (=> b!1413524 e!800005))

(declare-fun res!949830 () Bool)

(assert (=> b!1413524 (=> (not res!949830) (not e!800005))))

(assert (=> b!1413524 (= res!949830 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622691 () Unit!47731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47731)

(assert (=> b!1413524 (= lt!622691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413524 (= lt!622690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622693 (select (arr!46651 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413524 (= lt!622693 (toIndex!0 (select (arr!46651 a!2901) j!112) mask!2840))))

(declare-fun b!1413525 () Bool)

(declare-fun res!949822 () Bool)

(assert (=> b!1413525 (=> (not res!949822) (not e!800002))))

(assert (=> b!1413525 (= res!949822 (validKeyInArray!0 (select (arr!46651 a!2901) i!1037)))))

(declare-fun res!949824 () Bool)

(assert (=> start!121772 (=> (not res!949824) (not e!800002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121772 (= res!949824 (validMask!0 mask!2840))))

(assert (=> start!121772 e!800002))

(assert (=> start!121772 true))

(declare-fun array_inv!35932 (array!96632) Bool)

(assert (=> start!121772 (array_inv!35932 a!2901)))

(declare-fun b!1413520 () Bool)

(declare-fun res!949831 () Bool)

(assert (=> b!1413520 (=> (not res!949831) (not e!800002))))

(assert (=> b!1413520 (= res!949831 (and (= (size!47202 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47202 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47202 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121772 res!949824) b!1413520))

(assert (= (and b!1413520 res!949831) b!1413525))

(assert (= (and b!1413525 res!949822) b!1413521))

(assert (= (and b!1413521 res!949828) b!1413519))

(assert (= (and b!1413519 res!949827) b!1413517))

(assert (= (and b!1413517 res!949826) b!1413524))

(assert (= (and b!1413524 res!949830) b!1413522))

(assert (= (and b!1413524 (not res!949825)) b!1413516))

(assert (= (and b!1413516 (not res!949829)) b!1413523))

(assert (= (and b!1413523 res!949823) b!1413518))

(declare-fun m!1303747 () Bool)

(assert (=> b!1413516 m!1303747))

(assert (=> b!1413516 m!1303747))

(declare-fun m!1303749 () Bool)

(assert (=> b!1413516 m!1303749))

(declare-fun m!1303751 () Bool)

(assert (=> b!1413516 m!1303751))

(declare-fun m!1303753 () Bool)

(assert (=> b!1413516 m!1303753))

(declare-fun m!1303755 () Bool)

(assert (=> b!1413522 m!1303755))

(assert (=> b!1413522 m!1303755))

(declare-fun m!1303757 () Bool)

(assert (=> b!1413522 m!1303757))

(assert (=> b!1413521 m!1303755))

(assert (=> b!1413521 m!1303755))

(declare-fun m!1303759 () Bool)

(assert (=> b!1413521 m!1303759))

(declare-fun m!1303761 () Bool)

(assert (=> b!1413519 m!1303761))

(assert (=> b!1413523 m!1303751))

(declare-fun m!1303763 () Bool)

(assert (=> b!1413523 m!1303763))

(declare-fun m!1303765 () Bool)

(assert (=> b!1413523 m!1303765))

(declare-fun m!1303767 () Bool)

(assert (=> b!1413518 m!1303767))

(assert (=> b!1413518 m!1303755))

(assert (=> b!1413518 m!1303755))

(declare-fun m!1303769 () Bool)

(assert (=> b!1413518 m!1303769))

(declare-fun m!1303771 () Bool)

(assert (=> b!1413525 m!1303771))

(assert (=> b!1413525 m!1303771))

(declare-fun m!1303773 () Bool)

(assert (=> b!1413525 m!1303773))

(declare-fun m!1303775 () Bool)

(assert (=> b!1413517 m!1303775))

(assert (=> b!1413524 m!1303755))

(declare-fun m!1303777 () Bool)

(assert (=> b!1413524 m!1303777))

(assert (=> b!1413524 m!1303755))

(declare-fun m!1303779 () Bool)

(assert (=> b!1413524 m!1303779))

(assert (=> b!1413524 m!1303755))

(declare-fun m!1303781 () Bool)

(assert (=> b!1413524 m!1303781))

(declare-fun m!1303783 () Bool)

(assert (=> b!1413524 m!1303783))

(declare-fun m!1303785 () Bool)

(assert (=> start!121772 m!1303785))

(declare-fun m!1303787 () Bool)

(assert (=> start!121772 m!1303787))

(check-sat (not b!1413523) (not start!121772) (not b!1413518) (not b!1413524) (not b!1413519) (not b!1413521) (not b!1413517) (not b!1413516) (not b!1413525) (not b!1413522))
(check-sat)
