; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123018 () Bool)

(assert start!123018)

(declare-fun b!1426845 () Bool)

(declare-fun res!962082 () Bool)

(declare-fun e!805934 () Bool)

(assert (=> b!1426845 (=> (not res!962082) (not e!805934))))

(declare-datatypes ((array!97332 0))(
  ( (array!97333 (arr!46982 (Array (_ BitVec 32) (_ BitVec 64))) (size!47532 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97332)

(declare-datatypes ((List!33492 0))(
  ( (Nil!33489) (Cons!33488 (h!34793 (_ BitVec 64)) (t!48186 List!33492)) )
))
(declare-fun arrayNoDuplicates!0 (array!97332 (_ BitVec 32) List!33492) Bool)

(assert (=> b!1426845 (= res!962082 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33489))))

(declare-fun b!1426846 () Bool)

(declare-fun e!805930 () Bool)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426846 (= e!805930 (not (not (= (select (arr!46982 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!805932 () Bool)

(assert (=> b!1426846 e!805932))

(declare-fun res!962078 () Bool)

(assert (=> b!1426846 (=> (not res!962078) (not e!805932))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97332 (_ BitVec 32)) Bool)

(assert (=> b!1426846 (= res!962078 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48268 0))(
  ( (Unit!48269) )
))
(declare-fun lt!628329 () Unit!48268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48268)

(assert (=> b!1426846 (= lt!628329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426847 () Bool)

(declare-fun res!962077 () Bool)

(assert (=> b!1426847 (=> (not res!962077) (not e!805934))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426847 (= res!962077 (and (= (size!47532 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47532 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47532 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426848 () Bool)

(declare-fun res!962083 () Bool)

(assert (=> b!1426848 (=> (not res!962083) (not e!805934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426848 (= res!962083 (validKeyInArray!0 (select (arr!46982 a!2831) i!982)))))

(declare-fun b!1426849 () Bool)

(declare-fun e!805931 () Bool)

(assert (=> b!1426849 (= e!805934 e!805931)))

(declare-fun res!962084 () Bool)

(assert (=> b!1426849 (=> (not res!962084) (not e!805931))))

(declare-datatypes ((SeekEntryResult!11261 0))(
  ( (MissingZero!11261 (index!47436 (_ BitVec 32))) (Found!11261 (index!47437 (_ BitVec 32))) (Intermediate!11261 (undefined!12073 Bool) (index!47438 (_ BitVec 32)) (x!129069 (_ BitVec 32))) (Undefined!11261) (MissingVacant!11261 (index!47439 (_ BitVec 32))) )
))
(declare-fun lt!628331 () SeekEntryResult!11261)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97332 (_ BitVec 32)) SeekEntryResult!11261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426849 (= res!962084 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608) (select (arr!46982 a!2831) j!81) a!2831 mask!2608) lt!628331))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426849 (= lt!628331 (Intermediate!11261 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426850 () Bool)

(declare-fun res!962089 () Bool)

(assert (=> b!1426850 (=> (not res!962089) (not e!805934))))

(assert (=> b!1426850 (= res!962089 (validKeyInArray!0 (select (arr!46982 a!2831) j!81)))))

(declare-fun b!1426851 () Bool)

(declare-fun res!962087 () Bool)

(assert (=> b!1426851 (=> (not res!962087) (not e!805930))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1426851 (= res!962087 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46982 a!2831) j!81) a!2831 mask!2608) lt!628331))))

(declare-fun b!1426852 () Bool)

(declare-fun res!962088 () Bool)

(assert (=> b!1426852 (=> (not res!962088) (not e!805930))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426852 (= res!962088 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426853 () Bool)

(declare-fun res!962081 () Bool)

(assert (=> b!1426853 (=> (not res!962081) (not e!805934))))

(assert (=> b!1426853 (= res!962081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!962085 () Bool)

(assert (=> start!123018 (=> (not res!962085) (not e!805934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123018 (= res!962085 (validMask!0 mask!2608))))

(assert (=> start!123018 e!805934))

(assert (=> start!123018 true))

(declare-fun array_inv!36010 (array!97332) Bool)

(assert (=> start!123018 (array_inv!36010 a!2831)))

(declare-fun b!1426854 () Bool)

(declare-fun res!962080 () Bool)

(assert (=> b!1426854 (=> (not res!962080) (not e!805930))))

(declare-fun lt!628332 () (_ BitVec 64))

(declare-fun lt!628328 () SeekEntryResult!11261)

(declare-fun lt!628330 () array!97332)

(assert (=> b!1426854 (= res!962080 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628332 lt!628330 mask!2608) lt!628328))))

(declare-fun b!1426855 () Bool)

(declare-fun res!962086 () Bool)

(assert (=> b!1426855 (=> (not res!962086) (not e!805934))))

(assert (=> b!1426855 (= res!962086 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47532 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47532 a!2831))))))

(declare-fun b!1426856 () Bool)

(assert (=> b!1426856 (= e!805931 e!805930)))

(declare-fun res!962079 () Bool)

(assert (=> b!1426856 (=> (not res!962079) (not e!805930))))

(assert (=> b!1426856 (= res!962079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628332 mask!2608) lt!628332 lt!628330 mask!2608) lt!628328))))

(assert (=> b!1426856 (= lt!628328 (Intermediate!11261 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426856 (= lt!628332 (select (store (arr!46982 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426856 (= lt!628330 (array!97333 (store (arr!46982 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47532 a!2831)))))

(declare-fun b!1426857 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97332 (_ BitVec 32)) SeekEntryResult!11261)

(assert (=> b!1426857 (= e!805932 (= (seekEntryOrOpen!0 (select (arr!46982 a!2831) j!81) a!2831 mask!2608) (Found!11261 j!81)))))

(assert (= (and start!123018 res!962085) b!1426847))

(assert (= (and b!1426847 res!962077) b!1426848))

(assert (= (and b!1426848 res!962083) b!1426850))

(assert (= (and b!1426850 res!962089) b!1426853))

(assert (= (and b!1426853 res!962081) b!1426845))

(assert (= (and b!1426845 res!962082) b!1426855))

(assert (= (and b!1426855 res!962086) b!1426849))

(assert (= (and b!1426849 res!962084) b!1426856))

(assert (= (and b!1426856 res!962079) b!1426851))

(assert (= (and b!1426851 res!962087) b!1426854))

(assert (= (and b!1426854 res!962080) b!1426852))

(assert (= (and b!1426852 res!962088) b!1426846))

(assert (= (and b!1426846 res!962078) b!1426857))

(declare-fun m!1317339 () Bool)

(assert (=> b!1426853 m!1317339))

(declare-fun m!1317341 () Bool)

(assert (=> b!1426846 m!1317341))

(declare-fun m!1317343 () Bool)

(assert (=> b!1426846 m!1317343))

(declare-fun m!1317345 () Bool)

(assert (=> b!1426846 m!1317345))

(declare-fun m!1317347 () Bool)

(assert (=> b!1426856 m!1317347))

(assert (=> b!1426856 m!1317347))

(declare-fun m!1317349 () Bool)

(assert (=> b!1426856 m!1317349))

(declare-fun m!1317351 () Bool)

(assert (=> b!1426856 m!1317351))

(declare-fun m!1317353 () Bool)

(assert (=> b!1426856 m!1317353))

(declare-fun m!1317355 () Bool)

(assert (=> b!1426849 m!1317355))

(assert (=> b!1426849 m!1317355))

(declare-fun m!1317357 () Bool)

(assert (=> b!1426849 m!1317357))

(assert (=> b!1426849 m!1317357))

(assert (=> b!1426849 m!1317355))

(declare-fun m!1317359 () Bool)

(assert (=> b!1426849 m!1317359))

(assert (=> b!1426857 m!1317355))

(assert (=> b!1426857 m!1317355))

(declare-fun m!1317361 () Bool)

(assert (=> b!1426857 m!1317361))

(assert (=> b!1426850 m!1317355))

(assert (=> b!1426850 m!1317355))

(declare-fun m!1317363 () Bool)

(assert (=> b!1426850 m!1317363))

(assert (=> b!1426851 m!1317355))

(assert (=> b!1426851 m!1317355))

(declare-fun m!1317365 () Bool)

(assert (=> b!1426851 m!1317365))

(declare-fun m!1317367 () Bool)

(assert (=> start!123018 m!1317367))

(declare-fun m!1317369 () Bool)

(assert (=> start!123018 m!1317369))

(declare-fun m!1317371 () Bool)

(assert (=> b!1426848 m!1317371))

(assert (=> b!1426848 m!1317371))

(declare-fun m!1317373 () Bool)

(assert (=> b!1426848 m!1317373))

(declare-fun m!1317375 () Bool)

(assert (=> b!1426854 m!1317375))

(declare-fun m!1317377 () Bool)

(assert (=> b!1426845 m!1317377))

(push 1)

(assert (not b!1426848))

(assert (not b!1426854))

(assert (not b!1426856))

(assert (not b!1426851))

(assert (not start!123018))

(assert (not b!1426853))

(assert (not b!1426849))

(assert (not b!1426846))

(assert (not b!1426850))

(assert (not b!1426845))

(assert (not b!1426857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1427084 () Bool)

(declare-fun e!806053 () SeekEntryResult!11261)

(declare-fun e!806057 () SeekEntryResult!11261)

(assert (=> b!1427084 (= e!806053 e!806057)))

(declare-fun lt!628418 () (_ BitVec 64))

(declare-fun c!131921 () Bool)

(assert (=> b!1427084 (= c!131921 (or (= lt!628418 (select (arr!46982 a!2831) j!81)) (= (bvadd lt!628418 lt!628418) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427085 () Bool)

(declare-fun e!806056 () Bool)

(declare-fun e!806054 () Bool)

(assert (=> b!1427085 (= e!806056 e!806054)))

(declare-fun res!962221 () Bool)

(declare-fun lt!628417 () SeekEntryResult!11261)

(assert (=> b!1427085 (= res!962221 (and (is-Intermediate!11261 lt!628417) (not (undefined!12073 lt!628417)) (bvslt (x!129069 lt!628417) #b01111111111111111111111111111110) (bvsge (x!129069 lt!628417) #b00000000000000000000000000000000) (bvsge (x!129069 lt!628417) #b00000000000000000000000000000000)))))

(assert (=> b!1427085 (=> (not res!962221) (not e!806054))))

(declare-fun d!153293 () Bool)

(assert (=> d!153293 e!806056))

(declare-fun c!131923 () Bool)

(assert (=> d!153293 (= c!131923 (and (is-Intermediate!11261 lt!628417) (undefined!12073 lt!628417)))))

(assert (=> d!153293 (= lt!628417 e!806053)))

(declare-fun c!131922 () Bool)

(assert (=> d!153293 (= c!131922 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153293 (= lt!628418 (select (arr!46982 a!2831) (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608)))))

(assert (=> d!153293 (validMask!0 mask!2608)))

(assert (=> d!153293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608) (select (arr!46982 a!2831) j!81) a!2831 mask!2608) lt!628417)))

(declare-fun b!1427086 () Bool)

(assert (=> b!1427086 (= e!806057 (Intermediate!11261 false (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427087 () Bool)

(assert (=> b!1427087 (= e!806056 (bvsge (x!129069 lt!628417) #b01111111111111111111111111111110))))

(declare-fun b!1427088 () Bool)

(assert (=> b!1427088 (and (bvsge (index!47438 lt!628417) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628417) (size!47532 a!2831)))))

(declare-fun res!962220 () Bool)

(assert (=> b!1427088 (= res!962220 (= (select (arr!46982 a!2831) (index!47438 lt!628417)) (select (arr!46982 a!2831) j!81)))))

(declare-fun e!806055 () Bool)

(assert (=> b!1427088 (=> res!962220 e!806055)))

(assert (=> b!1427088 (= e!806054 e!806055)))

(declare-fun b!1427089 () Bool)

(assert (=> b!1427089 (and (bvsge (index!47438 lt!628417) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628417) (size!47532 a!2831)))))

(declare-fun res!962219 () Bool)

(assert (=> b!1427089 (= res!962219 (= (select (arr!46982 a!2831) (index!47438 lt!628417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427089 (=> res!962219 e!806055)))

(declare-fun b!1427090 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427090 (= e!806057 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46982 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427091 () Bool)

(assert (=> b!1427091 (= e!806053 (Intermediate!11261 true (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427092 () Bool)

(assert (=> b!1427092 (and (bvsge (index!47438 lt!628417) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628417) (size!47532 a!2831)))))

(assert (=> b!1427092 (= e!806055 (= (select (arr!46982 a!2831) (index!47438 lt!628417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153293 c!131922) b!1427091))

(assert (= (and d!153293 (not c!131922)) b!1427084))

(assert (= (and b!1427084 c!131921) b!1427086))

(assert (= (and b!1427084 (not c!131921)) b!1427090))

(assert (= (and d!153293 c!131923) b!1427087))

(assert (= (and d!153293 (not c!131923)) b!1427085))

(assert (= (and b!1427085 res!962221) b!1427088))

(assert (= (and b!1427088 (not res!962220)) b!1427089))

(assert (= (and b!1427089 (not res!962219)) b!1427092))

(declare-fun m!1317529 () Bool)

(assert (=> b!1427092 m!1317529))

(assert (=> b!1427090 m!1317357))

(declare-fun m!1317531 () Bool)

(assert (=> b!1427090 m!1317531))

(assert (=> b!1427090 m!1317531))

(assert (=> b!1427090 m!1317355))

(declare-fun m!1317533 () Bool)

(assert (=> b!1427090 m!1317533))

(assert (=> b!1427088 m!1317529))

(assert (=> b!1427089 m!1317529))

(assert (=> d!153293 m!1317357))

(declare-fun m!1317535 () Bool)

(assert (=> d!153293 m!1317535))

(assert (=> d!153293 m!1317367))

(assert (=> b!1426849 d!153293))

(declare-fun d!153303 () Bool)

(declare-fun lt!628428 () (_ BitVec 32))

(declare-fun lt!628427 () (_ BitVec 32))

(assert (=> d!153303 (= lt!628428 (bvmul (bvxor lt!628427 (bvlshr lt!628427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153303 (= lt!628427 ((_ extract 31 0) (bvand (bvxor (select (arr!46982 a!2831) j!81) (bvlshr (select (arr!46982 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153303 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962223 (let ((h!34798 ((_ extract 31 0) (bvand (bvxor (select (arr!46982 a!2831) j!81) (bvlshr (select (arr!46982 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129077 (bvmul (bvxor h!34798 (bvlshr h!34798 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129077 (bvlshr x!129077 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962223 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962223 #b00000000000000000000000000000000))))))

(assert (=> d!153303 (= (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608) (bvand (bvxor lt!628428 (bvlshr lt!628428 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426849 d!153303))

(declare-fun d!153305 () Bool)

(assert (=> d!153305 (= (validKeyInArray!0 (select (arr!46982 a!2831) j!81)) (and (not (= (select (arr!46982 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46982 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426850 d!153305))

(declare-fun b!1427093 () Bool)

(declare-fun e!806058 () SeekEntryResult!11261)

(declare-fun e!806062 () SeekEntryResult!11261)

(assert (=> b!1427093 (= e!806058 e!806062)))

(declare-fun lt!628432 () (_ BitVec 64))

(declare-fun c!131924 () Bool)

(assert (=> b!1427093 (= c!131924 (or (= lt!628432 (select (arr!46982 a!2831) j!81)) (= (bvadd lt!628432 lt!628432) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427094 () Bool)

(declare-fun e!806061 () Bool)

(declare-fun e!806059 () Bool)

(assert (=> b!1427094 (= e!806061 e!806059)))

(declare-fun res!962226 () Bool)

(declare-fun lt!628431 () SeekEntryResult!11261)

(assert (=> b!1427094 (= res!962226 (and (is-Intermediate!11261 lt!628431) (not (undefined!12073 lt!628431)) (bvslt (x!129069 lt!628431) #b01111111111111111111111111111110) (bvsge (x!129069 lt!628431) #b00000000000000000000000000000000) (bvsge (x!129069 lt!628431) x!605)))))

(assert (=> b!1427094 (=> (not res!962226) (not e!806059))))

(declare-fun d!153311 () Bool)

(assert (=> d!153311 e!806061))

(declare-fun c!131926 () Bool)

(assert (=> d!153311 (= c!131926 (and (is-Intermediate!11261 lt!628431) (undefined!12073 lt!628431)))))

(assert (=> d!153311 (= lt!628431 e!806058)))

(declare-fun c!131925 () Bool)

(assert (=> d!153311 (= c!131925 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153311 (= lt!628432 (select (arr!46982 a!2831) index!585))))

(assert (=> d!153311 (validMask!0 mask!2608)))

(assert (=> d!153311 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46982 a!2831) j!81) a!2831 mask!2608) lt!628431)))

(declare-fun b!1427095 () Bool)

(assert (=> b!1427095 (= e!806062 (Intermediate!11261 false index!585 x!605))))

(declare-fun b!1427096 () Bool)

(assert (=> b!1427096 (= e!806061 (bvsge (x!129069 lt!628431) #b01111111111111111111111111111110))))

(declare-fun b!1427097 () Bool)

(assert (=> b!1427097 (and (bvsge (index!47438 lt!628431) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628431) (size!47532 a!2831)))))

(declare-fun res!962225 () Bool)

(assert (=> b!1427097 (= res!962225 (= (select (arr!46982 a!2831) (index!47438 lt!628431)) (select (arr!46982 a!2831) j!81)))))

(declare-fun e!806060 () Bool)

(assert (=> b!1427097 (=> res!962225 e!806060)))

(assert (=> b!1427097 (= e!806059 e!806060)))

(declare-fun b!1427098 () Bool)

(assert (=> b!1427098 (and (bvsge (index!47438 lt!628431) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628431) (size!47532 a!2831)))))

(declare-fun res!962224 () Bool)

(assert (=> b!1427098 (= res!962224 (= (select (arr!46982 a!2831) (index!47438 lt!628431)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427098 (=> res!962224 e!806060)))

(declare-fun b!1427099 () Bool)

(assert (=> b!1427099 (= e!806062 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46982 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427100 () Bool)

(assert (=> b!1427100 (= e!806058 (Intermediate!11261 true index!585 x!605))))

(declare-fun b!1427101 () Bool)

(assert (=> b!1427101 (and (bvsge (index!47438 lt!628431) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628431) (size!47532 a!2831)))))

(assert (=> b!1427101 (= e!806060 (= (select (arr!46982 a!2831) (index!47438 lt!628431)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153311 c!131925) b!1427100))

(assert (= (and d!153311 (not c!131925)) b!1427093))

(assert (= (and b!1427093 c!131924) b!1427095))

(assert (= (and b!1427093 (not c!131924)) b!1427099))

(assert (= (and d!153311 c!131926) b!1427096))

(assert (= (and d!153311 (not c!131926)) b!1427094))

(assert (= (and b!1427094 res!962226) b!1427097))

(assert (= (and b!1427097 (not res!962225)) b!1427098))

(assert (= (and b!1427098 (not res!962224)) b!1427101))

(declare-fun m!1317537 () Bool)

(assert (=> b!1427101 m!1317537))

(declare-fun m!1317539 () Bool)

(assert (=> b!1427099 m!1317539))

(assert (=> b!1427099 m!1317539))

(assert (=> b!1427099 m!1317355))

(declare-fun m!1317541 () Bool)

(assert (=> b!1427099 m!1317541))

(assert (=> b!1427097 m!1317537))

(assert (=> b!1427098 m!1317537))

(assert (=> d!153311 m!1317341))

(assert (=> d!153311 m!1317367))

(assert (=> b!1426851 d!153311))

(declare-fun bm!67349 () Bool)

(declare-fun call!67352 () Bool)

(assert (=> bm!67349 (= call!67352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427110 () Bool)

(declare-fun e!806071 () Bool)

(declare-fun e!806069 () Bool)

(assert (=> b!1427110 (= e!806071 e!806069)))

(declare-fun lt!628439 () (_ BitVec 64))

(assert (=> b!1427110 (= lt!628439 (select (arr!46982 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628440 () Unit!48268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97332 (_ BitVec 64) (_ BitVec 32)) Unit!48268)

(assert (=> b!1427110 (= lt!628440 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628439 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1427110 (arrayContainsKey!0 a!2831 lt!628439 #b00000000000000000000000000000000)))

(declare-fun lt!628441 () Unit!48268)

(assert (=> b!1427110 (= lt!628441 lt!628440)))

(declare-fun res!962231 () Bool)

(assert (=> b!1427110 (= res!962231 (= (seekEntryOrOpen!0 (select (arr!46982 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11261 #b00000000000000000000000000000000)))))

(assert (=> b!1427110 (=> (not res!962231) (not e!806069))))

(declare-fun b!1427111 () Bool)

(assert (=> b!1427111 (= e!806069 call!67352)))

(declare-fun d!153313 () Bool)

(declare-fun res!962232 () Bool)

(declare-fun e!806070 () Bool)

(assert (=> d!153313 (=> res!962232 e!806070)))

(assert (=> d!153313 (= res!962232 (bvsge #b00000000000000000000000000000000 (size!47532 a!2831)))))

(assert (=> d!153313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806070)))

(declare-fun b!1427112 () Bool)

(assert (=> b!1427112 (= e!806070 e!806071)))

(declare-fun c!131929 () Bool)

(assert (=> b!1427112 (= c!131929 (validKeyInArray!0 (select (arr!46982 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427113 () Bool)

(assert (=> b!1427113 (= e!806071 call!67352)))

(assert (= (and d!153313 (not res!962232)) b!1427112))

(assert (= (and b!1427112 c!131929) b!1427110))

(assert (= (and b!1427112 (not c!131929)) b!1427113))

(assert (= (and b!1427110 res!962231) b!1427111))

(assert (= (or b!1427111 b!1427113) bm!67349))

(declare-fun m!1317543 () Bool)

(assert (=> bm!67349 m!1317543))

(declare-fun m!1317545 () Bool)

(assert (=> b!1427110 m!1317545))

(declare-fun m!1317547 () Bool)

(assert (=> b!1427110 m!1317547))

(declare-fun m!1317549 () Bool)

(assert (=> b!1427110 m!1317549))

(assert (=> b!1427110 m!1317545))

(declare-fun m!1317551 () Bool)

(assert (=> b!1427110 m!1317551))

(assert (=> b!1427112 m!1317545))

(assert (=> b!1427112 m!1317545))

(declare-fun m!1317553 () Bool)

(assert (=> b!1427112 m!1317553))

(assert (=> b!1426853 d!153313))

(declare-fun d!153315 () Bool)

(assert (=> d!153315 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123018 d!153315))

(declare-fun d!153321 () Bool)

(assert (=> d!153321 (= (array_inv!36010 a!2831) (bvsge (size!47532 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123018 d!153321))

(declare-fun b!1427114 () Bool)

(declare-fun e!806072 () SeekEntryResult!11261)

(declare-fun e!806076 () SeekEntryResult!11261)

(assert (=> b!1427114 (= e!806072 e!806076)))

(declare-fun c!131930 () Bool)

(declare-fun lt!628443 () (_ BitVec 64))

(assert (=> b!1427114 (= c!131930 (or (= lt!628443 lt!628332) (= (bvadd lt!628443 lt!628443) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427115 () Bool)

(declare-fun e!806075 () Bool)

(declare-fun e!806073 () Bool)

(assert (=> b!1427115 (= e!806075 e!806073)))

(declare-fun res!962235 () Bool)

(declare-fun lt!628442 () SeekEntryResult!11261)

(assert (=> b!1427115 (= res!962235 (and (is-Intermediate!11261 lt!628442) (not (undefined!12073 lt!628442)) (bvslt (x!129069 lt!628442) #b01111111111111111111111111111110) (bvsge (x!129069 lt!628442) #b00000000000000000000000000000000) (bvsge (x!129069 lt!628442) x!605)))))

(assert (=> b!1427115 (=> (not res!962235) (not e!806073))))

(declare-fun d!153323 () Bool)

(assert (=> d!153323 e!806075))

(declare-fun c!131932 () Bool)

(assert (=> d!153323 (= c!131932 (and (is-Intermediate!11261 lt!628442) (undefined!12073 lt!628442)))))

(assert (=> d!153323 (= lt!628442 e!806072)))

(declare-fun c!131931 () Bool)

(assert (=> d!153323 (= c!131931 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153323 (= lt!628443 (select (arr!46982 lt!628330) index!585))))

(assert (=> d!153323 (validMask!0 mask!2608)))

(assert (=> d!153323 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628332 lt!628330 mask!2608) lt!628442)))

(declare-fun b!1427116 () Bool)

(assert (=> b!1427116 (= e!806076 (Intermediate!11261 false index!585 x!605))))

(declare-fun b!1427117 () Bool)

(assert (=> b!1427117 (= e!806075 (bvsge (x!129069 lt!628442) #b01111111111111111111111111111110))))

(declare-fun b!1427118 () Bool)

(assert (=> b!1427118 (and (bvsge (index!47438 lt!628442) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628442) (size!47532 lt!628330)))))

(declare-fun res!962234 () Bool)

(assert (=> b!1427118 (= res!962234 (= (select (arr!46982 lt!628330) (index!47438 lt!628442)) lt!628332))))

(declare-fun e!806074 () Bool)

(assert (=> b!1427118 (=> res!962234 e!806074)))

(assert (=> b!1427118 (= e!806073 e!806074)))

(declare-fun b!1427119 () Bool)

(assert (=> b!1427119 (and (bvsge (index!47438 lt!628442) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628442) (size!47532 lt!628330)))))

(declare-fun res!962233 () Bool)

(assert (=> b!1427119 (= res!962233 (= (select (arr!46982 lt!628330) (index!47438 lt!628442)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427119 (=> res!962233 e!806074)))

(declare-fun b!1427120 () Bool)

(assert (=> b!1427120 (= e!806076 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628332 lt!628330 mask!2608))))

(declare-fun b!1427121 () Bool)

(assert (=> b!1427121 (= e!806072 (Intermediate!11261 true index!585 x!605))))

(declare-fun b!1427122 () Bool)

(assert (=> b!1427122 (and (bvsge (index!47438 lt!628442) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628442) (size!47532 lt!628330)))))

(assert (=> b!1427122 (= e!806074 (= (select (arr!46982 lt!628330) (index!47438 lt!628442)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153323 c!131931) b!1427121))

(assert (= (and d!153323 (not c!131931)) b!1427114))

(assert (= (and b!1427114 c!131930) b!1427116))

(assert (= (and b!1427114 (not c!131930)) b!1427120))

(assert (= (and d!153323 c!131932) b!1427117))

(assert (= (and d!153323 (not c!131932)) b!1427115))

(assert (= (and b!1427115 res!962235) b!1427118))

(assert (= (and b!1427118 (not res!962234)) b!1427119))

(assert (= (and b!1427119 (not res!962233)) b!1427122))

(declare-fun m!1317555 () Bool)

(assert (=> b!1427122 m!1317555))

(assert (=> b!1427120 m!1317539))

(assert (=> b!1427120 m!1317539))

(declare-fun m!1317557 () Bool)

(assert (=> b!1427120 m!1317557))

(assert (=> b!1427118 m!1317555))

(assert (=> b!1427119 m!1317555))

(declare-fun m!1317559 () Bool)

(assert (=> d!153323 m!1317559))

(assert (=> d!153323 m!1317367))

(assert (=> b!1426854 d!153323))

(declare-fun b!1427123 () Bool)

(declare-fun e!806077 () SeekEntryResult!11261)

(declare-fun e!806081 () SeekEntryResult!11261)

(assert (=> b!1427123 (= e!806077 e!806081)))

(declare-fun c!131933 () Bool)

(declare-fun lt!628445 () (_ BitVec 64))

(assert (=> b!1427123 (= c!131933 (or (= lt!628445 lt!628332) (= (bvadd lt!628445 lt!628445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427124 () Bool)

(declare-fun e!806080 () Bool)

(declare-fun e!806078 () Bool)

(assert (=> b!1427124 (= e!806080 e!806078)))

(declare-fun res!962238 () Bool)

(declare-fun lt!628444 () SeekEntryResult!11261)

(assert (=> b!1427124 (= res!962238 (and (is-Intermediate!11261 lt!628444) (not (undefined!12073 lt!628444)) (bvslt (x!129069 lt!628444) #b01111111111111111111111111111110) (bvsge (x!129069 lt!628444) #b00000000000000000000000000000000) (bvsge (x!129069 lt!628444) #b00000000000000000000000000000000)))))

(assert (=> b!1427124 (=> (not res!962238) (not e!806078))))

(declare-fun d!153325 () Bool)

(assert (=> d!153325 e!806080))

(declare-fun c!131935 () Bool)

(assert (=> d!153325 (= c!131935 (and (is-Intermediate!11261 lt!628444) (undefined!12073 lt!628444)))))

(assert (=> d!153325 (= lt!628444 e!806077)))

(declare-fun c!131934 () Bool)

(assert (=> d!153325 (= c!131934 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153325 (= lt!628445 (select (arr!46982 lt!628330) (toIndex!0 lt!628332 mask!2608)))))

(assert (=> d!153325 (validMask!0 mask!2608)))

(assert (=> d!153325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628332 mask!2608) lt!628332 lt!628330 mask!2608) lt!628444)))

(declare-fun b!1427125 () Bool)

(assert (=> b!1427125 (= e!806081 (Intermediate!11261 false (toIndex!0 lt!628332 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427126 () Bool)

(assert (=> b!1427126 (= e!806080 (bvsge (x!129069 lt!628444) #b01111111111111111111111111111110))))

(declare-fun b!1427127 () Bool)

(assert (=> b!1427127 (and (bvsge (index!47438 lt!628444) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628444) (size!47532 lt!628330)))))

(declare-fun res!962237 () Bool)

(assert (=> b!1427127 (= res!962237 (= (select (arr!46982 lt!628330) (index!47438 lt!628444)) lt!628332))))

(declare-fun e!806079 () Bool)

(assert (=> b!1427127 (=> res!962237 e!806079)))

(assert (=> b!1427127 (= e!806078 e!806079)))

(declare-fun b!1427128 () Bool)

(assert (=> b!1427128 (and (bvsge (index!47438 lt!628444) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628444) (size!47532 lt!628330)))))

(declare-fun res!962236 () Bool)

(assert (=> b!1427128 (= res!962236 (= (select (arr!46982 lt!628330) (index!47438 lt!628444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427128 (=> res!962236 e!806079)))

(declare-fun b!1427129 () Bool)

(assert (=> b!1427129 (= e!806081 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628332 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628332 lt!628330 mask!2608))))

(declare-fun b!1427130 () Bool)

(assert (=> b!1427130 (= e!806077 (Intermediate!11261 true (toIndex!0 lt!628332 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427131 () Bool)

(assert (=> b!1427131 (and (bvsge (index!47438 lt!628444) #b00000000000000000000000000000000) (bvslt (index!47438 lt!628444) (size!47532 lt!628330)))))

(assert (=> b!1427131 (= e!806079 (= (select (arr!46982 lt!628330) (index!47438 lt!628444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!153325 c!131934) b!1427130))

(assert (= (and d!153325 (not c!131934)) b!1427123))

(assert (= (and b!1427123 c!131933) b!1427125))

(assert (= (and b!1427123 (not c!131933)) b!1427129))

(assert (= (and d!153325 c!131935) b!1427126))

(assert (= (and d!153325 (not c!131935)) b!1427124))

(assert (= (and b!1427124 res!962238) b!1427127))

(assert (= (and b!1427127 (not res!962237)) b!1427128))

(assert (= (and b!1427128 (not res!962236)) b!1427131))

(declare-fun m!1317561 () Bool)

(assert (=> b!1427131 m!1317561))

(assert (=> b!1427129 m!1317347))

(declare-fun m!1317563 () Bool)

(assert (=> b!1427129 m!1317563))

(assert (=> b!1427129 m!1317563))

(declare-fun m!1317565 () Bool)

(assert (=> b!1427129 m!1317565))

(assert (=> b!1427127 m!1317561))

(assert (=> b!1427128 m!1317561))

(assert (=> d!153325 m!1317347))

(declare-fun m!1317567 () Bool)

(assert (=> d!153325 m!1317567))

(assert (=> d!153325 m!1317367))

(assert (=> b!1426856 d!153325))

(declare-fun d!153327 () Bool)

(declare-fun lt!628447 () (_ BitVec 32))

(declare-fun lt!628446 () (_ BitVec 32))

(assert (=> d!153327 (= lt!628447 (bvmul (bvxor lt!628446 (bvlshr lt!628446 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153327 (= lt!628446 ((_ extract 31 0) (bvand (bvxor lt!628332 (bvlshr lt!628332 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153327 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962223 (let ((h!34798 ((_ extract 31 0) (bvand (bvxor lt!628332 (bvlshr lt!628332 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129077 (bvmul (bvxor h!34798 (bvlshr h!34798 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129077 (bvlshr x!129077 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962223 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962223 #b00000000000000000000000000000000))))))

(assert (=> d!153327 (= (toIndex!0 lt!628332 mask!2608) (bvand (bvxor lt!628447 (bvlshr lt!628447 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426856 d!153327))

(declare-fun b!1427146 () Bool)

(declare-fun e!806095 () Bool)

(declare-fun call!67355 () Bool)

(assert (=> b!1427146 (= e!806095 call!67355)))

(declare-fun b!1427147 () Bool)

(declare-fun e!806092 () Bool)

(assert (=> b!1427147 (= e!806092 e!806095)))

(declare-fun c!131940 () Bool)

(assert (=> b!1427147 (= c!131940 (validKeyInArray!0 (select (arr!46982 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153329 () Bool)

(declare-fun res!962247 () Bool)

(declare-fun e!806094 () Bool)

(assert (=> d!153329 (=> res!962247 e!806094)))

(assert (=> d!153329 (= res!962247 (bvsge #b00000000000000000000000000000000 (size!47532 a!2831)))))

(assert (=> d!153329 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33489) e!806094)))

(declare-fun b!1427148 () Bool)

(assert (=> b!1427148 (= e!806095 call!67355)))

(declare-fun bm!67352 () Bool)

(assert (=> bm!67352 (= call!67355 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131940 (Cons!33488 (select (arr!46982 a!2831) #b00000000000000000000000000000000) Nil!33489) Nil!33489)))))

(declare-fun b!1427149 () Bool)

(assert (=> b!1427149 (= e!806094 e!806092)))

(declare-fun res!962245 () Bool)

(assert (=> b!1427149 (=> (not res!962245) (not e!806092))))

(declare-fun e!806093 () Bool)

(assert (=> b!1427149 (= res!962245 (not e!806093))))

(declare-fun res!962246 () Bool)

(assert (=> b!1427149 (=> (not res!962246) (not e!806093))))

(assert (=> b!1427149 (= res!962246 (validKeyInArray!0 (select (arr!46982 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427150 () Bool)

(declare-fun contains!9851 (List!33492 (_ BitVec 64)) Bool)

(assert (=> b!1427150 (= e!806093 (contains!9851 Nil!33489 (select (arr!46982 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153329 (not res!962247)) b!1427149))

(assert (= (and b!1427149 res!962246) b!1427150))

(assert (= (and b!1427149 res!962245) b!1427147))

(assert (= (and b!1427147 c!131940) b!1427148))

(assert (= (and b!1427147 (not c!131940)) b!1427146))

(assert (= (or b!1427148 b!1427146) bm!67352))

(assert (=> b!1427147 m!1317545))

(assert (=> b!1427147 m!1317545))

(assert (=> b!1427147 m!1317553))

(assert (=> bm!67352 m!1317545))

(declare-fun m!1317569 () Bool)

(assert (=> bm!67352 m!1317569))

(assert (=> b!1427149 m!1317545))

(assert (=> b!1427149 m!1317545))

(assert (=> b!1427149 m!1317553))

(assert (=> b!1427150 m!1317545))

(assert (=> b!1427150 m!1317545))

(declare-fun m!1317571 () Bool)

(assert (=> b!1427150 m!1317571))

(assert (=> b!1426845 d!153329))

(declare-fun e!806122 () SeekEntryResult!11261)

(declare-fun b!1427192 () Bool)

(declare-fun lt!628465 () SeekEntryResult!11261)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97332 (_ BitVec 32)) SeekEntryResult!11261)

(assert (=> b!1427192 (= e!806122 (seekKeyOrZeroReturnVacant!0 (x!129069 lt!628465) (index!47438 lt!628465) (index!47438 lt!628465) (select (arr!46982 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427193 () Bool)

(declare-fun e!806121 () SeekEntryResult!11261)

(assert (=> b!1427193 (= e!806121 (Found!11261 (index!47438 lt!628465)))))

(declare-fun b!1427194 () Bool)

(declare-fun e!806123 () SeekEntryResult!11261)

(assert (=> b!1427194 (= e!806123 Undefined!11261)))

(declare-fun b!1427195 () Bool)

(assert (=> b!1427195 (= e!806123 e!806121)))

(declare-fun lt!628464 () (_ BitVec 64))

(assert (=> b!1427195 (= lt!628464 (select (arr!46982 a!2831) (index!47438 lt!628465)))))

(declare-fun c!131957 () Bool)

(assert (=> b!1427195 (= c!131957 (= lt!628464 (select (arr!46982 a!2831) j!81)))))

(declare-fun d!153331 () Bool)

(declare-fun lt!628463 () SeekEntryResult!11261)

(assert (=> d!153331 (and (or (is-Undefined!11261 lt!628463) (not (is-Found!11261 lt!628463)) (and (bvsge (index!47437 lt!628463) #b00000000000000000000000000000000) (bvslt (index!47437 lt!628463) (size!47532 a!2831)))) (or (is-Undefined!11261 lt!628463) (is-Found!11261 lt!628463) (not (is-MissingZero!11261 lt!628463)) (and (bvsge (index!47436 lt!628463) #b00000000000000000000000000000000) (bvslt (index!47436 lt!628463) (size!47532 a!2831)))) (or (is-Undefined!11261 lt!628463) (is-Found!11261 lt!628463) (is-MissingZero!11261 lt!628463) (not (is-MissingVacant!11261 lt!628463)) (and (bvsge (index!47439 lt!628463) #b00000000000000000000000000000000) (bvslt (index!47439 lt!628463) (size!47532 a!2831)))) (or (is-Undefined!11261 lt!628463) (ite (is-Found!11261 lt!628463) (= (select (arr!46982 a!2831) (index!47437 lt!628463)) (select (arr!46982 a!2831) j!81)) (ite (is-MissingZero!11261 lt!628463) (= (select (arr!46982 a!2831) (index!47436 lt!628463)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11261 lt!628463) (= (select (arr!46982 a!2831) (index!47439 lt!628463)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153331 (= lt!628463 e!806123)))

(declare-fun c!131959 () Bool)

(assert (=> d!153331 (= c!131959 (and (is-Intermediate!11261 lt!628465) (undefined!12073 lt!628465)))))

(assert (=> d!153331 (= lt!628465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46982 a!2831) j!81) mask!2608) (select (arr!46982 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153331 (validMask!0 mask!2608)))

(assert (=> d!153331 (= (seekEntryOrOpen!0 (select (arr!46982 a!2831) j!81) a!2831 mask!2608) lt!628463)))

(declare-fun b!1427196 () Bool)

(assert (=> b!1427196 (= e!806122 (MissingZero!11261 (index!47438 lt!628465)))))

(declare-fun b!1427197 () Bool)

(declare-fun c!131958 () Bool)

(assert (=> b!1427197 (= c!131958 (= lt!628464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427197 (= e!806121 e!806122)))

(assert (= (and d!153331 c!131959) b!1427194))

(assert (= (and d!153331 (not c!131959)) b!1427195))

(assert (= (and b!1427195 c!131957) b!1427193))

(assert (= (and b!1427195 (not c!131957)) b!1427197))

(assert (= (and b!1427197 c!131958) b!1427196))

(assert (= (and b!1427197 (not c!131958)) b!1427192))

(assert (=> b!1427192 m!1317355))

(declare-fun m!1317591 () Bool)

(assert (=> b!1427192 m!1317591))

(declare-fun m!1317593 () Bool)

(assert (=> b!1427195 m!1317593))

(assert (=> d!153331 m!1317355))

(assert (=> d!153331 m!1317357))

(declare-fun m!1317595 () Bool)

(assert (=> d!153331 m!1317595))

(assert (=> d!153331 m!1317357))

(assert (=> d!153331 m!1317355))

(assert (=> d!153331 m!1317359))

(declare-fun m!1317597 () Bool)

(assert (=> d!153331 m!1317597))

(declare-fun m!1317599 () Bool)

(assert (=> d!153331 m!1317599))

(assert (=> d!153331 m!1317367))

(assert (=> b!1426857 d!153331))

(declare-fun call!67359 () Bool)

(declare-fun bm!67356 () Bool)

(assert (=> bm!67356 (= call!67359 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427204 () Bool)

(declare-fun e!806130 () Bool)

(declare-fun e!806128 () Bool)

(assert (=> b!1427204 (= e!806130 e!806128)))

(declare-fun lt!628466 () (_ BitVec 64))

(assert (=> b!1427204 (= lt!628466 (select (arr!46982 a!2831) j!81))))

(declare-fun lt!628467 () Unit!48268)

(assert (=> b!1427204 (= lt!628467 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628466 j!81))))

(assert (=> b!1427204 (arrayContainsKey!0 a!2831 lt!628466 #b00000000000000000000000000000000)))

(declare-fun lt!628468 () Unit!48268)

(assert (=> b!1427204 (= lt!628468 lt!628467)))

(declare-fun res!962259 () Bool)

(assert (=> b!1427204 (= res!962259 (= (seekEntryOrOpen!0 (select (arr!46982 a!2831) j!81) a!2831 mask!2608) (Found!11261 j!81)))))

(assert (=> b!1427204 (=> (not res!962259) (not e!806128))))

(declare-fun b!1427205 () Bool)

(assert (=> b!1427205 (= e!806128 call!67359)))

(declare-fun d!153337 () Bool)

(declare-fun res!962260 () Bool)

(declare-fun e!806129 () Bool)

(assert (=> d!153337 (=> res!962260 e!806129)))

(assert (=> d!153337 (= res!962260 (bvsge j!81 (size!47532 a!2831)))))

(assert (=> d!153337 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806129)))

(declare-fun b!1427206 () Bool)

(assert (=> b!1427206 (= e!806129 e!806130)))

(declare-fun c!131962 () Bool)

(assert (=> b!1427206 (= c!131962 (validKeyInArray!0 (select (arr!46982 a!2831) j!81)))))

(declare-fun b!1427207 () Bool)

(assert (=> b!1427207 (= e!806130 call!67359)))

(assert (= (and d!153337 (not res!962260)) b!1427206))

(assert (= (and b!1427206 c!131962) b!1427204))

(assert (= (and b!1427206 (not c!131962)) b!1427207))

(assert (= (and b!1427204 res!962259) b!1427205))

(assert (= (or b!1427205 b!1427207) bm!67356))

(declare-fun m!1317601 () Bool)

(assert (=> bm!67356 m!1317601))

(assert (=> b!1427204 m!1317355))

(declare-fun m!1317603 () Bool)

(assert (=> b!1427204 m!1317603))

(declare-fun m!1317605 () Bool)

(assert (=> b!1427204 m!1317605))

(assert (=> b!1427204 m!1317355))

(assert (=> b!1427204 m!1317361))

(assert (=> b!1427206 m!1317355))

(assert (=> b!1427206 m!1317355))

(assert (=> b!1427206 m!1317363))

(assert (=> b!1426846 d!153337))

(declare-fun d!153339 () Bool)

(assert (=> d!153339 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628483 () Unit!48268)

(declare-fun choose!38 (array!97332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48268)

(assert (=> d!153339 (= lt!628483 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153339 (validMask!0 mask!2608)))

(assert (=> d!153339 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628483)))

(declare-fun bs!41598 () Bool)

(assert (= bs!41598 d!153339))

(assert (=> bs!41598 m!1317343))

(declare-fun m!1317615 () Bool)

(assert (=> bs!41598 m!1317615))

(assert (=> bs!41598 m!1317367))

(assert (=> b!1426846 d!153339))

(declare-fun d!153343 () Bool)

(assert (=> d!153343 (= (validKeyInArray!0 (select (arr!46982 a!2831) i!982)) (and (not (= (select (arr!46982 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46982 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426848 d!153343))

(push 1)

(assert (not d!153325))

(assert (not d!153339))

(assert (not bm!67356))

(assert (not b!1427110))

(assert (not b!1427204))

(assert (not b!1427147))

(assert (not d!153293))

(assert (not b!1427112))

(assert (not d!153331))

(assert (not b!1427120))

(assert (not b!1427149))

(assert (not b!1427150))

(assert (not d!153311))

(assert (not b!1427206))

(assert (not b!1427192))

(assert (not d!153323))

(assert (not b!1427099))

(assert (not bm!67349))

(assert (not b!1427129))

(assert (not b!1427090))

(assert (not bm!67352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

