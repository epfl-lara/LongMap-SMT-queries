; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124608 () Bool)

(assert start!124608)

(declare-fun b!1442897 () Bool)

(declare-fun e!813171 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98056 0))(
  ( (array!98057 (arr!47316 (Array (_ BitVec 32) (_ BitVec 64))) (size!47866 (_ BitVec 32))) )
))
(declare-fun lt!633698 () array!98056)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633696 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11568 0))(
  ( (MissingZero!11568 (index!48664 (_ BitVec 32))) (Found!11568 (index!48665 (_ BitVec 32))) (Intermediate!11568 (undefined!12380 Bool) (index!48666 (_ BitVec 32)) (x!130369 (_ BitVec 32))) (Undefined!11568) (MissingVacant!11568 (index!48667 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98056 (_ BitVec 32)) SeekEntryResult!11568)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98056 (_ BitVec 32)) SeekEntryResult!11568)

(assert (=> b!1442897 (= e!813171 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633696 lt!633698 mask!2687) (seekEntryOrOpen!0 lt!633696 lt!633698 mask!2687)))))

(declare-fun lt!633697 () SeekEntryResult!11568)

(declare-fun b!1442899 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98056 (_ BitVec 32)) SeekEntryResult!11568)

(assert (=> b!1442899 (= e!813171 (= lt!633697 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633696 lt!633698 mask!2687)))))

(declare-fun b!1442900 () Bool)

(declare-fun res!975069 () Bool)

(declare-fun e!813172 () Bool)

(assert (=> b!1442900 (=> (not res!975069) (not e!813172))))

(declare-fun a!2862 () array!98056)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442900 (= res!975069 (validKeyInArray!0 (select (arr!47316 a!2862) j!93)))))

(declare-fun b!1442901 () Bool)

(declare-fun res!975065 () Bool)

(declare-fun e!813167 () Bool)

(assert (=> b!1442901 (=> (not res!975065) (not e!813167))))

