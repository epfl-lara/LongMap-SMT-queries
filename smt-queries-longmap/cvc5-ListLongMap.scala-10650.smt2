; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125038 () Bool)

(assert start!125038)

(declare-fun b!1454898 () Bool)

(declare-fun res!985674 () Bool)

(declare-fun e!818735 () Bool)

(assert (=> b!1454898 (=> (not res!985674) (not e!818735))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98486 0))(
  ( (array!98487 (arr!47531 (Array (_ BitVec 32) (_ BitVec 64))) (size!48081 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98486)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454898 (= res!985674 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48081 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48081 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48081 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!818740 () Bool)

(declare-datatypes ((SeekEntryResult!11783 0))(
  ( (MissingZero!11783 (index!49524 (_ BitVec 32))) (Found!11783 (index!49525 (_ BitVec 32))) (Intermediate!11783 (undefined!12595 Bool) (index!49526 (_ BitVec 32)) (x!131160 (_ BitVec 32))) (Undefined!11783) (MissingVacant!11783 (index!49527 (_ BitVec 32))) )
))
(declare-fun lt!637760 () SeekEntryResult!11783)

(declare-fun lt!637756 () (_ BitVec 64))

(declare-fun b!1454899 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637759 () array!98486)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98486 (_ BitVec 32)) SeekEntryResult!11783)

(assert (=> b!1454899 (= e!818740 (= lt!637760 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637756 lt!637759 mask!2687)))))

(declare-fun b!1454900 () Bool)

(declare-fun res!985677 () Bool)

