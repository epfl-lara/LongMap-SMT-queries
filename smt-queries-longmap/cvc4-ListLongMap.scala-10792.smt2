; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126254 () Bool)

(assert start!126254)

(declare-fun b!1479899 () Bool)

(declare-fun res!1005758 () Bool)

(declare-fun e!830087 () Bool)

(assert (=> b!1479899 (=> (not res!1005758) (not e!830087))))

(declare-datatypes ((SeekEntryResult!12199 0))(
  ( (MissingZero!12199 (index!51188 (_ BitVec 32))) (Found!12199 (index!51189 (_ BitVec 32))) (Intermediate!12199 (undefined!13011 Bool) (index!51190 (_ BitVec 32)) (x!132766 (_ BitVec 32))) (Undefined!12199) (MissingVacant!12199 (index!51191 (_ BitVec 32))) )
))
(declare-fun lt!646212 () SeekEntryResult!12199)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99360 0))(
  ( (array!99361 (arr!47959 (Array (_ BitVec 32) (_ BitVec 64))) (size!48509 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99360)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99360 (_ BitVec 32)) SeekEntryResult!12199)

(assert (=> b!1479899 (= res!1005758 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47959 a!2862) j!93) a!2862 mask!2687) lt!646212))))

(declare-fun res!1005772 () Bool)

(declare-fun e!830086 () Bool)

