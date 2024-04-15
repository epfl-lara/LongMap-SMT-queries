; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125296 () Bool)

(assert start!125296)

(declare-fun b!1464036 () Bool)

(declare-fun res!993276 () Bool)

(declare-fun e!822767 () Bool)

(assert (=> b!1464036 (=> (not res!993276) (not e!822767))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464036 (= res!993276 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464037 () Bool)

(declare-fun res!993269 () Bool)

(declare-fun e!822773 () Bool)

(assert (=> b!1464037 (=> res!993269 e!822773)))

(declare-datatypes ((array!98722 0))(
  ( (array!98723 (arr!47650 (Array (_ BitVec 32) (_ BitVec 64))) (size!48202 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98722)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!640791 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11927 0))(
  ( (MissingZero!11927 (index!50100 (_ BitVec 32))) (Found!11927 (index!50101 (_ BitVec 32))) (Intermediate!11927 (undefined!12739 Bool) (index!50102 (_ BitVec 32)) (x!131683 (_ BitVec 32))) (Undefined!11927) (MissingVacant!11927 (index!50103 (_ BitVec 32))) )
))
(declare-fun lt!640789 () SeekEntryResult!11927)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98722 (_ BitVec 32)) SeekEntryResult!11927)

(assert (=> b!1464037 (= res!993269 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640791 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!640789)))))

(declare-fun b!1464038 () Bool)

(declare-fun e!822766 () Bool)

(assert (=> b!1464038 (= e!822767 (not e!822766))))

(declare-fun res!993262 () Bool)

