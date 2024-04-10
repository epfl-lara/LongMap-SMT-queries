; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126934 () Bool)

(assert start!126934)

(declare-fun b!1492030 () Bool)

(declare-fun res!1015140 () Bool)

(declare-fun e!835889 () Bool)

(assert (=> b!1492030 (=> (not res!1015140) (not e!835889))))

(declare-fun e!835894 () Bool)

(assert (=> b!1492030 (= res!1015140 e!835894)))

(declare-fun c!137976 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1492030 (= c!137976 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492031 () Bool)

(declare-fun lt!650474 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99707 0))(
  ( (array!99708 (arr!48125 (Array (_ BitVec 32) (_ BitVec 64))) (size!48675 (_ BitVec 32))) )
))
(declare-fun lt!650473 () array!99707)

(declare-datatypes ((SeekEntryResult!12365 0))(
  ( (MissingZero!12365 (index!51852 (_ BitVec 32))) (Found!12365 (index!51853 (_ BitVec 32))) (Intermediate!12365 (undefined!13177 Bool) (index!51854 (_ BitVec 32)) (x!133437 (_ BitVec 32))) (Undefined!12365) (MissingVacant!12365 (index!51855 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99707 (_ BitVec 32)) SeekEntryResult!12365)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99707 (_ BitVec 32)) SeekEntryResult!12365)

(assert (=> b!1492031 (= e!835894 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650474 lt!650473 mask!2687) (seekEntryOrOpen!0 lt!650474 lt!650473 mask!2687)))))

(declare-fun b!1492032 () Bool)

(declare-fun res!1015139 () Bool)

(declare-fun e!835891 () Bool)

(assert (=> b!1492032 (=> (not res!1015139) (not e!835891))))

(declare-fun a!2862 () array!99707)

(declare-datatypes ((List!34626 0))(
  ( (Nil!34623) (Cons!34622 (h!36005 (_ BitVec 64)) (t!49320 List!34626)) )
))
(declare-fun arrayNoDuplicates!0 (array!99707 (_ BitVec 32) List!34626) Bool)

(assert (=> b!1492032 (= res!1015139 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34623))))

(declare-fun b!1492033 () Bool)

(declare-fun e!835893 () Bool)

(declare-fun e!835892 () Bool)

(assert (=> b!1492033 (= e!835893 e!835892)))

(declare-fun res!1015138 () Bool)

(assert (=> b!1492033 (=> (not res!1015138) (not e!835892))))

