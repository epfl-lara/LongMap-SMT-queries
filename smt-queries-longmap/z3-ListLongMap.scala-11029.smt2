; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129008 () Bool)

(assert start!129008)

(declare-fun b!1512821 () Bool)

(declare-fun res!1032732 () Bool)

(declare-fun e!844361 () Bool)

(assert (=> b!1512821 (=> (not res!1032732) (not e!844361))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100864 0))(
  ( (array!100865 (arr!48669 (Array (_ BitVec 32) (_ BitVec 64))) (size!49219 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100864)

(declare-datatypes ((SeekEntryResult!12840 0))(
  ( (MissingZero!12840 (index!53755 (_ BitVec 32))) (Found!12840 (index!53756 (_ BitVec 32))) (Intermediate!12840 (undefined!13652 Bool) (index!53757 (_ BitVec 32)) (x!135478 (_ BitVec 32))) (Undefined!12840) (MissingVacant!12840 (index!53758 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12840)

(assert (=> b!1512821 (= res!1032732 (= (seekEntry!0 (select (arr!48669 a!2804) j!70) a!2804 mask!2512) (Found!12840 j!70)))))

(declare-fun b!1512822 () Bool)

(declare-fun res!1032725 () Bool)

(declare-fun e!844364 () Bool)

(assert (=> b!1512822 (=> (not res!1032725) (not e!844364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512822 (= res!1032725 (validKeyInArray!0 (select (arr!48669 a!2804) j!70)))))

(declare-fun b!1512823 () Bool)

(declare-fun res!1032730 () Bool)

(assert (=> b!1512823 (=> (not res!1032730) (not e!844364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100864 (_ BitVec 32)) Bool)

(assert (=> b!1512823 (= res!1032730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1032729 () Bool)

(assert (=> start!129008 (=> (not res!1032729) (not e!844364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129008 (= res!1032729 (validMask!0 mask!2512))))

(assert (=> start!129008 e!844364))

(assert (=> start!129008 true))

(declare-fun array_inv!37697 (array!100864) Bool)

(assert (=> start!129008 (array_inv!37697 a!2804)))

(declare-fun b!1512824 () Bool)

(declare-fun e!844366 () Bool)

(assert (=> b!1512824 (= e!844361 e!844366)))

(declare-fun res!1032727 () Bool)

(assert (=> b!1512824 (=> res!1032727 e!844366)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!655771 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512824 (= res!1032727 (or (not (= (select (arr!48669 a!2804) j!70) lt!655771)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48669 a!2804) index!487) (select (arr!48669 a!2804) j!70)) (not (= (select (arr!48669 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512825 () Bool)

(declare-fun e!844363 () Bool)

(assert (=> b!1512825 (= e!844364 e!844363)))

(declare-fun res!1032726 () Bool)

(assert (=> b!1512825 (=> (not res!1032726) (not e!844363))))

(declare-fun lt!655769 () SeekEntryResult!12840)

(declare-fun lt!655770 () SeekEntryResult!12840)

(assert (=> b!1512825 (= res!1032726 (= lt!655769 lt!655770))))

(assert (=> b!1512825 (= lt!655770 (Intermediate!12840 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512825 (= lt!655769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48669 a!2804) j!70) mask!2512) (select (arr!48669 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512826 () Bool)

(declare-fun res!1032724 () Bool)

(assert (=> b!1512826 (=> (not res!1032724) (not e!844364))))

(declare-datatypes ((List!35152 0))(
  ( (Nil!35149) (Cons!35148 (h!36560 (_ BitVec 64)) (t!49846 List!35152)) )
))
(declare-fun arrayNoDuplicates!0 (array!100864 (_ BitVec 32) List!35152) Bool)

(assert (=> b!1512826 (= res!1032724 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35149))))

(declare-fun b!1512827 () Bool)

(declare-fun res!1032736 () Bool)

(assert (=> b!1512827 (=> (not res!1032736) (not e!844364))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512827 (= res!1032736 (and (= (size!49219 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49219 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49219 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512828 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12840)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12840)

(assert (=> b!1512828 (= e!844366 (= (seekEntryOrOpen!0 (select (arr!48669 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48669 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun e!844365 () Bool)

(declare-fun b!1512829 () Bool)

(assert (=> b!1512829 (= e!844365 (not (or (not (= (select (arr!48669 a!2804) j!70) lt!655771)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48669 a!2804) index!487) (select (arr!48669 a!2804) j!70)) (not (= (select (arr!48669 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (= (select (store (arr!48669 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1512829 e!844361))

(declare-fun res!1032733 () Bool)

(assert (=> b!1512829 (=> (not res!1032733) (not e!844361))))

(assert (=> b!1512829 (= res!1032733 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50548 0))(
  ( (Unit!50549) )
))
(declare-fun lt!655768 () Unit!50548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50548)

(assert (=> b!1512829 (= lt!655768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512830 () Bool)

(assert (=> b!1512830 (= e!844363 e!844365)))

(declare-fun res!1032728 () Bool)

(assert (=> b!1512830 (=> (not res!1032728) (not e!844365))))

(assert (=> b!1512830 (= res!1032728 (= lt!655769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655771 mask!2512) lt!655771 (array!100865 (store (arr!48669 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49219 a!2804)) mask!2512)))))

(assert (=> b!1512830 (= lt!655771 (select (store (arr!48669 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512831 () Bool)

(declare-fun res!1032734 () Bool)

(assert (=> b!1512831 (=> (not res!1032734) (not e!844363))))

(assert (=> b!1512831 (= res!1032734 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48669 a!2804) j!70) a!2804 mask!2512) lt!655770))))

(declare-fun b!1512832 () Bool)

(declare-fun res!1032735 () Bool)

(assert (=> b!1512832 (=> (not res!1032735) (not e!844364))))

(assert (=> b!1512832 (= res!1032735 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49219 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49219 a!2804))))))

(declare-fun b!1512833 () Bool)

(declare-fun res!1032731 () Bool)

(assert (=> b!1512833 (=> (not res!1032731) (not e!844364))))

(assert (=> b!1512833 (= res!1032731 (validKeyInArray!0 (select (arr!48669 a!2804) i!961)))))

(assert (= (and start!129008 res!1032729) b!1512827))

(assert (= (and b!1512827 res!1032736) b!1512833))

(assert (= (and b!1512833 res!1032731) b!1512822))

(assert (= (and b!1512822 res!1032725) b!1512823))

(assert (= (and b!1512823 res!1032730) b!1512826))

(assert (= (and b!1512826 res!1032724) b!1512832))

(assert (= (and b!1512832 res!1032735) b!1512825))

(assert (= (and b!1512825 res!1032726) b!1512831))

(assert (= (and b!1512831 res!1032734) b!1512830))

(assert (= (and b!1512830 res!1032728) b!1512829))

(assert (= (and b!1512829 res!1032733) b!1512821))

(assert (= (and b!1512821 res!1032732) b!1512824))

(assert (= (and b!1512824 (not res!1032727)) b!1512828))

(declare-fun m!1395621 () Bool)

(assert (=> b!1512829 m!1395621))

(declare-fun m!1395623 () Bool)

(assert (=> b!1512829 m!1395623))

(declare-fun m!1395625 () Bool)

(assert (=> b!1512829 m!1395625))

(declare-fun m!1395627 () Bool)

(assert (=> b!1512829 m!1395627))

(declare-fun m!1395629 () Bool)

(assert (=> b!1512829 m!1395629))

(declare-fun m!1395631 () Bool)

(assert (=> b!1512829 m!1395631))

(declare-fun m!1395633 () Bool)

(assert (=> start!129008 m!1395633))

(declare-fun m!1395635 () Bool)

(assert (=> start!129008 m!1395635))

(declare-fun m!1395637 () Bool)

(assert (=> b!1512826 m!1395637))

(assert (=> b!1512821 m!1395621))

(assert (=> b!1512821 m!1395621))

(declare-fun m!1395639 () Bool)

(assert (=> b!1512821 m!1395639))

(assert (=> b!1512824 m!1395621))

(assert (=> b!1512824 m!1395627))

(assert (=> b!1512831 m!1395621))

(assert (=> b!1512831 m!1395621))

(declare-fun m!1395641 () Bool)

(assert (=> b!1512831 m!1395641))

(assert (=> b!1512825 m!1395621))

(assert (=> b!1512825 m!1395621))

(declare-fun m!1395643 () Bool)

(assert (=> b!1512825 m!1395643))

(assert (=> b!1512825 m!1395643))

(assert (=> b!1512825 m!1395621))

(declare-fun m!1395645 () Bool)

(assert (=> b!1512825 m!1395645))

(assert (=> b!1512822 m!1395621))

(assert (=> b!1512822 m!1395621))

(declare-fun m!1395647 () Bool)

(assert (=> b!1512822 m!1395647))

(declare-fun m!1395649 () Bool)

(assert (=> b!1512823 m!1395649))

(assert (=> b!1512828 m!1395621))

(assert (=> b!1512828 m!1395621))

(declare-fun m!1395651 () Bool)

(assert (=> b!1512828 m!1395651))

(assert (=> b!1512828 m!1395621))

(declare-fun m!1395653 () Bool)

(assert (=> b!1512828 m!1395653))

(declare-fun m!1395655 () Bool)

(assert (=> b!1512833 m!1395655))

(assert (=> b!1512833 m!1395655))

(declare-fun m!1395657 () Bool)

(assert (=> b!1512833 m!1395657))

(declare-fun m!1395659 () Bool)

(assert (=> b!1512830 m!1395659))

(assert (=> b!1512830 m!1395625))

(assert (=> b!1512830 m!1395659))

(declare-fun m!1395661 () Bool)

(assert (=> b!1512830 m!1395661))

(declare-fun m!1395663 () Bool)

(assert (=> b!1512830 m!1395663))

(check-sat (not b!1512829) (not b!1512831) (not b!1512826) (not b!1512833) (not start!129008) (not b!1512821) (not b!1512823) (not b!1512825) (not b!1512830) (not b!1512828) (not b!1512822))
(check-sat)
