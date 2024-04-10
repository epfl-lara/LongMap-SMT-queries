; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125314 () Bool)

(assert start!125314)

(declare-fun lt!640898 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640893 () (_ BitVec 64))

(declare-fun b!1463835 () Bool)

(declare-datatypes ((array!98762 0))(
  ( (array!98763 (arr!47669 (Array (_ BitVec 32) (_ BitVec 64))) (size!48219 (_ BitVec 32))) )
))
(declare-fun lt!640899 () array!98762)

(declare-datatypes ((SeekEntryResult!11921 0))(
  ( (MissingZero!11921 (index!50076 (_ BitVec 32))) (Found!11921 (index!50077 (_ BitVec 32))) (Intermediate!11921 (undefined!12733 Bool) (index!50078 (_ BitVec 32)) (x!131666 (_ BitVec 32))) (Undefined!11921) (MissingVacant!11921 (index!50079 (_ BitVec 32))) )
))
(declare-fun lt!640895 () SeekEntryResult!11921)

(declare-fun e!822710 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98762 (_ BitVec 32)) SeekEntryResult!11921)

(assert (=> b!1463835 (= e!822710 (not (= lt!640895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640898 lt!640893 lt!640899 mask!2687))))))

(declare-fun b!1463836 () Bool)

(declare-fun e!822703 () Bool)

(declare-fun e!822701 () Bool)

(assert (=> b!1463836 (= e!822703 (not e!822701))))

(declare-fun res!993018 () Bool)