(assert (=> b!1464038 (=> res!993262 e!822766)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1464038 (= res!993262 (or (and (= (select (arr!47650 a!2862) index!646) (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47650 a!2862) index!646) (select (arr!47650 a!2862) j!93))) (= (select (arr!47650 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822772 () Bool)

(assert (=> b!1464038 e!822772))

(declare-fun res!993274 () Bool)

(assert (=> b!1464038 (=> (not res!993274) (not e!822772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98722 (_ BitVec 32)) Bool)

(assert (=> b!1464038 (= res!993274 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49191 0))(
  ( (Unit!49192) )
))
(declare-fun lt!640787 () Unit!49191)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49191)

(assert (=> b!1464038 (= lt!640787 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464039 () Bool)

(declare-fun res!993268 () Bool)

(declare-fun e!822769 () Bool)

(assert (=> b!1464039 (=> (not res!993268) (not e!822769))))

(assert (=> b!1464039 (= res!993268 (and (= (size!48202 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48202 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48202 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464040 () Bool)

(declare-fun e!822770 () Bool)

(assert (=> b!1464040 (= e!822770 e!822767)))

(declare-fun res!993266 () Bool)

(assert (=> b!1464040 (=> (not res!993266) (not e!822767))))

(declare-fun lt!640785 () SeekEntryResult!11927)

(assert (=> b!1464040 (= res!993266 (= lt!640785 (Intermediate!11927 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640788 () (_ BitVec 64))

(declare-fun lt!640786 () array!98722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464040 (= lt!640785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640788 mask!2687) lt!640788 lt!640786 mask!2687))))

(assert (=> b!1464040 (= lt!640788 (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464041 () Bool)

(assert (=> b!1464041 (= e!822766 e!822773)))

(declare-fun res!993267 () Bool)

(assert (=> b!1464041 (=> res!993267 e!822773)))

(assert (=> b!1464041 (= res!993267 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640791 #b00000000000000000000000000000000) (bvsge lt!640791 (size!48202 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464041 (= lt!640791 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464042 () Bool)

(declare-fun res!993277 () Bool)

(assert (=> b!1464042 (=> (not res!993277) (not e!822769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464042 (= res!993277 (validKeyInArray!0 (select (arr!47650 a!2862) i!1006)))))

(declare-fun b!1464043 () Bool)

(declare-fun res!993261 () Bool)

(assert (=> b!1464043 (=> (not res!993261) (not e!822769))))

(assert (=> b!1464043 (= res!993261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464044 () Bool)

(assert (=> b!1464044 (= e!822773 true)))

(declare-fun lt!640790 () Bool)

(declare-fun e!822768 () Bool)

(assert (=> b!1464044 (= lt!640790 e!822768)))

(declare-fun c!134901 () Bool)

(assert (=> b!1464044 (= c!134901 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!993273 () Bool)

(assert (=> start!125296 (=> (not res!993273) (not e!822769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125296 (= res!993273 (validMask!0 mask!2687))))

(assert (=> start!125296 e!822769))

(assert (=> start!125296 true))

(declare-fun array_inv!36883 (array!98722) Bool)

(assert (=> start!125296 (array_inv!36883 a!2862)))

(declare-fun b!1464045 () Bool)

(declare-fun res!993270 () Bool)

(assert (=> b!1464045 (=> (not res!993270) (not e!822767))))

(declare-fun e!822774 () Bool)

(assert (=> b!1464045 (= res!993270 e!822774)))

(declare-fun c!134902 () Bool)

(assert (=> b!1464045 (= c!134902 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464046 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98722 (_ BitVec 32)) SeekEntryResult!11927)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98722 (_ BitVec 32)) SeekEntryResult!11927)

(assert (=> b!1464046 (= e!822768 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640791 intermediateAfterIndex!19 lt!640788 lt!640786 mask!2687) (seekEntryOrOpen!0 lt!640788 lt!640786 mask!2687))))))

(declare-fun b!1464047 () Bool)

(declare-fun e!822771 () Bool)

(assert (=> b!1464047 (= e!822771 e!822770)))

(declare-fun res!993275 () Bool)

(assert (=> b!1464047 (=> (not res!993275) (not e!822770))))

(assert (=> b!1464047 (= res!993275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47650 a!2862) j!93) mask!2687) (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!640789))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1464047 (= lt!640789 (Intermediate!11927 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464048 () Bool)

(declare-fun res!993272 () Bool)

(assert (=> b!1464048 (=> (not res!993272) (not e!822770))))

(assert (=> b!1464048 (= res!993272 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!640789))))

(declare-fun b!1464049 () Bool)

(assert (=> b!1464049 (= e!822769 e!822771)))

(declare-fun res!993260 () Bool)

(assert (=> b!1464049 (=> (not res!993260) (not e!822771))))

(assert (=> b!1464049 (= res!993260 (= (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464049 (= lt!640786 (array!98723 (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48202 a!2862)))))

(declare-fun b!1464050 () Bool)

(assert (=> b!1464050 (= e!822772 (or (= (select (arr!47650 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47650 a!2862) intermediateBeforeIndex!19) (select (arr!47650 a!2862) j!93))))))

(declare-fun b!1464051 () Bool)

(assert (=> b!1464051 (= e!822774 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640788 lt!640786 mask!2687) (seekEntryOrOpen!0 lt!640788 lt!640786 mask!2687)))))

(declare-fun b!1464052 () Bool)

(assert (=> b!1464052 (= e!822774 (= lt!640785 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640788 lt!640786 mask!2687)))))

(declare-fun b!1464053 () Bool)

(assert (=> b!1464053 (= e!822768 (not (= lt!640785 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640791 lt!640788 lt!640786 mask!2687))))))

(declare-fun b!1464054 () Bool)

(declare-fun res!993264 () Bool)

(assert (=> b!1464054 (=> (not res!993264) (not e!822772))))

(assert (=> b!1464054 (= res!993264 (= (seekEntryOrOpen!0 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) (Found!11927 j!93)))))

(declare-fun b!1464055 () Bool)

(declare-fun res!993265 () Bool)

(assert (=> b!1464055 (=> (not res!993265) (not e!822769))))

(assert (=> b!1464055 (= res!993265 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48202 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48202 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48202 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464056 () Bool)

(declare-fun res!993263 () Bool)

(assert (=> b!1464056 (=> (not res!993263) (not e!822769))))

(assert (=> b!1464056 (= res!993263 (validKeyInArray!0 (select (arr!47650 a!2862) j!93)))))

(declare-fun b!1464057 () Bool)

(declare-fun res!993271 () Bool)

(assert (=> b!1464057 (=> (not res!993271) (not e!822769))))

(declare-datatypes ((List!34229 0))(
  ( (Nil!34226) (Cons!34225 (h!35575 (_ BitVec 64)) (t!48915 List!34229)) )
))
(declare-fun arrayNoDuplicates!0 (array!98722 (_ BitVec 32) List!34229) Bool)

(assert (=> b!1464057 (= res!993271 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34226))))

(assert (= (and start!125296 res!993273) b!1464039))

(assert (= (and b!1464039 res!993268) b!1464042))

(assert (= (and b!1464042 res!993277) b!1464056))

(assert (= (and b!1464056 res!993263) b!1464043))

(assert (= (and b!1464043 res!993261) b!1464057))

(assert (= (and b!1464057 res!993271) b!1464055))

(assert (= (and b!1464055 res!993265) b!1464049))

(assert (= (and b!1464049 res!993260) b!1464047))

(assert (= (and b!1464047 res!993275) b!1464048))

(assert (= (and b!1464048 res!993272) b!1464040))

(assert (= (and b!1464040 res!993266) b!1464045))

(assert (= (and b!1464045 c!134902) b!1464052))

(assert (= (and b!1464045 (not c!134902)) b!1464051))

(assert (= (and b!1464045 res!993270) b!1464036))

(assert (= (and b!1464036 res!993276) b!1464038))

(assert (= (and b!1464038 res!993274) b!1464054))

(assert (= (and b!1464054 res!993264) b!1464050))

(assert (= (and b!1464038 (not res!993262)) b!1464041))

(assert (= (and b!1464041 (not res!993267)) b!1464037))

(assert (= (and b!1464037 (not res!993269)) b!1464044))

(assert (= (and b!1464044 c!134901) b!1464053))

(assert (= (and b!1464044 (not c!134901)) b!1464046))

(declare-fun m!1350795 () Bool)

(assert (=> b!1464048 m!1350795))

(assert (=> b!1464048 m!1350795))

(declare-fun m!1350797 () Bool)

(assert (=> b!1464048 m!1350797))

(declare-fun m!1350799 () Bool)

(assert (=> b!1464041 m!1350799))

(declare-fun m!1350801 () Bool)

(assert (=> b!1464049 m!1350801))

(declare-fun m!1350803 () Bool)

(assert (=> b!1464049 m!1350803))

(declare-fun m!1350805 () Bool)

(assert (=> b!1464051 m!1350805))

(declare-fun m!1350807 () Bool)

(assert (=> b!1464051 m!1350807))

(declare-fun m!1350809 () Bool)

(assert (=> b!1464053 m!1350809))

(declare-fun m!1350811 () Bool)

(assert (=> b!1464038 m!1350811))

(assert (=> b!1464038 m!1350801))

(declare-fun m!1350813 () Bool)

(assert (=> b!1464038 m!1350813))

(declare-fun m!1350815 () Bool)

(assert (=> b!1464038 m!1350815))

(declare-fun m!1350817 () Bool)

(assert (=> b!1464038 m!1350817))

(assert (=> b!1464038 m!1350795))

(declare-fun m!1350819 () Bool)

(assert (=> b!1464043 m!1350819))

(declare-fun m!1350821 () Bool)

(assert (=> b!1464050 m!1350821))

(assert (=> b!1464050 m!1350795))

(assert (=> b!1464037 m!1350795))

(assert (=> b!1464037 m!1350795))

(declare-fun m!1350823 () Bool)

(assert (=> b!1464037 m!1350823))

(declare-fun m!1350825 () Bool)

(assert (=> start!125296 m!1350825))

(declare-fun m!1350827 () Bool)

(assert (=> start!125296 m!1350827))

(assert (=> b!1464056 m!1350795))

(assert (=> b!1464056 m!1350795))

(declare-fun m!1350829 () Bool)

(assert (=> b!1464056 m!1350829))

(assert (=> b!1464054 m!1350795))

(assert (=> b!1464054 m!1350795))

(declare-fun m!1350831 () Bool)

(assert (=> b!1464054 m!1350831))

(declare-fun m!1350833 () Bool)

(assert (=> b!1464040 m!1350833))

(assert (=> b!1464040 m!1350833))

(declare-fun m!1350835 () Bool)

(assert (=> b!1464040 m!1350835))

(assert (=> b!1464040 m!1350801))

(declare-fun m!1350837 () Bool)

(assert (=> b!1464040 m!1350837))

(assert (=> b!1464047 m!1350795))

(assert (=> b!1464047 m!1350795))

(declare-fun m!1350839 () Bool)

(assert (=> b!1464047 m!1350839))

(assert (=> b!1464047 m!1350839))

(assert (=> b!1464047 m!1350795))

(declare-fun m!1350841 () Bool)

(assert (=> b!1464047 m!1350841))

(declare-fun m!1350843 () Bool)

(assert (=> b!1464042 m!1350843))

(assert (=> b!1464042 m!1350843))

(declare-fun m!1350845 () Bool)

(assert (=> b!1464042 m!1350845))

(declare-fun m!1350847 () Bool)

(assert (=> b!1464057 m!1350847))

(declare-fun m!1350849 () Bool)

(assert (=> b!1464052 m!1350849))

(declare-fun m!1350851 () Bool)

(assert (=> b!1464046 m!1350851))

(assert (=> b!1464046 m!1350807))

(check-sat (not b!1464038) (not b!1464052) (not b!1464043) (not b!1464051) (not start!125296) (not b!1464056) (not b!1464053) (not b!1464054) (not b!1464040) (not b!1464047) (not b!1464057) (not b!1464046) (not b!1464042) (not b!1464037) (not b!1464048) (not b!1464041))
(check-sat)
