; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124450 () Bool)

(assert start!124450)

(declare-fun b!1439896 () Bool)

(declare-fun res!972330 () Bool)

(declare-fun e!812014 () Bool)

(assert (=> b!1439896 (=> (not res!972330) (not e!812014))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11489 0))(
  ( (MissingZero!11489 (index!48348 (_ BitVec 32))) (Found!11489 (index!48349 (_ BitVec 32))) (Intermediate!11489 (undefined!12301 Bool) (index!48350 (_ BitVec 32)) (x!130082 (_ BitVec 32))) (Undefined!11489) (MissingVacant!11489 (index!48351 (_ BitVec 32))) )
))
(declare-fun lt!632883 () SeekEntryResult!11489)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97898 0))(
  ( (array!97899 (arr!47237 (Array (_ BitVec 32) (_ BitVec 64))) (size!47787 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97898)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97898 (_ BitVec 32)) SeekEntryResult!11489)

(assert (=> b!1439896 (= res!972330 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47237 a!2862) j!93) a!2862 mask!2687) lt!632883))))

(declare-fun b!1439897 () Bool)

(declare-fun res!972327 () Bool)

(declare-fun e!812015 () Bool)

(assert (=> b!1439897 (=> (not res!972327) (not e!812015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97898 (_ BitVec 32)) Bool)

(assert (=> b!1439897 (= res!972327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439899 () Bool)

(declare-fun res!972329 () Bool)

(assert (=> b!1439899 (=> (not res!972329) (not e!812015))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439899 (= res!972329 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47787 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47787 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47787 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47237 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439900 () Bool)

(declare-fun res!972331 () Bool)

(assert (=> b!1439900 (=> (not res!972331) (not e!812015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439900 (= res!972331 (validKeyInArray!0 (select (arr!47237 a!2862) j!93)))))

(declare-fun b!1439901 () Bool)

(assert (=> b!1439901 (= e!812014 false)))

(declare-fun lt!632882 () SeekEntryResult!11489)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439901 (= lt!632882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47237 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47237 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97899 (store (arr!47237 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47787 a!2862)) mask!2687))))

(declare-fun b!1439902 () Bool)

(declare-fun res!972326 () Bool)

(assert (=> b!1439902 (=> (not res!972326) (not e!812015))))

(assert (=> b!1439902 (= res!972326 (and (= (size!47787 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47787 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47787 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439903 () Bool)

(declare-fun res!972328 () Bool)

(assert (=> b!1439903 (=> (not res!972328) (not e!812015))))

(declare-datatypes ((List!33738 0))(
  ( (Nil!33735) (Cons!33734 (h!35084 (_ BitVec 64)) (t!48432 List!33738)) )
))
(declare-fun arrayNoDuplicates!0 (array!97898 (_ BitVec 32) List!33738) Bool)

(assert (=> b!1439903 (= res!972328 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33735))))

(declare-fun b!1439904 () Bool)

(assert (=> b!1439904 (= e!812015 e!812014)))

(declare-fun res!972323 () Bool)

(assert (=> b!1439904 (=> (not res!972323) (not e!812014))))

(assert (=> b!1439904 (= res!972323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47237 a!2862) j!93) mask!2687) (select (arr!47237 a!2862) j!93) a!2862 mask!2687) lt!632883))))

(assert (=> b!1439904 (= lt!632883 (Intermediate!11489 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!972325 () Bool)

(assert (=> start!124450 (=> (not res!972325) (not e!812015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124450 (= res!972325 (validMask!0 mask!2687))))

(assert (=> start!124450 e!812015))

(assert (=> start!124450 true))

(declare-fun array_inv!36265 (array!97898) Bool)

(assert (=> start!124450 (array_inv!36265 a!2862)))

(declare-fun b!1439898 () Bool)

(declare-fun res!972324 () Bool)

(assert (=> b!1439898 (=> (not res!972324) (not e!812015))))

(assert (=> b!1439898 (= res!972324 (validKeyInArray!0 (select (arr!47237 a!2862) i!1006)))))

(assert (= (and start!124450 res!972325) b!1439902))

(assert (= (and b!1439902 res!972326) b!1439898))

(assert (= (and b!1439898 res!972324) b!1439900))

(assert (= (and b!1439900 res!972331) b!1439897))

(assert (= (and b!1439897 res!972327) b!1439903))

(assert (= (and b!1439903 res!972328) b!1439899))

(assert (= (and b!1439899 res!972329) b!1439904))

(assert (= (and b!1439904 res!972323) b!1439896))

(assert (= (and b!1439896 res!972330) b!1439901))

(declare-fun m!1329019 () Bool)

(assert (=> b!1439897 m!1329019))

(declare-fun m!1329021 () Bool)

(assert (=> b!1439896 m!1329021))

(assert (=> b!1439896 m!1329021))

(declare-fun m!1329023 () Bool)

(assert (=> b!1439896 m!1329023))

(declare-fun m!1329025 () Bool)

(assert (=> b!1439899 m!1329025))

(declare-fun m!1329027 () Bool)

(assert (=> b!1439899 m!1329027))

(declare-fun m!1329029 () Bool)

(assert (=> b!1439903 m!1329029))

(assert (=> b!1439900 m!1329021))

(assert (=> b!1439900 m!1329021))

(declare-fun m!1329031 () Bool)

(assert (=> b!1439900 m!1329031))

(declare-fun m!1329033 () Bool)

(assert (=> b!1439898 m!1329033))

(assert (=> b!1439898 m!1329033))

(declare-fun m!1329035 () Bool)

(assert (=> b!1439898 m!1329035))

(assert (=> b!1439904 m!1329021))

(assert (=> b!1439904 m!1329021))

(declare-fun m!1329037 () Bool)

(assert (=> b!1439904 m!1329037))

(assert (=> b!1439904 m!1329037))

(assert (=> b!1439904 m!1329021))

(declare-fun m!1329039 () Bool)

(assert (=> b!1439904 m!1329039))

(declare-fun m!1329041 () Bool)

(assert (=> start!124450 m!1329041))

(declare-fun m!1329043 () Bool)

(assert (=> start!124450 m!1329043))

(assert (=> b!1439901 m!1329025))

(declare-fun m!1329045 () Bool)

(assert (=> b!1439901 m!1329045))

(assert (=> b!1439901 m!1329045))

(declare-fun m!1329047 () Bool)

(assert (=> b!1439901 m!1329047))

(assert (=> b!1439901 m!1329047))

(assert (=> b!1439901 m!1329045))

(declare-fun m!1329049 () Bool)

(assert (=> b!1439901 m!1329049))

(push 1)

