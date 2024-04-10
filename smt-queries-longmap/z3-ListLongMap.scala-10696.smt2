; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125316 () Bool)

(assert start!125316)

(declare-fun lt!640916 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11922 0))(
  ( (MissingZero!11922 (index!50080 (_ BitVec 32))) (Found!11922 (index!50081 (_ BitVec 32))) (Intermediate!11922 (undefined!12734 Bool) (index!50082 (_ BitVec 32)) (x!131667 (_ BitVec 32))) (Undefined!11922) (MissingVacant!11922 (index!50083 (_ BitVec 32))) )
))
(declare-fun lt!640919 () SeekEntryResult!11922)

(declare-fun b!1463901 () Bool)

(declare-datatypes ((array!98764 0))(
  ( (array!98765 (arr!47670 (Array (_ BitVec 32) (_ BitVec 64))) (size!48220 (_ BitVec 32))) )
))
(declare-fun lt!640914 () array!98764)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!822737 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98764 (_ BitVec 32)) SeekEntryResult!11922)

(assert (=> b!1463901 (= e!822737 (= lt!640919 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640916 lt!640914 mask!2687)))))

(declare-fun e!822735 () Bool)

(declare-fun b!1463902 () Bool)

(declare-fun lt!640915 () (_ BitVec 32))

(assert (=> b!1463902 (= e!822735 (not (= lt!640919 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640915 lt!640916 lt!640914 mask!2687))))))

(declare-fun b!1463903 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98764 (_ BitVec 32)) SeekEntryResult!11922)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98764 (_ BitVec 32)) SeekEntryResult!11922)

(assert (=> b!1463903 (= e!822737 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640916 lt!640914 mask!2687) (seekEntryOrOpen!0 lt!640916 lt!640914 mask!2687)))))

(declare-fun b!1463904 () Bool)

(declare-fun res!993068 () Bool)

(declare-fun e!822739 () Bool)

(assert (=> b!1463904 (=> (not res!993068) (not e!822739))))

(declare-fun a!2862 () array!98764)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463904 (= res!993068 (validKeyInArray!0 (select (arr!47670 a!2862) i!1006)))))

(declare-fun b!1463905 () Bool)

(declare-fun e!822731 () Bool)

(declare-fun e!822736 () Bool)

(assert (=> b!1463905 (= e!822731 e!822736)))

(declare-fun res!993073 () Bool)

(assert (=> b!1463905 (=> (not res!993073) (not e!822736))))

(declare-fun lt!640918 () SeekEntryResult!11922)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463905 (= res!993073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47670 a!2862) j!93) mask!2687) (select (arr!47670 a!2862) j!93) a!2862 mask!2687) lt!640918))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463905 (= lt!640918 (Intermediate!11922 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463906 () Bool)

(assert (=> b!1463906 (= e!822735 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640915 intermediateAfterIndex!19 lt!640916 lt!640914 mask!2687) (seekEntryOrOpen!0 lt!640916 lt!640914 mask!2687))))))

(declare-fun b!1463907 () Bool)

(declare-fun res!993081 () Bool)

(assert (=> b!1463907 (=> (not res!993081) (not e!822739))))

(assert (=> b!1463907 (= res!993081 (validKeyInArray!0 (select (arr!47670 a!2862) j!93)))))

(declare-fun b!1463908 () Bool)

(declare-fun e!822738 () Bool)

(assert (=> b!1463908 (= e!822736 e!822738)))

(declare-fun res!993084 () Bool)