(assert (=> b!1442901 (= res!975065 (= (seekEntryOrOpen!0 (select (arr!47316 a!2862) j!93) a!2862 mask!2687) (Found!11568 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1442902 () Bool)

(assert (=> b!1442902 (= e!813167 (or (= (select (arr!47316 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47316 a!2862) intermediateBeforeIndex!19) (select (arr!47316 a!2862) j!93))))))

(declare-fun b!1442903 () Bool)

(declare-fun e!813168 () Bool)

(declare-fun e!813169 () Bool)

(assert (=> b!1442903 (= e!813168 e!813169)))

(declare-fun res!975074 () Bool)

(assert (=> b!1442903 (=> (not res!975074) (not e!813169))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442903 (= res!975074 (= lt!633697 (Intermediate!11568 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442903 (= lt!633697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633696 mask!2687) lt!633696 lt!633698 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442903 (= lt!633696 (select (store (arr!47316 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442904 () Bool)

(declare-fun res!975062 () Bool)

(assert (=> b!1442904 (=> (not res!975062) (not e!813172))))

(declare-datatypes ((List!33817 0))(
  ( (Nil!33814) (Cons!33813 (h!35163 (_ BitVec 64)) (t!48511 List!33817)) )
))
(declare-fun arrayNoDuplicates!0 (array!98056 (_ BitVec 32) List!33817) Bool)

(assert (=> b!1442904 (= res!975062 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33814))))

(declare-fun b!1442905 () Bool)

(declare-fun res!975075 () Bool)

(assert (=> b!1442905 (=> (not res!975075) (not e!813172))))

(assert (=> b!1442905 (= res!975075 (validKeyInArray!0 (select (arr!47316 a!2862) i!1006)))))

(declare-fun b!1442906 () Bool)

(declare-fun res!975064 () Bool)

(assert (=> b!1442906 (=> (not res!975064) (not e!813172))))

(assert (=> b!1442906 (= res!975064 (and (= (size!47866 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47866 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47866 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!975072 () Bool)

(assert (=> start!124608 (=> (not res!975072) (not e!813172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124608 (= res!975072 (validMask!0 mask!2687))))

(assert (=> start!124608 e!813172))

(assert (=> start!124608 true))

(declare-fun array_inv!36344 (array!98056) Bool)

(assert (=> start!124608 (array_inv!36344 a!2862)))

(declare-fun b!1442898 () Bool)

(assert (=> b!1442898 (= e!813169 (not (or (not (= (select (arr!47316 a!2862) index!646) (select (store (arr!47316 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47316 a!2862) index!646) (select (arr!47316 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1442898 e!813167))

(declare-fun res!975066 () Bool)

(assert (=> b!1442898 (=> (not res!975066) (not e!813167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98056 (_ BitVec 32)) Bool)

(assert (=> b!1442898 (= res!975066 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48632 0))(
  ( (Unit!48633) )
))
(declare-fun lt!633699 () Unit!48632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48632)

(assert (=> b!1442898 (= lt!633699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442907 () Bool)

(declare-fun e!813170 () Bool)

(assert (=> b!1442907 (= e!813172 e!813170)))

(declare-fun res!975071 () Bool)

(assert (=> b!1442907 (=> (not res!975071) (not e!813170))))

(assert (=> b!1442907 (= res!975071 (= (select (store (arr!47316 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442907 (= lt!633698 (array!98057 (store (arr!47316 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47866 a!2862)))))

(declare-fun b!1442908 () Bool)

(declare-fun res!975076 () Bool)

(assert (=> b!1442908 (=> (not res!975076) (not e!813169))))

(assert (=> b!1442908 (= res!975076 e!813171)))

(declare-fun c!133428 () Bool)

(assert (=> b!1442908 (= c!133428 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442909 () Bool)

(declare-fun res!975070 () Bool)

(assert (=> b!1442909 (=> (not res!975070) (not e!813169))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442909 (= res!975070 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442910 () Bool)

(assert (=> b!1442910 (= e!813170 e!813168)))

(declare-fun res!975073 () Bool)

(assert (=> b!1442910 (=> (not res!975073) (not e!813168))))

(declare-fun lt!633695 () SeekEntryResult!11568)

(assert (=> b!1442910 (= res!975073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47316 a!2862) j!93) mask!2687) (select (arr!47316 a!2862) j!93) a!2862 mask!2687) lt!633695))))

(assert (=> b!1442910 (= lt!633695 (Intermediate!11568 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442911 () Bool)

(declare-fun res!975067 () Bool)

(assert (=> b!1442911 (=> (not res!975067) (not e!813168))))

(assert (=> b!1442911 (= res!975067 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47316 a!2862) j!93) a!2862 mask!2687) lt!633695))))

(declare-fun b!1442912 () Bool)

(declare-fun res!975063 () Bool)

(assert (=> b!1442912 (=> (not res!975063) (not e!813172))))

(assert (=> b!1442912 (= res!975063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442913 () Bool)

(declare-fun res!975068 () Bool)

(assert (=> b!1442913 (=> (not res!975068) (not e!813172))))

(assert (=> b!1442913 (= res!975068 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47866 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47866 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47866 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124608 res!975072) b!1442906))

(assert (= (and b!1442906 res!975064) b!1442905))

(assert (= (and b!1442905 res!975075) b!1442900))

(assert (= (and b!1442900 res!975069) b!1442912))

(assert (= (and b!1442912 res!975063) b!1442904))

(assert (= (and b!1442904 res!975062) b!1442913))

(assert (= (and b!1442913 res!975068) b!1442907))

(assert (= (and b!1442907 res!975071) b!1442910))

(assert (= (and b!1442910 res!975073) b!1442911))

(assert (= (and b!1442911 res!975067) b!1442903))

(assert (= (and b!1442903 res!975074) b!1442908))

(assert (= (and b!1442908 c!133428) b!1442899))

(assert (= (and b!1442908 (not c!133428)) b!1442897))

(assert (= (and b!1442908 res!975076) b!1442909))

(assert (= (and b!1442909 res!975070) b!1442898))

(assert (= (and b!1442898 res!975066) b!1442901))

(assert (= (and b!1442901 res!975065) b!1442902))

(declare-fun m!1332009 () Bool)

(assert (=> b!1442901 m!1332009))

(assert (=> b!1442901 m!1332009))

(declare-fun m!1332011 () Bool)

(assert (=> b!1442901 m!1332011))

(declare-fun m!1332013 () Bool)

(assert (=> b!1442912 m!1332013))

(declare-fun m!1332015 () Bool)

(assert (=> b!1442897 m!1332015))

(declare-fun m!1332017 () Bool)

(assert (=> b!1442897 m!1332017))

(assert (=> b!1442911 m!1332009))

(assert (=> b!1442911 m!1332009))

(declare-fun m!1332019 () Bool)

(assert (=> b!1442911 m!1332019))

(declare-fun m!1332021 () Bool)

(assert (=> b!1442898 m!1332021))

(declare-fun m!1332023 () Bool)

(assert (=> b!1442898 m!1332023))

(declare-fun m!1332025 () Bool)

(assert (=> b!1442898 m!1332025))

(declare-fun m!1332027 () Bool)

(assert (=> b!1442898 m!1332027))

(declare-fun m!1332029 () Bool)

(assert (=> b!1442898 m!1332029))

(assert (=> b!1442898 m!1332009))

(declare-fun m!1332031 () Bool)

(assert (=> b!1442902 m!1332031))

(assert (=> b!1442902 m!1332009))

(assert (=> b!1442900 m!1332009))

(assert (=> b!1442900 m!1332009))

(declare-fun m!1332033 () Bool)

(assert (=> b!1442900 m!1332033))

(declare-fun m!1332035 () Bool)

(assert (=> start!124608 m!1332035))

(declare-fun m!1332037 () Bool)

(assert (=> start!124608 m!1332037))

(assert (=> b!1442907 m!1332023))

(declare-fun m!1332039 () Bool)

(assert (=> b!1442907 m!1332039))

(declare-fun m!1332041 () Bool)

(assert (=> b!1442903 m!1332041))

(assert (=> b!1442903 m!1332041))

(declare-fun m!1332043 () Bool)

(assert (=> b!1442903 m!1332043))

(assert (=> b!1442903 m!1332023))

(declare-fun m!1332045 () Bool)

(assert (=> b!1442903 m!1332045))

(declare-fun m!1332047 () Bool)

(assert (=> b!1442899 m!1332047))

(assert (=> b!1442910 m!1332009))

(assert (=> b!1442910 m!1332009))

(declare-fun m!1332049 () Bool)

(assert (=> b!1442910 m!1332049))

(assert (=> b!1442910 m!1332049))

(assert (=> b!1442910 m!1332009))

(declare-fun m!1332051 () Bool)

(assert (=> b!1442910 m!1332051))

(declare-fun m!1332053 () Bool)

(assert (=> b!1442904 m!1332053))

(declare-fun m!1332055 () Bool)

(assert (=> b!1442905 m!1332055))

(assert (=> b!1442905 m!1332055))

(declare-fun m!1332057 () Bool)

(assert (=> b!1442905 m!1332057))

(check-sat (not b!1442903) (not start!124608) (not b!1442901) (not b!1442910) (not b!1442899) (not b!1442897) (not b!1442911) (not b!1442900) (not b!1442904) (not b!1442912) (not b!1442905) (not b!1442898))
(check-sat)
