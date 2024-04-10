; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123022 () Bool)

(assert start!123022)

(declare-fun b!1426923 () Bool)

(declare-fun res!962165 () Bool)

(declare-fun e!805963 () Bool)

(assert (=> b!1426923 (=> (not res!962165) (not e!805963))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97336 0))(
  ( (array!97337 (arr!46984 (Array (_ BitVec 32) (_ BitVec 64))) (size!47534 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97336)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426923 (= res!962165 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47534 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47534 a!2831))))))

(declare-fun b!1426924 () Bool)

(declare-fun res!962158 () Bool)

(assert (=> b!1426924 (=> (not res!962158) (not e!805963))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97336 (_ BitVec 32)) Bool)

(assert (=> b!1426924 (= res!962158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426925 () Bool)

(declare-fun res!962155 () Bool)

(declare-fun e!805961 () Bool)

(assert (=> b!1426925 (=> (not res!962155) (not e!805961))))

(declare-datatypes ((SeekEntryResult!11263 0))(
  ( (MissingZero!11263 (index!47444 (_ BitVec 32))) (Found!11263 (index!47445 (_ BitVec 32))) (Intermediate!11263 (undefined!12075 Bool) (index!47446 (_ BitVec 32)) (x!129071 (_ BitVec 32))) (Undefined!11263) (MissingVacant!11263 (index!47447 (_ BitVec 32))) )
))
(declare-fun lt!628358 () SeekEntryResult!11263)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97336 (_ BitVec 32)) SeekEntryResult!11263)

(assert (=> b!1426925 (= res!962155 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46984 a!2831) j!81) a!2831 mask!2608) lt!628358))))

(declare-fun b!1426926 () Bool)