(assert (=> b!1454900 (=> (not res!985677) (not e!818735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98486 (_ BitVec 32)) Bool)

(assert (=> b!1454900 (= res!985677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454901 () Bool)

(declare-fun e!818737 () Bool)

(declare-fun e!818736 () Bool)

(assert (=> b!1454901 (= e!818737 e!818736)))

(declare-fun res!985667 () Bool)

(assert (=> b!1454901 (=> (not res!985667) (not e!818736))))

(assert (=> b!1454901 (= res!985667 (= lt!637760 (Intermediate!11783 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454901 (= lt!637760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637756 mask!2687) lt!637756 lt!637759 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454901 (= lt!637756 (select (store (arr!47531 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!818733 () Bool)

(declare-fun b!1454902 () Bool)

(assert (=> b!1454902 (= e!818733 (and (or (= (select (arr!47531 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47531 a!2862) intermediateBeforeIndex!19) (select (arr!47531 a!2862) j!93))) (let ((bdg!53107 (select (store (arr!47531 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47531 a!2862) index!646) bdg!53107) (= (select (arr!47531 a!2862) index!646) (select (arr!47531 a!2862) j!93))) (= (select (arr!47531 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53107 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454903 () Bool)

(declare-fun e!818732 () Bool)

(assert (=> b!1454903 (= e!818736 (not e!818732))))

(declare-fun res!985672 () Bool)

(assert (=> b!1454903 (=> res!985672 e!818732)))

(assert (=> b!1454903 (= res!985672 (or (and (= (select (arr!47531 a!2862) index!646) (select (store (arr!47531 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47531 a!2862) index!646) (select (arr!47531 a!2862) j!93))) (= (select (arr!47531 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454903 e!818733))

(declare-fun res!985678 () Bool)

(assert (=> b!1454903 (=> (not res!985678) (not e!818733))))

(assert (=> b!1454903 (= res!985678 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49062 0))(
  ( (Unit!49063) )
))
(declare-fun lt!637754 () Unit!49062)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49062)

(assert (=> b!1454903 (= lt!637754 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454904 () Bool)

(declare-fun e!818741 () Bool)

(assert (=> b!1454904 (= e!818741 e!818737)))

(declare-fun res!985670 () Bool)

(assert (=> b!1454904 (=> (not res!985670) (not e!818737))))

(declare-fun lt!637755 () SeekEntryResult!11783)

(assert (=> b!1454904 (= res!985670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47531 a!2862) j!93) mask!2687) (select (arr!47531 a!2862) j!93) a!2862 mask!2687) lt!637755))))

(assert (=> b!1454904 (= lt!637755 (Intermediate!11783 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454905 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98486 (_ BitVec 32)) SeekEntryResult!11783)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98486 (_ BitVec 32)) SeekEntryResult!11783)

(assert (=> b!1454905 (= e!818740 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637756 lt!637759 mask!2687) (seekEntryOrOpen!0 lt!637756 lt!637759 mask!2687)))))

(declare-fun b!1454906 () Bool)

(declare-fun res!985673 () Bool)

(assert (=> b!1454906 (=> (not res!985673) (not e!818737))))

(assert (=> b!1454906 (= res!985673 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47531 a!2862) j!93) a!2862 mask!2687) lt!637755))))

(declare-fun b!1454907 () Bool)

(declare-fun e!818738 () Bool)

(assert (=> b!1454907 (= e!818732 e!818738)))

(declare-fun res!985669 () Bool)

(assert (=> b!1454907 (=> res!985669 e!818738)))

(declare-fun lt!637757 () (_ BitVec 32))

(assert (=> b!1454907 (= res!985669 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637757 #b00000000000000000000000000000000) (bvsge lt!637757 (size!48081 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454907 (= lt!637757 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637758 () SeekEntryResult!11783)

(assert (=> b!1454907 (= lt!637758 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637756 lt!637759 mask!2687))))

(assert (=> b!1454907 (= lt!637758 (seekEntryOrOpen!0 lt!637756 lt!637759 mask!2687))))

(declare-fun b!1454908 () Bool)

(assert (=> b!1454908 (= e!818738 true)))

(declare-fun lt!637761 () Bool)

(declare-fun e!818739 () Bool)

(assert (=> b!1454908 (= lt!637761 e!818739)))

(declare-fun c!134130 () Bool)

(assert (=> b!1454908 (= c!134130 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454909 () Bool)

(assert (=> b!1454909 (= e!818739 (not (= lt!637760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637757 lt!637756 lt!637759 mask!2687))))))

(declare-fun res!985671 () Bool)

(assert (=> start!125038 (=> (not res!985671) (not e!818735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125038 (= res!985671 (validMask!0 mask!2687))))

(assert (=> start!125038 e!818735))

(assert (=> start!125038 true))

(declare-fun array_inv!36559 (array!98486) Bool)

(assert (=> start!125038 (array_inv!36559 a!2862)))

(declare-fun b!1454910 () Bool)

(declare-fun res!985663 () Bool)

(assert (=> b!1454910 (=> (not res!985663) (not e!818735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454910 (= res!985663 (validKeyInArray!0 (select (arr!47531 a!2862) i!1006)))))

(declare-fun b!1454911 () Bool)

(declare-fun res!985676 () Bool)

(assert (=> b!1454911 (=> res!985676 e!818738)))

(assert (=> b!1454911 (= res!985676 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637757 (select (arr!47531 a!2862) j!93) a!2862 mask!2687) lt!637755)))))

(declare-fun b!1454912 () Bool)

(declare-fun res!985661 () Bool)

(assert (=> b!1454912 (=> (not res!985661) (not e!818735))))

(assert (=> b!1454912 (= res!985661 (and (= (size!48081 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48081 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48081 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454913 () Bool)

(declare-fun res!985664 () Bool)

(assert (=> b!1454913 (=> (not res!985664) (not e!818736))))

(assert (=> b!1454913 (= res!985664 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454914 () Bool)

(declare-fun res!985666 () Bool)

(assert (=> b!1454914 (=> (not res!985666) (not e!818733))))

(assert (=> b!1454914 (= res!985666 (= (seekEntryOrOpen!0 (select (arr!47531 a!2862) j!93) a!2862 mask!2687) (Found!11783 j!93)))))

(declare-fun b!1454915 () Bool)

(assert (=> b!1454915 (= e!818735 e!818741)))

(declare-fun res!985668 () Bool)

(assert (=> b!1454915 (=> (not res!985668) (not e!818741))))

(assert (=> b!1454915 (= res!985668 (= (select (store (arr!47531 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454915 (= lt!637759 (array!98487 (store (arr!47531 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48081 a!2862)))))

(declare-fun b!1454916 () Bool)

(declare-fun res!985662 () Bool)

(assert (=> b!1454916 (=> (not res!985662) (not e!818736))))

(assert (=> b!1454916 (= res!985662 e!818740)))

(declare-fun c!134129 () Bool)

(assert (=> b!1454916 (= c!134129 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454917 () Bool)

(declare-fun res!985665 () Bool)

(assert (=> b!1454917 (=> (not res!985665) (not e!818735))))

(declare-datatypes ((List!34032 0))(
  ( (Nil!34029) (Cons!34028 (h!35378 (_ BitVec 64)) (t!48726 List!34032)) )
))
(declare-fun arrayNoDuplicates!0 (array!98486 (_ BitVec 32) List!34032) Bool)

(assert (=> b!1454917 (= res!985665 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34029))))

(declare-fun b!1454918 () Bool)

(declare-fun res!985675 () Bool)

(assert (=> b!1454918 (=> (not res!985675) (not e!818735))))

(assert (=> b!1454918 (= res!985675 (validKeyInArray!0 (select (arr!47531 a!2862) j!93)))))

(declare-fun b!1454919 () Bool)

(assert (=> b!1454919 (= e!818739 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637757 intermediateAfterIndex!19 lt!637756 lt!637759 mask!2687) lt!637758)))))

(assert (= (and start!125038 res!985671) b!1454912))

(assert (= (and b!1454912 res!985661) b!1454910))

(assert (= (and b!1454910 res!985663) b!1454918))

(assert (= (and b!1454918 res!985675) b!1454900))

(assert (= (and b!1454900 res!985677) b!1454917))

(assert (= (and b!1454917 res!985665) b!1454898))

(assert (= (and b!1454898 res!985674) b!1454915))

(assert (= (and b!1454915 res!985668) b!1454904))

(assert (= (and b!1454904 res!985670) b!1454906))

(assert (= (and b!1454906 res!985673) b!1454901))

(assert (= (and b!1454901 res!985667) b!1454916))

(assert (= (and b!1454916 c!134129) b!1454899))

(assert (= (and b!1454916 (not c!134129)) b!1454905))

(assert (= (and b!1454916 res!985662) b!1454913))

(assert (= (and b!1454913 res!985664) b!1454903))

(assert (= (and b!1454903 res!985678) b!1454914))

(assert (= (and b!1454914 res!985666) b!1454902))

(assert (= (and b!1454903 (not res!985672)) b!1454907))

(assert (= (and b!1454907 (not res!985669)) b!1454911))

(assert (= (and b!1454911 (not res!985676)) b!1454908))

(assert (= (and b!1454908 c!134130) b!1454909))

(assert (= (and b!1454908 (not c!134130)) b!1454919))

(declare-fun m!1343185 () Bool)

(assert (=> b!1454918 m!1343185))

(assert (=> b!1454918 m!1343185))

(declare-fun m!1343187 () Bool)

(assert (=> b!1454918 m!1343187))

(declare-fun m!1343189 () Bool)

(assert (=> b!1454899 m!1343189))

(declare-fun m!1343191 () Bool)

(assert (=> b!1454915 m!1343191))

(declare-fun m!1343193 () Bool)

(assert (=> b!1454915 m!1343193))

(declare-fun m!1343195 () Bool)

(assert (=> b!1454905 m!1343195))

(declare-fun m!1343197 () Bool)

(assert (=> b!1454905 m!1343197))

(assert (=> b!1454904 m!1343185))

(assert (=> b!1454904 m!1343185))

(declare-fun m!1343199 () Bool)

(assert (=> b!1454904 m!1343199))

(assert (=> b!1454904 m!1343199))

(assert (=> b!1454904 m!1343185))

(declare-fun m!1343201 () Bool)

(assert (=> b!1454904 m!1343201))

(declare-fun m!1343203 () Bool)

(assert (=> start!125038 m!1343203))

(declare-fun m!1343205 () Bool)

(assert (=> start!125038 m!1343205))

(assert (=> b!1454914 m!1343185))

(assert (=> b!1454914 m!1343185))

(declare-fun m!1343207 () Bool)

(assert (=> b!1454914 m!1343207))

(declare-fun m!1343209 () Bool)

(assert (=> b!1454901 m!1343209))

(assert (=> b!1454901 m!1343209))

(declare-fun m!1343211 () Bool)

(assert (=> b!1454901 m!1343211))

(assert (=> b!1454901 m!1343191))

(declare-fun m!1343213 () Bool)

(assert (=> b!1454901 m!1343213))

(assert (=> b!1454902 m!1343191))

(declare-fun m!1343215 () Bool)

(assert (=> b!1454902 m!1343215))

(declare-fun m!1343217 () Bool)

(assert (=> b!1454902 m!1343217))

(declare-fun m!1343219 () Bool)

(assert (=> b!1454902 m!1343219))

(assert (=> b!1454902 m!1343185))

(declare-fun m!1343221 () Bool)

(assert (=> b!1454910 m!1343221))

(assert (=> b!1454910 m!1343221))

(declare-fun m!1343223 () Bool)

(assert (=> b!1454910 m!1343223))

(assert (=> b!1454906 m!1343185))

(assert (=> b!1454906 m!1343185))

(declare-fun m!1343225 () Bool)

(assert (=> b!1454906 m!1343225))

(declare-fun m!1343227 () Bool)

(assert (=> b!1454919 m!1343227))

(declare-fun m!1343229 () Bool)

(assert (=> b!1454909 m!1343229))

(declare-fun m!1343231 () Bool)

(assert (=> b!1454917 m!1343231))

(declare-fun m!1343233 () Bool)

(assert (=> b!1454900 m!1343233))

(assert (=> b!1454911 m!1343185))

(assert (=> b!1454911 m!1343185))

(declare-fun m!1343235 () Bool)

(assert (=> b!1454911 m!1343235))

(declare-fun m!1343237 () Bool)

(assert (=> b!1454907 m!1343237))

(assert (=> b!1454907 m!1343195))

(assert (=> b!1454907 m!1343197))

(declare-fun m!1343239 () Bool)

(assert (=> b!1454903 m!1343239))

(assert (=> b!1454903 m!1343191))

(assert (=> b!1454903 m!1343217))

(assert (=> b!1454903 m!1343219))

(declare-fun m!1343241 () Bool)

(assert (=> b!1454903 m!1343241))

(assert (=> b!1454903 m!1343185))

(push 1)

