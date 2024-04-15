; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123434 () Bool)

(assert start!123434)

(declare-fun res!965136 () Bool)

(declare-fun e!807894 () Bool)

(assert (=> start!123434 (=> (not res!965136) (not e!807894))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123434 (= res!965136 (validMask!0 mask!2608))))

(assert (=> start!123434 e!807894))

(assert (=> start!123434 true))

(declare-datatypes ((array!97422 0))(
  ( (array!97423 (arr!47020 (Array (_ BitVec 32) (_ BitVec 64))) (size!47572 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97422)

(declare-fun array_inv!36253 (array!97422) Bool)

(assert (=> start!123434 (array_inv!36253 a!2831)))

(declare-fun b!1430960 () Bool)

(declare-fun res!965140 () Bool)

(assert (=> b!1430960 (=> (not res!965140) (not e!807894))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1430960 (= res!965140 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47572 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47572 a!2831))))))

(declare-fun b!1430961 () Bool)

(declare-fun res!965138 () Bool)

(assert (=> b!1430961 (=> (not res!965138) (not e!807894))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430961 (= res!965138 (validKeyInArray!0 (select (arr!47020 a!2831) i!982)))))

(declare-fun b!1430962 () Bool)

(declare-fun res!965137 () Bool)

(declare-fun e!807895 () Bool)

(assert (=> b!1430962 (=> (not res!965137) (not e!807895))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11326 0))(
  ( (MissingZero!11326 (index!47696 (_ BitVec 32))) (Found!11326 (index!47697 (_ BitVec 32))) (Intermediate!11326 (undefined!12138 Bool) (index!47698 (_ BitVec 32)) (x!129333 (_ BitVec 32))) (Undefined!11326) (MissingVacant!11326 (index!47699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97422 (_ BitVec 32)) SeekEntryResult!11326)

(assert (=> b!1430962 (= res!965137 (= (seekEntryOrOpen!0 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) (Found!11326 j!81)))))

(declare-fun b!1430963 () Bool)

(declare-fun res!965139 () Bool)

(assert (=> b!1430963 (=> (not res!965139) (not e!807894))))

(assert (=> b!1430963 (= res!965139 (and (= (size!47572 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47572 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47572 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430964 () Bool)

(declare-fun res!965141 () Bool)

(assert (=> b!1430964 (=> (not res!965141) (not e!807894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97422 (_ BitVec 32)) Bool)

(assert (=> b!1430964 (= res!965141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun b!1430965 () Bool)

(assert (=> b!1430965 (= e!807895 (or (= (select (arr!47020 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47020 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47020 a!2831) index!585) (select (arr!47020 a!2831) j!81)) (not (= (select (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun b!1430966 () Bool)

(declare-fun e!807897 () Bool)

(assert (=> b!1430966 (= e!807894 e!807897)))

(declare-fun res!965132 () Bool)

(assert (=> b!1430966 (=> (not res!965132) (not e!807897))))

(declare-fun lt!629816 () SeekEntryResult!11326)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97422 (_ BitVec 32)) SeekEntryResult!11326)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430966 (= res!965132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!629816))))

(assert (=> b!1430966 (= lt!629816 (Intermediate!11326 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430967 () Bool)

(declare-fun res!965134 () Bool)

(assert (=> b!1430967 (=> (not res!965134) (not e!807894))))

(declare-datatypes ((List!33608 0))(
  ( (Nil!33605) (Cons!33604 (h!34924 (_ BitVec 64)) (t!48294 List!33608)) )
))
(declare-fun arrayNoDuplicates!0 (array!97422 (_ BitVec 32) List!33608) Bool)

(assert (=> b!1430967 (= res!965134 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33605))))

(declare-fun b!1430968 () Bool)

(declare-fun res!965142 () Bool)

(declare-fun e!807896 () Bool)

(assert (=> b!1430968 (=> (not res!965142) (not e!807896))))

(assert (=> b!1430968 (= res!965142 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!629816))))

(declare-fun b!1430969 () Bool)

(assert (=> b!1430969 (= e!807897 e!807896)))

(declare-fun res!965143 () Bool)

(assert (=> b!1430969 (=> (not res!965143) (not e!807896))))

(declare-fun lt!629814 () SeekEntryResult!11326)

(declare-fun lt!629815 () array!97422)

(declare-fun lt!629813 () (_ BitVec 64))

(assert (=> b!1430969 (= res!965143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629813 mask!2608) lt!629813 lt!629815 mask!2608) lt!629814))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430969 (= lt!629814 (Intermediate!11326 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430969 (= lt!629813 (select (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430969 (= lt!629815 (array!97423 (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47572 a!2831)))))

(declare-fun b!1430970 () Bool)

(assert (=> b!1430970 (= e!807896 (not (or (= (select (arr!47020 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47020 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47020 a!2831) index!585) (select (arr!47020 a!2831) j!81)) (not (= (select (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge intermediateAfterX!13 intermediateBeforeX!13) (not undefinedAfter!5))))))

(assert (=> b!1430970 e!807895))

(declare-fun res!965135 () Bool)

(assert (=> b!1430970 (=> (not res!965135) (not e!807895))))

(assert (=> b!1430970 (= res!965135 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48237 0))(
  ( (Unit!48238) )
))
(declare-fun lt!629817 () Unit!48237)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48237)

(assert (=> b!1430970 (= lt!629817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430971 () Bool)

(declare-fun res!965133 () Bool)

(assert (=> b!1430971 (=> (not res!965133) (not e!807896))))

(assert (=> b!1430971 (= res!965133 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629813 lt!629815 mask!2608) lt!629814))))

(declare-fun b!1430972 () Bool)

(declare-fun res!965130 () Bool)

(assert (=> b!1430972 (=> (not res!965130) (not e!807896))))

(assert (=> b!1430972 (= res!965130 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430973 () Bool)

(declare-fun res!965131 () Bool)

(assert (=> b!1430973 (=> (not res!965131) (not e!807894))))

(assert (=> b!1430973 (= res!965131 (validKeyInArray!0 (select (arr!47020 a!2831) j!81)))))

(assert (= (and start!123434 res!965136) b!1430963))

(assert (= (and b!1430963 res!965139) b!1430961))

(assert (= (and b!1430961 res!965138) b!1430973))

(assert (= (and b!1430973 res!965131) b!1430964))

(assert (= (and b!1430964 res!965141) b!1430967))

(assert (= (and b!1430967 res!965134) b!1430960))

(assert (= (and b!1430960 res!965140) b!1430966))

(assert (= (and b!1430966 res!965132) b!1430969))

(assert (= (and b!1430969 res!965143) b!1430968))

(assert (= (and b!1430968 res!965142) b!1430971))

(assert (= (and b!1430971 res!965133) b!1430972))

(assert (= (and b!1430972 res!965130) b!1430970))

(assert (= (and b!1430970 res!965135) b!1430962))

(assert (= (and b!1430962 res!965137) b!1430965))

(declare-fun m!1320365 () Bool)

(assert (=> b!1430973 m!1320365))

(assert (=> b!1430973 m!1320365))

(declare-fun m!1320367 () Bool)

(assert (=> b!1430973 m!1320367))

(assert (=> b!1430966 m!1320365))

(assert (=> b!1430966 m!1320365))

(declare-fun m!1320369 () Bool)

(assert (=> b!1430966 m!1320369))

(assert (=> b!1430966 m!1320369))

(assert (=> b!1430966 m!1320365))

(declare-fun m!1320371 () Bool)

(assert (=> b!1430966 m!1320371))

(declare-fun m!1320373 () Bool)

(assert (=> b!1430969 m!1320373))

(assert (=> b!1430969 m!1320373))

(declare-fun m!1320375 () Bool)

(assert (=> b!1430969 m!1320375))

(declare-fun m!1320377 () Bool)

(assert (=> b!1430969 m!1320377))

(declare-fun m!1320379 () Bool)

(assert (=> b!1430969 m!1320379))

(declare-fun m!1320381 () Bool)

(assert (=> b!1430964 m!1320381))

(declare-fun m!1320383 () Bool)

(assert (=> b!1430965 m!1320383))

(assert (=> b!1430965 m!1320365))

(assert (=> b!1430965 m!1320377))

(declare-fun m!1320385 () Bool)

(assert (=> b!1430965 m!1320385))

(assert (=> b!1430970 m!1320377))

(assert (=> b!1430970 m!1320385))

(assert (=> b!1430970 m!1320383))

(declare-fun m!1320387 () Bool)

(assert (=> b!1430970 m!1320387))

(assert (=> b!1430970 m!1320365))

(declare-fun m!1320389 () Bool)

(assert (=> b!1430970 m!1320389))

(declare-fun m!1320391 () Bool)

(assert (=> b!1430961 m!1320391))

(assert (=> b!1430961 m!1320391))

(declare-fun m!1320393 () Bool)

(assert (=> b!1430961 m!1320393))

(assert (=> b!1430968 m!1320365))

(assert (=> b!1430968 m!1320365))

(declare-fun m!1320395 () Bool)

(assert (=> b!1430968 m!1320395))

(declare-fun m!1320397 () Bool)

(assert (=> b!1430971 m!1320397))

(declare-fun m!1320399 () Bool)

(assert (=> b!1430967 m!1320399))

(declare-fun m!1320401 () Bool)

(assert (=> start!123434 m!1320401))

(declare-fun m!1320403 () Bool)

(assert (=> start!123434 m!1320403))

(assert (=> b!1430962 m!1320365))

(assert (=> b!1430962 m!1320365))

(declare-fun m!1320405 () Bool)

(assert (=> b!1430962 m!1320405))

(check-sat (not b!1430968) (not b!1430967) (not start!123434) (not b!1430969) (not b!1430966) (not b!1430971) (not b!1430964) (not b!1430973) (not b!1430970) (not b!1430962) (not b!1430961))
(check-sat)
(get-model)

(declare-fun b!1431066 () Bool)

(declare-fun e!807935 () Bool)

(declare-fun call!67436 () Bool)

(assert (=> b!1431066 (= e!807935 call!67436)))

(declare-fun b!1431067 () Bool)

(declare-fun e!807934 () Bool)

(assert (=> b!1431067 (= e!807934 call!67436)))

(declare-fun bm!67433 () Bool)

(assert (=> bm!67433 (= call!67436 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1431068 () Bool)

(assert (=> b!1431068 (= e!807935 e!807934)))

(declare-fun lt!629856 () (_ BitVec 64))

(assert (=> b!1431068 (= lt!629856 (select (arr!47020 a!2831) j!81))))

(declare-fun lt!629854 () Unit!48237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97422 (_ BitVec 64) (_ BitVec 32)) Unit!48237)

(assert (=> b!1431068 (= lt!629854 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629856 j!81))))

(declare-fun arrayContainsKey!0 (array!97422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1431068 (arrayContainsKey!0 a!2831 lt!629856 #b00000000000000000000000000000000)))

(declare-fun lt!629855 () Unit!48237)

(assert (=> b!1431068 (= lt!629855 lt!629854)))

(declare-fun res!965233 () Bool)

(assert (=> b!1431068 (= res!965233 (= (seekEntryOrOpen!0 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) (Found!11326 j!81)))))

(assert (=> b!1431068 (=> (not res!965233) (not e!807934))))

(declare-fun d!153705 () Bool)

(declare-fun res!965232 () Bool)

(declare-fun e!807936 () Bool)

(assert (=> d!153705 (=> res!965232 e!807936)))

(assert (=> d!153705 (= res!965232 (bvsge j!81 (size!47572 a!2831)))))

(assert (=> d!153705 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807936)))

(declare-fun b!1431069 () Bool)

(assert (=> b!1431069 (= e!807936 e!807935)))

(declare-fun c!132415 () Bool)

(assert (=> b!1431069 (= c!132415 (validKeyInArray!0 (select (arr!47020 a!2831) j!81)))))

(assert (= (and d!153705 (not res!965232)) b!1431069))

(assert (= (and b!1431069 c!132415) b!1431068))

(assert (= (and b!1431069 (not c!132415)) b!1431066))

(assert (= (and b!1431068 res!965233) b!1431067))

(assert (= (or b!1431067 b!1431066) bm!67433))

(declare-fun m!1320491 () Bool)

(assert (=> bm!67433 m!1320491))

(assert (=> b!1431068 m!1320365))

(declare-fun m!1320493 () Bool)

(assert (=> b!1431068 m!1320493))

(declare-fun m!1320495 () Bool)

(assert (=> b!1431068 m!1320495))

(assert (=> b!1431068 m!1320365))

(assert (=> b!1431068 m!1320405))

(assert (=> b!1431069 m!1320365))

(assert (=> b!1431069 m!1320365))

(assert (=> b!1431069 m!1320367))

(assert (=> b!1430970 d!153705))

(declare-fun d!153707 () Bool)

(assert (=> d!153707 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629859 () Unit!48237)

(declare-fun choose!38 (array!97422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48237)

(assert (=> d!153707 (= lt!629859 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153707 (validMask!0 mask!2608)))

(assert (=> d!153707 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629859)))

(declare-fun bs!41659 () Bool)

(assert (= bs!41659 d!153707))

(assert (=> bs!41659 m!1320387))

(declare-fun m!1320497 () Bool)

(assert (=> bs!41659 m!1320497))

(assert (=> bs!41659 m!1320401))

(assert (=> b!1430970 d!153707))

(declare-fun d!153709 () Bool)

(assert (=> d!153709 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123434 d!153709))

(declare-fun d!153713 () Bool)

(assert (=> d!153713 (= (array_inv!36253 a!2831) (bvsge (size!47572 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123434 d!153713))

(declare-fun b!1431130 () Bool)

(declare-fun e!807977 () SeekEntryResult!11326)

(assert (=> b!1431130 (= e!807977 (Intermediate!11326 false index!585 x!605))))

(declare-fun b!1431131 () Bool)

(declare-fun e!807975 () SeekEntryResult!11326)

(assert (=> b!1431131 (= e!807975 (Intermediate!11326 true index!585 x!605))))

(declare-fun b!1431132 () Bool)

(assert (=> b!1431132 (= e!807975 e!807977)))

(declare-fun c!132436 () Bool)

(declare-fun lt!629877 () (_ BitVec 64))

(assert (=> b!1431132 (= c!132436 (or (= lt!629877 lt!629813) (= (bvadd lt!629877 lt!629877) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431133 () Bool)

(declare-fun e!807974 () Bool)

(declare-fun lt!629876 () SeekEntryResult!11326)

(assert (=> b!1431133 (= e!807974 (bvsge (x!129333 lt!629876) #b01111111111111111111111111111110))))

(declare-fun b!1431134 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431134 (= e!807977 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629813 lt!629815 mask!2608))))

(declare-fun b!1431135 () Bool)

(assert (=> b!1431135 (and (bvsge (index!47698 lt!629876) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629876) (size!47572 lt!629815)))))

(declare-fun res!965261 () Bool)

(assert (=> b!1431135 (= res!965261 (= (select (arr!47020 lt!629815) (index!47698 lt!629876)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807978 () Bool)

(assert (=> b!1431135 (=> res!965261 e!807978)))

(declare-fun b!1431136 () Bool)

(declare-fun e!807976 () Bool)

(assert (=> b!1431136 (= e!807974 e!807976)))

(declare-fun res!965259 () Bool)

(get-info :version)

(assert (=> b!1431136 (= res!965259 (and ((_ is Intermediate!11326) lt!629876) (not (undefined!12138 lt!629876)) (bvslt (x!129333 lt!629876) #b01111111111111111111111111111110) (bvsge (x!129333 lt!629876) #b00000000000000000000000000000000) (bvsge (x!129333 lt!629876) x!605)))))

(assert (=> b!1431136 (=> (not res!965259) (not e!807976))))

(declare-fun b!1431138 () Bool)

(assert (=> b!1431138 (and (bvsge (index!47698 lt!629876) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629876) (size!47572 lt!629815)))))

(assert (=> b!1431138 (= e!807978 (= (select (arr!47020 lt!629815) (index!47698 lt!629876)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153715 () Bool)

(assert (=> d!153715 e!807974))

(declare-fun c!132435 () Bool)

(assert (=> d!153715 (= c!132435 (and ((_ is Intermediate!11326) lt!629876) (undefined!12138 lt!629876)))))

(assert (=> d!153715 (= lt!629876 e!807975)))

(declare-fun c!132434 () Bool)

(assert (=> d!153715 (= c!132434 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153715 (= lt!629877 (select (arr!47020 lt!629815) index!585))))

(assert (=> d!153715 (validMask!0 mask!2608)))

(assert (=> d!153715 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629813 lt!629815 mask!2608) lt!629876)))

(declare-fun b!1431137 () Bool)

(assert (=> b!1431137 (and (bvsge (index!47698 lt!629876) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629876) (size!47572 lt!629815)))))

(declare-fun res!965260 () Bool)

(assert (=> b!1431137 (= res!965260 (= (select (arr!47020 lt!629815) (index!47698 lt!629876)) lt!629813))))

(assert (=> b!1431137 (=> res!965260 e!807978)))

(assert (=> b!1431137 (= e!807976 e!807978)))

(assert (= (and d!153715 c!132434) b!1431131))

(assert (= (and d!153715 (not c!132434)) b!1431132))

(assert (= (and b!1431132 c!132436) b!1431130))

(assert (= (and b!1431132 (not c!132436)) b!1431134))

(assert (= (and d!153715 c!132435) b!1431133))

(assert (= (and d!153715 (not c!132435)) b!1431136))

(assert (= (and b!1431136 res!965259) b!1431137))

(assert (= (and b!1431137 (not res!965260)) b!1431135))

(assert (= (and b!1431135 (not res!965261)) b!1431138))

(declare-fun m!1320515 () Bool)

(assert (=> b!1431135 m!1320515))

(assert (=> b!1431137 m!1320515))

(assert (=> b!1431138 m!1320515))

(declare-fun m!1320517 () Bool)

(assert (=> b!1431134 m!1320517))

(assert (=> b!1431134 m!1320517))

(declare-fun m!1320519 () Bool)

(assert (=> b!1431134 m!1320519))

(declare-fun m!1320521 () Bool)

(assert (=> d!153715 m!1320521))

(assert (=> d!153715 m!1320401))

(assert (=> b!1430971 d!153715))

(declare-fun e!807982 () SeekEntryResult!11326)

(declare-fun b!1431139 () Bool)

(assert (=> b!1431139 (= e!807982 (Intermediate!11326 false (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431140 () Bool)

(declare-fun e!807980 () SeekEntryResult!11326)

(assert (=> b!1431140 (= e!807980 (Intermediate!11326 true (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431141 () Bool)

(assert (=> b!1431141 (= e!807980 e!807982)))

(declare-fun lt!629879 () (_ BitVec 64))

(declare-fun c!132439 () Bool)

(assert (=> b!1431141 (= c!132439 (or (= lt!629879 (select (arr!47020 a!2831) j!81)) (= (bvadd lt!629879 lt!629879) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431142 () Bool)

(declare-fun e!807979 () Bool)

(declare-fun lt!629878 () SeekEntryResult!11326)

(assert (=> b!1431142 (= e!807979 (bvsge (x!129333 lt!629878) #b01111111111111111111111111111110))))

(declare-fun b!1431143 () Bool)

(assert (=> b!1431143 (= e!807982 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47020 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431144 () Bool)

(assert (=> b!1431144 (and (bvsge (index!47698 lt!629878) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629878) (size!47572 a!2831)))))

(declare-fun res!965264 () Bool)

(assert (=> b!1431144 (= res!965264 (= (select (arr!47020 a!2831) (index!47698 lt!629878)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807983 () Bool)

(assert (=> b!1431144 (=> res!965264 e!807983)))

(declare-fun b!1431145 () Bool)

(declare-fun e!807981 () Bool)

(assert (=> b!1431145 (= e!807979 e!807981)))

(declare-fun res!965262 () Bool)

(assert (=> b!1431145 (= res!965262 (and ((_ is Intermediate!11326) lt!629878) (not (undefined!12138 lt!629878)) (bvslt (x!129333 lt!629878) #b01111111111111111111111111111110) (bvsge (x!129333 lt!629878) #b00000000000000000000000000000000) (bvsge (x!129333 lt!629878) #b00000000000000000000000000000000)))))

(assert (=> b!1431145 (=> (not res!965262) (not e!807981))))

(declare-fun b!1431147 () Bool)

(assert (=> b!1431147 (and (bvsge (index!47698 lt!629878) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629878) (size!47572 a!2831)))))

(assert (=> b!1431147 (= e!807983 (= (select (arr!47020 a!2831) (index!47698 lt!629878)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153735 () Bool)

(assert (=> d!153735 e!807979))

(declare-fun c!132438 () Bool)

(assert (=> d!153735 (= c!132438 (and ((_ is Intermediate!11326) lt!629878) (undefined!12138 lt!629878)))))

(assert (=> d!153735 (= lt!629878 e!807980)))

(declare-fun c!132437 () Bool)

(assert (=> d!153735 (= c!132437 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153735 (= lt!629879 (select (arr!47020 a!2831) (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608)))))

(assert (=> d!153735 (validMask!0 mask!2608)))

(assert (=> d!153735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!629878)))

(declare-fun b!1431146 () Bool)

(assert (=> b!1431146 (and (bvsge (index!47698 lt!629878) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629878) (size!47572 a!2831)))))

(declare-fun res!965263 () Bool)

(assert (=> b!1431146 (= res!965263 (= (select (arr!47020 a!2831) (index!47698 lt!629878)) (select (arr!47020 a!2831) j!81)))))

(assert (=> b!1431146 (=> res!965263 e!807983)))

(assert (=> b!1431146 (= e!807981 e!807983)))

(assert (= (and d!153735 c!132437) b!1431140))

(assert (= (and d!153735 (not c!132437)) b!1431141))

(assert (= (and b!1431141 c!132439) b!1431139))

(assert (= (and b!1431141 (not c!132439)) b!1431143))

(assert (= (and d!153735 c!132438) b!1431142))

(assert (= (and d!153735 (not c!132438)) b!1431145))

(assert (= (and b!1431145 res!965262) b!1431146))

(assert (= (and b!1431146 (not res!965263)) b!1431144))

(assert (= (and b!1431144 (not res!965264)) b!1431147))

(declare-fun m!1320523 () Bool)

(assert (=> b!1431144 m!1320523))

(assert (=> b!1431146 m!1320523))

(assert (=> b!1431147 m!1320523))

(assert (=> b!1431143 m!1320369))

(declare-fun m!1320525 () Bool)

(assert (=> b!1431143 m!1320525))

(assert (=> b!1431143 m!1320525))

(assert (=> b!1431143 m!1320365))

(declare-fun m!1320527 () Bool)

(assert (=> b!1431143 m!1320527))

(assert (=> d!153735 m!1320369))

(declare-fun m!1320529 () Bool)

(assert (=> d!153735 m!1320529))

(assert (=> d!153735 m!1320401))

(assert (=> b!1430966 d!153735))

(declare-fun d!153739 () Bool)

(declare-fun lt!629900 () (_ BitVec 32))

(declare-fun lt!629899 () (_ BitVec 32))

(assert (=> d!153739 (= lt!629900 (bvmul (bvxor lt!629899 (bvlshr lt!629899 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153739 (= lt!629899 ((_ extract 31 0) (bvand (bvxor (select (arr!47020 a!2831) j!81) (bvlshr (select (arr!47020 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153739 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965265 (let ((h!34928 ((_ extract 31 0) (bvand (bvxor (select (arr!47020 a!2831) j!81) (bvlshr (select (arr!47020 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129339 (bvmul (bvxor h!34928 (bvlshr h!34928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129339 (bvlshr x!129339 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965265 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965265 #b00000000000000000000000000000000))))))

(assert (=> d!153739 (= (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) (bvand (bvxor lt!629900 (bvlshr lt!629900 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430966 d!153739))

(declare-fun d!153741 () Bool)

(assert (=> d!153741 (= (validKeyInArray!0 (select (arr!47020 a!2831) i!982)) (and (not (= (select (arr!47020 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47020 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430961 d!153741))

(declare-fun b!1431206 () Bool)

(declare-fun e!808029 () Bool)

(declare-fun contains!9825 (List!33608 (_ BitVec 64)) Bool)

(assert (=> b!1431206 (= e!808029 (contains!9825 Nil!33605 (select (arr!47020 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431207 () Bool)

(declare-fun e!808027 () Bool)

(declare-fun call!67451 () Bool)

(assert (=> b!1431207 (= e!808027 call!67451)))

(declare-fun d!153747 () Bool)

(declare-fun res!965296 () Bool)

(declare-fun e!808028 () Bool)

(assert (=> d!153747 (=> res!965296 e!808028)))

(assert (=> d!153747 (= res!965296 (bvsge #b00000000000000000000000000000000 (size!47572 a!2831)))))

(assert (=> d!153747 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33605) e!808028)))

(declare-fun b!1431208 () Bool)

(declare-fun e!808030 () Bool)

(assert (=> b!1431208 (= e!808028 e!808030)))

(declare-fun res!965298 () Bool)

(assert (=> b!1431208 (=> (not res!965298) (not e!808030))))

(assert (=> b!1431208 (= res!965298 (not e!808029))))

(declare-fun res!965297 () Bool)

(assert (=> b!1431208 (=> (not res!965297) (not e!808029))))

(assert (=> b!1431208 (= res!965297 (validKeyInArray!0 (select (arr!47020 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1431209 () Bool)

(assert (=> b!1431209 (= e!808030 e!808027)))

(declare-fun c!132454 () Bool)

(assert (=> b!1431209 (= c!132454 (validKeyInArray!0 (select (arr!47020 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67448 () Bool)

(assert (=> bm!67448 (= call!67451 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132454 (Cons!33604 (select (arr!47020 a!2831) #b00000000000000000000000000000000) Nil!33605) Nil!33605)))))

(declare-fun b!1431210 () Bool)

(assert (=> b!1431210 (= e!808027 call!67451)))

(assert (= (and d!153747 (not res!965296)) b!1431208))

(assert (= (and b!1431208 res!965297) b!1431206))

(assert (= (and b!1431208 res!965298) b!1431209))

(assert (= (and b!1431209 c!132454) b!1431207))

(assert (= (and b!1431209 (not c!132454)) b!1431210))

(assert (= (or b!1431207 b!1431210) bm!67448))

(declare-fun m!1320563 () Bool)

(assert (=> b!1431206 m!1320563))

(assert (=> b!1431206 m!1320563))

(declare-fun m!1320569 () Bool)

(assert (=> b!1431206 m!1320569))

(assert (=> b!1431208 m!1320563))

(assert (=> b!1431208 m!1320563))

(declare-fun m!1320573 () Bool)

(assert (=> b!1431208 m!1320573))

(assert (=> b!1431209 m!1320563))

(assert (=> b!1431209 m!1320563))

(assert (=> b!1431209 m!1320573))

(assert (=> bm!67448 m!1320563))

(declare-fun m!1320577 () Bool)

(assert (=> bm!67448 m!1320577))

(assert (=> b!1430967 d!153747))

(declare-fun e!808072 () SeekEntryResult!11326)

(declare-fun lt!629943 () SeekEntryResult!11326)

(declare-fun b!1431285 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97422 (_ BitVec 32)) SeekEntryResult!11326)

(assert (=> b!1431285 (= e!808072 (seekKeyOrZeroReturnVacant!0 (x!129333 lt!629943) (index!47698 lt!629943) (index!47698 lt!629943) (select (arr!47020 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153759 () Bool)

(declare-fun lt!629944 () SeekEntryResult!11326)

(assert (=> d!153759 (and (or ((_ is Undefined!11326) lt!629944) (not ((_ is Found!11326) lt!629944)) (and (bvsge (index!47697 lt!629944) #b00000000000000000000000000000000) (bvslt (index!47697 lt!629944) (size!47572 a!2831)))) (or ((_ is Undefined!11326) lt!629944) ((_ is Found!11326) lt!629944) (not ((_ is MissingZero!11326) lt!629944)) (and (bvsge (index!47696 lt!629944) #b00000000000000000000000000000000) (bvslt (index!47696 lt!629944) (size!47572 a!2831)))) (or ((_ is Undefined!11326) lt!629944) ((_ is Found!11326) lt!629944) ((_ is MissingZero!11326) lt!629944) (not ((_ is MissingVacant!11326) lt!629944)) (and (bvsge (index!47699 lt!629944) #b00000000000000000000000000000000) (bvslt (index!47699 lt!629944) (size!47572 a!2831)))) (or ((_ is Undefined!11326) lt!629944) (ite ((_ is Found!11326) lt!629944) (= (select (arr!47020 a!2831) (index!47697 lt!629944)) (select (arr!47020 a!2831) j!81)) (ite ((_ is MissingZero!11326) lt!629944) (= (select (arr!47020 a!2831) (index!47696 lt!629944)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11326) lt!629944) (= (select (arr!47020 a!2831) (index!47699 lt!629944)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!808074 () SeekEntryResult!11326)

(assert (=> d!153759 (= lt!629944 e!808074)))

(declare-fun c!132484 () Bool)

(assert (=> d!153759 (= c!132484 (and ((_ is Intermediate!11326) lt!629943) (undefined!12138 lt!629943)))))

(assert (=> d!153759 (= lt!629943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) (select (arr!47020 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153759 (validMask!0 mask!2608)))

(assert (=> d!153759 (= (seekEntryOrOpen!0 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!629944)))

(declare-fun b!1431286 () Bool)

(declare-fun e!808073 () SeekEntryResult!11326)

(assert (=> b!1431286 (= e!808073 (Found!11326 (index!47698 lt!629943)))))

(declare-fun b!1431287 () Bool)

(declare-fun c!132486 () Bool)

(declare-fun lt!629945 () (_ BitVec 64))

(assert (=> b!1431287 (= c!132486 (= lt!629945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431287 (= e!808073 e!808072)))

(declare-fun b!1431288 () Bool)

(assert (=> b!1431288 (= e!808072 (MissingZero!11326 (index!47698 lt!629943)))))

(declare-fun b!1431289 () Bool)

(assert (=> b!1431289 (= e!808074 Undefined!11326)))

(declare-fun b!1431290 () Bool)

(assert (=> b!1431290 (= e!808074 e!808073)))

(assert (=> b!1431290 (= lt!629945 (select (arr!47020 a!2831) (index!47698 lt!629943)))))

(declare-fun c!132485 () Bool)

(assert (=> b!1431290 (= c!132485 (= lt!629945 (select (arr!47020 a!2831) j!81)))))

(assert (= (and d!153759 c!132484) b!1431289))

(assert (= (and d!153759 (not c!132484)) b!1431290))

(assert (= (and b!1431290 c!132485) b!1431286))

(assert (= (and b!1431290 (not c!132485)) b!1431287))

(assert (= (and b!1431287 c!132486) b!1431288))

(assert (= (and b!1431287 (not c!132486)) b!1431285))

(assert (=> b!1431285 m!1320365))

(declare-fun m!1320609 () Bool)

(assert (=> b!1431285 m!1320609))

(declare-fun m!1320611 () Bool)

(assert (=> d!153759 m!1320611))

(assert (=> d!153759 m!1320401))

(declare-fun m!1320613 () Bool)

(assert (=> d!153759 m!1320613))

(assert (=> d!153759 m!1320365))

(assert (=> d!153759 m!1320369))

(assert (=> d!153759 m!1320369))

(assert (=> d!153759 m!1320365))

(assert (=> d!153759 m!1320371))

(declare-fun m!1320621 () Bool)

(assert (=> d!153759 m!1320621))

(declare-fun m!1320623 () Bool)

(assert (=> b!1431290 m!1320623))

(assert (=> b!1430962 d!153759))

(declare-fun d!153773 () Bool)

(assert (=> d!153773 (= (validKeyInArray!0 (select (arr!47020 a!2831) j!81)) (and (not (= (select (arr!47020 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47020 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430973 d!153773))

(declare-fun b!1431309 () Bool)

(declare-fun e!808088 () SeekEntryResult!11326)

(assert (=> b!1431309 (= e!808088 (Intermediate!11326 false index!585 x!605))))

(declare-fun b!1431310 () Bool)

(declare-fun e!808086 () SeekEntryResult!11326)

(assert (=> b!1431310 (= e!808086 (Intermediate!11326 true index!585 x!605))))

(declare-fun b!1431311 () Bool)

(assert (=> b!1431311 (= e!808086 e!808088)))

(declare-fun c!132495 () Bool)

(declare-fun lt!629951 () (_ BitVec 64))

(assert (=> b!1431311 (= c!132495 (or (= lt!629951 (select (arr!47020 a!2831) j!81)) (= (bvadd lt!629951 lt!629951) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431312 () Bool)

(declare-fun e!808085 () Bool)

(declare-fun lt!629950 () SeekEntryResult!11326)

(assert (=> b!1431312 (= e!808085 (bvsge (x!129333 lt!629950) #b01111111111111111111111111111110))))

(declare-fun b!1431313 () Bool)

(assert (=> b!1431313 (= e!808088 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47020 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431314 () Bool)

(assert (=> b!1431314 (and (bvsge (index!47698 lt!629950) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629950) (size!47572 a!2831)))))

(declare-fun res!965323 () Bool)

(assert (=> b!1431314 (= res!965323 (= (select (arr!47020 a!2831) (index!47698 lt!629950)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808089 () Bool)

(assert (=> b!1431314 (=> res!965323 e!808089)))

(declare-fun b!1431315 () Bool)

(declare-fun e!808087 () Bool)

(assert (=> b!1431315 (= e!808085 e!808087)))

(declare-fun res!965321 () Bool)

(assert (=> b!1431315 (= res!965321 (and ((_ is Intermediate!11326) lt!629950) (not (undefined!12138 lt!629950)) (bvslt (x!129333 lt!629950) #b01111111111111111111111111111110) (bvsge (x!129333 lt!629950) #b00000000000000000000000000000000) (bvsge (x!129333 lt!629950) x!605)))))

(assert (=> b!1431315 (=> (not res!965321) (not e!808087))))

(declare-fun b!1431317 () Bool)

(assert (=> b!1431317 (and (bvsge (index!47698 lt!629950) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629950) (size!47572 a!2831)))))

(assert (=> b!1431317 (= e!808089 (= (select (arr!47020 a!2831) (index!47698 lt!629950)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153777 () Bool)

(assert (=> d!153777 e!808085))

(declare-fun c!132494 () Bool)

(assert (=> d!153777 (= c!132494 (and ((_ is Intermediate!11326) lt!629950) (undefined!12138 lt!629950)))))

(assert (=> d!153777 (= lt!629950 e!808086)))

(declare-fun c!132493 () Bool)

(assert (=> d!153777 (= c!132493 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153777 (= lt!629951 (select (arr!47020 a!2831) index!585))))

(assert (=> d!153777 (validMask!0 mask!2608)))

(assert (=> d!153777 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!629950)))

(declare-fun b!1431316 () Bool)

(assert (=> b!1431316 (and (bvsge (index!47698 lt!629950) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629950) (size!47572 a!2831)))))

(declare-fun res!965322 () Bool)

(assert (=> b!1431316 (= res!965322 (= (select (arr!47020 a!2831) (index!47698 lt!629950)) (select (arr!47020 a!2831) j!81)))))

(assert (=> b!1431316 (=> res!965322 e!808089)))

(assert (=> b!1431316 (= e!808087 e!808089)))

(assert (= (and d!153777 c!132493) b!1431310))

(assert (= (and d!153777 (not c!132493)) b!1431311))

(assert (= (and b!1431311 c!132495) b!1431309))

(assert (= (and b!1431311 (not c!132495)) b!1431313))

(assert (= (and d!153777 c!132494) b!1431312))

(assert (= (and d!153777 (not c!132494)) b!1431315))

(assert (= (and b!1431315 res!965321) b!1431316))

(assert (= (and b!1431316 (not res!965322)) b!1431314))

(assert (= (and b!1431314 (not res!965323)) b!1431317))

(declare-fun m!1320631 () Bool)

(assert (=> b!1431314 m!1320631))

(assert (=> b!1431316 m!1320631))

(assert (=> b!1431317 m!1320631))

(assert (=> b!1431313 m!1320517))

(assert (=> b!1431313 m!1320517))

(assert (=> b!1431313 m!1320365))

(declare-fun m!1320633 () Bool)

(assert (=> b!1431313 m!1320633))

(assert (=> d!153777 m!1320383))

(assert (=> d!153777 m!1320401))

(assert (=> b!1430968 d!153777))

(declare-fun b!1431318 () Bool)

(declare-fun e!808093 () SeekEntryResult!11326)

(assert (=> b!1431318 (= e!808093 (Intermediate!11326 false (toIndex!0 lt!629813 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431319 () Bool)

(declare-fun e!808091 () SeekEntryResult!11326)

(assert (=> b!1431319 (= e!808091 (Intermediate!11326 true (toIndex!0 lt!629813 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1431320 () Bool)

(assert (=> b!1431320 (= e!808091 e!808093)))

(declare-fun c!132498 () Bool)

(declare-fun lt!629953 () (_ BitVec 64))

(assert (=> b!1431320 (= c!132498 (or (= lt!629953 lt!629813) (= (bvadd lt!629953 lt!629953) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1431321 () Bool)

(declare-fun e!808090 () Bool)

(declare-fun lt!629952 () SeekEntryResult!11326)

(assert (=> b!1431321 (= e!808090 (bvsge (x!129333 lt!629952) #b01111111111111111111111111111110))))

(declare-fun b!1431322 () Bool)

(assert (=> b!1431322 (= e!808093 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629813 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629813 lt!629815 mask!2608))))

(declare-fun b!1431323 () Bool)

(assert (=> b!1431323 (and (bvsge (index!47698 lt!629952) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629952) (size!47572 lt!629815)))))

(declare-fun res!965326 () Bool)

(assert (=> b!1431323 (= res!965326 (= (select (arr!47020 lt!629815) (index!47698 lt!629952)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!808094 () Bool)

(assert (=> b!1431323 (=> res!965326 e!808094)))

(declare-fun b!1431324 () Bool)

(declare-fun e!808092 () Bool)

(assert (=> b!1431324 (= e!808090 e!808092)))

(declare-fun res!965324 () Bool)

(assert (=> b!1431324 (= res!965324 (and ((_ is Intermediate!11326) lt!629952) (not (undefined!12138 lt!629952)) (bvslt (x!129333 lt!629952) #b01111111111111111111111111111110) (bvsge (x!129333 lt!629952) #b00000000000000000000000000000000) (bvsge (x!129333 lt!629952) #b00000000000000000000000000000000)))))

(assert (=> b!1431324 (=> (not res!965324) (not e!808092))))

(declare-fun b!1431326 () Bool)

(assert (=> b!1431326 (and (bvsge (index!47698 lt!629952) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629952) (size!47572 lt!629815)))))

(assert (=> b!1431326 (= e!808094 (= (select (arr!47020 lt!629815) (index!47698 lt!629952)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153781 () Bool)

(assert (=> d!153781 e!808090))

(declare-fun c!132497 () Bool)

(assert (=> d!153781 (= c!132497 (and ((_ is Intermediate!11326) lt!629952) (undefined!12138 lt!629952)))))

(assert (=> d!153781 (= lt!629952 e!808091)))

(declare-fun c!132496 () Bool)

(assert (=> d!153781 (= c!132496 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153781 (= lt!629953 (select (arr!47020 lt!629815) (toIndex!0 lt!629813 mask!2608)))))

(assert (=> d!153781 (validMask!0 mask!2608)))

(assert (=> d!153781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629813 mask!2608) lt!629813 lt!629815 mask!2608) lt!629952)))

(declare-fun b!1431325 () Bool)

(assert (=> b!1431325 (and (bvsge (index!47698 lt!629952) #b00000000000000000000000000000000) (bvslt (index!47698 lt!629952) (size!47572 lt!629815)))))

(declare-fun res!965325 () Bool)

(assert (=> b!1431325 (= res!965325 (= (select (arr!47020 lt!629815) (index!47698 lt!629952)) lt!629813))))

(assert (=> b!1431325 (=> res!965325 e!808094)))

(assert (=> b!1431325 (= e!808092 e!808094)))

(assert (= (and d!153781 c!132496) b!1431319))

(assert (= (and d!153781 (not c!132496)) b!1431320))

(assert (= (and b!1431320 c!132498) b!1431318))

(assert (= (and b!1431320 (not c!132498)) b!1431322))

(assert (= (and d!153781 c!132497) b!1431321))

(assert (= (and d!153781 (not c!132497)) b!1431324))

(assert (= (and b!1431324 res!965324) b!1431325))

(assert (= (and b!1431325 (not res!965325)) b!1431323))

(assert (= (and b!1431323 (not res!965326)) b!1431326))

(declare-fun m!1320635 () Bool)

(assert (=> b!1431323 m!1320635))

(assert (=> b!1431325 m!1320635))

(assert (=> b!1431326 m!1320635))

(assert (=> b!1431322 m!1320373))

(declare-fun m!1320637 () Bool)

(assert (=> b!1431322 m!1320637))

(assert (=> b!1431322 m!1320637))

(declare-fun m!1320639 () Bool)

(assert (=> b!1431322 m!1320639))

(assert (=> d!153781 m!1320373))

(declare-fun m!1320641 () Bool)

(assert (=> d!153781 m!1320641))

(assert (=> d!153781 m!1320401))

(assert (=> b!1430969 d!153781))

(declare-fun d!153783 () Bool)

(declare-fun lt!629955 () (_ BitVec 32))

(declare-fun lt!629954 () (_ BitVec 32))

(assert (=> d!153783 (= lt!629955 (bvmul (bvxor lt!629954 (bvlshr lt!629954 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153783 (= lt!629954 ((_ extract 31 0) (bvand (bvxor lt!629813 (bvlshr lt!629813 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153783 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965265 (let ((h!34928 ((_ extract 31 0) (bvand (bvxor lt!629813 (bvlshr lt!629813 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129339 (bvmul (bvxor h!34928 (bvlshr h!34928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129339 (bvlshr x!129339 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965265 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965265 #b00000000000000000000000000000000))))))

(assert (=> d!153783 (= (toIndex!0 lt!629813 mask!2608) (bvand (bvxor lt!629955 (bvlshr lt!629955 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430969 d!153783))

(declare-fun b!1431327 () Bool)

(declare-fun e!808096 () Bool)

(declare-fun call!67454 () Bool)

(assert (=> b!1431327 (= e!808096 call!67454)))

(declare-fun b!1431328 () Bool)

(declare-fun e!808095 () Bool)

(assert (=> b!1431328 (= e!808095 call!67454)))

(declare-fun bm!67451 () Bool)

(assert (=> bm!67451 (= call!67454 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1431329 () Bool)

(assert (=> b!1431329 (= e!808096 e!808095)))

(declare-fun lt!629958 () (_ BitVec 64))

(assert (=> b!1431329 (= lt!629958 (select (arr!47020 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629956 () Unit!48237)

(assert (=> b!1431329 (= lt!629956 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629958 #b00000000000000000000000000000000))))

(assert (=> b!1431329 (arrayContainsKey!0 a!2831 lt!629958 #b00000000000000000000000000000000)))

(declare-fun lt!629957 () Unit!48237)

(assert (=> b!1431329 (= lt!629957 lt!629956)))

(declare-fun res!965328 () Bool)

(assert (=> b!1431329 (= res!965328 (= (seekEntryOrOpen!0 (select (arr!47020 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11326 #b00000000000000000000000000000000)))))

(assert (=> b!1431329 (=> (not res!965328) (not e!808095))))

(declare-fun d!153785 () Bool)

(declare-fun res!965327 () Bool)

(declare-fun e!808097 () Bool)

(assert (=> d!153785 (=> res!965327 e!808097)))

(assert (=> d!153785 (= res!965327 (bvsge #b00000000000000000000000000000000 (size!47572 a!2831)))))

(assert (=> d!153785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!808097)))

(declare-fun b!1431330 () Bool)

(assert (=> b!1431330 (= e!808097 e!808096)))

(declare-fun c!132499 () Bool)

(assert (=> b!1431330 (= c!132499 (validKeyInArray!0 (select (arr!47020 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153785 (not res!965327)) b!1431330))

(assert (= (and b!1431330 c!132499) b!1431329))

(assert (= (and b!1431330 (not c!132499)) b!1431327))

(assert (= (and b!1431329 res!965328) b!1431328))

(assert (= (or b!1431328 b!1431327) bm!67451))

(declare-fun m!1320643 () Bool)

(assert (=> bm!67451 m!1320643))

(assert (=> b!1431329 m!1320563))

(declare-fun m!1320645 () Bool)

(assert (=> b!1431329 m!1320645))

(declare-fun m!1320647 () Bool)

(assert (=> b!1431329 m!1320647))

(assert (=> b!1431329 m!1320563))

(declare-fun m!1320649 () Bool)

(assert (=> b!1431329 m!1320649))

(assert (=> b!1431330 m!1320563))

(assert (=> b!1431330 m!1320563))

(assert (=> b!1431330 m!1320573))

(assert (=> b!1430964 d!153785))

(check-sat (not b!1431143) (not b!1431329) (not d!153707) (not b!1431313) (not b!1431209) (not d!153715) (not bm!67448) (not bm!67433) (not b!1431206) (not b!1431208) (not d!153735) (not b!1431068) (not bm!67451) (not d!153759) (not b!1431330) (not b!1431134) (not d!153781) (not b!1431069) (not b!1431285) (not b!1431322) (not d!153777))
(check-sat)
