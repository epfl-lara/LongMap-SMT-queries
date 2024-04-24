; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126468 () Bool)

(assert start!126468)

(declare-fun b!1479818 () Bool)

(declare-fun e!830250 () Bool)

(declare-fun e!830245 () Bool)

(assert (=> b!1479818 (= e!830250 e!830245)))

(declare-fun res!1004783 () Bool)

(assert (=> b!1479818 (=> (not res!1004783) (not e!830245))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99412 0))(
  ( (array!99413 (arr!47980 (Array (_ BitVec 32) (_ BitVec 64))) (size!48531 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99412)

(assert (=> b!1479818 (= res!1004783 (= (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646212 () array!99412)

(assert (=> b!1479818 (= lt!646212 (array!99413 (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48531 a!2862)))))

(declare-fun b!1479819 () Bool)

(declare-fun res!1004781 () Bool)

(assert (=> b!1479819 (=> (not res!1004781) (not e!830250))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99412 (_ BitVec 32)) Bool)

(assert (=> b!1479819 (= res!1004781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!830242 () Bool)

(declare-fun lt!646208 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1479820 () Bool)

(declare-datatypes ((SeekEntryResult!12117 0))(
  ( (MissingZero!12117 (index!50860 (_ BitVec 32))) (Found!12117 (index!50861 (_ BitVec 32))) (Intermediate!12117 (undefined!12929 Bool) (index!50862 (_ BitVec 32)) (x!132637 (_ BitVec 32))) (Undefined!12117) (MissingVacant!12117 (index!50863 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99412 (_ BitVec 32)) SeekEntryResult!12117)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99412 (_ BitVec 32)) SeekEntryResult!12117)

(assert (=> b!1479820 (= e!830242 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646208 lt!646212 mask!2687) (seekEntryOrOpen!0 lt!646208 lt!646212 mask!2687)))))

(declare-fun b!1479821 () Bool)

(declare-fun res!1004779 () Bool)

(assert (=> b!1479821 (=> (not res!1004779) (not e!830250))))

(declare-datatypes ((List!34468 0))(
  ( (Nil!34465) (Cons!34464 (h!35846 (_ BitVec 64)) (t!49154 List!34468)) )
))
(declare-fun arrayNoDuplicates!0 (array!99412 (_ BitVec 32) List!34468) Bool)

(assert (=> b!1479821 (= res!1004779 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34465))))

(declare-fun b!1479822 () Bool)

(declare-fun e!830249 () Bool)

(declare-fun e!830244 () Bool)

(assert (=> b!1479822 (= e!830249 e!830244)))

(declare-fun res!1004775 () Bool)

(assert (=> b!1479822 (=> (not res!1004775) (not e!830244))))

(declare-fun lt!646211 () SeekEntryResult!12117)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479822 (= res!1004775 (= lt!646211 (Intermediate!12117 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99412 (_ BitVec 32)) SeekEntryResult!12117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479822 (= lt!646211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646208 mask!2687) lt!646208 lt!646212 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1479822 (= lt!646208 (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479823 () Bool)

(declare-fun res!1004774 () Bool)

(assert (=> b!1479823 (=> (not res!1004774) (not e!830250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479823 (= res!1004774 (validKeyInArray!0 (select (arr!47980 a!2862) j!93)))))

(declare-fun b!1479824 () Bool)

(declare-fun res!1004784 () Bool)

(assert (=> b!1479824 (=> (not res!1004784) (not e!830249))))

(declare-fun lt!646209 () SeekEntryResult!12117)

(assert (=> b!1479824 (= res!1004784 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47980 a!2862) j!93) a!2862 mask!2687) lt!646209))))

(declare-fun b!1479825 () Bool)

(declare-fun e!830247 () Bool)

(declare-fun e!830248 () Bool)

(assert (=> b!1479825 (= e!830247 e!830248)))

(declare-fun res!1004785 () Bool)

(assert (=> b!1479825 (=> res!1004785 e!830248)))

(assert (=> b!1479825 (= res!1004785 (or (and (= (select (arr!47980 a!2862) index!646) (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47980 a!2862) index!646) (select (arr!47980 a!2862) j!93))) (not (= (select (arr!47980 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479826 () Bool)

(assert (=> b!1479826 (= e!830242 (= lt!646211 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646208 lt!646212 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1479827 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!830243 () Bool)

(assert (=> b!1479827 (= e!830243 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!1004778 () Bool)

(assert (=> start!126468 (=> (not res!1004778) (not e!830250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126468 (= res!1004778 (validMask!0 mask!2687))))

(assert (=> start!126468 e!830250))

(assert (=> start!126468 true))

(declare-fun array_inv!37261 (array!99412) Bool)

(assert (=> start!126468 (array_inv!37261 a!2862)))

(declare-fun b!1479828 () Bool)

(declare-fun res!1004777 () Bool)

(assert (=> b!1479828 (=> (not res!1004777) (not e!830250))))

(assert (=> b!1479828 (= res!1004777 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48531 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48531 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48531 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479829 () Bool)

(assert (=> b!1479829 (= e!830244 (not true))))

(assert (=> b!1479829 e!830247))

(declare-fun res!1004771 () Bool)

(assert (=> b!1479829 (=> (not res!1004771) (not e!830247))))

(declare-fun lt!646213 () SeekEntryResult!12117)

(assert (=> b!1479829 (= res!1004771 (and (= lt!646213 (Found!12117 j!93)) (or (= (select (arr!47980 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47980 a!2862) intermediateBeforeIndex!19) (select (arr!47980 a!2862) j!93)))))))

(assert (=> b!1479829 (= lt!646213 (seekEntryOrOpen!0 (select (arr!47980 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479829 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49607 0))(
  ( (Unit!49608) )
))
(declare-fun lt!646210 () Unit!49607)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49607)

(assert (=> b!1479829 (= lt!646210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479830 () Bool)

(declare-fun res!1004776 () Bool)

(assert (=> b!1479830 (=> (not res!1004776) (not e!830244))))

(assert (=> b!1479830 (= res!1004776 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479831 () Bool)

(assert (=> b!1479831 (= e!830248 e!830243)))

(declare-fun res!1004773 () Bool)

(assert (=> b!1479831 (=> (not res!1004773) (not e!830243))))

(assert (=> b!1479831 (= res!1004773 (= lt!646213 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47980 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479832 () Bool)

(declare-fun res!1004772 () Bool)

(assert (=> b!1479832 (=> (not res!1004772) (not e!830244))))

(assert (=> b!1479832 (= res!1004772 e!830242)))

(declare-fun c!137053 () Bool)

(assert (=> b!1479832 (= c!137053 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479833 () Bool)

(declare-fun res!1004782 () Bool)

(assert (=> b!1479833 (=> (not res!1004782) (not e!830250))))

(assert (=> b!1479833 (= res!1004782 (and (= (size!48531 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48531 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48531 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479834 () Bool)

(assert (=> b!1479834 (= e!830245 e!830249)))

(declare-fun res!1004786 () Bool)

(assert (=> b!1479834 (=> (not res!1004786) (not e!830249))))

(assert (=> b!1479834 (= res!1004786 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47980 a!2862) j!93) mask!2687) (select (arr!47980 a!2862) j!93) a!2862 mask!2687) lt!646209))))

(assert (=> b!1479834 (= lt!646209 (Intermediate!12117 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479835 () Bool)

(declare-fun res!1004780 () Bool)

(assert (=> b!1479835 (=> (not res!1004780) (not e!830250))))

(assert (=> b!1479835 (= res!1004780 (validKeyInArray!0 (select (arr!47980 a!2862) i!1006)))))

(assert (= (and start!126468 res!1004778) b!1479833))

(assert (= (and b!1479833 res!1004782) b!1479835))

(assert (= (and b!1479835 res!1004780) b!1479823))

(assert (= (and b!1479823 res!1004774) b!1479819))

(assert (= (and b!1479819 res!1004781) b!1479821))

(assert (= (and b!1479821 res!1004779) b!1479828))

(assert (= (and b!1479828 res!1004777) b!1479818))

(assert (= (and b!1479818 res!1004783) b!1479834))

(assert (= (and b!1479834 res!1004786) b!1479824))

(assert (= (and b!1479824 res!1004784) b!1479822))

(assert (= (and b!1479822 res!1004775) b!1479832))

(assert (= (and b!1479832 c!137053) b!1479826))

(assert (= (and b!1479832 (not c!137053)) b!1479820))

(assert (= (and b!1479832 res!1004772) b!1479830))

(assert (= (and b!1479830 res!1004776) b!1479829))

(assert (= (and b!1479829 res!1004771) b!1479825))

(assert (= (and b!1479825 (not res!1004785)) b!1479831))

(assert (= (and b!1479831 res!1004773) b!1479827))

(declare-fun m!1365721 () Bool)

(assert (=> b!1479825 m!1365721))

(declare-fun m!1365723 () Bool)

(assert (=> b!1479825 m!1365723))

(declare-fun m!1365725 () Bool)

(assert (=> b!1479825 m!1365725))

(declare-fun m!1365727 () Bool)

(assert (=> b!1479825 m!1365727))

(declare-fun m!1365729 () Bool)

(assert (=> b!1479819 m!1365729))

(declare-fun m!1365731 () Bool)

(assert (=> b!1479826 m!1365731))

(assert (=> b!1479824 m!1365727))

(assert (=> b!1479824 m!1365727))

(declare-fun m!1365733 () Bool)

(assert (=> b!1479824 m!1365733))

(assert (=> b!1479831 m!1365727))

(assert (=> b!1479831 m!1365727))

(declare-fun m!1365735 () Bool)

(assert (=> b!1479831 m!1365735))

(declare-fun m!1365737 () Bool)

(assert (=> b!1479829 m!1365737))

(declare-fun m!1365739 () Bool)

(assert (=> b!1479829 m!1365739))

(assert (=> b!1479829 m!1365727))

(declare-fun m!1365741 () Bool)

(assert (=> b!1479829 m!1365741))

(declare-fun m!1365743 () Bool)

(assert (=> b!1479829 m!1365743))

(assert (=> b!1479829 m!1365727))

(declare-fun m!1365745 () Bool)

(assert (=> b!1479835 m!1365745))

(assert (=> b!1479835 m!1365745))

(declare-fun m!1365747 () Bool)

(assert (=> b!1479835 m!1365747))

(declare-fun m!1365749 () Bool)

(assert (=> b!1479821 m!1365749))

(assert (=> b!1479823 m!1365727))

(assert (=> b!1479823 m!1365727))

(declare-fun m!1365751 () Bool)

(assert (=> b!1479823 m!1365751))

(declare-fun m!1365753 () Bool)

(assert (=> start!126468 m!1365753))

(declare-fun m!1365755 () Bool)

(assert (=> start!126468 m!1365755))

(assert (=> b!1479818 m!1365723))

(declare-fun m!1365757 () Bool)

(assert (=> b!1479818 m!1365757))

(assert (=> b!1479834 m!1365727))

(assert (=> b!1479834 m!1365727))

(declare-fun m!1365759 () Bool)

(assert (=> b!1479834 m!1365759))

(assert (=> b!1479834 m!1365759))

(assert (=> b!1479834 m!1365727))

(declare-fun m!1365761 () Bool)

(assert (=> b!1479834 m!1365761))

(declare-fun m!1365763 () Bool)

(assert (=> b!1479820 m!1365763))

(declare-fun m!1365765 () Bool)

(assert (=> b!1479820 m!1365765))

(declare-fun m!1365767 () Bool)

(assert (=> b!1479822 m!1365767))

(assert (=> b!1479822 m!1365767))

(declare-fun m!1365769 () Bool)

(assert (=> b!1479822 m!1365769))

(assert (=> b!1479822 m!1365723))

(declare-fun m!1365771 () Bool)

(assert (=> b!1479822 m!1365771))

(check-sat (not b!1479822) (not start!126468) (not b!1479821) (not b!1479820) (not b!1479826) (not b!1479824) (not b!1479835) (not b!1479834) (not b!1479819) (not b!1479831) (not b!1479829) (not b!1479823))
(check-sat)