(assert (=> b!1426926 (= e!805961 (not (not (= (select (arr!46984 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!805960 () Bool)

(assert (=> b!1426926 e!805960))

(declare-fun res!962159 () Bool)

(assert (=> b!1426926 (=> (not res!962159) (not e!805960))))

(assert (=> b!1426926 (= res!962159 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48272 0))(
  ( (Unit!48273) )
))
(declare-fun lt!628359 () Unit!48272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48272)

(assert (=> b!1426926 (= lt!628359 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426927 () Bool)

(declare-fun e!805962 () Bool)

(assert (=> b!1426927 (= e!805963 e!805962)))

(declare-fun res!962166 () Bool)

(assert (=> b!1426927 (=> (not res!962166) (not e!805962))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426927 (= res!962166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) (select (arr!46984 a!2831) j!81) a!2831 mask!2608) lt!628358))))

(assert (=> b!1426927 (= lt!628358 (Intermediate!11263 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426928 () Bool)

(declare-fun res!962157 () Bool)

(assert (=> b!1426928 (=> (not res!962157) (not e!805963))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426928 (= res!962157 (and (= (size!47534 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47534 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47534 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426929 () Bool)

(declare-fun res!962167 () Bool)

(assert (=> b!1426929 (=> (not res!962167) (not e!805961))))

(declare-fun lt!628360 () SeekEntryResult!11263)

(declare-fun lt!628362 () (_ BitVec 64))

(declare-fun lt!628361 () array!97336)

(assert (=> b!1426929 (= res!962167 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628362 lt!628361 mask!2608) lt!628360))))

(declare-fun b!1426930 () Bool)

(declare-fun res!962160 () Bool)

(assert (=> b!1426930 (=> (not res!962160) (not e!805961))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426930 (= res!962160 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426931 () Bool)

(declare-fun res!962163 () Bool)

(assert (=> b!1426931 (=> (not res!962163) (not e!805963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426931 (= res!962163 (validKeyInArray!0 (select (arr!46984 a!2831) i!982)))))

(declare-fun b!1426932 () Bool)

(assert (=> b!1426932 (= e!805962 e!805961)))

(declare-fun res!962161 () Bool)

(assert (=> b!1426932 (=> (not res!962161) (not e!805961))))

(assert (=> b!1426932 (= res!962161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628362 mask!2608) lt!628362 lt!628361 mask!2608) lt!628360))))

(assert (=> b!1426932 (= lt!628360 (Intermediate!11263 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426932 (= lt!628362 (select (store (arr!46984 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426932 (= lt!628361 (array!97337 (store (arr!46984 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47534 a!2831)))))

(declare-fun b!1426933 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97336 (_ BitVec 32)) SeekEntryResult!11263)

(assert (=> b!1426933 (= e!805960 (= (seekEntryOrOpen!0 (select (arr!46984 a!2831) j!81) a!2831 mask!2608) (Found!11263 j!81)))))

(declare-fun res!962164 () Bool)

(assert (=> start!123022 (=> (not res!962164) (not e!805963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123022 (= res!962164 (validMask!0 mask!2608))))

(assert (=> start!123022 e!805963))

(assert (=> start!123022 true))

(declare-fun array_inv!36012 (array!97336) Bool)

(assert (=> start!123022 (array_inv!36012 a!2831)))

(declare-fun b!1426934 () Bool)

(declare-fun res!962156 () Bool)

(assert (=> b!1426934 (=> (not res!962156) (not e!805963))))

(assert (=> b!1426934 (= res!962156 (validKeyInArray!0 (select (arr!46984 a!2831) j!81)))))

(declare-fun b!1426935 () Bool)

(declare-fun res!962162 () Bool)

(assert (=> b!1426935 (=> (not res!962162) (not e!805963))))

(declare-datatypes ((List!33494 0))(
  ( (Nil!33491) (Cons!33490 (h!34795 (_ BitVec 64)) (t!48188 List!33494)) )
))
(declare-fun arrayNoDuplicates!0 (array!97336 (_ BitVec 32) List!33494) Bool)

(assert (=> b!1426935 (= res!962162 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33491))))

(assert (= (and start!123022 res!962164) b!1426928))

(assert (= (and b!1426928 res!962157) b!1426931))

(assert (= (and b!1426931 res!962163) b!1426934))

(assert (= (and b!1426934 res!962156) b!1426924))

(assert (= (and b!1426924 res!962158) b!1426935))

(assert (= (and b!1426935 res!962162) b!1426923))

(assert (= (and b!1426923 res!962165) b!1426927))

(assert (= (and b!1426927 res!962166) b!1426932))

(assert (= (and b!1426932 res!962161) b!1426925))

(assert (= (and b!1426925 res!962155) b!1426929))

(assert (= (and b!1426929 res!962167) b!1426930))

(assert (= (and b!1426930 res!962160) b!1426926))

(assert (= (and b!1426926 res!962159) b!1426933))

(declare-fun m!1317419 () Bool)

(assert (=> b!1426935 m!1317419))

(declare-fun m!1317421 () Bool)

(assert (=> b!1426932 m!1317421))

(assert (=> b!1426932 m!1317421))

(declare-fun m!1317423 () Bool)

(assert (=> b!1426932 m!1317423))

(declare-fun m!1317425 () Bool)

(assert (=> b!1426932 m!1317425))

(declare-fun m!1317427 () Bool)

(assert (=> b!1426932 m!1317427))

(declare-fun m!1317429 () Bool)

(assert (=> b!1426925 m!1317429))

(assert (=> b!1426925 m!1317429))

(declare-fun m!1317431 () Bool)

(assert (=> b!1426925 m!1317431))

(assert (=> b!1426934 m!1317429))

(assert (=> b!1426934 m!1317429))

(declare-fun m!1317433 () Bool)

(assert (=> b!1426934 m!1317433))

(assert (=> b!1426933 m!1317429))

(assert (=> b!1426933 m!1317429))

(declare-fun m!1317435 () Bool)

(assert (=> b!1426933 m!1317435))

(declare-fun m!1317437 () Bool)

(assert (=> b!1426929 m!1317437))

(declare-fun m!1317439 () Bool)

(assert (=> b!1426924 m!1317439))

(declare-fun m!1317441 () Bool)

(assert (=> start!123022 m!1317441))

(declare-fun m!1317443 () Bool)

(assert (=> start!123022 m!1317443))

(declare-fun m!1317445 () Bool)

(assert (=> b!1426931 m!1317445))

(assert (=> b!1426931 m!1317445))

(declare-fun m!1317447 () Bool)

(assert (=> b!1426931 m!1317447))

(assert (=> b!1426927 m!1317429))

(assert (=> b!1426927 m!1317429))

(declare-fun m!1317449 () Bool)

(assert (=> b!1426927 m!1317449))

(assert (=> b!1426927 m!1317449))

(assert (=> b!1426927 m!1317429))

(declare-fun m!1317451 () Bool)

(assert (=> b!1426927 m!1317451))

(declare-fun m!1317453 () Bool)

(assert (=> b!1426926 m!1317453))

(declare-fun m!1317455 () Bool)

(assert (=> b!1426926 m!1317455))

(declare-fun m!1317457 () Bool)

(assert (=> b!1426926 m!1317457))

(push 1)

(assert (not start!123022))

(assert (not b!1426924))

(assert (not b!1426935))

(assert (not b!1426927))

(assert (not b!1426929))

(assert (not b!1426933))

(assert (not b!1426931))

(assert (not b!1426926))

(assert (not b!1426934))

(assert (not b!1426932))

(assert (not b!1426925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153289 () Bool)

(assert (=> d!153289 (= (validKeyInArray!0 (select (arr!46984 a!2831) i!982)) (and (not (= (select (arr!46984 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46984 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426931 d!153289))

(declare-fun b!1427075 () Bool)

(declare-fun e!806049 () Bool)

(declare-fun e!806050 () Bool)

(assert (=> b!1427075 (= e!806049 e!806050)))

(declare-fun res!962218 () Bool)

(declare-fun lt!628415 () SeekEntryResult!11263)

(assert (=> b!1427075 (= res!962218 (and (is-Intermediate!11263 lt!628415) (not (undefined!12075 lt!628415)) (bvslt (x!129071 lt!628415) #b01111111111111111111111111111110) (bvsge (x!129071 lt!628415) #b00000000000000000000000000000000) (bvsge (x!129071 lt!628415) #b00000000000000000000000000000000)))))

(assert (=> b!1427075 (=> (not res!962218) (not e!806050))))

(declare-fun b!1427076 () Bool)

(assert (=> b!1427076 (and (bvsge (index!47446 lt!628415) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628415) (size!47534 lt!628361)))))

(declare-fun e!806052 () Bool)

(assert (=> b!1427076 (= e!806052 (= (select (arr!46984 lt!628361) (index!47446 lt!628415)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427077 () Bool)

(declare-fun e!806048 () SeekEntryResult!11263)

(declare-fun e!806051 () SeekEntryResult!11263)

(assert (=> b!1427077 (= e!806048 e!806051)))

(declare-fun c!131918 () Bool)

(declare-fun lt!628416 () (_ BitVec 64))

(assert (=> b!1427077 (= c!131918 (or (= lt!628416 lt!628362) (= (bvadd lt!628416 lt!628416) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427078 () Bool)

(assert (=> b!1427078 (= e!806051 (Intermediate!11263 false (toIndex!0 lt!628362 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153291 () Bool)

(assert (=> d!153291 e!806049))

(declare-fun c!131920 () Bool)

(assert (=> d!153291 (= c!131920 (and (is-Intermediate!11263 lt!628415) (undefined!12075 lt!628415)))))

(assert (=> d!153291 (= lt!628415 e!806048)))

(declare-fun c!131919 () Bool)

(assert (=> d!153291 (= c!131919 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153291 (= lt!628416 (select (arr!46984 lt!628361) (toIndex!0 lt!628362 mask!2608)))))

(assert (=> d!153291 (validMask!0 mask!2608)))

(assert (=> d!153291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628362 mask!2608) lt!628362 lt!628361 mask!2608) lt!628415)))

(declare-fun b!1427079 () Bool)

(assert (=> b!1427079 (= e!806048 (Intermediate!11263 true (toIndex!0 lt!628362 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427080 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427080 (= e!806051 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628362 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628362 lt!628361 mask!2608))))

(declare-fun b!1427081 () Bool)

(assert (=> b!1427081 (= e!806049 (bvsge (x!129071 lt!628415) #b01111111111111111111111111111110))))

(declare-fun b!1427082 () Bool)

(assert (=> b!1427082 (and (bvsge (index!47446 lt!628415) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628415) (size!47534 lt!628361)))))

(declare-fun res!962216 () Bool)

(assert (=> b!1427082 (= res!962216 (= (select (arr!46984 lt!628361) (index!47446 lt!628415)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427082 (=> res!962216 e!806052)))

(declare-fun b!1427083 () Bool)

(assert (=> b!1427083 (and (bvsge (index!47446 lt!628415) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628415) (size!47534 lt!628361)))))

(declare-fun res!962217 () Bool)

(assert (=> b!1427083 (= res!962217 (= (select (arr!46984 lt!628361) (index!47446 lt!628415)) lt!628362))))

(assert (=> b!1427083 (=> res!962217 e!806052)))

(assert (=> b!1427083 (= e!806050 e!806052)))

(assert (= (and d!153291 c!131919) b!1427079))

(assert (= (and d!153291 (not c!131919)) b!1427077))

(assert (= (and b!1427077 c!131918) b!1427078))

(assert (= (and b!1427077 (not c!131918)) b!1427080))

(assert (= (and d!153291 c!131920) b!1427081))

(assert (= (and d!153291 (not c!131920)) b!1427075))

(assert (= (and b!1427075 res!962218) b!1427083))

(assert (= (and b!1427083 (not res!962217)) b!1427082))

(assert (= (and b!1427082 (not res!962216)) b!1427076))

(declare-fun m!1317521 () Bool)

(assert (=> b!1427076 m!1317521))

(assert (=> d!153291 m!1317421))

(declare-fun m!1317523 () Bool)

(assert (=> d!153291 m!1317523))

(assert (=> d!153291 m!1317441))

(assert (=> b!1427083 m!1317521))

(assert (=> b!1427082 m!1317521))

(assert (=> b!1427080 m!1317421))

(declare-fun m!1317525 () Bool)

(assert (=> b!1427080 m!1317525))

(assert (=> b!1427080 m!1317525))

(declare-fun m!1317527 () Bool)

(assert (=> b!1427080 m!1317527))

(assert (=> b!1426932 d!153291))

(declare-fun d!153301 () Bool)

(declare-fun lt!628430 () (_ BitVec 32))

(declare-fun lt!628429 () (_ BitVec 32))

(assert (=> d!153301 (= lt!628430 (bvmul (bvxor lt!628429 (bvlshr lt!628429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153301 (= lt!628429 ((_ extract 31 0) (bvand (bvxor lt!628362 (bvlshr lt!628362 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153301 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962222 (let ((h!34797 ((_ extract 31 0) (bvand (bvxor lt!628362 (bvlshr lt!628362 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129076 (bvmul (bvxor h!34797 (bvlshr h!34797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129076 (bvlshr x!129076 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962222 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962222 #b00000000000000000000000000000000))))))

(assert (=> d!153301 (= (toIndex!0 lt!628362 mask!2608) (bvand (bvxor lt!628430 (bvlshr lt!628430 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426932 d!153301))

(declare-fun d!153307 () Bool)

(assert (=> d!153307 (= (validKeyInArray!0 (select (arr!46984 a!2831) j!81)) (and (not (= (select (arr!46984 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46984 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426934 d!153307))

(declare-fun d!153309 () Bool)

(assert (=> d!153309 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123022 d!153309))

(declare-fun d!153317 () Bool)

(assert (=> d!153317 (= (array_inv!36012 a!2831) (bvsge (size!47534 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123022 d!153317))

(declare-fun d!153319 () Bool)

(declare-fun lt!628456 () SeekEntryResult!11263)

(assert (=> d!153319 (and (or (is-Undefined!11263 lt!628456) (not (is-Found!11263 lt!628456)) (and (bvsge (index!47445 lt!628456) #b00000000000000000000000000000000) (bvslt (index!47445 lt!628456) (size!47534 a!2831)))) (or (is-Undefined!11263 lt!628456) (is-Found!11263 lt!628456) (not (is-MissingZero!11263 lt!628456)) (and (bvsge (index!47444 lt!628456) #b00000000000000000000000000000000) (bvslt (index!47444 lt!628456) (size!47534 a!2831)))) (or (is-Undefined!11263 lt!628456) (is-Found!11263 lt!628456) (is-MissingZero!11263 lt!628456) (not (is-MissingVacant!11263 lt!628456)) (and (bvsge (index!47447 lt!628456) #b00000000000000000000000000000000) (bvslt (index!47447 lt!628456) (size!47534 a!2831)))) (or (is-Undefined!11263 lt!628456) (ite (is-Found!11263 lt!628456) (= (select (arr!46984 a!2831) (index!47445 lt!628456)) (select (arr!46984 a!2831) j!81)) (ite (is-MissingZero!11263 lt!628456) (= (select (arr!46984 a!2831) (index!47444 lt!628456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11263 lt!628456) (= (select (arr!46984 a!2831) (index!47447 lt!628456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!806100 () SeekEntryResult!11263)

(assert (=> d!153319 (= lt!628456 e!806100)))

(declare-fun c!131946 () Bool)

(declare-fun lt!628454 () SeekEntryResult!11263)

(assert (=> d!153319 (= c!131946 (and (is-Intermediate!11263 lt!628454) (undefined!12075 lt!628454)))))

(assert (=> d!153319 (= lt!628454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) (select (arr!46984 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153319 (validMask!0 mask!2608)))

(assert (=> d!153319 (= (seekEntryOrOpen!0 (select (arr!46984 a!2831) j!81) a!2831 mask!2608) lt!628456)))

(declare-fun b!1427159 () Bool)

(assert (=> b!1427159 (= e!806100 Undefined!11263)))

(declare-fun b!1427160 () Bool)

(declare-fun e!806101 () SeekEntryResult!11263)

(assert (=> b!1427160 (= e!806101 (MissingZero!11263 (index!47446 lt!628454)))))

(declare-fun b!1427161 () Bool)

(declare-fun e!806102 () SeekEntryResult!11263)

(assert (=> b!1427161 (= e!806100 e!806102)))

(declare-fun lt!628455 () (_ BitVec 64))

(assert (=> b!1427161 (= lt!628455 (select (arr!46984 a!2831) (index!47446 lt!628454)))))

(declare-fun c!131947 () Bool)

(assert (=> b!1427161 (= c!131947 (= lt!628455 (select (arr!46984 a!2831) j!81)))))

(declare-fun b!1427162 () Bool)

(assert (=> b!1427162 (= e!806102 (Found!11263 (index!47446 lt!628454)))))

(declare-fun b!1427163 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97336 (_ BitVec 32)) SeekEntryResult!11263)

(assert (=> b!1427163 (= e!806101 (seekKeyOrZeroReturnVacant!0 (x!129071 lt!628454) (index!47446 lt!628454) (index!47446 lt!628454) (select (arr!46984 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427164 () Bool)

(declare-fun c!131945 () Bool)

(assert (=> b!1427164 (= c!131945 (= lt!628455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427164 (= e!806102 e!806101)))

(assert (= (and d!153319 c!131946) b!1427159))

(assert (= (and d!153319 (not c!131946)) b!1427161))

(assert (= (and b!1427161 c!131947) b!1427162))

(assert (= (and b!1427161 (not c!131947)) b!1427164))

(assert (= (and b!1427164 c!131945) b!1427160))

(assert (= (and b!1427164 (not c!131945)) b!1427163))

(assert (=> d!153319 m!1317429))

(assert (=> d!153319 m!1317449))

(declare-fun m!1317573 () Bool)

(assert (=> d!153319 m!1317573))

(assert (=> d!153319 m!1317449))

(assert (=> d!153319 m!1317429))

(assert (=> d!153319 m!1317451))

(declare-fun m!1317575 () Bool)

(assert (=> d!153319 m!1317575))

(declare-fun m!1317577 () Bool)

(assert (=> d!153319 m!1317577))

(assert (=> d!153319 m!1317441))

(declare-fun m!1317579 () Bool)

(assert (=> b!1427161 m!1317579))

(assert (=> b!1427163 m!1317429))

(declare-fun m!1317581 () Bool)

(assert (=> b!1427163 m!1317581))

(assert (=> b!1426933 d!153319))

(declare-fun d!153333 () Bool)

(declare-fun res!962254 () Bool)

(declare-fun e!806111 () Bool)

(assert (=> d!153333 (=> res!962254 e!806111)))

(assert (=> d!153333 (= res!962254 (bvsge #b00000000000000000000000000000000 (size!47534 a!2831)))))

(assert (=> d!153333 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33491) e!806111)))

(declare-fun bm!67355 () Bool)

(declare-fun call!67358 () Bool)

(declare-fun c!131950 () Bool)

(assert (=> bm!67355 (= call!67358 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131950 (Cons!33490 (select (arr!46984 a!2831) #b00000000000000000000000000000000) Nil!33491) Nil!33491)))))

(declare-fun b!1427175 () Bool)

(declare-fun e!806112 () Bool)

(declare-fun contains!9850 (List!33494 (_ BitVec 64)) Bool)

(assert (=> b!1427175 (= e!806112 (contains!9850 Nil!33491 (select (arr!46984 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427176 () Bool)

(declare-fun e!806113 () Bool)

(declare-fun e!806114 () Bool)

(assert (=> b!1427176 (= e!806113 e!806114)))

(assert (=> b!1427176 (= c!131950 (validKeyInArray!0 (select (arr!46984 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427177 () Bool)

(assert (=> b!1427177 (= e!806114 call!67358)))

(declare-fun b!1427178 () Bool)

(assert (=> b!1427178 (= e!806111 e!806113)))

(declare-fun res!962256 () Bool)

(assert (=> b!1427178 (=> (not res!962256) (not e!806113))))

(assert (=> b!1427178 (= res!962256 (not e!806112))))

(declare-fun res!962255 () Bool)

(assert (=> b!1427178 (=> (not res!962255) (not e!806112))))

(assert (=> b!1427178 (= res!962255 (validKeyInArray!0 (select (arr!46984 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427179 () Bool)

(assert (=> b!1427179 (= e!806114 call!67358)))

(assert (= (and d!153333 (not res!962254)) b!1427178))

(assert (= (and b!1427178 res!962255) b!1427175))

(assert (= (and b!1427178 res!962256) b!1427176))

(assert (= (and b!1427176 c!131950) b!1427179))

(assert (= (and b!1427176 (not c!131950)) b!1427177))

(assert (= (or b!1427179 b!1427177) bm!67355))

(declare-fun m!1317583 () Bool)

(assert (=> bm!67355 m!1317583))

(declare-fun m!1317585 () Bool)

(assert (=> bm!67355 m!1317585))

(assert (=> b!1427175 m!1317583))

(assert (=> b!1427175 m!1317583))

(declare-fun m!1317587 () Bool)

(assert (=> b!1427175 m!1317587))

(assert (=> b!1427176 m!1317583))

(assert (=> b!1427176 m!1317583))

(declare-fun m!1317589 () Bool)

(assert (=> b!1427176 m!1317589))

(assert (=> b!1427178 m!1317583))

(assert (=> b!1427178 m!1317583))

(assert (=> b!1427178 m!1317589))

(assert (=> b!1426935 d!153333))

(declare-fun bm!67359 () Bool)

(declare-fun call!67362 () Bool)

(assert (=> bm!67359 (= call!67362 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427210 () Bool)

(declare-fun e!806133 () Bool)

(assert (=> b!1427210 (= e!806133 call!67362)))

(declare-fun b!1427211 () Bool)

(declare-fun e!806134 () Bool)

(declare-fun e!806135 () Bool)

(assert (=> b!1427211 (= e!806134 e!806135)))

(declare-fun c!131963 () Bool)

(assert (=> b!1427211 (= c!131963 (validKeyInArray!0 (select (arr!46984 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1427212 () Bool)

(assert (=> b!1427212 (= e!806135 e!806133)))

(declare-fun lt!628477 () (_ BitVec 64))

(assert (=> b!1427212 (= lt!628477 (select (arr!46984 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628476 () Unit!48272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97336 (_ BitVec 64) (_ BitVec 32)) Unit!48272)

(assert (=> b!1427212 (= lt!628476 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628477 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1427212 (arrayContainsKey!0 a!2831 lt!628477 #b00000000000000000000000000000000)))

(declare-fun lt!628475 () Unit!48272)

(assert (=> b!1427212 (= lt!628475 lt!628476)))

(declare-fun res!962264 () Bool)

(assert (=> b!1427212 (= res!962264 (= (seekEntryOrOpen!0 (select (arr!46984 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11263 #b00000000000000000000000000000000)))))

(assert (=> b!1427212 (=> (not res!962264) (not e!806133))))

(declare-fun b!1427213 () Bool)

(assert (=> b!1427213 (= e!806135 call!67362)))

(declare-fun d!153335 () Bool)

(declare-fun res!962263 () Bool)

(assert (=> d!153335 (=> res!962263 e!806134)))

(assert (=> d!153335 (= res!962263 (bvsge #b00000000000000000000000000000000 (size!47534 a!2831)))))

(assert (=> d!153335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806134)))

(assert (= (and d!153335 (not res!962263)) b!1427211))

(assert (= (and b!1427211 c!131963) b!1427212))

(assert (= (and b!1427211 (not c!131963)) b!1427213))

(assert (= (and b!1427212 res!962264) b!1427210))

(assert (= (or b!1427210 b!1427213) bm!67359))

(declare-fun m!1317607 () Bool)

(assert (=> bm!67359 m!1317607))

(assert (=> b!1427211 m!1317583))

(assert (=> b!1427211 m!1317583))

(assert (=> b!1427211 m!1317589))

(assert (=> b!1427212 m!1317583))

(declare-fun m!1317609 () Bool)

(assert (=> b!1427212 m!1317609))

(declare-fun m!1317611 () Bool)

(assert (=> b!1427212 m!1317611))

(assert (=> b!1427212 m!1317583))

(declare-fun m!1317613 () Bool)

(assert (=> b!1427212 m!1317613))

(assert (=> b!1426924 d!153335))

(declare-fun call!67363 () Bool)

(declare-fun bm!67360 () Bool)

(assert (=> bm!67360 (= call!67363 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427214 () Bool)

(declare-fun e!806136 () Bool)

(assert (=> b!1427214 (= e!806136 call!67363)))

(declare-fun b!1427215 () Bool)

(declare-fun e!806137 () Bool)

(declare-fun e!806138 () Bool)

(assert (=> b!1427215 (= e!806137 e!806138)))

(declare-fun c!131964 () Bool)

(assert (=> b!1427215 (= c!131964 (validKeyInArray!0 (select (arr!46984 a!2831) j!81)))))

(declare-fun b!1427216 () Bool)

(assert (=> b!1427216 (= e!806138 e!806136)))

(declare-fun lt!628482 () (_ BitVec 64))

(assert (=> b!1427216 (= lt!628482 (select (arr!46984 a!2831) j!81))))

(declare-fun lt!628481 () Unit!48272)

(assert (=> b!1427216 (= lt!628481 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628482 j!81))))

(assert (=> b!1427216 (arrayContainsKey!0 a!2831 lt!628482 #b00000000000000000000000000000000)))

(declare-fun lt!628480 () Unit!48272)

(assert (=> b!1427216 (= lt!628480 lt!628481)))

(declare-fun res!962266 () Bool)

(assert (=> b!1427216 (= res!962266 (= (seekEntryOrOpen!0 (select (arr!46984 a!2831) j!81) a!2831 mask!2608) (Found!11263 j!81)))))

(assert (=> b!1427216 (=> (not res!962266) (not e!806136))))

(declare-fun b!1427217 () Bool)

(assert (=> b!1427217 (= e!806138 call!67363)))

(declare-fun d!153341 () Bool)

(declare-fun res!962265 () Bool)

(assert (=> d!153341 (=> res!962265 e!806137)))

(assert (=> d!153341 (= res!962265 (bvsge j!81 (size!47534 a!2831)))))

(assert (=> d!153341 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806137)))

(assert (= (and d!153341 (not res!962265)) b!1427215))

(assert (= (and b!1427215 c!131964) b!1427216))

(assert (= (and b!1427215 (not c!131964)) b!1427217))

(assert (= (and b!1427216 res!962266) b!1427214))

(assert (= (or b!1427214 b!1427217) bm!67360))

(declare-fun m!1317617 () Bool)

(assert (=> bm!67360 m!1317617))

(assert (=> b!1427215 m!1317429))

(assert (=> b!1427215 m!1317429))

(assert (=> b!1427215 m!1317433))

(assert (=> b!1427216 m!1317429))

(declare-fun m!1317619 () Bool)

(assert (=> b!1427216 m!1317619))

(declare-fun m!1317621 () Bool)

(assert (=> b!1427216 m!1317621))

(assert (=> b!1427216 m!1317429))

(assert (=> b!1427216 m!1317435))

(assert (=> b!1426926 d!153341))

(declare-fun d!153345 () Bool)

(assert (=> d!153345 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628486 () Unit!48272)

(declare-fun choose!38 (array!97336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48272)

(assert (=> d!153345 (= lt!628486 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153345 (validMask!0 mask!2608)))

(assert (=> d!153345 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628486)))

(declare-fun bs!41599 () Bool)

(assert (= bs!41599 d!153345))

(assert (=> bs!41599 m!1317455))

(declare-fun m!1317623 () Bool)

(assert (=> bs!41599 m!1317623))

(assert (=> bs!41599 m!1317441))

(assert (=> b!1426926 d!153345))

(declare-fun b!1427218 () Bool)

(declare-fun e!806140 () Bool)

(declare-fun e!806141 () Bool)

(assert (=> b!1427218 (= e!806140 e!806141)))

(declare-fun res!962269 () Bool)

(declare-fun lt!628487 () SeekEntryResult!11263)

(assert (=> b!1427218 (= res!962269 (and (is-Intermediate!11263 lt!628487) (not (undefined!12075 lt!628487)) (bvslt (x!129071 lt!628487) #b01111111111111111111111111111110) (bvsge (x!129071 lt!628487) #b00000000000000000000000000000000) (bvsge (x!129071 lt!628487) x!605)))))

(assert (=> b!1427218 (=> (not res!962269) (not e!806141))))

(declare-fun b!1427219 () Bool)

(assert (=> b!1427219 (and (bvsge (index!47446 lt!628487) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628487) (size!47534 a!2831)))))

(declare-fun e!806143 () Bool)

(assert (=> b!1427219 (= e!806143 (= (select (arr!46984 a!2831) (index!47446 lt!628487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427220 () Bool)

(declare-fun e!806139 () SeekEntryResult!11263)

(declare-fun e!806142 () SeekEntryResult!11263)

(assert (=> b!1427220 (= e!806139 e!806142)))

(declare-fun c!131965 () Bool)

(declare-fun lt!628488 () (_ BitVec 64))

(assert (=> b!1427220 (= c!131965 (or (= lt!628488 (select (arr!46984 a!2831) j!81)) (= (bvadd lt!628488 lt!628488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427221 () Bool)

(assert (=> b!1427221 (= e!806142 (Intermediate!11263 false index!585 x!605))))

(declare-fun d!153347 () Bool)

(assert (=> d!153347 e!806140))

(declare-fun c!131967 () Bool)

(assert (=> d!153347 (= c!131967 (and (is-Intermediate!11263 lt!628487) (undefined!12075 lt!628487)))))

(assert (=> d!153347 (= lt!628487 e!806139)))

(declare-fun c!131966 () Bool)

(assert (=> d!153347 (= c!131966 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153347 (= lt!628488 (select (arr!46984 a!2831) index!585))))

(assert (=> d!153347 (validMask!0 mask!2608)))

(assert (=> d!153347 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46984 a!2831) j!81) a!2831 mask!2608) lt!628487)))

(declare-fun b!1427222 () Bool)

(assert (=> b!1427222 (= e!806139 (Intermediate!11263 true index!585 x!605))))

(declare-fun b!1427223 () Bool)

(assert (=> b!1427223 (= e!806142 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46984 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427224 () Bool)

(assert (=> b!1427224 (= e!806140 (bvsge (x!129071 lt!628487) #b01111111111111111111111111111110))))

(declare-fun b!1427225 () Bool)

(assert (=> b!1427225 (and (bvsge (index!47446 lt!628487) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628487) (size!47534 a!2831)))))

(declare-fun res!962267 () Bool)

(assert (=> b!1427225 (= res!962267 (= (select (arr!46984 a!2831) (index!47446 lt!628487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427225 (=> res!962267 e!806143)))

(declare-fun b!1427226 () Bool)

(assert (=> b!1427226 (and (bvsge (index!47446 lt!628487) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628487) (size!47534 a!2831)))))

(declare-fun res!962268 () Bool)

(assert (=> b!1427226 (= res!962268 (= (select (arr!46984 a!2831) (index!47446 lt!628487)) (select (arr!46984 a!2831) j!81)))))

(assert (=> b!1427226 (=> res!962268 e!806143)))

(assert (=> b!1427226 (= e!806141 e!806143)))

(assert (= (and d!153347 c!131966) b!1427222))

(assert (= (and d!153347 (not c!131966)) b!1427220))

(assert (= (and b!1427220 c!131965) b!1427221))

(assert (= (and b!1427220 (not c!131965)) b!1427223))

(assert (= (and d!153347 c!131967) b!1427224))

(assert (= (and d!153347 (not c!131967)) b!1427218))

(assert (= (and b!1427218 res!962269) b!1427226))

(assert (= (and b!1427226 (not res!962268)) b!1427225))

(assert (= (and b!1427225 (not res!962267)) b!1427219))

(declare-fun m!1317625 () Bool)

(assert (=> b!1427219 m!1317625))

(assert (=> d!153347 m!1317453))

(assert (=> d!153347 m!1317441))

(assert (=> b!1427226 m!1317625))

(assert (=> b!1427225 m!1317625))

(declare-fun m!1317627 () Bool)

(assert (=> b!1427223 m!1317627))

(assert (=> b!1427223 m!1317627))

(assert (=> b!1427223 m!1317429))

(declare-fun m!1317629 () Bool)

(assert (=> b!1427223 m!1317629))

(assert (=> b!1426925 d!153347))

(declare-fun b!1427227 () Bool)

(declare-fun e!806145 () Bool)

(declare-fun e!806146 () Bool)

(assert (=> b!1427227 (= e!806145 e!806146)))

(declare-fun res!962272 () Bool)

(declare-fun lt!628489 () SeekEntryResult!11263)

(assert (=> b!1427227 (= res!962272 (and (is-Intermediate!11263 lt!628489) (not (undefined!12075 lt!628489)) (bvslt (x!129071 lt!628489) #b01111111111111111111111111111110) (bvsge (x!129071 lt!628489) #b00000000000000000000000000000000) (bvsge (x!129071 lt!628489) #b00000000000000000000000000000000)))))

(assert (=> b!1427227 (=> (not res!962272) (not e!806146))))

(declare-fun b!1427228 () Bool)

(assert (=> b!1427228 (and (bvsge (index!47446 lt!628489) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628489) (size!47534 a!2831)))))

(declare-fun e!806148 () Bool)

(assert (=> b!1427228 (= e!806148 (= (select (arr!46984 a!2831) (index!47446 lt!628489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427229 () Bool)

(declare-fun e!806144 () SeekEntryResult!11263)

(declare-fun e!806147 () SeekEntryResult!11263)

(assert (=> b!1427229 (= e!806144 e!806147)))

(declare-fun lt!628490 () (_ BitVec 64))

(declare-fun c!131968 () Bool)

(assert (=> b!1427229 (= c!131968 (or (= lt!628490 (select (arr!46984 a!2831) j!81)) (= (bvadd lt!628490 lt!628490) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427230 () Bool)

(assert (=> b!1427230 (= e!806147 (Intermediate!11263 false (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153349 () Bool)

(assert (=> d!153349 e!806145))

(declare-fun c!131970 () Bool)

(assert (=> d!153349 (= c!131970 (and (is-Intermediate!11263 lt!628489) (undefined!12075 lt!628489)))))

(assert (=> d!153349 (= lt!628489 e!806144)))

(declare-fun c!131969 () Bool)

(assert (=> d!153349 (= c!131969 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153349 (= lt!628490 (select (arr!46984 a!2831) (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608)))))

(assert (=> d!153349 (validMask!0 mask!2608)))

(assert (=> d!153349 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) (select (arr!46984 a!2831) j!81) a!2831 mask!2608) lt!628489)))

(declare-fun b!1427231 () Bool)

(assert (=> b!1427231 (= e!806144 (Intermediate!11263 true (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427232 () Bool)

(assert (=> b!1427232 (= e!806147 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46984 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427233 () Bool)

(assert (=> b!1427233 (= e!806145 (bvsge (x!129071 lt!628489) #b01111111111111111111111111111110))))

(declare-fun b!1427234 () Bool)

(assert (=> b!1427234 (and (bvsge (index!47446 lt!628489) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628489) (size!47534 a!2831)))))

(declare-fun res!962270 () Bool)

(assert (=> b!1427234 (= res!962270 (= (select (arr!46984 a!2831) (index!47446 lt!628489)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427234 (=> res!962270 e!806148)))

(declare-fun b!1427235 () Bool)

(assert (=> b!1427235 (and (bvsge (index!47446 lt!628489) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628489) (size!47534 a!2831)))))

(declare-fun res!962271 () Bool)

(assert (=> b!1427235 (= res!962271 (= (select (arr!46984 a!2831) (index!47446 lt!628489)) (select (arr!46984 a!2831) j!81)))))

(assert (=> b!1427235 (=> res!962271 e!806148)))

(assert (=> b!1427235 (= e!806146 e!806148)))

(assert (= (and d!153349 c!131969) b!1427231))

(assert (= (and d!153349 (not c!131969)) b!1427229))

(assert (= (and b!1427229 c!131968) b!1427230))

(assert (= (and b!1427229 (not c!131968)) b!1427232))

(assert (= (and d!153349 c!131970) b!1427233))

(assert (= (and d!153349 (not c!131970)) b!1427227))

(assert (= (and b!1427227 res!962272) b!1427235))

(assert (= (and b!1427235 (not res!962271)) b!1427234))

(assert (= (and b!1427234 (not res!962270)) b!1427228))

(declare-fun m!1317631 () Bool)

(assert (=> b!1427228 m!1317631))

(assert (=> d!153349 m!1317449))

(declare-fun m!1317633 () Bool)

(assert (=> d!153349 m!1317633))

(assert (=> d!153349 m!1317441))

(assert (=> b!1427235 m!1317631))

(assert (=> b!1427234 m!1317631))

(assert (=> b!1427232 m!1317449))

(declare-fun m!1317635 () Bool)

(assert (=> b!1427232 m!1317635))

(assert (=> b!1427232 m!1317635))

(assert (=> b!1427232 m!1317429))

(declare-fun m!1317637 () Bool)

(assert (=> b!1427232 m!1317637))

(assert (=> b!1426927 d!153349))

(declare-fun d!153351 () Bool)

(declare-fun lt!628492 () (_ BitVec 32))

(declare-fun lt!628491 () (_ BitVec 32))

(assert (=> d!153351 (= lt!628492 (bvmul (bvxor lt!628491 (bvlshr lt!628491 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153351 (= lt!628491 ((_ extract 31 0) (bvand (bvxor (select (arr!46984 a!2831) j!81) (bvlshr (select (arr!46984 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153351 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962222 (let ((h!34797 ((_ extract 31 0) (bvand (bvxor (select (arr!46984 a!2831) j!81) (bvlshr (select (arr!46984 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129076 (bvmul (bvxor h!34797 (bvlshr h!34797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129076 (bvlshr x!129076 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962222 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962222 #b00000000000000000000000000000000))))))

(assert (=> d!153351 (= (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) (bvand (bvxor lt!628492 (bvlshr lt!628492 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426927 d!153351))

(declare-fun b!1427236 () Bool)

(declare-fun e!806150 () Bool)

(declare-fun e!806151 () Bool)

(assert (=> b!1427236 (= e!806150 e!806151)))

(declare-fun res!962275 () Bool)

(declare-fun lt!628493 () SeekEntryResult!11263)

(assert (=> b!1427236 (= res!962275 (and (is-Intermediate!11263 lt!628493) (not (undefined!12075 lt!628493)) (bvslt (x!129071 lt!628493) #b01111111111111111111111111111110) (bvsge (x!129071 lt!628493) #b00000000000000000000000000000000) (bvsge (x!129071 lt!628493) x!605)))))

(assert (=> b!1427236 (=> (not res!962275) (not e!806151))))

(declare-fun b!1427237 () Bool)

(assert (=> b!1427237 (and (bvsge (index!47446 lt!628493) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628493) (size!47534 lt!628361)))))

(declare-fun e!806153 () Bool)

(assert (=> b!1427237 (= e!806153 (= (select (arr!46984 lt!628361) (index!47446 lt!628493)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427238 () Bool)

(declare-fun e!806149 () SeekEntryResult!11263)

(declare-fun e!806152 () SeekEntryResult!11263)

(assert (=> b!1427238 (= e!806149 e!806152)))

(declare-fun c!131971 () Bool)

(declare-fun lt!628494 () (_ BitVec 64))

(assert (=> b!1427238 (= c!131971 (or (= lt!628494 lt!628362) (= (bvadd lt!628494 lt!628494) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427239 () Bool)

(assert (=> b!1427239 (= e!806152 (Intermediate!11263 false index!585 x!605))))

(declare-fun d!153353 () Bool)

(assert (=> d!153353 e!806150))

(declare-fun c!131973 () Bool)

(assert (=> d!153353 (= c!131973 (and (is-Intermediate!11263 lt!628493) (undefined!12075 lt!628493)))))

(assert (=> d!153353 (= lt!628493 e!806149)))

(declare-fun c!131972 () Bool)

(assert (=> d!153353 (= c!131972 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153353 (= lt!628494 (select (arr!46984 lt!628361) index!585))))

(assert (=> d!153353 (validMask!0 mask!2608)))

(assert (=> d!153353 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628362 lt!628361 mask!2608) lt!628493)))

(declare-fun b!1427240 () Bool)

(assert (=> b!1427240 (= e!806149 (Intermediate!11263 true index!585 x!605))))

(declare-fun b!1427241 () Bool)

(assert (=> b!1427241 (= e!806152 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628362 lt!628361 mask!2608))))

(declare-fun b!1427242 () Bool)

(assert (=> b!1427242 (= e!806150 (bvsge (x!129071 lt!628493) #b01111111111111111111111111111110))))

(declare-fun b!1427243 () Bool)

(assert (=> b!1427243 (and (bvsge (index!47446 lt!628493) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628493) (size!47534 lt!628361)))))

(declare-fun res!962273 () Bool)

(assert (=> b!1427243 (= res!962273 (= (select (arr!46984 lt!628361) (index!47446 lt!628493)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427243 (=> res!962273 e!806153)))

(declare-fun b!1427244 () Bool)

(assert (=> b!1427244 (and (bvsge (index!47446 lt!628493) #b00000000000000000000000000000000) (bvslt (index!47446 lt!628493) (size!47534 lt!628361)))))

(declare-fun res!962274 () Bool)

(assert (=> b!1427244 (= res!962274 (= (select (arr!46984 lt!628361) (index!47446 lt!628493)) lt!628362))))

(assert (=> b!1427244 (=> res!962274 e!806153)))

(assert (=> b!1427244 (= e!806151 e!806153)))

(assert (= (and d!153353 c!131972) b!1427240))

(assert (= (and d!153353 (not c!131972)) b!1427238))

(assert (= (and b!1427238 c!131971) b!1427239))

(assert (= (and b!1427238 (not c!131971)) b!1427241))

(assert (= (and d!153353 c!131973) b!1427242))

(assert (= (and d!153353 (not c!131973)) b!1427236))

(assert (= (and b!1427236 res!962275) b!1427244))

(assert (= (and b!1427244 (not res!962274)) b!1427243))

(assert (= (and b!1427243 (not res!962273)) b!1427237))

(declare-fun m!1317639 () Bool)

(assert (=> b!1427237 m!1317639))

(declare-fun m!1317641 () Bool)

(assert (=> d!153353 m!1317641))

(assert (=> d!153353 m!1317441))

(assert (=> b!1427244 m!1317639))

(assert (=> b!1427243 m!1317639))

(assert (=> b!1427241 m!1317627))

(assert (=> b!1427241 m!1317627))

(declare-fun m!1317643 () Bool)

(assert (=> b!1427241 m!1317643))

(assert (=> b!1426929 d!153353))

(push 1)

(assert (not b!1427241))

(assert (not b!1427175))

(assert (not d!153349))

(assert (not bm!67359))

(assert (not b!1427212))

(assert (not d!153347))

(assert (not b!1427178))

(assert (not b!1427223))

(assert (not b!1427215))

(assert (not b!1427163))

(assert (not b!1427080))

(assert (not d!153291))

(assert (not b!1427216))

(assert (not b!1427232))

(assert (not d!153353))

(assert (not d!153319))

(assert (not bm!67355))

(assert (not b!1427211))

(assert (not b!1427176))

(assert (not bm!67360))

(assert (not d!153345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

