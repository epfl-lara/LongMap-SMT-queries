; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125014 () Bool)

(assert start!125014)

(declare-fun b!1454901 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637595 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98440 0))(
  ( (array!98441 (arr!47509 (Array (_ BitVec 32) (_ BitVec 64))) (size!48061 (_ BitVec 32))) )
))
(declare-fun lt!637597 () array!98440)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!818712 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11786 0))(
  ( (MissingZero!11786 (index!49536 (_ BitVec 32))) (Found!11786 (index!49537 (_ BitVec 32))) (Intermediate!11786 (undefined!12598 Bool) (index!49538 (_ BitVec 32)) (x!131166 (_ BitVec 32))) (Undefined!11786) (MissingVacant!11786 (index!49539 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98440 (_ BitVec 32)) SeekEntryResult!11786)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98440 (_ BitVec 32)) SeekEntryResult!11786)

(assert (=> b!1454901 (= e!818712 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637595 lt!637597 mask!2687) (seekEntryOrOpen!0 lt!637595 lt!637597 mask!2687)))))

(declare-fun b!1454903 () Bool)

(declare-fun lt!637594 () SeekEntryResult!11786)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98440 (_ BitVec 32)) SeekEntryResult!11786)

(assert (=> b!1454903 (= e!818712 (= lt!637594 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637595 lt!637597 mask!2687)))))

(declare-fun b!1454904 () Bool)

(declare-fun lt!637593 () (_ BitVec 32))

(declare-fun e!818706 () Bool)

(assert (=> b!1454904 (= e!818706 (not (= lt!637594 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637593 lt!637595 lt!637597 mask!2687))))))

(declare-fun b!1454905 () Bool)

(declare-fun res!985756 () Bool)

(declare-fun e!818715 () Bool)

(assert (=> b!1454905 (=> (not res!985756) (not e!818715))))

(declare-fun a!2862 () array!98440)

(declare-datatypes ((List!34088 0))(
  ( (Nil!34085) (Cons!34084 (h!35434 (_ BitVec 64)) (t!48774 List!34088)) )
))
(declare-fun arrayNoDuplicates!0 (array!98440 (_ BitVec 32) List!34088) Bool)

(assert (=> b!1454905 (= res!985756 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34085))))

(declare-fun b!1454906 () Bool)

(declare-fun e!818710 () Bool)

(declare-fun e!818709 () Bool)

(assert (=> b!1454906 (= e!818710 e!818709)))

(declare-fun res!985752 () Bool)

(assert (=> b!1454906 (=> res!985752 e!818709)))