(assert (=> start!126254 (=> (not res!1005772) (not e!830086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126254 (= res!1005772 (validMask!0 mask!2687))))

(assert (=> start!126254 e!830086))

(assert (=> start!126254 true))

(declare-fun array_inv!36987 (array!99360) Bool)

(assert (=> start!126254 (array_inv!36987 a!2862)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1479900 () Bool)

(declare-fun e!830082 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479900 (= e!830082 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479901 () Bool)

(declare-fun e!830079 () Bool)

(assert (=> b!1479901 (= e!830087 e!830079)))

(declare-fun res!1005769 () Bool)

(assert (=> b!1479901 (=> (not res!1005769) (not e!830079))))

(declare-fun lt!646214 () SeekEntryResult!12199)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479901 (= res!1005769 (= lt!646214 (Intermediate!12199 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646208 () array!99360)

(declare-fun lt!646210 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479901 (= lt!646214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646210 mask!2687) lt!646210 lt!646208 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479901 (= lt!646210 (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!830084 () Bool)

(declare-fun b!1479902 () Bool)

(assert (=> b!1479902 (= e!830084 (= lt!646214 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646210 lt!646208 mask!2687)))))

(declare-fun b!1479903 () Bool)

(declare-fun res!1005759 () Bool)

(assert (=> b!1479903 (=> (not res!1005759) (not e!830086))))

(declare-datatypes ((List!34460 0))(
  ( (Nil!34457) (Cons!34456 (h!35824 (_ BitVec 64)) (t!49154 List!34460)) )
))
(declare-fun arrayNoDuplicates!0 (array!99360 (_ BitVec 32) List!34460) Bool)

(assert (=> b!1479903 (= res!1005759 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34457))))

(declare-fun b!1479904 () Bool)

(declare-fun res!1005775 () Bool)

(assert (=> b!1479904 (=> (not res!1005775) (not e!830079))))

(assert (=> b!1479904 (= res!1005775 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479905 () Bool)

(declare-fun res!1005764 () Bool)

(assert (=> b!1479905 (=> (not res!1005764) (not e!830086))))

(assert (=> b!1479905 (= res!1005764 (and (= (size!48509 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48509 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48509 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479906 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99360 (_ BitVec 32)) SeekEntryResult!12199)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99360 (_ BitVec 32)) SeekEntryResult!12199)

(assert (=> b!1479906 (= e!830084 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646210 lt!646208 mask!2687) (seekEntryOrOpen!0 lt!646210 lt!646208 mask!2687)))))

(declare-fun b!1479907 () Bool)

(declare-fun res!1005770 () Bool)

(assert (=> b!1479907 (=> (not res!1005770) (not e!830086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479907 (= res!1005770 (validKeyInArray!0 (select (arr!47959 a!2862) j!93)))))

(declare-fun b!1479908 () Bool)

(declare-fun res!1005774 () Bool)

(declare-fun e!830085 () Bool)

(assert (=> b!1479908 (=> res!1005774 e!830085)))

(declare-fun lt!646211 () SeekEntryResult!12199)

(assert (=> b!1479908 (= res!1005774 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47959 a!2862) j!93) a!2862 mask!2687) lt!646211)))))

(declare-fun b!1479909 () Bool)

(assert (=> b!1479909 (= e!830085 true)))

(assert (=> b!1479909 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646210 lt!646208 mask!2687) lt!646211)))

(declare-datatypes ((Unit!49738 0))(
  ( (Unit!49739) )
))
(declare-fun lt!646209 () Unit!49738)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49738)

(assert (=> b!1479909 (= lt!646209 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479910 () Bool)

(declare-fun res!1005767 () Bool)

(assert (=> b!1479910 (=> (not res!1005767) (not e!830086))))

(assert (=> b!1479910 (= res!1005767 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48509 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48509 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48509 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479911 () Bool)

(declare-fun e!830083 () Bool)

(declare-fun e!830081 () Bool)

(assert (=> b!1479911 (= e!830083 e!830081)))

(declare-fun res!1005763 () Bool)

(assert (=> b!1479911 (=> res!1005763 e!830081)))

(assert (=> b!1479911 (= res!1005763 (or (and (= (select (arr!47959 a!2862) index!646) (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47959 a!2862) index!646) (select (arr!47959 a!2862) j!93))) (not (= (select (arr!47959 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479912 () Bool)

(declare-fun res!1005765 () Bool)

(assert (=> b!1479912 (=> (not res!1005765) (not e!830086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99360 (_ BitVec 32)) Bool)

(assert (=> b!1479912 (= res!1005765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479913 () Bool)

(assert (=> b!1479913 (= e!830079 (not e!830085))))

(declare-fun res!1005762 () Bool)

(assert (=> b!1479913 (=> res!1005762 e!830085)))

(assert (=> b!1479913 (= res!1005762 (or (and (= (select (arr!47959 a!2862) index!646) (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47959 a!2862) index!646) (select (arr!47959 a!2862) j!93))) (not (= (select (arr!47959 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47959 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479913 e!830083))

(declare-fun res!1005761 () Bool)

(assert (=> b!1479913 (=> (not res!1005761) (not e!830083))))

(declare-fun lt!646215 () SeekEntryResult!12199)

(assert (=> b!1479913 (= res!1005761 (and (= lt!646215 lt!646211) (or (= (select (arr!47959 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47959 a!2862) intermediateBeforeIndex!19) (select (arr!47959 a!2862) j!93)))))))

(assert (=> b!1479913 (= lt!646211 (Found!12199 j!93))))

(assert (=> b!1479913 (= lt!646215 (seekEntryOrOpen!0 (select (arr!47959 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479913 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646213 () Unit!49738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49738)

(assert (=> b!1479913 (= lt!646213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479914 () Bool)

(declare-fun e!830080 () Bool)

(assert (=> b!1479914 (= e!830086 e!830080)))

(declare-fun res!1005766 () Bool)

(assert (=> b!1479914 (=> (not res!1005766) (not e!830080))))

(assert (=> b!1479914 (= res!1005766 (= (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479914 (= lt!646208 (array!99361 (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48509 a!2862)))))

(declare-fun b!1479915 () Bool)

(declare-fun res!1005773 () Bool)

(assert (=> b!1479915 (=> (not res!1005773) (not e!830086))))

(assert (=> b!1479915 (= res!1005773 (validKeyInArray!0 (select (arr!47959 a!2862) i!1006)))))

(declare-fun b!1479916 () Bool)

(declare-fun res!1005760 () Bool)

(assert (=> b!1479916 (=> (not res!1005760) (not e!830079))))

(assert (=> b!1479916 (= res!1005760 e!830084)))

(declare-fun c!136590 () Bool)

(assert (=> b!1479916 (= c!136590 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479917 () Bool)

(assert (=> b!1479917 (= e!830081 e!830082)))

(declare-fun res!1005771 () Bool)

(assert (=> b!1479917 (=> (not res!1005771) (not e!830082))))

(assert (=> b!1479917 (= res!1005771 (= lt!646215 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47959 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479918 () Bool)

(assert (=> b!1479918 (= e!830080 e!830087)))

(declare-fun res!1005768 () Bool)

(assert (=> b!1479918 (=> (not res!1005768) (not e!830087))))

(assert (=> b!1479918 (= res!1005768 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47959 a!2862) j!93) mask!2687) (select (arr!47959 a!2862) j!93) a!2862 mask!2687) lt!646212))))

(assert (=> b!1479918 (= lt!646212 (Intermediate!12199 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126254 res!1005772) b!1479905))

(assert (= (and b!1479905 res!1005764) b!1479915))

(assert (= (and b!1479915 res!1005773) b!1479907))

(assert (= (and b!1479907 res!1005770) b!1479912))

(assert (= (and b!1479912 res!1005765) b!1479903))

(assert (= (and b!1479903 res!1005759) b!1479910))

(assert (= (and b!1479910 res!1005767) b!1479914))

(assert (= (and b!1479914 res!1005766) b!1479918))

(assert (= (and b!1479918 res!1005768) b!1479899))

(assert (= (and b!1479899 res!1005758) b!1479901))

(assert (= (and b!1479901 res!1005769) b!1479916))

(assert (= (and b!1479916 c!136590) b!1479902))

(assert (= (and b!1479916 (not c!136590)) b!1479906))

(assert (= (and b!1479916 res!1005760) b!1479904))

(assert (= (and b!1479904 res!1005775) b!1479913))

(assert (= (and b!1479913 res!1005761) b!1479911))

(assert (= (and b!1479911 (not res!1005763)) b!1479917))

(assert (= (and b!1479917 res!1005771) b!1479900))

(assert (= (and b!1479913 (not res!1005762)) b!1479908))

(assert (= (and b!1479908 (not res!1005774)) b!1479909))

(declare-fun m!1365737 () Bool)

(assert (=> start!126254 m!1365737))

(declare-fun m!1365739 () Bool)

(assert (=> start!126254 m!1365739))

(declare-fun m!1365741 () Bool)

(assert (=> b!1479903 m!1365741))

(declare-fun m!1365743 () Bool)

(assert (=> b!1479915 m!1365743))

(assert (=> b!1479915 m!1365743))

(declare-fun m!1365745 () Bool)

(assert (=> b!1479915 m!1365745))

(declare-fun m!1365747 () Bool)

(assert (=> b!1479914 m!1365747))

(declare-fun m!1365749 () Bool)

(assert (=> b!1479914 m!1365749))

(declare-fun m!1365751 () Bool)

(assert (=> b!1479918 m!1365751))

(assert (=> b!1479918 m!1365751))

(declare-fun m!1365753 () Bool)

(assert (=> b!1479918 m!1365753))

(assert (=> b!1479918 m!1365753))

(assert (=> b!1479918 m!1365751))

(declare-fun m!1365755 () Bool)

(assert (=> b!1479918 m!1365755))

(assert (=> b!1479907 m!1365751))

(assert (=> b!1479907 m!1365751))

(declare-fun m!1365757 () Bool)

(assert (=> b!1479907 m!1365757))

(declare-fun m!1365759 () Bool)

(assert (=> b!1479901 m!1365759))

(assert (=> b!1479901 m!1365759))

(declare-fun m!1365761 () Bool)

(assert (=> b!1479901 m!1365761))

(assert (=> b!1479901 m!1365747))

(declare-fun m!1365763 () Bool)

(assert (=> b!1479901 m!1365763))

(declare-fun m!1365765 () Bool)

(assert (=> b!1479912 m!1365765))

(assert (=> b!1479917 m!1365751))

(assert (=> b!1479917 m!1365751))

(declare-fun m!1365767 () Bool)

(assert (=> b!1479917 m!1365767))

(declare-fun m!1365769 () Bool)

(assert (=> b!1479909 m!1365769))

(declare-fun m!1365771 () Bool)

(assert (=> b!1479909 m!1365771))

(declare-fun m!1365773 () Bool)

(assert (=> b!1479911 m!1365773))

(assert (=> b!1479911 m!1365747))

(declare-fun m!1365775 () Bool)

(assert (=> b!1479911 m!1365775))

(assert (=> b!1479911 m!1365751))

(assert (=> b!1479899 m!1365751))

(assert (=> b!1479899 m!1365751))

(declare-fun m!1365777 () Bool)

(assert (=> b!1479899 m!1365777))

(declare-fun m!1365779 () Bool)

(assert (=> b!1479913 m!1365779))

(assert (=> b!1479913 m!1365747))

(declare-fun m!1365781 () Bool)

(assert (=> b!1479913 m!1365781))

(assert (=> b!1479913 m!1365775))

(assert (=> b!1479913 m!1365773))

(assert (=> b!1479913 m!1365751))

(declare-fun m!1365783 () Bool)

(assert (=> b!1479913 m!1365783))

(declare-fun m!1365785 () Bool)

(assert (=> b!1479913 m!1365785))

(assert (=> b!1479913 m!1365751))

(assert (=> b!1479908 m!1365751))

(assert (=> b!1479908 m!1365751))

(declare-fun m!1365787 () Bool)

(assert (=> b!1479908 m!1365787))

(declare-fun m!1365789 () Bool)

(assert (=> b!1479902 m!1365789))

(assert (=> b!1479906 m!1365769))

(declare-fun m!1365791 () Bool)

(assert (=> b!1479906 m!1365791))

(push 1)

