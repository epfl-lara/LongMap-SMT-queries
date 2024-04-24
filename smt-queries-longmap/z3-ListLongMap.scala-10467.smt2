; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123260 () Bool)

(assert start!123260)

(declare-fun b!1428294 () Bool)

(declare-fun res!962647 () Bool)

(declare-fun e!806860 () Bool)

(assert (=> b!1428294 (=> (not res!962647) (not e!806860))))

(declare-datatypes ((array!97445 0))(
  ( (array!97446 (arr!47035 (Array (_ BitVec 32) (_ BitVec 64))) (size!47586 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97445)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97445 (_ BitVec 32)) Bool)

(assert (=> b!1428294 (= res!962647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun e!806857 () Bool)

(declare-fun b!1428295 () Bool)

(declare-datatypes ((SeekEntryResult!11216 0))(
  ( (MissingZero!11216 (index!47256 (_ BitVec 32))) (Found!11216 (index!47257 (_ BitVec 32))) (Intermediate!11216 (undefined!12028 Bool) (index!47258 (_ BitVec 32)) (x!129049 (_ BitVec 32))) (Undefined!11216) (MissingVacant!11216 (index!47259 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97445 (_ BitVec 32)) SeekEntryResult!11216)

(assert (=> b!1428295 (= e!806857 (= (seekEntryOrOpen!0 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) (Found!11216 j!81)))))

(declare-fun b!1428296 () Bool)

(declare-fun res!962648 () Bool)

(assert (=> b!1428296 (=> (not res!962648) (not e!806860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428296 (= res!962648 (validKeyInArray!0 (select (arr!47035 a!2831) j!81)))))

(declare-fun b!1428297 () Bool)

(declare-fun res!962653 () Bool)

(assert (=> b!1428297 (=> (not res!962653) (not e!806860))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428297 (= res!962653 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47586 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47586 a!2831))))))

(declare-fun b!1428298 () Bool)

(declare-fun res!962646 () Bool)

(assert (=> b!1428298 (=> (not res!962646) (not e!806860))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428298 (= res!962646 (validKeyInArray!0 (select (arr!47035 a!2831) i!982)))))

(declare-fun b!1428299 () Bool)

(declare-fun e!806861 () Bool)

(assert (=> b!1428299 (= e!806861 (not (not (= (select (arr!47035 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428299 e!806857))

(declare-fun res!962649 () Bool)

(assert (=> b!1428299 (=> (not res!962649) (not e!806857))))

(assert (=> b!1428299 (= res!962649 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48209 0))(
  ( (Unit!48210) )
))
(declare-fun lt!628858 () Unit!48209)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48209)

(assert (=> b!1428299 (= lt!628858 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!962652 () Bool)

(assert (=> start!123260 (=> (not res!962652) (not e!806860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123260 (= res!962652 (validMask!0 mask!2608))))

(assert (=> start!123260 e!806860))

(assert (=> start!123260 true))

(declare-fun array_inv!36316 (array!97445) Bool)

(assert (=> start!123260 (array_inv!36316 a!2831)))

(declare-fun b!1428300 () Bool)

(declare-fun e!806858 () Bool)

(assert (=> b!1428300 (= e!806860 e!806858)))

(declare-fun res!962651 () Bool)

(assert (=> b!1428300 (=> (not res!962651) (not e!806858))))

(declare-fun lt!628862 () SeekEntryResult!11216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97445 (_ BitVec 32)) SeekEntryResult!11216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428300 (= res!962651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!628862))))

(assert (=> b!1428300 (= lt!628862 (Intermediate!11216 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428301 () Bool)

(assert (=> b!1428301 (= e!806858 e!806861)))

(declare-fun res!962642 () Bool)

(assert (=> b!1428301 (=> (not res!962642) (not e!806861))))

(declare-fun lt!628861 () array!97445)

(declare-fun lt!628860 () SeekEntryResult!11216)

(declare-fun lt!628859 () (_ BitVec 64))

(assert (=> b!1428301 (= res!962642 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628859 mask!2608) lt!628859 lt!628861 mask!2608) lt!628860))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428301 (= lt!628860 (Intermediate!11216 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428301 (= lt!628859 (select (store (arr!47035 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428301 (= lt!628861 (array!97446 (store (arr!47035 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47586 a!2831)))))

(declare-fun b!1428302 () Bool)

(declare-fun res!962645 () Bool)

(assert (=> b!1428302 (=> (not res!962645) (not e!806861))))

(assert (=> b!1428302 (= res!962645 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628859 lt!628861 mask!2608) lt!628860))))

(declare-fun b!1428303 () Bool)

(declare-fun res!962641 () Bool)

(assert (=> b!1428303 (=> (not res!962641) (not e!806860))))

(assert (=> b!1428303 (= res!962641 (and (= (size!47586 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47586 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47586 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428304 () Bool)

(declare-fun res!962644 () Bool)

(assert (=> b!1428304 (=> (not res!962644) (not e!806861))))

(assert (=> b!1428304 (= res!962644 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!628862))))

(declare-fun b!1428305 () Bool)

(declare-fun res!962650 () Bool)

(assert (=> b!1428305 (=> (not res!962650) (not e!806861))))

(assert (=> b!1428305 (= res!962650 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428306 () Bool)

(declare-fun res!962643 () Bool)

(assert (=> b!1428306 (=> (not res!962643) (not e!806860))))

(declare-datatypes ((List!33532 0))(
  ( (Nil!33529) (Cons!33528 (h!34844 (_ BitVec 64)) (t!48218 List!33532)) )
))
(declare-fun arrayNoDuplicates!0 (array!97445 (_ BitVec 32) List!33532) Bool)

(assert (=> b!1428306 (= res!962643 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33529))))

(assert (= (and start!123260 res!962652) b!1428303))

(assert (= (and b!1428303 res!962641) b!1428298))

(assert (= (and b!1428298 res!962646) b!1428296))

(assert (= (and b!1428296 res!962648) b!1428294))

(assert (= (and b!1428294 res!962647) b!1428306))

(assert (= (and b!1428306 res!962643) b!1428297))

(assert (= (and b!1428297 res!962653) b!1428300))

(assert (= (and b!1428300 res!962651) b!1428301))

(assert (= (and b!1428301 res!962642) b!1428304))

(assert (= (and b!1428304 res!962644) b!1428302))

(assert (= (and b!1428302 res!962645) b!1428305))

(assert (= (and b!1428305 res!962650) b!1428299))

(assert (= (and b!1428299 res!962649) b!1428295))

(declare-fun m!1318905 () Bool)

(assert (=> start!123260 m!1318905))

(declare-fun m!1318907 () Bool)

(assert (=> start!123260 m!1318907))

(declare-fun m!1318909 () Bool)

(assert (=> b!1428300 m!1318909))

(assert (=> b!1428300 m!1318909))

(declare-fun m!1318911 () Bool)

(assert (=> b!1428300 m!1318911))

(assert (=> b!1428300 m!1318911))

(assert (=> b!1428300 m!1318909))

(declare-fun m!1318913 () Bool)

(assert (=> b!1428300 m!1318913))

(assert (=> b!1428295 m!1318909))

(assert (=> b!1428295 m!1318909))

(declare-fun m!1318915 () Bool)

(assert (=> b!1428295 m!1318915))

(assert (=> b!1428304 m!1318909))

(assert (=> b!1428304 m!1318909))

(declare-fun m!1318917 () Bool)

(assert (=> b!1428304 m!1318917))

(declare-fun m!1318919 () Bool)

(assert (=> b!1428298 m!1318919))

(assert (=> b!1428298 m!1318919))

(declare-fun m!1318921 () Bool)

(assert (=> b!1428298 m!1318921))

(declare-fun m!1318923 () Bool)

(assert (=> b!1428301 m!1318923))

(assert (=> b!1428301 m!1318923))

(declare-fun m!1318925 () Bool)

(assert (=> b!1428301 m!1318925))

(declare-fun m!1318927 () Bool)

(assert (=> b!1428301 m!1318927))

(declare-fun m!1318929 () Bool)

(assert (=> b!1428301 m!1318929))

(declare-fun m!1318931 () Bool)

(assert (=> b!1428294 m!1318931))

(declare-fun m!1318933 () Bool)

(assert (=> b!1428306 m!1318933))

(assert (=> b!1428296 m!1318909))

(assert (=> b!1428296 m!1318909))

(declare-fun m!1318935 () Bool)

(assert (=> b!1428296 m!1318935))

(declare-fun m!1318937 () Bool)

(assert (=> b!1428299 m!1318937))

(declare-fun m!1318939 () Bool)

(assert (=> b!1428299 m!1318939))

(declare-fun m!1318941 () Bool)

(assert (=> b!1428299 m!1318941))

(declare-fun m!1318943 () Bool)

(assert (=> b!1428302 m!1318943))

(check-sat (not start!123260) (not b!1428301) (not b!1428300) (not b!1428295) (not b!1428298) (not b!1428296) (not b!1428294) (not b!1428306) (not b!1428299) (not b!1428304) (not b!1428302))
(check-sat)
(get-model)

(declare-fun lt!628900 () SeekEntryResult!11216)

(declare-fun b!1428397 () Bool)

(declare-fun e!806900 () SeekEntryResult!11216)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97445 (_ BitVec 32)) SeekEntryResult!11216)

(assert (=> b!1428397 (= e!806900 (seekKeyOrZeroReturnVacant!0 (x!129049 lt!628900) (index!47258 lt!628900) (index!47258 lt!628900) (select (arr!47035 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153699 () Bool)

(declare-fun lt!628899 () SeekEntryResult!11216)

(get-info :version)

(assert (=> d!153699 (and (or ((_ is Undefined!11216) lt!628899) (not ((_ is Found!11216) lt!628899)) (and (bvsge (index!47257 lt!628899) #b00000000000000000000000000000000) (bvslt (index!47257 lt!628899) (size!47586 a!2831)))) (or ((_ is Undefined!11216) lt!628899) ((_ is Found!11216) lt!628899) (not ((_ is MissingZero!11216) lt!628899)) (and (bvsge (index!47256 lt!628899) #b00000000000000000000000000000000) (bvslt (index!47256 lt!628899) (size!47586 a!2831)))) (or ((_ is Undefined!11216) lt!628899) ((_ is Found!11216) lt!628899) ((_ is MissingZero!11216) lt!628899) (not ((_ is MissingVacant!11216) lt!628899)) (and (bvsge (index!47259 lt!628899) #b00000000000000000000000000000000) (bvslt (index!47259 lt!628899) (size!47586 a!2831)))) (or ((_ is Undefined!11216) lt!628899) (ite ((_ is Found!11216) lt!628899) (= (select (arr!47035 a!2831) (index!47257 lt!628899)) (select (arr!47035 a!2831) j!81)) (ite ((_ is MissingZero!11216) lt!628899) (= (select (arr!47035 a!2831) (index!47256 lt!628899)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11216) lt!628899) (= (select (arr!47035 a!2831) (index!47259 lt!628899)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!806899 () SeekEntryResult!11216)

(assert (=> d!153699 (= lt!628899 e!806899)))

(declare-fun c!132330 () Bool)

(assert (=> d!153699 (= c!132330 (and ((_ is Intermediate!11216) lt!628900) (undefined!12028 lt!628900)))))

(assert (=> d!153699 (= lt!628900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) (select (arr!47035 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153699 (validMask!0 mask!2608)))

(assert (=> d!153699 (= (seekEntryOrOpen!0 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!628899)))

(declare-fun b!1428398 () Bool)

(assert (=> b!1428398 (= e!806899 Undefined!11216)))

(declare-fun b!1428399 () Bool)

(declare-fun e!806898 () SeekEntryResult!11216)

(assert (=> b!1428399 (= e!806899 e!806898)))

(declare-fun lt!628901 () (_ BitVec 64))

(assert (=> b!1428399 (= lt!628901 (select (arr!47035 a!2831) (index!47258 lt!628900)))))

(declare-fun c!132331 () Bool)

(assert (=> b!1428399 (= c!132331 (= lt!628901 (select (arr!47035 a!2831) j!81)))))

(declare-fun b!1428400 () Bool)

(declare-fun c!132329 () Bool)

(assert (=> b!1428400 (= c!132329 (= lt!628901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428400 (= e!806898 e!806900)))

(declare-fun b!1428401 () Bool)

(assert (=> b!1428401 (= e!806900 (MissingZero!11216 (index!47258 lt!628900)))))

(declare-fun b!1428402 () Bool)

(assert (=> b!1428402 (= e!806898 (Found!11216 (index!47258 lt!628900)))))

(assert (= (and d!153699 c!132330) b!1428398))

(assert (= (and d!153699 (not c!132330)) b!1428399))

(assert (= (and b!1428399 c!132331) b!1428402))

(assert (= (and b!1428399 (not c!132331)) b!1428400))

(assert (= (and b!1428400 c!132329) b!1428401))

(assert (= (and b!1428400 (not c!132329)) b!1428397))

(assert (=> b!1428397 m!1318909))

(declare-fun m!1319025 () Bool)

(assert (=> b!1428397 m!1319025))

(declare-fun m!1319027 () Bool)

(assert (=> d!153699 m!1319027))

(assert (=> d!153699 m!1318909))

(assert (=> d!153699 m!1318911))

(assert (=> d!153699 m!1318905))

(assert (=> d!153699 m!1318911))

(assert (=> d!153699 m!1318909))

(assert (=> d!153699 m!1318913))

(declare-fun m!1319029 () Bool)

(assert (=> d!153699 m!1319029))

(declare-fun m!1319031 () Bool)

(assert (=> d!153699 m!1319031))

(declare-fun m!1319033 () Bool)

(assert (=> b!1428399 m!1319033))

(assert (=> b!1428295 d!153699))

(declare-fun b!1428421 () Bool)

(declare-fun lt!628906 () SeekEntryResult!11216)

(assert (=> b!1428421 (and (bvsge (index!47258 lt!628906) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628906) (size!47586 a!2831)))))

(declare-fun e!806914 () Bool)

(assert (=> b!1428421 (= e!806914 (= (select (arr!47035 a!2831) (index!47258 lt!628906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428422 () Bool)

(declare-fun e!806913 () SeekEntryResult!11216)

(assert (=> b!1428422 (= e!806913 (Intermediate!11216 false (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153701 () Bool)

(declare-fun e!806912 () Bool)

(assert (=> d!153701 e!806912))

(declare-fun c!132338 () Bool)

(assert (=> d!153701 (= c!132338 (and ((_ is Intermediate!11216) lt!628906) (undefined!12028 lt!628906)))))

(declare-fun e!806911 () SeekEntryResult!11216)

(assert (=> d!153701 (= lt!628906 e!806911)))

(declare-fun c!132339 () Bool)

(assert (=> d!153701 (= c!132339 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628907 () (_ BitVec 64))

(assert (=> d!153701 (= lt!628907 (select (arr!47035 a!2831) (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608)))))

(assert (=> d!153701 (validMask!0 mask!2608)))

(assert (=> d!153701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!628906)))

(declare-fun b!1428423 () Bool)

(assert (=> b!1428423 (= e!806911 (Intermediate!11216 true (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428424 () Bool)

(assert (=> b!1428424 (and (bvsge (index!47258 lt!628906) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628906) (size!47586 a!2831)))))

(declare-fun res!962738 () Bool)

(assert (=> b!1428424 (= res!962738 (= (select (arr!47035 a!2831) (index!47258 lt!628906)) (select (arr!47035 a!2831) j!81)))))

(assert (=> b!1428424 (=> res!962738 e!806914)))

(declare-fun e!806915 () Bool)

(assert (=> b!1428424 (= e!806915 e!806914)))

(declare-fun b!1428425 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428425 (= e!806913 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47035 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428426 () Bool)

(assert (=> b!1428426 (= e!806912 (bvsge (x!129049 lt!628906) #b01111111111111111111111111111110))))

(declare-fun b!1428427 () Bool)

(assert (=> b!1428427 (and (bvsge (index!47258 lt!628906) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628906) (size!47586 a!2831)))))

(declare-fun res!962740 () Bool)

(assert (=> b!1428427 (= res!962740 (= (select (arr!47035 a!2831) (index!47258 lt!628906)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428427 (=> res!962740 e!806914)))

(declare-fun b!1428428 () Bool)

(assert (=> b!1428428 (= e!806912 e!806915)))

(declare-fun res!962739 () Bool)

(assert (=> b!1428428 (= res!962739 (and ((_ is Intermediate!11216) lt!628906) (not (undefined!12028 lt!628906)) (bvslt (x!129049 lt!628906) #b01111111111111111111111111111110) (bvsge (x!129049 lt!628906) #b00000000000000000000000000000000) (bvsge (x!129049 lt!628906) #b00000000000000000000000000000000)))))

(assert (=> b!1428428 (=> (not res!962739) (not e!806915))))

(declare-fun b!1428429 () Bool)

(assert (=> b!1428429 (= e!806911 e!806913)))

(declare-fun c!132340 () Bool)

(assert (=> b!1428429 (= c!132340 (or (= lt!628907 (select (arr!47035 a!2831) j!81)) (= (bvadd lt!628907 lt!628907) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153701 c!132339) b!1428423))

(assert (= (and d!153701 (not c!132339)) b!1428429))

(assert (= (and b!1428429 c!132340) b!1428422))

(assert (= (and b!1428429 (not c!132340)) b!1428425))

(assert (= (and d!153701 c!132338) b!1428426))

(assert (= (and d!153701 (not c!132338)) b!1428428))

(assert (= (and b!1428428 res!962739) b!1428424))

(assert (= (and b!1428424 (not res!962738)) b!1428427))

(assert (= (and b!1428427 (not res!962740)) b!1428421))

(declare-fun m!1319035 () Bool)

(assert (=> b!1428424 m!1319035))

(assert (=> b!1428427 m!1319035))

(assert (=> b!1428425 m!1318911))

(declare-fun m!1319037 () Bool)

(assert (=> b!1428425 m!1319037))

(assert (=> b!1428425 m!1319037))

(assert (=> b!1428425 m!1318909))

(declare-fun m!1319039 () Bool)

(assert (=> b!1428425 m!1319039))

(assert (=> d!153701 m!1318911))

(declare-fun m!1319041 () Bool)

(assert (=> d!153701 m!1319041))

(assert (=> d!153701 m!1318905))

(assert (=> b!1428421 m!1319035))

(assert (=> b!1428300 d!153701))

(declare-fun d!153707 () Bool)

(declare-fun lt!628917 () (_ BitVec 32))

(declare-fun lt!628916 () (_ BitVec 32))

(assert (=> d!153707 (= lt!628917 (bvmul (bvxor lt!628916 (bvlshr lt!628916 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153707 (= lt!628916 ((_ extract 31 0) (bvand (bvxor (select (arr!47035 a!2831) j!81) (bvlshr (select (arr!47035 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153707 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962741 (let ((h!34847 ((_ extract 31 0) (bvand (bvxor (select (arr!47035 a!2831) j!81) (bvlshr (select (arr!47035 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129053 (bvmul (bvxor h!34847 (bvlshr h!34847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129053 (bvlshr x!129053 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962741 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962741 #b00000000000000000000000000000000))))))

(assert (=> d!153707 (= (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) (bvand (bvxor lt!628917 (bvlshr lt!628917 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428300 d!153707))

(declare-fun b!1428438 () Bool)

(declare-fun lt!628918 () SeekEntryResult!11216)

(assert (=> b!1428438 (and (bvsge (index!47258 lt!628918) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628918) (size!47586 lt!628861)))))

(declare-fun e!806923 () Bool)

(assert (=> b!1428438 (= e!806923 (= (select (arr!47035 lt!628861) (index!47258 lt!628918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428439 () Bool)

(declare-fun e!806922 () SeekEntryResult!11216)

(assert (=> b!1428439 (= e!806922 (Intermediate!11216 false (toIndex!0 lt!628859 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153709 () Bool)

(declare-fun e!806921 () Bool)

(assert (=> d!153709 e!806921))

(declare-fun c!132345 () Bool)

(assert (=> d!153709 (= c!132345 (and ((_ is Intermediate!11216) lt!628918) (undefined!12028 lt!628918)))))

(declare-fun e!806920 () SeekEntryResult!11216)

(assert (=> d!153709 (= lt!628918 e!806920)))

(declare-fun c!132346 () Bool)

(assert (=> d!153709 (= c!132346 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628919 () (_ BitVec 64))

(assert (=> d!153709 (= lt!628919 (select (arr!47035 lt!628861) (toIndex!0 lt!628859 mask!2608)))))

(assert (=> d!153709 (validMask!0 mask!2608)))

(assert (=> d!153709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628859 mask!2608) lt!628859 lt!628861 mask!2608) lt!628918)))

(declare-fun b!1428440 () Bool)

(assert (=> b!1428440 (= e!806920 (Intermediate!11216 true (toIndex!0 lt!628859 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428441 () Bool)

(assert (=> b!1428441 (and (bvsge (index!47258 lt!628918) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628918) (size!47586 lt!628861)))))

(declare-fun res!962742 () Bool)

(assert (=> b!1428441 (= res!962742 (= (select (arr!47035 lt!628861) (index!47258 lt!628918)) lt!628859))))

(assert (=> b!1428441 (=> res!962742 e!806923)))

(declare-fun e!806924 () Bool)

(assert (=> b!1428441 (= e!806924 e!806923)))

(declare-fun b!1428442 () Bool)

(assert (=> b!1428442 (= e!806922 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628859 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!628859 lt!628861 mask!2608))))

(declare-fun b!1428443 () Bool)

(assert (=> b!1428443 (= e!806921 (bvsge (x!129049 lt!628918) #b01111111111111111111111111111110))))

(declare-fun b!1428444 () Bool)

(assert (=> b!1428444 (and (bvsge (index!47258 lt!628918) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628918) (size!47586 lt!628861)))))

(declare-fun res!962744 () Bool)

(assert (=> b!1428444 (= res!962744 (= (select (arr!47035 lt!628861) (index!47258 lt!628918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428444 (=> res!962744 e!806923)))

(declare-fun b!1428445 () Bool)

(assert (=> b!1428445 (= e!806921 e!806924)))

(declare-fun res!962743 () Bool)

(assert (=> b!1428445 (= res!962743 (and ((_ is Intermediate!11216) lt!628918) (not (undefined!12028 lt!628918)) (bvslt (x!129049 lt!628918) #b01111111111111111111111111111110) (bvsge (x!129049 lt!628918) #b00000000000000000000000000000000) (bvsge (x!129049 lt!628918) #b00000000000000000000000000000000)))))

(assert (=> b!1428445 (=> (not res!962743) (not e!806924))))

(declare-fun b!1428446 () Bool)

(assert (=> b!1428446 (= e!806920 e!806922)))

(declare-fun c!132347 () Bool)

(assert (=> b!1428446 (= c!132347 (or (= lt!628919 lt!628859) (= (bvadd lt!628919 lt!628919) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153709 c!132346) b!1428440))

(assert (= (and d!153709 (not c!132346)) b!1428446))

(assert (= (and b!1428446 c!132347) b!1428439))

(assert (= (and b!1428446 (not c!132347)) b!1428442))

(assert (= (and d!153709 c!132345) b!1428443))

(assert (= (and d!153709 (not c!132345)) b!1428445))

(assert (= (and b!1428445 res!962743) b!1428441))

(assert (= (and b!1428441 (not res!962742)) b!1428444))

(assert (= (and b!1428444 (not res!962744)) b!1428438))

(declare-fun m!1319043 () Bool)

(assert (=> b!1428441 m!1319043))

(assert (=> b!1428444 m!1319043))

(assert (=> b!1428442 m!1318923))

(declare-fun m!1319045 () Bool)

(assert (=> b!1428442 m!1319045))

(assert (=> b!1428442 m!1319045))

(declare-fun m!1319047 () Bool)

(assert (=> b!1428442 m!1319047))

(assert (=> d!153709 m!1318923))

(declare-fun m!1319049 () Bool)

(assert (=> d!153709 m!1319049))

(assert (=> d!153709 m!1318905))

(assert (=> b!1428438 m!1319043))

(assert (=> b!1428301 d!153709))

(declare-fun d!153711 () Bool)

(declare-fun lt!628921 () (_ BitVec 32))

(declare-fun lt!628920 () (_ BitVec 32))

(assert (=> d!153711 (= lt!628921 (bvmul (bvxor lt!628920 (bvlshr lt!628920 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153711 (= lt!628920 ((_ extract 31 0) (bvand (bvxor lt!628859 (bvlshr lt!628859 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153711 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962741 (let ((h!34847 ((_ extract 31 0) (bvand (bvxor lt!628859 (bvlshr lt!628859 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129053 (bvmul (bvxor h!34847 (bvlshr h!34847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129053 (bvlshr x!129053 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962741 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962741 #b00000000000000000000000000000000))))))

(assert (=> d!153711 (= (toIndex!0 lt!628859 mask!2608) (bvand (bvxor lt!628921 (bvlshr lt!628921 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428301 d!153711))

(declare-fun b!1428503 () Bool)

(declare-fun e!806962 () Bool)

(declare-fun contains!9895 (List!33532 (_ BitVec 64)) Bool)

(assert (=> b!1428503 (= e!806962 (contains!9895 Nil!33529 (select (arr!47035 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428504 () Bool)

(declare-fun e!806961 () Bool)

(declare-fun e!806959 () Bool)

(assert (=> b!1428504 (= e!806961 e!806959)))

(declare-fun c!132364 () Bool)

(assert (=> b!1428504 (= c!132364 (validKeyInArray!0 (select (arr!47035 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153713 () Bool)

(declare-fun res!962770 () Bool)

(declare-fun e!806960 () Bool)

(assert (=> d!153713 (=> res!962770 e!806960)))

(assert (=> d!153713 (= res!962770 (bvsge #b00000000000000000000000000000000 (size!47586 a!2831)))))

(assert (=> d!153713 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33529) e!806960)))

(declare-fun b!1428505 () Bool)

(declare-fun call!67425 () Bool)

(assert (=> b!1428505 (= e!806959 call!67425)))

(declare-fun bm!67422 () Bool)

(assert (=> bm!67422 (= call!67425 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132364 (Cons!33528 (select (arr!47035 a!2831) #b00000000000000000000000000000000) Nil!33529) Nil!33529)))))

(declare-fun b!1428506 () Bool)

(assert (=> b!1428506 (= e!806960 e!806961)))

(declare-fun res!962771 () Bool)

(assert (=> b!1428506 (=> (not res!962771) (not e!806961))))

(assert (=> b!1428506 (= res!962771 (not e!806962))))

(declare-fun res!962769 () Bool)

(assert (=> b!1428506 (=> (not res!962769) (not e!806962))))

(assert (=> b!1428506 (= res!962769 (validKeyInArray!0 (select (arr!47035 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428507 () Bool)

(assert (=> b!1428507 (= e!806959 call!67425)))

(assert (= (and d!153713 (not res!962770)) b!1428506))

(assert (= (and b!1428506 res!962769) b!1428503))

(assert (= (and b!1428506 res!962771) b!1428504))

(assert (= (and b!1428504 c!132364) b!1428507))

(assert (= (and b!1428504 (not c!132364)) b!1428505))

(assert (= (or b!1428507 b!1428505) bm!67422))

(declare-fun m!1319065 () Bool)

(assert (=> b!1428503 m!1319065))

(assert (=> b!1428503 m!1319065))

(declare-fun m!1319067 () Bool)

(assert (=> b!1428503 m!1319067))

(assert (=> b!1428504 m!1319065))

(assert (=> b!1428504 m!1319065))

(declare-fun m!1319069 () Bool)

(assert (=> b!1428504 m!1319069))

(assert (=> bm!67422 m!1319065))

(declare-fun m!1319071 () Bool)

(assert (=> bm!67422 m!1319071))

(assert (=> b!1428506 m!1319065))

(assert (=> b!1428506 m!1319065))

(assert (=> b!1428506 m!1319069))

(assert (=> b!1428306 d!153713))

(declare-fun call!67428 () Bool)

(declare-fun bm!67425 () Bool)

(assert (=> bm!67425 (= call!67428 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1428525 () Bool)

(declare-fun e!806976 () Bool)

(assert (=> b!1428525 (= e!806976 call!67428)))

(declare-fun b!1428526 () Bool)

(declare-fun e!806975 () Bool)

(assert (=> b!1428526 (= e!806975 e!806976)))

(declare-fun lt!628950 () (_ BitVec 64))

(assert (=> b!1428526 (= lt!628950 (select (arr!47035 a!2831) j!81))))

(declare-fun lt!628952 () Unit!48209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97445 (_ BitVec 64) (_ BitVec 32)) Unit!48209)

(assert (=> b!1428526 (= lt!628952 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628950 j!81))))

(declare-fun arrayContainsKey!0 (array!97445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1428526 (arrayContainsKey!0 a!2831 lt!628950 #b00000000000000000000000000000000)))

(declare-fun lt!628951 () Unit!48209)

(assert (=> b!1428526 (= lt!628951 lt!628952)))

(declare-fun res!962781 () Bool)

(assert (=> b!1428526 (= res!962781 (= (seekEntryOrOpen!0 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) (Found!11216 j!81)))))

(assert (=> b!1428526 (=> (not res!962781) (not e!806976))))

(declare-fun d!153721 () Bool)

(declare-fun res!962782 () Bool)

(declare-fun e!806974 () Bool)

(assert (=> d!153721 (=> res!962782 e!806974)))

(assert (=> d!153721 (= res!962782 (bvsge j!81 (size!47586 a!2831)))))

(assert (=> d!153721 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806974)))

(declare-fun b!1428527 () Bool)

(assert (=> b!1428527 (= e!806975 call!67428)))

(declare-fun b!1428528 () Bool)

(assert (=> b!1428528 (= e!806974 e!806975)))

(declare-fun c!132370 () Bool)

(assert (=> b!1428528 (= c!132370 (validKeyInArray!0 (select (arr!47035 a!2831) j!81)))))

(assert (= (and d!153721 (not res!962782)) b!1428528))

(assert (= (and b!1428528 c!132370) b!1428526))

(assert (= (and b!1428528 (not c!132370)) b!1428527))

(assert (= (and b!1428526 res!962781) b!1428525))

(assert (= (or b!1428525 b!1428527) bm!67425))

(declare-fun m!1319081 () Bool)

(assert (=> bm!67425 m!1319081))

(assert (=> b!1428526 m!1318909))

(declare-fun m!1319083 () Bool)

(assert (=> b!1428526 m!1319083))

(declare-fun m!1319085 () Bool)

(assert (=> b!1428526 m!1319085))

(assert (=> b!1428526 m!1318909))

(assert (=> b!1428526 m!1318915))

(assert (=> b!1428528 m!1318909))

(assert (=> b!1428528 m!1318909))

(assert (=> b!1428528 m!1318935))

(assert (=> b!1428299 d!153721))

(declare-fun d!153729 () Bool)

(assert (=> d!153729 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628970 () Unit!48209)

(declare-fun choose!38 (array!97445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48209)

(assert (=> d!153729 (= lt!628970 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153729 (validMask!0 mask!2608)))

(assert (=> d!153729 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628970)))

(declare-fun bs!41605 () Bool)

(assert (= bs!41605 d!153729))

(assert (=> bs!41605 m!1318939))

(declare-fun m!1319089 () Bool)

(assert (=> bs!41605 m!1319089))

(assert (=> bs!41605 m!1318905))

(assert (=> b!1428299 d!153729))

(declare-fun b!1428549 () Bool)

(declare-fun lt!628971 () SeekEntryResult!11216)

(assert (=> b!1428549 (and (bvsge (index!47258 lt!628971) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628971) (size!47586 a!2831)))))

(declare-fun e!806995 () Bool)

(assert (=> b!1428549 (= e!806995 (= (select (arr!47035 a!2831) (index!47258 lt!628971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428550 () Bool)

(declare-fun e!806994 () SeekEntryResult!11216)

(assert (=> b!1428550 (= e!806994 (Intermediate!11216 false index!585 x!605))))

(declare-fun d!153731 () Bool)

(declare-fun e!806993 () Bool)

(assert (=> d!153731 e!806993))

(declare-fun c!132376 () Bool)

(assert (=> d!153731 (= c!132376 (and ((_ is Intermediate!11216) lt!628971) (undefined!12028 lt!628971)))))

(declare-fun e!806992 () SeekEntryResult!11216)

(assert (=> d!153731 (= lt!628971 e!806992)))

(declare-fun c!132377 () Bool)

(assert (=> d!153731 (= c!132377 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628972 () (_ BitVec 64))

(assert (=> d!153731 (= lt!628972 (select (arr!47035 a!2831) index!585))))

(assert (=> d!153731 (validMask!0 mask!2608)))

(assert (=> d!153731 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!628971)))

(declare-fun b!1428551 () Bool)

(assert (=> b!1428551 (= e!806992 (Intermediate!11216 true index!585 x!605))))

(declare-fun b!1428552 () Bool)

(assert (=> b!1428552 (and (bvsge (index!47258 lt!628971) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628971) (size!47586 a!2831)))))

(declare-fun res!962793 () Bool)

(assert (=> b!1428552 (= res!962793 (= (select (arr!47035 a!2831) (index!47258 lt!628971)) (select (arr!47035 a!2831) j!81)))))

(assert (=> b!1428552 (=> res!962793 e!806995)))

(declare-fun e!806996 () Bool)

(assert (=> b!1428552 (= e!806996 e!806995)))

(declare-fun b!1428553 () Bool)

(assert (=> b!1428553 (= e!806994 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47035 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428554 () Bool)

(assert (=> b!1428554 (= e!806993 (bvsge (x!129049 lt!628971) #b01111111111111111111111111111110))))

(declare-fun b!1428555 () Bool)

(assert (=> b!1428555 (and (bvsge (index!47258 lt!628971) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628971) (size!47586 a!2831)))))

(declare-fun res!962795 () Bool)

(assert (=> b!1428555 (= res!962795 (= (select (arr!47035 a!2831) (index!47258 lt!628971)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428555 (=> res!962795 e!806995)))

(declare-fun b!1428556 () Bool)

(assert (=> b!1428556 (= e!806993 e!806996)))

(declare-fun res!962794 () Bool)

(assert (=> b!1428556 (= res!962794 (and ((_ is Intermediate!11216) lt!628971) (not (undefined!12028 lt!628971)) (bvslt (x!129049 lt!628971) #b01111111111111111111111111111110) (bvsge (x!129049 lt!628971) #b00000000000000000000000000000000) (bvsge (x!129049 lt!628971) x!605)))))

(assert (=> b!1428556 (=> (not res!962794) (not e!806996))))

(declare-fun b!1428557 () Bool)

(assert (=> b!1428557 (= e!806992 e!806994)))

(declare-fun c!132378 () Bool)

(assert (=> b!1428557 (= c!132378 (or (= lt!628972 (select (arr!47035 a!2831) j!81)) (= (bvadd lt!628972 lt!628972) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153731 c!132377) b!1428551))

(assert (= (and d!153731 (not c!132377)) b!1428557))

(assert (= (and b!1428557 c!132378) b!1428550))

(assert (= (and b!1428557 (not c!132378)) b!1428553))

(assert (= (and d!153731 c!132376) b!1428554))

(assert (= (and d!153731 (not c!132376)) b!1428556))

(assert (= (and b!1428556 res!962794) b!1428552))

(assert (= (and b!1428552 (not res!962793)) b!1428555))

(assert (= (and b!1428555 (not res!962795)) b!1428549))

(declare-fun m!1319101 () Bool)

(assert (=> b!1428552 m!1319101))

(assert (=> b!1428555 m!1319101))

(declare-fun m!1319103 () Bool)

(assert (=> b!1428553 m!1319103))

(assert (=> b!1428553 m!1319103))

(assert (=> b!1428553 m!1318909))

(declare-fun m!1319105 () Bool)

(assert (=> b!1428553 m!1319105))

(assert (=> d!153731 m!1318937))

(assert (=> d!153731 m!1318905))

(assert (=> b!1428549 m!1319101))

(assert (=> b!1428304 d!153731))

(declare-fun d!153737 () Bool)

(assert (=> d!153737 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123260 d!153737))

(declare-fun d!153751 () Bool)

(assert (=> d!153751 (= (array_inv!36316 a!2831) (bvsge (size!47586 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123260 d!153751))

(declare-fun bm!67432 () Bool)

(declare-fun call!67435 () Bool)

(assert (=> bm!67432 (= call!67435 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1428589 () Bool)

(declare-fun e!807017 () Bool)

(assert (=> b!1428589 (= e!807017 call!67435)))

(declare-fun b!1428590 () Bool)

(declare-fun e!807016 () Bool)

(assert (=> b!1428590 (= e!807016 e!807017)))

(declare-fun lt!628987 () (_ BitVec 64))

(assert (=> b!1428590 (= lt!628987 (select (arr!47035 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628989 () Unit!48209)

(assert (=> b!1428590 (= lt!628989 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628987 #b00000000000000000000000000000000))))

(assert (=> b!1428590 (arrayContainsKey!0 a!2831 lt!628987 #b00000000000000000000000000000000)))

(declare-fun lt!628988 () Unit!48209)

(assert (=> b!1428590 (= lt!628988 lt!628989)))

(declare-fun res!962807 () Bool)

(assert (=> b!1428590 (= res!962807 (= (seekEntryOrOpen!0 (select (arr!47035 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11216 #b00000000000000000000000000000000)))))

(assert (=> b!1428590 (=> (not res!962807) (not e!807017))))

(declare-fun d!153753 () Bool)

(declare-fun res!962808 () Bool)

(declare-fun e!807015 () Bool)

(assert (=> d!153753 (=> res!962808 e!807015)))

(assert (=> d!153753 (= res!962808 (bvsge #b00000000000000000000000000000000 (size!47586 a!2831)))))

(assert (=> d!153753 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807015)))

(declare-fun b!1428591 () Bool)

(assert (=> b!1428591 (= e!807016 call!67435)))

(declare-fun b!1428592 () Bool)

(assert (=> b!1428592 (= e!807015 e!807016)))

(declare-fun c!132389 () Bool)

(assert (=> b!1428592 (= c!132389 (validKeyInArray!0 (select (arr!47035 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153753 (not res!962808)) b!1428592))

(assert (= (and b!1428592 c!132389) b!1428590))

(assert (= (and b!1428592 (not c!132389)) b!1428591))

(assert (= (and b!1428590 res!962807) b!1428589))

(assert (= (or b!1428589 b!1428591) bm!67432))

(declare-fun m!1319137 () Bool)

(assert (=> bm!67432 m!1319137))

(assert (=> b!1428590 m!1319065))

(declare-fun m!1319139 () Bool)

(assert (=> b!1428590 m!1319139))

(declare-fun m!1319141 () Bool)

(assert (=> b!1428590 m!1319141))

(assert (=> b!1428590 m!1319065))

(declare-fun m!1319143 () Bool)

(assert (=> b!1428590 m!1319143))

(assert (=> b!1428592 m!1319065))

(assert (=> b!1428592 m!1319065))

(assert (=> b!1428592 m!1319069))

(assert (=> b!1428294 d!153753))

(declare-fun d!153755 () Bool)

(assert (=> d!153755 (= (validKeyInArray!0 (select (arr!47035 a!2831) i!982)) (and (not (= (select (arr!47035 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47035 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428298 d!153755))

(declare-fun d!153761 () Bool)

(assert (=> d!153761 (= (validKeyInArray!0 (select (arr!47035 a!2831) j!81)) (and (not (= (select (arr!47035 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47035 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428296 d!153761))

(declare-fun b!1428593 () Bool)

(declare-fun lt!628990 () SeekEntryResult!11216)

(assert (=> b!1428593 (and (bvsge (index!47258 lt!628990) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628990) (size!47586 lt!628861)))))

(declare-fun e!807021 () Bool)

(assert (=> b!1428593 (= e!807021 (= (select (arr!47035 lt!628861) (index!47258 lt!628990)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428594 () Bool)

(declare-fun e!807020 () SeekEntryResult!11216)

(assert (=> b!1428594 (= e!807020 (Intermediate!11216 false index!585 x!605))))

(declare-fun d!153763 () Bool)

(declare-fun e!807019 () Bool)

(assert (=> d!153763 e!807019))

(declare-fun c!132390 () Bool)

(assert (=> d!153763 (= c!132390 (and ((_ is Intermediate!11216) lt!628990) (undefined!12028 lt!628990)))))

(declare-fun e!807018 () SeekEntryResult!11216)

(assert (=> d!153763 (= lt!628990 e!807018)))

(declare-fun c!132391 () Bool)

(assert (=> d!153763 (= c!132391 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628991 () (_ BitVec 64))

(assert (=> d!153763 (= lt!628991 (select (arr!47035 lt!628861) index!585))))

(assert (=> d!153763 (validMask!0 mask!2608)))

(assert (=> d!153763 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628859 lt!628861 mask!2608) lt!628990)))

(declare-fun b!1428595 () Bool)

(assert (=> b!1428595 (= e!807018 (Intermediate!11216 true index!585 x!605))))

(declare-fun b!1428596 () Bool)

(assert (=> b!1428596 (and (bvsge (index!47258 lt!628990) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628990) (size!47586 lt!628861)))))

(declare-fun res!962809 () Bool)

(assert (=> b!1428596 (= res!962809 (= (select (arr!47035 lt!628861) (index!47258 lt!628990)) lt!628859))))

(assert (=> b!1428596 (=> res!962809 e!807021)))

(declare-fun e!807022 () Bool)

(assert (=> b!1428596 (= e!807022 e!807021)))

(declare-fun b!1428597 () Bool)

(assert (=> b!1428597 (= e!807020 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!628859 lt!628861 mask!2608))))

(declare-fun b!1428598 () Bool)

(assert (=> b!1428598 (= e!807019 (bvsge (x!129049 lt!628990) #b01111111111111111111111111111110))))

(declare-fun b!1428599 () Bool)

(assert (=> b!1428599 (and (bvsge (index!47258 lt!628990) #b00000000000000000000000000000000) (bvslt (index!47258 lt!628990) (size!47586 lt!628861)))))

(declare-fun res!962811 () Bool)

(assert (=> b!1428599 (= res!962811 (= (select (arr!47035 lt!628861) (index!47258 lt!628990)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428599 (=> res!962811 e!807021)))

(declare-fun b!1428600 () Bool)

(assert (=> b!1428600 (= e!807019 e!807022)))

(declare-fun res!962810 () Bool)

(assert (=> b!1428600 (= res!962810 (and ((_ is Intermediate!11216) lt!628990) (not (undefined!12028 lt!628990)) (bvslt (x!129049 lt!628990) #b01111111111111111111111111111110) (bvsge (x!129049 lt!628990) #b00000000000000000000000000000000) (bvsge (x!129049 lt!628990) x!605)))))

(assert (=> b!1428600 (=> (not res!962810) (not e!807022))))

(declare-fun b!1428601 () Bool)

(assert (=> b!1428601 (= e!807018 e!807020)))

(declare-fun c!132392 () Bool)

(assert (=> b!1428601 (= c!132392 (or (= lt!628991 lt!628859) (= (bvadd lt!628991 lt!628991) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!153763 c!132391) b!1428595))

(assert (= (and d!153763 (not c!132391)) b!1428601))

(assert (= (and b!1428601 c!132392) b!1428594))

(assert (= (and b!1428601 (not c!132392)) b!1428597))

(assert (= (and d!153763 c!132390) b!1428598))

(assert (= (and d!153763 (not c!132390)) b!1428600))

(assert (= (and b!1428600 res!962810) b!1428596))

(assert (= (and b!1428596 (not res!962809)) b!1428599))

(assert (= (and b!1428599 (not res!962811)) b!1428593))

(declare-fun m!1319145 () Bool)

(assert (=> b!1428596 m!1319145))

(assert (=> b!1428599 m!1319145))

(assert (=> b!1428597 m!1319103))

(assert (=> b!1428597 m!1319103))

(declare-fun m!1319147 () Bool)

(assert (=> b!1428597 m!1319147))

(declare-fun m!1319149 () Bool)

(assert (=> d!153763 m!1319149))

(assert (=> d!153763 m!1318905))

(assert (=> b!1428593 m!1319145))

(assert (=> b!1428302 d!153763))

(check-sat (not b!1428442) (not d!153699) (not d!153709) (not d!153701) (not b!1428425) (not b!1428526) (not b!1428553) (not b!1428504) (not bm!67422) (not bm!67432) (not b!1428506) (not b!1428592) (not b!1428503) (not d!153731) (not b!1428597) (not d!153729) (not bm!67425) (not b!1428590) (not b!1428397) (not b!1428528) (not d!153763))
(check-sat)
