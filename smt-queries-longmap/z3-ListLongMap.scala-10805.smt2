; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126696 () Bool)

(assert start!126696)

(declare-fun b!1484195 () Bool)

(declare-fun res!1008304 () Bool)

(declare-fun e!832371 () Bool)

(assert (=> b!1484195 (=> (not res!1008304) (not e!832371))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99553 0))(
  ( (array!99554 (arr!48049 (Array (_ BitVec 32) (_ BitVec 64))) (size!48600 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99553)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1484195 (= res!1008304 (and (= (size!48600 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48600 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48600 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647722 () array!99553)

(declare-fun e!832370 () Bool)

(declare-fun lt!647724 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1484196 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12186 0))(
  ( (MissingZero!12186 (index!51136 (_ BitVec 32))) (Found!12186 (index!51137 (_ BitVec 32))) (Intermediate!12186 (undefined!12998 Bool) (index!51138 (_ BitVec 32)) (x!132902 (_ BitVec 32))) (Undefined!12186) (MissingVacant!12186 (index!51139 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12186)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12186)

(assert (=> b!1484196 (= e!832370 (= (seekEntryOrOpen!0 lt!647724 lt!647722 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647724 lt!647722 mask!2687)))))

(declare-fun b!1484197 () Bool)

(declare-fun res!1008314 () Bool)

(declare-fun e!832376 () Bool)

(assert (=> b!1484197 (=> (not res!1008314) (not e!832376))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484197 (= res!1008314 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484198 () Bool)

(declare-fun e!832374 () Bool)

(assert (=> b!1484198 (= e!832371 e!832374)))

(declare-fun res!1008312 () Bool)

(assert (=> b!1484198 (=> (not res!1008312) (not e!832374))))

(assert (=> b!1484198 (= res!1008312 (= (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484198 (= lt!647722 (array!99554 (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48600 a!2862)))))

(declare-fun b!1484199 () Bool)

(declare-fun res!1008310 () Bool)

(assert (=> b!1484199 (=> (not res!1008310) (not e!832371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484199 (= res!1008310 (validKeyInArray!0 (select (arr!48049 a!2862) j!93)))))

(declare-fun b!1484200 () Bool)

(declare-fun e!832373 () Bool)

(assert (=> b!1484200 (= e!832374 e!832373)))

(declare-fun res!1008301 () Bool)

(assert (=> b!1484200 (=> (not res!1008301) (not e!832373))))

(declare-fun lt!647725 () SeekEntryResult!12186)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484200 (= res!1008301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!647725))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1484200 (= lt!647725 (Intermediate!12186 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484201 () Bool)

(assert (=> b!1484201 (= e!832376 (not e!832370))))

(declare-fun res!1008303 () Bool)

(assert (=> b!1484201 (=> res!1008303 e!832370)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484201 (= res!1008303 (or (and (= (select (arr!48049 a!2862) index!646) (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48049 a!2862) index!646) (select (arr!48049 a!2862) j!93))) (= (select (arr!48049 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832372 () Bool)

(assert (=> b!1484201 e!832372))

(declare-fun res!1008309 () Bool)

(assert (=> b!1484201 (=> (not res!1008309) (not e!832372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99553 (_ BitVec 32)) Bool)

(assert (=> b!1484201 (= res!1008309 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49745 0))(
  ( (Unit!49746) )
))
(declare-fun lt!647721 () Unit!49745)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49745)

(assert (=> b!1484201 (= lt!647721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484202 () Bool)

(declare-fun res!1008313 () Bool)

(assert (=> b!1484202 (=> (not res!1008313) (not e!832371))))

(declare-datatypes ((List!34537 0))(
  ( (Nil!34534) (Cons!34533 (h!35918 (_ BitVec 64)) (t!49223 List!34537)) )
))
(declare-fun arrayNoDuplicates!0 (array!99553 (_ BitVec 32) List!34537) Bool)

(assert (=> b!1484202 (= res!1008313 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34534))))

(declare-fun b!1484203 () Bool)

(declare-fun lt!647723 () SeekEntryResult!12186)

(declare-fun e!832375 () Bool)

(assert (=> b!1484203 (= e!832375 (= lt!647723 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647724 lt!647722 mask!2687)))))

(declare-fun res!1008311 () Bool)

(assert (=> start!126696 (=> (not res!1008311) (not e!832371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126696 (= res!1008311 (validMask!0 mask!2687))))

(assert (=> start!126696 e!832371))

(assert (=> start!126696 true))

(declare-fun array_inv!37330 (array!99553) Bool)

(assert (=> start!126696 (array_inv!37330 a!2862)))

(declare-fun b!1484204 () Bool)

(declare-fun res!1008300 () Bool)

(assert (=> b!1484204 (=> (not res!1008300) (not e!832371))))

(assert (=> b!1484204 (= res!1008300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484205 () Bool)

(declare-fun res!1008308 () Bool)

(assert (=> b!1484205 (=> (not res!1008308) (not e!832371))))

(assert (=> b!1484205 (= res!1008308 (validKeyInArray!0 (select (arr!48049 a!2862) i!1006)))))

(declare-fun b!1484206 () Bool)

(declare-fun res!1008306 () Bool)

(assert (=> b!1484206 (=> (not res!1008306) (not e!832371))))

(assert (=> b!1484206 (= res!1008306 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48600 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48600 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48600 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484207 () Bool)

(assert (=> b!1484207 (= e!832373 e!832376)))

(declare-fun res!1008299 () Bool)

(assert (=> b!1484207 (=> (not res!1008299) (not e!832376))))

(assert (=> b!1484207 (= res!1008299 (= lt!647723 (Intermediate!12186 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484207 (= lt!647723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647724 mask!2687) lt!647724 lt!647722 mask!2687))))

(assert (=> b!1484207 (= lt!647724 (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484208 () Bool)

(assert (=> b!1484208 (= e!832372 (and (or (= (select (arr!48049 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48049 a!2862) intermediateBeforeIndex!19) (select (arr!48049 a!2862) j!93))) (let ((bdg!54267 (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48049 a!2862) index!646) bdg!54267) (= (select (arr!48049 a!2862) index!646) (select (arr!48049 a!2862) j!93))) (= (select (arr!48049 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54267 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1484209 () Bool)

(declare-fun res!1008307 () Bool)

(assert (=> b!1484209 (=> (not res!1008307) (not e!832376))))

(assert (=> b!1484209 (= res!1008307 e!832375)))

(declare-fun c!137479 () Bool)

(assert (=> b!1484209 (= c!137479 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484210 () Bool)

(declare-fun res!1008302 () Bool)

(assert (=> b!1484210 (=> (not res!1008302) (not e!832373))))

(assert (=> b!1484210 (= res!1008302 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!647725))))

(declare-fun b!1484211 () Bool)

(assert (=> b!1484211 (= e!832375 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647724 lt!647722 mask!2687) (seekEntryOrOpen!0 lt!647724 lt!647722 mask!2687)))))

(declare-fun b!1484212 () Bool)

(declare-fun res!1008305 () Bool)

(assert (=> b!1484212 (=> (not res!1008305) (not e!832372))))

(assert (=> b!1484212 (= res!1008305 (= (seekEntryOrOpen!0 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) (Found!12186 j!93)))))

(assert (= (and start!126696 res!1008311) b!1484195))

(assert (= (and b!1484195 res!1008304) b!1484205))

(assert (= (and b!1484205 res!1008308) b!1484199))

(assert (= (and b!1484199 res!1008310) b!1484204))

(assert (= (and b!1484204 res!1008300) b!1484202))

(assert (= (and b!1484202 res!1008313) b!1484206))

(assert (= (and b!1484206 res!1008306) b!1484198))

(assert (= (and b!1484198 res!1008312) b!1484200))

(assert (= (and b!1484200 res!1008301) b!1484210))

(assert (= (and b!1484210 res!1008302) b!1484207))

(assert (= (and b!1484207 res!1008299) b!1484209))

(assert (= (and b!1484209 c!137479) b!1484203))

(assert (= (and b!1484209 (not c!137479)) b!1484211))

(assert (= (and b!1484209 res!1008307) b!1484197))

(assert (= (and b!1484197 res!1008314) b!1484201))

(assert (= (and b!1484201 res!1008309) b!1484212))

(assert (= (and b!1484212 res!1008305) b!1484208))

(assert (= (and b!1484201 (not res!1008303)) b!1484196))

(declare-fun m!1369891 () Bool)

(assert (=> b!1484205 m!1369891))

(assert (=> b!1484205 m!1369891))

(declare-fun m!1369893 () Bool)

(assert (=> b!1484205 m!1369893))

(declare-fun m!1369895 () Bool)

(assert (=> b!1484204 m!1369895))

(declare-fun m!1369897 () Bool)

(assert (=> b!1484196 m!1369897))

(declare-fun m!1369899 () Bool)

(assert (=> b!1484196 m!1369899))

(declare-fun m!1369901 () Bool)

(assert (=> b!1484199 m!1369901))

(assert (=> b!1484199 m!1369901))

(declare-fun m!1369903 () Bool)

(assert (=> b!1484199 m!1369903))

(declare-fun m!1369905 () Bool)

(assert (=> b!1484201 m!1369905))

(declare-fun m!1369907 () Bool)

(assert (=> b!1484201 m!1369907))

(declare-fun m!1369909 () Bool)

(assert (=> b!1484201 m!1369909))

(declare-fun m!1369911 () Bool)

(assert (=> b!1484201 m!1369911))

(declare-fun m!1369913 () Bool)

(assert (=> b!1484201 m!1369913))

(assert (=> b!1484201 m!1369901))

(assert (=> b!1484208 m!1369907))

(declare-fun m!1369915 () Bool)

(assert (=> b!1484208 m!1369915))

(assert (=> b!1484208 m!1369909))

(assert (=> b!1484208 m!1369911))

(assert (=> b!1484208 m!1369901))

(declare-fun m!1369917 () Bool)

(assert (=> b!1484202 m!1369917))

(assert (=> b!1484212 m!1369901))

(assert (=> b!1484212 m!1369901))

(declare-fun m!1369919 () Bool)

(assert (=> b!1484212 m!1369919))

(assert (=> b!1484198 m!1369907))

(declare-fun m!1369921 () Bool)

(assert (=> b!1484198 m!1369921))

(declare-fun m!1369923 () Bool)

(assert (=> b!1484203 m!1369923))

(declare-fun m!1369925 () Bool)

(assert (=> start!126696 m!1369925))

(declare-fun m!1369927 () Bool)

(assert (=> start!126696 m!1369927))

(assert (=> b!1484200 m!1369901))

(assert (=> b!1484200 m!1369901))

(declare-fun m!1369929 () Bool)

(assert (=> b!1484200 m!1369929))

(assert (=> b!1484200 m!1369929))

(assert (=> b!1484200 m!1369901))

(declare-fun m!1369931 () Bool)

(assert (=> b!1484200 m!1369931))

(assert (=> b!1484210 m!1369901))

(assert (=> b!1484210 m!1369901))

(declare-fun m!1369933 () Bool)

(assert (=> b!1484210 m!1369933))

(assert (=> b!1484211 m!1369899))

(assert (=> b!1484211 m!1369897))

(declare-fun m!1369935 () Bool)

(assert (=> b!1484207 m!1369935))

(assert (=> b!1484207 m!1369935))

(declare-fun m!1369937 () Bool)

(assert (=> b!1484207 m!1369937))

(assert (=> b!1484207 m!1369907))

(declare-fun m!1369939 () Bool)

(assert (=> b!1484207 m!1369939))

(check-sat (not b!1484200) (not b!1484203) (not b!1484212) (not start!126696) (not b!1484210) (not b!1484199) (not b!1484202) (not b!1484201) (not b!1484211) (not b!1484205) (not b!1484204) (not b!1484207) (not b!1484196))
(check-sat)
(get-model)

(declare-fun b!1484339 () Bool)

(declare-fun e!832436 () SeekEntryResult!12186)

(assert (=> b!1484339 (= e!832436 (Intermediate!12186 false index!646 x!665))))

(declare-fun b!1484340 () Bool)

(declare-fun lt!647761 () SeekEntryResult!12186)

(assert (=> b!1484340 (and (bvsge (index!51138 lt!647761) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647761) (size!48600 a!2862)))))

(declare-fun res!1008419 () Bool)

(assert (=> b!1484340 (= res!1008419 (= (select (arr!48049 a!2862) (index!51138 lt!647761)) (select (arr!48049 a!2862) j!93)))))

(declare-fun e!832438 () Bool)

(assert (=> b!1484340 (=> res!1008419 e!832438)))

(declare-fun e!832439 () Bool)

(assert (=> b!1484340 (= e!832439 e!832438)))

(declare-fun b!1484341 () Bool)

(declare-fun e!832437 () SeekEntryResult!12186)

(assert (=> b!1484341 (= e!832437 e!832436)))

(declare-fun c!137494 () Bool)

(declare-fun lt!647760 () (_ BitVec 64))

(assert (=> b!1484341 (= c!137494 (or (= lt!647760 (select (arr!48049 a!2862) j!93)) (= (bvadd lt!647760 lt!647760) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484342 () Bool)

(assert (=> b!1484342 (and (bvsge (index!51138 lt!647761) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647761) (size!48600 a!2862)))))

(assert (=> b!1484342 (= e!832438 (= (select (arr!48049 a!2862) (index!51138 lt!647761)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1484343 () Bool)

(assert (=> b!1484343 (and (bvsge (index!51138 lt!647761) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647761) (size!48600 a!2862)))))

(declare-fun res!1008417 () Bool)

(assert (=> b!1484343 (= res!1008417 (= (select (arr!48049 a!2862) (index!51138 lt!647761)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484343 (=> res!1008417 e!832438)))

(declare-fun b!1484344 () Bool)

(declare-fun e!832440 () Bool)

(assert (=> b!1484344 (= e!832440 e!832439)))

(declare-fun res!1008418 () Bool)

(get-info :version)

(assert (=> b!1484344 (= res!1008418 (and ((_ is Intermediate!12186) lt!647761) (not (undefined!12998 lt!647761)) (bvslt (x!132902 lt!647761) #b01111111111111111111111111111110) (bvsge (x!132902 lt!647761) #b00000000000000000000000000000000) (bvsge (x!132902 lt!647761) x!665)))))

(assert (=> b!1484344 (=> (not res!1008418) (not e!832439))))

(declare-fun d!156773 () Bool)

(assert (=> d!156773 e!832440))

(declare-fun c!137493 () Bool)

(assert (=> d!156773 (= c!137493 (and ((_ is Intermediate!12186) lt!647761) (undefined!12998 lt!647761)))))

(assert (=> d!156773 (= lt!647761 e!832437)))

(declare-fun c!137492 () Bool)

(assert (=> d!156773 (= c!137492 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156773 (= lt!647760 (select (arr!48049 a!2862) index!646))))

(assert (=> d!156773 (validMask!0 mask!2687)))

(assert (=> d!156773 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!647761)))

(declare-fun b!1484345 () Bool)

(assert (=> b!1484345 (= e!832437 (Intermediate!12186 true index!646 x!665))))

(declare-fun b!1484346 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484346 (= e!832436 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48049 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1484347 () Bool)

(assert (=> b!1484347 (= e!832440 (bvsge (x!132902 lt!647761) #b01111111111111111111111111111110))))

(assert (= (and d!156773 c!137492) b!1484345))

(assert (= (and d!156773 (not c!137492)) b!1484341))

(assert (= (and b!1484341 c!137494) b!1484339))

(assert (= (and b!1484341 (not c!137494)) b!1484346))

(assert (= (and d!156773 c!137493) b!1484347))

(assert (= (and d!156773 (not c!137493)) b!1484344))

(assert (= (and b!1484344 res!1008418) b!1484340))

(assert (= (and b!1484340 (not res!1008419)) b!1484343))

(assert (= (and b!1484343 (not res!1008417)) b!1484342))

(assert (=> d!156773 m!1369911))

(assert (=> d!156773 m!1369925))

(declare-fun m!1370041 () Bool)

(assert (=> b!1484342 m!1370041))

(assert (=> b!1484340 m!1370041))

(declare-fun m!1370043 () Bool)

(assert (=> b!1484346 m!1370043))

(assert (=> b!1484346 m!1370043))

(assert (=> b!1484346 m!1369901))

(declare-fun m!1370045 () Bool)

(assert (=> b!1484346 m!1370045))

(assert (=> b!1484343 m!1370041))

(assert (=> b!1484210 d!156773))

(declare-fun d!156775 () Bool)

(assert (=> d!156775 (= (validKeyInArray!0 (select (arr!48049 a!2862) j!93)) (and (not (= (select (arr!48049 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48049 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1484199 d!156775))

(declare-fun b!1484372 () Bool)

(declare-fun e!832457 () SeekEntryResult!12186)

(declare-fun lt!647779 () SeekEntryResult!12186)

(assert (=> b!1484372 (= e!832457 (MissingZero!12186 (index!51138 lt!647779)))))

(declare-fun b!1484373 () Bool)

(declare-fun e!832458 () SeekEntryResult!12186)

(declare-fun e!832456 () SeekEntryResult!12186)

(assert (=> b!1484373 (= e!832458 e!832456)))

(declare-fun lt!647778 () (_ BitVec 64))

(assert (=> b!1484373 (= lt!647778 (select (arr!48049 a!2862) (index!51138 lt!647779)))))

(declare-fun c!137506 () Bool)

(assert (=> b!1484373 (= c!137506 (= lt!647778 (select (arr!48049 a!2862) j!93)))))

(declare-fun b!1484374 () Bool)

(assert (=> b!1484374 (= e!832456 (Found!12186 (index!51138 lt!647779)))))

(declare-fun b!1484375 () Bool)

(assert (=> b!1484375 (= e!832458 Undefined!12186)))

(declare-fun b!1484376 () Bool)

(assert (=> b!1484376 (= e!832457 (seekKeyOrZeroReturnVacant!0 (x!132902 lt!647779) (index!51138 lt!647779) (index!51138 lt!647779) (select (arr!48049 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156777 () Bool)

(declare-fun lt!647777 () SeekEntryResult!12186)

(assert (=> d!156777 (and (or ((_ is Undefined!12186) lt!647777) (not ((_ is Found!12186) lt!647777)) (and (bvsge (index!51137 lt!647777) #b00000000000000000000000000000000) (bvslt (index!51137 lt!647777) (size!48600 a!2862)))) (or ((_ is Undefined!12186) lt!647777) ((_ is Found!12186) lt!647777) (not ((_ is MissingZero!12186) lt!647777)) (and (bvsge (index!51136 lt!647777) #b00000000000000000000000000000000) (bvslt (index!51136 lt!647777) (size!48600 a!2862)))) (or ((_ is Undefined!12186) lt!647777) ((_ is Found!12186) lt!647777) ((_ is MissingZero!12186) lt!647777) (not ((_ is MissingVacant!12186) lt!647777)) (and (bvsge (index!51139 lt!647777) #b00000000000000000000000000000000) (bvslt (index!51139 lt!647777) (size!48600 a!2862)))) (or ((_ is Undefined!12186) lt!647777) (ite ((_ is Found!12186) lt!647777) (= (select (arr!48049 a!2862) (index!51137 lt!647777)) (select (arr!48049 a!2862) j!93)) (ite ((_ is MissingZero!12186) lt!647777) (= (select (arr!48049 a!2862) (index!51136 lt!647777)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12186) lt!647777) (= (select (arr!48049 a!2862) (index!51139 lt!647777)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156777 (= lt!647777 e!832458)))

(declare-fun c!137504 () Bool)

(assert (=> d!156777 (= c!137504 (and ((_ is Intermediate!12186) lt!647779) (undefined!12998 lt!647779)))))

(assert (=> d!156777 (= lt!647779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) (select (arr!48049 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156777 (validMask!0 mask!2687)))

(assert (=> d!156777 (= (seekEntryOrOpen!0 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!647777)))

(declare-fun b!1484377 () Bool)

(declare-fun c!137505 () Bool)

(assert (=> b!1484377 (= c!137505 (= lt!647778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484377 (= e!832456 e!832457)))

(assert (= (and d!156777 c!137504) b!1484375))

(assert (= (and d!156777 (not c!137504)) b!1484373))

(assert (= (and b!1484373 c!137506) b!1484374))

(assert (= (and b!1484373 (not c!137506)) b!1484377))

(assert (= (and b!1484377 c!137505) b!1484372))

(assert (= (and b!1484377 (not c!137505)) b!1484376))

(declare-fun m!1370059 () Bool)

(assert (=> b!1484373 m!1370059))

(assert (=> b!1484376 m!1369901))

(declare-fun m!1370061 () Bool)

(assert (=> b!1484376 m!1370061))

(assert (=> d!156777 m!1369929))

(assert (=> d!156777 m!1369901))

(assert (=> d!156777 m!1369931))

(assert (=> d!156777 m!1369925))

(declare-fun m!1370063 () Bool)

(assert (=> d!156777 m!1370063))

(declare-fun m!1370065 () Bool)

(assert (=> d!156777 m!1370065))

(assert (=> d!156777 m!1369901))

(assert (=> d!156777 m!1369929))

(declare-fun m!1370067 () Bool)

(assert (=> d!156777 m!1370067))

(assert (=> b!1484212 d!156777))

(declare-fun b!1484386 () Bool)

(declare-fun e!832467 () Bool)

(declare-fun e!832465 () Bool)

(assert (=> b!1484386 (= e!832467 e!832465)))

(declare-fun c!137509 () Bool)

(assert (=> b!1484386 (= c!137509 (validKeyInArray!0 (select (arr!48049 a!2862) j!93)))))

(declare-fun b!1484387 () Bool)

(declare-fun e!832466 () Bool)

(assert (=> b!1484387 (= e!832465 e!832466)))

(declare-fun lt!647786 () (_ BitVec 64))

(assert (=> b!1484387 (= lt!647786 (select (arr!48049 a!2862) j!93))))

(declare-fun lt!647787 () Unit!49745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99553 (_ BitVec 64) (_ BitVec 32)) Unit!49745)

(assert (=> b!1484387 (= lt!647787 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647786 j!93))))

(declare-fun arrayContainsKey!0 (array!99553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1484387 (arrayContainsKey!0 a!2862 lt!647786 #b00000000000000000000000000000000)))

(declare-fun lt!647788 () Unit!49745)

(assert (=> b!1484387 (= lt!647788 lt!647787)))

(declare-fun res!1008430 () Bool)

(assert (=> b!1484387 (= res!1008430 (= (seekEntryOrOpen!0 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) (Found!12186 j!93)))))

(assert (=> b!1484387 (=> (not res!1008430) (not e!832466))))

(declare-fun b!1484388 () Bool)

(declare-fun call!67950 () Bool)

(assert (=> b!1484388 (= e!832466 call!67950)))

(declare-fun b!1484389 () Bool)

(assert (=> b!1484389 (= e!832465 call!67950)))

(declare-fun bm!67947 () Bool)

(assert (=> bm!67947 (= call!67950 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156783 () Bool)

(declare-fun res!1008431 () Bool)

(assert (=> d!156783 (=> res!1008431 e!832467)))

(assert (=> d!156783 (= res!1008431 (bvsge j!93 (size!48600 a!2862)))))

(assert (=> d!156783 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!832467)))

(assert (= (and d!156783 (not res!1008431)) b!1484386))

(assert (= (and b!1484386 c!137509) b!1484387))

(assert (= (and b!1484386 (not c!137509)) b!1484389))

(assert (= (and b!1484387 res!1008430) b!1484388))

(assert (= (or b!1484388 b!1484389) bm!67947))

(assert (=> b!1484386 m!1369901))

(assert (=> b!1484386 m!1369901))

(assert (=> b!1484386 m!1369903))

(assert (=> b!1484387 m!1369901))

(declare-fun m!1370069 () Bool)

(assert (=> b!1484387 m!1370069))

(declare-fun m!1370071 () Bool)

(assert (=> b!1484387 m!1370071))

(assert (=> b!1484387 m!1369901))

(assert (=> b!1484387 m!1369919))

(declare-fun m!1370073 () Bool)

(assert (=> bm!67947 m!1370073))

(assert (=> b!1484201 d!156783))

(declare-fun d!156791 () Bool)

(assert (=> d!156791 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!647791 () Unit!49745)

(declare-fun choose!38 (array!99553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49745)

(assert (=> d!156791 (= lt!647791 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156791 (validMask!0 mask!2687)))

(assert (=> d!156791 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!647791)))

(declare-fun bs!42715 () Bool)

(assert (= bs!42715 d!156791))

(assert (=> bs!42715 m!1369913))

(declare-fun m!1370075 () Bool)

(assert (=> bs!42715 m!1370075))

(assert (=> bs!42715 m!1369925))

(assert (=> b!1484201 d!156791))

(declare-fun b!1484419 () Bool)

(declare-fun e!832489 () Bool)

(declare-fun call!67953 () Bool)

(assert (=> b!1484419 (= e!832489 call!67953)))

(declare-fun bm!67950 () Bool)

(declare-fun c!137518 () Bool)

(assert (=> bm!67950 (= call!67953 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137518 (Cons!34533 (select (arr!48049 a!2862) #b00000000000000000000000000000000) Nil!34534) Nil!34534)))))

(declare-fun b!1484420 () Bool)

(assert (=> b!1484420 (= e!832489 call!67953)))

(declare-fun b!1484421 () Bool)

(declare-fun e!832488 () Bool)

(declare-fun e!832486 () Bool)

(assert (=> b!1484421 (= e!832488 e!832486)))

(declare-fun res!1008444 () Bool)

(assert (=> b!1484421 (=> (not res!1008444) (not e!832486))))

(declare-fun e!832487 () Bool)

(assert (=> b!1484421 (= res!1008444 (not e!832487))))

(declare-fun res!1008446 () Bool)

(assert (=> b!1484421 (=> (not res!1008446) (not e!832487))))

(assert (=> b!1484421 (= res!1008446 (validKeyInArray!0 (select (arr!48049 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1484422 () Bool)

(declare-fun contains!9961 (List!34537 (_ BitVec 64)) Bool)

(assert (=> b!1484422 (= e!832487 (contains!9961 Nil!34534 (select (arr!48049 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1484418 () Bool)

(assert (=> b!1484418 (= e!832486 e!832489)))

(assert (=> b!1484418 (= c!137518 (validKeyInArray!0 (select (arr!48049 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156793 () Bool)

(declare-fun res!1008445 () Bool)

(assert (=> d!156793 (=> res!1008445 e!832488)))

(assert (=> d!156793 (= res!1008445 (bvsge #b00000000000000000000000000000000 (size!48600 a!2862)))))

(assert (=> d!156793 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34534) e!832488)))

(assert (= (and d!156793 (not res!1008445)) b!1484421))

(assert (= (and b!1484421 res!1008446) b!1484422))

(assert (= (and b!1484421 res!1008444) b!1484418))

(assert (= (and b!1484418 c!137518) b!1484419))

(assert (= (and b!1484418 (not c!137518)) b!1484420))

(assert (= (or b!1484419 b!1484420) bm!67950))

(declare-fun m!1370077 () Bool)

(assert (=> bm!67950 m!1370077))

(declare-fun m!1370079 () Bool)

(assert (=> bm!67950 m!1370079))

(assert (=> b!1484421 m!1370077))

(assert (=> b!1484421 m!1370077))

(declare-fun m!1370081 () Bool)

(assert (=> b!1484421 m!1370081))

(assert (=> b!1484422 m!1370077))

(assert (=> b!1484422 m!1370077))

(declare-fun m!1370083 () Bool)

(assert (=> b!1484422 m!1370083))

(assert (=> b!1484418 m!1370077))

(assert (=> b!1484418 m!1370077))

(assert (=> b!1484418 m!1370081))

(assert (=> b!1484202 d!156793))

(declare-fun e!832495 () SeekEntryResult!12186)

(declare-fun b!1484432 () Bool)

(assert (=> b!1484432 (= e!832495 (Intermediate!12186 false (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1484433 () Bool)

(declare-fun lt!647799 () SeekEntryResult!12186)

(assert (=> b!1484433 (and (bvsge (index!51138 lt!647799) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647799) (size!48600 a!2862)))))

(declare-fun res!1008452 () Bool)

(assert (=> b!1484433 (= res!1008452 (= (select (arr!48049 a!2862) (index!51138 lt!647799)) (select (arr!48049 a!2862) j!93)))))

(declare-fun e!832497 () Bool)

(assert (=> b!1484433 (=> res!1008452 e!832497)))

(declare-fun e!832498 () Bool)

(assert (=> b!1484433 (= e!832498 e!832497)))

(declare-fun b!1484434 () Bool)

(declare-fun e!832496 () SeekEntryResult!12186)

(assert (=> b!1484434 (= e!832496 e!832495)))

(declare-fun c!137524 () Bool)

(declare-fun lt!647798 () (_ BitVec 64))

(assert (=> b!1484434 (= c!137524 (or (= lt!647798 (select (arr!48049 a!2862) j!93)) (= (bvadd lt!647798 lt!647798) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484435 () Bool)

(assert (=> b!1484435 (and (bvsge (index!51138 lt!647799) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647799) (size!48600 a!2862)))))

(assert (=> b!1484435 (= e!832497 (= (select (arr!48049 a!2862) (index!51138 lt!647799)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1484436 () Bool)

(assert (=> b!1484436 (and (bvsge (index!51138 lt!647799) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647799) (size!48600 a!2862)))))

(declare-fun res!1008450 () Bool)

(assert (=> b!1484436 (= res!1008450 (= (select (arr!48049 a!2862) (index!51138 lt!647799)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484436 (=> res!1008450 e!832497)))

(declare-fun b!1484437 () Bool)

(declare-fun e!832499 () Bool)

(assert (=> b!1484437 (= e!832499 e!832498)))

(declare-fun res!1008451 () Bool)

(assert (=> b!1484437 (= res!1008451 (and ((_ is Intermediate!12186) lt!647799) (not (undefined!12998 lt!647799)) (bvslt (x!132902 lt!647799) #b01111111111111111111111111111110) (bvsge (x!132902 lt!647799) #b00000000000000000000000000000000) (bvsge (x!132902 lt!647799) #b00000000000000000000000000000000)))))

(assert (=> b!1484437 (=> (not res!1008451) (not e!832498))))

(declare-fun d!156795 () Bool)

(assert (=> d!156795 e!832499))

(declare-fun c!137523 () Bool)

(assert (=> d!156795 (= c!137523 (and ((_ is Intermediate!12186) lt!647799) (undefined!12998 lt!647799)))))

(assert (=> d!156795 (= lt!647799 e!832496)))

(declare-fun c!137522 () Bool)

(assert (=> d!156795 (= c!137522 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156795 (= lt!647798 (select (arr!48049 a!2862) (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687)))))

(assert (=> d!156795 (validMask!0 mask!2687)))

(assert (=> d!156795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!647799)))

(declare-fun b!1484438 () Bool)

(assert (=> b!1484438 (= e!832496 (Intermediate!12186 true (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1484439 () Bool)

(assert (=> b!1484439 (= e!832495 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48049 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1484440 () Bool)

(assert (=> b!1484440 (= e!832499 (bvsge (x!132902 lt!647799) #b01111111111111111111111111111110))))

(assert (= (and d!156795 c!137522) b!1484438))

(assert (= (and d!156795 (not c!137522)) b!1484434))

(assert (= (and b!1484434 c!137524) b!1484432))

(assert (= (and b!1484434 (not c!137524)) b!1484439))

(assert (= (and d!156795 c!137523) b!1484440))

(assert (= (and d!156795 (not c!137523)) b!1484437))

(assert (= (and b!1484437 res!1008451) b!1484433))

(assert (= (and b!1484433 (not res!1008452)) b!1484436))

(assert (= (and b!1484436 (not res!1008450)) b!1484435))

(assert (=> d!156795 m!1369929))

(declare-fun m!1370093 () Bool)

(assert (=> d!156795 m!1370093))

(assert (=> d!156795 m!1369925))

(declare-fun m!1370095 () Bool)

(assert (=> b!1484435 m!1370095))

(assert (=> b!1484433 m!1370095))

(assert (=> b!1484439 m!1369929))

(declare-fun m!1370097 () Bool)

(assert (=> b!1484439 m!1370097))

(assert (=> b!1484439 m!1370097))

(assert (=> b!1484439 m!1369901))

(declare-fun m!1370099 () Bool)

(assert (=> b!1484439 m!1370099))

(assert (=> b!1484436 m!1370095))

(assert (=> b!1484200 d!156795))

(declare-fun d!156799 () Bool)

(declare-fun lt!647811 () (_ BitVec 32))

(declare-fun lt!647810 () (_ BitVec 32))

(assert (=> d!156799 (= lt!647811 (bvmul (bvxor lt!647810 (bvlshr lt!647810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156799 (= lt!647810 ((_ extract 31 0) (bvand (bvxor (select (arr!48049 a!2862) j!93) (bvlshr (select (arr!48049 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156799 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1008455 (let ((h!35921 ((_ extract 31 0) (bvand (bvxor (select (arr!48049 a!2862) j!93) (bvlshr (select (arr!48049 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132907 (bvmul (bvxor h!35921 (bvlshr h!35921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132907 (bvlshr x!132907 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1008455 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1008455 #b00000000000000000000000000000000))))))

(assert (=> d!156799 (= (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) (bvand (bvxor lt!647811 (bvlshr lt!647811 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1484200 d!156799))

(declare-fun b!1484503 () Bool)

(declare-fun e!832535 () SeekEntryResult!12186)

(assert (=> b!1484503 (= e!832535 Undefined!12186)))

(declare-fun b!1484504 () Bool)

(declare-fun e!832534 () SeekEntryResult!12186)

(assert (=> b!1484504 (= e!832535 e!832534)))

(declare-fun c!137547 () Bool)

(declare-fun lt!647836 () (_ BitVec 64))

(assert (=> b!1484504 (= c!137547 (= lt!647836 lt!647724))))

(declare-fun b!1484505 () Bool)

(declare-fun c!137549 () Bool)

(assert (=> b!1484505 (= c!137549 (= lt!647836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!832536 () SeekEntryResult!12186)

(assert (=> b!1484505 (= e!832534 e!832536)))

(declare-fun b!1484506 () Bool)

(assert (=> b!1484506 (= e!832536 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!647724 lt!647722 mask!2687))))

(declare-fun b!1484507 () Bool)

(assert (=> b!1484507 (= e!832536 (MissingVacant!12186 intermediateAfterIndex!19))))

(declare-fun b!1484502 () Bool)

(assert (=> b!1484502 (= e!832534 (Found!12186 index!646))))

(declare-fun lt!647837 () SeekEntryResult!12186)

(declare-fun d!156807 () Bool)

(assert (=> d!156807 (and (or ((_ is Undefined!12186) lt!647837) (not ((_ is Found!12186) lt!647837)) (and (bvsge (index!51137 lt!647837) #b00000000000000000000000000000000) (bvslt (index!51137 lt!647837) (size!48600 lt!647722)))) (or ((_ is Undefined!12186) lt!647837) ((_ is Found!12186) lt!647837) (not ((_ is MissingVacant!12186) lt!647837)) (not (= (index!51139 lt!647837) intermediateAfterIndex!19)) (and (bvsge (index!51139 lt!647837) #b00000000000000000000000000000000) (bvslt (index!51139 lt!647837) (size!48600 lt!647722)))) (or ((_ is Undefined!12186) lt!647837) (ite ((_ is Found!12186) lt!647837) (= (select (arr!48049 lt!647722) (index!51137 lt!647837)) lt!647724) (and ((_ is MissingVacant!12186) lt!647837) (= (index!51139 lt!647837) intermediateAfterIndex!19) (= (select (arr!48049 lt!647722) (index!51139 lt!647837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156807 (= lt!647837 e!832535)))

(declare-fun c!137548 () Bool)

(assert (=> d!156807 (= c!137548 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156807 (= lt!647836 (select (arr!48049 lt!647722) index!646))))

(assert (=> d!156807 (validMask!0 mask!2687)))

(assert (=> d!156807 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647724 lt!647722 mask!2687) lt!647837)))

(assert (= (and d!156807 c!137548) b!1484503))

(assert (= (and d!156807 (not c!137548)) b!1484504))

(assert (= (and b!1484504 c!137547) b!1484502))

(assert (= (and b!1484504 (not c!137547)) b!1484505))

(assert (= (and b!1484505 c!137549) b!1484507))

(assert (= (and b!1484505 (not c!137549)) b!1484506))

(assert (=> b!1484506 m!1370043))

(assert (=> b!1484506 m!1370043))

(declare-fun m!1370129 () Bool)

(assert (=> b!1484506 m!1370129))

(declare-fun m!1370131 () Bool)

(assert (=> d!156807 m!1370131))

(declare-fun m!1370133 () Bool)

(assert (=> d!156807 m!1370133))

(declare-fun m!1370135 () Bool)

(assert (=> d!156807 m!1370135))

(assert (=> d!156807 m!1369925))

(assert (=> b!1484211 d!156807))

(declare-fun b!1484508 () Bool)

(declare-fun e!832538 () SeekEntryResult!12186)

(declare-fun lt!647842 () SeekEntryResult!12186)

(assert (=> b!1484508 (= e!832538 (MissingZero!12186 (index!51138 lt!647842)))))

(declare-fun b!1484509 () Bool)

(declare-fun e!832539 () SeekEntryResult!12186)

(declare-fun e!832537 () SeekEntryResult!12186)

(assert (=> b!1484509 (= e!832539 e!832537)))

(declare-fun lt!647841 () (_ BitVec 64))

(assert (=> b!1484509 (= lt!647841 (select (arr!48049 lt!647722) (index!51138 lt!647842)))))

(declare-fun c!137552 () Bool)

(assert (=> b!1484509 (= c!137552 (= lt!647841 lt!647724))))

(declare-fun b!1484510 () Bool)

(assert (=> b!1484510 (= e!832537 (Found!12186 (index!51138 lt!647842)))))

(declare-fun b!1484511 () Bool)

(assert (=> b!1484511 (= e!832539 Undefined!12186)))

(declare-fun b!1484512 () Bool)

(assert (=> b!1484512 (= e!832538 (seekKeyOrZeroReturnVacant!0 (x!132902 lt!647842) (index!51138 lt!647842) (index!51138 lt!647842) lt!647724 lt!647722 mask!2687))))

(declare-fun d!156817 () Bool)

(declare-fun lt!647840 () SeekEntryResult!12186)

(assert (=> d!156817 (and (or ((_ is Undefined!12186) lt!647840) (not ((_ is Found!12186) lt!647840)) (and (bvsge (index!51137 lt!647840) #b00000000000000000000000000000000) (bvslt (index!51137 lt!647840) (size!48600 lt!647722)))) (or ((_ is Undefined!12186) lt!647840) ((_ is Found!12186) lt!647840) (not ((_ is MissingZero!12186) lt!647840)) (and (bvsge (index!51136 lt!647840) #b00000000000000000000000000000000) (bvslt (index!51136 lt!647840) (size!48600 lt!647722)))) (or ((_ is Undefined!12186) lt!647840) ((_ is Found!12186) lt!647840) ((_ is MissingZero!12186) lt!647840) (not ((_ is MissingVacant!12186) lt!647840)) (and (bvsge (index!51139 lt!647840) #b00000000000000000000000000000000) (bvslt (index!51139 lt!647840) (size!48600 lt!647722)))) (or ((_ is Undefined!12186) lt!647840) (ite ((_ is Found!12186) lt!647840) (= (select (arr!48049 lt!647722) (index!51137 lt!647840)) lt!647724) (ite ((_ is MissingZero!12186) lt!647840) (= (select (arr!48049 lt!647722) (index!51136 lt!647840)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12186) lt!647840) (= (select (arr!48049 lt!647722) (index!51139 lt!647840)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156817 (= lt!647840 e!832539)))

(declare-fun c!137550 () Bool)

(assert (=> d!156817 (= c!137550 (and ((_ is Intermediate!12186) lt!647842) (undefined!12998 lt!647842)))))

(assert (=> d!156817 (= lt!647842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647724 mask!2687) lt!647724 lt!647722 mask!2687))))

(assert (=> d!156817 (validMask!0 mask!2687)))

(assert (=> d!156817 (= (seekEntryOrOpen!0 lt!647724 lt!647722 mask!2687) lt!647840)))

(declare-fun b!1484513 () Bool)

(declare-fun c!137551 () Bool)

(assert (=> b!1484513 (= c!137551 (= lt!647841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484513 (= e!832537 e!832538)))

(assert (= (and d!156817 c!137550) b!1484511))

(assert (= (and d!156817 (not c!137550)) b!1484509))

(assert (= (and b!1484509 c!137552) b!1484510))

(assert (= (and b!1484509 (not c!137552)) b!1484513))

(assert (= (and b!1484513 c!137551) b!1484508))

(assert (= (and b!1484513 (not c!137551)) b!1484512))

(declare-fun m!1370137 () Bool)

(assert (=> b!1484509 m!1370137))

(declare-fun m!1370139 () Bool)

(assert (=> b!1484512 m!1370139))

(assert (=> d!156817 m!1369935))

(assert (=> d!156817 m!1369937))

(assert (=> d!156817 m!1369925))

(declare-fun m!1370141 () Bool)

(assert (=> d!156817 m!1370141))

(declare-fun m!1370143 () Bool)

(assert (=> d!156817 m!1370143))

(assert (=> d!156817 m!1369935))

(declare-fun m!1370145 () Bool)

(assert (=> d!156817 m!1370145))

(assert (=> b!1484211 d!156817))

(declare-fun b!1484523 () Bool)

(declare-fun e!832547 () Bool)

(declare-fun e!832545 () Bool)

(assert (=> b!1484523 (= e!832547 e!832545)))

(declare-fun c!137556 () Bool)

(assert (=> b!1484523 (= c!137556 (validKeyInArray!0 (select (arr!48049 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1484524 () Bool)

(declare-fun e!832546 () Bool)

(assert (=> b!1484524 (= e!832545 e!832546)))

(declare-fun lt!647845 () (_ BitVec 64))

(assert (=> b!1484524 (= lt!647845 (select (arr!48049 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!647846 () Unit!49745)

(assert (=> b!1484524 (= lt!647846 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647845 #b00000000000000000000000000000000))))

(assert (=> b!1484524 (arrayContainsKey!0 a!2862 lt!647845 #b00000000000000000000000000000000)))

(declare-fun lt!647847 () Unit!49745)

(assert (=> b!1484524 (= lt!647847 lt!647846)))

(declare-fun res!1008476 () Bool)

(assert (=> b!1484524 (= res!1008476 (= (seekEntryOrOpen!0 (select (arr!48049 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12186 #b00000000000000000000000000000000)))))

(assert (=> b!1484524 (=> (not res!1008476) (not e!832546))))

(declare-fun b!1484525 () Bool)

(declare-fun call!67955 () Bool)

(assert (=> b!1484525 (= e!832546 call!67955)))

(declare-fun b!1484526 () Bool)

(assert (=> b!1484526 (= e!832545 call!67955)))

(declare-fun bm!67952 () Bool)

(assert (=> bm!67952 (= call!67955 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156821 () Bool)

(declare-fun res!1008477 () Bool)

(assert (=> d!156821 (=> res!1008477 e!832547)))

(assert (=> d!156821 (= res!1008477 (bvsge #b00000000000000000000000000000000 (size!48600 a!2862)))))

(assert (=> d!156821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!832547)))

(assert (= (and d!156821 (not res!1008477)) b!1484523))

(assert (= (and b!1484523 c!137556) b!1484524))

(assert (= (and b!1484523 (not c!137556)) b!1484526))

(assert (= (and b!1484524 res!1008476) b!1484525))

(assert (= (or b!1484525 b!1484526) bm!67952))

(assert (=> b!1484523 m!1370077))

(assert (=> b!1484523 m!1370077))

(assert (=> b!1484523 m!1370081))

(assert (=> b!1484524 m!1370077))

(declare-fun m!1370155 () Bool)

(assert (=> b!1484524 m!1370155))

(declare-fun m!1370157 () Bool)

(assert (=> b!1484524 m!1370157))

(assert (=> b!1484524 m!1370077))

(declare-fun m!1370159 () Bool)

(assert (=> b!1484524 m!1370159))

(declare-fun m!1370161 () Bool)

(assert (=> bm!67952 m!1370161))

(assert (=> b!1484204 d!156821))

(declare-fun d!156825 () Bool)

(assert (=> d!156825 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126696 d!156825))

(declare-fun d!156831 () Bool)

(assert (=> d!156831 (= (array_inv!37330 a!2862) (bvsge (size!48600 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126696 d!156831))

(declare-fun b!1484560 () Bool)

(declare-fun e!832569 () SeekEntryResult!12186)

(assert (=> b!1484560 (= e!832569 (Intermediate!12186 false index!646 x!665))))

(declare-fun b!1484561 () Bool)

(declare-fun lt!647855 () SeekEntryResult!12186)

(assert (=> b!1484561 (and (bvsge (index!51138 lt!647855) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647855) (size!48600 lt!647722)))))

(declare-fun res!1008489 () Bool)

(assert (=> b!1484561 (= res!1008489 (= (select (arr!48049 lt!647722) (index!51138 lt!647855)) lt!647724))))

(declare-fun e!832571 () Bool)

(assert (=> b!1484561 (=> res!1008489 e!832571)))

(declare-fun e!832572 () Bool)

(assert (=> b!1484561 (= e!832572 e!832571)))

(declare-fun b!1484562 () Bool)

(declare-fun e!832570 () SeekEntryResult!12186)

(assert (=> b!1484562 (= e!832570 e!832569)))

(declare-fun c!137571 () Bool)

(declare-fun lt!647854 () (_ BitVec 64))

(assert (=> b!1484562 (= c!137571 (or (= lt!647854 lt!647724) (= (bvadd lt!647854 lt!647854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484563 () Bool)

(assert (=> b!1484563 (and (bvsge (index!51138 lt!647855) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647855) (size!48600 lt!647722)))))

(assert (=> b!1484563 (= e!832571 (= (select (arr!48049 lt!647722) (index!51138 lt!647855)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1484564 () Bool)

(assert (=> b!1484564 (and (bvsge (index!51138 lt!647855) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647855) (size!48600 lt!647722)))))

(declare-fun res!1008487 () Bool)

(assert (=> b!1484564 (= res!1008487 (= (select (arr!48049 lt!647722) (index!51138 lt!647855)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484564 (=> res!1008487 e!832571)))

(declare-fun b!1484565 () Bool)

(declare-fun e!832573 () Bool)

(assert (=> b!1484565 (= e!832573 e!832572)))

(declare-fun res!1008488 () Bool)

(assert (=> b!1484565 (= res!1008488 (and ((_ is Intermediate!12186) lt!647855) (not (undefined!12998 lt!647855)) (bvslt (x!132902 lt!647855) #b01111111111111111111111111111110) (bvsge (x!132902 lt!647855) #b00000000000000000000000000000000) (bvsge (x!132902 lt!647855) x!665)))))

(assert (=> b!1484565 (=> (not res!1008488) (not e!832572))))

(declare-fun d!156833 () Bool)

(assert (=> d!156833 e!832573))

(declare-fun c!137570 () Bool)

(assert (=> d!156833 (= c!137570 (and ((_ is Intermediate!12186) lt!647855) (undefined!12998 lt!647855)))))

(assert (=> d!156833 (= lt!647855 e!832570)))

(declare-fun c!137569 () Bool)

(assert (=> d!156833 (= c!137569 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156833 (= lt!647854 (select (arr!48049 lt!647722) index!646))))

(assert (=> d!156833 (validMask!0 mask!2687)))

(assert (=> d!156833 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647724 lt!647722 mask!2687) lt!647855)))

(declare-fun b!1484566 () Bool)

(assert (=> b!1484566 (= e!832570 (Intermediate!12186 true index!646 x!665))))

(declare-fun b!1484567 () Bool)

(assert (=> b!1484567 (= e!832569 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!647724 lt!647722 mask!2687))))

(declare-fun b!1484568 () Bool)

(assert (=> b!1484568 (= e!832573 (bvsge (x!132902 lt!647855) #b01111111111111111111111111111110))))

(assert (= (and d!156833 c!137569) b!1484566))

(assert (= (and d!156833 (not c!137569)) b!1484562))

(assert (= (and b!1484562 c!137571) b!1484560))

(assert (= (and b!1484562 (not c!137571)) b!1484567))

(assert (= (and d!156833 c!137570) b!1484568))

(assert (= (and d!156833 (not c!137570)) b!1484565))

(assert (= (and b!1484565 res!1008488) b!1484561))

(assert (= (and b!1484561 (not res!1008489)) b!1484564))

(assert (= (and b!1484564 (not res!1008487)) b!1484563))

(assert (=> d!156833 m!1370135))

(assert (=> d!156833 m!1369925))

(declare-fun m!1370177 () Bool)

(assert (=> b!1484563 m!1370177))

(assert (=> b!1484561 m!1370177))

(assert (=> b!1484567 m!1370043))

(assert (=> b!1484567 m!1370043))

(declare-fun m!1370179 () Bool)

(assert (=> b!1484567 m!1370179))

(assert (=> b!1484564 m!1370177))

(assert (=> b!1484203 d!156833))

(assert (=> b!1484196 d!156817))

(assert (=> b!1484196 d!156807))

(declare-fun b!1484569 () Bool)

(declare-fun e!832574 () SeekEntryResult!12186)

(assert (=> b!1484569 (= e!832574 (Intermediate!12186 false (toIndex!0 lt!647724 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1484570 () Bool)

(declare-fun lt!647857 () SeekEntryResult!12186)

(assert (=> b!1484570 (and (bvsge (index!51138 lt!647857) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647857) (size!48600 lt!647722)))))

(declare-fun res!1008492 () Bool)

(assert (=> b!1484570 (= res!1008492 (= (select (arr!48049 lt!647722) (index!51138 lt!647857)) lt!647724))))

(declare-fun e!832576 () Bool)

(assert (=> b!1484570 (=> res!1008492 e!832576)))

(declare-fun e!832577 () Bool)

(assert (=> b!1484570 (= e!832577 e!832576)))

(declare-fun b!1484571 () Bool)

(declare-fun e!832575 () SeekEntryResult!12186)

(assert (=> b!1484571 (= e!832575 e!832574)))

(declare-fun c!137574 () Bool)

(declare-fun lt!647856 () (_ BitVec 64))

(assert (=> b!1484571 (= c!137574 (or (= lt!647856 lt!647724) (= (bvadd lt!647856 lt!647856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484572 () Bool)

(assert (=> b!1484572 (and (bvsge (index!51138 lt!647857) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647857) (size!48600 lt!647722)))))

(assert (=> b!1484572 (= e!832576 (= (select (arr!48049 lt!647722) (index!51138 lt!647857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1484573 () Bool)

(assert (=> b!1484573 (and (bvsge (index!51138 lt!647857) #b00000000000000000000000000000000) (bvslt (index!51138 lt!647857) (size!48600 lt!647722)))))

(declare-fun res!1008490 () Bool)

(assert (=> b!1484573 (= res!1008490 (= (select (arr!48049 lt!647722) (index!51138 lt!647857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484573 (=> res!1008490 e!832576)))

(declare-fun b!1484574 () Bool)

(declare-fun e!832578 () Bool)

(assert (=> b!1484574 (= e!832578 e!832577)))

(declare-fun res!1008491 () Bool)

(assert (=> b!1484574 (= res!1008491 (and ((_ is Intermediate!12186) lt!647857) (not (undefined!12998 lt!647857)) (bvslt (x!132902 lt!647857) #b01111111111111111111111111111110) (bvsge (x!132902 lt!647857) #b00000000000000000000000000000000) (bvsge (x!132902 lt!647857) #b00000000000000000000000000000000)))))

(assert (=> b!1484574 (=> (not res!1008491) (not e!832577))))

(declare-fun d!156835 () Bool)

(assert (=> d!156835 e!832578))

(declare-fun c!137573 () Bool)

(assert (=> d!156835 (= c!137573 (and ((_ is Intermediate!12186) lt!647857) (undefined!12998 lt!647857)))))

(assert (=> d!156835 (= lt!647857 e!832575)))

(declare-fun c!137572 () Bool)

(assert (=> d!156835 (= c!137572 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156835 (= lt!647856 (select (arr!48049 lt!647722) (toIndex!0 lt!647724 mask!2687)))))

(assert (=> d!156835 (validMask!0 mask!2687)))

(assert (=> d!156835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647724 mask!2687) lt!647724 lt!647722 mask!2687) lt!647857)))

(declare-fun b!1484575 () Bool)

(assert (=> b!1484575 (= e!832575 (Intermediate!12186 true (toIndex!0 lt!647724 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1484576 () Bool)

(assert (=> b!1484576 (= e!832574 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!647724 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!647724 lt!647722 mask!2687))))

(declare-fun b!1484577 () Bool)

(assert (=> b!1484577 (= e!832578 (bvsge (x!132902 lt!647857) #b01111111111111111111111111111110))))

(assert (= (and d!156835 c!137572) b!1484575))

(assert (= (and d!156835 (not c!137572)) b!1484571))

(assert (= (and b!1484571 c!137574) b!1484569))

(assert (= (and b!1484571 (not c!137574)) b!1484576))

(assert (= (and d!156835 c!137573) b!1484577))

(assert (= (and d!156835 (not c!137573)) b!1484574))

(assert (= (and b!1484574 res!1008491) b!1484570))

(assert (= (and b!1484570 (not res!1008492)) b!1484573))

(assert (= (and b!1484573 (not res!1008490)) b!1484572))

(assert (=> d!156835 m!1369935))

(declare-fun m!1370181 () Bool)

(assert (=> d!156835 m!1370181))

(assert (=> d!156835 m!1369925))

(declare-fun m!1370183 () Bool)

(assert (=> b!1484572 m!1370183))

(assert (=> b!1484570 m!1370183))

(assert (=> b!1484576 m!1369935))

(declare-fun m!1370185 () Bool)

(assert (=> b!1484576 m!1370185))

(assert (=> b!1484576 m!1370185))

(declare-fun m!1370187 () Bool)

(assert (=> b!1484576 m!1370187))

(assert (=> b!1484573 m!1370183))

(assert (=> b!1484207 d!156835))

(declare-fun d!156837 () Bool)

(declare-fun lt!647859 () (_ BitVec 32))

(declare-fun lt!647858 () (_ BitVec 32))

(assert (=> d!156837 (= lt!647859 (bvmul (bvxor lt!647858 (bvlshr lt!647858 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156837 (= lt!647858 ((_ extract 31 0) (bvand (bvxor lt!647724 (bvlshr lt!647724 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156837 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1008455 (let ((h!35921 ((_ extract 31 0) (bvand (bvxor lt!647724 (bvlshr lt!647724 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132907 (bvmul (bvxor h!35921 (bvlshr h!35921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132907 (bvlshr x!132907 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1008455 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1008455 #b00000000000000000000000000000000))))))

(assert (=> d!156837 (= (toIndex!0 lt!647724 mask!2687) (bvand (bvxor lt!647859 (bvlshr lt!647859 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1484207 d!156837))

(declare-fun d!156839 () Bool)

(assert (=> d!156839 (= (validKeyInArray!0 (select (arr!48049 a!2862) i!1006)) (and (not (= (select (arr!48049 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48049 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1484205 d!156839))

(check-sat (not d!156791) (not b!1484418) (not b!1484523) (not d!156773) (not d!156835) (not b!1484524) (not b!1484386) (not d!156817) (not b!1484387) (not b!1484376) (not b!1484567) (not bm!67950) (not b!1484421) (not d!156777) (not b!1484346) (not b!1484512) (not d!156833) (not bm!67947) (not bm!67952) (not b!1484422) (not b!1484506) (not b!1484576) (not d!156795) (not b!1484439) (not d!156807))
(check-sat)
