; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121616 () Bool)

(assert start!121616)

(declare-fun b!1412835 () Bool)

(declare-fun res!949877 () Bool)

(declare-fun e!799552 () Bool)

(assert (=> b!1412835 (=> (not res!949877) (not e!799552))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96507 0))(
  ( (array!96508 (arr!46591 (Array (_ BitVec 32) (_ BitVec 64))) (size!47143 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96507)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412835 (= res!949877 (and (= (size!47143 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47143 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47143 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412836 () Bool)

(declare-fun e!799549 () Bool)

(declare-datatypes ((SeekEntryResult!10928 0))(
  ( (MissingZero!10928 (index!46092 (_ BitVec 32))) (Found!10928 (index!46093 (_ BitVec 32))) (Intermediate!10928 (undefined!11740 Bool) (index!46094 (_ BitVec 32)) (x!127676 (_ BitVec 32))) (Undefined!10928) (MissingVacant!10928 (index!46095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96507 (_ BitVec 32)) SeekEntryResult!10928)

(assert (=> b!1412836 (= e!799549 (= (seekEntryOrOpen!0 (select (arr!46591 a!2901) j!112) a!2901 mask!2840) (Found!10928 j!112)))))

(declare-fun b!1412837 () Bool)

(declare-fun res!949884 () Bool)

(assert (=> b!1412837 (=> (not res!949884) (not e!799552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96507 (_ BitVec 32)) Bool)

(assert (=> b!1412837 (= res!949884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412839 () Bool)

(declare-fun e!799551 () Bool)

(declare-fun e!799550 () Bool)

(assert (=> b!1412839 (= e!799551 e!799550)))

(declare-fun res!949879 () Bool)

(assert (=> b!1412839 (=> res!949879 e!799550)))

(declare-fun lt!622483 () SeekEntryResult!10928)

(declare-fun lt!622480 () SeekEntryResult!10928)

(get-info :version)

(assert (=> b!1412839 (= res!949879 (or (= lt!622483 lt!622480) (not ((_ is Intermediate!10928) lt!622480))))))

(declare-fun lt!622478 () (_ BitVec 64))

(declare-fun lt!622481 () array!96507)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96507 (_ BitVec 32)) SeekEntryResult!10928)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412839 (= lt!622480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622478 mask!2840) lt!622478 lt!622481 mask!2840))))

(assert (=> b!1412839 (= lt!622478 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412839 (= lt!622481 (array!96508 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47143 a!2901)))))

(declare-fun b!1412840 () Bool)

(assert (=> b!1412840 (= e!799552 (not e!799551))))

(declare-fun res!949878 () Bool)

(assert (=> b!1412840 (=> res!949878 e!799551)))

(assert (=> b!1412840 (= res!949878 (or (not ((_ is Intermediate!10928) lt!622483)) (undefined!11740 lt!622483)))))

(assert (=> b!1412840 e!799549))

(declare-fun res!949881 () Bool)

(assert (=> b!1412840 (=> (not res!949881) (not e!799549))))

(assert (=> b!1412840 (= res!949881 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47673 0))(
  ( (Unit!47674) )
))
(declare-fun lt!622482 () Unit!47673)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47673)

(assert (=> b!1412840 (= lt!622482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622484 () (_ BitVec 32))

(assert (=> b!1412840 (= lt!622483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622484 (select (arr!46591 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412840 (= lt!622484 (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840))))

(declare-fun b!1412841 () Bool)

(declare-fun res!949876 () Bool)

(assert (=> b!1412841 (=> (not res!949876) (not e!799552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412841 (= res!949876 (validKeyInArray!0 (select (arr!46591 a!2901) j!112)))))

(declare-fun b!1412842 () Bool)

(declare-fun res!949883 () Bool)

(assert (=> b!1412842 (=> (not res!949883) (not e!799552))))

(assert (=> b!1412842 (= res!949883 (validKeyInArray!0 (select (arr!46591 a!2901) i!1037)))))

(declare-fun b!1412843 () Bool)

(declare-fun e!799548 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96507 (_ BitVec 32)) SeekEntryResult!10928)

(assert (=> b!1412843 (= e!799548 (= (seekEntryOrOpen!0 lt!622478 lt!622481 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127676 lt!622480) (index!46094 lt!622480) (index!46094 lt!622480) (select (arr!46591 a!2901) j!112) lt!622481 mask!2840)))))

(declare-fun b!1412844 () Bool)

(assert (=> b!1412844 (= e!799550 true)))

(assert (=> b!1412844 e!799548))

(declare-fun res!949880 () Bool)

(assert (=> b!1412844 (=> (not res!949880) (not e!799548))))

(assert (=> b!1412844 (= res!949880 (and (not (undefined!11740 lt!622480)) (= (index!46094 lt!622480) i!1037) (bvslt (x!127676 lt!622480) (x!127676 lt!622483)) (= (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46094 lt!622480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622479 () Unit!47673)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47673)

(assert (=> b!1412844 (= lt!622479 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622484 (x!127676 lt!622483) (index!46094 lt!622483) (x!127676 lt!622480) (index!46094 lt!622480) (undefined!11740 lt!622480) mask!2840))))

(declare-fun res!949882 () Bool)

(assert (=> start!121616 (=> (not res!949882) (not e!799552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121616 (= res!949882 (validMask!0 mask!2840))))

(assert (=> start!121616 e!799552))

(assert (=> start!121616 true))

(declare-fun array_inv!35824 (array!96507) Bool)

(assert (=> start!121616 (array_inv!35824 a!2901)))

(declare-fun b!1412838 () Bool)

(declare-fun res!949885 () Bool)

(assert (=> b!1412838 (=> (not res!949885) (not e!799552))))

(declare-datatypes ((List!33188 0))(
  ( (Nil!33185) (Cons!33184 (h!34459 (_ BitVec 64)) (t!47874 List!33188)) )
))
(declare-fun arrayNoDuplicates!0 (array!96507 (_ BitVec 32) List!33188) Bool)

(assert (=> b!1412838 (= res!949885 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33185))))

(assert (= (and start!121616 res!949882) b!1412835))

(assert (= (and b!1412835 res!949877) b!1412842))

(assert (= (and b!1412842 res!949883) b!1412841))

(assert (= (and b!1412841 res!949876) b!1412837))

(assert (= (and b!1412837 res!949884) b!1412838))

(assert (= (and b!1412838 res!949885) b!1412840))

(assert (= (and b!1412840 res!949881) b!1412836))

(assert (= (and b!1412840 (not res!949878)) b!1412839))

(assert (= (and b!1412839 (not res!949879)) b!1412844))

(assert (= (and b!1412844 res!949880) b!1412843))

(declare-fun m!1302595 () Bool)

(assert (=> start!121616 m!1302595))

(declare-fun m!1302597 () Bool)

(assert (=> start!121616 m!1302597))

(declare-fun m!1302599 () Bool)

(assert (=> b!1412842 m!1302599))

(assert (=> b!1412842 m!1302599))

(declare-fun m!1302601 () Bool)

(assert (=> b!1412842 m!1302601))

(declare-fun m!1302603 () Bool)

(assert (=> b!1412841 m!1302603))

(assert (=> b!1412841 m!1302603))

(declare-fun m!1302605 () Bool)

(assert (=> b!1412841 m!1302605))

(declare-fun m!1302607 () Bool)

(assert (=> b!1412839 m!1302607))

(assert (=> b!1412839 m!1302607))

(declare-fun m!1302609 () Bool)

(assert (=> b!1412839 m!1302609))

(declare-fun m!1302611 () Bool)

(assert (=> b!1412839 m!1302611))

(declare-fun m!1302613 () Bool)

(assert (=> b!1412839 m!1302613))

(assert (=> b!1412836 m!1302603))

(assert (=> b!1412836 m!1302603))

(declare-fun m!1302615 () Bool)

(assert (=> b!1412836 m!1302615))

(assert (=> b!1412840 m!1302603))

(declare-fun m!1302617 () Bool)

(assert (=> b!1412840 m!1302617))

(assert (=> b!1412840 m!1302603))

(declare-fun m!1302619 () Bool)

(assert (=> b!1412840 m!1302619))

(assert (=> b!1412840 m!1302603))

(declare-fun m!1302621 () Bool)

(assert (=> b!1412840 m!1302621))

(declare-fun m!1302623 () Bool)

(assert (=> b!1412840 m!1302623))

(assert (=> b!1412844 m!1302611))

(declare-fun m!1302625 () Bool)

(assert (=> b!1412844 m!1302625))

(declare-fun m!1302627 () Bool)

(assert (=> b!1412844 m!1302627))

(declare-fun m!1302629 () Bool)

(assert (=> b!1412837 m!1302629))

(declare-fun m!1302631 () Bool)

(assert (=> b!1412843 m!1302631))

(assert (=> b!1412843 m!1302603))

(assert (=> b!1412843 m!1302603))

(declare-fun m!1302633 () Bool)

(assert (=> b!1412843 m!1302633))

(declare-fun m!1302635 () Bool)

(assert (=> b!1412838 m!1302635))

(check-sat (not b!1412837) (not b!1412839) (not b!1412844) (not b!1412838) (not b!1412843) (not start!121616) (not b!1412842) (not b!1412836) (not b!1412840) (not b!1412841))
(check-sat)
