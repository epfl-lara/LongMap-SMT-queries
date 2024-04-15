; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125224 () Bool)

(assert start!125224)

(declare-fun b!1461660 () Bool)

(declare-fun e!821692 () Bool)

(assert (=> b!1461660 (= e!821692 true)))

(declare-fun lt!640032 () Bool)

(declare-fun e!821689 () Bool)

(assert (=> b!1461660 (= lt!640032 e!821689)))

(declare-fun c!134685 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461660 (= c!134685 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461661 () Bool)

(declare-fun res!991320 () Bool)

(declare-fun e!821690 () Bool)

(assert (=> b!1461661 (=> (not res!991320) (not e!821690))))

(declare-datatypes ((array!98650 0))(
  ( (array!98651 (arr!47614 (Array (_ BitVec 32) (_ BitVec 64))) (size!48166 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98650)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11891 0))(
  ( (MissingZero!11891 (index!49956 (_ BitVec 32))) (Found!11891 (index!49957 (_ BitVec 32))) (Intermediate!11891 (undefined!12703 Bool) (index!49958 (_ BitVec 32)) (x!131551 (_ BitVec 32))) (Undefined!11891) (MissingVacant!11891 (index!49959 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98650 (_ BitVec 32)) SeekEntryResult!11891)

(assert (=> b!1461661 (= res!991320 (= (seekEntryOrOpen!0 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) (Found!11891 j!93)))))

(declare-fun b!1461663 () Bool)

(declare-fun res!991322 () Bool)

(declare-fun e!821693 () Bool)

(assert (=> b!1461663 (=> (not res!991322) (not e!821693))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461663 (= res!991322 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48166 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48166 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48166 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461664 () Bool)

(declare-fun e!821691 () Bool)

(assert (=> b!1461664 (= e!821693 e!821691)))

(declare-fun res!991331 () Bool)

(assert (=> b!1461664 (=> (not res!991331) (not e!821691))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461664 (= res!991331 (= (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640035 () array!98650)

(assert (=> b!1461664 (= lt!640035 (array!98651 (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48166 a!2862)))))

(declare-fun b!1461665 () Bool)

(declare-fun res!991321 () Bool)

(assert (=> b!1461665 (=> (not res!991321) (not e!821693))))

(declare-datatypes ((List!34193 0))(
  ( (Nil!34190) (Cons!34189 (h!35539 (_ BitVec 64)) (t!48879 List!34193)) )
))
(declare-fun arrayNoDuplicates!0 (array!98650 (_ BitVec 32) List!34193) Bool)

(assert (=> b!1461665 (= res!991321 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34190))))

(declare-fun b!1461666 () Bool)

(declare-fun res!991327 () Bool)

(declare-fun e!821688 () Bool)

(assert (=> b!1461666 (=> (not res!991327) (not e!821688))))

(declare-fun e!821694 () Bool)

(assert (=> b!1461666 (= res!991327 e!821694)))

(declare-fun c!134686 () Bool)

(assert (=> b!1461666 (= c!134686 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461667 () Bool)

(declare-fun lt!640033 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98650 (_ BitVec 32)) SeekEntryResult!11891)

(assert (=> b!1461667 (= e!821694 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640033 lt!640035 mask!2687) (seekEntryOrOpen!0 lt!640033 lt!640035 mask!2687)))))

(declare-fun b!1461668 () Bool)

(assert (=> b!1461668 (= e!821690 (or (= (select (arr!47614 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47614 a!2862) intermediateBeforeIndex!19) (select (arr!47614 a!2862) j!93))))))

(declare-fun b!1461669 () Bool)

(declare-fun res!991326 () Bool)

(assert (=> b!1461669 (=> (not res!991326) (not e!821693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461669 (= res!991326 (validKeyInArray!0 (select (arr!47614 a!2862) i!1006)))))

(declare-fun b!1461670 () Bool)

(declare-fun res!991332 () Bool)

(assert (=> b!1461670 (=> (not res!991332) (not e!821693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98650 (_ BitVec 32)) Bool)

(assert (=> b!1461670 (= res!991332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461671 () Bool)

(declare-fun res!991330 () Bool)

(assert (=> b!1461671 (=> res!991330 e!821692)))

(declare-fun lt!640029 () SeekEntryResult!11891)

(declare-fun lt!640030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98650 (_ BitVec 32)) SeekEntryResult!11891)

(assert (=> b!1461671 (= res!991330 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640030 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!640029)))))

(declare-fun b!1461672 () Bool)

(declare-fun res!991319 () Bool)

(assert (=> b!1461672 (=> (not res!991319) (not e!821688))))

(assert (=> b!1461672 (= res!991319 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461673 () Bool)

(declare-fun res!991329 () Bool)

(assert (=> b!1461673 (=> (not res!991329) (not e!821693))))

(assert (=> b!1461673 (= res!991329 (validKeyInArray!0 (select (arr!47614 a!2862) j!93)))))

(declare-fun b!1461674 () Bool)

(declare-fun res!991325 () Bool)

(assert (=> b!1461674 (=> (not res!991325) (not e!821693))))

(assert (=> b!1461674 (= res!991325 (and (= (size!48166 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48166 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48166 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461675 () Bool)

(assert (=> b!1461675 (= e!821689 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640030 intermediateAfterIndex!19 lt!640033 lt!640035 mask!2687) (seekEntryOrOpen!0 lt!640033 lt!640035 mask!2687))))))

(declare-fun res!991318 () Bool)

(assert (=> start!125224 (=> (not res!991318) (not e!821693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125224 (= res!991318 (validMask!0 mask!2687))))

(assert (=> start!125224 e!821693))

(assert (=> start!125224 true))

(declare-fun array_inv!36847 (array!98650) Bool)

(assert (=> start!125224 (array_inv!36847 a!2862)))

(declare-fun b!1461662 () Bool)

(declare-fun e!821686 () Bool)

(assert (=> b!1461662 (= e!821686 e!821688)))

(declare-fun res!991328 () Bool)

(assert (=> b!1461662 (=> (not res!991328) (not e!821688))))

(declare-fun lt!640031 () SeekEntryResult!11891)

(assert (=> b!1461662 (= res!991328 (= lt!640031 (Intermediate!11891 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461662 (= lt!640031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640033 mask!2687) lt!640033 lt!640035 mask!2687))))

(assert (=> b!1461662 (= lt!640033 (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461676 () Bool)

(assert (=> b!1461676 (= e!821691 e!821686)))

(declare-fun res!991323 () Bool)

(assert (=> b!1461676 (=> (not res!991323) (not e!821686))))

(assert (=> b!1461676 (= res!991323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47614 a!2862) j!93) mask!2687) (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!640029))))

(assert (=> b!1461676 (= lt!640029 (Intermediate!11891 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461677 () Bool)

(declare-fun e!821685 () Bool)

(assert (=> b!1461677 (= e!821688 (not e!821685))))

(declare-fun res!991316 () Bool)

(assert (=> b!1461677 (=> res!991316 e!821685)))

(assert (=> b!1461677 (= res!991316 (or (and (= (select (arr!47614 a!2862) index!646) (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47614 a!2862) index!646) (select (arr!47614 a!2862) j!93))) (= (select (arr!47614 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461677 e!821690))

(declare-fun res!991324 () Bool)

(assert (=> b!1461677 (=> (not res!991324) (not e!821690))))

(assert (=> b!1461677 (= res!991324 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49119 0))(
  ( (Unit!49120) )
))
(declare-fun lt!640034 () Unit!49119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49119)

(assert (=> b!1461677 (= lt!640034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461678 () Bool)

(declare-fun res!991317 () Bool)

(assert (=> b!1461678 (=> (not res!991317) (not e!821686))))

(assert (=> b!1461678 (= res!991317 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!640029))))

(declare-fun b!1461679 () Bool)

(assert (=> b!1461679 (= e!821689 (not (= lt!640031 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640030 lt!640033 lt!640035 mask!2687))))))

(declare-fun b!1461680 () Bool)

(assert (=> b!1461680 (= e!821685 e!821692)))

(declare-fun res!991333 () Bool)

(assert (=> b!1461680 (=> res!991333 e!821692)))

(assert (=> b!1461680 (= res!991333 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640030 #b00000000000000000000000000000000) (bvsge lt!640030 (size!48166 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461680 (= lt!640030 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461681 () Bool)

(assert (=> b!1461681 (= e!821694 (= lt!640031 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640033 lt!640035 mask!2687)))))

(assert (= (and start!125224 res!991318) b!1461674))

(assert (= (and b!1461674 res!991325) b!1461669))

(assert (= (and b!1461669 res!991326) b!1461673))

(assert (= (and b!1461673 res!991329) b!1461670))

(assert (= (and b!1461670 res!991332) b!1461665))

(assert (= (and b!1461665 res!991321) b!1461663))

(assert (= (and b!1461663 res!991322) b!1461664))

(assert (= (and b!1461664 res!991331) b!1461676))

(assert (= (and b!1461676 res!991323) b!1461678))

(assert (= (and b!1461678 res!991317) b!1461662))

(assert (= (and b!1461662 res!991328) b!1461666))

(assert (= (and b!1461666 c!134686) b!1461681))

(assert (= (and b!1461666 (not c!134686)) b!1461667))

(assert (= (and b!1461666 res!991327) b!1461672))

(assert (= (and b!1461672 res!991319) b!1461677))

(assert (= (and b!1461677 res!991324) b!1461661))

(assert (= (and b!1461661 res!991320) b!1461668))

(assert (= (and b!1461677 (not res!991316)) b!1461680))

(assert (= (and b!1461680 (not res!991333)) b!1461671))

(assert (= (and b!1461671 (not res!991330)) b!1461660))

(assert (= (and b!1461660 c!134685) b!1461679))

(assert (= (and b!1461660 (not c!134685)) b!1461675))

(declare-fun m!1348707 () Bool)

(assert (=> b!1461670 m!1348707))

(declare-fun m!1348709 () Bool)

(assert (=> b!1461677 m!1348709))

(declare-fun m!1348711 () Bool)

(assert (=> b!1461677 m!1348711))

(declare-fun m!1348713 () Bool)

(assert (=> b!1461677 m!1348713))

(declare-fun m!1348715 () Bool)

(assert (=> b!1461677 m!1348715))

(declare-fun m!1348717 () Bool)

(assert (=> b!1461677 m!1348717))

(declare-fun m!1348719 () Bool)

(assert (=> b!1461677 m!1348719))

(declare-fun m!1348721 () Bool)

(assert (=> b!1461668 m!1348721))

(assert (=> b!1461668 m!1348719))

(declare-fun m!1348723 () Bool)

(assert (=> start!125224 m!1348723))

(declare-fun m!1348725 () Bool)

(assert (=> start!125224 m!1348725))

(declare-fun m!1348727 () Bool)

(assert (=> b!1461675 m!1348727))

(declare-fun m!1348729 () Bool)

(assert (=> b!1461675 m!1348729))

(declare-fun m!1348731 () Bool)

(assert (=> b!1461680 m!1348731))

(assert (=> b!1461661 m!1348719))

(assert (=> b!1461661 m!1348719))

(declare-fun m!1348733 () Bool)

(assert (=> b!1461661 m!1348733))

(declare-fun m!1348735 () Bool)

(assert (=> b!1461662 m!1348735))

(assert (=> b!1461662 m!1348735))

(declare-fun m!1348737 () Bool)

(assert (=> b!1461662 m!1348737))

(assert (=> b!1461662 m!1348711))

(declare-fun m!1348739 () Bool)

(assert (=> b!1461662 m!1348739))

(assert (=> b!1461676 m!1348719))

(assert (=> b!1461676 m!1348719))

(declare-fun m!1348741 () Bool)

(assert (=> b!1461676 m!1348741))

(assert (=> b!1461676 m!1348741))

(assert (=> b!1461676 m!1348719))

(declare-fun m!1348743 () Bool)

(assert (=> b!1461676 m!1348743))

(declare-fun m!1348745 () Bool)

(assert (=> b!1461679 m!1348745))

(declare-fun m!1348747 () Bool)

(assert (=> b!1461667 m!1348747))

(assert (=> b!1461667 m!1348729))

(declare-fun m!1348749 () Bool)

(assert (=> b!1461681 m!1348749))

(declare-fun m!1348751 () Bool)

(assert (=> b!1461669 m!1348751))

(assert (=> b!1461669 m!1348751))

(declare-fun m!1348753 () Bool)

(assert (=> b!1461669 m!1348753))

(assert (=> b!1461678 m!1348719))

(assert (=> b!1461678 m!1348719))

(declare-fun m!1348755 () Bool)

(assert (=> b!1461678 m!1348755))

(assert (=> b!1461664 m!1348711))

(declare-fun m!1348757 () Bool)

(assert (=> b!1461664 m!1348757))

(declare-fun m!1348759 () Bool)

(assert (=> b!1461665 m!1348759))

(assert (=> b!1461673 m!1348719))

(assert (=> b!1461673 m!1348719))

(declare-fun m!1348761 () Bool)

(assert (=> b!1461673 m!1348761))

(assert (=> b!1461671 m!1348719))

(assert (=> b!1461671 m!1348719))

(declare-fun m!1348763 () Bool)

(assert (=> b!1461671 m!1348763))

(check-sat (not b!1461662) (not b!1461676) (not b!1461673) (not b!1461667) (not b!1461671) (not b!1461681) (not b!1461679) (not b!1461677) (not b!1461670) (not b!1461665) (not start!125224) (not b!1461669) (not b!1461678) (not b!1461675) (not b!1461661) (not b!1461680))
(check-sat)
