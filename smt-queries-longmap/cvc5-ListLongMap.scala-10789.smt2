; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126232 () Bool)

(assert start!126232)

(declare-fun b!1479246 () Bool)

(declare-fun res!1005177 () Bool)

(declare-fun e!829756 () Bool)

(assert (=> b!1479246 (=> (not res!1005177) (not e!829756))))

(declare-datatypes ((array!99338 0))(
  ( (array!99339 (arr!47948 (Array (_ BitVec 32) (_ BitVec 64))) (size!48498 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99338)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479246 (= res!1005177 (validKeyInArray!0 (select (arr!47948 a!2862) j!93)))))

(declare-fun b!1479247 () Bool)

(declare-fun res!1005179 () Bool)

(assert (=> b!1479247 (=> (not res!1005179) (not e!829756))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479247 (= res!1005179 (and (= (size!48498 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48498 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48498 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479248 () Bool)

(declare-fun res!1005185 () Bool)

(assert (=> b!1479248 (=> (not res!1005185) (not e!829756))))

(assert (=> b!1479248 (= res!1005185 (validKeyInArray!0 (select (arr!47948 a!2862) i!1006)))))

(declare-fun b!1479250 () Bool)

(declare-fun e!829753 () Bool)

(assert (=> b!1479250 (= e!829756 e!829753)))

(declare-fun res!1005181 () Bool)

(assert (=> b!1479250 (=> (not res!1005181) (not e!829753))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479250 (= res!1005181 (= (select (store (arr!47948 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645953 () array!99338)

(assert (=> b!1479250 (= lt!645953 (array!99339 (store (arr!47948 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48498 a!2862)))))

(declare-fun b!1479251 () Bool)

(declare-fun res!1005176 () Bool)

(assert (=> b!1479251 (=> (not res!1005176) (not e!829756))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1479251 (= res!1005176 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48498 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48498 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48498 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479252 () Bool)

(declare-fun e!829750 () Bool)

(declare-fun e!829752 () Bool)

(assert (=> b!1479252 (= e!829750 (not e!829752))))

(declare-fun res!1005171 () Bool)

(assert (=> b!1479252 (=> res!1005171 e!829752)))

(assert (=> b!1479252 (= res!1005171 (or (and (= (select (arr!47948 a!2862) index!646) (select (store (arr!47948 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47948 a!2862) index!646) (select (arr!47948 a!2862) j!93))) (not (= (select (arr!47948 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47948 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829757 () Bool)

(assert (=> b!1479252 e!829757))

(declare-fun res!1005178 () Bool)

(assert (=> b!1479252 (=> (not res!1005178) (not e!829757))))

(declare-datatypes ((SeekEntryResult!12188 0))(
  ( (MissingZero!12188 (index!51144 (_ BitVec 32))) (Found!12188 (index!51145 (_ BitVec 32))) (Intermediate!12188 (undefined!13000 Bool) (index!51146 (_ BitVec 32)) (x!132731 (_ BitVec 32))) (Undefined!12188) (MissingVacant!12188 (index!51147 (_ BitVec 32))) )
))
(declare-fun lt!645952 () SeekEntryResult!12188)

(declare-fun lt!645954 () SeekEntryResult!12188)

(assert (=> b!1479252 (= res!1005178 (and (= lt!645954 lt!645952) (or (= (select (arr!47948 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47948 a!2862) intermediateBeforeIndex!19) (select (arr!47948 a!2862) j!93)))))))

(assert (=> b!1479252 (= lt!645952 (Found!12188 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99338 (_ BitVec 32)) SeekEntryResult!12188)

(assert (=> b!1479252 (= lt!645954 (seekEntryOrOpen!0 (select (arr!47948 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99338 (_ BitVec 32)) Bool)

(assert (=> b!1479252 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49716 0))(
  ( (Unit!49717) )
))
(declare-fun lt!645951 () Unit!49716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49716)

(assert (=> b!1479252 (= lt!645951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479253 () Bool)

(declare-fun res!1005173 () Bool)

(assert (=> b!1479253 (=> (not res!1005173) (not e!829750))))

(assert (=> b!1479253 (= res!1005173 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!829749 () Bool)

(declare-fun b!1479254 () Bool)

(assert (=> b!1479254 (= e!829749 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479255 () Bool)

(declare-fun res!1005183 () Bool)

(declare-fun e!829748 () Bool)

(assert (=> b!1479255 (=> (not res!1005183) (not e!829748))))

(declare-fun lt!645955 () SeekEntryResult!12188)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99338 (_ BitVec 32)) SeekEntryResult!12188)

(assert (=> b!1479255 (= res!1005183 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47948 a!2862) j!93) a!2862 mask!2687) lt!645955))))

(declare-fun b!1479256 () Bool)

(assert (=> b!1479256 (= e!829748 e!829750)))

(declare-fun res!1005187 () Bool)

(assert (=> b!1479256 (=> (not res!1005187) (not e!829750))))

(declare-fun lt!645957 () SeekEntryResult!12188)

(assert (=> b!1479256 (= res!1005187 (= lt!645957 (Intermediate!12188 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645956 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479256 (= lt!645957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645956 mask!2687) lt!645956 lt!645953 mask!2687))))

(assert (=> b!1479256 (= lt!645956 (select (store (arr!47948 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479257 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99338 (_ BitVec 32)) SeekEntryResult!12188)

(assert (=> b!1479257 (= e!829752 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47948 a!2862) j!93) a!2862 mask!2687) lt!645952))))

(declare-fun b!1479258 () Bool)

(declare-fun e!829754 () Bool)

(assert (=> b!1479258 (= e!829754 e!829749)))

(declare-fun res!1005172 () Bool)

(assert (=> b!1479258 (=> (not res!1005172) (not e!829749))))

(assert (=> b!1479258 (= res!1005172 (= lt!645954 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47948 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479259 () Bool)

(declare-fun res!1005174 () Bool)

(assert (=> b!1479259 (=> (not res!1005174) (not e!829756))))

(declare-datatypes ((List!34449 0))(
  ( (Nil!34446) (Cons!34445 (h!35813 (_ BitVec 64)) (t!49143 List!34449)) )
))
(declare-fun arrayNoDuplicates!0 (array!99338 (_ BitVec 32) List!34449) Bool)

(assert (=> b!1479259 (= res!1005174 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34446))))

(declare-fun b!1479249 () Bool)

(assert (=> b!1479249 (= e!829753 e!829748)))

(declare-fun res!1005184 () Bool)

(assert (=> b!1479249 (=> (not res!1005184) (not e!829748))))

(assert (=> b!1479249 (= res!1005184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47948 a!2862) j!93) mask!2687) (select (arr!47948 a!2862) j!93) a!2862 mask!2687) lt!645955))))

(assert (=> b!1479249 (= lt!645955 (Intermediate!12188 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1005175 () Bool)

(assert (=> start!126232 (=> (not res!1005175) (not e!829756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126232 (= res!1005175 (validMask!0 mask!2687))))

(assert (=> start!126232 e!829756))

(assert (=> start!126232 true))

(declare-fun array_inv!36976 (array!99338) Bool)

(assert (=> start!126232 (array_inv!36976 a!2862)))

(declare-fun b!1479260 () Bool)

(declare-fun res!1005180 () Bool)

(assert (=> b!1479260 (=> (not res!1005180) (not e!829756))))

(assert (=> b!1479260 (= res!1005180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479261 () Bool)

(declare-fun e!829751 () Bool)

(assert (=> b!1479261 (= e!829751 (= lt!645957 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645956 lt!645953 mask!2687)))))

(declare-fun b!1479262 () Bool)

(assert (=> b!1479262 (= e!829757 e!829754)))

(declare-fun res!1005186 () Bool)

(assert (=> b!1479262 (=> res!1005186 e!829754)))

(assert (=> b!1479262 (= res!1005186 (or (and (= (select (arr!47948 a!2862) index!646) (select (store (arr!47948 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47948 a!2862) index!646) (select (arr!47948 a!2862) j!93))) (not (= (select (arr!47948 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479263 () Bool)

(declare-fun res!1005182 () Bool)

(assert (=> b!1479263 (=> (not res!1005182) (not e!829750))))

(assert (=> b!1479263 (= res!1005182 e!829751)))

(declare-fun c!136557 () Bool)

(assert (=> b!1479263 (= c!136557 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479264 () Bool)

(assert (=> b!1479264 (= e!829751 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645956 lt!645953 mask!2687) (seekEntryOrOpen!0 lt!645956 lt!645953 mask!2687)))))

(assert (= (and start!126232 res!1005175) b!1479247))

(assert (= (and b!1479247 res!1005179) b!1479248))

(assert (= (and b!1479248 res!1005185) b!1479246))

(assert (= (and b!1479246 res!1005177) b!1479260))

(assert (= (and b!1479260 res!1005180) b!1479259))

(assert (= (and b!1479259 res!1005174) b!1479251))

(assert (= (and b!1479251 res!1005176) b!1479250))

(assert (= (and b!1479250 res!1005181) b!1479249))

(assert (= (and b!1479249 res!1005184) b!1479255))

(assert (= (and b!1479255 res!1005183) b!1479256))

(assert (= (and b!1479256 res!1005187) b!1479263))

(assert (= (and b!1479263 c!136557) b!1479261))

(assert (= (and b!1479263 (not c!136557)) b!1479264))

(assert (= (and b!1479263 res!1005182) b!1479253))

(assert (= (and b!1479253 res!1005173) b!1479252))

(assert (= (and b!1479252 res!1005178) b!1479262))

(assert (= (and b!1479262 (not res!1005186)) b!1479258))

(assert (= (and b!1479258 res!1005172) b!1479254))

(assert (= (and b!1479252 (not res!1005171)) b!1479257))

(declare-fun m!1365127 () Bool)

(assert (=> b!1479256 m!1365127))

(assert (=> b!1479256 m!1365127))

(declare-fun m!1365129 () Bool)

(assert (=> b!1479256 m!1365129))

(declare-fun m!1365131 () Bool)

(assert (=> b!1479256 m!1365131))

(declare-fun m!1365133 () Bool)

(assert (=> b!1479256 m!1365133))

(declare-fun m!1365135 () Bool)

(assert (=> b!1479257 m!1365135))

(assert (=> b!1479257 m!1365135))

(declare-fun m!1365137 () Bool)

(assert (=> b!1479257 m!1365137))

(declare-fun m!1365139 () Bool)

(assert (=> start!126232 m!1365139))

(declare-fun m!1365141 () Bool)

(assert (=> start!126232 m!1365141))

(declare-fun m!1365143 () Bool)

(assert (=> b!1479261 m!1365143))

(declare-fun m!1365145 () Bool)

(assert (=> b!1479262 m!1365145))

(assert (=> b!1479262 m!1365131))

(declare-fun m!1365147 () Bool)

(assert (=> b!1479262 m!1365147))

(assert (=> b!1479262 m!1365135))

(assert (=> b!1479258 m!1365135))

(assert (=> b!1479258 m!1365135))

(declare-fun m!1365149 () Bool)

(assert (=> b!1479258 m!1365149))

(declare-fun m!1365151 () Bool)

(assert (=> b!1479264 m!1365151))

(declare-fun m!1365153 () Bool)

(assert (=> b!1479264 m!1365153))

(assert (=> b!1479249 m!1365135))

(assert (=> b!1479249 m!1365135))

(declare-fun m!1365155 () Bool)

(assert (=> b!1479249 m!1365155))

(assert (=> b!1479249 m!1365155))

(assert (=> b!1479249 m!1365135))

(declare-fun m!1365157 () Bool)

(assert (=> b!1479249 m!1365157))

(assert (=> b!1479255 m!1365135))

(assert (=> b!1479255 m!1365135))

(declare-fun m!1365159 () Bool)

(assert (=> b!1479255 m!1365159))

(declare-fun m!1365161 () Bool)

(assert (=> b!1479260 m!1365161))

(assert (=> b!1479246 m!1365135))

(assert (=> b!1479246 m!1365135))

(declare-fun m!1365163 () Bool)

(assert (=> b!1479246 m!1365163))

(declare-fun m!1365165 () Bool)

(assert (=> b!1479248 m!1365165))

(assert (=> b!1479248 m!1365165))

(declare-fun m!1365167 () Bool)

(assert (=> b!1479248 m!1365167))

(assert (=> b!1479250 m!1365131))

(declare-fun m!1365169 () Bool)

(assert (=> b!1479250 m!1365169))

(declare-fun m!1365171 () Bool)

(assert (=> b!1479252 m!1365171))

(assert (=> b!1479252 m!1365131))

(declare-fun m!1365173 () Bool)

(assert (=> b!1479252 m!1365173))

(assert (=> b!1479252 m!1365147))

(assert (=> b!1479252 m!1365145))

(assert (=> b!1479252 m!1365135))

(declare-fun m!1365175 () Bool)

(assert (=> b!1479252 m!1365175))

(declare-fun m!1365177 () Bool)

(assert (=> b!1479252 m!1365177))

(assert (=> b!1479252 m!1365135))

(declare-fun m!1365179 () Bool)

(assert (=> b!1479259 m!1365179))

(push 1)

