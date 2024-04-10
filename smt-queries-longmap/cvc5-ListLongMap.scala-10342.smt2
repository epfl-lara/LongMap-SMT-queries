; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121602 () Bool)

(assert start!121602)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96540 0))(
  ( (array!96541 (arr!46607 (Array (_ BitVec 32) (_ BitVec 64))) (size!47157 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96540)

(declare-fun e!799430 () Bool)

(declare-fun b!1412647 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10918 0))(
  ( (MissingZero!10918 (index!46052 (_ BitVec 32))) (Found!10918 (index!46053 (_ BitVec 32))) (Intermediate!10918 (undefined!11730 Bool) (index!46054 (_ BitVec 32)) (x!127645 (_ BitVec 32))) (Undefined!10918) (MissingVacant!10918 (index!46055 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96540 (_ BitVec 32)) SeekEntryResult!10918)

(assert (=> b!1412647 (= e!799430 (= (seekEntryOrOpen!0 (select (arr!46607 a!2901) j!112) a!2901 mask!2840) (Found!10918 j!112)))))

(declare-fun b!1412648 () Bool)

(declare-fun res!949644 () Bool)

(declare-fun e!799426 () Bool)

(assert (=> b!1412648 (=> (not res!949644) (not e!799426))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412648 (= res!949644 (and (= (size!47157 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47157 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47157 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412649 () Bool)

(declare-fun res!949645 () Bool)

(assert (=> b!1412649 (=> (not res!949645) (not e!799426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412649 (= res!949645 (validKeyInArray!0 (select (arr!46607 a!2901) j!112)))))

(declare-fun b!1412650 () Bool)

(declare-fun res!949637 () Bool)

(assert (=> b!1412650 (=> (not res!949637) (not e!799426))))

(declare-datatypes ((List!33126 0))(
  ( (Nil!33123) (Cons!33122 (h!34397 (_ BitVec 64)) (t!47820 List!33126)) )
))
(declare-fun arrayNoDuplicates!0 (array!96540 (_ BitVec 32) List!33126) Bool)

(assert (=> b!1412650 (= res!949637 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33123))))

(declare-fun b!1412651 () Bool)

(declare-fun res!949638 () Bool)

(assert (=> b!1412651 (=> (not res!949638) (not e!799426))))

(assert (=> b!1412651 (= res!949638 (validKeyInArray!0 (select (arr!46607 a!2901) i!1037)))))

(declare-fun e!799428 () Bool)

(declare-fun b!1412652 () Bool)

(declare-fun lt!622484 () array!96540)

(declare-fun lt!622483 () (_ BitVec 64))

(declare-fun lt!622482 () SeekEntryResult!10918)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96540 (_ BitVec 32)) SeekEntryResult!10918)

(assert (=> b!1412652 (= e!799428 (= (seekEntryOrOpen!0 lt!622483 lt!622484 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127645 lt!622482) (index!46054 lt!622482) (index!46054 lt!622482) (select (arr!46607 a!2901) j!112) lt!622484 mask!2840)))))

(declare-fun b!1412653 () Bool)

(declare-fun e!799429 () Bool)

(declare-fun e!799427 () Bool)

(assert (=> b!1412653 (= e!799429 e!799427)))

(declare-fun res!949643 () Bool)

(assert (=> b!1412653 (=> res!949643 e!799427)))

(declare-fun lt!622479 () SeekEntryResult!10918)

(assert (=> b!1412653 (= res!949643 (or (= lt!622479 lt!622482) (not (is-Intermediate!10918 lt!622482))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96540 (_ BitVec 32)) SeekEntryResult!10918)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412653 (= lt!622482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622483 mask!2840) lt!622483 lt!622484 mask!2840))))

(assert (=> b!1412653 (= lt!622483 (select (store (arr!46607 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412653 (= lt!622484 (array!96541 (store (arr!46607 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47157 a!2901)))))

(declare-fun b!1412646 () Bool)

(assert (=> b!1412646 (= e!799427 true)))

(assert (=> b!1412646 e!799428))

(declare-fun res!949642 () Bool)

(assert (=> b!1412646 (=> (not res!949642) (not e!799428))))

(assert (=> b!1412646 (= res!949642 (and (not (undefined!11730 lt!622482)) (= (index!46054 lt!622482) i!1037) (bvslt (x!127645 lt!622482) (x!127645 lt!622479)) (= (select (store (arr!46607 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46054 lt!622482)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622480 () (_ BitVec 32))

(declare-datatypes ((Unit!47810 0))(
  ( (Unit!47811) )
))
(declare-fun lt!622481 () Unit!47810)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47810)

(assert (=> b!1412646 (= lt!622481 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622480 (x!127645 lt!622479) (index!46054 lt!622479) (x!127645 lt!622482) (index!46054 lt!622482) (undefined!11730 lt!622482) mask!2840))))

(declare-fun res!949640 () Bool)

(assert (=> start!121602 (=> (not res!949640) (not e!799426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121602 (= res!949640 (validMask!0 mask!2840))))

(assert (=> start!121602 e!799426))

(assert (=> start!121602 true))

(declare-fun array_inv!35635 (array!96540) Bool)

(assert (=> start!121602 (array_inv!35635 a!2901)))

(declare-fun b!1412654 () Bool)

(declare-fun res!949641 () Bool)

(assert (=> b!1412654 (=> (not res!949641) (not e!799426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96540 (_ BitVec 32)) Bool)

(assert (=> b!1412654 (= res!949641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412655 () Bool)

(assert (=> b!1412655 (= e!799426 (not e!799429))))

(declare-fun res!949639 () Bool)

(assert (=> b!1412655 (=> res!949639 e!799429)))

(assert (=> b!1412655 (= res!949639 (or (not (is-Intermediate!10918 lt!622479)) (undefined!11730 lt!622479)))))

(assert (=> b!1412655 e!799430))

(declare-fun res!949636 () Bool)

(assert (=> b!1412655 (=> (not res!949636) (not e!799430))))

(assert (=> b!1412655 (= res!949636 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622485 () Unit!47810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47810)

(assert (=> b!1412655 (= lt!622485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412655 (= lt!622479 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622480 (select (arr!46607 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412655 (= lt!622480 (toIndex!0 (select (arr!46607 a!2901) j!112) mask!2840))))

(assert (= (and start!121602 res!949640) b!1412648))

(assert (= (and b!1412648 res!949644) b!1412651))

(assert (= (and b!1412651 res!949638) b!1412649))

(assert (= (and b!1412649 res!949645) b!1412654))

(assert (= (and b!1412654 res!949641) b!1412650))

(assert (= (and b!1412650 res!949637) b!1412655))

(assert (= (and b!1412655 res!949636) b!1412647))

(assert (= (and b!1412655 (not res!949639)) b!1412653))

(assert (= (and b!1412653 (not res!949643)) b!1412646))

(assert (= (and b!1412646 res!949642) b!1412652))

(declare-fun m!1302753 () Bool)

(assert (=> b!1412653 m!1302753))

(assert (=> b!1412653 m!1302753))

(declare-fun m!1302755 () Bool)

(assert (=> b!1412653 m!1302755))

(declare-fun m!1302757 () Bool)

(assert (=> b!1412653 m!1302757))

(declare-fun m!1302759 () Bool)

(assert (=> b!1412653 m!1302759))

(declare-fun m!1302761 () Bool)

(assert (=> b!1412652 m!1302761))

(declare-fun m!1302763 () Bool)

(assert (=> b!1412652 m!1302763))

(assert (=> b!1412652 m!1302763))

(declare-fun m!1302765 () Bool)

(assert (=> b!1412652 m!1302765))

(assert (=> b!1412646 m!1302757))

(declare-fun m!1302767 () Bool)

(assert (=> b!1412646 m!1302767))

(declare-fun m!1302769 () Bool)

(assert (=> b!1412646 m!1302769))

(assert (=> b!1412649 m!1302763))

(assert (=> b!1412649 m!1302763))

(declare-fun m!1302771 () Bool)

(assert (=> b!1412649 m!1302771))

(assert (=> b!1412655 m!1302763))

(declare-fun m!1302773 () Bool)

(assert (=> b!1412655 m!1302773))

(assert (=> b!1412655 m!1302763))

(declare-fun m!1302775 () Bool)

(assert (=> b!1412655 m!1302775))

(assert (=> b!1412655 m!1302763))

(declare-fun m!1302777 () Bool)

(assert (=> b!1412655 m!1302777))

(declare-fun m!1302779 () Bool)

(assert (=> b!1412655 m!1302779))

(declare-fun m!1302781 () Bool)

(assert (=> b!1412651 m!1302781))

(assert (=> b!1412651 m!1302781))

(declare-fun m!1302783 () Bool)

(assert (=> b!1412651 m!1302783))

(declare-fun m!1302785 () Bool)

(assert (=> start!121602 m!1302785))

(declare-fun m!1302787 () Bool)

(assert (=> start!121602 m!1302787))

(declare-fun m!1302789 () Bool)

(assert (=> b!1412654 m!1302789))

(declare-fun m!1302791 () Bool)

(assert (=> b!1412650 m!1302791))

(assert (=> b!1412647 m!1302763))

(assert (=> b!1412647 m!1302763))

(declare-fun m!1302793 () Bool)

(assert (=> b!1412647 m!1302793))

(push 1)