(assert (=> b!1454906 (= res!985752 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637593 #b00000000000000000000000000000000) (bvsge lt!637593 (size!48061 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454906 (= lt!637593 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637599 () SeekEntryResult!11786)

(assert (=> b!1454906 (= lt!637599 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637595 lt!637597 mask!2687))))

(assert (=> b!1454906 (= lt!637599 (seekEntryOrOpen!0 lt!637595 lt!637597 mask!2687))))

(declare-fun b!1454907 () Bool)

(declare-fun res!985758 () Bool)

(declare-fun e!818714 () Bool)

(assert (=> b!1454907 (=> (not res!985758) (not e!818714))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1454907 (= res!985758 (= (seekEntryOrOpen!0 (select (arr!47509 a!2862) j!93) a!2862 mask!2687) (Found!11786 j!93)))))

(declare-fun b!1454908 () Bool)

(declare-fun res!985757 () Bool)

(assert (=> b!1454908 (=> (not res!985757) (not e!818715))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454908 (= res!985757 (and (= (size!48061 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48061 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48061 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454909 () Bool)

(assert (=> b!1454909 (= e!818709 true)))

(declare-fun lt!637596 () Bool)

(assert (=> b!1454909 (= lt!637596 e!818706)))

(declare-fun c!134092 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454909 (= c!134092 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454910 () Bool)

(declare-fun res!985753 () Bool)

(declare-fun e!818707 () Bool)

(assert (=> b!1454910 (=> (not res!985753) (not e!818707))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454910 (= res!985753 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454911 () Bool)

(declare-fun res!985745 () Bool)

(assert (=> b!1454911 (=> res!985745 e!818709)))

(declare-fun lt!637598 () SeekEntryResult!11786)

(assert (=> b!1454911 (= res!985745 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637593 (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!637598)))))

(declare-fun b!1454912 () Bool)

(assert (=> b!1454912 (= e!818706 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637593 intermediateAfterIndex!19 lt!637595 lt!637597 mask!2687) lt!637599)))))

(declare-fun b!1454913 () Bool)

(declare-fun e!818713 () Bool)

(assert (=> b!1454913 (= e!818713 e!818707)))

(declare-fun res!985746 () Bool)

(assert (=> b!1454913 (=> (not res!985746) (not e!818707))))

(assert (=> b!1454913 (= res!985746 (= lt!637594 (Intermediate!11786 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454913 (= lt!637594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637595 mask!2687) lt!637595 lt!637597 mask!2687))))

(assert (=> b!1454913 (= lt!637595 (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454914 () Bool)

(declare-fun res!985760 () Bool)

(assert (=> b!1454914 (=> (not res!985760) (not e!818715))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1454914 (= res!985760 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48061 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48061 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48061 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454902 () Bool)

(declare-fun res!985761 () Bool)

(assert (=> b!1454902 (=> (not res!985761) (not e!818713))))

(assert (=> b!1454902 (= res!985761 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!637598))))

(declare-fun res!985749 () Bool)

(assert (=> start!125014 (=> (not res!985749) (not e!818715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125014 (= res!985749 (validMask!0 mask!2687))))

(assert (=> start!125014 e!818715))

(assert (=> start!125014 true))

(declare-fun array_inv!36742 (array!98440) Bool)

(assert (=> start!125014 (array_inv!36742 a!2862)))

(declare-fun b!1454915 () Bool)

(declare-fun res!985751 () Bool)

(assert (=> b!1454915 (=> (not res!985751) (not e!818715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98440 (_ BitVec 32)) Bool)

(assert (=> b!1454915 (= res!985751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454916 () Bool)

(declare-fun res!985755 () Bool)

(assert (=> b!1454916 (=> (not res!985755) (not e!818715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454916 (= res!985755 (validKeyInArray!0 (select (arr!47509 a!2862) j!93)))))

(declare-fun b!1454917 () Bool)

(declare-fun res!985747 () Bool)

(assert (=> b!1454917 (=> (not res!985747) (not e!818715))))

(assert (=> b!1454917 (= res!985747 (validKeyInArray!0 (select (arr!47509 a!2862) i!1006)))))

(declare-fun b!1454918 () Bool)

(declare-fun e!818711 () Bool)

(assert (=> b!1454918 (= e!818711 e!818713)))

(declare-fun res!985762 () Bool)

(assert (=> b!1454918 (=> (not res!985762) (not e!818713))))

(assert (=> b!1454918 (= res!985762 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47509 a!2862) j!93) mask!2687) (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!637598))))

(assert (=> b!1454918 (= lt!637598 (Intermediate!11786 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454919 () Bool)

(assert (=> b!1454919 (= e!818707 (not e!818710))))

(declare-fun res!985759 () Bool)

(assert (=> b!1454919 (=> res!985759 e!818710)))

(assert (=> b!1454919 (= res!985759 (or (and (= (select (arr!47509 a!2862) index!646) (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47509 a!2862) index!646) (select (arr!47509 a!2862) j!93))) (= (select (arr!47509 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454919 e!818714))

(declare-fun res!985750 () Bool)

(assert (=> b!1454919 (=> (not res!985750) (not e!818714))))

(assert (=> b!1454919 (= res!985750 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48909 0))(
  ( (Unit!48910) )
))
(declare-fun lt!637592 () Unit!48909)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48909)

(assert (=> b!1454919 (= lt!637592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454920 () Bool)

(assert (=> b!1454920 (= e!818715 e!818711)))

(declare-fun res!985748 () Bool)

(assert (=> b!1454920 (=> (not res!985748) (not e!818711))))

(assert (=> b!1454920 (= res!985748 (= (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454920 (= lt!637597 (array!98441 (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48061 a!2862)))))

(declare-fun b!1454921 () Bool)

(declare-fun res!985754 () Bool)

(assert (=> b!1454921 (=> (not res!985754) (not e!818707))))

(assert (=> b!1454921 (= res!985754 e!818712)))

(declare-fun c!134091 () Bool)

(assert (=> b!1454921 (= c!134091 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454922 () Bool)

(assert (=> b!1454922 (= e!818714 (and (or (= (select (arr!47509 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47509 a!2862) intermediateBeforeIndex!19) (select (arr!47509 a!2862) j!93))) (let ((bdg!53125 (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47509 a!2862) index!646) bdg!53125) (= (select (arr!47509 a!2862) index!646) (select (arr!47509 a!2862) j!93))) (= (select (arr!47509 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53125 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!125014 res!985749) b!1454908))

(assert (= (and b!1454908 res!985757) b!1454917))

(assert (= (and b!1454917 res!985747) b!1454916))

(assert (= (and b!1454916 res!985755) b!1454915))

(assert (= (and b!1454915 res!985751) b!1454905))

(assert (= (and b!1454905 res!985756) b!1454914))

(assert (= (and b!1454914 res!985760) b!1454920))

(assert (= (and b!1454920 res!985748) b!1454918))

(assert (= (and b!1454918 res!985762) b!1454902))

(assert (= (and b!1454902 res!985761) b!1454913))

(assert (= (and b!1454913 res!985746) b!1454921))

(assert (= (and b!1454921 c!134091) b!1454903))

(assert (= (and b!1454921 (not c!134091)) b!1454901))

(assert (= (and b!1454921 res!985754) b!1454910))

(assert (= (and b!1454910 res!985753) b!1454919))

(assert (= (and b!1454919 res!985750) b!1454907))

(assert (= (and b!1454907 res!985758) b!1454922))

(assert (= (and b!1454919 (not res!985759)) b!1454906))

(assert (= (and b!1454906 (not res!985752)) b!1454911))

(assert (= (and b!1454911 (not res!985745)) b!1454909))

(assert (= (and b!1454909 c!134092) b!1454904))

(assert (= (and b!1454909 (not c!134092)) b!1454912))

(declare-fun m!1342683 () Bool)

(assert (=> b!1454917 m!1342683))

(assert (=> b!1454917 m!1342683))

(declare-fun m!1342685 () Bool)

(assert (=> b!1454917 m!1342685))

(declare-fun m!1342687 () Bool)

(assert (=> b!1454916 m!1342687))

(assert (=> b!1454916 m!1342687))

(declare-fun m!1342689 () Bool)

(assert (=> b!1454916 m!1342689))

(declare-fun m!1342691 () Bool)

(assert (=> b!1454906 m!1342691))

(declare-fun m!1342693 () Bool)

(assert (=> b!1454906 m!1342693))

(declare-fun m!1342695 () Bool)

(assert (=> b!1454906 m!1342695))

(declare-fun m!1342697 () Bool)

(assert (=> start!125014 m!1342697))

(declare-fun m!1342699 () Bool)

(assert (=> start!125014 m!1342699))

(declare-fun m!1342701 () Bool)

(assert (=> b!1454903 m!1342701))

(declare-fun m!1342703 () Bool)

(assert (=> b!1454913 m!1342703))

(assert (=> b!1454913 m!1342703))

(declare-fun m!1342705 () Bool)

(assert (=> b!1454913 m!1342705))

(declare-fun m!1342707 () Bool)

(assert (=> b!1454913 m!1342707))

(declare-fun m!1342709 () Bool)

(assert (=> b!1454913 m!1342709))

(declare-fun m!1342711 () Bool)

(assert (=> b!1454904 m!1342711))

(assert (=> b!1454902 m!1342687))

(assert (=> b!1454902 m!1342687))

(declare-fun m!1342713 () Bool)

(assert (=> b!1454902 m!1342713))

(assert (=> b!1454918 m!1342687))

(assert (=> b!1454918 m!1342687))

(declare-fun m!1342715 () Bool)

(assert (=> b!1454918 m!1342715))

(assert (=> b!1454918 m!1342715))

(assert (=> b!1454918 m!1342687))

(declare-fun m!1342717 () Bool)

(assert (=> b!1454918 m!1342717))

(declare-fun m!1342719 () Bool)

(assert (=> b!1454919 m!1342719))

(assert (=> b!1454919 m!1342707))

(declare-fun m!1342721 () Bool)

(assert (=> b!1454919 m!1342721))

(declare-fun m!1342723 () Bool)

(assert (=> b!1454919 m!1342723))

(declare-fun m!1342725 () Bool)

(assert (=> b!1454919 m!1342725))

(assert (=> b!1454919 m!1342687))

(assert (=> b!1454922 m!1342707))

(declare-fun m!1342727 () Bool)

(assert (=> b!1454922 m!1342727))

(assert (=> b!1454922 m!1342721))

(assert (=> b!1454922 m!1342723))

(assert (=> b!1454922 m!1342687))

(assert (=> b!1454911 m!1342687))

(assert (=> b!1454911 m!1342687))

(declare-fun m!1342729 () Bool)

(assert (=> b!1454911 m!1342729))

(declare-fun m!1342731 () Bool)

(assert (=> b!1454905 m!1342731))

(declare-fun m!1342733 () Bool)

(assert (=> b!1454912 m!1342733))

(assert (=> b!1454907 m!1342687))

(assert (=> b!1454907 m!1342687))

(declare-fun m!1342735 () Bool)

(assert (=> b!1454907 m!1342735))

(declare-fun m!1342737 () Bool)

(assert (=> b!1454915 m!1342737))

(assert (=> b!1454920 m!1342707))

(declare-fun m!1342739 () Bool)

(assert (=> b!1454920 m!1342739))

(assert (=> b!1454901 m!1342693))

(assert (=> b!1454901 m!1342695))

(check-sat (not b!1454901) (not b!1454906) (not b!1454903) (not b!1454915) (not b!1454907) (not b!1454911) (not b!1454913) (not start!125014) (not b!1454912) (not b!1454919) (not b!1454904) (not b!1454916) (not b!1454918) (not b!1454905) (not b!1454902) (not b!1454917))
(check-sat)
