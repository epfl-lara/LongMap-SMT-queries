; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122954 () Bool)

(assert start!122954)

(declare-fun b!1426345 () Bool)

(declare-fun res!961787 () Bool)

(declare-fun e!805671 () Bool)

(assert (=> b!1426345 (=> (not res!961787) (not e!805671))))

(declare-datatypes ((array!97319 0))(
  ( (array!97320 (arr!46977 (Array (_ BitVec 32) (_ BitVec 64))) (size!47527 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97319)

(declare-datatypes ((List!33487 0))(
  ( (Nil!33484) (Cons!33483 (h!34785 (_ BitVec 64)) (t!48181 List!33487)) )
))
(declare-fun arrayNoDuplicates!0 (array!97319 (_ BitVec 32) List!33487) Bool)

(assert (=> b!1426345 (= res!961787 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33484))))

(declare-fun b!1426346 () Bool)

(declare-fun res!961778 () Bool)

(assert (=> b!1426346 (=> (not res!961778) (not e!805671))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426346 (= res!961778 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47527 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47527 a!2831))))))

(declare-fun e!805672 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1426347 () Bool)

(declare-datatypes ((SeekEntryResult!11256 0))(
  ( (MissingZero!11256 (index!47416 (_ BitVec 32))) (Found!11256 (index!47417 (_ BitVec 32))) (Intermediate!11256 (undefined!12068 Bool) (index!47418 (_ BitVec 32)) (x!129042 (_ BitVec 32))) (Undefined!11256) (MissingVacant!11256 (index!47419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97319 (_ BitVec 32)) SeekEntryResult!11256)

(assert (=> b!1426347 (= e!805672 (not (= (seekEntryOrOpen!0 (select (arr!46977 a!2831) j!81) a!2831 mask!2608) (Found!11256 j!81))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97319 (_ BitVec 32)) Bool)

(assert (=> b!1426347 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48258 0))(
  ( (Unit!48259) )
))
(declare-fun lt!628124 () Unit!48258)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48258)

(assert (=> b!1426347 (= lt!628124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426348 () Bool)

(declare-fun res!961779 () Bool)

(assert (=> b!1426348 (=> (not res!961779) (not e!805672))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426348 (= res!961779 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426349 () Bool)

(declare-fun res!961782 () Bool)

(assert (=> b!1426349 (=> (not res!961782) (not e!805672))))

(declare-fun lt!628123 () SeekEntryResult!11256)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97319 (_ BitVec 32)) SeekEntryResult!11256)

(assert (=> b!1426349 (= res!961782 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46977 a!2831) j!81) a!2831 mask!2608) lt!628123))))

(declare-fun b!1426350 () Bool)

(declare-fun res!961784 () Bool)

(assert (=> b!1426350 (=> (not res!961784) (not e!805671))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426350 (= res!961784 (and (= (size!47527 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47527 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47527 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426351 () Bool)

(declare-fun e!805670 () Bool)

(assert (=> b!1426351 (= e!805671 e!805670)))

(declare-fun res!961783 () Bool)

(assert (=> b!1426351 (=> (not res!961783) (not e!805670))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426351 (= res!961783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608) (select (arr!46977 a!2831) j!81) a!2831 mask!2608) lt!628123))))

(assert (=> b!1426351 (= lt!628123 (Intermediate!11256 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426352 () Bool)

(declare-fun res!961786 () Bool)

(assert (=> b!1426352 (=> (not res!961786) (not e!805671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426352 (= res!961786 (validKeyInArray!0 (select (arr!46977 a!2831) j!81)))))

(declare-fun b!1426353 () Bool)

(declare-fun res!961780 () Bool)

(assert (=> b!1426353 (=> (not res!961780) (not e!805671))))

(assert (=> b!1426353 (= res!961780 (validKeyInArray!0 (select (arr!46977 a!2831) i!982)))))

(declare-fun res!961789 () Bool)

(assert (=> start!122954 (=> (not res!961789) (not e!805671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122954 (= res!961789 (validMask!0 mask!2608))))

(assert (=> start!122954 e!805671))

(assert (=> start!122954 true))

(declare-fun array_inv!36005 (array!97319) Bool)

(assert (=> start!122954 (array_inv!36005 a!2831)))

(declare-fun b!1426354 () Bool)

(assert (=> b!1426354 (= e!805670 e!805672)))

(declare-fun res!961781 () Bool)

(assert (=> b!1426354 (=> (not res!961781) (not e!805672))))

(declare-fun lt!628122 () SeekEntryResult!11256)

(declare-fun lt!628121 () array!97319)

(declare-fun lt!628125 () (_ BitVec 64))

(assert (=> b!1426354 (= res!961781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628125 mask!2608) lt!628125 lt!628121 mask!2608) lt!628122))))

(assert (=> b!1426354 (= lt!628122 (Intermediate!11256 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426354 (= lt!628125 (select (store (arr!46977 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426354 (= lt!628121 (array!97320 (store (arr!46977 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47527 a!2831)))))

(declare-fun b!1426355 () Bool)

(declare-fun res!961788 () Bool)

(assert (=> b!1426355 (=> (not res!961788) (not e!805672))))

(assert (=> b!1426355 (= res!961788 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628125 lt!628121 mask!2608) lt!628122))))

(declare-fun b!1426356 () Bool)

(declare-fun res!961785 () Bool)

(assert (=> b!1426356 (=> (not res!961785) (not e!805671))))

(assert (=> b!1426356 (= res!961785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122954 res!961789) b!1426350))

(assert (= (and b!1426350 res!961784) b!1426353))

(assert (= (and b!1426353 res!961780) b!1426352))

(assert (= (and b!1426352 res!961786) b!1426356))

(assert (= (and b!1426356 res!961785) b!1426345))

(assert (= (and b!1426345 res!961787) b!1426346))

(assert (= (and b!1426346 res!961778) b!1426351))

(assert (= (and b!1426351 res!961783) b!1426354))

(assert (= (and b!1426354 res!961781) b!1426349))

(assert (= (and b!1426349 res!961782) b!1426355))

(assert (= (and b!1426355 res!961788) b!1426348))

(assert (= (and b!1426348 res!961779) b!1426347))

(declare-fun m!1316957 () Bool)

(assert (=> start!122954 m!1316957))

(declare-fun m!1316959 () Bool)

(assert (=> start!122954 m!1316959))

(declare-fun m!1316961 () Bool)

(assert (=> b!1426354 m!1316961))

(assert (=> b!1426354 m!1316961))

(declare-fun m!1316963 () Bool)

(assert (=> b!1426354 m!1316963))

(declare-fun m!1316965 () Bool)

(assert (=> b!1426354 m!1316965))

(declare-fun m!1316967 () Bool)

(assert (=> b!1426354 m!1316967))

(declare-fun m!1316969 () Bool)

(assert (=> b!1426352 m!1316969))

(assert (=> b!1426352 m!1316969))

(declare-fun m!1316971 () Bool)

(assert (=> b!1426352 m!1316971))

(declare-fun m!1316973 () Bool)

(assert (=> b!1426356 m!1316973))

(assert (=> b!1426351 m!1316969))

(assert (=> b!1426351 m!1316969))

(declare-fun m!1316975 () Bool)

(assert (=> b!1426351 m!1316975))

(assert (=> b!1426351 m!1316975))

(assert (=> b!1426351 m!1316969))

(declare-fun m!1316977 () Bool)

(assert (=> b!1426351 m!1316977))

(declare-fun m!1316979 () Bool)

(assert (=> b!1426345 m!1316979))

(assert (=> b!1426347 m!1316969))

(assert (=> b!1426347 m!1316969))

(declare-fun m!1316981 () Bool)

(assert (=> b!1426347 m!1316981))

(declare-fun m!1316983 () Bool)

(assert (=> b!1426347 m!1316983))

(declare-fun m!1316985 () Bool)

(assert (=> b!1426347 m!1316985))

(declare-fun m!1316987 () Bool)

(assert (=> b!1426355 m!1316987))

(assert (=> b!1426349 m!1316969))

(assert (=> b!1426349 m!1316969))

(declare-fun m!1316989 () Bool)

(assert (=> b!1426349 m!1316989))

(declare-fun m!1316991 () Bool)

(assert (=> b!1426353 m!1316991))

(assert (=> b!1426353 m!1316991))

(declare-fun m!1316993 () Bool)

(assert (=> b!1426353 m!1316993))

(check-sat (not start!122954) (not b!1426347) (not b!1426356) (not b!1426353) (not b!1426351) (not b!1426352) (not b!1426349) (not b!1426345) (not b!1426355) (not b!1426354))
(check-sat)
(get-model)

(declare-fun b!1426401 () Bool)

(declare-fun e!805693 () Bool)

(declare-fun call!67324 () Bool)

(assert (=> b!1426401 (= e!805693 call!67324)))

(declare-fun b!1426402 () Bool)

(declare-fun e!805692 () Bool)

(assert (=> b!1426402 (= e!805692 call!67324)))

(declare-fun b!1426403 () Bool)

(declare-fun e!805694 () Bool)

(assert (=> b!1426403 (= e!805694 e!805692)))

(declare-fun c!131772 () Bool)

(assert (=> b!1426403 (= c!131772 (validKeyInArray!0 (select (arr!46977 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153171 () Bool)

(declare-fun res!961830 () Bool)

(assert (=> d!153171 (=> res!961830 e!805694)))

(assert (=> d!153171 (= res!961830 (bvsge #b00000000000000000000000000000000 (size!47527 a!2831)))))

(assert (=> d!153171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!805694)))

(declare-fun b!1426404 () Bool)

(assert (=> b!1426404 (= e!805692 e!805693)))

(declare-fun lt!628148 () (_ BitVec 64))

(assert (=> b!1426404 (= lt!628148 (select (arr!46977 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628149 () Unit!48258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97319 (_ BitVec 64) (_ BitVec 32)) Unit!48258)

(assert (=> b!1426404 (= lt!628149 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628148 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1426404 (arrayContainsKey!0 a!2831 lt!628148 #b00000000000000000000000000000000)))

(declare-fun lt!628147 () Unit!48258)

(assert (=> b!1426404 (= lt!628147 lt!628149)))

(declare-fun res!961831 () Bool)

(assert (=> b!1426404 (= res!961831 (= (seekEntryOrOpen!0 (select (arr!46977 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11256 #b00000000000000000000000000000000)))))

(assert (=> b!1426404 (=> (not res!961831) (not e!805693))))

(declare-fun bm!67321 () Bool)

(assert (=> bm!67321 (= call!67324 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153171 (not res!961830)) b!1426403))

(assert (= (and b!1426403 c!131772) b!1426404))

(assert (= (and b!1426403 (not c!131772)) b!1426402))

(assert (= (and b!1426404 res!961831) b!1426401))

(assert (= (or b!1426401 b!1426402) bm!67321))

(declare-fun m!1317033 () Bool)

(assert (=> b!1426403 m!1317033))

(assert (=> b!1426403 m!1317033))

(declare-fun m!1317035 () Bool)

(assert (=> b!1426403 m!1317035))

(assert (=> b!1426404 m!1317033))

(declare-fun m!1317037 () Bool)

(assert (=> b!1426404 m!1317037))

(declare-fun m!1317039 () Bool)

(assert (=> b!1426404 m!1317039))

(assert (=> b!1426404 m!1317033))

(declare-fun m!1317041 () Bool)

(assert (=> b!1426404 m!1317041))

(declare-fun m!1317043 () Bool)

(assert (=> bm!67321 m!1317043))

(assert (=> b!1426356 d!153171))

(declare-fun b!1426423 () Bool)

(declare-fun e!805707 () Bool)

(declare-fun lt!628155 () SeekEntryResult!11256)

(assert (=> b!1426423 (= e!805707 (bvsge (x!129042 lt!628155) #b01111111111111111111111111111110))))

(declare-fun b!1426424 () Bool)

(assert (=> b!1426424 (and (bvsge (index!47418 lt!628155) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628155) (size!47527 a!2831)))))

(declare-fun res!961838 () Bool)

(assert (=> b!1426424 (= res!961838 (= (select (arr!46977 a!2831) (index!47418 lt!628155)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805709 () Bool)

(assert (=> b!1426424 (=> res!961838 e!805709)))

(declare-fun b!1426425 () Bool)

(declare-fun e!805706 () SeekEntryResult!11256)

(assert (=> b!1426425 (= e!805706 (Intermediate!11256 false (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426426 () Bool)

(declare-fun e!805705 () SeekEntryResult!11256)

(assert (=> b!1426426 (= e!805705 e!805706)))

(declare-fun c!131779 () Bool)

(declare-fun lt!628154 () (_ BitVec 64))

(assert (=> b!1426426 (= c!131779 (or (= lt!628154 (select (arr!46977 a!2831) j!81)) (= (bvadd lt!628154 lt!628154) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426427 () Bool)

(declare-fun e!805708 () Bool)

(assert (=> b!1426427 (= e!805707 e!805708)))

(declare-fun res!961840 () Bool)

(get-info :version)

(assert (=> b!1426427 (= res!961840 (and ((_ is Intermediate!11256) lt!628155) (not (undefined!12068 lt!628155)) (bvslt (x!129042 lt!628155) #b01111111111111111111111111111110) (bvsge (x!129042 lt!628155) #b00000000000000000000000000000000) (bvsge (x!129042 lt!628155) #b00000000000000000000000000000000)))))

(assert (=> b!1426427 (=> (not res!961840) (not e!805708))))

(declare-fun b!1426428 () Bool)

(assert (=> b!1426428 (and (bvsge (index!47418 lt!628155) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628155) (size!47527 a!2831)))))

(assert (=> b!1426428 (= e!805709 (= (select (arr!46977 a!2831) (index!47418 lt!628155)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426429 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426429 (= e!805706 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46977 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153173 () Bool)

(assert (=> d!153173 e!805707))

(declare-fun c!131780 () Bool)

(assert (=> d!153173 (= c!131780 (and ((_ is Intermediate!11256) lt!628155) (undefined!12068 lt!628155)))))

(assert (=> d!153173 (= lt!628155 e!805705)))

(declare-fun c!131781 () Bool)

(assert (=> d!153173 (= c!131781 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153173 (= lt!628154 (select (arr!46977 a!2831) (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608)))))

(assert (=> d!153173 (validMask!0 mask!2608)))

(assert (=> d!153173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608) (select (arr!46977 a!2831) j!81) a!2831 mask!2608) lt!628155)))

(declare-fun b!1426430 () Bool)

(assert (=> b!1426430 (= e!805705 (Intermediate!11256 true (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426431 () Bool)

(assert (=> b!1426431 (and (bvsge (index!47418 lt!628155) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628155) (size!47527 a!2831)))))

(declare-fun res!961839 () Bool)

(assert (=> b!1426431 (= res!961839 (= (select (arr!46977 a!2831) (index!47418 lt!628155)) (select (arr!46977 a!2831) j!81)))))

(assert (=> b!1426431 (=> res!961839 e!805709)))

(assert (=> b!1426431 (= e!805708 e!805709)))

(assert (= (and d!153173 c!131781) b!1426430))

(assert (= (and d!153173 (not c!131781)) b!1426426))

(assert (= (and b!1426426 c!131779) b!1426425))

(assert (= (and b!1426426 (not c!131779)) b!1426429))

(assert (= (and d!153173 c!131780) b!1426423))

(assert (= (and d!153173 (not c!131780)) b!1426427))

(assert (= (and b!1426427 res!961840) b!1426431))

(assert (= (and b!1426431 (not res!961839)) b!1426424))

(assert (= (and b!1426424 (not res!961838)) b!1426428))

(declare-fun m!1317045 () Bool)

(assert (=> b!1426428 m!1317045))

(assert (=> d!153173 m!1316975))

(declare-fun m!1317047 () Bool)

(assert (=> d!153173 m!1317047))

(assert (=> d!153173 m!1316957))

(assert (=> b!1426429 m!1316975))

(declare-fun m!1317049 () Bool)

(assert (=> b!1426429 m!1317049))

(assert (=> b!1426429 m!1317049))

(assert (=> b!1426429 m!1316969))

(declare-fun m!1317051 () Bool)

(assert (=> b!1426429 m!1317051))

(assert (=> b!1426431 m!1317045))

(assert (=> b!1426424 m!1317045))

(assert (=> b!1426351 d!153173))

(declare-fun d!153179 () Bool)

(declare-fun lt!628161 () (_ BitVec 32))

(declare-fun lt!628160 () (_ BitVec 32))

(assert (=> d!153179 (= lt!628161 (bvmul (bvxor lt!628160 (bvlshr lt!628160 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153179 (= lt!628160 ((_ extract 31 0) (bvand (bvxor (select (arr!46977 a!2831) j!81) (bvlshr (select (arr!46977 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153179 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!961841 (let ((h!34787 ((_ extract 31 0) (bvand (bvxor (select (arr!46977 a!2831) j!81) (bvlshr (select (arr!46977 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129045 (bvmul (bvxor h!34787 (bvlshr h!34787 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129045 (bvlshr x!129045 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!961841 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!961841 #b00000000000000000000000000000000))))))

(assert (=> d!153179 (= (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608) (bvand (bvxor lt!628161 (bvlshr lt!628161 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426351 d!153179))

(declare-fun b!1426442 () Bool)

(declare-fun e!805721 () Bool)

(declare-fun e!805720 () Bool)

(assert (=> b!1426442 (= e!805721 e!805720)))

(declare-fun c!131784 () Bool)

(assert (=> b!1426442 (= c!131784 (validKeyInArray!0 (select (arr!46977 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1426443 () Bool)

(declare-fun call!67327 () Bool)

(assert (=> b!1426443 (= e!805720 call!67327)))

(declare-fun b!1426444 () Bool)

(declare-fun e!805718 () Bool)

(assert (=> b!1426444 (= e!805718 e!805721)))

(declare-fun res!961850 () Bool)

(assert (=> b!1426444 (=> (not res!961850) (not e!805721))))

(declare-fun e!805719 () Bool)

(assert (=> b!1426444 (= res!961850 (not e!805719))))

(declare-fun res!961848 () Bool)

(assert (=> b!1426444 (=> (not res!961848) (not e!805719))))

(assert (=> b!1426444 (= res!961848 (validKeyInArray!0 (select (arr!46977 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1426445 () Bool)

(declare-fun contains!9847 (List!33487 (_ BitVec 64)) Bool)

(assert (=> b!1426445 (= e!805719 (contains!9847 Nil!33484 (select (arr!46977 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67324 () Bool)

(assert (=> bm!67324 (= call!67327 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131784 (Cons!33483 (select (arr!46977 a!2831) #b00000000000000000000000000000000) Nil!33484) Nil!33484)))))

(declare-fun d!153183 () Bool)

(declare-fun res!961849 () Bool)

(assert (=> d!153183 (=> res!961849 e!805718)))

(assert (=> d!153183 (= res!961849 (bvsge #b00000000000000000000000000000000 (size!47527 a!2831)))))

(assert (=> d!153183 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33484) e!805718)))

(declare-fun b!1426446 () Bool)

(assert (=> b!1426446 (= e!805720 call!67327)))

(assert (= (and d!153183 (not res!961849)) b!1426444))

(assert (= (and b!1426444 res!961848) b!1426445))

(assert (= (and b!1426444 res!961850) b!1426442))

(assert (= (and b!1426442 c!131784) b!1426446))

(assert (= (and b!1426442 (not c!131784)) b!1426443))

(assert (= (or b!1426446 b!1426443) bm!67324))

(assert (=> b!1426442 m!1317033))

(assert (=> b!1426442 m!1317033))

(assert (=> b!1426442 m!1317035))

(assert (=> b!1426444 m!1317033))

(assert (=> b!1426444 m!1317033))

(assert (=> b!1426444 m!1317035))

(assert (=> b!1426445 m!1317033))

(assert (=> b!1426445 m!1317033))

(declare-fun m!1317053 () Bool)

(assert (=> b!1426445 m!1317053))

(assert (=> bm!67324 m!1317033))

(declare-fun m!1317055 () Bool)

(assert (=> bm!67324 m!1317055))

(assert (=> b!1426345 d!153183))

(declare-fun b!1426447 () Bool)

(declare-fun e!805724 () Bool)

(declare-fun lt!628163 () SeekEntryResult!11256)

(assert (=> b!1426447 (= e!805724 (bvsge (x!129042 lt!628163) #b01111111111111111111111111111110))))

(declare-fun b!1426448 () Bool)

(assert (=> b!1426448 (and (bvsge (index!47418 lt!628163) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628163) (size!47527 lt!628121)))))

(declare-fun res!961851 () Bool)

(assert (=> b!1426448 (= res!961851 (= (select (arr!46977 lt!628121) (index!47418 lt!628163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805726 () Bool)

(assert (=> b!1426448 (=> res!961851 e!805726)))

(declare-fun b!1426449 () Bool)

(declare-fun e!805723 () SeekEntryResult!11256)

(assert (=> b!1426449 (= e!805723 (Intermediate!11256 false index!585 x!605))))

(declare-fun b!1426450 () Bool)

(declare-fun e!805722 () SeekEntryResult!11256)

(assert (=> b!1426450 (= e!805722 e!805723)))

(declare-fun c!131785 () Bool)

(declare-fun lt!628162 () (_ BitVec 64))

(assert (=> b!1426450 (= c!131785 (or (= lt!628162 lt!628125) (= (bvadd lt!628162 lt!628162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426451 () Bool)

(declare-fun e!805725 () Bool)

(assert (=> b!1426451 (= e!805724 e!805725)))

(declare-fun res!961853 () Bool)

(assert (=> b!1426451 (= res!961853 (and ((_ is Intermediate!11256) lt!628163) (not (undefined!12068 lt!628163)) (bvslt (x!129042 lt!628163) #b01111111111111111111111111111110) (bvsge (x!129042 lt!628163) #b00000000000000000000000000000000) (bvsge (x!129042 lt!628163) x!605)))))

(assert (=> b!1426451 (=> (not res!961853) (not e!805725))))

(declare-fun b!1426452 () Bool)

(assert (=> b!1426452 (and (bvsge (index!47418 lt!628163) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628163) (size!47527 lt!628121)))))

(assert (=> b!1426452 (= e!805726 (= (select (arr!46977 lt!628121) (index!47418 lt!628163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426453 () Bool)

(assert (=> b!1426453 (= e!805723 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628125 lt!628121 mask!2608))))

(declare-fun d!153193 () Bool)

(assert (=> d!153193 e!805724))

(declare-fun c!131786 () Bool)

(assert (=> d!153193 (= c!131786 (and ((_ is Intermediate!11256) lt!628163) (undefined!12068 lt!628163)))))

(assert (=> d!153193 (= lt!628163 e!805722)))

(declare-fun c!131787 () Bool)

(assert (=> d!153193 (= c!131787 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153193 (= lt!628162 (select (arr!46977 lt!628121) index!585))))

(assert (=> d!153193 (validMask!0 mask!2608)))

(assert (=> d!153193 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628125 lt!628121 mask!2608) lt!628163)))

(declare-fun b!1426454 () Bool)

(assert (=> b!1426454 (= e!805722 (Intermediate!11256 true index!585 x!605))))

(declare-fun b!1426455 () Bool)

(assert (=> b!1426455 (and (bvsge (index!47418 lt!628163) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628163) (size!47527 lt!628121)))))

(declare-fun res!961852 () Bool)

(assert (=> b!1426455 (= res!961852 (= (select (arr!46977 lt!628121) (index!47418 lt!628163)) lt!628125))))

(assert (=> b!1426455 (=> res!961852 e!805726)))

(assert (=> b!1426455 (= e!805725 e!805726)))

(assert (= (and d!153193 c!131787) b!1426454))

(assert (= (and d!153193 (not c!131787)) b!1426450))

(assert (= (and b!1426450 c!131785) b!1426449))

(assert (= (and b!1426450 (not c!131785)) b!1426453))

(assert (= (and d!153193 c!131786) b!1426447))

(assert (= (and d!153193 (not c!131786)) b!1426451))

(assert (= (and b!1426451 res!961853) b!1426455))

(assert (= (and b!1426455 (not res!961852)) b!1426448))

(assert (= (and b!1426448 (not res!961851)) b!1426452))

(declare-fun m!1317057 () Bool)

(assert (=> b!1426452 m!1317057))

(declare-fun m!1317059 () Bool)

(assert (=> d!153193 m!1317059))

(assert (=> d!153193 m!1316957))

(declare-fun m!1317061 () Bool)

(assert (=> b!1426453 m!1317061))

(assert (=> b!1426453 m!1317061))

(declare-fun m!1317063 () Bool)

(assert (=> b!1426453 m!1317063))

(assert (=> b!1426455 m!1317057))

(assert (=> b!1426448 m!1317057))

(assert (=> b!1426355 d!153193))

(declare-fun b!1426464 () Bool)

(declare-fun e!805735 () Bool)

(declare-fun lt!628171 () SeekEntryResult!11256)

(assert (=> b!1426464 (= e!805735 (bvsge (x!129042 lt!628171) #b01111111111111111111111111111110))))

(declare-fun b!1426465 () Bool)

(assert (=> b!1426465 (and (bvsge (index!47418 lt!628171) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628171) (size!47527 lt!628121)))))

(declare-fun res!961858 () Bool)

(assert (=> b!1426465 (= res!961858 (= (select (arr!46977 lt!628121) (index!47418 lt!628171)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805737 () Bool)

(assert (=> b!1426465 (=> res!961858 e!805737)))

(declare-fun b!1426466 () Bool)

(declare-fun e!805734 () SeekEntryResult!11256)

(assert (=> b!1426466 (= e!805734 (Intermediate!11256 false (toIndex!0 lt!628125 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426467 () Bool)

(declare-fun e!805733 () SeekEntryResult!11256)

(assert (=> b!1426467 (= e!805733 e!805734)))

(declare-fun c!131790 () Bool)

(declare-fun lt!628170 () (_ BitVec 64))

(assert (=> b!1426467 (= c!131790 (or (= lt!628170 lt!628125) (= (bvadd lt!628170 lt!628170) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426468 () Bool)

(declare-fun e!805736 () Bool)

(assert (=> b!1426468 (= e!805735 e!805736)))

(declare-fun res!961860 () Bool)

(assert (=> b!1426468 (= res!961860 (and ((_ is Intermediate!11256) lt!628171) (not (undefined!12068 lt!628171)) (bvslt (x!129042 lt!628171) #b01111111111111111111111111111110) (bvsge (x!129042 lt!628171) #b00000000000000000000000000000000) (bvsge (x!129042 lt!628171) #b00000000000000000000000000000000)))))

(assert (=> b!1426468 (=> (not res!961860) (not e!805736))))

(declare-fun b!1426469 () Bool)

(assert (=> b!1426469 (and (bvsge (index!47418 lt!628171) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628171) (size!47527 lt!628121)))))

(assert (=> b!1426469 (= e!805737 (= (select (arr!46977 lt!628121) (index!47418 lt!628171)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426470 () Bool)

(assert (=> b!1426470 (= e!805734 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628125 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628125 lt!628121 mask!2608))))

(declare-fun d!153195 () Bool)

(assert (=> d!153195 e!805735))

(declare-fun c!131791 () Bool)

(assert (=> d!153195 (= c!131791 (and ((_ is Intermediate!11256) lt!628171) (undefined!12068 lt!628171)))))

(assert (=> d!153195 (= lt!628171 e!805733)))

(declare-fun c!131792 () Bool)

(assert (=> d!153195 (= c!131792 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153195 (= lt!628170 (select (arr!46977 lt!628121) (toIndex!0 lt!628125 mask!2608)))))

(assert (=> d!153195 (validMask!0 mask!2608)))

(assert (=> d!153195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628125 mask!2608) lt!628125 lt!628121 mask!2608) lt!628171)))

(declare-fun b!1426471 () Bool)

(assert (=> b!1426471 (= e!805733 (Intermediate!11256 true (toIndex!0 lt!628125 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426472 () Bool)

(assert (=> b!1426472 (and (bvsge (index!47418 lt!628171) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628171) (size!47527 lt!628121)))))

(declare-fun res!961859 () Bool)

(assert (=> b!1426472 (= res!961859 (= (select (arr!46977 lt!628121) (index!47418 lt!628171)) lt!628125))))

(assert (=> b!1426472 (=> res!961859 e!805737)))

(assert (=> b!1426472 (= e!805736 e!805737)))

(assert (= (and d!153195 c!131792) b!1426471))

(assert (= (and d!153195 (not c!131792)) b!1426467))

(assert (= (and b!1426467 c!131790) b!1426466))

(assert (= (and b!1426467 (not c!131790)) b!1426470))

(assert (= (and d!153195 c!131791) b!1426464))

(assert (= (and d!153195 (not c!131791)) b!1426468))

(assert (= (and b!1426468 res!961860) b!1426472))

(assert (= (and b!1426472 (not res!961859)) b!1426465))

(assert (= (and b!1426465 (not res!961858)) b!1426469))

(declare-fun m!1317065 () Bool)

(assert (=> b!1426469 m!1317065))

(assert (=> d!153195 m!1316961))

(declare-fun m!1317067 () Bool)

(assert (=> d!153195 m!1317067))

(assert (=> d!153195 m!1316957))

(assert (=> b!1426470 m!1316961))

(declare-fun m!1317069 () Bool)

(assert (=> b!1426470 m!1317069))

(assert (=> b!1426470 m!1317069))

(declare-fun m!1317071 () Bool)

(assert (=> b!1426470 m!1317071))

(assert (=> b!1426472 m!1317065))

(assert (=> b!1426465 m!1317065))

(assert (=> b!1426354 d!153195))

(declare-fun d!153197 () Bool)

(declare-fun lt!628173 () (_ BitVec 32))

(declare-fun lt!628172 () (_ BitVec 32))

(assert (=> d!153197 (= lt!628173 (bvmul (bvxor lt!628172 (bvlshr lt!628172 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153197 (= lt!628172 ((_ extract 31 0) (bvand (bvxor lt!628125 (bvlshr lt!628125 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153197 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!961841 (let ((h!34787 ((_ extract 31 0) (bvand (bvxor lt!628125 (bvlshr lt!628125 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129045 (bvmul (bvxor h!34787 (bvlshr h!34787 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129045 (bvlshr x!129045 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!961841 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!961841 #b00000000000000000000000000000000))))))

(assert (=> d!153197 (= (toIndex!0 lt!628125 mask!2608) (bvand (bvxor lt!628173 (bvlshr lt!628173 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426354 d!153197))

(declare-fun b!1426483 () Bool)

(declare-fun e!805747 () Bool)

(declare-fun lt!628175 () SeekEntryResult!11256)

(assert (=> b!1426483 (= e!805747 (bvsge (x!129042 lt!628175) #b01111111111111111111111111111110))))

(declare-fun b!1426484 () Bool)

(assert (=> b!1426484 (and (bvsge (index!47418 lt!628175) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628175) (size!47527 a!2831)))))

(declare-fun res!961867 () Bool)

(assert (=> b!1426484 (= res!961867 (= (select (arr!46977 a!2831) (index!47418 lt!628175)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805750 () Bool)

(assert (=> b!1426484 (=> res!961867 e!805750)))

(declare-fun b!1426485 () Bool)

(declare-fun e!805746 () SeekEntryResult!11256)

(assert (=> b!1426485 (= e!805746 (Intermediate!11256 false index!585 x!605))))

(declare-fun b!1426486 () Bool)

(declare-fun e!805745 () SeekEntryResult!11256)

(assert (=> b!1426486 (= e!805745 e!805746)))

(declare-fun c!131794 () Bool)

(declare-fun lt!628174 () (_ BitVec 64))

(assert (=> b!1426486 (= c!131794 (or (= lt!628174 (select (arr!46977 a!2831) j!81)) (= (bvadd lt!628174 lt!628174) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426487 () Bool)

(declare-fun e!805749 () Bool)

(assert (=> b!1426487 (= e!805747 e!805749)))

(declare-fun res!961869 () Bool)

(assert (=> b!1426487 (= res!961869 (and ((_ is Intermediate!11256) lt!628175) (not (undefined!12068 lt!628175)) (bvslt (x!129042 lt!628175) #b01111111111111111111111111111110) (bvsge (x!129042 lt!628175) #b00000000000000000000000000000000) (bvsge (x!129042 lt!628175) x!605)))))

(assert (=> b!1426487 (=> (not res!961869) (not e!805749))))

(declare-fun b!1426488 () Bool)

(assert (=> b!1426488 (and (bvsge (index!47418 lt!628175) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628175) (size!47527 a!2831)))))

(assert (=> b!1426488 (= e!805750 (= (select (arr!46977 a!2831) (index!47418 lt!628175)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426489 () Bool)

(assert (=> b!1426489 (= e!805746 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46977 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153199 () Bool)

(assert (=> d!153199 e!805747))

(declare-fun c!131795 () Bool)

(assert (=> d!153199 (= c!131795 (and ((_ is Intermediate!11256) lt!628175) (undefined!12068 lt!628175)))))

(assert (=> d!153199 (= lt!628175 e!805745)))

(declare-fun c!131797 () Bool)

(assert (=> d!153199 (= c!131797 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153199 (= lt!628174 (select (arr!46977 a!2831) index!585))))

(assert (=> d!153199 (validMask!0 mask!2608)))

(assert (=> d!153199 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46977 a!2831) j!81) a!2831 mask!2608) lt!628175)))

(declare-fun b!1426490 () Bool)

(assert (=> b!1426490 (= e!805745 (Intermediate!11256 true index!585 x!605))))

(declare-fun b!1426491 () Bool)

(assert (=> b!1426491 (and (bvsge (index!47418 lt!628175) #b00000000000000000000000000000000) (bvslt (index!47418 lt!628175) (size!47527 a!2831)))))

(declare-fun res!961868 () Bool)

(assert (=> b!1426491 (= res!961868 (= (select (arr!46977 a!2831) (index!47418 lt!628175)) (select (arr!46977 a!2831) j!81)))))

(assert (=> b!1426491 (=> res!961868 e!805750)))

(assert (=> b!1426491 (= e!805749 e!805750)))

(assert (= (and d!153199 c!131797) b!1426490))

(assert (= (and d!153199 (not c!131797)) b!1426486))

(assert (= (and b!1426486 c!131794) b!1426485))

(assert (= (and b!1426486 (not c!131794)) b!1426489))

(assert (= (and d!153199 c!131795) b!1426483))

(assert (= (and d!153199 (not c!131795)) b!1426487))

(assert (= (and b!1426487 res!961869) b!1426491))

(assert (= (and b!1426491 (not res!961868)) b!1426484))

(assert (= (and b!1426484 (not res!961867)) b!1426488))

(declare-fun m!1317073 () Bool)

(assert (=> b!1426488 m!1317073))

(declare-fun m!1317075 () Bool)

(assert (=> d!153199 m!1317075))

(assert (=> d!153199 m!1316957))

(assert (=> b!1426489 m!1317061))

(assert (=> b!1426489 m!1317061))

(assert (=> b!1426489 m!1316969))

(declare-fun m!1317077 () Bool)

(assert (=> b!1426489 m!1317077))

(assert (=> b!1426491 m!1317073))

(assert (=> b!1426484 m!1317073))

(assert (=> b!1426349 d!153199))

(declare-fun d!153201 () Bool)

(assert (=> d!153201 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122954 d!153201))

(declare-fun d!153209 () Bool)

(assert (=> d!153209 (= (array_inv!36005 a!2831) (bvsge (size!47527 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122954 d!153209))

(declare-fun d!153211 () Bool)

(assert (=> d!153211 (= (validKeyInArray!0 (select (arr!46977 a!2831) i!982)) (and (not (= (select (arr!46977 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46977 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426353 d!153211))

(declare-fun d!153213 () Bool)

(assert (=> d!153213 (= (validKeyInArray!0 (select (arr!46977 a!2831) j!81)) (and (not (= (select (arr!46977 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46977 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426352 d!153213))

(declare-fun d!153215 () Bool)

(declare-fun lt!628214 () SeekEntryResult!11256)

(assert (=> d!153215 (and (or ((_ is Undefined!11256) lt!628214) (not ((_ is Found!11256) lt!628214)) (and (bvsge (index!47417 lt!628214) #b00000000000000000000000000000000) (bvslt (index!47417 lt!628214) (size!47527 a!2831)))) (or ((_ is Undefined!11256) lt!628214) ((_ is Found!11256) lt!628214) (not ((_ is MissingZero!11256) lt!628214)) (and (bvsge (index!47416 lt!628214) #b00000000000000000000000000000000) (bvslt (index!47416 lt!628214) (size!47527 a!2831)))) (or ((_ is Undefined!11256) lt!628214) ((_ is Found!11256) lt!628214) ((_ is MissingZero!11256) lt!628214) (not ((_ is MissingVacant!11256) lt!628214)) (and (bvsge (index!47419 lt!628214) #b00000000000000000000000000000000) (bvslt (index!47419 lt!628214) (size!47527 a!2831)))) (or ((_ is Undefined!11256) lt!628214) (ite ((_ is Found!11256) lt!628214) (= (select (arr!46977 a!2831) (index!47417 lt!628214)) (select (arr!46977 a!2831) j!81)) (ite ((_ is MissingZero!11256) lt!628214) (= (select (arr!46977 a!2831) (index!47416 lt!628214)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11256) lt!628214) (= (select (arr!46977 a!2831) (index!47419 lt!628214)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!805810 () SeekEntryResult!11256)

(assert (=> d!153215 (= lt!628214 e!805810)))

(declare-fun c!131830 () Bool)

(declare-fun lt!628215 () SeekEntryResult!11256)

(assert (=> d!153215 (= c!131830 (and ((_ is Intermediate!11256) lt!628215) (undefined!12068 lt!628215)))))

(assert (=> d!153215 (= lt!628215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46977 a!2831) j!81) mask!2608) (select (arr!46977 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153215 (validMask!0 mask!2608)))

(assert (=> d!153215 (= (seekEntryOrOpen!0 (select (arr!46977 a!2831) j!81) a!2831 mask!2608) lt!628214)))

(declare-fun b!1426588 () Bool)

(assert (=> b!1426588 (= e!805810 Undefined!11256)))

(declare-fun b!1426589 () Bool)

(declare-fun c!131832 () Bool)

(declare-fun lt!628216 () (_ BitVec 64))

(assert (=> b!1426589 (= c!131832 (= lt!628216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805809 () SeekEntryResult!11256)

(declare-fun e!805808 () SeekEntryResult!11256)

(assert (=> b!1426589 (= e!805809 e!805808)))

(declare-fun b!1426590 () Bool)

(assert (=> b!1426590 (= e!805810 e!805809)))

(assert (=> b!1426590 (= lt!628216 (select (arr!46977 a!2831) (index!47418 lt!628215)))))

(declare-fun c!131831 () Bool)

(assert (=> b!1426590 (= c!131831 (= lt!628216 (select (arr!46977 a!2831) j!81)))))

(declare-fun b!1426591 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97319 (_ BitVec 32)) SeekEntryResult!11256)

(assert (=> b!1426591 (= e!805808 (seekKeyOrZeroReturnVacant!0 (x!129042 lt!628215) (index!47418 lt!628215) (index!47418 lt!628215) (select (arr!46977 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426592 () Bool)

(assert (=> b!1426592 (= e!805808 (MissingZero!11256 (index!47418 lt!628215)))))

(declare-fun b!1426593 () Bool)

(assert (=> b!1426593 (= e!805809 (Found!11256 (index!47418 lt!628215)))))

(assert (= (and d!153215 c!131830) b!1426588))

(assert (= (and d!153215 (not c!131830)) b!1426590))

(assert (= (and b!1426590 c!131831) b!1426593))

(assert (= (and b!1426590 (not c!131831)) b!1426589))

(assert (= (and b!1426589 c!131832) b!1426592))

(assert (= (and b!1426589 (not c!131832)) b!1426591))

(assert (=> d!153215 m!1316957))

(declare-fun m!1317129 () Bool)

(assert (=> d!153215 m!1317129))

(assert (=> d!153215 m!1316975))

(assert (=> d!153215 m!1316969))

(assert (=> d!153215 m!1316977))

(declare-fun m!1317131 () Bool)

(assert (=> d!153215 m!1317131))

(assert (=> d!153215 m!1316969))

(assert (=> d!153215 m!1316975))

(declare-fun m!1317133 () Bool)

(assert (=> d!153215 m!1317133))

(declare-fun m!1317135 () Bool)

(assert (=> b!1426590 m!1317135))

(assert (=> b!1426591 m!1316969))

(declare-fun m!1317137 () Bool)

(assert (=> b!1426591 m!1317137))

(assert (=> b!1426347 d!153215))

(declare-fun b!1426594 () Bool)

(declare-fun e!805812 () Bool)

(declare-fun call!67337 () Bool)

(assert (=> b!1426594 (= e!805812 call!67337)))

(declare-fun b!1426595 () Bool)

(declare-fun e!805811 () Bool)

(assert (=> b!1426595 (= e!805811 call!67337)))

(declare-fun b!1426596 () Bool)

(declare-fun e!805813 () Bool)

(assert (=> b!1426596 (= e!805813 e!805811)))

(declare-fun c!131833 () Bool)

(assert (=> b!1426596 (= c!131833 (validKeyInArray!0 (select (arr!46977 a!2831) j!81)))))

(declare-fun d!153227 () Bool)

(declare-fun res!961903 () Bool)

(assert (=> d!153227 (=> res!961903 e!805813)))

(assert (=> d!153227 (= res!961903 (bvsge j!81 (size!47527 a!2831)))))

(assert (=> d!153227 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!805813)))

(declare-fun b!1426597 () Bool)

(assert (=> b!1426597 (= e!805811 e!805812)))

(declare-fun lt!628218 () (_ BitVec 64))

(assert (=> b!1426597 (= lt!628218 (select (arr!46977 a!2831) j!81))))

(declare-fun lt!628219 () Unit!48258)

(assert (=> b!1426597 (= lt!628219 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628218 j!81))))

(assert (=> b!1426597 (arrayContainsKey!0 a!2831 lt!628218 #b00000000000000000000000000000000)))

(declare-fun lt!628217 () Unit!48258)

(assert (=> b!1426597 (= lt!628217 lt!628219)))

(declare-fun res!961904 () Bool)

(assert (=> b!1426597 (= res!961904 (= (seekEntryOrOpen!0 (select (arr!46977 a!2831) j!81) a!2831 mask!2608) (Found!11256 j!81)))))

(assert (=> b!1426597 (=> (not res!961904) (not e!805812))))

(declare-fun bm!67334 () Bool)

(assert (=> bm!67334 (= call!67337 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153227 (not res!961903)) b!1426596))

(assert (= (and b!1426596 c!131833) b!1426597))

(assert (= (and b!1426596 (not c!131833)) b!1426595))

(assert (= (and b!1426597 res!961904) b!1426594))

(assert (= (or b!1426594 b!1426595) bm!67334))

(assert (=> b!1426596 m!1316969))

(assert (=> b!1426596 m!1316969))

(assert (=> b!1426596 m!1316971))

(assert (=> b!1426597 m!1316969))

(declare-fun m!1317139 () Bool)

(assert (=> b!1426597 m!1317139))

(declare-fun m!1317141 () Bool)

(assert (=> b!1426597 m!1317141))

(assert (=> b!1426597 m!1316969))

(assert (=> b!1426597 m!1316981))

(declare-fun m!1317143 () Bool)

(assert (=> bm!67334 m!1317143))

(assert (=> b!1426347 d!153227))

(declare-fun d!153229 () Bool)

(assert (=> d!153229 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628226 () Unit!48258)

(declare-fun choose!38 (array!97319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48258)

(assert (=> d!153229 (= lt!628226 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153229 (validMask!0 mask!2608)))

(assert (=> d!153229 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628226)))

(declare-fun bs!41588 () Bool)

(assert (= bs!41588 d!153229))

(assert (=> bs!41588 m!1316983))

(declare-fun m!1317159 () Bool)

(assert (=> bs!41588 m!1317159))

(assert (=> bs!41588 m!1316957))

(assert (=> b!1426347 d!153229))

(check-sat (not b!1426453) (not bm!67321) (not b!1426444) (not b!1426596) (not b!1426442) (not b!1426404) (not b!1426470) (not d!153195) (not b!1426429) (not b!1426489) (not b!1426597) (not b!1426445) (not d!153215) (not b!1426591) (not bm!67334) (not d!153199) (not d!153173) (not bm!67324) (not d!153193) (not b!1426403) (not d!153229))
(check-sat)
