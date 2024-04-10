; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125774 () Bool)

(assert start!125774)

(declare-fun b!1471907 () Bool)

(declare-fun res!999637 () Bool)

(declare-fun e!826136 () Bool)

(assert (=> b!1471907 (=> (not res!999637) (not e!826136))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99108 0))(
  ( (array!99109 (arr!47839 (Array (_ BitVec 32) (_ BitVec 64))) (size!48389 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99108)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471907 (= res!999637 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48389 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48389 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48389 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471908 () Bool)

(declare-fun res!999639 () Bool)

(assert (=> b!1471908 (=> (not res!999639) (not e!826136))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471908 (= res!999639 (validKeyInArray!0 (select (arr!47839 a!2862) j!93)))))

(declare-fun b!1471909 () Bool)

(declare-fun res!999640 () Bool)

(assert (=> b!1471909 (=> (not res!999640) (not e!826136))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471909 (= res!999640 (validKeyInArray!0 (select (arr!47839 a!2862) i!1006)))))

(declare-fun b!1471910 () Bool)

(declare-fun res!999633 () Bool)

(declare-fun e!826130 () Bool)

(assert (=> b!1471910 (=> (not res!999633) (not e!826130))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12079 0))(
  ( (MissingZero!12079 (index!50708 (_ BitVec 32))) (Found!12079 (index!50709 (_ BitVec 32))) (Intermediate!12079 (undefined!12891 Bool) (index!50710 (_ BitVec 32)) (x!132290 (_ BitVec 32))) (Undefined!12079) (MissingVacant!12079 (index!50711 (_ BitVec 32))) )
))
(declare-fun lt!643418 () SeekEntryResult!12079)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99108 (_ BitVec 32)) SeekEntryResult!12079)

(assert (=> b!1471910 (= res!999633 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47839 a!2862) j!93) a!2862 mask!2687) lt!643418))))

(declare-fun b!1471911 () Bool)

(declare-fun lt!643415 () array!99108)

(declare-fun lt!643416 () (_ BitVec 64))

(declare-fun e!826131 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99108 (_ BitVec 32)) SeekEntryResult!12079)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99108 (_ BitVec 32)) SeekEntryResult!12079)

(assert (=> b!1471911 (= e!826131 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643416 lt!643415 mask!2687) (seekEntryOrOpen!0 lt!643416 lt!643415 mask!2687)))))

(declare-fun e!826134 () Bool)

(declare-fun b!1471912 () Bool)

(assert (=> b!1471912 (= e!826134 (or (= (select (arr!47839 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47839 a!2862) intermediateBeforeIndex!19) (select (arr!47839 a!2862) j!93))))))

(declare-fun b!1471913 () Bool)

(declare-fun lt!643417 () SeekEntryResult!12079)

(assert (=> b!1471913 (= e!826131 (= lt!643417 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643416 lt!643415 mask!2687)))))

(declare-fun b!1471915 () Bool)

(declare-fun res!999635 () Bool)

(assert (=> b!1471915 (=> (not res!999635) (not e!826134))))

(assert (=> b!1471915 (= res!999635 (= (seekEntryOrOpen!0 (select (arr!47839 a!2862) j!93) a!2862 mask!2687) (Found!12079 j!93)))))

(declare-fun b!1471916 () Bool)

(declare-fun res!999646 () Bool)

(declare-fun e!826133 () Bool)

(assert (=> b!1471916 (=> (not res!999646) (not e!826133))))

(assert (=> b!1471916 (= res!999646 e!826131)))

(declare-fun c!135651 () Bool)

(assert (=> b!1471916 (= c!135651 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471917 () Bool)

(declare-fun e!826132 () Bool)

(assert (=> b!1471917 (= e!826132 e!826130)))

(declare-fun res!999641 () Bool)

(assert (=> b!1471917 (=> (not res!999641) (not e!826130))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471917 (= res!999641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47839 a!2862) j!93) mask!2687) (select (arr!47839 a!2862) j!93) a!2862 mask!2687) lt!643418))))

