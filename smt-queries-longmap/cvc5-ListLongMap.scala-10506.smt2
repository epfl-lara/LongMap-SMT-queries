; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123732 () Bool)

(assert start!123732)

(declare-fun b!1434325 () Bool)

(declare-fun res!967799 () Bool)

(declare-fun e!809525 () Bool)

(assert (=> b!1434325 (=> (not res!967799) (not e!809525))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97590 0))(
  ( (array!97591 (arr!47099 (Array (_ BitVec 32) (_ BitVec 64))) (size!47649 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97590)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434325 (= res!967799 (and (= (size!47649 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47649 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47649 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434326 () Bool)

(declare-fun res!967796 () Bool)

(assert (=> b!1434326 (=> (not res!967796) (not e!809525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97590 (_ BitVec 32)) Bool)

(assert (=> b!1434326 (= res!967796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434327 () Bool)

(declare-fun e!809526 () Bool)

(declare-fun e!809523 () Bool)

(assert (=> b!1434327 (= e!809526 (not e!809523))))

(declare-fun res!967794 () Bool)

(assert (=> b!1434327 (=> res!967794 e!809523)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434327 (= res!967794 (or (= (select (arr!47099 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47099 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47099 a!2831) index!585) (select (arr!47099 a!2831) j!81)) (= (select (store (arr!47099 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809522 () Bool)

(assert (=> b!1434327 e!809522))

(declare-fun res!967800 () Bool)

(assert (=> b!1434327 (=> (not res!967800) (not e!809522))))

(assert (=> b!1434327 (= res!967800 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48502 0))(
  ( (Unit!48503) )
))
(declare-fun lt!631421 () Unit!48502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48502)

(assert (=> b!1434327 (= lt!631421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434328 () Bool)

(declare-fun e!809524 () Bool)

(assert (=> b!1434328 (= e!809525 e!809524)))

(declare-fun res!967793 () Bool)

(assert (=> b!1434328 (=> (not res!967793) (not e!809524))))

(declare-datatypes ((SeekEntryResult!11378 0))(
  ( (MissingZero!11378 (index!47904 (_ BitVec 32))) (Found!11378 (index!47905 (_ BitVec 32))) (Intermediate!11378 (undefined!12190 Bool) (index!47906 (_ BitVec 32)) (x!129558 (_ BitVec 32))) (Undefined!11378) (MissingVacant!11378 (index!47907 (_ BitVec 32))) )
))
(declare-fun lt!631422 () SeekEntryResult!11378)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97590 (_ BitVec 32)) SeekEntryResult!11378)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434328 (= res!967793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47099 a!2831) j!81) mask!2608) (select (arr!47099 a!2831) j!81) a!2831 mask!2608) lt!631422))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1434328 (= lt!631422 (Intermediate!11378 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434329 () Bool)

(declare-fun e!809527 () Bool)

(assert (=> b!1434329 (= e!809523 e!809527)))

(declare-fun res!967790 () Bool)

(assert (=> b!1434329 (=> res!967790 e!809527)))

(declare-fun lt!631418 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1434329 (= res!967790 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631418 #b00000000000000000000000000000000) (bvsge lt!631418 (size!47649 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434329 (= lt!631418 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434330 () Bool)

(assert (=> b!1434330 (= e!809527 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631418 (select (arr!47099 a!2831) j!81) a!2831 mask!2608) lt!631422))))

(declare-fun b!1434331 () Bool)

(declare-fun res!967798 () Bool)

(assert (=> b!1434331 (=> (not res!967798) (not e!809526))))

(assert (=> b!1434331 (= res!967798 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47099 a!2831) j!81) a!2831 mask!2608) lt!631422))))

(declare-fun b!1434332 () Bool)

(declare-fun res!967787 () Bool)

(assert (=> b!1434332 (=> (not res!967787) (not e!809525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434332 (= res!967787 (validKeyInArray!0 (select (arr!47099 a!2831) j!81)))))

(declare-fun b!1434333 () Bool)

(declare-fun res!967797 () Bool)

(assert (=> b!1434333 (=> (not res!967797) (not e!809526))))

(declare-fun lt!631419 () array!97590)

(declare-fun lt!631417 () (_ BitVec 64))

(declare-fun lt!631420 () SeekEntryResult!11378)

(assert (=> b!1434333 (= res!967797 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631417 lt!631419 mask!2608) lt!631420))))

(declare-fun b!1434334 () Bool)

(assert (=> b!1434334 (= e!809524 e!809526)))

(declare-fun res!967801 () Bool)

(assert (=> b!1434334 (=> (not res!967801) (not e!809526))))

(assert (=> b!1434334 (= res!967801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631417 mask!2608) lt!631417 lt!631419 mask!2608) lt!631420))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434334 (= lt!631420 (Intermediate!11378 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434334 (= lt!631417 (select (store (arr!47099 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434334 (= lt!631419 (array!97591 (store (arr!47099 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47649 a!2831)))))

(declare-fun b!1434336 () Bool)

(declare-fun res!967795 () Bool)

(assert (=> b!1434336 (=> (not res!967795) (not e!809525))))

(assert (=> b!1434336 (= res!967795 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47649 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47649 a!2831))))))

(declare-fun b!1434337 () Bool)

(declare-fun res!967791 () Bool)

(assert (=> b!1434337 (=> (not res!967791) (not e!809526))))

(assert (=> b!1434337 (= res!967791 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434338 () Bool)

(declare-fun res!967789 () Bool)

(assert (=> b!1434338 (=> (not res!967789) (not e!809525))))

(assert (=> b!1434338 (= res!967789 (validKeyInArray!0 (select (arr!47099 a!2831) i!982)))))

(declare-fun b!1434339 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97590 (_ BitVec 32)) SeekEntryResult!11378)

(assert (=> b!1434339 (= e!809522 (= (seekEntryOrOpen!0 (select (arr!47099 a!2831) j!81) a!2831 mask!2608) (Found!11378 j!81)))))

(declare-fun b!1434335 () Bool)

(declare-fun res!967792 () Bool)

(assert (=> b!1434335 (=> (not res!967792) (not e!809525))))

(declare-datatypes ((List!33609 0))(
  ( (Nil!33606) (Cons!33605 (h!34934 (_ BitVec 64)) (t!48303 List!33609)) )
))
(declare-fun arrayNoDuplicates!0 (array!97590 (_ BitVec 32) List!33609) Bool)

(assert (=> b!1434335 (= res!967792 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33606))))

(declare-fun res!967788 () Bool)

(assert (=> start!123732 (=> (not res!967788) (not e!809525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123732 (= res!967788 (validMask!0 mask!2608))))

(assert (=> start!123732 e!809525))

(assert (=> start!123732 true))

(declare-fun array_inv!36127 (array!97590) Bool)

(assert (=> start!123732 (array_inv!36127 a!2831)))

(assert (= (and start!123732 res!967788) b!1434325))

(assert (= (and b!1434325 res!967799) b!1434338))

(assert (= (and b!1434338 res!967789) b!1434332))

(assert (= (and b!1434332 res!967787) b!1434326))

(assert (= (and b!1434326 res!967796) b!1434335))

(assert (= (and b!1434335 res!967792) b!1434336))

(assert (= (and b!1434336 res!967795) b!1434328))

(assert (= (and b!1434328 res!967793) b!1434334))

(assert (= (and b!1434334 res!967801) b!1434331))

(assert (= (and b!1434331 res!967798) b!1434333))

(assert (= (and b!1434333 res!967797) b!1434337))

(assert (= (and b!1434337 res!967791) b!1434327))

(assert (= (and b!1434327 res!967800) b!1434339))

(assert (= (and b!1434327 (not res!967794)) b!1434329))

(assert (= (and b!1434329 (not res!967790)) b!1434330))

(declare-fun m!1323945 () Bool)

(assert (=> start!123732 m!1323945))

(declare-fun m!1323947 () Bool)

(assert (=> start!123732 m!1323947))

(declare-fun m!1323949 () Bool)

(assert (=> b!1434335 m!1323949))

(declare-fun m!1323951 () Bool)

(assert (=> b!1434330 m!1323951))

(assert (=> b!1434330 m!1323951))

(declare-fun m!1323953 () Bool)

(assert (=> b!1434330 m!1323953))

(declare-fun m!1323955 () Bool)

(assert (=> b!1434327 m!1323955))

(declare-fun m!1323957 () Bool)

(assert (=> b!1434327 m!1323957))

(declare-fun m!1323959 () Bool)

(assert (=> b!1434327 m!1323959))

(declare-fun m!1323961 () Bool)

(assert (=> b!1434327 m!1323961))

(assert (=> b!1434327 m!1323951))

(declare-fun m!1323963 () Bool)

(assert (=> b!1434327 m!1323963))

(assert (=> b!1434339 m!1323951))

(assert (=> b!1434339 m!1323951))

(declare-fun m!1323965 () Bool)

(assert (=> b!1434339 m!1323965))

(declare-fun m!1323967 () Bool)

(assert (=> b!1434333 m!1323967))

(declare-fun m!1323969 () Bool)

(assert (=> b!1434326 m!1323969))

(assert (=> b!1434332 m!1323951))

(assert (=> b!1434332 m!1323951))

(declare-fun m!1323971 () Bool)

(assert (=> b!1434332 m!1323971))

(assert (=> b!1434328 m!1323951))

(assert (=> b!1434328 m!1323951))

(declare-fun m!1323973 () Bool)

(assert (=> b!1434328 m!1323973))

(assert (=> b!1434328 m!1323973))

(assert (=> b!1434328 m!1323951))

(declare-fun m!1323975 () Bool)

(assert (=> b!1434328 m!1323975))

(assert (=> b!1434331 m!1323951))

(assert (=> b!1434331 m!1323951))

(declare-fun m!1323977 () Bool)

(assert (=> b!1434331 m!1323977))

(declare-fun m!1323979 () Bool)

(assert (=> b!1434329 m!1323979))

(declare-fun m!1323981 () Bool)

(assert (=> b!1434334 m!1323981))

(assert (=> b!1434334 m!1323981))

(declare-fun m!1323983 () Bool)

(assert (=> b!1434334 m!1323983))

(assert (=> b!1434334 m!1323955))

(declare-fun m!1323985 () Bool)

(assert (=> b!1434334 m!1323985))

(declare-fun m!1323987 () Bool)

(assert (=> b!1434338 m!1323987))

(assert (=> b!1434338 m!1323987))

(declare-fun m!1323989 () Bool)

(assert (=> b!1434338 m!1323989))

(push 1)

(assert (not b!1434339))

(assert (not b!1434332))

(assert (not b!1434330))

(assert (not b!1434329))

(assert (not b!1434338))

(assert (not b!1434328))

(assert (not b!1434327))

(assert (not b!1434334))

(assert (not start!123732))

(assert (not b!1434331))

(assert (not b!1434333))

(assert (not b!1434335))

(assert (not b!1434326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154207 () Bool)

(declare-fun lt!631476 () (_ BitVec 32))

(assert (=> d!154207 (and (bvsge lt!631476 #b00000000000000000000000000000000) (bvslt lt!631476 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154207 (= lt!631476 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154207 (validMask!0 mask!2608)))

(assert (=> d!154207 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631476)))

(declare-fun bs!41763 () Bool)

(assert (= bs!41763 d!154207))

(declare-fun m!1324101 () Bool)

(assert (=> bs!41763 m!1324101))

(assert (=> bs!41763 m!1323945))

(assert (=> b!1434329 d!154207))

(declare-fun b!1434536 () Bool)

(declare-fun e!809642 () SeekEntryResult!11378)

(assert (=> b!1434536 (= e!809642 (Intermediate!11378 false lt!631418 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434537 () Bool)

(declare-fun e!809641 () SeekEntryResult!11378)

(assert (=> b!1434537 (= e!809641 (Intermediate!11378 true lt!631418 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434538 () Bool)

(assert (=> b!1434538 (= e!809642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631418 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) (select (arr!47099 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434539 () Bool)

(declare-fun e!809643 () Bool)

(declare-fun e!809640 () Bool)

(assert (=> b!1434539 (= e!809643 e!809640)))

(declare-fun res!967938 () Bool)

(declare-fun lt!631512 () SeekEntryResult!11378)

(assert (=> b!1434539 (= res!967938 (and (is-Intermediate!11378 lt!631512) (not (undefined!12190 lt!631512)) (bvslt (x!129558 lt!631512) #b01111111111111111111111111111110) (bvsge (x!129558 lt!631512) #b00000000000000000000000000000000) (bvsge (x!129558 lt!631512) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1434539 (=> (not res!967938) (not e!809640))))

(declare-fun b!1434540 () Bool)

(assert (=> b!1434540 (and (bvsge (index!47906 lt!631512) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631512) (size!47649 a!2831)))))

(declare-fun res!967937 () Bool)

(assert (=> b!1434540 (= res!967937 (= (select (arr!47099 a!2831) (index!47906 lt!631512)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809639 () Bool)

(assert (=> b!1434540 (=> res!967937 e!809639)))

(declare-fun b!1434541 () Bool)

(assert (=> b!1434541 (= e!809641 e!809642)))

(declare-fun lt!631513 () (_ BitVec 64))

(declare-fun c!132801 () Bool)

(assert (=> b!1434541 (= c!132801 (or (= lt!631513 (select (arr!47099 a!2831) j!81)) (= (bvadd lt!631513 lt!631513) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434542 () Bool)

(assert (=> b!1434542 (= e!809643 (bvsge (x!129558 lt!631512) #b01111111111111111111111111111110))))

(declare-fun b!1434543 () Bool)

(assert (=> b!1434543 (and (bvsge (index!47906 lt!631512) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631512) (size!47649 a!2831)))))

(declare-fun res!967939 () Bool)

(assert (=> b!1434543 (= res!967939 (= (select (arr!47099 a!2831) (index!47906 lt!631512)) (select (arr!47099 a!2831) j!81)))))

(assert (=> b!1434543 (=> res!967939 e!809639)))

(assert (=> b!1434543 (= e!809640 e!809639)))

(declare-fun d!154213 () Bool)

(assert (=> d!154213 e!809643))

(declare-fun c!132802 () Bool)

(assert (=> d!154213 (= c!132802 (and (is-Intermediate!11378 lt!631512) (undefined!12190 lt!631512)))))

(assert (=> d!154213 (= lt!631512 e!809641)))

(declare-fun c!132800 () Bool)

(assert (=> d!154213 (= c!132800 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154213 (= lt!631513 (select (arr!47099 a!2831) lt!631418))))

(assert (=> d!154213 (validMask!0 mask!2608)))

(assert (=> d!154213 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631418 (select (arr!47099 a!2831) j!81) a!2831 mask!2608) lt!631512)))

(declare-fun b!1434544 () Bool)

(assert (=> b!1434544 (and (bvsge (index!47906 lt!631512) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631512) (size!47649 a!2831)))))

(assert (=> b!1434544 (= e!809639 (= (select (arr!47099 a!2831) (index!47906 lt!631512)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154213 c!132800) b!1434537))

(assert (= (and d!154213 (not c!132800)) b!1434541))

(assert (= (and b!1434541 c!132801) b!1434536))

(assert (= (and b!1434541 (not c!132801)) b!1434538))

(assert (= (and d!154213 c!132802) b!1434542))

(assert (= (and d!154213 (not c!132802)) b!1434539))

(assert (= (and b!1434539 res!967938) b!1434543))

(assert (= (and b!1434543 (not res!967939)) b!1434540))

(assert (= (and b!1434540 (not res!967937)) b!1434544))

(declare-fun m!1324141 () Bool)

(assert (=> b!1434540 m!1324141))

(assert (=> b!1434543 m!1324141))

(declare-fun m!1324143 () Bool)

(assert (=> b!1434538 m!1324143))

(assert (=> b!1434538 m!1324143))

(assert (=> b!1434538 m!1323951))

(declare-fun m!1324145 () Bool)

(assert (=> b!1434538 m!1324145))

(declare-fun m!1324147 () Bool)

(assert (=> d!154213 m!1324147))

(assert (=> d!154213 m!1323945))

(assert (=> b!1434544 m!1324141))

(assert (=> b!1434330 d!154213))

(declare-fun b!1434545 () Bool)

(declare-fun e!809647 () SeekEntryResult!11378)

(assert (=> b!1434545 (= e!809647 (Intermediate!11378 false index!585 x!605))))

(declare-fun b!1434546 () Bool)

(declare-fun e!809646 () SeekEntryResult!11378)

(assert (=> b!1434546 (= e!809646 (Intermediate!11378 true index!585 x!605))))

(declare-fun b!1434547 () Bool)

(assert (=> b!1434547 (= e!809647 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47099 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434548 () Bool)

(declare-fun e!809648 () Bool)

(declare-fun e!809645 () Bool)

(assert (=> b!1434548 (= e!809648 e!809645)))

(declare-fun res!967941 () Bool)

(declare-fun lt!631514 () SeekEntryResult!11378)

(assert (=> b!1434548 (= res!967941 (and (is-Intermediate!11378 lt!631514) (not (undefined!12190 lt!631514)) (bvslt (x!129558 lt!631514) #b01111111111111111111111111111110) (bvsge (x!129558 lt!631514) #b00000000000000000000000000000000) (bvsge (x!129558 lt!631514) x!605)))))

(assert (=> b!1434548 (=> (not res!967941) (not e!809645))))

(declare-fun b!1434549 () Bool)

(assert (=> b!1434549 (and (bvsge (index!47906 lt!631514) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631514) (size!47649 a!2831)))))

(declare-fun res!967940 () Bool)

(assert (=> b!1434549 (= res!967940 (= (select (arr!47099 a!2831) (index!47906 lt!631514)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809644 () Bool)

(assert (=> b!1434549 (=> res!967940 e!809644)))

(declare-fun b!1434550 () Bool)

(assert (=> b!1434550 (= e!809646 e!809647)))

(declare-fun lt!631515 () (_ BitVec 64))

(declare-fun c!132804 () Bool)

(assert (=> b!1434550 (= c!132804 (or (= lt!631515 (select (arr!47099 a!2831) j!81)) (= (bvadd lt!631515 lt!631515) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434551 () Bool)

(assert (=> b!1434551 (= e!809648 (bvsge (x!129558 lt!631514) #b01111111111111111111111111111110))))

(declare-fun b!1434552 () Bool)

(assert (=> b!1434552 (and (bvsge (index!47906 lt!631514) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631514) (size!47649 a!2831)))))

(declare-fun res!967942 () Bool)

(assert (=> b!1434552 (= res!967942 (= (select (arr!47099 a!2831) (index!47906 lt!631514)) (select (arr!47099 a!2831) j!81)))))

(assert (=> b!1434552 (=> res!967942 e!809644)))

(assert (=> b!1434552 (= e!809645 e!809644)))

(declare-fun d!154231 () Bool)

(assert (=> d!154231 e!809648))

(declare-fun c!132805 () Bool)

(assert (=> d!154231 (= c!132805 (and (is-Intermediate!11378 lt!631514) (undefined!12190 lt!631514)))))

(assert (=> d!154231 (= lt!631514 e!809646)))

(declare-fun c!132803 () Bool)

(assert (=> d!154231 (= c!132803 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154231 (= lt!631515 (select (arr!47099 a!2831) index!585))))

(assert (=> d!154231 (validMask!0 mask!2608)))

(assert (=> d!154231 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47099 a!2831) j!81) a!2831 mask!2608) lt!631514)))

(declare-fun b!1434553 () Bool)

(assert (=> b!1434553 (and (bvsge (index!47906 lt!631514) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631514) (size!47649 a!2831)))))

(assert (=> b!1434553 (= e!809644 (= (select (arr!47099 a!2831) (index!47906 lt!631514)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154231 c!132803) b!1434546))

(assert (= (and d!154231 (not c!132803)) b!1434550))

(assert (= (and b!1434550 c!132804) b!1434545))

(assert (= (and b!1434550 (not c!132804)) b!1434547))

(assert (= (and d!154231 c!132805) b!1434551))

(assert (= (and d!154231 (not c!132805)) b!1434548))

(assert (= (and b!1434548 res!967941) b!1434552))

(assert (= (and b!1434552 (not res!967942)) b!1434549))

(assert (= (and b!1434549 (not res!967940)) b!1434553))

(declare-fun m!1324149 () Bool)

(assert (=> b!1434549 m!1324149))

(assert (=> b!1434552 m!1324149))

(assert (=> b!1434547 m!1323979))

(assert (=> b!1434547 m!1323979))

(assert (=> b!1434547 m!1323951))

(declare-fun m!1324151 () Bool)

(assert (=> b!1434547 m!1324151))

(assert (=> d!154231 m!1323959))

(assert (=> d!154231 m!1323945))

(assert (=> b!1434553 m!1324149))

(assert (=> b!1434331 d!154231))

(declare-fun d!154233 () Bool)

(assert (=> d!154233 (= (validKeyInArray!0 (select (arr!47099 a!2831) j!81)) (and (not (= (select (arr!47099 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47099 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434332 d!154233))

(declare-fun b!1434554 () Bool)

(declare-fun e!809652 () SeekEntryResult!11378)

(assert (=> b!1434554 (= e!809652 (Intermediate!11378 false index!585 x!605))))

(declare-fun b!1434555 () Bool)

(declare-fun e!809651 () SeekEntryResult!11378)

(assert (=> b!1434555 (= e!809651 (Intermediate!11378 true index!585 x!605))))

(declare-fun b!1434556 () Bool)

(assert (=> b!1434556 (= e!809652 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631417 lt!631419 mask!2608))))

(declare-fun b!1434557 () Bool)

(declare-fun e!809653 () Bool)

(declare-fun e!809650 () Bool)

(assert (=> b!1434557 (= e!809653 e!809650)))

(declare-fun res!967944 () Bool)

(declare-fun lt!631516 () SeekEntryResult!11378)

(assert (=> b!1434557 (= res!967944 (and (is-Intermediate!11378 lt!631516) (not (undefined!12190 lt!631516)) (bvslt (x!129558 lt!631516) #b01111111111111111111111111111110) (bvsge (x!129558 lt!631516) #b00000000000000000000000000000000) (bvsge (x!129558 lt!631516) x!605)))))

(assert (=> b!1434557 (=> (not res!967944) (not e!809650))))

(declare-fun b!1434558 () Bool)

(assert (=> b!1434558 (and (bvsge (index!47906 lt!631516) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631516) (size!47649 lt!631419)))))

(declare-fun res!967943 () Bool)

(assert (=> b!1434558 (= res!967943 (= (select (arr!47099 lt!631419) (index!47906 lt!631516)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809649 () Bool)

(assert (=> b!1434558 (=> res!967943 e!809649)))

(declare-fun b!1434559 () Bool)

(assert (=> b!1434559 (= e!809651 e!809652)))

(declare-fun c!132807 () Bool)

(declare-fun lt!631517 () (_ BitVec 64))

(assert (=> b!1434559 (= c!132807 (or (= lt!631517 lt!631417) (= (bvadd lt!631517 lt!631517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434560 () Bool)

(assert (=> b!1434560 (= e!809653 (bvsge (x!129558 lt!631516) #b01111111111111111111111111111110))))

(declare-fun b!1434561 () Bool)

(assert (=> b!1434561 (and (bvsge (index!47906 lt!631516) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631516) (size!47649 lt!631419)))))

(declare-fun res!967945 () Bool)

(assert (=> b!1434561 (= res!967945 (= (select (arr!47099 lt!631419) (index!47906 lt!631516)) lt!631417))))

(assert (=> b!1434561 (=> res!967945 e!809649)))

(assert (=> b!1434561 (= e!809650 e!809649)))

(declare-fun d!154235 () Bool)

(assert (=> d!154235 e!809653))

(declare-fun c!132808 () Bool)

(assert (=> d!154235 (= c!132808 (and (is-Intermediate!11378 lt!631516) (undefined!12190 lt!631516)))))

(assert (=> d!154235 (= lt!631516 e!809651)))

(declare-fun c!132806 () Bool)

(assert (=> d!154235 (= c!132806 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154235 (= lt!631517 (select (arr!47099 lt!631419) index!585))))

(assert (=> d!154235 (validMask!0 mask!2608)))

(assert (=> d!154235 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631417 lt!631419 mask!2608) lt!631516)))

(declare-fun b!1434562 () Bool)

(assert (=> b!1434562 (and (bvsge (index!47906 lt!631516) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631516) (size!47649 lt!631419)))))

(assert (=> b!1434562 (= e!809649 (= (select (arr!47099 lt!631419) (index!47906 lt!631516)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154235 c!132806) b!1434555))

(assert (= (and d!154235 (not c!132806)) b!1434559))

(assert (= (and b!1434559 c!132807) b!1434554))

(assert (= (and b!1434559 (not c!132807)) b!1434556))

(assert (= (and d!154235 c!132808) b!1434560))

(assert (= (and d!154235 (not c!132808)) b!1434557))

(assert (= (and b!1434557 res!967944) b!1434561))

(assert (= (and b!1434561 (not res!967945)) b!1434558))

(assert (= (and b!1434558 (not res!967943)) b!1434562))

(declare-fun m!1324153 () Bool)

(assert (=> b!1434558 m!1324153))

(assert (=> b!1434561 m!1324153))

(assert (=> b!1434556 m!1323979))

(assert (=> b!1434556 m!1323979))

(declare-fun m!1324155 () Bool)

(assert (=> b!1434556 m!1324155))

(declare-fun m!1324157 () Bool)

(assert (=> d!154235 m!1324157))

(assert (=> d!154235 m!1323945))

(assert (=> b!1434562 m!1324153))

(assert (=> b!1434333 d!154235))

(declare-fun b!1434563 () Bool)

(declare-fun e!809657 () SeekEntryResult!11378)

(assert (=> b!1434563 (= e!809657 (Intermediate!11378 false (toIndex!0 lt!631417 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434564 () Bool)

(declare-fun e!809656 () SeekEntryResult!11378)

(assert (=> b!1434564 (= e!809656 (Intermediate!11378 true (toIndex!0 lt!631417 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434565 () Bool)

(assert (=> b!1434565 (= e!809657 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631417 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631417 lt!631419 mask!2608))))

(declare-fun b!1434566 () Bool)

(declare-fun e!809658 () Bool)

(declare-fun e!809655 () Bool)

(assert (=> b!1434566 (= e!809658 e!809655)))

(declare-fun res!967947 () Bool)

(declare-fun lt!631518 () SeekEntryResult!11378)

(assert (=> b!1434566 (= res!967947 (and (is-Intermediate!11378 lt!631518) (not (undefined!12190 lt!631518)) (bvslt (x!129558 lt!631518) #b01111111111111111111111111111110) (bvsge (x!129558 lt!631518) #b00000000000000000000000000000000) (bvsge (x!129558 lt!631518) #b00000000000000000000000000000000)))))

(assert (=> b!1434566 (=> (not res!967947) (not e!809655))))

(declare-fun b!1434567 () Bool)

(assert (=> b!1434567 (and (bvsge (index!47906 lt!631518) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631518) (size!47649 lt!631419)))))

(declare-fun res!967946 () Bool)

(assert (=> b!1434567 (= res!967946 (= (select (arr!47099 lt!631419) (index!47906 lt!631518)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809654 () Bool)

(assert (=> b!1434567 (=> res!967946 e!809654)))

(declare-fun b!1434568 () Bool)

(assert (=> b!1434568 (= e!809656 e!809657)))

(declare-fun c!132810 () Bool)

(declare-fun lt!631519 () (_ BitVec 64))

(assert (=> b!1434568 (= c!132810 (or (= lt!631519 lt!631417) (= (bvadd lt!631519 lt!631519) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434569 () Bool)

(assert (=> b!1434569 (= e!809658 (bvsge (x!129558 lt!631518) #b01111111111111111111111111111110))))

(declare-fun b!1434570 () Bool)

(assert (=> b!1434570 (and (bvsge (index!47906 lt!631518) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631518) (size!47649 lt!631419)))))

(declare-fun res!967948 () Bool)

(assert (=> b!1434570 (= res!967948 (= (select (arr!47099 lt!631419) (index!47906 lt!631518)) lt!631417))))

(assert (=> b!1434570 (=> res!967948 e!809654)))

(assert (=> b!1434570 (= e!809655 e!809654)))

(declare-fun d!154237 () Bool)

(assert (=> d!154237 e!809658))

(declare-fun c!132811 () Bool)

(assert (=> d!154237 (= c!132811 (and (is-Intermediate!11378 lt!631518) (undefined!12190 lt!631518)))))

(assert (=> d!154237 (= lt!631518 e!809656)))

(declare-fun c!132809 () Bool)

(assert (=> d!154237 (= c!132809 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154237 (= lt!631519 (select (arr!47099 lt!631419) (toIndex!0 lt!631417 mask!2608)))))

(assert (=> d!154237 (validMask!0 mask!2608)))

(assert (=> d!154237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631417 mask!2608) lt!631417 lt!631419 mask!2608) lt!631518)))

(declare-fun b!1434571 () Bool)

(assert (=> b!1434571 (and (bvsge (index!47906 lt!631518) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631518) (size!47649 lt!631419)))))

(assert (=> b!1434571 (= e!809654 (= (select (arr!47099 lt!631419) (index!47906 lt!631518)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154237 c!132809) b!1434564))

(assert (= (and d!154237 (not c!132809)) b!1434568))

(assert (= (and b!1434568 c!132810) b!1434563))

(assert (= (and b!1434568 (not c!132810)) b!1434565))

(assert (= (and d!154237 c!132811) b!1434569))

(assert (= (and d!154237 (not c!132811)) b!1434566))

(assert (= (and b!1434566 res!967947) b!1434570))

(assert (= (and b!1434570 (not res!967948)) b!1434567))

(assert (= (and b!1434567 (not res!967946)) b!1434571))

(declare-fun m!1324159 () Bool)

(assert (=> b!1434567 m!1324159))

(assert (=> b!1434570 m!1324159))

(assert (=> b!1434565 m!1323981))

(declare-fun m!1324161 () Bool)

(assert (=> b!1434565 m!1324161))

(assert (=> b!1434565 m!1324161))

(declare-fun m!1324163 () Bool)

(assert (=> b!1434565 m!1324163))

(assert (=> d!154237 m!1323981))

(declare-fun m!1324165 () Bool)

(assert (=> d!154237 m!1324165))

(assert (=> d!154237 m!1323945))

(assert (=> b!1434571 m!1324159))

(assert (=> b!1434334 d!154237))

(declare-fun d!154239 () Bool)

(declare-fun lt!631535 () (_ BitVec 32))

(declare-fun lt!631534 () (_ BitVec 32))

(assert (=> d!154239 (= lt!631535 (bvmul (bvxor lt!631534 (bvlshr lt!631534 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154239 (= lt!631534 ((_ extract 31 0) (bvand (bvxor lt!631417 (bvlshr lt!631417 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154239 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967949 (let ((h!34938 ((_ extract 31 0) (bvand (bvxor lt!631417 (bvlshr lt!631417 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129567 (bvmul (bvxor h!34938 (bvlshr h!34938 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129567 (bvlshr x!129567 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967949 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967949 #b00000000000000000000000000000000))))))

(assert (=> d!154239 (= (toIndex!0 lt!631417 mask!2608) (bvand (bvxor lt!631535 (bvlshr lt!631535 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434334 d!154239))

(declare-fun b!1434645 () Bool)

(declare-fun e!809702 () Bool)

(declare-fun e!809701 () Bool)

(assert (=> b!1434645 (= e!809702 e!809701)))

(declare-fun c!132838 () Bool)

(assert (=> b!1434645 (= c!132838 (validKeyInArray!0 (select (arr!47099 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434647 () Bool)

(declare-fun e!809703 () Bool)

(declare-fun contains!9873 (List!33609 (_ BitVec 64)) Bool)

(assert (=> b!1434647 (= e!809703 (contains!9873 Nil!33606 (select (arr!47099 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67529 () Bool)

(declare-fun call!67532 () Bool)

(assert (=> bm!67529 (= call!67532 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132838 (Cons!33605 (select (arr!47099 a!2831) #b00000000000000000000000000000000) Nil!33606) Nil!33606)))))

(declare-fun b!1434648 () Bool)

(declare-fun e!809704 () Bool)

(assert (=> b!1434648 (= e!809704 e!809702)))

(declare-fun res!967973 () Bool)

(assert (=> b!1434648 (=> (not res!967973) (not e!809702))))

(assert (=> b!1434648 (= res!967973 (not e!809703))))

(declare-fun res!967974 () Bool)

(assert (=> b!1434648 (=> (not res!967974) (not e!809703))))

(assert (=> b!1434648 (= res!967974 (validKeyInArray!0 (select (arr!47099 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434649 () Bool)

(assert (=> b!1434649 (= e!809701 call!67532)))

(declare-fun d!154241 () Bool)

(declare-fun res!967972 () Bool)

(assert (=> d!154241 (=> res!967972 e!809704)))

(assert (=> d!154241 (= res!967972 (bvsge #b00000000000000000000000000000000 (size!47649 a!2831)))))

(assert (=> d!154241 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33606) e!809704)))

(declare-fun b!1434646 () Bool)

(assert (=> b!1434646 (= e!809701 call!67532)))

(assert (= (and d!154241 (not res!967972)) b!1434648))

(assert (= (and b!1434648 res!967974) b!1434647))

(assert (= (and b!1434648 res!967973) b!1434645))

(assert (= (and b!1434645 c!132838) b!1434646))

(assert (= (and b!1434645 (not c!132838)) b!1434649))

(assert (= (or b!1434646 b!1434649) bm!67529))

(declare-fun m!1324197 () Bool)

(assert (=> b!1434645 m!1324197))

(assert (=> b!1434645 m!1324197))

(declare-fun m!1324199 () Bool)

(assert (=> b!1434645 m!1324199))

(assert (=> b!1434647 m!1324197))

(assert (=> b!1434647 m!1324197))

(declare-fun m!1324201 () Bool)

(assert (=> b!1434647 m!1324201))

(assert (=> bm!67529 m!1324197))

(declare-fun m!1324203 () Bool)

(assert (=> bm!67529 m!1324203))

(assert (=> b!1434648 m!1324197))

(assert (=> b!1434648 m!1324197))

(assert (=> b!1434648 m!1324199))

(assert (=> b!1434335 d!154241))

(declare-fun b!1434658 () Bool)

(declare-fun e!809712 () Bool)

(declare-fun call!67535 () Bool)

(assert (=> b!1434658 (= e!809712 call!67535)))

(declare-fun d!154253 () Bool)

(declare-fun res!967979 () Bool)

(declare-fun e!809711 () Bool)

(assert (=> d!154253 (=> res!967979 e!809711)))

(assert (=> d!154253 (= res!967979 (bvsge #b00000000000000000000000000000000 (size!47649 a!2831)))))

(assert (=> d!154253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809711)))

(declare-fun b!1434659 () Bool)

(assert (=> b!1434659 (= e!809711 e!809712)))

(declare-fun c!132841 () Bool)

(assert (=> b!1434659 (= c!132841 (validKeyInArray!0 (select (arr!47099 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67532 () Bool)

(assert (=> bm!67532 (= call!67535 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434660 () Bool)

(declare-fun e!809713 () Bool)

(assert (=> b!1434660 (= e!809712 e!809713)))

(declare-fun lt!631563 () (_ BitVec 64))

(assert (=> b!1434660 (= lt!631563 (select (arr!47099 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631562 () Unit!48502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97590 (_ BitVec 64) (_ BitVec 32)) Unit!48502)

(assert (=> b!1434660 (= lt!631562 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631563 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434660 (arrayContainsKey!0 a!2831 lt!631563 #b00000000000000000000000000000000)))

(declare-fun lt!631564 () Unit!48502)

(assert (=> b!1434660 (= lt!631564 lt!631562)))

(declare-fun res!967980 () Bool)

(assert (=> b!1434660 (= res!967980 (= (seekEntryOrOpen!0 (select (arr!47099 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11378 #b00000000000000000000000000000000)))))

(assert (=> b!1434660 (=> (not res!967980) (not e!809713))))

(declare-fun b!1434661 () Bool)

(assert (=> b!1434661 (= e!809713 call!67535)))

(assert (= (and d!154253 (not res!967979)) b!1434659))

(assert (= (and b!1434659 c!132841) b!1434660))

(assert (= (and b!1434659 (not c!132841)) b!1434658))

(assert (= (and b!1434660 res!967980) b!1434661))

(assert (= (or b!1434661 b!1434658) bm!67532))

(assert (=> b!1434659 m!1324197))

(assert (=> b!1434659 m!1324197))

(assert (=> b!1434659 m!1324199))

(declare-fun m!1324207 () Bool)

(assert (=> bm!67532 m!1324207))

(assert (=> b!1434660 m!1324197))

(declare-fun m!1324209 () Bool)

(assert (=> b!1434660 m!1324209))

(declare-fun m!1324211 () Bool)

(assert (=> b!1434660 m!1324211))

(assert (=> b!1434660 m!1324197))

(declare-fun m!1324213 () Bool)

(assert (=> b!1434660 m!1324213))

(assert (=> b!1434326 d!154253))

(declare-fun b!1434662 () Bool)

(declare-fun e!809715 () Bool)

(declare-fun call!67536 () Bool)

(assert (=> b!1434662 (= e!809715 call!67536)))

(declare-fun d!154257 () Bool)

(declare-fun res!967981 () Bool)

(declare-fun e!809714 () Bool)

(assert (=> d!154257 (=> res!967981 e!809714)))

(assert (=> d!154257 (= res!967981 (bvsge j!81 (size!47649 a!2831)))))

(assert (=> d!154257 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809714)))

(declare-fun b!1434663 () Bool)

(assert (=> b!1434663 (= e!809714 e!809715)))

(declare-fun c!132842 () Bool)

(assert (=> b!1434663 (= c!132842 (validKeyInArray!0 (select (arr!47099 a!2831) j!81)))))

(declare-fun bm!67533 () Bool)

(assert (=> bm!67533 (= call!67536 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434664 () Bool)

(declare-fun e!809716 () Bool)

(assert (=> b!1434664 (= e!809715 e!809716)))

(declare-fun lt!631566 () (_ BitVec 64))

(assert (=> b!1434664 (= lt!631566 (select (arr!47099 a!2831) j!81))))

(declare-fun lt!631565 () Unit!48502)

(assert (=> b!1434664 (= lt!631565 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631566 j!81))))

(assert (=> b!1434664 (arrayContainsKey!0 a!2831 lt!631566 #b00000000000000000000000000000000)))

(declare-fun lt!631567 () Unit!48502)

(assert (=> b!1434664 (= lt!631567 lt!631565)))

(declare-fun res!967982 () Bool)

(assert (=> b!1434664 (= res!967982 (= (seekEntryOrOpen!0 (select (arr!47099 a!2831) j!81) a!2831 mask!2608) (Found!11378 j!81)))))

(assert (=> b!1434664 (=> (not res!967982) (not e!809716))))

(declare-fun b!1434665 () Bool)

(assert (=> b!1434665 (= e!809716 call!67536)))

(assert (= (and d!154257 (not res!967981)) b!1434663))

(assert (= (and b!1434663 c!132842) b!1434664))

(assert (= (and b!1434663 (not c!132842)) b!1434662))

(assert (= (and b!1434664 res!967982) b!1434665))

(assert (= (or b!1434665 b!1434662) bm!67533))

(assert (=> b!1434663 m!1323951))

(assert (=> b!1434663 m!1323951))

(assert (=> b!1434663 m!1323971))

(declare-fun m!1324215 () Bool)

(assert (=> bm!67533 m!1324215))

(assert (=> b!1434664 m!1323951))

(declare-fun m!1324217 () Bool)

(assert (=> b!1434664 m!1324217))

(declare-fun m!1324219 () Bool)

(assert (=> b!1434664 m!1324219))

(assert (=> b!1434664 m!1323951))

(assert (=> b!1434664 m!1323965))

(assert (=> b!1434327 d!154257))

(declare-fun d!154259 () Bool)

(assert (=> d!154259 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631570 () Unit!48502)

(declare-fun choose!38 (array!97590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48502)

(assert (=> d!154259 (= lt!631570 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154259 (validMask!0 mask!2608)))

(assert (=> d!154259 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631570)))

(declare-fun bs!41767 () Bool)

(assert (= bs!41767 d!154259))

(assert (=> bs!41767 m!1323961))

(declare-fun m!1324221 () Bool)

(assert (=> bs!41767 m!1324221))

(assert (=> bs!41767 m!1323945))

(assert (=> b!1434327 d!154259))

(declare-fun d!154265 () Bool)

(assert (=> d!154265 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123732 d!154265))

(declare-fun d!154267 () Bool)

(assert (=> d!154267 (= (array_inv!36127 a!2831) (bvsge (size!47649 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123732 d!154267))

(declare-fun d!154269 () Bool)

(assert (=> d!154269 (= (validKeyInArray!0 (select (arr!47099 a!2831) i!982)) (and (not (= (select (arr!47099 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47099 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434338 d!154269))

(declare-fun b!1434666 () Bool)

(declare-fun e!809720 () SeekEntryResult!11378)

(assert (=> b!1434666 (= e!809720 (Intermediate!11378 false (toIndex!0 (select (arr!47099 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun e!809719 () SeekEntryResult!11378)

(declare-fun b!1434667 () Bool)

(assert (=> b!1434667 (= e!809719 (Intermediate!11378 true (toIndex!0 (select (arr!47099 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434668 () Bool)

(assert (=> b!1434668 (= e!809720 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47099 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47099 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434669 () Bool)

(declare-fun e!809721 () Bool)

(declare-fun e!809718 () Bool)

(assert (=> b!1434669 (= e!809721 e!809718)))

(declare-fun res!967984 () Bool)

(declare-fun lt!631571 () SeekEntryResult!11378)

(assert (=> b!1434669 (= res!967984 (and (is-Intermediate!11378 lt!631571) (not (undefined!12190 lt!631571)) (bvslt (x!129558 lt!631571) #b01111111111111111111111111111110) (bvsge (x!129558 lt!631571) #b00000000000000000000000000000000) (bvsge (x!129558 lt!631571) #b00000000000000000000000000000000)))))

(assert (=> b!1434669 (=> (not res!967984) (not e!809718))))

(declare-fun b!1434670 () Bool)

(assert (=> b!1434670 (and (bvsge (index!47906 lt!631571) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631571) (size!47649 a!2831)))))

(declare-fun res!967983 () Bool)

(assert (=> b!1434670 (= res!967983 (= (select (arr!47099 a!2831) (index!47906 lt!631571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809717 () Bool)

(assert (=> b!1434670 (=> res!967983 e!809717)))

(declare-fun b!1434671 () Bool)

(assert (=> b!1434671 (= e!809719 e!809720)))

(declare-fun lt!631572 () (_ BitVec 64))

(declare-fun c!132844 () Bool)

(assert (=> b!1434671 (= c!132844 (or (= lt!631572 (select (arr!47099 a!2831) j!81)) (= (bvadd lt!631572 lt!631572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434672 () Bool)

(assert (=> b!1434672 (= e!809721 (bvsge (x!129558 lt!631571) #b01111111111111111111111111111110))))

(declare-fun b!1434673 () Bool)

(assert (=> b!1434673 (and (bvsge (index!47906 lt!631571) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631571) (size!47649 a!2831)))))

(declare-fun res!967985 () Bool)

(assert (=> b!1434673 (= res!967985 (= (select (arr!47099 a!2831) (index!47906 lt!631571)) (select (arr!47099 a!2831) j!81)))))

(assert (=> b!1434673 (=> res!967985 e!809717)))

(assert (=> b!1434673 (= e!809718 e!809717)))

(declare-fun d!154271 () Bool)

(assert (=> d!154271 e!809721))

(declare-fun c!132845 () Bool)

(assert (=> d!154271 (= c!132845 (and (is-Intermediate!11378 lt!631571) (undefined!12190 lt!631571)))))

(assert (=> d!154271 (= lt!631571 e!809719)))

(declare-fun c!132843 () Bool)

(assert (=> d!154271 (= c!132843 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154271 (= lt!631572 (select (arr!47099 a!2831) (toIndex!0 (select (arr!47099 a!2831) j!81) mask!2608)))))

(assert (=> d!154271 (validMask!0 mask!2608)))

(assert (=> d!154271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47099 a!2831) j!81) mask!2608) (select (arr!47099 a!2831) j!81) a!2831 mask!2608) lt!631571)))

(declare-fun b!1434674 () Bool)

(assert (=> b!1434674 (and (bvsge (index!47906 lt!631571) #b00000000000000000000000000000000) (bvslt (index!47906 lt!631571) (size!47649 a!2831)))))

(assert (=> b!1434674 (= e!809717 (= (select (arr!47099 a!2831) (index!47906 lt!631571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154271 c!132843) b!1434667))

(assert (= (and d!154271 (not c!132843)) b!1434671))

(assert (= (and b!1434671 c!132844) b!1434666))

(assert (= (and b!1434671 (not c!132844)) b!1434668))

(assert (= (and d!154271 c!132845) b!1434672))

(assert (= (and d!154271 (not c!132845)) b!1434669))

(assert (= (and b!1434669 res!967984) b!1434673))

(assert (= (and b!1434673 (not res!967985)) b!1434670))

(assert (= (and b!1434670 (not res!967983)) b!1434674))

(declare-fun m!1324223 () Bool)

(assert (=> b!1434670 m!1324223))

(assert (=> b!1434673 m!1324223))

(assert (=> b!1434668 m!1323973))

(declare-fun m!1324225 () Bool)

(assert (=> b!1434668 m!1324225))

(assert (=> b!1434668 m!1324225))

(assert (=> b!1434668 m!1323951))

(declare-fun m!1324227 () Bool)

(assert (=> b!1434668 m!1324227))

(assert (=> d!154271 m!1323973))

(declare-fun m!1324229 () Bool)

(assert (=> d!154271 m!1324229))

(assert (=> d!154271 m!1323945))

(assert (=> b!1434674 m!1324223))

(assert (=> b!1434328 d!154271))

(declare-fun d!154273 () Bool)

(declare-fun lt!631574 () (_ BitVec 32))

(declare-fun lt!631573 () (_ BitVec 32))

(assert (=> d!154273 (= lt!631574 (bvmul (bvxor lt!631573 (bvlshr lt!631573 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154273 (= lt!631573 ((_ extract 31 0) (bvand (bvxor (select (arr!47099 a!2831) j!81) (bvlshr (select (arr!47099 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154273 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967949 (let ((h!34938 ((_ extract 31 0) (bvand (bvxor (select (arr!47099 a!2831) j!81) (bvlshr (select (arr!47099 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129567 (bvmul (bvxor h!34938 (bvlshr h!34938 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129567 (bvlshr x!129567 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967949 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967949 #b00000000000000000000000000000000))))))

(assert (=> d!154273 (= (toIndex!0 (select (arr!47099 a!2831) j!81) mask!2608) (bvand (bvxor lt!631574 (bvlshr lt!631574 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434328 d!154273))

(declare-fun b!1434760 () Bool)

(declare-fun e!809772 () SeekEntryResult!11378)

(declare-fun lt!631604 () SeekEntryResult!11378)

(assert (=> b!1434760 (= e!809772 (Found!11378 (index!47906 lt!631604)))))

(declare-fun b!1434761 () Bool)

(declare-fun e!809774 () SeekEntryResult!11378)

(assert (=> b!1434761 (= e!809774 e!809772)))

(declare-fun lt!631603 () (_ BitVec 64))

(assert (=> b!1434761 (= lt!631603 (select (arr!47099 a!2831) (index!47906 lt!631604)))))

(declare-fun c!132877 () Bool)

(assert (=> b!1434761 (= c!132877 (= lt!631603 (select (arr!47099 a!2831) j!81)))))

(declare-fun b!1434762 () Bool)

(declare-fun e!809773 () SeekEntryResult!11378)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97590 (_ BitVec 32)) SeekEntryResult!11378)

(assert (=> b!1434762 (= e!809773 (seekKeyOrZeroReturnVacant!0 (x!129558 lt!631604) (index!47906 lt!631604) (index!47906 lt!631604) (select (arr!47099 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!154275 () Bool)

(declare-fun lt!631605 () SeekEntryResult!11378)

(assert (=> d!154275 (and (or (is-Undefined!11378 lt!631605) (not (is-Found!11378 lt!631605)) (and (bvsge (index!47905 lt!631605) #b00000000000000000000000000000000) (bvslt (index!47905 lt!631605) (size!47649 a!2831)))) (or (is-Undefined!11378 lt!631605) (is-Found!11378 lt!631605) (not (is-MissingZero!11378 lt!631605)) (and (bvsge (index!47904 lt!631605) #b00000000000000000000000000000000) (bvslt (index!47904 lt!631605) (size!47649 a!2831)))) (or (is-Undefined!11378 lt!631605) (is-Found!11378 lt!631605) (is-MissingZero!11378 lt!631605) (not (is-MissingVacant!11378 lt!631605)) (and (bvsge (index!47907 lt!631605) #b00000000000000000000000000000000) (bvslt (index!47907 lt!631605) (size!47649 a!2831)))) (or (is-Undefined!11378 lt!631605) (ite (is-Found!11378 lt!631605) (= (select (arr!47099 a!2831) (index!47905 lt!631605)) (select (arr!47099 a!2831) j!81)) (ite (is-MissingZero!11378 lt!631605) (= (select (arr!47099 a!2831) (index!47904 lt!631605)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11378 lt!631605) (= (select (arr!47099 a!2831) (index!47907 lt!631605)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154275 (= lt!631605 e!809774)))

