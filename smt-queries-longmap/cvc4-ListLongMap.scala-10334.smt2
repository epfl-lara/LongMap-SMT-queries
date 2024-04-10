; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121492 () Bool)

(assert start!121492)

(declare-fun b!1411687 () Bool)

(declare-fun res!948914 () Bool)

(declare-fun e!798864 () Bool)

(assert (=> b!1411687 (=> (not res!948914) (not e!798864))))

(declare-datatypes ((array!96493 0))(
  ( (array!96494 (arr!46585 (Array (_ BitVec 32) (_ BitVec 64))) (size!47135 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96493)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96493 (_ BitVec 32)) Bool)

(assert (=> b!1411687 (= res!948914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411688 () Bool)

(declare-fun res!948919 () Bool)

(assert (=> b!1411688 (=> (not res!948919) (not e!798864))))

(declare-datatypes ((List!33104 0))(
  ( (Nil!33101) (Cons!33100 (h!34372 (_ BitVec 64)) (t!47798 List!33104)) )
))
(declare-fun arrayNoDuplicates!0 (array!96493 (_ BitVec 32) List!33104) Bool)

(assert (=> b!1411688 (= res!948919 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33101))))

(declare-fun b!1411689 () Bool)

(declare-fun e!798866 () Bool)

(assert (=> b!1411689 (= e!798864 (not e!798866))))

(declare-fun res!948918 () Bool)

(assert (=> b!1411689 (=> res!948918 e!798866)))

(declare-datatypes ((SeekEntryResult!10896 0))(
  ( (MissingZero!10896 (index!45961 (_ BitVec 32))) (Found!10896 (index!45962 (_ BitVec 32))) (Intermediate!10896 (undefined!11708 Bool) (index!45963 (_ BitVec 32)) (x!127547 (_ BitVec 32))) (Undefined!10896) (MissingVacant!10896 (index!45964 (_ BitVec 32))) )
))
(declare-fun lt!621881 () SeekEntryResult!10896)

(assert (=> b!1411689 (= res!948918 (or (not (is-Intermediate!10896 lt!621881)) (undefined!11708 lt!621881)))))

(declare-fun e!798865 () Bool)

(assert (=> b!1411689 e!798865))

(declare-fun res!948917 () Bool)

(assert (=> b!1411689 (=> (not res!948917) (not e!798865))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411689 (= res!948917 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47766 0))(
  ( (Unit!47767) )
))
(declare-fun lt!621880 () Unit!47766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47766)

(assert (=> b!1411689 (= lt!621880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621882 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96493 (_ BitVec 32)) SeekEntryResult!10896)

(assert (=> b!1411689 (= lt!621881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621882 (select (arr!46585 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411689 (= lt!621882 (toIndex!0 (select (arr!46585 a!2901) j!112) mask!2840))))

(declare-fun b!1411690 () Bool)

(declare-fun e!798863 () Bool)

(assert (=> b!1411690 (= e!798863 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621884 () SeekEntryResult!10896)

(assert (=> b!1411690 (and (not (undefined!11708 lt!621884)) (= (index!45963 lt!621884) i!1037) (bvslt (x!127547 lt!621884) (x!127547 lt!621881)) (= (select (store (arr!46585 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45963 lt!621884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621883 () Unit!47766)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47766)

(assert (=> b!1411690 (= lt!621883 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621882 (x!127547 lt!621881) (index!45963 lt!621881) (x!127547 lt!621884) (index!45963 lt!621884) (undefined!11708 lt!621884) mask!2840))))

(declare-fun b!1411691 () Bool)

(declare-fun res!948920 () Bool)

(assert (=> b!1411691 (=> (not res!948920) (not e!798864))))

(assert (=> b!1411691 (= res!948920 (and (= (size!47135 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47135 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47135 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411692 () Bool)

(assert (=> b!1411692 (= e!798866 e!798863)))

(declare-fun res!948922 () Bool)

(assert (=> b!1411692 (=> res!948922 e!798863)))

(assert (=> b!1411692 (= res!948922 (or (= lt!621881 lt!621884) (not (is-Intermediate!10896 lt!621884))))))

(declare-fun lt!621885 () (_ BitVec 64))

(assert (=> b!1411692 (= lt!621884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621885 mask!2840) lt!621885 (array!96494 (store (arr!46585 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47135 a!2901)) mask!2840))))

(assert (=> b!1411692 (= lt!621885 (select (store (arr!46585 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun res!948916 () Bool)

(assert (=> start!121492 (=> (not res!948916) (not e!798864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121492 (= res!948916 (validMask!0 mask!2840))))

(assert (=> start!121492 e!798864))

(assert (=> start!121492 true))

(declare-fun array_inv!35613 (array!96493) Bool)

(assert (=> start!121492 (array_inv!35613 a!2901)))

(declare-fun b!1411693 () Bool)

(declare-fun res!948921 () Bool)

(assert (=> b!1411693 (=> (not res!948921) (not e!798864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411693 (= res!948921 (validKeyInArray!0 (select (arr!46585 a!2901) j!112)))))

(declare-fun b!1411694 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96493 (_ BitVec 32)) SeekEntryResult!10896)

(assert (=> b!1411694 (= e!798865 (= (seekEntryOrOpen!0 (select (arr!46585 a!2901) j!112) a!2901 mask!2840) (Found!10896 j!112)))))

(declare-fun b!1411695 () Bool)

(declare-fun res!948915 () Bool)

(assert (=> b!1411695 (=> (not res!948915) (not e!798864))))

(assert (=> b!1411695 (= res!948915 (validKeyInArray!0 (select (arr!46585 a!2901) i!1037)))))

(assert (= (and start!121492 res!948916) b!1411691))

(assert (= (and b!1411691 res!948920) b!1411695))

(assert (= (and b!1411695 res!948915) b!1411693))

(assert (= (and b!1411693 res!948921) b!1411687))

(assert (= (and b!1411687 res!948914) b!1411688))

(assert (= (and b!1411688 res!948919) b!1411689))

(assert (= (and b!1411689 res!948917) b!1411694))

(assert (= (and b!1411689 (not res!948918)) b!1411692))

(assert (= (and b!1411692 (not res!948922)) b!1411690))

(declare-fun m!1301635 () Bool)

(assert (=> b!1411694 m!1301635))

(assert (=> b!1411694 m!1301635))

(declare-fun m!1301637 () Bool)

(assert (=> b!1411694 m!1301637))

(declare-fun m!1301639 () Bool)

(assert (=> b!1411687 m!1301639))

(declare-fun m!1301641 () Bool)

(assert (=> b!1411695 m!1301641))

(assert (=> b!1411695 m!1301641))

(declare-fun m!1301643 () Bool)

(assert (=> b!1411695 m!1301643))

(assert (=> b!1411693 m!1301635))

(assert (=> b!1411693 m!1301635))

(declare-fun m!1301645 () Bool)

(assert (=> b!1411693 m!1301645))

(declare-fun m!1301647 () Bool)

(assert (=> b!1411692 m!1301647))

(declare-fun m!1301649 () Bool)

(assert (=> b!1411692 m!1301649))

(assert (=> b!1411692 m!1301647))

(declare-fun m!1301651 () Bool)

(assert (=> b!1411692 m!1301651))

(declare-fun m!1301653 () Bool)

(assert (=> b!1411692 m!1301653))

(declare-fun m!1301655 () Bool)

(assert (=> b!1411688 m!1301655))

(assert (=> b!1411689 m!1301635))

(declare-fun m!1301657 () Bool)

(assert (=> b!1411689 m!1301657))

(assert (=> b!1411689 m!1301635))

(declare-fun m!1301659 () Bool)

(assert (=> b!1411689 m!1301659))

(assert (=> b!1411689 m!1301635))

(declare-fun m!1301661 () Bool)

(assert (=> b!1411689 m!1301661))

(declare-fun m!1301663 () Bool)

(assert (=> b!1411689 m!1301663))

(declare-fun m!1301665 () Bool)

(assert (=> start!121492 m!1301665))

(declare-fun m!1301667 () Bool)

(assert (=> start!121492 m!1301667))

(assert (=> b!1411690 m!1301649))

(declare-fun m!1301669 () Bool)

(assert (=> b!1411690 m!1301669))

(declare-fun m!1301671 () Bool)

(assert (=> b!1411690 m!1301671))

(push 1)

