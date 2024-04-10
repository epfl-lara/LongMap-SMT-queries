; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126936 () Bool)

(assert start!126936)

(declare-fun b!1492084 () Bool)

(declare-fun e!835912 () Bool)

(declare-fun e!835918 () Bool)

(assert (=> b!1492084 (= e!835912 (not e!835918))))

(declare-fun res!1015186 () Bool)

(assert (=> b!1492084 (=> res!1015186 e!835918)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99709 0))(
  ( (array!99710 (arr!48126 (Array (_ BitVec 32) (_ BitVec 64))) (size!48676 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99709)

(assert (=> b!1492084 (= res!1015186 (or (and (= (select (arr!48126 a!2862) index!646) (select (store (arr!48126 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48126 a!2862) index!646) (select (arr!48126 a!2862) j!93))) (= (select (arr!48126 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835919 () Bool)

(assert (=> b!1492084 e!835919))

(declare-fun res!1015190 () Bool)

(assert (=> b!1492084 (=> (not res!1015190) (not e!835919))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99709 (_ BitVec 32)) Bool)

(assert (=> b!1492084 (= res!1015190 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50072 0))(
  ( (Unit!50073) )
))
(declare-fun lt!650496 () Unit!50072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50072)

(assert (=> b!1492084 (= lt!650496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492085 () Bool)

(declare-fun res!1015181 () Bool)

(assert (=> b!1492085 (=> (not res!1015181) (not e!835912))))

(declare-fun e!835913 () Bool)

(assert (=> b!1492085 (= res!1015181 e!835913)))

(declare-fun c!137979 () Bool)

(assert (=> b!1492085 (= c!137979 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492086 () Bool)

(declare-fun res!1015193 () Bool)

(declare-fun e!835916 () Bool)

(assert (=> b!1492086 (=> (not res!1015193) (not e!835916))))

(declare-datatypes ((SeekEntryResult!12366 0))(
  ( (MissingZero!12366 (index!51856 (_ BitVec 32))) (Found!12366 (index!51857 (_ BitVec 32))) (Intermediate!12366 (undefined!13178 Bool) (index!51858 (_ BitVec 32)) (x!133438 (_ BitVec 32))) (Undefined!12366) (MissingVacant!12366 (index!51859 (_ BitVec 32))) )
))
(declare-fun lt!650495 () SeekEntryResult!12366)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12366)

(assert (=> b!1492086 (= res!1015193 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48126 a!2862) j!93) a!2862 mask!2687) lt!650495))))

(declare-fun b!1492087 () Bool)

(declare-fun e!835917 () Bool)

(declare-fun e!835914 () Bool)

(assert (=> b!1492087 (= e!835917 e!835914)))

(declare-fun res!1015195 () Bool)

(assert (=> b!1492087 (=> (not res!1015195) (not e!835914))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492087 (= res!1015195 (= (select (store (arr!48126 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650493 () array!99709)

(assert (=> b!1492087 (= lt!650493 (array!99710 (store (arr!48126 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48676 a!2862)))))

(declare-fun b!1492088 () Bool)

(declare-fun res!1015191 () Bool)

(assert (=> b!1492088 (=> (not res!1015191) (not e!835919))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12366)

(assert (=> b!1492088 (= res!1015191 (= (seekEntryOrOpen!0 (select (arr!48126 a!2862) j!93) a!2862 mask!2687) (Found!12366 j!93)))))

(declare-fun b!1492090 () Bool)

(assert (=> b!1492090 (= e!835914 e!835916)))

(declare-fun res!1015184 () Bool)

(assert (=> b!1492090 (=> (not res!1015184) (not e!835916))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492090 (= res!1015184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687) (select (arr!48126 a!2862) j!93) a!2862 mask!2687) lt!650495))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492090 (= lt!650495 (Intermediate!12366 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!650491 () (_ BitVec 64))

(declare-fun lt!650494 () SeekEntryResult!12366)

(declare-fun b!1492091 () Bool)

(assert (=> b!1492091 (= e!835913 (= lt!650494 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650491 lt!650493 mask!2687)))))

(declare-fun b!1492092 () Bool)

(declare-fun res!1015180 () Bool)

(assert (=> b!1492092 (=> (not res!1015180) (not e!835917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492092 (= res!1015180 (validKeyInArray!0 (select (arr!48126 a!2862) i!1006)))))

(declare-fun b!1492093 () Bool)

(declare-fun res!1015185 () Bool)

(assert (=> b!1492093 (=> (not res!1015185) (not e!835917))))

(declare-datatypes ((List!34627 0))(
  ( (Nil!34624) (Cons!34623 (h!36006 (_ BitVec 64)) (t!49321 List!34627)) )
))
(declare-fun arrayNoDuplicates!0 (array!99709 (_ BitVec 32) List!34627) Bool)

(assert (=> b!1492093 (= res!1015185 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34624))))

(declare-fun b!1492094 () Bool)

(declare-fun res!1015189 () Bool)

(assert (=> b!1492094 (=> (not res!1015189) (not e!835917))))

(assert (=> b!1492094 (= res!1015189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492095 () Bool)

(assert (=> b!1492095 (= e!835918 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!650492 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492095 (= lt!650492 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492096 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12366)

(assert (=> b!1492096 (= e!835913 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650491 lt!650493 mask!2687) (seekEntryOrOpen!0 lt!650491 lt!650493 mask!2687)))))

(declare-fun b!1492097 () Bool)

(assert (=> b!1492097 (= e!835919 (or (= (select (arr!48126 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48126 a!2862) intermediateBeforeIndex!19) (select (arr!48126 a!2862) j!93))))))

(declare-fun b!1492098 () Bool)

(declare-fun res!1015182 () Bool)

(assert (=> b!1492098 (=> (not res!1015182) (not e!835917))))

(assert (=> b!1492098 (= res!1015182 (validKeyInArray!0 (select (arr!48126 a!2862) j!93)))))

(declare-fun res!1015188 () Bool)

(assert (=> start!126936 (=> (not res!1015188) (not e!835917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126936 (= res!1015188 (validMask!0 mask!2687))))

(assert (=> start!126936 e!835917))

(assert (=> start!126936 true))

(declare-fun array_inv!37154 (array!99709) Bool)

(assert (=> start!126936 (array_inv!37154 a!2862)))

(declare-fun b!1492089 () Bool)

(declare-fun res!1015192 () Bool)

(assert (=> b!1492089 (=> (not res!1015192) (not e!835917))))

(assert (=> b!1492089 (= res!1015192 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48676 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48676 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48676 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492099 () Bool)

(declare-fun res!1015194 () Bool)

(assert (=> b!1492099 (=> (not res!1015194) (not e!835912))))

(assert (=> b!1492099 (= res!1015194 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492100 () Bool)

(assert (=> b!1492100 (= e!835916 e!835912)))

(declare-fun res!1015187 () Bool)

(assert (=> b!1492100 (=> (not res!1015187) (not e!835912))))

(assert (=> b!1492100 (= res!1015187 (= lt!650494 (Intermediate!12366 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1492100 (= lt!650494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650491 mask!2687) lt!650491 lt!650493 mask!2687))))

(assert (=> b!1492100 (= lt!650491 (select (store (arr!48126 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492101 () Bool)

(declare-fun res!1015183 () Bool)

(assert (=> b!1492101 (=> (not res!1015183) (not e!835917))))

(assert (=> b!1492101 (= res!1015183 (and (= (size!48676 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48676 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48676 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126936 res!1015188) b!1492101))

(assert (= (and b!1492101 res!1015183) b!1492092))

(assert (= (and b!1492092 res!1015180) b!1492098))

(assert (= (and b!1492098 res!1015182) b!1492094))

(assert (= (and b!1492094 res!1015189) b!1492093))

(assert (= (and b!1492093 res!1015185) b!1492089))

(assert (= (and b!1492089 res!1015192) b!1492087))

(assert (= (and b!1492087 res!1015195) b!1492090))

(assert (= (and b!1492090 res!1015184) b!1492086))

(assert (= (and b!1492086 res!1015193) b!1492100))

(assert (= (and b!1492100 res!1015187) b!1492085))

(assert (= (and b!1492085 c!137979) b!1492091))

(assert (= (and b!1492085 (not c!137979)) b!1492096))

(assert (= (and b!1492085 res!1015181) b!1492099))

(assert (= (and b!1492099 res!1015194) b!1492084))

(assert (= (and b!1492084 res!1015190) b!1492088))

(assert (= (and b!1492088 res!1015191) b!1492097))

(assert (= (and b!1492084 (not res!1015186)) b!1492095))

(declare-fun m!1376183 () Bool)

(assert (=> b!1492092 m!1376183))

(assert (=> b!1492092 m!1376183))

(declare-fun m!1376185 () Bool)

(assert (=> b!1492092 m!1376185))

(declare-fun m!1376187 () Bool)

(assert (=> b!1492087 m!1376187))

(declare-fun m!1376189 () Bool)

(assert (=> b!1492087 m!1376189))

(declare-fun m!1376191 () Bool)

(assert (=> b!1492095 m!1376191))

(declare-fun m!1376193 () Bool)

(assert (=> b!1492098 m!1376193))

(assert (=> b!1492098 m!1376193))

(declare-fun m!1376195 () Bool)

(assert (=> b!1492098 m!1376195))

(declare-fun m!1376197 () Bool)

(assert (=> b!1492093 m!1376197))

(assert (=> b!1492090 m!1376193))

(assert (=> b!1492090 m!1376193))

(declare-fun m!1376199 () Bool)

(assert (=> b!1492090 m!1376199))

(assert (=> b!1492090 m!1376199))

(assert (=> b!1492090 m!1376193))

(declare-fun m!1376201 () Bool)

(assert (=> b!1492090 m!1376201))

(declare-fun m!1376203 () Bool)

(assert (=> b!1492100 m!1376203))

(assert (=> b!1492100 m!1376203))

(declare-fun m!1376205 () Bool)

(assert (=> b!1492100 m!1376205))

(assert (=> b!1492100 m!1376187))

(declare-fun m!1376207 () Bool)

(assert (=> b!1492100 m!1376207))

(declare-fun m!1376209 () Bool)

(assert (=> start!126936 m!1376209))

(declare-fun m!1376211 () Bool)

(assert (=> start!126936 m!1376211))

(declare-fun m!1376213 () Bool)

(assert (=> b!1492096 m!1376213))

(declare-fun m!1376215 () Bool)

(assert (=> b!1492096 m!1376215))

(declare-fun m!1376217 () Bool)

(assert (=> b!1492097 m!1376217))

(assert (=> b!1492097 m!1376193))

(declare-fun m!1376219 () Bool)

(assert (=> b!1492094 m!1376219))

(assert (=> b!1492088 m!1376193))

(assert (=> b!1492088 m!1376193))

(declare-fun m!1376221 () Bool)

(assert (=> b!1492088 m!1376221))

(declare-fun m!1376223 () Bool)

(assert (=> b!1492084 m!1376223))

(assert (=> b!1492084 m!1376187))

(declare-fun m!1376225 () Bool)

(assert (=> b!1492084 m!1376225))

(declare-fun m!1376227 () Bool)

(assert (=> b!1492084 m!1376227))

(declare-fun m!1376229 () Bool)

(assert (=> b!1492084 m!1376229))

(assert (=> b!1492084 m!1376193))

(assert (=> b!1492086 m!1376193))

(assert (=> b!1492086 m!1376193))

(declare-fun m!1376231 () Bool)

(assert (=> b!1492086 m!1376231))

(declare-fun m!1376233 () Bool)

(assert (=> b!1492091 m!1376233))

(check-sat (not b!1492096) (not b!1492098) (not b!1492092) (not b!1492093) (not b!1492094) (not b!1492095) (not b!1492091) (not start!126936) (not b!1492086) (not b!1492088) (not b!1492090) (not b!1492084) (not b!1492100))
(check-sat)
(get-model)

(declare-fun d!156825 () Bool)

(assert (=> d!156825 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126936 d!156825))

(declare-fun d!156827 () Bool)

(assert (=> d!156827 (= (array_inv!37154 a!2862) (bvsge (size!48676 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126936 d!156827))

(declare-fun b!1492166 () Bool)

(declare-fun e!835955 () Bool)

(declare-fun e!835952 () Bool)

(assert (=> b!1492166 (= e!835955 e!835952)))

(declare-fun res!1015250 () Bool)

(assert (=> b!1492166 (=> (not res!1015250) (not e!835952))))

(declare-fun e!835953 () Bool)

(assert (=> b!1492166 (= res!1015250 (not e!835953))))

(declare-fun res!1015252 () Bool)

(assert (=> b!1492166 (=> (not res!1015252) (not e!835953))))

(assert (=> b!1492166 (= res!1015252 (validKeyInArray!0 (select (arr!48126 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492167 () Bool)

(declare-fun e!835954 () Bool)

(declare-fun call!67939 () Bool)

(assert (=> b!1492167 (= e!835954 call!67939)))

(declare-fun b!1492168 () Bool)

(declare-fun contains!9925 (List!34627 (_ BitVec 64)) Bool)

(assert (=> b!1492168 (= e!835953 (contains!9925 Nil!34624 (select (arr!48126 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156829 () Bool)

(declare-fun res!1015251 () Bool)

(assert (=> d!156829 (=> res!1015251 e!835955)))

(assert (=> d!156829 (= res!1015251 (bvsge #b00000000000000000000000000000000 (size!48676 a!2862)))))

(assert (=> d!156829 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34624) e!835955)))

(declare-fun b!1492169 () Bool)

(assert (=> b!1492169 (= e!835952 e!835954)))

(declare-fun c!137985 () Bool)

(assert (=> b!1492169 (= c!137985 (validKeyInArray!0 (select (arr!48126 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67936 () Bool)

(assert (=> bm!67936 (= call!67939 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137985 (Cons!34623 (select (arr!48126 a!2862) #b00000000000000000000000000000000) Nil!34624) Nil!34624)))))

(declare-fun b!1492170 () Bool)

(assert (=> b!1492170 (= e!835954 call!67939)))

(assert (= (and d!156829 (not res!1015251)) b!1492166))

(assert (= (and b!1492166 res!1015252) b!1492168))

(assert (= (and b!1492166 res!1015250) b!1492169))

(assert (= (and b!1492169 c!137985) b!1492170))

(assert (= (and b!1492169 (not c!137985)) b!1492167))

(assert (= (or b!1492170 b!1492167) bm!67936))

(declare-fun m!1376287 () Bool)

(assert (=> b!1492166 m!1376287))

(assert (=> b!1492166 m!1376287))

(declare-fun m!1376289 () Bool)

(assert (=> b!1492166 m!1376289))

(assert (=> b!1492168 m!1376287))

(assert (=> b!1492168 m!1376287))

(declare-fun m!1376291 () Bool)

(assert (=> b!1492168 m!1376291))

(assert (=> b!1492169 m!1376287))

(assert (=> b!1492169 m!1376287))

(assert (=> b!1492169 m!1376289))

(assert (=> bm!67936 m!1376287))

(declare-fun m!1376293 () Bool)

(assert (=> bm!67936 m!1376293))

(assert (=> b!1492093 d!156829))

(declare-fun d!156831 () Bool)

(declare-fun res!1015258 () Bool)

(declare-fun e!835964 () Bool)

(assert (=> d!156831 (=> res!1015258 e!835964)))

(assert (=> d!156831 (= res!1015258 (bvsge j!93 (size!48676 a!2862)))))

(assert (=> d!156831 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!835964)))

(declare-fun b!1492179 () Bool)

(declare-fun e!835962 () Bool)

(declare-fun call!67942 () Bool)

(assert (=> b!1492179 (= e!835962 call!67942)))

(declare-fun b!1492180 () Bool)

(declare-fun e!835963 () Bool)

(assert (=> b!1492180 (= e!835963 call!67942)))

(declare-fun b!1492181 () Bool)

(assert (=> b!1492181 (= e!835964 e!835963)))

(declare-fun c!137988 () Bool)

(assert (=> b!1492181 (= c!137988 (validKeyInArray!0 (select (arr!48126 a!2862) j!93)))))

(declare-fun b!1492182 () Bool)

(assert (=> b!1492182 (= e!835963 e!835962)))

(declare-fun lt!650522 () (_ BitVec 64))

(assert (=> b!1492182 (= lt!650522 (select (arr!48126 a!2862) j!93))))

(declare-fun lt!650523 () Unit!50072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99709 (_ BitVec 64) (_ BitVec 32)) Unit!50072)

(assert (=> b!1492182 (= lt!650523 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650522 j!93))))

(declare-fun arrayContainsKey!0 (array!99709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1492182 (arrayContainsKey!0 a!2862 lt!650522 #b00000000000000000000000000000000)))

(declare-fun lt!650521 () Unit!50072)

(assert (=> b!1492182 (= lt!650521 lt!650523)))

(declare-fun res!1015257 () Bool)

(assert (=> b!1492182 (= res!1015257 (= (seekEntryOrOpen!0 (select (arr!48126 a!2862) j!93) a!2862 mask!2687) (Found!12366 j!93)))))

(assert (=> b!1492182 (=> (not res!1015257) (not e!835962))))

(declare-fun bm!67939 () Bool)

(assert (=> bm!67939 (= call!67942 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156831 (not res!1015258)) b!1492181))

(assert (= (and b!1492181 c!137988) b!1492182))

(assert (= (and b!1492181 (not c!137988)) b!1492180))

(assert (= (and b!1492182 res!1015257) b!1492179))

(assert (= (or b!1492179 b!1492180) bm!67939))

(assert (=> b!1492181 m!1376193))

(assert (=> b!1492181 m!1376193))

(assert (=> b!1492181 m!1376195))

(assert (=> b!1492182 m!1376193))

(declare-fun m!1376295 () Bool)

(assert (=> b!1492182 m!1376295))

(declare-fun m!1376297 () Bool)

(assert (=> b!1492182 m!1376297))

(assert (=> b!1492182 m!1376193))

(assert (=> b!1492182 m!1376221))

(declare-fun m!1376299 () Bool)

(assert (=> bm!67939 m!1376299))

(assert (=> b!1492084 d!156831))

(declare-fun d!156833 () Bool)

(assert (=> d!156833 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650526 () Unit!50072)

(declare-fun choose!38 (array!99709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50072)

(assert (=> d!156833 (= lt!650526 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156833 (validMask!0 mask!2687)))

(assert (=> d!156833 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650526)))

(declare-fun bs!42860 () Bool)

(assert (= bs!42860 d!156833))

(assert (=> bs!42860 m!1376229))

(declare-fun m!1376301 () Bool)

(assert (=> bs!42860 m!1376301))

(assert (=> bs!42860 m!1376209))

(assert (=> b!1492084 d!156833))

(declare-fun d!156835 () Bool)

(declare-fun lt!650529 () (_ BitVec 32))

(assert (=> d!156835 (and (bvsge lt!650529 #b00000000000000000000000000000000) (bvslt lt!650529 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156835 (= lt!650529 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156835 (validMask!0 mask!2687)))

(assert (=> d!156835 (= (nextIndex!0 index!646 x!665 mask!2687) lt!650529)))

(declare-fun bs!42861 () Bool)

(assert (= bs!42861 d!156835))

(declare-fun m!1376303 () Bool)

(assert (=> bs!42861 m!1376303))

(assert (=> bs!42861 m!1376209))

(assert (=> b!1492095 d!156835))

(declare-fun d!156837 () Bool)

(declare-fun res!1015260 () Bool)

(declare-fun e!835967 () Bool)

(assert (=> d!156837 (=> res!1015260 e!835967)))

(assert (=> d!156837 (= res!1015260 (bvsge #b00000000000000000000000000000000 (size!48676 a!2862)))))

(assert (=> d!156837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!835967)))

(declare-fun b!1492183 () Bool)

(declare-fun e!835965 () Bool)

(declare-fun call!67943 () Bool)

(assert (=> b!1492183 (= e!835965 call!67943)))

(declare-fun b!1492184 () Bool)

(declare-fun e!835966 () Bool)

(assert (=> b!1492184 (= e!835966 call!67943)))

(declare-fun b!1492185 () Bool)

(assert (=> b!1492185 (= e!835967 e!835966)))

(declare-fun c!137989 () Bool)

(assert (=> b!1492185 (= c!137989 (validKeyInArray!0 (select (arr!48126 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492186 () Bool)

(assert (=> b!1492186 (= e!835966 e!835965)))

(declare-fun lt!650531 () (_ BitVec 64))

(assert (=> b!1492186 (= lt!650531 (select (arr!48126 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650532 () Unit!50072)

(assert (=> b!1492186 (= lt!650532 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650531 #b00000000000000000000000000000000))))

(assert (=> b!1492186 (arrayContainsKey!0 a!2862 lt!650531 #b00000000000000000000000000000000)))

(declare-fun lt!650530 () Unit!50072)

(assert (=> b!1492186 (= lt!650530 lt!650532)))

(declare-fun res!1015259 () Bool)

(assert (=> b!1492186 (= res!1015259 (= (seekEntryOrOpen!0 (select (arr!48126 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12366 #b00000000000000000000000000000000)))))

(assert (=> b!1492186 (=> (not res!1015259) (not e!835965))))

(declare-fun bm!67940 () Bool)

(assert (=> bm!67940 (= call!67943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156837 (not res!1015260)) b!1492185))

(assert (= (and b!1492185 c!137989) b!1492186))

(assert (= (and b!1492185 (not c!137989)) b!1492184))

(assert (= (and b!1492186 res!1015259) b!1492183))

(assert (= (or b!1492183 b!1492184) bm!67940))

(assert (=> b!1492185 m!1376287))

(assert (=> b!1492185 m!1376287))

(assert (=> b!1492185 m!1376289))

(assert (=> b!1492186 m!1376287))

(declare-fun m!1376305 () Bool)

(assert (=> b!1492186 m!1376305))

(declare-fun m!1376307 () Bool)

(assert (=> b!1492186 m!1376307))

(assert (=> b!1492186 m!1376287))

(declare-fun m!1376309 () Bool)

(assert (=> b!1492186 m!1376309))

(declare-fun m!1376311 () Bool)

(assert (=> bm!67940 m!1376311))

(assert (=> b!1492094 d!156837))

(declare-fun b!1492199 () Bool)

(declare-fun e!835974 () SeekEntryResult!12366)

(declare-fun e!835976 () SeekEntryResult!12366)

(assert (=> b!1492199 (= e!835974 e!835976)))

(declare-fun c!137997 () Bool)

(declare-fun lt!650538 () (_ BitVec 64))

(assert (=> b!1492199 (= c!137997 (= lt!650538 lt!650491))))

(declare-fun b!1492200 () Bool)

(declare-fun c!137998 () Bool)

(assert (=> b!1492200 (= c!137998 (= lt!650538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!835975 () SeekEntryResult!12366)

(assert (=> b!1492200 (= e!835976 e!835975)))

(declare-fun lt!650537 () SeekEntryResult!12366)

(declare-fun d!156839 () Bool)

(get-info :version)

(assert (=> d!156839 (and (or ((_ is Undefined!12366) lt!650537) (not ((_ is Found!12366) lt!650537)) (and (bvsge (index!51857 lt!650537) #b00000000000000000000000000000000) (bvslt (index!51857 lt!650537) (size!48676 lt!650493)))) (or ((_ is Undefined!12366) lt!650537) ((_ is Found!12366) lt!650537) (not ((_ is MissingVacant!12366) lt!650537)) (not (= (index!51859 lt!650537) intermediateAfterIndex!19)) (and (bvsge (index!51859 lt!650537) #b00000000000000000000000000000000) (bvslt (index!51859 lt!650537) (size!48676 lt!650493)))) (or ((_ is Undefined!12366) lt!650537) (ite ((_ is Found!12366) lt!650537) (= (select (arr!48126 lt!650493) (index!51857 lt!650537)) lt!650491) (and ((_ is MissingVacant!12366) lt!650537) (= (index!51859 lt!650537) intermediateAfterIndex!19) (= (select (arr!48126 lt!650493) (index!51859 lt!650537)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156839 (= lt!650537 e!835974)))

(declare-fun c!137996 () Bool)

(assert (=> d!156839 (= c!137996 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156839 (= lt!650538 (select (arr!48126 lt!650493) index!646))))

(assert (=> d!156839 (validMask!0 mask!2687)))

(assert (=> d!156839 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650491 lt!650493 mask!2687) lt!650537)))

(declare-fun b!1492201 () Bool)

(assert (=> b!1492201 (= e!835975 (MissingVacant!12366 intermediateAfterIndex!19))))

(declare-fun b!1492202 () Bool)

(assert (=> b!1492202 (= e!835976 (Found!12366 index!646))))

(declare-fun b!1492203 () Bool)

(assert (=> b!1492203 (= e!835975 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650491 lt!650493 mask!2687))))

(declare-fun b!1492204 () Bool)

(assert (=> b!1492204 (= e!835974 Undefined!12366)))

(assert (= (and d!156839 c!137996) b!1492204))

(assert (= (and d!156839 (not c!137996)) b!1492199))

(assert (= (and b!1492199 c!137997) b!1492202))

(assert (= (and b!1492199 (not c!137997)) b!1492200))

(assert (= (and b!1492200 c!137998) b!1492201))

(assert (= (and b!1492200 (not c!137998)) b!1492203))

(declare-fun m!1376313 () Bool)

(assert (=> d!156839 m!1376313))

(declare-fun m!1376315 () Bool)

(assert (=> d!156839 m!1376315))

(declare-fun m!1376317 () Bool)

(assert (=> d!156839 m!1376317))

(assert (=> d!156839 m!1376209))

(assert (=> b!1492203 m!1376191))

(assert (=> b!1492203 m!1376191))

(declare-fun m!1376319 () Bool)

(assert (=> b!1492203 m!1376319))

(assert (=> b!1492096 d!156839))

(declare-fun b!1492235 () Bool)

(declare-fun e!835993 () SeekEntryResult!12366)

(declare-fun lt!650550 () SeekEntryResult!12366)

(assert (=> b!1492235 (= e!835993 (MissingZero!12366 (index!51858 lt!650550)))))

(declare-fun b!1492236 () Bool)

(declare-fun e!835995 () SeekEntryResult!12366)

(assert (=> b!1492236 (= e!835995 (Found!12366 (index!51858 lt!650550)))))

(declare-fun b!1492237 () Bool)

(assert (=> b!1492237 (= e!835993 (seekKeyOrZeroReturnVacant!0 (x!133438 lt!650550) (index!51858 lt!650550) (index!51858 lt!650550) lt!650491 lt!650493 mask!2687))))

(declare-fun b!1492238 () Bool)

(declare-fun c!138011 () Bool)

(declare-fun lt!650551 () (_ BitVec 64))

(assert (=> b!1492238 (= c!138011 (= lt!650551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492238 (= e!835995 e!835993)))

(declare-fun b!1492239 () Bool)

(declare-fun e!835994 () SeekEntryResult!12366)

(assert (=> b!1492239 (= e!835994 Undefined!12366)))

(declare-fun d!156841 () Bool)

(declare-fun lt!650549 () SeekEntryResult!12366)

(assert (=> d!156841 (and (or ((_ is Undefined!12366) lt!650549) (not ((_ is Found!12366) lt!650549)) (and (bvsge (index!51857 lt!650549) #b00000000000000000000000000000000) (bvslt (index!51857 lt!650549) (size!48676 lt!650493)))) (or ((_ is Undefined!12366) lt!650549) ((_ is Found!12366) lt!650549) (not ((_ is MissingZero!12366) lt!650549)) (and (bvsge (index!51856 lt!650549) #b00000000000000000000000000000000) (bvslt (index!51856 lt!650549) (size!48676 lt!650493)))) (or ((_ is Undefined!12366) lt!650549) ((_ is Found!12366) lt!650549) ((_ is MissingZero!12366) lt!650549) (not ((_ is MissingVacant!12366) lt!650549)) (and (bvsge (index!51859 lt!650549) #b00000000000000000000000000000000) (bvslt (index!51859 lt!650549) (size!48676 lt!650493)))) (or ((_ is Undefined!12366) lt!650549) (ite ((_ is Found!12366) lt!650549) (= (select (arr!48126 lt!650493) (index!51857 lt!650549)) lt!650491) (ite ((_ is MissingZero!12366) lt!650549) (= (select (arr!48126 lt!650493) (index!51856 lt!650549)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12366) lt!650549) (= (select (arr!48126 lt!650493) (index!51859 lt!650549)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156841 (= lt!650549 e!835994)))

(declare-fun c!138012 () Bool)

(assert (=> d!156841 (= c!138012 (and ((_ is Intermediate!12366) lt!650550) (undefined!13178 lt!650550)))))

(assert (=> d!156841 (= lt!650550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650491 mask!2687) lt!650491 lt!650493 mask!2687))))

(assert (=> d!156841 (validMask!0 mask!2687)))

(assert (=> d!156841 (= (seekEntryOrOpen!0 lt!650491 lt!650493 mask!2687) lt!650549)))

(declare-fun b!1492240 () Bool)

(assert (=> b!1492240 (= e!835994 e!835995)))

(assert (=> b!1492240 (= lt!650551 (select (arr!48126 lt!650493) (index!51858 lt!650550)))))

(declare-fun c!138013 () Bool)

(assert (=> b!1492240 (= c!138013 (= lt!650551 lt!650491))))

(assert (= (and d!156841 c!138012) b!1492239))

(assert (= (and d!156841 (not c!138012)) b!1492240))

(assert (= (and b!1492240 c!138013) b!1492236))

(assert (= (and b!1492240 (not c!138013)) b!1492238))

(assert (= (and b!1492238 c!138011) b!1492235))

(assert (= (and b!1492238 (not c!138011)) b!1492237))

(declare-fun m!1376321 () Bool)

(assert (=> b!1492237 m!1376321))

(assert (=> d!156841 m!1376203))

(declare-fun m!1376323 () Bool)

(assert (=> d!156841 m!1376323))

(assert (=> d!156841 m!1376203))

(assert (=> d!156841 m!1376205))

(declare-fun m!1376325 () Bool)

(assert (=> d!156841 m!1376325))

(assert (=> d!156841 m!1376209))

(declare-fun m!1376327 () Bool)

(assert (=> d!156841 m!1376327))

(declare-fun m!1376329 () Bool)

(assert (=> b!1492240 m!1376329))

(assert (=> b!1492096 d!156841))

(declare-fun b!1492322 () Bool)

(declare-fun e!836044 () Bool)

(declare-fun lt!650579 () SeekEntryResult!12366)

(assert (=> b!1492322 (= e!836044 (bvsge (x!133438 lt!650579) #b01111111111111111111111111111110))))

(declare-fun b!1492324 () Bool)

(assert (=> b!1492324 (and (bvsge (index!51858 lt!650579) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650579) (size!48676 a!2862)))))

(declare-fun e!836041 () Bool)

(assert (=> b!1492324 (= e!836041 (= (select (arr!48126 a!2862) (index!51858 lt!650579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492325 () Bool)

(declare-fun e!836043 () SeekEntryResult!12366)

(assert (=> b!1492325 (= e!836043 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48126 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492326 () Bool)

(declare-fun e!836042 () SeekEntryResult!12366)

(assert (=> b!1492326 (= e!836042 e!836043)))

(declare-fun c!138044 () Bool)

(declare-fun lt!650580 () (_ BitVec 64))

(assert (=> b!1492326 (= c!138044 (or (= lt!650580 (select (arr!48126 a!2862) j!93)) (= (bvadd lt!650580 lt!650580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492327 () Bool)

(assert (=> b!1492327 (= e!836042 (Intermediate!12366 true index!646 x!665))))

(declare-fun b!1492328 () Bool)

(assert (=> b!1492328 (and (bvsge (index!51858 lt!650579) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650579) (size!48676 a!2862)))))

(declare-fun res!1015291 () Bool)

(assert (=> b!1492328 (= res!1015291 (= (select (arr!48126 a!2862) (index!51858 lt!650579)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492328 (=> res!1015291 e!836041)))

(declare-fun b!1492329 () Bool)

(declare-fun e!836040 () Bool)

(assert (=> b!1492329 (= e!836044 e!836040)))

(declare-fun res!1015289 () Bool)

(assert (=> b!1492329 (= res!1015289 (and ((_ is Intermediate!12366) lt!650579) (not (undefined!13178 lt!650579)) (bvslt (x!133438 lt!650579) #b01111111111111111111111111111110) (bvsge (x!133438 lt!650579) #b00000000000000000000000000000000) (bvsge (x!133438 lt!650579) x!665)))))

(assert (=> b!1492329 (=> (not res!1015289) (not e!836040))))

(declare-fun b!1492330 () Bool)

(assert (=> b!1492330 (= e!836043 (Intermediate!12366 false index!646 x!665))))

(declare-fun d!156853 () Bool)

(assert (=> d!156853 e!836044))

(declare-fun c!138045 () Bool)

(assert (=> d!156853 (= c!138045 (and ((_ is Intermediate!12366) lt!650579) (undefined!13178 lt!650579)))))

(assert (=> d!156853 (= lt!650579 e!836042)))

(declare-fun c!138046 () Bool)

(assert (=> d!156853 (= c!138046 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156853 (= lt!650580 (select (arr!48126 a!2862) index!646))))

(assert (=> d!156853 (validMask!0 mask!2687)))

(assert (=> d!156853 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48126 a!2862) j!93) a!2862 mask!2687) lt!650579)))

(declare-fun b!1492323 () Bool)

(assert (=> b!1492323 (and (bvsge (index!51858 lt!650579) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650579) (size!48676 a!2862)))))

(declare-fun res!1015290 () Bool)

(assert (=> b!1492323 (= res!1015290 (= (select (arr!48126 a!2862) (index!51858 lt!650579)) (select (arr!48126 a!2862) j!93)))))

(assert (=> b!1492323 (=> res!1015290 e!836041)))

(assert (=> b!1492323 (= e!836040 e!836041)))

(assert (= (and d!156853 c!138046) b!1492327))

(assert (= (and d!156853 (not c!138046)) b!1492326))

(assert (= (and b!1492326 c!138044) b!1492330))

(assert (= (and b!1492326 (not c!138044)) b!1492325))

(assert (= (and d!156853 c!138045) b!1492322))

(assert (= (and d!156853 (not c!138045)) b!1492329))

(assert (= (and b!1492329 res!1015289) b!1492323))

(assert (= (and b!1492323 (not res!1015290)) b!1492328))

(assert (= (and b!1492328 (not res!1015291)) b!1492324))

(assert (=> d!156853 m!1376227))

(assert (=> d!156853 m!1376209))

(declare-fun m!1376359 () Bool)

(assert (=> b!1492323 m!1376359))

(assert (=> b!1492328 m!1376359))

(assert (=> b!1492325 m!1376191))

(assert (=> b!1492325 m!1376191))

(assert (=> b!1492325 m!1376193))

(declare-fun m!1376361 () Bool)

(assert (=> b!1492325 m!1376361))

(assert (=> b!1492324 m!1376359))

(assert (=> b!1492086 d!156853))

(declare-fun b!1492331 () Bool)

(declare-fun e!836045 () SeekEntryResult!12366)

(declare-fun lt!650584 () SeekEntryResult!12366)

(assert (=> b!1492331 (= e!836045 (MissingZero!12366 (index!51858 lt!650584)))))

(declare-fun b!1492332 () Bool)

(declare-fun e!836047 () SeekEntryResult!12366)

(assert (=> b!1492332 (= e!836047 (Found!12366 (index!51858 lt!650584)))))

(declare-fun b!1492333 () Bool)

(assert (=> b!1492333 (= e!836045 (seekKeyOrZeroReturnVacant!0 (x!133438 lt!650584) (index!51858 lt!650584) (index!51858 lt!650584) (select (arr!48126 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492334 () Bool)

(declare-fun c!138047 () Bool)

(declare-fun lt!650585 () (_ BitVec 64))

(assert (=> b!1492334 (= c!138047 (= lt!650585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492334 (= e!836047 e!836045)))

(declare-fun b!1492335 () Bool)

(declare-fun e!836046 () SeekEntryResult!12366)

(assert (=> b!1492335 (= e!836046 Undefined!12366)))

(declare-fun d!156869 () Bool)

(declare-fun lt!650583 () SeekEntryResult!12366)

(assert (=> d!156869 (and (or ((_ is Undefined!12366) lt!650583) (not ((_ is Found!12366) lt!650583)) (and (bvsge (index!51857 lt!650583) #b00000000000000000000000000000000) (bvslt (index!51857 lt!650583) (size!48676 a!2862)))) (or ((_ is Undefined!12366) lt!650583) ((_ is Found!12366) lt!650583) (not ((_ is MissingZero!12366) lt!650583)) (and (bvsge (index!51856 lt!650583) #b00000000000000000000000000000000) (bvslt (index!51856 lt!650583) (size!48676 a!2862)))) (or ((_ is Undefined!12366) lt!650583) ((_ is Found!12366) lt!650583) ((_ is MissingZero!12366) lt!650583) (not ((_ is MissingVacant!12366) lt!650583)) (and (bvsge (index!51859 lt!650583) #b00000000000000000000000000000000) (bvslt (index!51859 lt!650583) (size!48676 a!2862)))) (or ((_ is Undefined!12366) lt!650583) (ite ((_ is Found!12366) lt!650583) (= (select (arr!48126 a!2862) (index!51857 lt!650583)) (select (arr!48126 a!2862) j!93)) (ite ((_ is MissingZero!12366) lt!650583) (= (select (arr!48126 a!2862) (index!51856 lt!650583)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12366) lt!650583) (= (select (arr!48126 a!2862) (index!51859 lt!650583)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156869 (= lt!650583 e!836046)))

(declare-fun c!138048 () Bool)

(assert (=> d!156869 (= c!138048 (and ((_ is Intermediate!12366) lt!650584) (undefined!13178 lt!650584)))))

(assert (=> d!156869 (= lt!650584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687) (select (arr!48126 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156869 (validMask!0 mask!2687)))

(assert (=> d!156869 (= (seekEntryOrOpen!0 (select (arr!48126 a!2862) j!93) a!2862 mask!2687) lt!650583)))

(declare-fun b!1492336 () Bool)

(assert (=> b!1492336 (= e!836046 e!836047)))

(assert (=> b!1492336 (= lt!650585 (select (arr!48126 a!2862) (index!51858 lt!650584)))))

(declare-fun c!138049 () Bool)

(assert (=> b!1492336 (= c!138049 (= lt!650585 (select (arr!48126 a!2862) j!93)))))

(assert (= (and d!156869 c!138048) b!1492335))

(assert (= (and d!156869 (not c!138048)) b!1492336))

(assert (= (and b!1492336 c!138049) b!1492332))

(assert (= (and b!1492336 (not c!138049)) b!1492334))

(assert (= (and b!1492334 c!138047) b!1492331))

(assert (= (and b!1492334 (not c!138047)) b!1492333))

(assert (=> b!1492333 m!1376193))

(declare-fun m!1376363 () Bool)

(assert (=> b!1492333 m!1376363))

(assert (=> d!156869 m!1376193))

(assert (=> d!156869 m!1376199))

(declare-fun m!1376365 () Bool)

(assert (=> d!156869 m!1376365))

(assert (=> d!156869 m!1376199))

(assert (=> d!156869 m!1376193))

(assert (=> d!156869 m!1376201))

(declare-fun m!1376367 () Bool)

(assert (=> d!156869 m!1376367))

(assert (=> d!156869 m!1376209))

(declare-fun m!1376369 () Bool)

(assert (=> d!156869 m!1376369))

(declare-fun m!1376371 () Bool)

(assert (=> b!1492336 m!1376371))

(assert (=> b!1492088 d!156869))

(declare-fun d!156871 () Bool)

(assert (=> d!156871 (= (validKeyInArray!0 (select (arr!48126 a!2862) j!93)) (and (not (= (select (arr!48126 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48126 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492098 d!156871))

(declare-fun b!1492337 () Bool)

(declare-fun e!836052 () Bool)

(declare-fun lt!650586 () SeekEntryResult!12366)

(assert (=> b!1492337 (= e!836052 (bvsge (x!133438 lt!650586) #b01111111111111111111111111111110))))

(declare-fun b!1492339 () Bool)

(assert (=> b!1492339 (and (bvsge (index!51858 lt!650586) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650586) (size!48676 lt!650493)))))

(declare-fun e!836049 () Bool)

(assert (=> b!1492339 (= e!836049 (= (select (arr!48126 lt!650493) (index!51858 lt!650586)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836051 () SeekEntryResult!12366)

(declare-fun b!1492340 () Bool)

(assert (=> b!1492340 (= e!836051 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650491 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650491 lt!650493 mask!2687))))

(declare-fun b!1492341 () Bool)

(declare-fun e!836050 () SeekEntryResult!12366)

(assert (=> b!1492341 (= e!836050 e!836051)))

(declare-fun c!138050 () Bool)

(declare-fun lt!650587 () (_ BitVec 64))

(assert (=> b!1492341 (= c!138050 (or (= lt!650587 lt!650491) (= (bvadd lt!650587 lt!650587) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492342 () Bool)

(assert (=> b!1492342 (= e!836050 (Intermediate!12366 true (toIndex!0 lt!650491 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492343 () Bool)

(assert (=> b!1492343 (and (bvsge (index!51858 lt!650586) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650586) (size!48676 lt!650493)))))

(declare-fun res!1015294 () Bool)

(assert (=> b!1492343 (= res!1015294 (= (select (arr!48126 lt!650493) (index!51858 lt!650586)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492343 (=> res!1015294 e!836049)))

(declare-fun b!1492344 () Bool)

(declare-fun e!836048 () Bool)

(assert (=> b!1492344 (= e!836052 e!836048)))

(declare-fun res!1015292 () Bool)

(assert (=> b!1492344 (= res!1015292 (and ((_ is Intermediate!12366) lt!650586) (not (undefined!13178 lt!650586)) (bvslt (x!133438 lt!650586) #b01111111111111111111111111111110) (bvsge (x!133438 lt!650586) #b00000000000000000000000000000000) (bvsge (x!133438 lt!650586) #b00000000000000000000000000000000)))))

(assert (=> b!1492344 (=> (not res!1015292) (not e!836048))))

(declare-fun b!1492345 () Bool)

(assert (=> b!1492345 (= e!836051 (Intermediate!12366 false (toIndex!0 lt!650491 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156873 () Bool)

(assert (=> d!156873 e!836052))

(declare-fun c!138051 () Bool)

(assert (=> d!156873 (= c!138051 (and ((_ is Intermediate!12366) lt!650586) (undefined!13178 lt!650586)))))

(assert (=> d!156873 (= lt!650586 e!836050)))

(declare-fun c!138052 () Bool)

(assert (=> d!156873 (= c!138052 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156873 (= lt!650587 (select (arr!48126 lt!650493) (toIndex!0 lt!650491 mask!2687)))))

(assert (=> d!156873 (validMask!0 mask!2687)))

(assert (=> d!156873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650491 mask!2687) lt!650491 lt!650493 mask!2687) lt!650586)))

(declare-fun b!1492338 () Bool)

(assert (=> b!1492338 (and (bvsge (index!51858 lt!650586) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650586) (size!48676 lt!650493)))))

(declare-fun res!1015293 () Bool)

(assert (=> b!1492338 (= res!1015293 (= (select (arr!48126 lt!650493) (index!51858 lt!650586)) lt!650491))))

(assert (=> b!1492338 (=> res!1015293 e!836049)))

(assert (=> b!1492338 (= e!836048 e!836049)))

(assert (= (and d!156873 c!138052) b!1492342))

(assert (= (and d!156873 (not c!138052)) b!1492341))

(assert (= (and b!1492341 c!138050) b!1492345))

(assert (= (and b!1492341 (not c!138050)) b!1492340))

(assert (= (and d!156873 c!138051) b!1492337))

(assert (= (and d!156873 (not c!138051)) b!1492344))

(assert (= (and b!1492344 res!1015292) b!1492338))

(assert (= (and b!1492338 (not res!1015293)) b!1492343))

(assert (= (and b!1492343 (not res!1015294)) b!1492339))

(assert (=> d!156873 m!1376203))

(declare-fun m!1376373 () Bool)

(assert (=> d!156873 m!1376373))

(assert (=> d!156873 m!1376209))

(declare-fun m!1376375 () Bool)

(assert (=> b!1492338 m!1376375))

(assert (=> b!1492343 m!1376375))

(assert (=> b!1492340 m!1376203))

(declare-fun m!1376377 () Bool)

(assert (=> b!1492340 m!1376377))

(assert (=> b!1492340 m!1376377))

(declare-fun m!1376379 () Bool)

(assert (=> b!1492340 m!1376379))

(assert (=> b!1492339 m!1376375))

(assert (=> b!1492100 d!156873))

(declare-fun d!156875 () Bool)

(declare-fun lt!650599 () (_ BitVec 32))

(declare-fun lt!650598 () (_ BitVec 32))

(assert (=> d!156875 (= lt!650599 (bvmul (bvxor lt!650598 (bvlshr lt!650598 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156875 (= lt!650598 ((_ extract 31 0) (bvand (bvxor lt!650491 (bvlshr lt!650491 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156875 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015295 (let ((h!36009 ((_ extract 31 0) (bvand (bvxor lt!650491 (bvlshr lt!650491 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133448 (bvmul (bvxor h!36009 (bvlshr h!36009 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133448 (bvlshr x!133448 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015295 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015295 #b00000000000000000000000000000000))))))

(assert (=> d!156875 (= (toIndex!0 lt!650491 mask!2687) (bvand (bvxor lt!650599 (bvlshr lt!650599 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492100 d!156875))

(declare-fun b!1492354 () Bool)

(declare-fun e!836063 () Bool)

(declare-fun lt!650600 () SeekEntryResult!12366)

(assert (=> b!1492354 (= e!836063 (bvsge (x!133438 lt!650600) #b01111111111111111111111111111110))))

(declare-fun b!1492356 () Bool)

(assert (=> b!1492356 (and (bvsge (index!51858 lt!650600) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650600) (size!48676 lt!650493)))))

(declare-fun e!836060 () Bool)

(assert (=> b!1492356 (= e!836060 (= (select (arr!48126 lt!650493) (index!51858 lt!650600)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836062 () SeekEntryResult!12366)

(declare-fun b!1492357 () Bool)

(assert (=> b!1492357 (= e!836062 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650491 lt!650493 mask!2687))))

(declare-fun b!1492358 () Bool)

(declare-fun e!836061 () SeekEntryResult!12366)

(assert (=> b!1492358 (= e!836061 e!836062)))

(declare-fun c!138055 () Bool)

(declare-fun lt!650601 () (_ BitVec 64))

(assert (=> b!1492358 (= c!138055 (or (= lt!650601 lt!650491) (= (bvadd lt!650601 lt!650601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492359 () Bool)

(assert (=> b!1492359 (= e!836061 (Intermediate!12366 true index!646 x!665))))

(declare-fun b!1492360 () Bool)

(assert (=> b!1492360 (and (bvsge (index!51858 lt!650600) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650600) (size!48676 lt!650493)))))

(declare-fun res!1015302 () Bool)

(assert (=> b!1492360 (= res!1015302 (= (select (arr!48126 lt!650493) (index!51858 lt!650600)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492360 (=> res!1015302 e!836060)))

(declare-fun b!1492361 () Bool)

(declare-fun e!836059 () Bool)

(assert (=> b!1492361 (= e!836063 e!836059)))

(declare-fun res!1015300 () Bool)

(assert (=> b!1492361 (= res!1015300 (and ((_ is Intermediate!12366) lt!650600) (not (undefined!13178 lt!650600)) (bvslt (x!133438 lt!650600) #b01111111111111111111111111111110) (bvsge (x!133438 lt!650600) #b00000000000000000000000000000000) (bvsge (x!133438 lt!650600) x!665)))))

(assert (=> b!1492361 (=> (not res!1015300) (not e!836059))))

(declare-fun b!1492362 () Bool)

(assert (=> b!1492362 (= e!836062 (Intermediate!12366 false index!646 x!665))))

(declare-fun d!156877 () Bool)

(assert (=> d!156877 e!836063))

(declare-fun c!138056 () Bool)

(assert (=> d!156877 (= c!138056 (and ((_ is Intermediate!12366) lt!650600) (undefined!13178 lt!650600)))))

(assert (=> d!156877 (= lt!650600 e!836061)))

(declare-fun c!138057 () Bool)

(assert (=> d!156877 (= c!138057 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156877 (= lt!650601 (select (arr!48126 lt!650493) index!646))))

(assert (=> d!156877 (validMask!0 mask!2687)))

(assert (=> d!156877 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650491 lt!650493 mask!2687) lt!650600)))

(declare-fun b!1492355 () Bool)

(assert (=> b!1492355 (and (bvsge (index!51858 lt!650600) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650600) (size!48676 lt!650493)))))

(declare-fun res!1015301 () Bool)

(assert (=> b!1492355 (= res!1015301 (= (select (arr!48126 lt!650493) (index!51858 lt!650600)) lt!650491))))

(assert (=> b!1492355 (=> res!1015301 e!836060)))

(assert (=> b!1492355 (= e!836059 e!836060)))

(assert (= (and d!156877 c!138057) b!1492359))

(assert (= (and d!156877 (not c!138057)) b!1492358))

(assert (= (and b!1492358 c!138055) b!1492362))

(assert (= (and b!1492358 (not c!138055)) b!1492357))

(assert (= (and d!156877 c!138056) b!1492354))

(assert (= (and d!156877 (not c!138056)) b!1492361))

(assert (= (and b!1492361 res!1015300) b!1492355))

(assert (= (and b!1492355 (not res!1015301)) b!1492360))

(assert (= (and b!1492360 (not res!1015302)) b!1492356))

(assert (=> d!156877 m!1376317))

(assert (=> d!156877 m!1376209))

(declare-fun m!1376381 () Bool)

(assert (=> b!1492355 m!1376381))

(assert (=> b!1492360 m!1376381))

(assert (=> b!1492357 m!1376191))

(assert (=> b!1492357 m!1376191))

(declare-fun m!1376383 () Bool)

(assert (=> b!1492357 m!1376383))

(assert (=> b!1492356 m!1376381))

(assert (=> b!1492091 d!156877))

(declare-fun b!1492367 () Bool)

(declare-fun e!836071 () Bool)

(declare-fun lt!650605 () SeekEntryResult!12366)

(assert (=> b!1492367 (= e!836071 (bvsge (x!133438 lt!650605) #b01111111111111111111111111111110))))

(declare-fun b!1492369 () Bool)

(assert (=> b!1492369 (and (bvsge (index!51858 lt!650605) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650605) (size!48676 a!2862)))))

(declare-fun e!836068 () Bool)

(assert (=> b!1492369 (= e!836068 (= (select (arr!48126 a!2862) (index!51858 lt!650605)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492370 () Bool)

(declare-fun e!836070 () SeekEntryResult!12366)

(assert (=> b!1492370 (= e!836070 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48126 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492371 () Bool)

(declare-fun e!836069 () SeekEntryResult!12366)

(assert (=> b!1492371 (= e!836069 e!836070)))

(declare-fun c!138059 () Bool)

(declare-fun lt!650606 () (_ BitVec 64))

(assert (=> b!1492371 (= c!138059 (or (= lt!650606 (select (arr!48126 a!2862) j!93)) (= (bvadd lt!650606 lt!650606) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492372 () Bool)

(assert (=> b!1492372 (= e!836069 (Intermediate!12366 true (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492373 () Bool)

(assert (=> b!1492373 (and (bvsge (index!51858 lt!650605) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650605) (size!48676 a!2862)))))

(declare-fun res!1015307 () Bool)

(assert (=> b!1492373 (= res!1015307 (= (select (arr!48126 a!2862) (index!51858 lt!650605)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492373 (=> res!1015307 e!836068)))

(declare-fun b!1492374 () Bool)

(declare-fun e!836067 () Bool)

(assert (=> b!1492374 (= e!836071 e!836067)))

(declare-fun res!1015305 () Bool)

(assert (=> b!1492374 (= res!1015305 (and ((_ is Intermediate!12366) lt!650605) (not (undefined!13178 lt!650605)) (bvslt (x!133438 lt!650605) #b01111111111111111111111111111110) (bvsge (x!133438 lt!650605) #b00000000000000000000000000000000) (bvsge (x!133438 lt!650605) #b00000000000000000000000000000000)))))

(assert (=> b!1492374 (=> (not res!1015305) (not e!836067))))

(declare-fun b!1492375 () Bool)

(assert (=> b!1492375 (= e!836070 (Intermediate!12366 false (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156879 () Bool)

(assert (=> d!156879 e!836071))

(declare-fun c!138060 () Bool)

(assert (=> d!156879 (= c!138060 (and ((_ is Intermediate!12366) lt!650605) (undefined!13178 lt!650605)))))

(assert (=> d!156879 (= lt!650605 e!836069)))

(declare-fun c!138061 () Bool)

(assert (=> d!156879 (= c!138061 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156879 (= lt!650606 (select (arr!48126 a!2862) (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687)))))

(assert (=> d!156879 (validMask!0 mask!2687)))

(assert (=> d!156879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687) (select (arr!48126 a!2862) j!93) a!2862 mask!2687) lt!650605)))

(declare-fun b!1492368 () Bool)

(assert (=> b!1492368 (and (bvsge (index!51858 lt!650605) #b00000000000000000000000000000000) (bvslt (index!51858 lt!650605) (size!48676 a!2862)))))

(declare-fun res!1015306 () Bool)

(assert (=> b!1492368 (= res!1015306 (= (select (arr!48126 a!2862) (index!51858 lt!650605)) (select (arr!48126 a!2862) j!93)))))

(assert (=> b!1492368 (=> res!1015306 e!836068)))

(assert (=> b!1492368 (= e!836067 e!836068)))

(assert (= (and d!156879 c!138061) b!1492372))

(assert (= (and d!156879 (not c!138061)) b!1492371))

(assert (= (and b!1492371 c!138059) b!1492375))

(assert (= (and b!1492371 (not c!138059)) b!1492370))

(assert (= (and d!156879 c!138060) b!1492367))

(assert (= (and d!156879 (not c!138060)) b!1492374))

(assert (= (and b!1492374 res!1015305) b!1492368))

(assert (= (and b!1492368 (not res!1015306)) b!1492373))

(assert (= (and b!1492373 (not res!1015307)) b!1492369))

(assert (=> d!156879 m!1376199))

(declare-fun m!1376397 () Bool)

(assert (=> d!156879 m!1376397))

(assert (=> d!156879 m!1376209))

(declare-fun m!1376399 () Bool)

(assert (=> b!1492368 m!1376399))

(assert (=> b!1492373 m!1376399))

(assert (=> b!1492370 m!1376199))

(declare-fun m!1376401 () Bool)

(assert (=> b!1492370 m!1376401))

(assert (=> b!1492370 m!1376401))

(assert (=> b!1492370 m!1376193))

(declare-fun m!1376403 () Bool)

(assert (=> b!1492370 m!1376403))

(assert (=> b!1492369 m!1376399))

(assert (=> b!1492090 d!156879))

(declare-fun d!156883 () Bool)

(declare-fun lt!650608 () (_ BitVec 32))

(declare-fun lt!650607 () (_ BitVec 32))

(assert (=> d!156883 (= lt!650608 (bvmul (bvxor lt!650607 (bvlshr lt!650607 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156883 (= lt!650607 ((_ extract 31 0) (bvand (bvxor (select (arr!48126 a!2862) j!93) (bvlshr (select (arr!48126 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156883 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015295 (let ((h!36009 ((_ extract 31 0) (bvand (bvxor (select (arr!48126 a!2862) j!93) (bvlshr (select (arr!48126 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133448 (bvmul (bvxor h!36009 (bvlshr h!36009 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133448 (bvlshr x!133448 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015295 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015295 #b00000000000000000000000000000000))))))

(assert (=> d!156883 (= (toIndex!0 (select (arr!48126 a!2862) j!93) mask!2687) (bvand (bvxor lt!650608 (bvlshr lt!650608 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492090 d!156883))

(declare-fun d!156885 () Bool)

(assert (=> d!156885 (= (validKeyInArray!0 (select (arr!48126 a!2862) i!1006)) (and (not (= (select (arr!48126 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48126 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492092 d!156885))

(check-sat (not d!156841) (not b!1492182) (not b!1492185) (not b!1492357) (not b!1492181) (not b!1492203) (not d!156853) (not d!156835) (not d!156879) (not d!156873) (not d!156833) (not b!1492237) (not b!1492169) (not b!1492333) (not d!156869) (not bm!67936) (not b!1492370) (not b!1492186) (not d!156839) (not bm!67939) (not b!1492340) (not bm!67940) (not d!156877) (not b!1492325) (not b!1492168) (not b!1492166))
(check-sat)
