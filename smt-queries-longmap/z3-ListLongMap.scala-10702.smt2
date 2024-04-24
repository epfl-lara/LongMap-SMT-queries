; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125628 () Bool)

(assert start!125628)

(declare-fun b!1466731 () Bool)

(declare-fun res!994605 () Bool)

(declare-fun e!824308 () Bool)

(assert (=> b!1466731 (=> (not res!994605) (not e!824308))))

(declare-datatypes ((array!98914 0))(
  ( (array!98915 (arr!47740 (Array (_ BitVec 32) (_ BitVec 64))) (size!48291 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98914)

(declare-datatypes ((List!34228 0))(
  ( (Nil!34225) (Cons!34224 (h!35588 (_ BitVec 64)) (t!48914 List!34228)) )
))
(declare-fun arrayNoDuplicates!0 (array!98914 (_ BitVec 32) List!34228) Bool)

(assert (=> b!1466731 (= res!994605 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34225))))

(declare-fun b!1466732 () Bool)

(declare-fun e!824304 () Bool)

(declare-fun e!824310 () Bool)

(assert (=> b!1466732 (= e!824304 (not e!824310))))

(declare-fun res!994602 () Bool)

(assert (=> b!1466732 (=> res!994602 e!824310)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466732 (= res!994602 (or (and (= (select (arr!47740 a!2862) index!646) (select (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47740 a!2862) index!646) (select (arr!47740 a!2862) j!93))) (= (select (arr!47740 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!824311 () Bool)

(assert (=> b!1466732 e!824311))

(declare-fun res!994597 () Bool)

(assert (=> b!1466732 (=> (not res!994597) (not e!824311))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98914 (_ BitVec 32)) Bool)

(assert (=> b!1466732 (= res!994597 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49307 0))(
  ( (Unit!49308) )
))
(declare-fun lt!641910 () Unit!49307)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49307)

(assert (=> b!1466732 (= lt!641910 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466733 () Bool)

(declare-fun res!994600 () Bool)

(assert (=> b!1466733 (=> (not res!994600) (not e!824308))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466733 (= res!994600 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48291 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48291 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48291 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466734 () Bool)

(declare-fun e!824309 () Bool)

(declare-fun e!824307 () Bool)

(assert (=> b!1466734 (= e!824309 e!824307)))

(declare-fun res!994596 () Bool)

(assert (=> b!1466734 (=> (not res!994596) (not e!824307))))

(declare-datatypes ((SeekEntryResult!11889 0))(
  ( (MissingZero!11889 (index!49948 (_ BitVec 32))) (Found!11889 (index!49949 (_ BitVec 32))) (Intermediate!11889 (undefined!12701 Bool) (index!49950 (_ BitVec 32)) (x!131715 (_ BitVec 32))) (Undefined!11889) (MissingVacant!11889 (index!49951 (_ BitVec 32))) )
))
(declare-fun lt!641912 () SeekEntryResult!11889)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98914 (_ BitVec 32)) SeekEntryResult!11889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466734 (= res!994596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47740 a!2862) j!93) mask!2687) (select (arr!47740 a!2862) j!93) a!2862 mask!2687) lt!641912))))

(assert (=> b!1466734 (= lt!641912 (Intermediate!11889 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466735 () Bool)

(assert (=> b!1466735 (= e!824311 (or (= (select (arr!47740 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47740 a!2862) intermediateBeforeIndex!19) (select (arr!47740 a!2862) j!93))))))

(declare-fun b!1466736 () Bool)

(declare-fun res!994609 () Bool)

(assert (=> b!1466736 (=> (not res!994609) (not e!824308))))

(assert (=> b!1466736 (= res!994609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466737 () Bool)

(declare-fun res!994604 () Bool)

(assert (=> b!1466737 (=> (not res!994604) (not e!824304))))

(declare-fun e!824312 () Bool)

(assert (=> b!1466737 (= res!994604 e!824312)))

(declare-fun c!135589 () Bool)

(assert (=> b!1466737 (= c!135589 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466738 () Bool)

(assert (=> b!1466738 (= e!824307 e!824304)))

(declare-fun res!994610 () Bool)

(assert (=> b!1466738 (=> (not res!994610) (not e!824304))))

(declare-fun lt!641909 () SeekEntryResult!11889)

(assert (=> b!1466738 (= res!994610 (= lt!641909 (Intermediate!11889 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641911 () (_ BitVec 64))

(declare-fun lt!641908 () array!98914)

(assert (=> b!1466738 (= lt!641909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641911 mask!2687) lt!641911 lt!641908 mask!2687))))

(assert (=> b!1466738 (= lt!641911 (select (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466739 () Bool)

(declare-fun res!994601 () Bool)

(declare-fun e!824306 () Bool)

(assert (=> b!1466739 (=> res!994601 e!824306)))

(declare-fun lt!641913 () (_ BitVec 32))

(assert (=> b!1466739 (= res!994601 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641913 (select (arr!47740 a!2862) j!93) a!2862 mask!2687) lt!641912)))))

(declare-fun b!1466740 () Bool)

(declare-fun e!824305 () Bool)

(assert (=> b!1466740 (= e!824305 (not (= lt!641909 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641913 lt!641911 lt!641908 mask!2687))))))

(declare-fun res!994603 () Bool)

(assert (=> start!125628 (=> (not res!994603) (not e!824308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125628 (= res!994603 (validMask!0 mask!2687))))

(assert (=> start!125628 e!824308))

(assert (=> start!125628 true))

(declare-fun array_inv!37021 (array!98914) Bool)

(assert (=> start!125628 (array_inv!37021 a!2862)))

(declare-fun b!1466741 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98914 (_ BitVec 32)) SeekEntryResult!11889)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98914 (_ BitVec 32)) SeekEntryResult!11889)

(assert (=> b!1466741 (= e!824312 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641911 lt!641908 mask!2687) (seekEntryOrOpen!0 lt!641911 lt!641908 mask!2687)))))

(declare-fun b!1466742 () Bool)

(assert (=> b!1466742 (= e!824310 e!824306)))

(declare-fun res!994606 () Bool)

(assert (=> b!1466742 (=> res!994606 e!824306)))

(assert (=> b!1466742 (= res!994606 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641913 #b00000000000000000000000000000000) (bvsge lt!641913 (size!48291 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466742 (= lt!641913 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1466743 () Bool)

(declare-fun res!994599 () Bool)

(assert (=> b!1466743 (=> (not res!994599) (not e!824308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466743 (= res!994599 (validKeyInArray!0 (select (arr!47740 a!2862) i!1006)))))

(declare-fun b!1466744 () Bool)

(declare-fun res!994607 () Bool)

(assert (=> b!1466744 (=> (not res!994607) (not e!824304))))

(assert (=> b!1466744 (= res!994607 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466745 () Bool)

(assert (=> b!1466745 (= e!824305 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641913 intermediateAfterIndex!19 lt!641911 lt!641908 mask!2687) (seekEntryOrOpen!0 lt!641911 lt!641908 mask!2687))))))

(declare-fun b!1466746 () Bool)

(declare-fun res!994613 () Bool)

(assert (=> b!1466746 (=> (not res!994613) (not e!824308))))

(assert (=> b!1466746 (= res!994613 (validKeyInArray!0 (select (arr!47740 a!2862) j!93)))))

(declare-fun b!1466747 () Bool)

(declare-fun res!994598 () Bool)

(assert (=> b!1466747 (=> (not res!994598) (not e!824311))))

(assert (=> b!1466747 (= res!994598 (= (seekEntryOrOpen!0 (select (arr!47740 a!2862) j!93) a!2862 mask!2687) (Found!11889 j!93)))))

(declare-fun b!1466748 () Bool)

(assert (=> b!1466748 (= e!824308 e!824309)))

(declare-fun res!994612 () Bool)

(assert (=> b!1466748 (=> (not res!994612) (not e!824309))))

(assert (=> b!1466748 (= res!994612 (= (select (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466748 (= lt!641908 (array!98915 (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48291 a!2862)))))

(declare-fun b!1466749 () Bool)

(declare-fun res!994611 () Bool)

(assert (=> b!1466749 (=> (not res!994611) (not e!824308))))

(assert (=> b!1466749 (= res!994611 (and (= (size!48291 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48291 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48291 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466750 () Bool)

(assert (=> b!1466750 (= e!824306 true)))

(declare-fun lt!641914 () Bool)

(assert (=> b!1466750 (= lt!641914 e!824305)))

(declare-fun c!135588 () Bool)

(assert (=> b!1466750 (= c!135588 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466751 () Bool)

(declare-fun res!994608 () Bool)

(assert (=> b!1466751 (=> (not res!994608) (not e!824307))))

(assert (=> b!1466751 (= res!994608 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47740 a!2862) j!93) a!2862 mask!2687) lt!641912))))

(declare-fun b!1466752 () Bool)

(assert (=> b!1466752 (= e!824312 (= lt!641909 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641911 lt!641908 mask!2687)))))

(assert (= (and start!125628 res!994603) b!1466749))

(assert (= (and b!1466749 res!994611) b!1466743))

(assert (= (and b!1466743 res!994599) b!1466746))

(assert (= (and b!1466746 res!994613) b!1466736))

(assert (= (and b!1466736 res!994609) b!1466731))

(assert (= (and b!1466731 res!994605) b!1466733))

(assert (= (and b!1466733 res!994600) b!1466748))

(assert (= (and b!1466748 res!994612) b!1466734))

(assert (= (and b!1466734 res!994596) b!1466751))

(assert (= (and b!1466751 res!994608) b!1466738))

(assert (= (and b!1466738 res!994610) b!1466737))

(assert (= (and b!1466737 c!135589) b!1466752))

(assert (= (and b!1466737 (not c!135589)) b!1466741))

(assert (= (and b!1466737 res!994604) b!1466744))

(assert (= (and b!1466744 res!994607) b!1466732))

(assert (= (and b!1466732 res!994597) b!1466747))

(assert (= (and b!1466747 res!994598) b!1466735))

(assert (= (and b!1466732 (not res!994602)) b!1466742))

(assert (= (and b!1466742 (not res!994606)) b!1466739))

(assert (= (and b!1466739 (not res!994601)) b!1466750))

(assert (= (and b!1466750 c!135588) b!1466740))

(assert (= (and b!1466750 (not c!135588)) b!1466745))

(declare-fun m!1353853 () Bool)

(assert (=> b!1466751 m!1353853))

(assert (=> b!1466751 m!1353853))

(declare-fun m!1353855 () Bool)

(assert (=> b!1466751 m!1353855))

(declare-fun m!1353857 () Bool)

(assert (=> b!1466745 m!1353857))

(declare-fun m!1353859 () Bool)

(assert (=> b!1466745 m!1353859))

(assert (=> b!1466739 m!1353853))

(assert (=> b!1466739 m!1353853))

(declare-fun m!1353861 () Bool)

(assert (=> b!1466739 m!1353861))

(declare-fun m!1353863 () Bool)

(assert (=> b!1466736 m!1353863))

(declare-fun m!1353865 () Bool)

(assert (=> start!125628 m!1353865))

(declare-fun m!1353867 () Bool)

(assert (=> start!125628 m!1353867))

(declare-fun m!1353869 () Bool)

(assert (=> b!1466748 m!1353869))

(declare-fun m!1353871 () Bool)

(assert (=> b!1466748 m!1353871))

(declare-fun m!1353873 () Bool)

(assert (=> b!1466735 m!1353873))

(assert (=> b!1466735 m!1353853))

(declare-fun m!1353875 () Bool)

(assert (=> b!1466740 m!1353875))

(assert (=> b!1466734 m!1353853))

(assert (=> b!1466734 m!1353853))

(declare-fun m!1353877 () Bool)

(assert (=> b!1466734 m!1353877))

(assert (=> b!1466734 m!1353877))

(assert (=> b!1466734 m!1353853))

(declare-fun m!1353879 () Bool)

(assert (=> b!1466734 m!1353879))

(declare-fun m!1353881 () Bool)

(assert (=> b!1466743 m!1353881))

(assert (=> b!1466743 m!1353881))

(declare-fun m!1353883 () Bool)

(assert (=> b!1466743 m!1353883))

(assert (=> b!1466747 m!1353853))

(assert (=> b!1466747 m!1353853))

(declare-fun m!1353885 () Bool)

(assert (=> b!1466747 m!1353885))

(declare-fun m!1353887 () Bool)

(assert (=> b!1466738 m!1353887))

(assert (=> b!1466738 m!1353887))

(declare-fun m!1353889 () Bool)

(assert (=> b!1466738 m!1353889))

(assert (=> b!1466738 m!1353869))

(declare-fun m!1353891 () Bool)

(assert (=> b!1466738 m!1353891))

(declare-fun m!1353893 () Bool)

(assert (=> b!1466752 m!1353893))

(declare-fun m!1353895 () Bool)

(assert (=> b!1466742 m!1353895))

(declare-fun m!1353897 () Bool)

(assert (=> b!1466732 m!1353897))

(assert (=> b!1466732 m!1353869))

(declare-fun m!1353899 () Bool)

(assert (=> b!1466732 m!1353899))

(declare-fun m!1353901 () Bool)

(assert (=> b!1466732 m!1353901))

(declare-fun m!1353903 () Bool)

(assert (=> b!1466732 m!1353903))

(assert (=> b!1466732 m!1353853))

(declare-fun m!1353905 () Bool)

(assert (=> b!1466731 m!1353905))

(declare-fun m!1353907 () Bool)

(assert (=> b!1466741 m!1353907))

(assert (=> b!1466741 m!1353859))

(assert (=> b!1466746 m!1353853))

(assert (=> b!1466746 m!1353853))

(declare-fun m!1353909 () Bool)

(assert (=> b!1466746 m!1353909))

(check-sat (not b!1466731) (not b!1466745) (not b!1466751) (not b!1466740) (not b!1466738) (not b!1466734) (not b!1466742) (not b!1466741) (not b!1466746) (not b!1466732) (not b!1466739) (not b!1466736) (not b!1466743) (not start!125628) (not b!1466752) (not b!1466747))
(check-sat)
