; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125610 () Bool)

(assert start!125610)

(declare-fun b!1470067 () Bool)

(declare-fun res!998475 () Bool)

(declare-fun e!825223 () Bool)

(assert (=> b!1470067 (=> (not res!998475) (not e!825223))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12057 0))(
  ( (MissingZero!12057 (index!50620 (_ BitVec 32))) (Found!12057 (index!50621 (_ BitVec 32))) (Intermediate!12057 (undefined!12869 Bool) (index!50622 (_ BitVec 32)) (x!132194 (_ BitVec 32))) (Undefined!12057) (MissingVacant!12057 (index!50623 (_ BitVec 32))) )
))
(declare-fun lt!642769 () SeekEntryResult!12057)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99058 0))(
  ( (array!99059 (arr!47817 (Array (_ BitVec 32) (_ BitVec 64))) (size!48367 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99058)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99058 (_ BitVec 32)) SeekEntryResult!12057)

(assert (=> b!1470067 (= res!998475 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47817 a!2862) j!93) a!2862 mask!2687) lt!642769))))

(declare-fun b!1470068 () Bool)

(declare-fun res!998480 () Bool)

(declare-fun e!825224 () Bool)

(assert (=> b!1470068 (=> (not res!998480) (not e!825224))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470068 (= res!998480 (and (= (size!48367 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48367 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48367 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470069 () Bool)

(declare-fun e!825227 () Bool)

(assert (=> b!1470069 (= e!825227 e!825223)))

(declare-fun res!998474 () Bool)

(assert (=> b!1470069 (=> (not res!998474) (not e!825223))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470069 (= res!998474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687) (select (arr!47817 a!2862) j!93) a!2862 mask!2687) lt!642769))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470069 (= lt!642769 (Intermediate!12057 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!998470 () Bool)

(assert (=> start!125610 (=> (not res!998470) (not e!825224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125610 (= res!998470 (validMask!0 mask!2687))))

(assert (=> start!125610 e!825224))

(assert (=> start!125610 true))

(declare-fun array_inv!36845 (array!99058) Bool)

(assert (=> start!125610 (array_inv!36845 a!2862)))

(declare-fun b!1470070 () Bool)

(declare-fun res!998476 () Bool)

(assert (=> b!1470070 (=> (not res!998476) (not e!825224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99058 (_ BitVec 32)) Bool)

(assert (=> b!1470070 (= res!998476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!642768 () array!99058)

(declare-fun b!1470071 () Bool)

(declare-fun lt!642770 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!825222 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99058 (_ BitVec 32)) SeekEntryResult!12057)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99058 (_ BitVec 32)) SeekEntryResult!12057)

(assert (=> b!1470071 (= e!825222 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642770 lt!642768 mask!2687) (seekEntryOrOpen!0 lt!642770 lt!642768 mask!2687)))))

(declare-fun b!1470072 () Bool)

(declare-fun res!998482 () Bool)

(assert (=> b!1470072 (=> (not res!998482) (not e!825224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470072 (= res!998482 (validKeyInArray!0 (select (arr!47817 a!2862) i!1006)))))

(declare-fun b!1470073 () Bool)

(declare-fun res!998477 () Bool)

(declare-fun e!825225 () Bool)

(assert (=> b!1470073 (=> (not res!998477) (not e!825225))))

(assert (=> b!1470073 (= res!998477 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470074 () Bool)

(assert (=> b!1470074 (= e!825223 e!825225)))

(declare-fun res!998472 () Bool)

(assert (=> b!1470074 (=> (not res!998472) (not e!825225))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!642767 () SeekEntryResult!12057)

(assert (=> b!1470074 (= res!998472 (= lt!642767 (Intermediate!12057 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1470074 (= lt!642767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642770 mask!2687) lt!642770 lt!642768 mask!2687))))

(assert (=> b!1470074 (= lt!642770 (select (store (arr!47817 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470075 () Bool)

(declare-fun res!998481 () Bool)

(assert (=> b!1470075 (=> (not res!998481) (not e!825225))))

(assert (=> b!1470075 (= res!998481 e!825222)))

(declare-fun c!135309 () Bool)

(assert (=> b!1470075 (= c!135309 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470076 () Bool)

(declare-fun res!998473 () Bool)

(assert (=> b!1470076 (=> (not res!998473) (not e!825224))))

(assert (=> b!1470076 (= res!998473 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48367 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48367 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48367 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470077 () Bool)

(declare-fun res!998479 () Bool)

(assert (=> b!1470077 (=> (not res!998479) (not e!825224))))

(declare-datatypes ((List!34318 0))(
  ( (Nil!34315) (Cons!34314 (h!35664 (_ BitVec 64)) (t!49012 List!34318)) )
))
(declare-fun arrayNoDuplicates!0 (array!99058 (_ BitVec 32) List!34318) Bool)

(assert (=> b!1470077 (= res!998479 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34315))))

(declare-fun b!1470078 () Bool)

(assert (=> b!1470078 (= e!825222 (= lt!642767 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642770 lt!642768 mask!2687)))))

(declare-fun b!1470079 () Bool)

(assert (=> b!1470079 (= e!825225 (not (= (seekEntryOrOpen!0 (select (arr!47817 a!2862) j!93) a!2862 mask!2687) (Found!12057 j!93))))))

(assert (=> b!1470079 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49454 0))(
  ( (Unit!49455) )
))
(declare-fun lt!642771 () Unit!49454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49454)

(assert (=> b!1470079 (= lt!642771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470080 () Bool)

(assert (=> b!1470080 (= e!825224 e!825227)))

(declare-fun res!998471 () Bool)

(assert (=> b!1470080 (=> (not res!998471) (not e!825227))))

(assert (=> b!1470080 (= res!998471 (= (select (store (arr!47817 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470080 (= lt!642768 (array!99059 (store (arr!47817 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48367 a!2862)))))

(declare-fun b!1470081 () Bool)

(declare-fun res!998478 () Bool)

(assert (=> b!1470081 (=> (not res!998478) (not e!825224))))

(assert (=> b!1470081 (= res!998478 (validKeyInArray!0 (select (arr!47817 a!2862) j!93)))))

(assert (= (and start!125610 res!998470) b!1470068))

(assert (= (and b!1470068 res!998480) b!1470072))

(assert (= (and b!1470072 res!998482) b!1470081))

(assert (= (and b!1470081 res!998478) b!1470070))

(assert (= (and b!1470070 res!998476) b!1470077))

(assert (= (and b!1470077 res!998479) b!1470076))

(assert (= (and b!1470076 res!998473) b!1470080))

(assert (= (and b!1470080 res!998471) b!1470069))

(assert (= (and b!1470069 res!998474) b!1470067))

(assert (= (and b!1470067 res!998475) b!1470074))

(assert (= (and b!1470074 res!998472) b!1470075))

(assert (= (and b!1470075 c!135309) b!1470078))

(assert (= (and b!1470075 (not c!135309)) b!1470071))

(assert (= (and b!1470075 res!998481) b!1470073))

(assert (= (and b!1470073 res!998477) b!1470079))

(declare-fun m!1357203 () Bool)

(assert (=> b!1470067 m!1357203))

(assert (=> b!1470067 m!1357203))

(declare-fun m!1357205 () Bool)

(assert (=> b!1470067 m!1357205))

(declare-fun m!1357207 () Bool)

(assert (=> b!1470077 m!1357207))

(declare-fun m!1357209 () Bool)

(assert (=> b!1470078 m!1357209))

(declare-fun m!1357211 () Bool)

(assert (=> b!1470080 m!1357211))

(declare-fun m!1357213 () Bool)

(assert (=> b!1470080 m!1357213))

(declare-fun m!1357215 () Bool)

(assert (=> b!1470070 m!1357215))

(declare-fun m!1357217 () Bool)

(assert (=> b!1470071 m!1357217))

(declare-fun m!1357219 () Bool)

(assert (=> b!1470071 m!1357219))

(declare-fun m!1357221 () Bool)

(assert (=> b!1470072 m!1357221))

(assert (=> b!1470072 m!1357221))

(declare-fun m!1357223 () Bool)

(assert (=> b!1470072 m!1357223))

(assert (=> b!1470069 m!1357203))

(assert (=> b!1470069 m!1357203))

(declare-fun m!1357225 () Bool)

(assert (=> b!1470069 m!1357225))

(assert (=> b!1470069 m!1357225))

(assert (=> b!1470069 m!1357203))

(declare-fun m!1357227 () Bool)

(assert (=> b!1470069 m!1357227))

(declare-fun m!1357229 () Bool)

(assert (=> start!125610 m!1357229))

(declare-fun m!1357231 () Bool)

(assert (=> start!125610 m!1357231))

(assert (=> b!1470079 m!1357203))

(assert (=> b!1470079 m!1357203))

(declare-fun m!1357233 () Bool)

(assert (=> b!1470079 m!1357233))

(declare-fun m!1357235 () Bool)

(assert (=> b!1470079 m!1357235))

(declare-fun m!1357237 () Bool)

(assert (=> b!1470079 m!1357237))

(assert (=> b!1470081 m!1357203))

(assert (=> b!1470081 m!1357203))

(declare-fun m!1357239 () Bool)

(assert (=> b!1470081 m!1357239))

(declare-fun m!1357241 () Bool)

(assert (=> b!1470074 m!1357241))

(assert (=> b!1470074 m!1357241))

(declare-fun m!1357243 () Bool)

(assert (=> b!1470074 m!1357243))

(assert (=> b!1470074 m!1357211))

(declare-fun m!1357245 () Bool)

(assert (=> b!1470074 m!1357245))

(check-sat (not b!1470079) (not b!1470072) (not b!1470074) (not start!125610) (not b!1470078) (not b!1470067) (not b!1470077) (not b!1470070) (not b!1470071) (not b!1470069) (not b!1470081))
(check-sat)
(get-model)

(declare-fun lt!642792 () SeekEntryResult!12057)

(declare-fun d!155311 () Bool)

(get-info :version)

(assert (=> d!155311 (and (or ((_ is Undefined!12057) lt!642792) (not ((_ is Found!12057) lt!642792)) (and (bvsge (index!50621 lt!642792) #b00000000000000000000000000000000) (bvslt (index!50621 lt!642792) (size!48367 lt!642768)))) (or ((_ is Undefined!12057) lt!642792) ((_ is Found!12057) lt!642792) (not ((_ is MissingVacant!12057) lt!642792)) (not (= (index!50623 lt!642792) intermediateAfterIndex!19)) (and (bvsge (index!50623 lt!642792) #b00000000000000000000000000000000) (bvslt (index!50623 lt!642792) (size!48367 lt!642768)))) (or ((_ is Undefined!12057) lt!642792) (ite ((_ is Found!12057) lt!642792) (= (select (arr!47817 lt!642768) (index!50621 lt!642792)) lt!642770) (and ((_ is MissingVacant!12057) lt!642792) (= (index!50623 lt!642792) intermediateAfterIndex!19) (= (select (arr!47817 lt!642768) (index!50623 lt!642792)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!825252 () SeekEntryResult!12057)

(assert (=> d!155311 (= lt!642792 e!825252)))

(declare-fun c!135321 () Bool)

(assert (=> d!155311 (= c!135321 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!642791 () (_ BitVec 64))

(assert (=> d!155311 (= lt!642791 (select (arr!47817 lt!642768) index!646))))

(assert (=> d!155311 (validMask!0 mask!2687)))

(assert (=> d!155311 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642770 lt!642768 mask!2687) lt!642792)))

(declare-fun b!1470139 () Bool)

(declare-fun e!825253 () SeekEntryResult!12057)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470139 (= e!825253 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!642770 lt!642768 mask!2687))))

(declare-fun b!1470140 () Bool)

(assert (=> b!1470140 (= e!825252 Undefined!12057)))

(declare-fun b!1470141 () Bool)

(declare-fun c!135320 () Bool)

(assert (=> b!1470141 (= c!135320 (= lt!642791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825254 () SeekEntryResult!12057)

(assert (=> b!1470141 (= e!825254 e!825253)))

(declare-fun b!1470142 () Bool)

(assert (=> b!1470142 (= e!825253 (MissingVacant!12057 intermediateAfterIndex!19))))

(declare-fun b!1470143 () Bool)

(assert (=> b!1470143 (= e!825252 e!825254)))

(declare-fun c!135319 () Bool)

(assert (=> b!1470143 (= c!135319 (= lt!642791 lt!642770))))

(declare-fun b!1470144 () Bool)

(assert (=> b!1470144 (= e!825254 (Found!12057 index!646))))

(assert (= (and d!155311 c!135321) b!1470140))

(assert (= (and d!155311 (not c!135321)) b!1470143))

(assert (= (and b!1470143 c!135319) b!1470144))

(assert (= (and b!1470143 (not c!135319)) b!1470141))

(assert (= (and b!1470141 c!135320) b!1470142))

(assert (= (and b!1470141 (not c!135320)) b!1470139))

(declare-fun m!1357291 () Bool)

(assert (=> d!155311 m!1357291))

(declare-fun m!1357293 () Bool)

(assert (=> d!155311 m!1357293))

(declare-fun m!1357295 () Bool)

(assert (=> d!155311 m!1357295))

(assert (=> d!155311 m!1357229))

(declare-fun m!1357297 () Bool)

(assert (=> b!1470139 m!1357297))

(assert (=> b!1470139 m!1357297))

(declare-fun m!1357299 () Bool)

(assert (=> b!1470139 m!1357299))

(assert (=> b!1470071 d!155311))

(declare-fun b!1470157 () Bool)

(declare-fun e!825261 () SeekEntryResult!12057)

(assert (=> b!1470157 (= e!825261 Undefined!12057)))

(declare-fun d!155313 () Bool)

(declare-fun lt!642800 () SeekEntryResult!12057)

(assert (=> d!155313 (and (or ((_ is Undefined!12057) lt!642800) (not ((_ is Found!12057) lt!642800)) (and (bvsge (index!50621 lt!642800) #b00000000000000000000000000000000) (bvslt (index!50621 lt!642800) (size!48367 lt!642768)))) (or ((_ is Undefined!12057) lt!642800) ((_ is Found!12057) lt!642800) (not ((_ is MissingZero!12057) lt!642800)) (and (bvsge (index!50620 lt!642800) #b00000000000000000000000000000000) (bvslt (index!50620 lt!642800) (size!48367 lt!642768)))) (or ((_ is Undefined!12057) lt!642800) ((_ is Found!12057) lt!642800) ((_ is MissingZero!12057) lt!642800) (not ((_ is MissingVacant!12057) lt!642800)) (and (bvsge (index!50623 lt!642800) #b00000000000000000000000000000000) (bvslt (index!50623 lt!642800) (size!48367 lt!642768)))) (or ((_ is Undefined!12057) lt!642800) (ite ((_ is Found!12057) lt!642800) (= (select (arr!47817 lt!642768) (index!50621 lt!642800)) lt!642770) (ite ((_ is MissingZero!12057) lt!642800) (= (select (arr!47817 lt!642768) (index!50620 lt!642800)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12057) lt!642800) (= (select (arr!47817 lt!642768) (index!50623 lt!642800)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155313 (= lt!642800 e!825261)))

(declare-fun c!135328 () Bool)

(declare-fun lt!642799 () SeekEntryResult!12057)

(assert (=> d!155313 (= c!135328 (and ((_ is Intermediate!12057) lt!642799) (undefined!12869 lt!642799)))))

(assert (=> d!155313 (= lt!642799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642770 mask!2687) lt!642770 lt!642768 mask!2687))))

(assert (=> d!155313 (validMask!0 mask!2687)))

(assert (=> d!155313 (= (seekEntryOrOpen!0 lt!642770 lt!642768 mask!2687) lt!642800)))

(declare-fun b!1470158 () Bool)

(declare-fun e!825262 () SeekEntryResult!12057)

(assert (=> b!1470158 (= e!825262 (MissingZero!12057 (index!50622 lt!642799)))))

(declare-fun b!1470159 () Bool)

(declare-fun c!135329 () Bool)

(declare-fun lt!642801 () (_ BitVec 64))

(assert (=> b!1470159 (= c!135329 (= lt!642801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825263 () SeekEntryResult!12057)

(assert (=> b!1470159 (= e!825263 e!825262)))

(declare-fun b!1470160 () Bool)

(assert (=> b!1470160 (= e!825262 (seekKeyOrZeroReturnVacant!0 (x!132194 lt!642799) (index!50622 lt!642799) (index!50622 lt!642799) lt!642770 lt!642768 mask!2687))))

(declare-fun b!1470161 () Bool)

(assert (=> b!1470161 (= e!825263 (Found!12057 (index!50622 lt!642799)))))

(declare-fun b!1470162 () Bool)

(assert (=> b!1470162 (= e!825261 e!825263)))

(assert (=> b!1470162 (= lt!642801 (select (arr!47817 lt!642768) (index!50622 lt!642799)))))

(declare-fun c!135330 () Bool)

(assert (=> b!1470162 (= c!135330 (= lt!642801 lt!642770))))

(assert (= (and d!155313 c!135328) b!1470157))

(assert (= (and d!155313 (not c!135328)) b!1470162))

(assert (= (and b!1470162 c!135330) b!1470161))

(assert (= (and b!1470162 (not c!135330)) b!1470159))

(assert (= (and b!1470159 c!135329) b!1470158))

(assert (= (and b!1470159 (not c!135329)) b!1470160))

(declare-fun m!1357301 () Bool)

(assert (=> d!155313 m!1357301))

(assert (=> d!155313 m!1357241))

(assert (=> d!155313 m!1357243))

(declare-fun m!1357303 () Bool)

(assert (=> d!155313 m!1357303))

(assert (=> d!155313 m!1357229))

(assert (=> d!155313 m!1357241))

(declare-fun m!1357305 () Bool)

(assert (=> d!155313 m!1357305))

(declare-fun m!1357307 () Bool)

(assert (=> b!1470160 m!1357307))

(declare-fun m!1357309 () Bool)

(assert (=> b!1470162 m!1357309))

(assert (=> b!1470071 d!155313))

(declare-fun d!155315 () Bool)

(assert (=> d!155315 (= (validKeyInArray!0 (select (arr!47817 a!2862) i!1006)) (and (not (= (select (arr!47817 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47817 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1470072 d!155315))

(declare-fun b!1470181 () Bool)

(declare-fun e!825278 () Bool)

(declare-fun lt!642806 () SeekEntryResult!12057)

(assert (=> b!1470181 (= e!825278 (bvsge (x!132194 lt!642806) #b01111111111111111111111111111110))))

(declare-fun b!1470182 () Bool)

(assert (=> b!1470182 (and (bvsge (index!50622 lt!642806) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642806) (size!48367 lt!642768)))))

(declare-fun res!998529 () Bool)

(assert (=> b!1470182 (= res!998529 (= (select (arr!47817 lt!642768) (index!50622 lt!642806)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825276 () Bool)

(assert (=> b!1470182 (=> res!998529 e!825276)))

(declare-fun b!1470183 () Bool)

(declare-fun e!825274 () SeekEntryResult!12057)

(assert (=> b!1470183 (= e!825274 (Intermediate!12057 false (toIndex!0 lt!642770 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470184 () Bool)

(assert (=> b!1470184 (= e!825274 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!642770 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!642770 lt!642768 mask!2687))))

(declare-fun b!1470185 () Bool)

(declare-fun e!825277 () SeekEntryResult!12057)

(assert (=> b!1470185 (= e!825277 (Intermediate!12057 true (toIndex!0 lt!642770 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155317 () Bool)

(assert (=> d!155317 e!825278))

(declare-fun c!135339 () Bool)

(assert (=> d!155317 (= c!135339 (and ((_ is Intermediate!12057) lt!642806) (undefined!12869 lt!642806)))))

(assert (=> d!155317 (= lt!642806 e!825277)))

(declare-fun c!135337 () Bool)

(assert (=> d!155317 (= c!135337 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!642807 () (_ BitVec 64))

(assert (=> d!155317 (= lt!642807 (select (arr!47817 lt!642768) (toIndex!0 lt!642770 mask!2687)))))

(assert (=> d!155317 (validMask!0 mask!2687)))

(assert (=> d!155317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642770 mask!2687) lt!642770 lt!642768 mask!2687) lt!642806)))

(declare-fun b!1470186 () Bool)

(assert (=> b!1470186 (and (bvsge (index!50622 lt!642806) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642806) (size!48367 lt!642768)))))

(assert (=> b!1470186 (= e!825276 (= (select (arr!47817 lt!642768) (index!50622 lt!642806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470187 () Bool)

(assert (=> b!1470187 (and (bvsge (index!50622 lt!642806) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642806) (size!48367 lt!642768)))))

(declare-fun res!998528 () Bool)

(assert (=> b!1470187 (= res!998528 (= (select (arr!47817 lt!642768) (index!50622 lt!642806)) lt!642770))))

(assert (=> b!1470187 (=> res!998528 e!825276)))

(declare-fun e!825275 () Bool)

(assert (=> b!1470187 (= e!825275 e!825276)))

(declare-fun b!1470188 () Bool)

(assert (=> b!1470188 (= e!825278 e!825275)))

(declare-fun res!998530 () Bool)

(assert (=> b!1470188 (= res!998530 (and ((_ is Intermediate!12057) lt!642806) (not (undefined!12869 lt!642806)) (bvslt (x!132194 lt!642806) #b01111111111111111111111111111110) (bvsge (x!132194 lt!642806) #b00000000000000000000000000000000) (bvsge (x!132194 lt!642806) #b00000000000000000000000000000000)))))

(assert (=> b!1470188 (=> (not res!998530) (not e!825275))))

(declare-fun b!1470189 () Bool)

(assert (=> b!1470189 (= e!825277 e!825274)))

(declare-fun c!135338 () Bool)

(assert (=> b!1470189 (= c!135338 (or (= lt!642807 lt!642770) (= (bvadd lt!642807 lt!642807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155317 c!135337) b!1470185))

(assert (= (and d!155317 (not c!135337)) b!1470189))

(assert (= (and b!1470189 c!135338) b!1470183))

(assert (= (and b!1470189 (not c!135338)) b!1470184))

(assert (= (and d!155317 c!135339) b!1470181))

(assert (= (and d!155317 (not c!135339)) b!1470188))

(assert (= (and b!1470188 res!998530) b!1470187))

(assert (= (and b!1470187 (not res!998528)) b!1470182))

(assert (= (and b!1470182 (not res!998529)) b!1470186))

(declare-fun m!1357311 () Bool)

(assert (=> b!1470182 m!1357311))

(assert (=> b!1470187 m!1357311))

(assert (=> b!1470184 m!1357241))

(declare-fun m!1357313 () Bool)

(assert (=> b!1470184 m!1357313))

(assert (=> b!1470184 m!1357313))

(declare-fun m!1357315 () Bool)

(assert (=> b!1470184 m!1357315))

(assert (=> b!1470186 m!1357311))

(assert (=> d!155317 m!1357241))

(declare-fun m!1357317 () Bool)

(assert (=> d!155317 m!1357317))

(assert (=> d!155317 m!1357229))

(assert (=> b!1470074 d!155317))

(declare-fun d!155323 () Bool)

(declare-fun lt!642817 () (_ BitVec 32))

(declare-fun lt!642816 () (_ BitVec 32))

(assert (=> d!155323 (= lt!642817 (bvmul (bvxor lt!642816 (bvlshr lt!642816 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155323 (= lt!642816 ((_ extract 31 0) (bvand (bvxor lt!642770 (bvlshr lt!642770 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155323 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!998531 (let ((h!35666 ((_ extract 31 0) (bvand (bvxor lt!642770 (bvlshr lt!642770 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132198 (bvmul (bvxor h!35666 (bvlshr h!35666 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132198 (bvlshr x!132198 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!998531 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!998531 #b00000000000000000000000000000000))))))

(assert (=> d!155323 (= (toIndex!0 lt!642770 mask!2687) (bvand (bvxor lt!642817 (bvlshr lt!642817 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1470074 d!155323))

(declare-fun b!1470200 () Bool)

(declare-fun e!825287 () Bool)

(declare-fun lt!642818 () SeekEntryResult!12057)

(assert (=> b!1470200 (= e!825287 (bvsge (x!132194 lt!642818) #b01111111111111111111111111111110))))

(declare-fun b!1470201 () Bool)

(assert (=> b!1470201 (and (bvsge (index!50622 lt!642818) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642818) (size!48367 lt!642768)))))

(declare-fun res!998533 () Bool)

(assert (=> b!1470201 (= res!998533 (= (select (arr!47817 lt!642768) (index!50622 lt!642818)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825285 () Bool)

(assert (=> b!1470201 (=> res!998533 e!825285)))

(declare-fun b!1470202 () Bool)

(declare-fun e!825283 () SeekEntryResult!12057)

(assert (=> b!1470202 (= e!825283 (Intermediate!12057 false index!646 x!665))))

(declare-fun b!1470203 () Bool)

(assert (=> b!1470203 (= e!825283 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!642770 lt!642768 mask!2687))))

(declare-fun b!1470204 () Bool)

(declare-fun e!825286 () SeekEntryResult!12057)

(assert (=> b!1470204 (= e!825286 (Intermediate!12057 true index!646 x!665))))

(declare-fun d!155325 () Bool)

(assert (=> d!155325 e!825287))

(declare-fun c!135346 () Bool)

(assert (=> d!155325 (= c!135346 (and ((_ is Intermediate!12057) lt!642818) (undefined!12869 lt!642818)))))

(assert (=> d!155325 (= lt!642818 e!825286)))

(declare-fun c!135344 () Bool)

(assert (=> d!155325 (= c!135344 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!642819 () (_ BitVec 64))

(assert (=> d!155325 (= lt!642819 (select (arr!47817 lt!642768) index!646))))

(assert (=> d!155325 (validMask!0 mask!2687)))

(assert (=> d!155325 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642770 lt!642768 mask!2687) lt!642818)))

(declare-fun b!1470205 () Bool)

(assert (=> b!1470205 (and (bvsge (index!50622 lt!642818) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642818) (size!48367 lt!642768)))))

(assert (=> b!1470205 (= e!825285 (= (select (arr!47817 lt!642768) (index!50622 lt!642818)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470206 () Bool)

(assert (=> b!1470206 (and (bvsge (index!50622 lt!642818) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642818) (size!48367 lt!642768)))))

(declare-fun res!998532 () Bool)

(assert (=> b!1470206 (= res!998532 (= (select (arr!47817 lt!642768) (index!50622 lt!642818)) lt!642770))))

(assert (=> b!1470206 (=> res!998532 e!825285)))

(declare-fun e!825284 () Bool)

(assert (=> b!1470206 (= e!825284 e!825285)))

(declare-fun b!1470207 () Bool)

(assert (=> b!1470207 (= e!825287 e!825284)))

(declare-fun res!998534 () Bool)

(assert (=> b!1470207 (= res!998534 (and ((_ is Intermediate!12057) lt!642818) (not (undefined!12869 lt!642818)) (bvslt (x!132194 lt!642818) #b01111111111111111111111111111110) (bvsge (x!132194 lt!642818) #b00000000000000000000000000000000) (bvsge (x!132194 lt!642818) x!665)))))

(assert (=> b!1470207 (=> (not res!998534) (not e!825284))))

(declare-fun b!1470208 () Bool)

(assert (=> b!1470208 (= e!825286 e!825283)))

(declare-fun c!135345 () Bool)

(assert (=> b!1470208 (= c!135345 (or (= lt!642819 lt!642770) (= (bvadd lt!642819 lt!642819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155325 c!135344) b!1470204))

(assert (= (and d!155325 (not c!135344)) b!1470208))

(assert (= (and b!1470208 c!135345) b!1470202))

(assert (= (and b!1470208 (not c!135345)) b!1470203))

(assert (= (and d!155325 c!135346) b!1470200))

(assert (= (and d!155325 (not c!135346)) b!1470207))

(assert (= (and b!1470207 res!998534) b!1470206))

(assert (= (and b!1470206 (not res!998532)) b!1470201))

(assert (= (and b!1470201 (not res!998533)) b!1470205))

(declare-fun m!1357319 () Bool)

(assert (=> b!1470201 m!1357319))

(assert (=> b!1470206 m!1357319))

(assert (=> b!1470203 m!1357297))

(assert (=> b!1470203 m!1357297))

(declare-fun m!1357321 () Bool)

(assert (=> b!1470203 m!1357321))

(assert (=> b!1470205 m!1357319))

(assert (=> d!155325 m!1357295))

(assert (=> d!155325 m!1357229))

(assert (=> b!1470078 d!155325))

(declare-fun b!1470229 () Bool)

(declare-fun e!825303 () Bool)

(declare-fun lt!642826 () SeekEntryResult!12057)

(assert (=> b!1470229 (= e!825303 (bvsge (x!132194 lt!642826) #b01111111111111111111111111111110))))

(declare-fun b!1470230 () Bool)

(assert (=> b!1470230 (and (bvsge (index!50622 lt!642826) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642826) (size!48367 a!2862)))))

(declare-fun res!998542 () Bool)

(assert (=> b!1470230 (= res!998542 (= (select (arr!47817 a!2862) (index!50622 lt!642826)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825301 () Bool)

(assert (=> b!1470230 (=> res!998542 e!825301)))

(declare-fun b!1470231 () Bool)

(declare-fun e!825298 () SeekEntryResult!12057)

(assert (=> b!1470231 (= e!825298 (Intermediate!12057 false index!646 x!665))))

(declare-fun b!1470232 () Bool)

(assert (=> b!1470232 (= e!825298 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47817 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470233 () Bool)

(declare-fun e!825302 () SeekEntryResult!12057)

(assert (=> b!1470233 (= e!825302 (Intermediate!12057 true index!646 x!665))))

(declare-fun d!155327 () Bool)

(assert (=> d!155327 e!825303))

(declare-fun c!135356 () Bool)

(assert (=> d!155327 (= c!135356 (and ((_ is Intermediate!12057) lt!642826) (undefined!12869 lt!642826)))))

(assert (=> d!155327 (= lt!642826 e!825302)))

(declare-fun c!135353 () Bool)

(assert (=> d!155327 (= c!135353 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!642827 () (_ BitVec 64))

(assert (=> d!155327 (= lt!642827 (select (arr!47817 a!2862) index!646))))

(assert (=> d!155327 (validMask!0 mask!2687)))

(assert (=> d!155327 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47817 a!2862) j!93) a!2862 mask!2687) lt!642826)))

(declare-fun b!1470234 () Bool)

(assert (=> b!1470234 (and (bvsge (index!50622 lt!642826) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642826) (size!48367 a!2862)))))

(assert (=> b!1470234 (= e!825301 (= (select (arr!47817 a!2862) (index!50622 lt!642826)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470235 () Bool)

(assert (=> b!1470235 (and (bvsge (index!50622 lt!642826) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642826) (size!48367 a!2862)))))

(declare-fun res!998541 () Bool)

(assert (=> b!1470235 (= res!998541 (= (select (arr!47817 a!2862) (index!50622 lt!642826)) (select (arr!47817 a!2862) j!93)))))

(assert (=> b!1470235 (=> res!998541 e!825301)))

(declare-fun e!825299 () Bool)

(assert (=> b!1470235 (= e!825299 e!825301)))

(declare-fun b!1470236 () Bool)

(assert (=> b!1470236 (= e!825303 e!825299)))

(declare-fun res!998543 () Bool)

(assert (=> b!1470236 (= res!998543 (and ((_ is Intermediate!12057) lt!642826) (not (undefined!12869 lt!642826)) (bvslt (x!132194 lt!642826) #b01111111111111111111111111111110) (bvsge (x!132194 lt!642826) #b00000000000000000000000000000000) (bvsge (x!132194 lt!642826) x!665)))))

(assert (=> b!1470236 (=> (not res!998543) (not e!825299))))

(declare-fun b!1470237 () Bool)

(assert (=> b!1470237 (= e!825302 e!825298)))

(declare-fun c!135354 () Bool)

(assert (=> b!1470237 (= c!135354 (or (= lt!642827 (select (arr!47817 a!2862) j!93)) (= (bvadd lt!642827 lt!642827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155327 c!135353) b!1470233))

(assert (= (and d!155327 (not c!135353)) b!1470237))

(assert (= (and b!1470237 c!135354) b!1470231))

(assert (= (and b!1470237 (not c!135354)) b!1470232))

(assert (= (and d!155327 c!135356) b!1470229))

(assert (= (and d!155327 (not c!135356)) b!1470236))

(assert (= (and b!1470236 res!998543) b!1470235))

(assert (= (and b!1470235 (not res!998541)) b!1470230))

(assert (= (and b!1470230 (not res!998542)) b!1470234))

(declare-fun m!1357323 () Bool)

(assert (=> b!1470230 m!1357323))

(assert (=> b!1470235 m!1357323))

(assert (=> b!1470232 m!1357297))

(assert (=> b!1470232 m!1357297))

(assert (=> b!1470232 m!1357203))

(declare-fun m!1357325 () Bool)

(assert (=> b!1470232 m!1357325))

(assert (=> b!1470234 m!1357323))

(declare-fun m!1357327 () Bool)

(assert (=> d!155327 m!1357327))

(assert (=> d!155327 m!1357229))

(assert (=> b!1470067 d!155327))

(declare-fun d!155329 () Bool)

(assert (=> d!155329 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125610 d!155329))

(declare-fun d!155337 () Bool)

(assert (=> d!155337 (= (array_inv!36845 a!2862) (bvsge (size!48367 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125610 d!155337))

(declare-fun d!155339 () Bool)

(declare-fun res!998566 () Bool)

(declare-fun e!825339 () Bool)

(assert (=> d!155339 (=> res!998566 e!825339)))

(assert (=> d!155339 (= res!998566 (bvsge #b00000000000000000000000000000000 (size!48367 a!2862)))))

(assert (=> d!155339 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34315) e!825339)))

(declare-fun b!1470283 () Bool)

(declare-fun e!825337 () Bool)

(declare-fun e!825338 () Bool)

(assert (=> b!1470283 (= e!825337 e!825338)))

(declare-fun c!135371 () Bool)

(assert (=> b!1470283 (= c!135371 (validKeyInArray!0 (select (arr!47817 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470284 () Bool)

(declare-fun call!67704 () Bool)

(assert (=> b!1470284 (= e!825338 call!67704)))

(declare-fun b!1470285 () Bool)

(declare-fun e!825336 () Bool)

(declare-fun contains!9896 (List!34318 (_ BitVec 64)) Bool)

(assert (=> b!1470285 (= e!825336 (contains!9896 Nil!34315 (select (arr!47817 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470286 () Bool)

(assert (=> b!1470286 (= e!825339 e!825337)))

(declare-fun res!998564 () Bool)

(assert (=> b!1470286 (=> (not res!998564) (not e!825337))))

(assert (=> b!1470286 (= res!998564 (not e!825336))))

(declare-fun res!998565 () Bool)

(assert (=> b!1470286 (=> (not res!998565) (not e!825336))))

(assert (=> b!1470286 (= res!998565 (validKeyInArray!0 (select (arr!47817 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470287 () Bool)

(assert (=> b!1470287 (= e!825338 call!67704)))

(declare-fun bm!67701 () Bool)

(assert (=> bm!67701 (= call!67704 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135371 (Cons!34314 (select (arr!47817 a!2862) #b00000000000000000000000000000000) Nil!34315) Nil!34315)))))

(assert (= (and d!155339 (not res!998566)) b!1470286))

(assert (= (and b!1470286 res!998565) b!1470285))

(assert (= (and b!1470286 res!998564) b!1470283))

(assert (= (and b!1470283 c!135371) b!1470287))

(assert (= (and b!1470283 (not c!135371)) b!1470284))

(assert (= (or b!1470287 b!1470284) bm!67701))

(declare-fun m!1357353 () Bool)

(assert (=> b!1470283 m!1357353))

(assert (=> b!1470283 m!1357353))

(declare-fun m!1357355 () Bool)

(assert (=> b!1470283 m!1357355))

(assert (=> b!1470285 m!1357353))

(assert (=> b!1470285 m!1357353))

(declare-fun m!1357357 () Bool)

(assert (=> b!1470285 m!1357357))

(assert (=> b!1470286 m!1357353))

(assert (=> b!1470286 m!1357353))

(assert (=> b!1470286 m!1357355))

(assert (=> bm!67701 m!1357353))

(declare-fun m!1357359 () Bool)

(assert (=> bm!67701 m!1357359))

(assert (=> b!1470077 d!155339))

(declare-fun b!1470315 () Bool)

(declare-fun e!825361 () Bool)

(declare-fun call!67711 () Bool)

(assert (=> b!1470315 (= e!825361 call!67711)))

(declare-fun b!1470316 () Bool)

(declare-fun e!825363 () Bool)

(assert (=> b!1470316 (= e!825363 e!825361)))

(declare-fun c!135378 () Bool)

(assert (=> b!1470316 (= c!135378 (validKeyInArray!0 (select (arr!47817 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470317 () Bool)

(declare-fun e!825362 () Bool)

(assert (=> b!1470317 (= e!825362 call!67711)))

(declare-fun bm!67708 () Bool)

(assert (=> bm!67708 (= call!67711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155343 () Bool)

(declare-fun res!998583 () Bool)

(assert (=> d!155343 (=> res!998583 e!825363)))

(assert (=> d!155343 (= res!998583 (bvsge #b00000000000000000000000000000000 (size!48367 a!2862)))))

(assert (=> d!155343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!825363)))

(declare-fun b!1470318 () Bool)

(assert (=> b!1470318 (= e!825361 e!825362)))

(declare-fun lt!642868 () (_ BitVec 64))

(assert (=> b!1470318 (= lt!642868 (select (arr!47817 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!642867 () Unit!49454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99058 (_ BitVec 64) (_ BitVec 32)) Unit!49454)

(assert (=> b!1470318 (= lt!642867 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642868 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1470318 (arrayContainsKey!0 a!2862 lt!642868 #b00000000000000000000000000000000)))

(declare-fun lt!642866 () Unit!49454)

(assert (=> b!1470318 (= lt!642866 lt!642867)))

(declare-fun res!998582 () Bool)

(assert (=> b!1470318 (= res!998582 (= (seekEntryOrOpen!0 (select (arr!47817 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12057 #b00000000000000000000000000000000)))))

(assert (=> b!1470318 (=> (not res!998582) (not e!825362))))

(assert (= (and d!155343 (not res!998583)) b!1470316))

(assert (= (and b!1470316 c!135378) b!1470318))

(assert (= (and b!1470316 (not c!135378)) b!1470315))

(assert (= (and b!1470318 res!998582) b!1470317))

(assert (= (or b!1470317 b!1470315) bm!67708))

(assert (=> b!1470316 m!1357353))

(assert (=> b!1470316 m!1357353))

(assert (=> b!1470316 m!1357355))

(declare-fun m!1357379 () Bool)

(assert (=> bm!67708 m!1357379))

(assert (=> b!1470318 m!1357353))

(declare-fun m!1357381 () Bool)

(assert (=> b!1470318 m!1357381))

(declare-fun m!1357383 () Bool)

(assert (=> b!1470318 m!1357383))

(assert (=> b!1470318 m!1357353))

(declare-fun m!1357385 () Bool)

(assert (=> b!1470318 m!1357385))

(assert (=> b!1470070 d!155343))

(declare-fun d!155353 () Bool)

(assert (=> d!155353 (= (validKeyInArray!0 (select (arr!47817 a!2862) j!93)) (and (not (= (select (arr!47817 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47817 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1470081 d!155353))

(declare-fun b!1470319 () Bool)

(declare-fun e!825364 () SeekEntryResult!12057)

(assert (=> b!1470319 (= e!825364 Undefined!12057)))

(declare-fun d!155355 () Bool)

(declare-fun lt!642870 () SeekEntryResult!12057)

(assert (=> d!155355 (and (or ((_ is Undefined!12057) lt!642870) (not ((_ is Found!12057) lt!642870)) (and (bvsge (index!50621 lt!642870) #b00000000000000000000000000000000) (bvslt (index!50621 lt!642870) (size!48367 a!2862)))) (or ((_ is Undefined!12057) lt!642870) ((_ is Found!12057) lt!642870) (not ((_ is MissingZero!12057) lt!642870)) (and (bvsge (index!50620 lt!642870) #b00000000000000000000000000000000) (bvslt (index!50620 lt!642870) (size!48367 a!2862)))) (or ((_ is Undefined!12057) lt!642870) ((_ is Found!12057) lt!642870) ((_ is MissingZero!12057) lt!642870) (not ((_ is MissingVacant!12057) lt!642870)) (and (bvsge (index!50623 lt!642870) #b00000000000000000000000000000000) (bvslt (index!50623 lt!642870) (size!48367 a!2862)))) (or ((_ is Undefined!12057) lt!642870) (ite ((_ is Found!12057) lt!642870) (= (select (arr!47817 a!2862) (index!50621 lt!642870)) (select (arr!47817 a!2862) j!93)) (ite ((_ is MissingZero!12057) lt!642870) (= (select (arr!47817 a!2862) (index!50620 lt!642870)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12057) lt!642870) (= (select (arr!47817 a!2862) (index!50623 lt!642870)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155355 (= lt!642870 e!825364)))

(declare-fun c!135379 () Bool)

(declare-fun lt!642869 () SeekEntryResult!12057)

(assert (=> d!155355 (= c!135379 (and ((_ is Intermediate!12057) lt!642869) (undefined!12869 lt!642869)))))

(assert (=> d!155355 (= lt!642869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687) (select (arr!47817 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155355 (validMask!0 mask!2687)))

(assert (=> d!155355 (= (seekEntryOrOpen!0 (select (arr!47817 a!2862) j!93) a!2862 mask!2687) lt!642870)))

(declare-fun b!1470320 () Bool)

(declare-fun e!825365 () SeekEntryResult!12057)

(assert (=> b!1470320 (= e!825365 (MissingZero!12057 (index!50622 lt!642869)))))

(declare-fun b!1470321 () Bool)

(declare-fun c!135380 () Bool)

(declare-fun lt!642871 () (_ BitVec 64))

(assert (=> b!1470321 (= c!135380 (= lt!642871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825366 () SeekEntryResult!12057)

(assert (=> b!1470321 (= e!825366 e!825365)))

(declare-fun b!1470322 () Bool)

(assert (=> b!1470322 (= e!825365 (seekKeyOrZeroReturnVacant!0 (x!132194 lt!642869) (index!50622 lt!642869) (index!50622 lt!642869) (select (arr!47817 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470323 () Bool)

(assert (=> b!1470323 (= e!825366 (Found!12057 (index!50622 lt!642869)))))

(declare-fun b!1470324 () Bool)

(assert (=> b!1470324 (= e!825364 e!825366)))

(assert (=> b!1470324 (= lt!642871 (select (arr!47817 a!2862) (index!50622 lt!642869)))))

(declare-fun c!135381 () Bool)

(assert (=> b!1470324 (= c!135381 (= lt!642871 (select (arr!47817 a!2862) j!93)))))

(assert (= (and d!155355 c!135379) b!1470319))

(assert (= (and d!155355 (not c!135379)) b!1470324))

(assert (= (and b!1470324 c!135381) b!1470323))

(assert (= (and b!1470324 (not c!135381)) b!1470321))

(assert (= (and b!1470321 c!135380) b!1470320))

(assert (= (and b!1470321 (not c!135380)) b!1470322))

(declare-fun m!1357387 () Bool)

(assert (=> d!155355 m!1357387))

(assert (=> d!155355 m!1357225))

(assert (=> d!155355 m!1357203))

(assert (=> d!155355 m!1357227))

(declare-fun m!1357389 () Bool)

(assert (=> d!155355 m!1357389))

(assert (=> d!155355 m!1357229))

(assert (=> d!155355 m!1357203))

(assert (=> d!155355 m!1357225))

(declare-fun m!1357391 () Bool)

(assert (=> d!155355 m!1357391))

(assert (=> b!1470322 m!1357203))

(declare-fun m!1357393 () Bool)

(assert (=> b!1470322 m!1357393))

(declare-fun m!1357395 () Bool)

(assert (=> b!1470324 m!1357395))

(assert (=> b!1470079 d!155355))

(declare-fun b!1470325 () Bool)

(declare-fun e!825367 () Bool)

(declare-fun call!67712 () Bool)

(assert (=> b!1470325 (= e!825367 call!67712)))

(declare-fun b!1470326 () Bool)

(declare-fun e!825369 () Bool)

(assert (=> b!1470326 (= e!825369 e!825367)))

(declare-fun c!135382 () Bool)

(assert (=> b!1470326 (= c!135382 (validKeyInArray!0 (select (arr!47817 a!2862) j!93)))))

(declare-fun b!1470327 () Bool)

(declare-fun e!825368 () Bool)

(assert (=> b!1470327 (= e!825368 call!67712)))

(declare-fun bm!67709 () Bool)

(assert (=> bm!67709 (= call!67712 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155357 () Bool)

(declare-fun res!998585 () Bool)

(assert (=> d!155357 (=> res!998585 e!825369)))

(assert (=> d!155357 (= res!998585 (bvsge j!93 (size!48367 a!2862)))))

(assert (=> d!155357 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825369)))

(declare-fun b!1470328 () Bool)

(assert (=> b!1470328 (= e!825367 e!825368)))

(declare-fun lt!642874 () (_ BitVec 64))

(assert (=> b!1470328 (= lt!642874 (select (arr!47817 a!2862) j!93))))

(declare-fun lt!642873 () Unit!49454)

(assert (=> b!1470328 (= lt!642873 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642874 j!93))))

(assert (=> b!1470328 (arrayContainsKey!0 a!2862 lt!642874 #b00000000000000000000000000000000)))

(declare-fun lt!642872 () Unit!49454)

(assert (=> b!1470328 (= lt!642872 lt!642873)))

(declare-fun res!998584 () Bool)

(assert (=> b!1470328 (= res!998584 (= (seekEntryOrOpen!0 (select (arr!47817 a!2862) j!93) a!2862 mask!2687) (Found!12057 j!93)))))

(assert (=> b!1470328 (=> (not res!998584) (not e!825368))))

(assert (= (and d!155357 (not res!998585)) b!1470326))

(assert (= (and b!1470326 c!135382) b!1470328))

(assert (= (and b!1470326 (not c!135382)) b!1470325))

(assert (= (and b!1470328 res!998584) b!1470327))

(assert (= (or b!1470327 b!1470325) bm!67709))

(assert (=> b!1470326 m!1357203))

(assert (=> b!1470326 m!1357203))

(assert (=> b!1470326 m!1357239))

(declare-fun m!1357397 () Bool)

(assert (=> bm!67709 m!1357397))

(assert (=> b!1470328 m!1357203))

(declare-fun m!1357399 () Bool)

(assert (=> b!1470328 m!1357399))

(declare-fun m!1357401 () Bool)

(assert (=> b!1470328 m!1357401))

(assert (=> b!1470328 m!1357203))

(assert (=> b!1470328 m!1357233))

(assert (=> b!1470079 d!155357))

(declare-fun d!155359 () Bool)

(assert (=> d!155359 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642881 () Unit!49454)

(declare-fun choose!38 (array!99058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49454)

(assert (=> d!155359 (= lt!642881 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155359 (validMask!0 mask!2687)))

(assert (=> d!155359 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!642881)))

(declare-fun bs!42492 () Bool)

(assert (= bs!42492 d!155359))

(assert (=> bs!42492 m!1357235))

(declare-fun m!1357403 () Bool)

(assert (=> bs!42492 m!1357403))

(assert (=> bs!42492 m!1357229))

(assert (=> b!1470079 d!155359))

(declare-fun b!1470341 () Bool)

(declare-fun e!825380 () Bool)

(declare-fun lt!642882 () SeekEntryResult!12057)

(assert (=> b!1470341 (= e!825380 (bvsge (x!132194 lt!642882) #b01111111111111111111111111111110))))

(declare-fun b!1470342 () Bool)

(assert (=> b!1470342 (and (bvsge (index!50622 lt!642882) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642882) (size!48367 a!2862)))))

(declare-fun res!998587 () Bool)

(assert (=> b!1470342 (= res!998587 (= (select (arr!47817 a!2862) (index!50622 lt!642882)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825378 () Bool)

(assert (=> b!1470342 (=> res!998587 e!825378)))

(declare-fun e!825376 () SeekEntryResult!12057)

(declare-fun b!1470343 () Bool)

(assert (=> b!1470343 (= e!825376 (Intermediate!12057 false (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470344 () Bool)

(assert (=> b!1470344 (= e!825376 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47817 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470345 () Bool)

(declare-fun e!825379 () SeekEntryResult!12057)

(assert (=> b!1470345 (= e!825379 (Intermediate!12057 true (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155361 () Bool)

(assert (=> d!155361 e!825380))

(declare-fun c!135391 () Bool)

(assert (=> d!155361 (= c!135391 (and ((_ is Intermediate!12057) lt!642882) (undefined!12869 lt!642882)))))

(assert (=> d!155361 (= lt!642882 e!825379)))

(declare-fun c!135389 () Bool)

(assert (=> d!155361 (= c!135389 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!642883 () (_ BitVec 64))

(assert (=> d!155361 (= lt!642883 (select (arr!47817 a!2862) (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687)))))

(assert (=> d!155361 (validMask!0 mask!2687)))

(assert (=> d!155361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687) (select (arr!47817 a!2862) j!93) a!2862 mask!2687) lt!642882)))

(declare-fun b!1470346 () Bool)

(assert (=> b!1470346 (and (bvsge (index!50622 lt!642882) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642882) (size!48367 a!2862)))))

(assert (=> b!1470346 (= e!825378 (= (select (arr!47817 a!2862) (index!50622 lt!642882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1470347 () Bool)

(assert (=> b!1470347 (and (bvsge (index!50622 lt!642882) #b00000000000000000000000000000000) (bvslt (index!50622 lt!642882) (size!48367 a!2862)))))

(declare-fun res!998586 () Bool)

(assert (=> b!1470347 (= res!998586 (= (select (arr!47817 a!2862) (index!50622 lt!642882)) (select (arr!47817 a!2862) j!93)))))

(assert (=> b!1470347 (=> res!998586 e!825378)))

(declare-fun e!825377 () Bool)

(assert (=> b!1470347 (= e!825377 e!825378)))

(declare-fun b!1470348 () Bool)

(assert (=> b!1470348 (= e!825380 e!825377)))

(declare-fun res!998588 () Bool)

(assert (=> b!1470348 (= res!998588 (and ((_ is Intermediate!12057) lt!642882) (not (undefined!12869 lt!642882)) (bvslt (x!132194 lt!642882) #b01111111111111111111111111111110) (bvsge (x!132194 lt!642882) #b00000000000000000000000000000000) (bvsge (x!132194 lt!642882) #b00000000000000000000000000000000)))))

(assert (=> b!1470348 (=> (not res!998588) (not e!825377))))

(declare-fun b!1470349 () Bool)

(assert (=> b!1470349 (= e!825379 e!825376)))

(declare-fun c!135390 () Bool)

(assert (=> b!1470349 (= c!135390 (or (= lt!642883 (select (arr!47817 a!2862) j!93)) (= (bvadd lt!642883 lt!642883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155361 c!135389) b!1470345))

(assert (= (and d!155361 (not c!135389)) b!1470349))

(assert (= (and b!1470349 c!135390) b!1470343))

(assert (= (and b!1470349 (not c!135390)) b!1470344))

(assert (= (and d!155361 c!135391) b!1470341))

(assert (= (and d!155361 (not c!135391)) b!1470348))

(assert (= (and b!1470348 res!998588) b!1470347))

(assert (= (and b!1470347 (not res!998586)) b!1470342))

(assert (= (and b!1470342 (not res!998587)) b!1470346))

(declare-fun m!1357405 () Bool)

(assert (=> b!1470342 m!1357405))

(assert (=> b!1470347 m!1357405))

(assert (=> b!1470344 m!1357225))

(declare-fun m!1357407 () Bool)

(assert (=> b!1470344 m!1357407))

(assert (=> b!1470344 m!1357407))

(assert (=> b!1470344 m!1357203))

(declare-fun m!1357409 () Bool)

(assert (=> b!1470344 m!1357409))

(assert (=> b!1470346 m!1357405))

(assert (=> d!155361 m!1357225))

(declare-fun m!1357413 () Bool)

(assert (=> d!155361 m!1357413))

(assert (=> d!155361 m!1357229))

(assert (=> b!1470069 d!155361))

(declare-fun d!155363 () Bool)

(declare-fun lt!642887 () (_ BitVec 32))

(declare-fun lt!642886 () (_ BitVec 32))

(assert (=> d!155363 (= lt!642887 (bvmul (bvxor lt!642886 (bvlshr lt!642886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155363 (= lt!642886 ((_ extract 31 0) (bvand (bvxor (select (arr!47817 a!2862) j!93) (bvlshr (select (arr!47817 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155363 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!998531 (let ((h!35666 ((_ extract 31 0) (bvand (bvxor (select (arr!47817 a!2862) j!93) (bvlshr (select (arr!47817 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132198 (bvmul (bvxor h!35666 (bvlshr h!35666 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132198 (bvlshr x!132198 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!998531 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!998531 #b00000000000000000000000000000000))))))

(assert (=> d!155363 (= (toIndex!0 (select (arr!47817 a!2862) j!93) mask!2687) (bvand (bvxor lt!642887 (bvlshr lt!642887 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1470069 d!155363))

(check-sat (not bm!67708) (not bm!67709) (not d!155325) (not d!155317) (not b!1470139) (not b!1470286) (not b!1470318) (not b!1470344) (not d!155361) (not b!1470285) (not d!155327) (not b!1470232) (not d!155355) (not d!155313) (not b!1470322) (not b!1470184) (not d!155311) (not b!1470203) (not b!1470160) (not b!1470316) (not d!155359) (not b!1470283) (not b!1470326) (not bm!67701) (not b!1470328))
(check-sat)
