; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122952 () Bool)

(assert start!122952)

(declare-fun e!805660 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97317 0))(
  ( (array!97318 (arr!46976 (Array (_ BitVec 32) (_ BitVec 64))) (size!47526 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97317)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1426309 () Bool)

(declare-datatypes ((SeekEntryResult!11255 0))(
  ( (MissingZero!11255 (index!47412 (_ BitVec 32))) (Found!11255 (index!47413 (_ BitVec 32))) (Intermediate!11255 (undefined!12067 Bool) (index!47414 (_ BitVec 32)) (x!129041 (_ BitVec 32))) (Undefined!11255) (MissingVacant!11255 (index!47415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97317 (_ BitVec 32)) SeekEntryResult!11255)

(assert (=> b!1426309 (= e!805660 (not (= (seekEntryOrOpen!0 (select (arr!46976 a!2831) j!81) a!2831 mask!2608) (Found!11255 j!81))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97317 (_ BitVec 32)) Bool)

(assert (=> b!1426309 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48256 0))(
  ( (Unit!48257) )
))
(declare-fun lt!628109 () Unit!48256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48256)

(assert (=> b!1426309 (= lt!628109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426310 () Bool)

(declare-fun res!961743 () Bool)

(declare-fun e!805659 () Bool)

(assert (=> b!1426310 (=> (not res!961743) (not e!805659))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426310 (= res!961743 (and (= (size!47526 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47526 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47526 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426311 () Bool)

(declare-fun res!961750 () Bool)

(assert (=> b!1426311 (=> (not res!961750) (not e!805660))))

(declare-fun lt!628108 () SeekEntryResult!11255)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97317 (_ BitVec 32)) SeekEntryResult!11255)

(assert (=> b!1426311 (= res!961750 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46976 a!2831) j!81) a!2831 mask!2608) lt!628108))))

(declare-fun b!1426312 () Bool)

(declare-fun res!961747 () Bool)

(assert (=> b!1426312 (=> (not res!961747) (not e!805659))))

(assert (=> b!1426312 (= res!961747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426313 () Bool)

(declare-fun e!805661 () Bool)

(assert (=> b!1426313 (= e!805659 e!805661)))

(declare-fun res!961745 () Bool)

(assert (=> b!1426313 (=> (not res!961745) (not e!805661))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426313 (= res!961745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46976 a!2831) j!81) mask!2608) (select (arr!46976 a!2831) j!81) a!2831 mask!2608) lt!628108))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426313 (= lt!628108 (Intermediate!11255 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426314 () Bool)

(declare-fun res!961753 () Bool)

(assert (=> b!1426314 (=> (not res!961753) (not e!805659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426314 (= res!961753 (validKeyInArray!0 (select (arr!46976 a!2831) j!81)))))

(declare-fun b!1426315 () Bool)

(declare-fun res!961744 () Bool)

(assert (=> b!1426315 (=> (not res!961744) (not e!805659))))

(assert (=> b!1426315 (= res!961744 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47526 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47526 a!2831))))))

(declare-fun b!1426316 () Bool)

(declare-fun res!961746 () Bool)

(assert (=> b!1426316 (=> (not res!961746) (not e!805660))))

(declare-fun lt!628106 () SeekEntryResult!11255)

(declare-fun lt!628110 () (_ BitVec 64))

(declare-fun lt!628107 () array!97317)

(assert (=> b!1426316 (= res!961746 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628110 lt!628107 mask!2608) lt!628106))))

(declare-fun b!1426317 () Bool)

(declare-fun res!961752 () Bool)

(assert (=> b!1426317 (=> (not res!961752) (not e!805659))))

(declare-datatypes ((List!33486 0))(
  ( (Nil!33483) (Cons!33482 (h!34784 (_ BitVec 64)) (t!48180 List!33486)) )
))
(declare-fun arrayNoDuplicates!0 (array!97317 (_ BitVec 32) List!33486) Bool)

(assert (=> b!1426317 (= res!961752 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33483))))

(declare-fun b!1426318 () Bool)

(declare-fun res!961749 () Bool)

(assert (=> b!1426318 (=> (not res!961749) (not e!805659))))

(assert (=> b!1426318 (= res!961749 (validKeyInArray!0 (select (arr!46976 a!2831) i!982)))))

(declare-fun res!961748 () Bool)

(assert (=> start!122952 (=> (not res!961748) (not e!805659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122952 (= res!961748 (validMask!0 mask!2608))))

(assert (=> start!122952 e!805659))

(assert (=> start!122952 true))

(declare-fun array_inv!36004 (array!97317) Bool)

(assert (=> start!122952 (array_inv!36004 a!2831)))

(declare-fun b!1426319 () Bool)

(assert (=> b!1426319 (= e!805661 e!805660)))

(declare-fun res!961742 () Bool)

(assert (=> b!1426319 (=> (not res!961742) (not e!805660))))

(assert (=> b!1426319 (= res!961742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628110 mask!2608) lt!628110 lt!628107 mask!2608) lt!628106))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426319 (= lt!628106 (Intermediate!11255 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426319 (= lt!628110 (select (store (arr!46976 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426319 (= lt!628107 (array!97318 (store (arr!46976 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47526 a!2831)))))

(declare-fun b!1426320 () Bool)

(declare-fun res!961751 () Bool)

(assert (=> b!1426320 (=> (not res!961751) (not e!805660))))

(assert (=> b!1426320 (= res!961751 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122952 res!961748) b!1426310))

(assert (= (and b!1426310 res!961743) b!1426318))

(assert (= (and b!1426318 res!961749) b!1426314))

(assert (= (and b!1426314 res!961753) b!1426312))

(assert (= (and b!1426312 res!961747) b!1426317))

(assert (= (and b!1426317 res!961752) b!1426315))

(assert (= (and b!1426315 res!961744) b!1426313))

(assert (= (and b!1426313 res!961745) b!1426319))

(assert (= (and b!1426319 res!961742) b!1426311))

(assert (= (and b!1426311 res!961750) b!1426316))

(assert (= (and b!1426316 res!961746) b!1426320))

(assert (= (and b!1426320 res!961751) b!1426309))

(declare-fun m!1316919 () Bool)

(assert (=> b!1426313 m!1316919))

(assert (=> b!1426313 m!1316919))

(declare-fun m!1316921 () Bool)

(assert (=> b!1426313 m!1316921))

(assert (=> b!1426313 m!1316921))

(assert (=> b!1426313 m!1316919))

(declare-fun m!1316923 () Bool)

(assert (=> b!1426313 m!1316923))

(declare-fun m!1316925 () Bool)

(assert (=> start!122952 m!1316925))

(declare-fun m!1316927 () Bool)

(assert (=> start!122952 m!1316927))

(declare-fun m!1316929 () Bool)

(assert (=> b!1426318 m!1316929))

(assert (=> b!1426318 m!1316929))

(declare-fun m!1316931 () Bool)

(assert (=> b!1426318 m!1316931))

(declare-fun m!1316933 () Bool)

(assert (=> b!1426317 m!1316933))

(assert (=> b!1426309 m!1316919))

(assert (=> b!1426309 m!1316919))

(declare-fun m!1316935 () Bool)

(assert (=> b!1426309 m!1316935))

(declare-fun m!1316937 () Bool)

(assert (=> b!1426309 m!1316937))

(declare-fun m!1316939 () Bool)

(assert (=> b!1426309 m!1316939))

(assert (=> b!1426311 m!1316919))

(assert (=> b!1426311 m!1316919))

(declare-fun m!1316941 () Bool)

(assert (=> b!1426311 m!1316941))

(declare-fun m!1316943 () Bool)

(assert (=> b!1426312 m!1316943))

(assert (=> b!1426314 m!1316919))

(assert (=> b!1426314 m!1316919))

(declare-fun m!1316945 () Bool)

(assert (=> b!1426314 m!1316945))

(declare-fun m!1316947 () Bool)

(assert (=> b!1426319 m!1316947))

(assert (=> b!1426319 m!1316947))

(declare-fun m!1316949 () Bool)

(assert (=> b!1426319 m!1316949))

(declare-fun m!1316951 () Bool)

(assert (=> b!1426319 m!1316951))

(declare-fun m!1316953 () Bool)

(assert (=> b!1426319 m!1316953))

(declare-fun m!1316955 () Bool)

(assert (=> b!1426316 m!1316955))

(push 1)

(assert (not start!122952))

(assert (not b!1426311))

(assert (not b!1426319))

(assert (not b!1426314))

(assert (not b!1426313))

(assert (not b!1426316))

(assert (not b!1426312))

(assert (not b!1426317))

(assert (not b!1426309))

(assert (not b!1426318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153177 () Bool)

(assert (=> d!153177 (= (validKeyInArray!0 (select (arr!46976 a!2831) i!982)) (and (not (= (select (arr!46976 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46976 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426318 d!153177))

(declare-fun d!153181 () Bool)

(assert (=> d!153181 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122952 d!153181))

(declare-fun d!153189 () Bool)

(assert (=> d!153189 (= (array_inv!36004 a!2831) (bvsge (size!47526 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122952 d!153189))

(declare-fun b!1426496 () Bool)

(declare-fun e!805756 () Bool)

(declare-fun call!67333 () Bool)

(assert (=> b!1426496 (= e!805756 call!67333)))

(declare-fun bm!67330 () Bool)

(declare-fun c!131799 () Bool)

(assert (=> bm!67330 (= call!67333 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131799 (Cons!33482 (select (arr!46976 a!2831) #b00000000000000000000000000000000) Nil!33483) Nil!33483)))))

(declare-fun b!1426497 () Bool)

(declare-fun e!805755 () Bool)

(declare-fun contains!9848 (List!33486 (_ BitVec 64)) Bool)

(assert (=> b!1426497 (= e!805755 (contains!9848 Nil!33483 (select (arr!46976 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1426498 () Bool)

(declare-fun e!805757 () Bool)

(assert (=> b!1426498 (= e!805757 e!805756)))

(assert (=> b!1426498 (= c!131799 (validKeyInArray!0 (select (arr!46976 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1426499 () Bool)

(assert (=> b!1426499 (= e!805756 call!67333)))

(declare-fun b!1426500 () Bool)

(declare-fun e!805754 () Bool)

(assert (=> b!1426500 (= e!805754 e!805757)))

(declare-fun res!961873 () Bool)

(assert (=> b!1426500 (=> (not res!961873) (not e!805757))))

(assert (=> b!1426500 (= res!961873 (not e!805755))))

(declare-fun res!961872 () Bool)

(assert (=> b!1426500 (=> (not res!961872) (not e!805755))))

(assert (=> b!1426500 (= res!961872 (validKeyInArray!0 (select (arr!46976 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153191 () Bool)

(declare-fun res!961874 () Bool)

(assert (=> d!153191 (=> res!961874 e!805754)))

(assert (=> d!153191 (= res!961874 (bvsge #b00000000000000000000000000000000 (size!47526 a!2831)))))

(assert (=> d!153191 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33483) e!805754)))

(assert (= (and d!153191 (not res!961874)) b!1426500))

(assert (= (and b!1426500 res!961872) b!1426497))

(assert (= (and b!1426500 res!961873) b!1426498))

(assert (= (and b!1426498 c!131799) b!1426499))

(assert (= (and b!1426498 (not c!131799)) b!1426496))

(assert (= (or b!1426499 b!1426496) bm!67330))

(declare-fun m!1317091 () Bool)

(assert (=> bm!67330 m!1317091))

(declare-fun m!1317093 () Bool)

(assert (=> bm!67330 m!1317093))

(assert (=> b!1426497 m!1317091))

(assert (=> b!1426497 m!1317091))

(declare-fun m!1317095 () Bool)

(assert (=> b!1426497 m!1317095))

(assert (=> b!1426498 m!1317091))

(assert (=> b!1426498 m!1317091))

(declare-fun m!1317097 () Bool)

(assert (=> b!1426498 m!1317097))

(assert (=> b!1426500 m!1317091))

(assert (=> b!1426500 m!1317091))

(assert (=> b!1426500 m!1317097))

(assert (=> b!1426317 d!153191))

(declare-fun b!1426509 () Bool)

(declare-fun e!805765 () Bool)

(declare-fun call!67336 () Bool)

(assert (=> b!1426509 (= e!805765 call!67336)))

(declare-fun b!1426510 () Bool)

(declare-fun e!805764 () Bool)

(assert (=> b!1426510 (= e!805765 e!805764)))

(declare-fun lt!628187 () (_ BitVec 64))

(assert (=> b!1426510 (= lt!628187 (select (arr!46976 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628185 () Unit!48256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97317 (_ BitVec 64) (_ BitVec 32)) Unit!48256)

(assert (=> b!1426510 (= lt!628185 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628187 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1426510 (arrayContainsKey!0 a!2831 lt!628187 #b00000000000000000000000000000000)))

(declare-fun lt!628186 () Unit!48256)

(assert (=> b!1426510 (= lt!628186 lt!628185)))

(declare-fun res!961880 () Bool)

(assert (=> b!1426510 (= res!961880 (= (seekEntryOrOpen!0 (select (arr!46976 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11255 #b00000000000000000000000000000000)))))

(assert (=> b!1426510 (=> (not res!961880) (not e!805764))))

(declare-fun b!1426511 () Bool)

(declare-fun e!805766 () Bool)

(assert (=> b!1426511 (= e!805766 e!805765)))

(declare-fun c!131802 () Bool)

(assert (=> b!1426511 (= c!131802 (validKeyInArray!0 (select (arr!46976 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153207 () Bool)

(declare-fun res!961879 () Bool)

(assert (=> d!153207 (=> res!961879 e!805766)))

(assert (=> d!153207 (= res!961879 (bvsge #b00000000000000000000000000000000 (size!47526 a!2831)))))

(assert (=> d!153207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!805766)))

(declare-fun bm!67333 () Bool)

(assert (=> bm!67333 (= call!67336 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1426512 () Bool)

(assert (=> b!1426512 (= e!805764 call!67336)))

(assert (= (and d!153207 (not res!961879)) b!1426511))

(assert (= (and b!1426511 c!131802) b!1426510))

(assert (= (and b!1426511 (not c!131802)) b!1426509))

(assert (= (and b!1426510 res!961880) b!1426512))

(assert (= (or b!1426512 b!1426509) bm!67333))

(assert (=> b!1426510 m!1317091))

(declare-fun m!1317099 () Bool)

(assert (=> b!1426510 m!1317099))

(declare-fun m!1317101 () Bool)

(assert (=> b!1426510 m!1317101))

(assert (=> b!1426510 m!1317091))

(declare-fun m!1317103 () Bool)

(assert (=> b!1426510 m!1317103))

(assert (=> b!1426511 m!1317091))

(assert (=> b!1426511 m!1317091))

(assert (=> b!1426511 m!1317097))

(declare-fun m!1317105 () Bool)

(assert (=> bm!67333 m!1317105))

(assert (=> b!1426312 d!153207))

(declare-fun b!1426598 () Bool)

(declare-fun e!805814 () SeekEntryResult!11255)

(declare-fun e!805815 () SeekEntryResult!11255)

(assert (=> b!1426598 (= e!805814 e!805815)))

(declare-fun lt!628220 () (_ BitVec 64))

(declare-fun c!131834 () Bool)

(assert (=> b!1426598 (= c!131834 (or (= lt!628220 (select (arr!46976 a!2831) j!81)) (= (bvadd lt!628220 lt!628220) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426600 () Bool)

(assert (=> b!1426600 (= e!805815 (Intermediate!11255 false index!585 x!605))))

(declare-fun b!1426601 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426601 (= e!805815 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46976 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426602 () Bool)

(declare-fun lt!628221 () SeekEntryResult!11255)

(assert (=> b!1426602 (and (bvsge (index!47414 lt!628221) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628221) (size!47526 a!2831)))))

(declare-fun res!961906 () Bool)

(assert (=> b!1426602 (= res!961906 (= (select (arr!46976 a!2831) (index!47414 lt!628221)) (select (arr!46976 a!2831) j!81)))))

(declare-fun e!805817 () Bool)

(assert (=> b!1426602 (=> res!961906 e!805817)))

(declare-fun e!805818 () Bool)

(assert (=> b!1426602 (= e!805818 e!805817)))

(declare-fun b!1426603 () Bool)

(declare-fun e!805816 () Bool)

(assert (=> b!1426603 (= e!805816 e!805818)))

(declare-fun res!961905 () Bool)

(assert (=> b!1426603 (= res!961905 (and (is-Intermediate!11255 lt!628221) (not (undefined!12067 lt!628221)) (bvslt (x!129041 lt!628221) #b01111111111111111111111111111110) (bvsge (x!129041 lt!628221) #b00000000000000000000000000000000) (bvsge (x!129041 lt!628221) x!605)))))

(assert (=> b!1426603 (=> (not res!961905) (not e!805818))))

(declare-fun b!1426604 () Bool)

(assert (=> b!1426604 (and (bvsge (index!47414 lt!628221) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628221) (size!47526 a!2831)))))

(assert (=> b!1426604 (= e!805817 (= (select (arr!46976 a!2831) (index!47414 lt!628221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153217 () Bool)

(assert (=> d!153217 e!805816))

(declare-fun c!131835 () Bool)

(assert (=> d!153217 (= c!131835 (and (is-Intermediate!11255 lt!628221) (undefined!12067 lt!628221)))))

(assert (=> d!153217 (= lt!628221 e!805814)))

(declare-fun c!131836 () Bool)

(assert (=> d!153217 (= c!131836 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153217 (= lt!628220 (select (arr!46976 a!2831) index!585))))

(assert (=> d!153217 (validMask!0 mask!2608)))

(assert (=> d!153217 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46976 a!2831) j!81) a!2831 mask!2608) lt!628221)))

(declare-fun b!1426599 () Bool)

(assert (=> b!1426599 (= e!805814 (Intermediate!11255 true index!585 x!605))))

(declare-fun b!1426605 () Bool)

(assert (=> b!1426605 (= e!805816 (bvsge (x!129041 lt!628221) #b01111111111111111111111111111110))))

(declare-fun b!1426606 () Bool)

(assert (=> b!1426606 (and (bvsge (index!47414 lt!628221) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628221) (size!47526 a!2831)))))

(declare-fun res!961907 () Bool)

(assert (=> b!1426606 (= res!961907 (= (select (arr!46976 a!2831) (index!47414 lt!628221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1426606 (=> res!961907 e!805817)))

(assert (= (and d!153217 c!131836) b!1426599))

(assert (= (and d!153217 (not c!131836)) b!1426598))

(assert (= (and b!1426598 c!131834) b!1426600))

(assert (= (and b!1426598 (not c!131834)) b!1426601))

(assert (= (and d!153217 c!131835) b!1426605))

(assert (= (and d!153217 (not c!131835)) b!1426603))

(assert (= (and b!1426603 res!961905) b!1426602))

(assert (= (and b!1426602 (not res!961906)) b!1426606))

(assert (= (and b!1426606 (not res!961907)) b!1426604))

(declare-fun m!1317145 () Bool)

(assert (=> b!1426606 m!1317145))

(assert (=> b!1426602 m!1317145))

(declare-fun m!1317147 () Bool)

(assert (=> b!1426601 m!1317147))

(assert (=> b!1426601 m!1317147))

(assert (=> b!1426601 m!1316919))

(declare-fun m!1317149 () Bool)

(assert (=> b!1426601 m!1317149))

(declare-fun m!1317151 () Bool)

(assert (=> d!153217 m!1317151))

(assert (=> d!153217 m!1316925))

(assert (=> b!1426604 m!1317145))

(assert (=> b!1426311 d!153217))

(declare-fun b!1426607 () Bool)

(declare-fun e!805819 () SeekEntryResult!11255)

(declare-fun e!805820 () SeekEntryResult!11255)

(assert (=> b!1426607 (= e!805819 e!805820)))

(declare-fun c!131837 () Bool)

(declare-fun lt!628222 () (_ BitVec 64))

(assert (=> b!1426607 (= c!131837 (or (= lt!628222 lt!628110) (= (bvadd lt!628222 lt!628222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426609 () Bool)

(assert (=> b!1426609 (= e!805820 (Intermediate!11255 false index!585 x!605))))

(declare-fun b!1426610 () Bool)

(assert (=> b!1426610 (= e!805820 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628110 lt!628107 mask!2608))))

(declare-fun b!1426611 () Bool)

(declare-fun lt!628223 () SeekEntryResult!11255)

(assert (=> b!1426611 (and (bvsge (index!47414 lt!628223) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628223) (size!47526 lt!628107)))))

(declare-fun res!961909 () Bool)

(assert (=> b!1426611 (= res!961909 (= (select (arr!46976 lt!628107) (index!47414 lt!628223)) lt!628110))))

(declare-fun e!805822 () Bool)

(assert (=> b!1426611 (=> res!961909 e!805822)))

(declare-fun e!805823 () Bool)

(assert (=> b!1426611 (= e!805823 e!805822)))

(declare-fun b!1426612 () Bool)

(declare-fun e!805821 () Bool)

(assert (=> b!1426612 (= e!805821 e!805823)))

(declare-fun res!961908 () Bool)

(assert (=> b!1426612 (= res!961908 (and (is-Intermediate!11255 lt!628223) (not (undefined!12067 lt!628223)) (bvslt (x!129041 lt!628223) #b01111111111111111111111111111110) (bvsge (x!129041 lt!628223) #b00000000000000000000000000000000) (bvsge (x!129041 lt!628223) x!605)))))

(assert (=> b!1426612 (=> (not res!961908) (not e!805823))))

(declare-fun b!1426613 () Bool)

(assert (=> b!1426613 (and (bvsge (index!47414 lt!628223) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628223) (size!47526 lt!628107)))))

(assert (=> b!1426613 (= e!805822 (= (select (arr!46976 lt!628107) (index!47414 lt!628223)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153231 () Bool)

(assert (=> d!153231 e!805821))

(declare-fun c!131838 () Bool)

(assert (=> d!153231 (= c!131838 (and (is-Intermediate!11255 lt!628223) (undefined!12067 lt!628223)))))

(assert (=> d!153231 (= lt!628223 e!805819)))

(declare-fun c!131839 () Bool)

(assert (=> d!153231 (= c!131839 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153231 (= lt!628222 (select (arr!46976 lt!628107) index!585))))

(assert (=> d!153231 (validMask!0 mask!2608)))

(assert (=> d!153231 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628110 lt!628107 mask!2608) lt!628223)))

(declare-fun b!1426608 () Bool)

(assert (=> b!1426608 (= e!805819 (Intermediate!11255 true index!585 x!605))))

(declare-fun b!1426614 () Bool)

(assert (=> b!1426614 (= e!805821 (bvsge (x!129041 lt!628223) #b01111111111111111111111111111110))))

(declare-fun b!1426615 () Bool)

(assert (=> b!1426615 (and (bvsge (index!47414 lt!628223) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628223) (size!47526 lt!628107)))))

(declare-fun res!961910 () Bool)

(assert (=> b!1426615 (= res!961910 (= (select (arr!46976 lt!628107) (index!47414 lt!628223)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1426615 (=> res!961910 e!805822)))

(assert (= (and d!153231 c!131839) b!1426608))

(assert (= (and d!153231 (not c!131839)) b!1426607))

(assert (= (and b!1426607 c!131837) b!1426609))

(assert (= (and b!1426607 (not c!131837)) b!1426610))

(assert (= (and d!153231 c!131838) b!1426614))

(assert (= (and d!153231 (not c!131838)) b!1426612))

(assert (= (and b!1426612 res!961908) b!1426611))

(assert (= (and b!1426611 (not res!961909)) b!1426615))

(assert (= (and b!1426615 (not res!961910)) b!1426613))

(declare-fun m!1317153 () Bool)

(assert (=> b!1426615 m!1317153))

(assert (=> b!1426611 m!1317153))

(assert (=> b!1426610 m!1317147))

(assert (=> b!1426610 m!1317147))

(declare-fun m!1317155 () Bool)

(assert (=> b!1426610 m!1317155))

(declare-fun m!1317157 () Bool)

(assert (=> d!153231 m!1317157))

(assert (=> d!153231 m!1316925))

(assert (=> b!1426613 m!1317153))

(assert (=> b!1426316 d!153231))

(declare-fun e!805849 () SeekEntryResult!11255)

(declare-fun lt!628254 () SeekEntryResult!11255)

(declare-fun b!1426659 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97317 (_ BitVec 32)) SeekEntryResult!11255)

(assert (=> b!1426659 (= e!805849 (seekKeyOrZeroReturnVacant!0 (x!129041 lt!628254) (index!47414 lt!628254) (index!47414 lt!628254) (select (arr!46976 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426660 () Bool)

(declare-fun e!805848 () SeekEntryResult!11255)

(declare-fun e!805847 () SeekEntryResult!11255)

(assert (=> b!1426660 (= e!805848 e!805847)))

(declare-fun lt!628252 () (_ BitVec 64))

(assert (=> b!1426660 (= lt!628252 (select (arr!46976 a!2831) (index!47414 lt!628254)))))

(declare-fun c!131861 () Bool)

(assert (=> b!1426660 (= c!131861 (= lt!628252 (select (arr!46976 a!2831) j!81)))))

(declare-fun b!1426661 () Bool)

(assert (=> b!1426661 (= e!805848 Undefined!11255)))

(declare-fun b!1426662 () Bool)

(declare-fun c!131859 () Bool)

(assert (=> b!1426662 (= c!131859 (= lt!628252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1426662 (= e!805847 e!805849)))

(declare-fun d!153233 () Bool)

(declare-fun lt!628253 () SeekEntryResult!11255)

(assert (=> d!153233 (and (or (is-Undefined!11255 lt!628253) (not (is-Found!11255 lt!628253)) (and (bvsge (index!47413 lt!628253) #b00000000000000000000000000000000) (bvslt (index!47413 lt!628253) (size!47526 a!2831)))) (or (is-Undefined!11255 lt!628253) (is-Found!11255 lt!628253) (not (is-MissingZero!11255 lt!628253)) (and (bvsge (index!47412 lt!628253) #b00000000000000000000000000000000) (bvslt (index!47412 lt!628253) (size!47526 a!2831)))) (or (is-Undefined!11255 lt!628253) (is-Found!11255 lt!628253) (is-MissingZero!11255 lt!628253) (not (is-MissingVacant!11255 lt!628253)) (and (bvsge (index!47415 lt!628253) #b00000000000000000000000000000000) (bvslt (index!47415 lt!628253) (size!47526 a!2831)))) (or (is-Undefined!11255 lt!628253) (ite (is-Found!11255 lt!628253) (= (select (arr!46976 a!2831) (index!47413 lt!628253)) (select (arr!46976 a!2831) j!81)) (ite (is-MissingZero!11255 lt!628253) (= (select (arr!46976 a!2831) (index!47412 lt!628253)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11255 lt!628253) (= (select (arr!46976 a!2831) (index!47415 lt!628253)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153233 (= lt!628253 e!805848)))

(declare-fun c!131860 () Bool)

(assert (=> d!153233 (= c!131860 (and (is-Intermediate!11255 lt!628254) (undefined!12067 lt!628254)))))

(assert (=> d!153233 (= lt!628254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46976 a!2831) j!81) mask!2608) (select (arr!46976 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153233 (validMask!0 mask!2608)))

(assert (=> d!153233 (= (seekEntryOrOpen!0 (select (arr!46976 a!2831) j!81) a!2831 mask!2608) lt!628253)))

(declare-fun b!1426663 () Bool)

(assert (=> b!1426663 (= e!805849 (MissingZero!11255 (index!47414 lt!628254)))))

(declare-fun b!1426664 () Bool)

(assert (=> b!1426664 (= e!805847 (Found!11255 (index!47414 lt!628254)))))

(assert (= (and d!153233 c!131860) b!1426661))

(assert (= (and d!153233 (not c!131860)) b!1426660))

(assert (= (and b!1426660 c!131861) b!1426664))

(assert (= (and b!1426660 (not c!131861)) b!1426662))

(assert (= (and b!1426662 c!131859) b!1426663))

(assert (= (and b!1426662 (not c!131859)) b!1426659))

(assert (=> b!1426659 m!1316919))

(declare-fun m!1317187 () Bool)

(assert (=> b!1426659 m!1317187))

(declare-fun m!1317189 () Bool)

(assert (=> b!1426660 m!1317189))

(assert (=> d!153233 m!1316919))

(assert (=> d!153233 m!1316921))

(declare-fun m!1317191 () Bool)

(assert (=> d!153233 m!1317191))

(declare-fun m!1317193 () Bool)

(assert (=> d!153233 m!1317193))

(declare-fun m!1317195 () Bool)

(assert (=> d!153233 m!1317195))

(assert (=> d!153233 m!1316925))

(assert (=> d!153233 m!1316921))

(assert (=> d!153233 m!1316919))

(assert (=> d!153233 m!1316923))

(assert (=> b!1426309 d!153233))

(declare-fun b!1426665 () Bool)

(declare-fun e!805851 () Bool)

(declare-fun call!67339 () Bool)

(assert (=> b!1426665 (= e!805851 call!67339)))

(declare-fun b!1426666 () Bool)

(declare-fun e!805850 () Bool)

(assert (=> b!1426666 (= e!805851 e!805850)))

(declare-fun lt!628257 () (_ BitVec 64))

(assert (=> b!1426666 (= lt!628257 (select (arr!46976 a!2831) j!81))))

(declare-fun lt!628255 () Unit!48256)

(assert (=> b!1426666 (= lt!628255 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628257 j!81))))

(assert (=> b!1426666 (arrayContainsKey!0 a!2831 lt!628257 #b00000000000000000000000000000000)))

(declare-fun lt!628256 () Unit!48256)

(assert (=> b!1426666 (= lt!628256 lt!628255)))

(declare-fun res!961917 () Bool)

(assert (=> b!1426666 (= res!961917 (= (seekEntryOrOpen!0 (select (arr!46976 a!2831) j!81) a!2831 mask!2608) (Found!11255 j!81)))))

(assert (=> b!1426666 (=> (not res!961917) (not e!805850))))

(declare-fun b!1426667 () Bool)

(declare-fun e!805852 () Bool)

(assert (=> b!1426667 (= e!805852 e!805851)))

(declare-fun c!131862 () Bool)

(assert (=> b!1426667 (= c!131862 (validKeyInArray!0 (select (arr!46976 a!2831) j!81)))))

(declare-fun d!153247 () Bool)

(declare-fun res!961916 () Bool)

(assert (=> d!153247 (=> res!961916 e!805852)))

(assert (=> d!153247 (= res!961916 (bvsge j!81 (size!47526 a!2831)))))

(assert (=> d!153247 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!805852)))

(declare-fun bm!67336 () Bool)

(assert (=> bm!67336 (= call!67339 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1426668 () Bool)

(assert (=> b!1426668 (= e!805850 call!67339)))

(assert (= (and d!153247 (not res!961916)) b!1426667))

(assert (= (and b!1426667 c!131862) b!1426666))

(assert (= (and b!1426667 (not c!131862)) b!1426665))

(assert (= (and b!1426666 res!961917) b!1426668))

(assert (= (or b!1426668 b!1426665) bm!67336))

(assert (=> b!1426666 m!1316919))

(declare-fun m!1317197 () Bool)

(assert (=> b!1426666 m!1317197))

(declare-fun m!1317199 () Bool)

(assert (=> b!1426666 m!1317199))

(assert (=> b!1426666 m!1316919))

(assert (=> b!1426666 m!1316935))

(assert (=> b!1426667 m!1316919))

(assert (=> b!1426667 m!1316919))

(assert (=> b!1426667 m!1316945))

(declare-fun m!1317201 () Bool)

(assert (=> bm!67336 m!1317201))

(assert (=> b!1426309 d!153247))

(declare-fun d!153249 () Bool)

(assert (=> d!153249 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628260 () Unit!48256)

(declare-fun choose!38 (array!97317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48256)

(assert (=> d!153249 (= lt!628260 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153249 (validMask!0 mask!2608)))

(assert (=> d!153249 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628260)))

(declare-fun bs!41590 () Bool)

(assert (= bs!41590 d!153249))

(assert (=> bs!41590 m!1316937))

(declare-fun m!1317205 () Bool)

(assert (=> bs!41590 m!1317205))

(assert (=> bs!41590 m!1316925))

(assert (=> b!1426309 d!153249))

(declare-fun b!1426684 () Bool)

(declare-fun e!805865 () SeekEntryResult!11255)

(declare-fun e!805866 () SeekEntryResult!11255)

(assert (=> b!1426684 (= e!805865 e!805866)))

(declare-fun c!131866 () Bool)

(declare-fun lt!628261 () (_ BitVec 64))

(assert (=> b!1426684 (= c!131866 (or (= lt!628261 lt!628110) (= (bvadd lt!628261 lt!628261) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426686 () Bool)

(assert (=> b!1426686 (= e!805866 (Intermediate!11255 false (toIndex!0 lt!628110 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426687 () Bool)

(assert (=> b!1426687 (= e!805866 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628110 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628110 lt!628107 mask!2608))))

(declare-fun b!1426688 () Bool)

(declare-fun lt!628262 () SeekEntryResult!11255)

(assert (=> b!1426688 (and (bvsge (index!47414 lt!628262) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628262) (size!47526 lt!628107)))))

(declare-fun res!961928 () Bool)

(assert (=> b!1426688 (= res!961928 (= (select (arr!46976 lt!628107) (index!47414 lt!628262)) lt!628110))))

(declare-fun e!805868 () Bool)

(assert (=> b!1426688 (=> res!961928 e!805868)))

(declare-fun e!805869 () Bool)

(assert (=> b!1426688 (= e!805869 e!805868)))

(declare-fun b!1426689 () Bool)

(declare-fun e!805867 () Bool)

(assert (=> b!1426689 (= e!805867 e!805869)))

(declare-fun res!961927 () Bool)

(assert (=> b!1426689 (= res!961927 (and (is-Intermediate!11255 lt!628262) (not (undefined!12067 lt!628262)) (bvslt (x!129041 lt!628262) #b01111111111111111111111111111110) (bvsge (x!129041 lt!628262) #b00000000000000000000000000000000) (bvsge (x!129041 lt!628262) #b00000000000000000000000000000000)))))

(assert (=> b!1426689 (=> (not res!961927) (not e!805869))))

(declare-fun b!1426690 () Bool)

(assert (=> b!1426690 (and (bvsge (index!47414 lt!628262) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628262) (size!47526 lt!628107)))))

(assert (=> b!1426690 (= e!805868 (= (select (arr!46976 lt!628107) (index!47414 lt!628262)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!153251 () Bool)

(assert (=> d!153251 e!805867))

(declare-fun c!131867 () Bool)

(assert (=> d!153251 (= c!131867 (and (is-Intermediate!11255 lt!628262) (undefined!12067 lt!628262)))))

(assert (=> d!153251 (= lt!628262 e!805865)))

(declare-fun c!131868 () Bool)

(assert (=> d!153251 (= c!131868 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153251 (= lt!628261 (select (arr!46976 lt!628107) (toIndex!0 lt!628110 mask!2608)))))

(assert (=> d!153251 (validMask!0 mask!2608)))

(assert (=> d!153251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628110 mask!2608) lt!628110 lt!628107 mask!2608) lt!628262)))

(declare-fun b!1426685 () Bool)

(assert (=> b!1426685 (= e!805865 (Intermediate!11255 true (toIndex!0 lt!628110 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426691 () Bool)

(assert (=> b!1426691 (= e!805867 (bvsge (x!129041 lt!628262) #b01111111111111111111111111111110))))

(declare-fun b!1426692 () Bool)

(assert (=> b!1426692 (and (bvsge (index!47414 lt!628262) #b00000000000000000000000000000000) (bvslt (index!47414 lt!628262) (size!47526 lt!628107)))))

(declare-fun res!961929 () Bool)

(assert (=> b!1426692 (= res!961929 (= (select (arr!46976 lt!628107) (index!47414 lt!628262)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1426692 (=> res!961929 e!805868)))

(assert (= (and d!153251 c!131868) b!1426685))

(assert (= (and d!153251 (not c!131868)) b!1426684))

(assert (= (and b!1426684 c!131866) b!1426686))

(assert (= (and b!1426684 (not c!131866)) b!1426687))

(assert (= (and d!153251 c!131867) b!1426691))

(assert (= (and d!153251 (not c!131867)) b!1426689))

(assert (= (and b!1426689 res!961927) b!1426688))

(assert (= (and b!1426688 (not res!961928)) b!1426692))

(assert (= (and b!1426692 (not res!961929)) b!1426690))

(declare-fun m!1317209 () Bool)

(assert (=> b!1426692 m!1317209))

(assert (=> b!1426688 m!1317209))

(assert (=> b!1426687 m!1316947))

(declare-fun m!1317211 () Bool)

(assert (=> b!1426687 m!1317211))

(assert (=> b!1426687 m!1317211))

(declare-fun m!1317213 () Bool)

(assert (=> b!1426687 m!1317213))

(assert (=> d!153251 m!1316947))

(declare-fun m!1317215 () Bool)

(assert (=> d!153251 m!1317215))

(assert (=> d!153251 m!1316925))

(assert (=> b!1426690 m!1317209))

(assert (=> b!1426319 d!153251))

(declare-fun d!153253 () Bool)

(declare-fun lt!628268 () (_ BitVec 32))

(declare-fun lt!628267 () (_ BitVec 32))