(assert (=> b!1471917 (= lt!643418 (Intermediate!12079 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471918 () Bool)

(assert (=> b!1471918 (= e!826130 e!826133)))

(declare-fun res!999643 () Bool)

(assert (=> b!1471918 (=> (not res!999643) (not e!826133))))

(assert (=> b!1471918 (= res!999643 (= lt!643417 (Intermediate!12079 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471918 (= lt!643417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643416 mask!2687) lt!643416 lt!643415 mask!2687))))

(assert (=> b!1471918 (= lt!643416 (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471919 () Bool)

(declare-fun res!999636 () Bool)

(assert (=> b!1471919 (=> (not res!999636) (not e!826133))))

(assert (=> b!1471919 (= res!999636 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471920 () Bool)

(assert (=> b!1471920 (= e!826133 (not true))))

(assert (=> b!1471920 e!826134))

(declare-fun res!999632 () Bool)

(assert (=> b!1471920 (=> (not res!999632) (not e!826134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99108 (_ BitVec 32)) Bool)

(assert (=> b!1471920 (= res!999632 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49498 0))(
  ( (Unit!49499) )
))
(declare-fun lt!643419 () Unit!49498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49498)

(assert (=> b!1471920 (= lt!643419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471921 () Bool)

(assert (=> b!1471921 (= e!826136 e!826132)))

(declare-fun res!999644 () Bool)

(assert (=> b!1471921 (=> (not res!999644) (not e!826132))))

(assert (=> b!1471921 (= res!999644 (= (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471921 (= lt!643415 (array!99109 (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48389 a!2862)))))

(declare-fun b!1471914 () Bool)

(declare-fun res!999638 () Bool)

(assert (=> b!1471914 (=> (not res!999638) (not e!826136))))

(assert (=> b!1471914 (= res!999638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!999642 () Bool)

(assert (=> start!125774 (=> (not res!999642) (not e!826136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125774 (= res!999642 (validMask!0 mask!2687))))

(assert (=> start!125774 e!826136))

(assert (=> start!125774 true))

(declare-fun array_inv!36867 (array!99108) Bool)

(assert (=> start!125774 (array_inv!36867 a!2862)))

(declare-fun b!1471922 () Bool)

(declare-fun res!999645 () Bool)

(assert (=> b!1471922 (=> (not res!999645) (not e!826136))))

(declare-datatypes ((List!34340 0))(
  ( (Nil!34337) (Cons!34336 (h!35692 (_ BitVec 64)) (t!49034 List!34340)) )
))
(declare-fun arrayNoDuplicates!0 (array!99108 (_ BitVec 32) List!34340) Bool)

(assert (=> b!1471922 (= res!999645 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34337))))

(declare-fun b!1471923 () Bool)

(declare-fun res!999634 () Bool)

(assert (=> b!1471923 (=> (not res!999634) (not e!826136))))

(assert (=> b!1471923 (= res!999634 (and (= (size!48389 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48389 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48389 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125774 res!999642) b!1471923))

(assert (= (and b!1471923 res!999634) b!1471909))

(assert (= (and b!1471909 res!999640) b!1471908))

(assert (= (and b!1471908 res!999639) b!1471914))

(assert (= (and b!1471914 res!999638) b!1471922))

(assert (= (and b!1471922 res!999645) b!1471907))

(assert (= (and b!1471907 res!999637) b!1471921))

(assert (= (and b!1471921 res!999644) b!1471917))

(assert (= (and b!1471917 res!999641) b!1471910))

(assert (= (and b!1471910 res!999633) b!1471918))

(assert (= (and b!1471918 res!999643) b!1471916))

(assert (= (and b!1471916 c!135651) b!1471913))

(assert (= (and b!1471916 (not c!135651)) b!1471911))

(assert (= (and b!1471916 res!999646) b!1471919))

(assert (= (and b!1471919 res!999636) b!1471920))

(assert (= (and b!1471920 res!999632) b!1471915))

(assert (= (and b!1471915 res!999635) b!1471912))

(declare-fun m!1358673 () Bool)

(assert (=> b!1471918 m!1358673))

(assert (=> b!1471918 m!1358673))

(declare-fun m!1358675 () Bool)

(assert (=> b!1471918 m!1358675))

(declare-fun m!1358677 () Bool)

(assert (=> b!1471918 m!1358677))

(declare-fun m!1358679 () Bool)

(assert (=> b!1471918 m!1358679))

(declare-fun m!1358681 () Bool)

(assert (=> b!1471917 m!1358681))

(assert (=> b!1471917 m!1358681))

(declare-fun m!1358683 () Bool)

(assert (=> b!1471917 m!1358683))

(assert (=> b!1471917 m!1358683))

(assert (=> b!1471917 m!1358681))

(declare-fun m!1358685 () Bool)

(assert (=> b!1471917 m!1358685))

(declare-fun m!1358687 () Bool)

(assert (=> b!1471920 m!1358687))

(declare-fun m!1358689 () Bool)

(assert (=> b!1471920 m!1358689))

(declare-fun m!1358691 () Bool)

(assert (=> b!1471909 m!1358691))

(assert (=> b!1471909 m!1358691))

(declare-fun m!1358693 () Bool)

(assert (=> b!1471909 m!1358693))

(declare-fun m!1358695 () Bool)

(assert (=> start!125774 m!1358695))

(declare-fun m!1358697 () Bool)

(assert (=> start!125774 m!1358697))

(declare-fun m!1358699 () Bool)

(assert (=> b!1471911 m!1358699))

(declare-fun m!1358701 () Bool)

(assert (=> b!1471911 m!1358701))

(assert (=> b!1471921 m!1358677))

(declare-fun m!1358703 () Bool)

(assert (=> b!1471921 m!1358703))

(declare-fun m!1358705 () Bool)

(assert (=> b!1471912 m!1358705))

(assert (=> b!1471912 m!1358681))

(assert (=> b!1471908 m!1358681))

(assert (=> b!1471908 m!1358681))

(declare-fun m!1358707 () Bool)

(assert (=> b!1471908 m!1358707))

(assert (=> b!1471915 m!1358681))

(assert (=> b!1471915 m!1358681))

(declare-fun m!1358709 () Bool)

(assert (=> b!1471915 m!1358709))

(assert (=> b!1471910 m!1358681))

(assert (=> b!1471910 m!1358681))

(declare-fun m!1358711 () Bool)

(assert (=> b!1471910 m!1358711))

(declare-fun m!1358713 () Bool)

(assert (=> b!1471914 m!1358713))

(declare-fun m!1358715 () Bool)

(assert (=> b!1471913 m!1358715))

(declare-fun m!1358717 () Bool)

(assert (=> b!1471922 m!1358717))

(push 1)

(assert (not b!1471911))

(assert (not b!1471909))

(assert (not b!1471913))

(assert (not b!1471920))

(assert (not b!1471914))