(declare-fun lt!650477 () SeekEntryResult!12365)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99707 (_ BitVec 32)) SeekEntryResult!12365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492033 (= res!1015138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687) (select (arr!48125 a!2862) j!93) a!2862 mask!2687) lt!650477))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492033 (= lt!650477 (Intermediate!12365 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492034 () Bool)

(declare-fun e!835890 () Bool)

(assert (=> b!1492034 (= e!835889 (not e!835890))))

(declare-fun res!1015134 () Bool)

(assert (=> b!1492034 (=> res!1015134 e!835890)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492034 (= res!1015134 (or (and (= (select (arr!48125 a!2862) index!646) (select (store (arr!48125 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48125 a!2862) index!646) (select (arr!48125 a!2862) j!93))) (= (select (arr!48125 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835888 () Bool)

(assert (=> b!1492034 e!835888))

(declare-fun res!1015135 () Bool)

(assert (=> b!1492034 (=> (not res!1015135) (not e!835888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99707 (_ BitVec 32)) Bool)

(assert (=> b!1492034 (= res!1015135 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50070 0))(
  ( (Unit!50071) )
))
(declare-fun lt!650476 () Unit!50070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50070)

(assert (=> b!1492034 (= lt!650476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492035 () Bool)

(declare-fun res!1015133 () Bool)

(assert (=> b!1492035 (=> (not res!1015133) (not e!835888))))

(assert (=> b!1492035 (= res!1015133 (= (seekEntryOrOpen!0 (select (arr!48125 a!2862) j!93) a!2862 mask!2687) (Found!12365 j!93)))))

(declare-fun b!1492036 () Bool)

(declare-fun res!1015142 () Bool)

(assert (=> b!1492036 (=> (not res!1015142) (not e!835891))))

(assert (=> b!1492036 (= res!1015142 (and (= (size!48675 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48675 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48675 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492037 () Bool)

(assert (=> b!1492037 (= e!835890 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!650475 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492037 (= lt!650475 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492038 () Bool)

(assert (=> b!1492038 (= e!835891 e!835893)))

(declare-fun res!1015143 () Bool)

(assert (=> b!1492038 (=> (not res!1015143) (not e!835893))))

(assert (=> b!1492038 (= res!1015143 (= (select (store (arr!48125 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492038 (= lt!650473 (array!99708 (store (arr!48125 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48675 a!2862)))))

(declare-fun b!1492039 () Bool)

(assert (=> b!1492039 (= e!835888 (or (= (select (arr!48125 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48125 a!2862) intermediateBeforeIndex!19) (select (arr!48125 a!2862) j!93))))))

(declare-fun b!1492040 () Bool)

(declare-fun lt!650478 () SeekEntryResult!12365)

(assert (=> b!1492040 (= e!835894 (= lt!650478 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650474 lt!650473 mask!2687)))))

(declare-fun b!1492041 () Bool)

(declare-fun res!1015145 () Bool)

(assert (=> b!1492041 (=> (not res!1015145) (not e!835892))))

(assert (=> b!1492041 (= res!1015145 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48125 a!2862) j!93) a!2862 mask!2687) lt!650477))))

(declare-fun b!1492042 () Bool)

(declare-fun res!1015144 () Bool)

(assert (=> b!1492042 (=> (not res!1015144) (not e!835891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492042 (= res!1015144 (validKeyInArray!0 (select (arr!48125 a!2862) j!93)))))

(declare-fun b!1492043 () Bool)

(declare-fun res!1015136 () Bool)

(assert (=> b!1492043 (=> (not res!1015136) (not e!835891))))

(assert (=> b!1492043 (= res!1015136 (validKeyInArray!0 (select (arr!48125 a!2862) i!1006)))))

(declare-fun b!1492044 () Bool)

(declare-fun res!1015147 () Bool)

(assert (=> b!1492044 (=> (not res!1015147) (not e!835891))))

(assert (=> b!1492044 (= res!1015147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492045 () Bool)

(assert (=> b!1492045 (= e!835892 e!835889)))

(declare-fun res!1015132 () Bool)

(assert (=> b!1492045 (=> (not res!1015132) (not e!835889))))

(assert (=> b!1492045 (= res!1015132 (= lt!650478 (Intermediate!12365 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1492045 (= lt!650478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650474 mask!2687) lt!650474 lt!650473 mask!2687))))

(assert (=> b!1492045 (= lt!650474 (select (store (arr!48125 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1015137 () Bool)

(assert (=> start!126934 (=> (not res!1015137) (not e!835891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126934 (= res!1015137 (validMask!0 mask!2687))))

(assert (=> start!126934 e!835891))

(assert (=> start!126934 true))

(declare-fun array_inv!37153 (array!99707) Bool)

(assert (=> start!126934 (array_inv!37153 a!2862)))

(declare-fun b!1492046 () Bool)

(declare-fun res!1015141 () Bool)

(assert (=> b!1492046 (=> (not res!1015141) (not e!835891))))

(assert (=> b!1492046 (= res!1015141 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48675 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48675 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48675 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492047 () Bool)

(declare-fun res!1015146 () Bool)

(assert (=> b!1492047 (=> (not res!1015146) (not e!835889))))

(assert (=> b!1492047 (= res!1015146 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126934 res!1015137) b!1492036))

(assert (= (and b!1492036 res!1015142) b!1492043))

(assert (= (and b!1492043 res!1015136) b!1492042))

(assert (= (and b!1492042 res!1015144) b!1492044))

(assert (= (and b!1492044 res!1015147) b!1492032))

(assert (= (and b!1492032 res!1015139) b!1492046))

(assert (= (and b!1492046 res!1015141) b!1492038))

(assert (= (and b!1492038 res!1015143) b!1492033))

(assert (= (and b!1492033 res!1015138) b!1492041))

(assert (= (and b!1492041 res!1015145) b!1492045))

(assert (= (and b!1492045 res!1015132) b!1492030))

(assert (= (and b!1492030 c!137976) b!1492040))

(assert (= (and b!1492030 (not c!137976)) b!1492031))

(assert (= (and b!1492030 res!1015140) b!1492047))

(assert (= (and b!1492047 res!1015146) b!1492034))

(assert (= (and b!1492034 res!1015135) b!1492035))

(assert (= (and b!1492035 res!1015133) b!1492039))

(assert (= (and b!1492034 (not res!1015134)) b!1492037))

(declare-fun m!1376131 () Bool)

(assert (=> b!1492034 m!1376131))

(declare-fun m!1376133 () Bool)

(assert (=> b!1492034 m!1376133))

(declare-fun m!1376135 () Bool)

(assert (=> b!1492034 m!1376135))

(declare-fun m!1376137 () Bool)

(assert (=> b!1492034 m!1376137))

(declare-fun m!1376139 () Bool)

(assert (=> b!1492034 m!1376139))

(declare-fun m!1376141 () Bool)

(assert (=> b!1492034 m!1376141))

(assert (=> b!1492042 m!1376141))

(assert (=> b!1492042 m!1376141))

(declare-fun m!1376143 () Bool)

(assert (=> b!1492042 m!1376143))

(declare-fun m!1376145 () Bool)

(assert (=> b!1492032 m!1376145))

(declare-fun m!1376147 () Bool)

(assert (=> b!1492045 m!1376147))

(assert (=> b!1492045 m!1376147))

(declare-fun m!1376149 () Bool)

(assert (=> b!1492045 m!1376149))

(assert (=> b!1492045 m!1376133))

(declare-fun m!1376151 () Bool)

(assert (=> b!1492045 m!1376151))

(declare-fun m!1376153 () Bool)

(assert (=> b!1492031 m!1376153))

(declare-fun m!1376155 () Bool)

(assert (=> b!1492031 m!1376155))

(declare-fun m!1376157 () Bool)

(assert (=> b!1492044 m!1376157))

(declare-fun m!1376159 () Bool)

(assert (=> b!1492039 m!1376159))

(assert (=> b!1492039 m!1376141))

(declare-fun m!1376161 () Bool)

(assert (=> b!1492037 m!1376161))

(assert (=> b!1492035 m!1376141))

(assert (=> b!1492035 m!1376141))

(declare-fun m!1376163 () Bool)

(assert (=> b!1492035 m!1376163))

(assert (=> b!1492038 m!1376133))

(declare-fun m!1376165 () Bool)

(assert (=> b!1492038 m!1376165))

(declare-fun m!1376167 () Bool)

(assert (=> b!1492040 m!1376167))

(declare-fun m!1376169 () Bool)

(assert (=> start!126934 m!1376169))

(declare-fun m!1376171 () Bool)

(assert (=> start!126934 m!1376171))

(assert (=> b!1492033 m!1376141))

(assert (=> b!1492033 m!1376141))

(declare-fun m!1376173 () Bool)

(assert (=> b!1492033 m!1376173))

(assert (=> b!1492033 m!1376173))

(assert (=> b!1492033 m!1376141))

(declare-fun m!1376175 () Bool)

(assert (=> b!1492033 m!1376175))

(declare-fun m!1376177 () Bool)

(assert (=> b!1492043 m!1376177))

(assert (=> b!1492043 m!1376177))

(declare-fun m!1376179 () Bool)

(assert (=> b!1492043 m!1376179))

(assert (=> b!1492041 m!1376141))

(assert (=> b!1492041 m!1376141))

(declare-fun m!1376181 () Bool)

(assert (=> b!1492041 m!1376181))

(push 1)

(assert (not b!1492034))

(assert (not b!1492041))

(assert (not b!1492042))

(assert (not b!1492033))

(assert (not b!1492037))

(assert (not b!1492044))

(assert (not b!1492035))

(assert (not b!1492045))

(assert (not start!126934))

(assert (not b!1492032))

(assert (not b!1492043))

(assert (not b!1492031))

(assert (not b!1492040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1492241 () Bool)

(declare-fun lt!650553 () SeekEntryResult!12365)

(assert (=> b!1492241 (and (bvsge (index!51854 lt!650553) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650553) (size!48675 lt!650473)))))

(declare-fun e!835996 () Bool)

(assert (=> b!1492241 (= e!835996 (= (select (arr!48125 lt!650473) (index!51854 lt!650553)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492242 () Bool)

(declare-fun e!835997 () SeekEntryResult!12365)

(assert (=> b!1492242 (= e!835997 (Intermediate!12365 false index!646 x!665))))

(declare-fun b!1492243 () Bool)

(declare-fun e!835998 () Bool)

(assert (=> b!1492243 (= e!835998 (bvsge (x!133437 lt!650553) #b01111111111111111111111111111110))))

(declare-fun b!1492244 () Bool)

(declare-fun e!835999 () SeekEntryResult!12365)

(assert (=> b!1492244 (= e!835999 (Intermediate!12365 true index!646 x!665))))

(declare-fun b!1492245 () Bool)

(declare-fun e!836000 () Bool)

(assert (=> b!1492245 (= e!835998 e!836000)))

(declare-fun res!1015268 () Bool)

(assert (=> b!1492245 (= res!1015268 (and (is-Intermediate!12365 lt!650553) (not (undefined!13177 lt!650553)) (bvslt (x!133437 lt!650553) #b01111111111111111111111111111110) (bvsge (x!133437 lt!650553) #b00000000000000000000000000000000) (bvsge (x!133437 lt!650553) x!665)))))

(assert (=> b!1492245 (=> (not res!1015268) (not e!836000))))

(declare-fun d!156845 () Bool)

(assert (=> d!156845 e!835998))

(declare-fun c!138015 () Bool)

(assert (=> d!156845 (= c!138015 (and (is-Intermediate!12365 lt!650553) (undefined!13177 lt!650553)))))

(assert (=> d!156845 (= lt!650553 e!835999)))

(declare-fun c!138016 () Bool)

(assert (=> d!156845 (= c!138016 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650552 () (_ BitVec 64))

(assert (=> d!156845 (= lt!650552 (select (arr!48125 lt!650473) index!646))))

(assert (=> d!156845 (validMask!0 mask!2687)))

(assert (=> d!156845 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650474 lt!650473 mask!2687) lt!650553)))

(declare-fun b!1492246 () Bool)

(assert (=> b!1492246 (= e!835997 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650474 lt!650473 mask!2687))))

(declare-fun b!1492247 () Bool)

(assert (=> b!1492247 (and (bvsge (index!51854 lt!650553) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650553) (size!48675 lt!650473)))))

(declare-fun res!1015269 () Bool)

(assert (=> b!1492247 (= res!1015269 (= (select (arr!48125 lt!650473) (index!51854 lt!650553)) lt!650474))))

(assert (=> b!1492247 (=> res!1015269 e!835996)))

(assert (=> b!1492247 (= e!836000 e!835996)))

(declare-fun b!1492248 () Bool)

(assert (=> b!1492248 (= e!835999 e!835997)))

(declare-fun c!138014 () Bool)

(assert (=> b!1492248 (= c!138014 (or (= lt!650552 lt!650474) (= (bvadd lt!650552 lt!650552) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492249 () Bool)

(assert (=> b!1492249 (and (bvsge (index!51854 lt!650553) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650553) (size!48675 lt!650473)))))

(declare-fun res!1015267 () Bool)

(assert (=> b!1492249 (= res!1015267 (= (select (arr!48125 lt!650473) (index!51854 lt!650553)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492249 (=> res!1015267 e!835996)))

(assert (= (and d!156845 c!138016) b!1492244))

(assert (= (and d!156845 (not c!138016)) b!1492248))

(assert (= (and b!1492248 c!138014) b!1492242))

(assert (= (and b!1492248 (not c!138014)) b!1492246))

(assert (= (and d!156845 c!138015) b!1492243))

(assert (= (and d!156845 (not c!138015)) b!1492245))

(assert (= (and b!1492245 res!1015268) b!1492247))

(assert (= (and b!1492247 (not res!1015269)) b!1492249))

(assert (= (and b!1492249 (not res!1015267)) b!1492241))

(declare-fun m!1376331 () Bool)

(assert (=> b!1492247 m!1376331))

(assert (=> b!1492241 m!1376331))

(assert (=> b!1492246 m!1376161))

(assert (=> b!1492246 m!1376161))

(declare-fun m!1376333 () Bool)

(assert (=> b!1492246 m!1376333))

(declare-fun m!1376335 () Bool)

(assert (=> d!156845 m!1376335))

(assert (=> d!156845 m!1376169))

(assert (=> b!1492249 m!1376331))

(assert (=> b!1492040 d!156845))

(declare-fun e!836039 () SeekEntryResult!12365)

(declare-fun b!1492316 () Bool)

(assert (=> b!1492316 (= e!836039 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650474 lt!650473 mask!2687))))

(declare-fun b!1492317 () Bool)

(declare-fun c!138043 () Bool)

(declare-fun lt!650574 () (_ BitVec 64))

(assert (=> b!1492317 (= c!138043 (= lt!650574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836037 () SeekEntryResult!12365)

(assert (=> b!1492317 (= e!836037 e!836039)))

(declare-fun b!1492318 () Bool)

(assert (=> b!1492318 (= e!836039 (MissingVacant!12365 intermediateAfterIndex!19))))

(declare-fun b!1492319 () Bool)

(declare-fun e!836038 () SeekEntryResult!12365)

(assert (=> b!1492319 (= e!836038 Undefined!12365)))

(declare-fun b!1492320 () Bool)

(assert (=> b!1492320 (= e!836038 e!836037)))

(declare-fun c!138041 () Bool)

(assert (=> b!1492320 (= c!138041 (= lt!650574 lt!650474))))

(declare-fun lt!650573 () SeekEntryResult!12365)

(declare-fun d!156855 () Bool)

(assert (=> d!156855 (and (or (is-Undefined!12365 lt!650573) (not (is-Found!12365 lt!650573)) (and (bvsge (index!51853 lt!650573) #b00000000000000000000000000000000) (bvslt (index!51853 lt!650573) (size!48675 lt!650473)))) (or (is-Undefined!12365 lt!650573) (is-Found!12365 lt!650573) (not (is-MissingVacant!12365 lt!650573)) (not (= (index!51855 lt!650573) intermediateAfterIndex!19)) (and (bvsge (index!51855 lt!650573) #b00000000000000000000000000000000) (bvslt (index!51855 lt!650573) (size!48675 lt!650473)))) (or (is-Undefined!12365 lt!650573) (ite (is-Found!12365 lt!650573) (= (select (arr!48125 lt!650473) (index!51853 lt!650573)) lt!650474) (and (is-MissingVacant!12365 lt!650573) (= (index!51855 lt!650573) intermediateAfterIndex!19) (= (select (arr!48125 lt!650473) (index!51855 lt!650573)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156855 (= lt!650573 e!836038)))

(declare-fun c!138042 () Bool)

(assert (=> d!156855 (= c!138042 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156855 (= lt!650574 (select (arr!48125 lt!650473) index!646))))

(assert (=> d!156855 (validMask!0 mask!2687)))

(assert (=> d!156855 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650474 lt!650473 mask!2687) lt!650573)))

(declare-fun b!1492321 () Bool)

(assert (=> b!1492321 (= e!836037 (Found!12365 index!646))))

(assert (= (and d!156855 c!138042) b!1492319))

(assert (= (and d!156855 (not c!138042)) b!1492320))

(assert (= (and b!1492320 c!138041) b!1492321))

(assert (= (and b!1492320 (not c!138041)) b!1492317))

(assert (= (and b!1492317 c!138043) b!1492318))

(assert (= (and b!1492317 (not c!138043)) b!1492316))

(assert (=> b!1492316 m!1376161))

(assert (=> b!1492316 m!1376161))

(declare-fun m!1376353 () Bool)

(assert (=> b!1492316 m!1376353))

(declare-fun m!1376355 () Bool)

(assert (=> d!156855 m!1376355))

(declare-fun m!1376357 () Bool)

(assert (=> d!156855 m!1376357))

(assert (=> d!156855 m!1376335))

(assert (=> d!156855 m!1376169))

(assert (=> b!1492031 d!156855))

(declare-fun b!1492388 () Bool)

(declare-fun e!836079 () SeekEntryResult!12365)

(declare-fun lt!650616 () SeekEntryResult!12365)

(assert (=> b!1492388 (= e!836079 (Found!12365 (index!51854 lt!650616)))))

(declare-fun b!1492389 () Bool)

(declare-fun e!836080 () SeekEntryResult!12365)

(assert (=> b!1492389 (= e!836080 Undefined!12365)))

(declare-fun d!156863 () Bool)

(declare-fun lt!650617 () SeekEntryResult!12365)

(assert (=> d!156863 (and (or (is-Undefined!12365 lt!650617) (not (is-Found!12365 lt!650617)) (and (bvsge (index!51853 lt!650617) #b00000000000000000000000000000000) (bvslt (index!51853 lt!650617) (size!48675 lt!650473)))) (or (is-Undefined!12365 lt!650617) (is-Found!12365 lt!650617) (not (is-MissingZero!12365 lt!650617)) (and (bvsge (index!51852 lt!650617) #b00000000000000000000000000000000) (bvslt (index!51852 lt!650617) (size!48675 lt!650473)))) (or (is-Undefined!12365 lt!650617) (is-Found!12365 lt!650617) (is-MissingZero!12365 lt!650617) (not (is-MissingVacant!12365 lt!650617)) (and (bvsge (index!51855 lt!650617) #b00000000000000000000000000000000) (bvslt (index!51855 lt!650617) (size!48675 lt!650473)))) (or (is-Undefined!12365 lt!650617) (ite (is-Found!12365 lt!650617) (= (select (arr!48125 lt!650473) (index!51853 lt!650617)) lt!650474) (ite (is-MissingZero!12365 lt!650617) (= (select (arr!48125 lt!650473) (index!51852 lt!650617)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12365 lt!650617) (= (select (arr!48125 lt!650473) (index!51855 lt!650617)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156863 (= lt!650617 e!836080)))

(declare-fun c!138068 () Bool)

(assert (=> d!156863 (= c!138068 (and (is-Intermediate!12365 lt!650616) (undefined!13177 lt!650616)))))

(assert (=> d!156863 (= lt!650616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650474 mask!2687) lt!650474 lt!650473 mask!2687))))

(assert (=> d!156863 (validMask!0 mask!2687)))

(assert (=> d!156863 (= (seekEntryOrOpen!0 lt!650474 lt!650473 mask!2687) lt!650617)))

(declare-fun b!1492390 () Bool)

(declare-fun c!138069 () Bool)

(declare-fun lt!650615 () (_ BitVec 64))

(assert (=> b!1492390 (= c!138069 (= lt!650615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836078 () SeekEntryResult!12365)

(assert (=> b!1492390 (= e!836079 e!836078)))

(declare-fun b!1492391 () Bool)

(assert (=> b!1492391 (= e!836078 (seekKeyOrZeroReturnVacant!0 (x!133437 lt!650616) (index!51854 lt!650616) (index!51854 lt!650616) lt!650474 lt!650473 mask!2687))))

(declare-fun b!1492392 () Bool)

(assert (=> b!1492392 (= e!836078 (MissingZero!12365 (index!51854 lt!650616)))))

(declare-fun b!1492393 () Bool)

(assert (=> b!1492393 (= e!836080 e!836079)))

(assert (=> b!1492393 (= lt!650615 (select (arr!48125 lt!650473) (index!51854 lt!650616)))))

(declare-fun c!138070 () Bool)

(assert (=> b!1492393 (= c!138070 (= lt!650615 lt!650474))))

(assert (= (and d!156863 c!138068) b!1492389))

(assert (= (and d!156863 (not c!138068)) b!1492393))

(assert (= (and b!1492393 c!138070) b!1492388))

(assert (= (and b!1492393 (not c!138070)) b!1492390))

(assert (= (and b!1492390 c!138069) b!1492392))

(assert (= (and b!1492390 (not c!138069)) b!1492391))

(declare-fun m!1376405 () Bool)

(assert (=> d!156863 m!1376405))

(assert (=> d!156863 m!1376147))

(declare-fun m!1376407 () Bool)

(assert (=> d!156863 m!1376407))

(assert (=> d!156863 m!1376147))

(assert (=> d!156863 m!1376149))

(assert (=> d!156863 m!1376169))

(declare-fun m!1376409 () Bool)

(assert (=> d!156863 m!1376409))

(declare-fun m!1376411 () Bool)

(assert (=> b!1492391 m!1376411))

(declare-fun m!1376413 () Bool)

(assert (=> b!1492393 m!1376413))

(assert (=> b!1492031 d!156863))

(declare-fun d!156887 () Bool)

(assert (=> d!156887 (= (validKeyInArray!0 (select (arr!48125 a!2862) j!93)) (and (not (= (select (arr!48125 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48125 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492042 d!156887))

(declare-fun b!1492394 () Bool)

(declare-fun lt!650619 () SeekEntryResult!12365)

(assert (=> b!1492394 (and (bvsge (index!51854 lt!650619) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650619) (size!48675 a!2862)))))

(declare-fun e!836081 () Bool)

(assert (=> b!1492394 (= e!836081 (= (select (arr!48125 a!2862) (index!51854 lt!650619)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492395 () Bool)

(declare-fun e!836082 () SeekEntryResult!12365)

(assert (=> b!1492395 (= e!836082 (Intermediate!12365 false index!646 x!665))))

(declare-fun b!1492396 () Bool)

(declare-fun e!836083 () Bool)

(assert (=> b!1492396 (= e!836083 (bvsge (x!133437 lt!650619) #b01111111111111111111111111111110))))

(declare-fun b!1492397 () Bool)

(declare-fun e!836084 () SeekEntryResult!12365)

(assert (=> b!1492397 (= e!836084 (Intermediate!12365 true index!646 x!665))))

(declare-fun b!1492398 () Bool)

(declare-fun e!836085 () Bool)

(assert (=> b!1492398 (= e!836083 e!836085)))

(declare-fun res!1015309 () Bool)

(assert (=> b!1492398 (= res!1015309 (and (is-Intermediate!12365 lt!650619) (not (undefined!13177 lt!650619)) (bvslt (x!133437 lt!650619) #b01111111111111111111111111111110) (bvsge (x!133437 lt!650619) #b00000000000000000000000000000000) (bvsge (x!133437 lt!650619) x!665)))))

(assert (=> b!1492398 (=> (not res!1015309) (not e!836085))))

(declare-fun d!156889 () Bool)

(assert (=> d!156889 e!836083))

(declare-fun c!138072 () Bool)

(assert (=> d!156889 (= c!138072 (and (is-Intermediate!12365 lt!650619) (undefined!13177 lt!650619)))))

(assert (=> d!156889 (= lt!650619 e!836084)))

(declare-fun c!138073 () Bool)

(assert (=> d!156889 (= c!138073 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650618 () (_ BitVec 64))

(assert (=> d!156889 (= lt!650618 (select (arr!48125 a!2862) index!646))))

(assert (=> d!156889 (validMask!0 mask!2687)))

(assert (=> d!156889 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48125 a!2862) j!93) a!2862 mask!2687) lt!650619)))

(declare-fun b!1492399 () Bool)

(assert (=> b!1492399 (= e!836082 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48125 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492400 () Bool)

(assert (=> b!1492400 (and (bvsge (index!51854 lt!650619) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650619) (size!48675 a!2862)))))

(declare-fun res!1015310 () Bool)

(assert (=> b!1492400 (= res!1015310 (= (select (arr!48125 a!2862) (index!51854 lt!650619)) (select (arr!48125 a!2862) j!93)))))

(assert (=> b!1492400 (=> res!1015310 e!836081)))

(assert (=> b!1492400 (= e!836085 e!836081)))

(declare-fun b!1492401 () Bool)

(assert (=> b!1492401 (= e!836084 e!836082)))

(declare-fun c!138071 () Bool)

(assert (=> b!1492401 (= c!138071 (or (= lt!650618 (select (arr!48125 a!2862) j!93)) (= (bvadd lt!650618 lt!650618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492402 () Bool)

(assert (=> b!1492402 (and (bvsge (index!51854 lt!650619) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650619) (size!48675 a!2862)))))

(declare-fun res!1015308 () Bool)

(assert (=> b!1492402 (= res!1015308 (= (select (arr!48125 a!2862) (index!51854 lt!650619)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492402 (=> res!1015308 e!836081)))

(assert (= (and d!156889 c!138073) b!1492397))

(assert (= (and d!156889 (not c!138073)) b!1492401))

(assert (= (and b!1492401 c!138071) b!1492395))

(assert (= (and b!1492401 (not c!138071)) b!1492399))

(assert (= (and d!156889 c!138072) b!1492396))

(assert (= (and d!156889 (not c!138072)) b!1492398))

(assert (= (and b!1492398 res!1015309) b!1492400))

(assert (= (and b!1492400 (not res!1015310)) b!1492402))

(assert (= (and b!1492402 (not res!1015308)) b!1492394))

(declare-fun m!1376415 () Bool)

(assert (=> b!1492400 m!1376415))

(assert (=> b!1492394 m!1376415))

(assert (=> b!1492399 m!1376161))

(assert (=> b!1492399 m!1376161))

(assert (=> b!1492399 m!1376141))

(declare-fun m!1376417 () Bool)

(assert (=> b!1492399 m!1376417))

(assert (=> d!156889 m!1376137))

(assert (=> d!156889 m!1376169))

(assert (=> b!1492402 m!1376415))

(assert (=> b!1492041 d!156889))

(declare-fun d!156891 () Bool)

(assert (=> d!156891 (= (validKeyInArray!0 (select (arr!48125 a!2862) i!1006)) (and (not (= (select (arr!48125 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48125 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492043 d!156891))

(declare-fun d!156893 () Bool)

(declare-fun res!1015317 () Bool)

(declare-fun e!836105 () Bool)

(assert (=> d!156893 (=> res!1015317 e!836105)))

(assert (=> d!156893 (= res!1015317 (bvsge #b00000000000000000000000000000000 (size!48675 a!2862)))))

(assert (=> d!156893 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34623) e!836105)))

(declare-fun b!1492431 () Bool)

(declare-fun e!836104 () Bool)

(declare-fun e!836106 () Bool)

(assert (=> b!1492431 (= e!836104 e!836106)))

(declare-fun c!138085 () Bool)

(assert (=> b!1492431 (= c!138085 (validKeyInArray!0 (select (arr!48125 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67946 () Bool)

(declare-fun call!67949 () Bool)

(assert (=> bm!67946 (= call!67949 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138085 (Cons!34622 (select (arr!48125 a!2862) #b00000000000000000000000000000000) Nil!34623) Nil!34623)))))

(declare-fun b!1492432 () Bool)

(assert (=> b!1492432 (= e!836105 e!836104)))

(declare-fun res!1015318 () Bool)

(assert (=> b!1492432 (=> (not res!1015318) (not e!836104))))

(declare-fun e!836103 () Bool)

(assert (=> b!1492432 (= res!1015318 (not e!836103))))

(declare-fun res!1015319 () Bool)

(assert (=> b!1492432 (=> (not res!1015319) (not e!836103))))

(assert (=> b!1492432 (= res!1015319 (validKeyInArray!0 (select (arr!48125 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492433 () Bool)

(assert (=> b!1492433 (= e!836106 call!67949)))

(declare-fun b!1492434 () Bool)

(declare-fun contains!9926 (List!34626 (_ BitVec 64)) Bool)

(assert (=> b!1492434 (= e!836103 (contains!9926 Nil!34623 (select (arr!48125 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492435 () Bool)

(assert (=> b!1492435 (= e!836106 call!67949)))

(assert (= (and d!156893 (not res!1015317)) b!1492432))

(assert (= (and b!1492432 res!1015319) b!1492434))

(assert (= (and b!1492432 res!1015318) b!1492431))

(assert (= (and b!1492431 c!138085) b!1492435))

(assert (= (and b!1492431 (not c!138085)) b!1492433))

(assert (= (or b!1492435 b!1492433) bm!67946))

(declare-fun m!1376425 () Bool)

(assert (=> b!1492431 m!1376425))

(assert (=> b!1492431 m!1376425))

(declare-fun m!1376427 () Bool)

(assert (=> b!1492431 m!1376427))

(assert (=> bm!67946 m!1376425))

(declare-fun m!1376429 () Bool)

(assert (=> bm!67946 m!1376429))

(assert (=> b!1492432 m!1376425))

(assert (=> b!1492432 m!1376425))

(assert (=> b!1492432 m!1376427))

(assert (=> b!1492434 m!1376425))

(assert (=> b!1492434 m!1376425))

(declare-fun m!1376431 () Bool)

(assert (=> b!1492434 m!1376431))

(assert (=> b!1492032 d!156893))

(declare-fun b!1492444 () Bool)

(declare-fun e!836115 () Bool)

(declare-fun e!836114 () Bool)

(assert (=> b!1492444 (= e!836115 e!836114)))

(declare-fun lt!650633 () (_ BitVec 64))

(assert (=> b!1492444 (= lt!650633 (select (arr!48125 a!2862) j!93))))

(declare-fun lt!650634 () Unit!50070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99707 (_ BitVec 64) (_ BitVec 32)) Unit!50070)

(assert (=> b!1492444 (= lt!650634 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650633 j!93))))

(declare-fun arrayContainsKey!0 (array!99707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1492444 (arrayContainsKey!0 a!2862 lt!650633 #b00000000000000000000000000000000)))

(declare-fun lt!650632 () Unit!50070)

(assert (=> b!1492444 (= lt!650632 lt!650634)))

(declare-fun res!1015325 () Bool)

(assert (=> b!1492444 (= res!1015325 (= (seekEntryOrOpen!0 (select (arr!48125 a!2862) j!93) a!2862 mask!2687) (Found!12365 j!93)))))

(assert (=> b!1492444 (=> (not res!1015325) (not e!836114))))

(declare-fun d!156897 () Bool)

(declare-fun res!1015324 () Bool)

(declare-fun e!836113 () Bool)

(assert (=> d!156897 (=> res!1015324 e!836113)))

(assert (=> d!156897 (= res!1015324 (bvsge j!93 (size!48675 a!2862)))))

(assert (=> d!156897 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!836113)))

(declare-fun b!1492445 () Bool)

(assert (=> b!1492445 (= e!836113 e!836115)))

(declare-fun c!138088 () Bool)

(assert (=> b!1492445 (= c!138088 (validKeyInArray!0 (select (arr!48125 a!2862) j!93)))))

(declare-fun b!1492446 () Bool)

(declare-fun call!67952 () Bool)

(assert (=> b!1492446 (= e!836115 call!67952)))

(declare-fun b!1492447 () Bool)

(assert (=> b!1492447 (= e!836114 call!67952)))

(declare-fun bm!67949 () Bool)

(assert (=> bm!67949 (= call!67952 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156897 (not res!1015324)) b!1492445))

(assert (= (and b!1492445 c!138088) b!1492444))

(assert (= (and b!1492445 (not c!138088)) b!1492446))

(assert (= (and b!1492444 res!1015325) b!1492447))

(assert (= (or b!1492447 b!1492446) bm!67949))

(assert (=> b!1492444 m!1376141))

(declare-fun m!1376433 () Bool)

(assert (=> b!1492444 m!1376433))

(declare-fun m!1376435 () Bool)

(assert (=> b!1492444 m!1376435))

(assert (=> b!1492444 m!1376141))

(assert (=> b!1492444 m!1376163))

(assert (=> b!1492445 m!1376141))

(assert (=> b!1492445 m!1376141))

(assert (=> b!1492445 m!1376143))

(declare-fun m!1376437 () Bool)

(assert (=> bm!67949 m!1376437))

(assert (=> b!1492034 d!156897))

(declare-fun d!156899 () Bool)

(assert (=> d!156899 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650646 () Unit!50070)

(declare-fun choose!38 (array!99707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50070)

(assert (=> d!156899 (= lt!650646 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156899 (validMask!0 mask!2687)))

(assert (=> d!156899 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650646)))

(declare-fun bs!42863 () Bool)

(assert (= bs!42863 d!156899))

(assert (=> bs!42863 m!1376139))

(declare-fun m!1376443 () Bool)

(assert (=> bs!42863 m!1376443))

(assert (=> bs!42863 m!1376169))

(assert (=> b!1492034 d!156899))

(declare-fun b!1492466 () Bool)

(declare-fun lt!650648 () SeekEntryResult!12365)

(assert (=> b!1492466 (and (bvsge (index!51854 lt!650648) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650648) (size!48675 a!2862)))))

(declare-fun e!836125 () Bool)

(assert (=> b!1492466 (= e!836125 (= (select (arr!48125 a!2862) (index!51854 lt!650648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836126 () SeekEntryResult!12365)

(declare-fun b!1492467 () Bool)

(assert (=> b!1492467 (= e!836126 (Intermediate!12365 false (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492468 () Bool)

(declare-fun e!836127 () Bool)

(assert (=> b!1492468 (= e!836127 (bvsge (x!133437 lt!650648) #b01111111111111111111111111111110))))

(declare-fun e!836128 () SeekEntryResult!12365)

(declare-fun b!1492469 () Bool)

(assert (=> b!1492469 (= e!836128 (Intermediate!12365 true (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492470 () Bool)

(declare-fun e!836129 () Bool)

(assert (=> b!1492470 (= e!836127 e!836129)))

(declare-fun res!1015327 () Bool)

(assert (=> b!1492470 (= res!1015327 (and (is-Intermediate!12365 lt!650648) (not (undefined!13177 lt!650648)) (bvslt (x!133437 lt!650648) #b01111111111111111111111111111110) (bvsge (x!133437 lt!650648) #b00000000000000000000000000000000) (bvsge (x!133437 lt!650648) #b00000000000000000000000000000000)))))

(assert (=> b!1492470 (=> (not res!1015327) (not e!836129))))

(declare-fun d!156901 () Bool)

(assert (=> d!156901 e!836127))

(declare-fun c!138099 () Bool)

(assert (=> d!156901 (= c!138099 (and (is-Intermediate!12365 lt!650648) (undefined!13177 lt!650648)))))

(assert (=> d!156901 (= lt!650648 e!836128)))

(declare-fun c!138100 () Bool)

(assert (=> d!156901 (= c!138100 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!650647 () (_ BitVec 64))

(assert (=> d!156901 (= lt!650647 (select (arr!48125 a!2862) (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687)))))

(assert (=> d!156901 (validMask!0 mask!2687)))

(assert (=> d!156901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687) (select (arr!48125 a!2862) j!93) a!2862 mask!2687) lt!650648)))

(declare-fun b!1492471 () Bool)

(assert (=> b!1492471 (= e!836126 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48125 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492472 () Bool)

(assert (=> b!1492472 (and (bvsge (index!51854 lt!650648) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650648) (size!48675 a!2862)))))

(declare-fun res!1015328 () Bool)

(assert (=> b!1492472 (= res!1015328 (= (select (arr!48125 a!2862) (index!51854 lt!650648)) (select (arr!48125 a!2862) j!93)))))

(assert (=> b!1492472 (=> res!1015328 e!836125)))

(assert (=> b!1492472 (= e!836129 e!836125)))

(declare-fun b!1492473 () Bool)

(assert (=> b!1492473 (= e!836128 e!836126)))

(declare-fun c!138098 () Bool)

(assert (=> b!1492473 (= c!138098 (or (= lt!650647 (select (arr!48125 a!2862) j!93)) (= (bvadd lt!650647 lt!650647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492474 () Bool)

(assert (=> b!1492474 (and (bvsge (index!51854 lt!650648) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650648) (size!48675 a!2862)))))

(declare-fun res!1015326 () Bool)

(assert (=> b!1492474 (= res!1015326 (= (select (arr!48125 a!2862) (index!51854 lt!650648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492474 (=> res!1015326 e!836125)))

(assert (= (and d!156901 c!138100) b!1492469))

(assert (= (and d!156901 (not c!138100)) b!1492473))

(assert (= (and b!1492473 c!138098) b!1492467))

(assert (= (and b!1492473 (not c!138098)) b!1492471))

(assert (= (and d!156901 c!138099) b!1492468))

(assert (= (and d!156901 (not c!138099)) b!1492470))

(assert (= (and b!1492470 res!1015327) b!1492472))

(assert (= (and b!1492472 (not res!1015328)) b!1492474))

(assert (= (and b!1492474 (not res!1015326)) b!1492466))

(declare-fun m!1376457 () Bool)

(assert (=> b!1492472 m!1376457))

(assert (=> b!1492466 m!1376457))

(assert (=> b!1492471 m!1376173))

(declare-fun m!1376459 () Bool)

(assert (=> b!1492471 m!1376459))

(assert (=> b!1492471 m!1376459))

(assert (=> b!1492471 m!1376141))

(declare-fun m!1376461 () Bool)

(assert (=> b!1492471 m!1376461))

(assert (=> d!156901 m!1376173))

(declare-fun m!1376463 () Bool)

(assert (=> d!156901 m!1376463))

(assert (=> d!156901 m!1376169))

(assert (=> b!1492474 m!1376457))

(assert (=> b!1492033 d!156901))

(declare-fun d!156907 () Bool)

(declare-fun lt!650662 () (_ BitVec 32))

(declare-fun lt!650661 () (_ BitVec 32))

(assert (=> d!156907 (= lt!650662 (bvmul (bvxor lt!650661 (bvlshr lt!650661 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156907 (= lt!650661 ((_ extract 31 0) (bvand (bvxor (select (arr!48125 a!2862) j!93) (bvlshr (select (arr!48125 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156907 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015331 (let ((h!36010 ((_ extract 31 0) (bvand (bvxor (select (arr!48125 a!2862) j!93) (bvlshr (select (arr!48125 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133450 (bvmul (bvxor h!36010 (bvlshr h!36010 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133450 (bvlshr x!133450 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015331 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015331 #b00000000000000000000000000000000))))))

(assert (=> d!156907 (= (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687) (bvand (bvxor lt!650662 (bvlshr lt!650662 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492033 d!156907))

(declare-fun b!1492488 () Bool)

(declare-fun e!836140 () Bool)

(declare-fun e!836139 () Bool)

(assert (=> b!1492488 (= e!836140 e!836139)))

(declare-fun lt!650664 () (_ BitVec 64))

(assert (=> b!1492488 (= lt!650664 (select (arr!48125 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650665 () Unit!50070)

(assert (=> b!1492488 (= lt!650665 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650664 #b00000000000000000000000000000000))))

(assert (=> b!1492488 (arrayContainsKey!0 a!2862 lt!650664 #b00000000000000000000000000000000)))

(declare-fun lt!650663 () Unit!50070)

(assert (=> b!1492488 (= lt!650663 lt!650665)))

(declare-fun res!1015336 () Bool)

(assert (=> b!1492488 (= res!1015336 (= (seekEntryOrOpen!0 (select (arr!48125 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12365 #b00000000000000000000000000000000)))))

(assert (=> b!1492488 (=> (not res!1015336) (not e!836139))))

(declare-fun d!156913 () Bool)

(declare-fun res!1015335 () Bool)

(declare-fun e!836138 () Bool)

(assert (=> d!156913 (=> res!1015335 e!836138)))

(assert (=> d!156913 (= res!1015335 (bvsge #b00000000000000000000000000000000 (size!48675 a!2862)))))

(assert (=> d!156913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!836138)))

(declare-fun b!1492489 () Bool)

(assert (=> b!1492489 (= e!836138 e!836140)))

(declare-fun c!138105 () Bool)

(assert (=> b!1492489 (= c!138105 (validKeyInArray!0 (select (arr!48125 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492490 () Bool)

(declare-fun call!67954 () Bool)

(assert (=> b!1492490 (= e!836140 call!67954)))

(declare-fun b!1492491 () Bool)

(assert (=> b!1492491 (= e!836139 call!67954)))

(declare-fun bm!67951 () Bool)

(assert (=> bm!67951 (= call!67954 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156913 (not res!1015335)) b!1492489))

(assert (= (and b!1492489 c!138105) b!1492488))

(assert (= (and b!1492489 (not c!138105)) b!1492490))

(assert (= (and b!1492488 res!1015336) b!1492491))

(assert (= (or b!1492491 b!1492490) bm!67951))

(assert (=> b!1492488 m!1376425))

(declare-fun m!1376471 () Bool)

(assert (=> b!1492488 m!1376471))

(declare-fun m!1376473 () Bool)

(assert (=> b!1492488 m!1376473))

(assert (=> b!1492488 m!1376425))

(declare-fun m!1376475 () Bool)

(assert (=> b!1492488 m!1376475))

(assert (=> b!1492489 m!1376425))

(assert (=> b!1492489 m!1376425))

(assert (=> b!1492489 m!1376427))

(declare-fun m!1376477 () Bool)

(assert (=> bm!67951 m!1376477))

(assert (=> b!1492044 d!156913))

(declare-fun b!1492492 () Bool)

(declare-fun e!836142 () SeekEntryResult!12365)

(declare-fun lt!650667 () SeekEntryResult!12365)

(assert (=> b!1492492 (= e!836142 (Found!12365 (index!51854 lt!650667)))))

(declare-fun b!1492493 () Bool)

(declare-fun e!836143 () SeekEntryResult!12365)

(assert (=> b!1492493 (= e!836143 Undefined!12365)))

(declare-fun d!156915 () Bool)

(declare-fun lt!650668 () SeekEntryResult!12365)

(assert (=> d!156915 (and (or (is-Undefined!12365 lt!650668) (not (is-Found!12365 lt!650668)) (and (bvsge (index!51853 lt!650668) #b00000000000000000000000000000000) (bvslt (index!51853 lt!650668) (size!48675 a!2862)))) (or (is-Undefined!12365 lt!650668) (is-Found!12365 lt!650668) (not (is-MissingZero!12365 lt!650668)) (and (bvsge (index!51852 lt!650668) #b00000000000000000000000000000000) (bvslt (index!51852 lt!650668) (size!48675 a!2862)))) (or (is-Undefined!12365 lt!650668) (is-Found!12365 lt!650668) (is-MissingZero!12365 lt!650668) (not (is-MissingVacant!12365 lt!650668)) (and (bvsge (index!51855 lt!650668) #b00000000000000000000000000000000) (bvslt (index!51855 lt!650668) (size!48675 a!2862)))) (or (is-Undefined!12365 lt!650668) (ite (is-Found!12365 lt!650668) (= (select (arr!48125 a!2862) (index!51853 lt!650668)) (select (arr!48125 a!2862) j!93)) (ite (is-MissingZero!12365 lt!650668) (= (select (arr!48125 a!2862) (index!51852 lt!650668)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12365 lt!650668) (= (select (arr!48125 a!2862) (index!51855 lt!650668)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156915 (= lt!650668 e!836143)))

(declare-fun c!138106 () Bool)

(assert (=> d!156915 (= c!138106 (and (is-Intermediate!12365 lt!650667) (undefined!13177 lt!650667)))))

(assert (=> d!156915 (= lt!650667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48125 a!2862) j!93) mask!2687) (select (arr!48125 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156915 (validMask!0 mask!2687)))

(assert (=> d!156915 (= (seekEntryOrOpen!0 (select (arr!48125 a!2862) j!93) a!2862 mask!2687) lt!650668)))

(declare-fun b!1492494 () Bool)

(declare-fun c!138107 () Bool)

(declare-fun lt!650666 () (_ BitVec 64))

(assert (=> b!1492494 (= c!138107 (= lt!650666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836141 () SeekEntryResult!12365)

(assert (=> b!1492494 (= e!836142 e!836141)))