(assert (=> b!1463836 (=> res!993018 e!822701)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98762)

(assert (=> b!1463836 (= res!993018 (or (and (= (select (arr!47669 a!2862) index!646) (select (store (arr!47669 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47669 a!2862) index!646) (select (arr!47669 a!2862) j!93))) (= (select (arr!47669 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822706 () Bool)

(assert (=> b!1463836 e!822706))

(declare-fun res!993015 () Bool)

(assert (=> b!1463836 (=> (not res!993015) (not e!822706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98762 (_ BitVec 32)) Bool)

(assert (=> b!1463836 (= res!993015 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49338 0))(
  ( (Unit!49339) )
))
(declare-fun lt!640894 () Unit!49338)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49338)

(assert (=> b!1463836 (= lt!640894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463837 () Bool)

(declare-fun e!822708 () Bool)

(declare-fun e!822705 () Bool)

(assert (=> b!1463837 (= e!822708 e!822705)))

(declare-fun res!993023 () Bool)

(assert (=> b!1463837 (=> (not res!993023) (not e!822705))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463837 (= res!993023 (= (select (store (arr!47669 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463837 (= lt!640899 (array!98763 (store (arr!47669 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48219 a!2862)))))

(declare-fun b!1463838 () Bool)

(declare-fun e!822704 () Bool)

(assert (=> b!1463838 (= e!822701 e!822704)))

(declare-fun res!993020 () Bool)

(assert (=> b!1463838 (=> res!993020 e!822704)))

(assert (=> b!1463838 (= res!993020 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640898 #b00000000000000000000000000000000) (bvsge lt!640898 (size!48219 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463838 (= lt!640898 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463839 () Bool)

(declare-fun res!993017 () Bool)

(assert (=> b!1463839 (=> (not res!993017) (not e!822703))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463839 (= res!993017 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463840 () Bool)

(declare-fun e!822702 () Bool)

(assert (=> b!1463840 (= e!822705 e!822702)))

(declare-fun res!993016 () Bool)

(assert (=> b!1463840 (=> (not res!993016) (not e!822702))))

(declare-fun lt!640897 () SeekEntryResult!11921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463840 (= res!993016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47669 a!2862) j!93) mask!2687) (select (arr!47669 a!2862) j!93) a!2862 mask!2687) lt!640897))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1463840 (= lt!640897 (Intermediate!11921 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463841 () Bool)

(declare-fun res!993025 () Bool)

(assert (=> b!1463841 (=> (not res!993025) (not e!822708))))

(assert (=> b!1463841 (= res!993025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!993014 () Bool)

(assert (=> start!125314 (=> (not res!993014) (not e!822708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125314 (= res!993014 (validMask!0 mask!2687))))

(assert (=> start!125314 e!822708))

(assert (=> start!125314 true))

(declare-fun array_inv!36697 (array!98762) Bool)

(assert (=> start!125314 (array_inv!36697 a!2862)))

(declare-fun b!1463842 () Bool)

(declare-fun res!993019 () Bool)

(assert (=> b!1463842 (=> (not res!993019) (not e!822706))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98762 (_ BitVec 32)) SeekEntryResult!11921)

(assert (=> b!1463842 (= res!993019 (= (seekEntryOrOpen!0 (select (arr!47669 a!2862) j!93) a!2862 mask!2687) (Found!11921 j!93)))))

(declare-fun b!1463843 () Bool)

(assert (=> b!1463843 (= e!822706 (or (= (select (arr!47669 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47669 a!2862) intermediateBeforeIndex!19) (select (arr!47669 a!2862) j!93))))))

(declare-fun b!1463844 () Bool)

(declare-fun res!993022 () Bool)

(assert (=> b!1463844 (=> (not res!993022) (not e!822708))))

(declare-datatypes ((List!34170 0))(
  ( (Nil!34167) (Cons!34166 (h!35516 (_ BitVec 64)) (t!48864 List!34170)) )
))
(declare-fun arrayNoDuplicates!0 (array!98762 (_ BitVec 32) List!34170) Bool)

(assert (=> b!1463844 (= res!993022 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34167))))

(declare-fun b!1463845 () Bool)

(declare-fun res!993030 () Bool)

(assert (=> b!1463845 (=> (not res!993030) (not e!822708))))

(assert (=> b!1463845 (= res!993030 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48219 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48219 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48219 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463846 () Bool)

(declare-fun res!993029 () Bool)

(assert (=> b!1463846 (=> (not res!993029) (not e!822708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463846 (= res!993029 (validKeyInArray!0 (select (arr!47669 a!2862) j!93)))))

(declare-fun b!1463847 () Bool)

(assert (=> b!1463847 (= e!822702 e!822703)))

(declare-fun res!993031 () Bool)

(assert (=> b!1463847 (=> (not res!993031) (not e!822703))))

(assert (=> b!1463847 (= res!993031 (= lt!640895 (Intermediate!11921 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463847 (= lt!640895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640893 mask!2687) lt!640893 lt!640899 mask!2687))))

(assert (=> b!1463847 (= lt!640893 (select (store (arr!47669 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463848 () Bool)

(declare-fun res!993024 () Bool)

(assert (=> b!1463848 (=> (not res!993024) (not e!822703))))

(declare-fun e!822709 () Bool)

(assert (=> b!1463848 (= res!993024 e!822709)))

(declare-fun c!134922 () Bool)

(assert (=> b!1463848 (= c!134922 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463849 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98762 (_ BitVec 32)) SeekEntryResult!11921)

(assert (=> b!1463849 (= e!822709 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640893 lt!640899 mask!2687) (seekEntryOrOpen!0 lt!640893 lt!640899 mask!2687)))))

(declare-fun b!1463850 () Bool)

(declare-fun res!993021 () Bool)

(assert (=> b!1463850 (=> (not res!993021) (not e!822708))))

(assert (=> b!1463850 (= res!993021 (and (= (size!48219 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48219 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48219 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463851 () Bool)

(declare-fun res!993026 () Bool)

(assert (=> b!1463851 (=> (not res!993026) (not e!822702))))

(assert (=> b!1463851 (= res!993026 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47669 a!2862) j!93) a!2862 mask!2687) lt!640897))))

(declare-fun b!1463852 () Bool)

(assert (=> b!1463852 (= e!822710 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640898 intermediateAfterIndex!19 lt!640893 lt!640899 mask!2687) (seekEntryOrOpen!0 lt!640893 lt!640899 mask!2687))))))

(declare-fun b!1463853 () Bool)

(assert (=> b!1463853 (= e!822709 (= lt!640895 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640893 lt!640899 mask!2687)))))

(declare-fun b!1463854 () Bool)

(assert (=> b!1463854 (= e!822704 true)))

(declare-fun lt!640896 () Bool)

(assert (=> b!1463854 (= lt!640896 e!822710)))

(declare-fun c!134921 () Bool)

(assert (=> b!1463854 (= c!134921 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463855 () Bool)

(declare-fun res!993028 () Bool)

(assert (=> b!1463855 (=> res!993028 e!822704)))

(assert (=> b!1463855 (= res!993028 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640898 (select (arr!47669 a!2862) j!93) a!2862 mask!2687) lt!640897)))))

(declare-fun b!1463856 () Bool)

(declare-fun res!993027 () Bool)

(assert (=> b!1463856 (=> (not res!993027) (not e!822708))))

(assert (=> b!1463856 (= res!993027 (validKeyInArray!0 (select (arr!47669 a!2862) i!1006)))))

(assert (= (and start!125314 res!993014) b!1463850))

(assert (= (and b!1463850 res!993021) b!1463856))

(assert (= (and b!1463856 res!993027) b!1463846))

(assert (= (and b!1463846 res!993029) b!1463841))

(assert (= (and b!1463841 res!993025) b!1463844))

(assert (= (and b!1463844 res!993022) b!1463845))

(assert (= (and b!1463845 res!993030) b!1463837))

(assert (= (and b!1463837 res!993023) b!1463840))

(assert (= (and b!1463840 res!993016) b!1463851))

(assert (= (and b!1463851 res!993026) b!1463847))

(assert (= (and b!1463847 res!993031) b!1463848))

(assert (= (and b!1463848 c!134922) b!1463853))

(assert (= (and b!1463848 (not c!134922)) b!1463849))

(assert (= (and b!1463848 res!993024) b!1463839))

(assert (= (and b!1463839 res!993017) b!1463836))

(assert (= (and b!1463836 res!993015) b!1463842))

(assert (= (and b!1463842 res!993019) b!1463843))

(assert (= (and b!1463836 (not res!993018)) b!1463838))

(assert (= (and b!1463838 (not res!993020)) b!1463855))

(assert (= (and b!1463855 (not res!993028)) b!1463854))

(assert (= (and b!1463854 c!134921) b!1463835))

(assert (= (and b!1463854 (not c!134921)) b!1463852))

(declare-fun m!1351123 () Bool)

(assert (=> b!1463838 m!1351123))

(declare-fun m!1351125 () Bool)

(assert (=> b!1463835 m!1351125))

(declare-fun m!1351127 () Bool)

(assert (=> start!125314 m!1351127))

(declare-fun m!1351129 () Bool)

(assert (=> start!125314 m!1351129))

(declare-fun m!1351131 () Bool)

(assert (=> b!1463847 m!1351131))

(assert (=> b!1463847 m!1351131))

(declare-fun m!1351133 () Bool)

(assert (=> b!1463847 m!1351133))

(declare-fun m!1351135 () Bool)

(assert (=> b!1463847 m!1351135))

(declare-fun m!1351137 () Bool)

(assert (=> b!1463847 m!1351137))

(declare-fun m!1351139 () Bool)

(assert (=> b!1463852 m!1351139))

(declare-fun m!1351141 () Bool)

(assert (=> b!1463852 m!1351141))

(declare-fun m!1351143 () Bool)

(assert (=> b!1463855 m!1351143))

(assert (=> b!1463855 m!1351143))

(declare-fun m!1351145 () Bool)

(assert (=> b!1463855 m!1351145))

(declare-fun m!1351147 () Bool)

(assert (=> b!1463849 m!1351147))

(assert (=> b!1463849 m!1351141))

(assert (=> b!1463837 m!1351135))

(declare-fun m!1351149 () Bool)

(assert (=> b!1463837 m!1351149))

(assert (=> b!1463851 m!1351143))

(assert (=> b!1463851 m!1351143))

(declare-fun m!1351151 () Bool)

(assert (=> b!1463851 m!1351151))

(assert (=> b!1463840 m!1351143))

(assert (=> b!1463840 m!1351143))

(declare-fun m!1351153 () Bool)

(assert (=> b!1463840 m!1351153))

(assert (=> b!1463840 m!1351153))

(assert (=> b!1463840 m!1351143))

(declare-fun m!1351155 () Bool)

(assert (=> b!1463840 m!1351155))

(assert (=> b!1463846 m!1351143))

(assert (=> b!1463846 m!1351143))

(declare-fun m!1351157 () Bool)

(assert (=> b!1463846 m!1351157))

(declare-fun m!1351159 () Bool)

(assert (=> b!1463853 m!1351159))

(assert (=> b!1463842 m!1351143))

(assert (=> b!1463842 m!1351143))

(declare-fun m!1351161 () Bool)

(assert (=> b!1463842 m!1351161))

(declare-fun m!1351163 () Bool)

(assert (=> b!1463841 m!1351163))

(declare-fun m!1351165 () Bool)

(assert (=> b!1463843 m!1351165))

(assert (=> b!1463843 m!1351143))

(declare-fun m!1351167 () Bool)

(assert (=> b!1463856 m!1351167))

(assert (=> b!1463856 m!1351167))

(declare-fun m!1351169 () Bool)

(assert (=> b!1463856 m!1351169))

(declare-fun m!1351171 () Bool)

(assert (=> b!1463836 m!1351171))

(assert (=> b!1463836 m!1351135))

(declare-fun m!1351173 () Bool)

(assert (=> b!1463836 m!1351173))

(declare-fun m!1351175 () Bool)

(assert (=> b!1463836 m!1351175))

(declare-fun m!1351177 () Bool)

(assert (=> b!1463836 m!1351177))

(assert (=> b!1463836 m!1351143))

(declare-fun m!1351179 () Bool)

(assert (=> b!1463844 m!1351179))

(push 1)