(assert (=> b!1463908 (=> (not res!993084) (not e!822738))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463908 (= res!993084 (= lt!640919 (Intermediate!11922 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463908 (= lt!640919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640916 mask!2687) lt!640916 lt!640914 mask!2687))))

(assert (=> b!1463908 (= lt!640916 (select (store (arr!47670 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463909 () Bool)

(declare-fun res!993078 () Bool)

(assert (=> b!1463909 (=> (not res!993078) (not e!822739))))

(assert (=> b!1463909 (= res!993078 (and (= (size!48220 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48220 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48220 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463910 () Bool)

(declare-fun res!993075 () Bool)

(assert (=> b!1463910 (=> (not res!993075) (not e!822736))))

(assert (=> b!1463910 (= res!993075 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47670 a!2862) j!93) a!2862 mask!2687) lt!640918))))

(declare-fun b!1463911 () Bool)

(declare-fun res!993069 () Bool)

(declare-fun e!822732 () Bool)

(assert (=> b!1463911 (=> (not res!993069) (not e!822732))))

(assert (=> b!1463911 (= res!993069 (= (seekEntryOrOpen!0 (select (arr!47670 a!2862) j!93) a!2862 mask!2687) (Found!11922 j!93)))))

(declare-fun b!1463912 () Bool)

(declare-fun e!822734 () Bool)

(assert (=> b!1463912 (= e!822734 true)))

(declare-fun lt!640917 () Bool)

(assert (=> b!1463912 (= lt!640917 e!822735)))

(declare-fun c!134928 () Bool)

(assert (=> b!1463912 (= c!134928 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!993076 () Bool)

(assert (=> start!125316 (=> (not res!993076) (not e!822739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125316 (= res!993076 (validMask!0 mask!2687))))

(assert (=> start!125316 e!822739))

(assert (=> start!125316 true))

(declare-fun array_inv!36698 (array!98764) Bool)

(assert (=> start!125316 (array_inv!36698 a!2862)))

(declare-fun b!1463913 () Bool)

(declare-fun res!993072 () Bool)

(assert (=> b!1463913 (=> (not res!993072) (not e!822739))))

(assert (=> b!1463913 (= res!993072 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48220 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48220 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48220 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463914 () Bool)

(declare-fun res!993079 () Bool)

(assert (=> b!1463914 (=> res!993079 e!822734)))

(assert (=> b!1463914 (= res!993079 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640915 (select (arr!47670 a!2862) j!93) a!2862 mask!2687) lt!640918)))))

(declare-fun b!1463915 () Bool)

(assert (=> b!1463915 (= e!822732 (or (= (select (arr!47670 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47670 a!2862) intermediateBeforeIndex!19) (select (arr!47670 a!2862) j!93))))))

(declare-fun b!1463916 () Bool)

(declare-fun res!993070 () Bool)

(assert (=> b!1463916 (=> (not res!993070) (not e!822738))))

(assert (=> b!1463916 (= res!993070 e!822737)))

(declare-fun c!134927 () Bool)

(assert (=> b!1463916 (= c!134927 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463917 () Bool)

(declare-fun e!822740 () Bool)

(assert (=> b!1463917 (= e!822738 (not e!822740))))

(declare-fun res!993080 () Bool)

(assert (=> b!1463917 (=> res!993080 e!822740)))

(assert (=> b!1463917 (= res!993080 (or (and (= (select (arr!47670 a!2862) index!646) (select (store (arr!47670 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47670 a!2862) index!646) (select (arr!47670 a!2862) j!93))) (= (select (arr!47670 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463917 e!822732))

(declare-fun res!993085 () Bool)

(assert (=> b!1463917 (=> (not res!993085) (not e!822732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98764 (_ BitVec 32)) Bool)

(assert (=> b!1463917 (= res!993085 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49340 0))(
  ( (Unit!49341) )
))
(declare-fun lt!640920 () Unit!49340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49340)

(assert (=> b!1463917 (= lt!640920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463918 () Bool)

(assert (=> b!1463918 (= e!822740 e!822734)))

(declare-fun res!993082 () Bool)

(assert (=> b!1463918 (=> res!993082 e!822734)))

(assert (=> b!1463918 (= res!993082 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640915 #b00000000000000000000000000000000) (bvsge lt!640915 (size!48220 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463918 (= lt!640915 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463919 () Bool)

(declare-fun res!993074 () Bool)

(assert (=> b!1463919 (=> (not res!993074) (not e!822738))))

(assert (=> b!1463919 (= res!993074 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463920 () Bool)

(declare-fun res!993077 () Bool)

(assert (=> b!1463920 (=> (not res!993077) (not e!822739))))

(assert (=> b!1463920 (= res!993077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463921 () Bool)

(declare-fun res!993083 () Bool)

(assert (=> b!1463921 (=> (not res!993083) (not e!822739))))

(declare-datatypes ((List!34171 0))(
  ( (Nil!34168) (Cons!34167 (h!35517 (_ BitVec 64)) (t!48865 List!34171)) )
))
(declare-fun arrayNoDuplicates!0 (array!98764 (_ BitVec 32) List!34171) Bool)

(assert (=> b!1463921 (= res!993083 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34168))))

(declare-fun b!1463922 () Bool)

(assert (=> b!1463922 (= e!822739 e!822731)))

(declare-fun res!993071 () Bool)

(assert (=> b!1463922 (=> (not res!993071) (not e!822731))))

(assert (=> b!1463922 (= res!993071 (= (select (store (arr!47670 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463922 (= lt!640914 (array!98765 (store (arr!47670 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48220 a!2862)))))

(assert (= (and start!125316 res!993076) b!1463909))

(assert (= (and b!1463909 res!993078) b!1463904))

(assert (= (and b!1463904 res!993068) b!1463907))

(assert (= (and b!1463907 res!993081) b!1463920))

(assert (= (and b!1463920 res!993077) b!1463921))

(assert (= (and b!1463921 res!993083) b!1463913))

(assert (= (and b!1463913 res!993072) b!1463922))

(assert (= (and b!1463922 res!993071) b!1463905))

(assert (= (and b!1463905 res!993073) b!1463910))

(assert (= (and b!1463910 res!993075) b!1463908))

(assert (= (and b!1463908 res!993084) b!1463916))

(assert (= (and b!1463916 c!134927) b!1463901))

(assert (= (and b!1463916 (not c!134927)) b!1463903))

(assert (= (and b!1463916 res!993070) b!1463919))

(assert (= (and b!1463919 res!993074) b!1463917))

(assert (= (and b!1463917 res!993085) b!1463911))

(assert (= (and b!1463911 res!993069) b!1463915))

(assert (= (and b!1463917 (not res!993080)) b!1463918))

(assert (= (and b!1463918 (not res!993082)) b!1463914))

(assert (= (and b!1463914 (not res!993079)) b!1463912))

(assert (= (and b!1463912 c!134928) b!1463902))

(assert (= (and b!1463912 (not c!134928)) b!1463906))

(declare-fun m!1351181 () Bool)

(assert (=> b!1463918 m!1351181))

(declare-fun m!1351183 () Bool)

(assert (=> b!1463915 m!1351183))

(declare-fun m!1351185 () Bool)

(assert (=> b!1463915 m!1351185))

(declare-fun m!1351187 () Bool)

(assert (=> b!1463917 m!1351187))

(declare-fun m!1351189 () Bool)

(assert (=> b!1463917 m!1351189))

(declare-fun m!1351191 () Bool)

(assert (=> b!1463917 m!1351191))

(declare-fun m!1351193 () Bool)

(assert (=> b!1463917 m!1351193))

(declare-fun m!1351195 () Bool)

(assert (=> b!1463917 m!1351195))

(assert (=> b!1463917 m!1351185))

(declare-fun m!1351197 () Bool)

(assert (=> b!1463920 m!1351197))

(declare-fun m!1351199 () Bool)

(assert (=> b!1463902 m!1351199))

(assert (=> b!1463914 m!1351185))

(assert (=> b!1463914 m!1351185))

(declare-fun m!1351201 () Bool)

(assert (=> b!1463914 m!1351201))

(declare-fun m!1351203 () Bool)

(assert (=> b!1463904 m!1351203))

(assert (=> b!1463904 m!1351203))

(declare-fun m!1351205 () Bool)

(assert (=> b!1463904 m!1351205))

(declare-fun m!1351207 () Bool)

(assert (=> b!1463921 m!1351207))

(assert (=> b!1463907 m!1351185))

(assert (=> b!1463907 m!1351185))

(declare-fun m!1351209 () Bool)

(assert (=> b!1463907 m!1351209))

(declare-fun m!1351211 () Bool)

(assert (=> b!1463903 m!1351211))

(declare-fun m!1351213 () Bool)

(assert (=> b!1463903 m!1351213))

(assert (=> b!1463922 m!1351189))

(declare-fun m!1351215 () Bool)

(assert (=> b!1463922 m!1351215))

(assert (=> b!1463910 m!1351185))

(assert (=> b!1463910 m!1351185))

(declare-fun m!1351217 () Bool)

(assert (=> b!1463910 m!1351217))

(declare-fun m!1351219 () Bool)

(assert (=> b!1463908 m!1351219))

(assert (=> b!1463908 m!1351219))

(declare-fun m!1351221 () Bool)

(assert (=> b!1463908 m!1351221))

(assert (=> b!1463908 m!1351189))

(declare-fun m!1351223 () Bool)

(assert (=> b!1463908 m!1351223))

(assert (=> b!1463911 m!1351185))

(assert (=> b!1463911 m!1351185))

(declare-fun m!1351225 () Bool)

(assert (=> b!1463911 m!1351225))

(declare-fun m!1351227 () Bool)

(assert (=> start!125316 m!1351227))

(declare-fun m!1351229 () Bool)

(assert (=> start!125316 m!1351229))

(assert (=> b!1463905 m!1351185))

(assert (=> b!1463905 m!1351185))

(declare-fun m!1351231 () Bool)

(assert (=> b!1463905 m!1351231))

(assert (=> b!1463905 m!1351231))

(assert (=> b!1463905 m!1351185))

(declare-fun m!1351233 () Bool)

(assert (=> b!1463905 m!1351233))

(declare-fun m!1351235 () Bool)

(assert (=> b!1463906 m!1351235))

(assert (=> b!1463906 m!1351213))

(declare-fun m!1351237 () Bool)

(assert (=> b!1463901 m!1351237))

(check-sat (not b!1463905) (not b!1463918) (not b!1463911) (not b!1463914) (not b!1463920) (not b!1463917) (not b!1463910) (not b!1463903) (not b!1463901) (not b!1463907) (not start!125316) (not b!1463921) (not b!1463902) (not b!1463908) (not b!1463904) (not b!1463906))
(check-sat)
