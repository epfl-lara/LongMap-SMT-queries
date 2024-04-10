; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123292 () Bool)

(assert start!123292)

(declare-fun b!1429956 () Bool)

(declare-fun e!807339 () Bool)

(declare-fun e!807338 () Bool)

(assert (=> b!1429956 (= e!807339 e!807338)))

(declare-fun res!964596 () Bool)

(assert (=> b!1429956 (=> (not res!964596) (not e!807338))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97453 0))(
  ( (array!97454 (arr!47038 (Array (_ BitVec 32) (_ BitVec 64))) (size!47588 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97453)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11317 0))(
  ( (MissingZero!11317 (index!47660 (_ BitVec 32))) (Found!11317 (index!47661 (_ BitVec 32))) (Intermediate!11317 (undefined!12129 Bool) (index!47662 (_ BitVec 32)) (x!129287 (_ BitVec 32))) (Undefined!11317) (MissingVacant!11317 (index!47663 (_ BitVec 32))) )
))
(declare-fun lt!629564 () SeekEntryResult!11317)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97453 (_ BitVec 32)) SeekEntryResult!11317)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429956 (= res!964596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!629564))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429956 (= lt!629564 (Intermediate!11317 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429957 () Bool)

(declare-fun res!964597 () Bool)

(declare-fun e!807341 () Bool)

(assert (=> b!1429957 (=> (not res!964597) (not e!807341))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429957 (= res!964597 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429958 () Bool)

(declare-fun res!964593 () Bool)

(assert (=> b!1429958 (=> (not res!964593) (not e!807341))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429958 (= res!964593 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!629564))))

(declare-fun b!1429959 () Bool)

(declare-fun res!964592 () Bool)

(assert (=> b!1429959 (=> (not res!964592) (not e!807339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429959 (= res!964592 (validKeyInArray!0 (select (arr!47038 a!2831) j!81)))))

(declare-fun res!964594 () Bool)

(assert (=> start!123292 (=> (not res!964594) (not e!807339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123292 (= res!964594 (validMask!0 mask!2608))))

(assert (=> start!123292 e!807339))

(assert (=> start!123292 true))

(declare-fun array_inv!36066 (array!97453) Bool)

(assert (=> start!123292 (array_inv!36066 a!2831)))

(declare-fun b!1429960 () Bool)

(declare-fun res!964589 () Bool)

(assert (=> b!1429960 (=> (not res!964589) (not e!807339))))

(declare-datatypes ((List!33548 0))(
  ( (Nil!33545) (Cons!33544 (h!34858 (_ BitVec 64)) (t!48242 List!33548)) )
))
(declare-fun arrayNoDuplicates!0 (array!97453 (_ BitVec 32) List!33548) Bool)

(assert (=> b!1429960 (= res!964589 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33545))))

(declare-fun b!1429961 () Bool)

(declare-fun res!964585 () Bool)

(assert (=> b!1429961 (=> (not res!964585) (not e!807341))))

(declare-fun lt!629567 () SeekEntryResult!11317)

(declare-fun lt!629566 () array!97453)

(declare-fun lt!629565 () (_ BitVec 64))

(assert (=> b!1429961 (= res!964585 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629565 lt!629566 mask!2608) lt!629567))))

(declare-fun b!1429962 () Bool)

(declare-fun res!964587 () Bool)

(assert (=> b!1429962 (=> (not res!964587) (not e!807339))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429962 (= res!964587 (validKeyInArray!0 (select (arr!47038 a!2831) i!982)))))

(declare-fun b!1429963 () Bool)

(declare-fun e!807340 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97453 (_ BitVec 32)) SeekEntryResult!11317)

(assert (=> b!1429963 (= e!807340 (= (seekEntryOrOpen!0 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) (Found!11317 j!81)))))

(declare-fun b!1429964 () Bool)

(assert (=> b!1429964 (= e!807338 e!807341)))

(declare-fun res!964590 () Bool)

(assert (=> b!1429964 (=> (not res!964590) (not e!807341))))

(assert (=> b!1429964 (= res!964590 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629565 mask!2608) lt!629565 lt!629566 mask!2608) lt!629567))))

(assert (=> b!1429964 (= lt!629567 (Intermediate!11317 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429964 (= lt!629565 (select (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429964 (= lt!629566 (array!97454 (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47588 a!2831)))))

(declare-fun b!1429965 () Bool)

(declare-fun res!964586 () Bool)

(assert (=> b!1429965 (=> (not res!964586) (not e!807339))))

(assert (=> b!1429965 (= res!964586 (and (= (size!47588 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47588 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47588 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429966 () Bool)

(declare-fun res!964588 () Bool)

(assert (=> b!1429966 (=> (not res!964588) (not e!807339))))

(assert (=> b!1429966 (= res!964588 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47588 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47588 a!2831))))))

(declare-fun b!1429967 () Bool)

(assert (=> b!1429967 (= e!807341 (not (or (= (select (arr!47038 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47038 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47038 a!2831) index!585) (select (arr!47038 a!2831) j!81)) (not (= (select (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13))))))

(assert (=> b!1429967 e!807340))

(declare-fun res!964595 () Bool)

(assert (=> b!1429967 (=> (not res!964595) (not e!807340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97453 (_ BitVec 32)) Bool)

(assert (=> b!1429967 (= res!964595 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48380 0))(
  ( (Unit!48381) )
))
(declare-fun lt!629568 () Unit!48380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48380)

(assert (=> b!1429967 (= lt!629568 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429968 () Bool)

(declare-fun res!964591 () Bool)

(assert (=> b!1429968 (=> (not res!964591) (not e!807339))))

(assert (=> b!1429968 (= res!964591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123292 res!964594) b!1429965))

(assert (= (and b!1429965 res!964586) b!1429962))

(assert (= (and b!1429962 res!964587) b!1429959))

(assert (= (and b!1429959 res!964592) b!1429968))

(assert (= (and b!1429968 res!964591) b!1429960))

(assert (= (and b!1429960 res!964589) b!1429966))

(assert (= (and b!1429966 res!964588) b!1429956))

(assert (= (and b!1429956 res!964596) b!1429964))

(assert (= (and b!1429964 res!964590) b!1429958))

(assert (= (and b!1429958 res!964593) b!1429961))

(assert (= (and b!1429961 res!964585) b!1429957))

(assert (= (and b!1429957 res!964597) b!1429967))

(assert (= (and b!1429967 res!964595) b!1429963))

(declare-fun m!1320051 () Bool)

(assert (=> b!1429964 m!1320051))

(assert (=> b!1429964 m!1320051))

(declare-fun m!1320053 () Bool)

(assert (=> b!1429964 m!1320053))

(declare-fun m!1320055 () Bool)

(assert (=> b!1429964 m!1320055))

(declare-fun m!1320057 () Bool)

(assert (=> b!1429964 m!1320057))

(declare-fun m!1320059 () Bool)

(assert (=> b!1429960 m!1320059))

(declare-fun m!1320061 () Bool)

(assert (=> b!1429968 m!1320061))

(declare-fun m!1320063 () Bool)

(assert (=> b!1429959 m!1320063))

(assert (=> b!1429959 m!1320063))

(declare-fun m!1320065 () Bool)

(assert (=> b!1429959 m!1320065))

(declare-fun m!1320067 () Bool)

(assert (=> b!1429961 m!1320067))

(declare-fun m!1320069 () Bool)

(assert (=> start!123292 m!1320069))

(declare-fun m!1320071 () Bool)

(assert (=> start!123292 m!1320071))

(assert (=> b!1429963 m!1320063))

(assert (=> b!1429963 m!1320063))

(declare-fun m!1320073 () Bool)

(assert (=> b!1429963 m!1320073))

(declare-fun m!1320075 () Bool)

(assert (=> b!1429962 m!1320075))

(assert (=> b!1429962 m!1320075))

(declare-fun m!1320077 () Bool)

(assert (=> b!1429962 m!1320077))

(assert (=> b!1429958 m!1320063))

(assert (=> b!1429958 m!1320063))

(declare-fun m!1320079 () Bool)

(assert (=> b!1429958 m!1320079))

(assert (=> b!1429967 m!1320055))

(declare-fun m!1320081 () Bool)

(assert (=> b!1429967 m!1320081))

(declare-fun m!1320083 () Bool)

(assert (=> b!1429967 m!1320083))

(declare-fun m!1320085 () Bool)

(assert (=> b!1429967 m!1320085))

(assert (=> b!1429967 m!1320063))

(declare-fun m!1320087 () Bool)

(assert (=> b!1429967 m!1320087))

(assert (=> b!1429956 m!1320063))

(assert (=> b!1429956 m!1320063))

(declare-fun m!1320089 () Bool)

(assert (=> b!1429956 m!1320089))

(assert (=> b!1429956 m!1320089))

(assert (=> b!1429956 m!1320063))

(declare-fun m!1320091 () Bool)

(assert (=> b!1429956 m!1320091))

(push 1)

(assert (not b!1429956))

(assert (not b!1429958))

(assert (not b!1429964))

(assert (not b!1429962))

(assert (not start!123292))

(assert (not b!1429967))

(assert (not b!1429968))

(assert (not b!1429961))

(assert (not b!1429959))

(assert (not b!1429960))

(assert (not b!1429963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!807395 () SeekEntryResult!11317)

(declare-fun b!1430050 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430050 (= e!807395 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47038 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430051 () Bool)

(declare-fun lt!629599 () SeekEntryResult!11317)

(assert (=> b!1430051 (and (bvsge (index!47662 lt!629599) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629599) (size!47588 a!2831)))))

(declare-fun res!964625 () Bool)

(assert (=> b!1430051 (= res!964625 (= (select (arr!47038 a!2831) (index!47662 lt!629599)) (select (arr!47038 a!2831) j!81)))))

(declare-fun e!807393 () Bool)

(assert (=> b!1430051 (=> res!964625 e!807393)))

(declare-fun e!807396 () Bool)

(assert (=> b!1430051 (= e!807396 e!807393)))

(declare-fun b!1430052 () Bool)

(declare-fun e!807392 () Bool)

(assert (=> b!1430052 (= e!807392 (bvsge (x!129287 lt!629599) #b01111111111111111111111111111110))))

(declare-fun d!153583 () Bool)

(assert (=> d!153583 e!807392))

(declare-fun c!132205 () Bool)

(assert (=> d!153583 (= c!132205 (and (is-Intermediate!11317 lt!629599) (undefined!12129 lt!629599)))))

(declare-fun e!807394 () SeekEntryResult!11317)

(assert (=> d!153583 (= lt!629599 e!807394)))

(declare-fun c!132206 () Bool)

(assert (=> d!153583 (= c!132206 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!629598 () (_ BitVec 64))

(assert (=> d!153583 (= lt!629598 (select (arr!47038 a!2831) (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608)))))

(assert (=> d!153583 (validMask!0 mask!2608)))

(assert (=> d!153583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!629599)))

(declare-fun b!1430053 () Bool)

(assert (=> b!1430053 (and (bvsge (index!47662 lt!629599) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629599) (size!47588 a!2831)))))

(declare-fun res!964627 () Bool)

(assert (=> b!1430053 (= res!964627 (= (select (arr!47038 a!2831) (index!47662 lt!629599)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430053 (=> res!964627 e!807393)))

(declare-fun b!1430054 () Bool)

(assert (=> b!1430054 (= e!807394 (Intermediate!11317 true (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430055 () Bool)

(assert (=> b!1430055 (and (bvsge (index!47662 lt!629599) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629599) (size!47588 a!2831)))))

(assert (=> b!1430055 (= e!807393 (= (select (arr!47038 a!2831) (index!47662 lt!629599)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430056 () Bool)

(assert (=> b!1430056 (= e!807395 (Intermediate!11317 false (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430057 () Bool)

(assert (=> b!1430057 (= e!807394 e!807395)))

(declare-fun c!132207 () Bool)

(assert (=> b!1430057 (= c!132207 (or (= lt!629598 (select (arr!47038 a!2831) j!81)) (= (bvadd lt!629598 lt!629598) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430058 () Bool)

(assert (=> b!1430058 (= e!807392 e!807396)))

(declare-fun res!964626 () Bool)

(assert (=> b!1430058 (= res!964626 (and (is-Intermediate!11317 lt!629599) (not (undefined!12129 lt!629599)) (bvslt (x!129287 lt!629599) #b01111111111111111111111111111110) (bvsge (x!129287 lt!629599) #b00000000000000000000000000000000) (bvsge (x!129287 lt!629599) #b00000000000000000000000000000000)))))

(assert (=> b!1430058 (=> (not res!964626) (not e!807396))))

(assert (= (and d!153583 c!132206) b!1430054))

(assert (= (and d!153583 (not c!132206)) b!1430057))

(assert (= (and b!1430057 c!132207) b!1430056))

(assert (= (and b!1430057 (not c!132207)) b!1430050))

(assert (= (and d!153583 c!132205) b!1430052))

(assert (= (and d!153583 (not c!132205)) b!1430058))

(assert (= (and b!1430058 res!964626) b!1430051))

(assert (= (and b!1430051 (not res!964625)) b!1430053))

(assert (= (and b!1430053 (not res!964627)) b!1430055))

(declare-fun m!1320119 () Bool)

(assert (=> b!1430053 m!1320119))

(assert (=> b!1430050 m!1320089))

(declare-fun m!1320121 () Bool)

(assert (=> b!1430050 m!1320121))

(assert (=> b!1430050 m!1320121))

(assert (=> b!1430050 m!1320063))

(declare-fun m!1320123 () Bool)

(assert (=> b!1430050 m!1320123))

(assert (=> b!1430055 m!1320119))

(assert (=> d!153583 m!1320089))

(declare-fun m!1320125 () Bool)

(assert (=> d!153583 m!1320125))

(assert (=> d!153583 m!1320069))

(assert (=> b!1430051 m!1320119))

(assert (=> b!1429956 d!153583))

(declare-fun d!153589 () Bool)

(declare-fun lt!629607 () (_ BitVec 32))

(declare-fun lt!629606 () (_ BitVec 32))

(assert (=> d!153589 (= lt!629607 (bvmul (bvxor lt!629606 (bvlshr lt!629606 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153589 (= lt!629606 ((_ extract 31 0) (bvand (bvxor (select (arr!47038 a!2831) j!81) (bvlshr (select (arr!47038 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153589 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964631 (let ((h!34859 ((_ extract 31 0) (bvand (bvxor (select (arr!47038 a!2831) j!81) (bvlshr (select (arr!47038 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129290 (bvmul (bvxor h!34859 (bvlshr h!34859 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129290 (bvlshr x!129290 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964631 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964631 #b00000000000000000000000000000000))))))

(assert (=> d!153589 (= (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) (bvand (bvxor lt!629607 (bvlshr lt!629607 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429956 d!153589))

(declare-fun d!153593 () Bool)

(assert (=> d!153593 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123292 d!153593))

(declare-fun d!153599 () Bool)

(assert (=> d!153599 (= (array_inv!36066 a!2831) (bvsge (size!47588 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123292 d!153599))

(declare-fun b!1430112 () Bool)

(declare-fun e!807430 () Bool)

(declare-fun call!67414 () Bool)

(assert (=> b!1430112 (= e!807430 call!67414)))

(declare-fun bm!67411 () Bool)

(assert (=> bm!67411 (= call!67414 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430113 () Bool)

(declare-fun e!807428 () Bool)

(declare-fun e!807429 () Bool)

(assert (=> b!1430113 (= e!807428 e!807429)))

(declare-fun c!132225 () Bool)

(assert (=> b!1430113 (= c!132225 (validKeyInArray!0 (select (arr!47038 a!2831) j!81)))))

(declare-fun b!1430115 () Bool)

(assert (=> b!1430115 (= e!807429 call!67414)))

(declare-fun b!1430114 () Bool)

(assert (=> b!1430114 (= e!807429 e!807430)))

(declare-fun lt!629628 () (_ BitVec 64))

(assert (=> b!1430114 (= lt!629628 (select (arr!47038 a!2831) j!81))))

(declare-fun lt!629630 () Unit!48380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97453 (_ BitVec 64) (_ BitVec 32)) Unit!48380)

(assert (=> b!1430114 (= lt!629630 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629628 j!81))))

(declare-fun arrayContainsKey!0 (array!97453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1430114 (arrayContainsKey!0 a!2831 lt!629628 #b00000000000000000000000000000000)))

(declare-fun lt!629629 () Unit!48380)

(assert (=> b!1430114 (= lt!629629 lt!629630)))

(declare-fun res!964649 () Bool)

(assert (=> b!1430114 (= res!964649 (= (seekEntryOrOpen!0 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) (Found!11317 j!81)))))

(assert (=> b!1430114 (=> (not res!964649) (not e!807430))))

(declare-fun d!153601 () Bool)

(declare-fun res!964650 () Bool)

(assert (=> d!153601 (=> res!964650 e!807428)))

(assert (=> d!153601 (= res!964650 (bvsge j!81 (size!47588 a!2831)))))

(assert (=> d!153601 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807428)))

(assert (= (and d!153601 (not res!964650)) b!1430113))

(assert (= (and b!1430113 c!132225) b!1430114))

(assert (= (and b!1430113 (not c!132225)) b!1430115))

(assert (= (and b!1430114 res!964649) b!1430112))

(assert (= (or b!1430112 b!1430115) bm!67411))

(declare-fun m!1320143 () Bool)

(assert (=> bm!67411 m!1320143))

(assert (=> b!1430113 m!1320063))

(assert (=> b!1430113 m!1320063))

(assert (=> b!1430113 m!1320065))

(assert (=> b!1430114 m!1320063))

(declare-fun m!1320145 () Bool)

(assert (=> b!1430114 m!1320145))

(declare-fun m!1320149 () Bool)

(assert (=> b!1430114 m!1320149))

(assert (=> b!1430114 m!1320063))

(assert (=> b!1430114 m!1320073))

(assert (=> b!1429967 d!153601))

(declare-fun d!153611 () Bool)

(assert (=> d!153611 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629648 () Unit!48380)

(declare-fun choose!38 (array!97453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48380)

(assert (=> d!153611 (= lt!629648 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153611 (validMask!0 mask!2608)))

(assert (=> d!153611 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629648)))

(declare-fun bs!41661 () Bool)

(assert (= bs!41661 d!153611))

(assert (=> bs!41661 m!1320085))

(declare-fun m!1320177 () Bool)

(assert (=> bs!41661 m!1320177))

(assert (=> bs!41661 m!1320069))

(assert (=> b!1429967 d!153611))

(declare-fun d!153621 () Bool)

(assert (=> d!153621 (= (validKeyInArray!0 (select (arr!47038 a!2831) j!81)) (and (not (= (select (arr!47038 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47038 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429959 d!153621))

(declare-fun b!1430150 () Bool)

(declare-fun e!807452 () Bool)

(declare-fun call!67416 () Bool)

(assert (=> b!1430150 (= e!807452 call!67416)))

(declare-fun bm!67413 () Bool)

(assert (=> bm!67413 (= call!67416 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430151 () Bool)

(declare-fun e!807450 () Bool)

(declare-fun e!807451 () Bool)

(assert (=> b!1430151 (= e!807450 e!807451)))

(declare-fun c!132239 () Bool)

(assert (=> b!1430151 (= c!132239 (validKeyInArray!0 (select (arr!47038 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430153 () Bool)

(assert (=> b!1430153 (= e!807451 call!67416)))

(declare-fun b!1430152 () Bool)

(assert (=> b!1430152 (= e!807451 e!807452)))

(declare-fun lt!629649 () (_ BitVec 64))

(assert (=> b!1430152 (= lt!629649 (select (arr!47038 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629651 () Unit!48380)

(assert (=> b!1430152 (= lt!629651 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629649 #b00000000000000000000000000000000))))

(assert (=> b!1430152 (arrayContainsKey!0 a!2831 lt!629649 #b00000000000000000000000000000000)))

(declare-fun lt!629650 () Unit!48380)

(assert (=> b!1430152 (= lt!629650 lt!629651)))

(declare-fun res!964659 () Bool)

(assert (=> b!1430152 (= res!964659 (= (seekEntryOrOpen!0 (select (arr!47038 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11317 #b00000000000000000000000000000000)))))

(assert (=> b!1430152 (=> (not res!964659) (not e!807452))))

(declare-fun d!153623 () Bool)

(declare-fun res!964660 () Bool)

(assert (=> d!153623 (=> res!964660 e!807450)))

(assert (=> d!153623 (= res!964660 (bvsge #b00000000000000000000000000000000 (size!47588 a!2831)))))

(assert (=> d!153623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807450)))

(assert (= (and d!153623 (not res!964660)) b!1430151))

(assert (= (and b!1430151 c!132239) b!1430152))

(assert (= (and b!1430151 (not c!132239)) b!1430153))

(assert (= (and b!1430152 res!964659) b!1430150))

(assert (= (or b!1430150 b!1430153) bm!67413))

(declare-fun m!1320179 () Bool)

(assert (=> bm!67413 m!1320179))

(declare-fun m!1320181 () Bool)

(assert (=> b!1430151 m!1320181))

(assert (=> b!1430151 m!1320181))

(declare-fun m!1320183 () Bool)

(assert (=> b!1430151 m!1320183))

(assert (=> b!1430152 m!1320181))

(declare-fun m!1320185 () Bool)

(assert (=> b!1430152 m!1320185))

(declare-fun m!1320187 () Bool)

(assert (=> b!1430152 m!1320187))

(assert (=> b!1430152 m!1320181))

(declare-fun m!1320189 () Bool)

(assert (=> b!1430152 m!1320189))

(assert (=> b!1429968 d!153623))

(declare-fun e!807459 () SeekEntryResult!11317)

(declare-fun b!1430160 () Bool)

(assert (=> b!1430160 (= e!807459 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47038 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430161 () Bool)

(declare-fun lt!629656 () SeekEntryResult!11317)

(assert (=> b!1430161 (and (bvsge (index!47662 lt!629656) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629656) (size!47588 a!2831)))))

(declare-fun res!964661 () Bool)

(assert (=> b!1430161 (= res!964661 (= (select (arr!47038 a!2831) (index!47662 lt!629656)) (select (arr!47038 a!2831) j!81)))))

(declare-fun e!807457 () Bool)

(assert (=> b!1430161 (=> res!964661 e!807457)))

(declare-fun e!807460 () Bool)

(assert (=> b!1430161 (= e!807460 e!807457)))

(declare-fun b!1430162 () Bool)

(declare-fun e!807456 () Bool)

(assert (=> b!1430162 (= e!807456 (bvsge (x!129287 lt!629656) #b01111111111111111111111111111110))))

(declare-fun d!153625 () Bool)

(assert (=> d!153625 e!807456))

(declare-fun c!132243 () Bool)

(assert (=> d!153625 (= c!132243 (and (is-Intermediate!11317 lt!629656) (undefined!12129 lt!629656)))))

(declare-fun e!807458 () SeekEntryResult!11317)

(assert (=> d!153625 (= lt!629656 e!807458)))

(declare-fun c!132244 () Bool)

(assert (=> d!153625 (= c!132244 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629655 () (_ BitVec 64))

(assert (=> d!153625 (= lt!629655 (select (arr!47038 a!2831) index!585))))

(assert (=> d!153625 (validMask!0 mask!2608)))

(assert (=> d!153625 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!629656)))

(declare-fun b!1430163 () Bool)

(assert (=> b!1430163 (and (bvsge (index!47662 lt!629656) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629656) (size!47588 a!2831)))))

(declare-fun res!964663 () Bool)

(assert (=> b!1430163 (= res!964663 (= (select (arr!47038 a!2831) (index!47662 lt!629656)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430163 (=> res!964663 e!807457)))

(declare-fun b!1430164 () Bool)

(assert (=> b!1430164 (= e!807458 (Intermediate!11317 true index!585 x!605))))

(declare-fun b!1430165 () Bool)

(assert (=> b!1430165 (and (bvsge (index!47662 lt!629656) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629656) (size!47588 a!2831)))))

(assert (=> b!1430165 (= e!807457 (= (select (arr!47038 a!2831) (index!47662 lt!629656)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430166 () Bool)

(assert (=> b!1430166 (= e!807459 (Intermediate!11317 false index!585 x!605))))

(declare-fun b!1430167 () Bool)

(assert (=> b!1430167 (= e!807458 e!807459)))

(declare-fun c!132245 () Bool)

(assert (=> b!1430167 (= c!132245 (or (= lt!629655 (select (arr!47038 a!2831) j!81)) (= (bvadd lt!629655 lt!629655) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430168 () Bool)

(assert (=> b!1430168 (= e!807456 e!807460)))

(declare-fun res!964662 () Bool)

(assert (=> b!1430168 (= res!964662 (and (is-Intermediate!11317 lt!629656) (not (undefined!12129 lt!629656)) (bvslt (x!129287 lt!629656) #b01111111111111111111111111111110) (bvsge (x!129287 lt!629656) #b00000000000000000000000000000000) (bvsge (x!129287 lt!629656) x!605)))))

(assert (=> b!1430168 (=> (not res!964662) (not e!807460))))

(assert (= (and d!153625 c!132244) b!1430164))

(assert (= (and d!153625 (not c!132244)) b!1430167))

(assert (= (and b!1430167 c!132245) b!1430166))

(assert (= (and b!1430167 (not c!132245)) b!1430160))

(assert (= (and d!153625 c!132243) b!1430162))

(assert (= (and d!153625 (not c!132243)) b!1430168))

(assert (= (and b!1430168 res!964662) b!1430161))

(assert (= (and b!1430161 (not res!964661)) b!1430163))

(assert (= (and b!1430163 (not res!964663)) b!1430165))

(declare-fun m!1320201 () Bool)

(assert (=> b!1430163 m!1320201))

(declare-fun m!1320203 () Bool)

(assert (=> b!1430160 m!1320203))

(assert (=> b!1430160 m!1320203))

(assert (=> b!1430160 m!1320063))

(declare-fun m!1320205 () Bool)

(assert (=> b!1430160 m!1320205))

(assert (=> b!1430165 m!1320201))

(assert (=> d!153625 m!1320083))

(assert (=> d!153625 m!1320069))

(assert (=> b!1430161 m!1320201))

(assert (=> b!1429958 d!153625))

(declare-fun d!153629 () Bool)

(assert (=> d!153629 (= (validKeyInArray!0 (select (arr!47038 a!2831) i!982)) (and (not (= (select (arr!47038 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47038 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429962 d!153629))

(declare-fun b!1430197 () Bool)

(declare-fun e!807481 () Bool)

(declare-fun contains!9860 (List!33548 (_ BitVec 64)) Bool)

(assert (=> b!1430197 (= e!807481 (contains!9860 Nil!33545 (select (arr!47038 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430198 () Bool)

(declare-fun e!807482 () Bool)

(declare-fun call!67419 () Bool)

(assert (=> b!1430198 (= e!807482 call!67419)))

(declare-fun b!1430199 () Bool)

(declare-fun e!807480 () Bool)

(declare-fun e!807479 () Bool)

(assert (=> b!1430199 (= e!807480 e!807479)))

(declare-fun res!964678 () Bool)

(assert (=> b!1430199 (=> (not res!964678) (not e!807479))))

(assert (=> b!1430199 (= res!964678 (not e!807481))))

(declare-fun res!964677 () Bool)

(assert (=> b!1430199 (=> (not res!964677) (not e!807481))))

(assert (=> b!1430199 (= res!964677 (validKeyInArray!0 (select (arr!47038 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430200 () Bool)

(assert (=> b!1430200 (= e!807482 call!67419)))

(declare-fun bm!67416 () Bool)

(declare-fun c!132254 () Bool)

(assert (=> bm!67416 (= call!67419 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132254 (Cons!33544 (select (arr!47038 a!2831) #b00000000000000000000000000000000) Nil!33545) Nil!33545)))))

(declare-fun b!1430201 () Bool)

(assert (=> b!1430201 (= e!807479 e!807482)))

(assert (=> b!1430201 (= c!132254 (validKeyInArray!0 (select (arr!47038 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153631 () Bool)

(declare-fun res!964679 () Bool)

(assert (=> d!153631 (=> res!964679 e!807480)))

(assert (=> d!153631 (= res!964679 (bvsge #b00000000000000000000000000000000 (size!47588 a!2831)))))

(assert (=> d!153631 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33545) e!807480)))

(assert (= (and d!153631 (not res!964679)) b!1430199))

(assert (= (and b!1430199 res!964677) b!1430197))

(assert (= (and b!1430199 res!964678) b!1430201))

(assert (= (and b!1430201 c!132254) b!1430200))

(assert (= (and b!1430201 (not c!132254)) b!1430198))

(assert (= (or b!1430200 b!1430198) bm!67416))

(assert (=> b!1430197 m!1320181))

(assert (=> b!1430197 m!1320181))

(declare-fun m!1320223 () Bool)

(assert (=> b!1430197 m!1320223))

(assert (=> b!1430199 m!1320181))

(assert (=> b!1430199 m!1320181))

(assert (=> b!1430199 m!1320183))

(assert (=> bm!67416 m!1320181))

(declare-fun m!1320225 () Bool)

(assert (=> bm!67416 m!1320225))

(assert (=> b!1430201 m!1320181))

(assert (=> b!1430201 m!1320181))

(assert (=> b!1430201 m!1320183))

(assert (=> b!1429960 d!153631))

(declare-fun e!807486 () SeekEntryResult!11317)

(declare-fun b!1430202 () Bool)

(assert (=> b!1430202 (= e!807486 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629565 lt!629566 mask!2608))))

(declare-fun b!1430203 () Bool)

(declare-fun lt!629670 () SeekEntryResult!11317)

(assert (=> b!1430203 (and (bvsge (index!47662 lt!629670) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629670) (size!47588 lt!629566)))))

(declare-fun res!964680 () Bool)

(assert (=> b!1430203 (= res!964680 (= (select (arr!47038 lt!629566) (index!47662 lt!629670)) lt!629565))))

(declare-fun e!807484 () Bool)

(assert (=> b!1430203 (=> res!964680 e!807484)))

(declare-fun e!807487 () Bool)

(assert (=> b!1430203 (= e!807487 e!807484)))

(declare-fun b!1430204 () Bool)

(declare-fun e!807483 () Bool)

(assert (=> b!1430204 (= e!807483 (bvsge (x!129287 lt!629670) #b01111111111111111111111111111110))))

(declare-fun d!153643 () Bool)

(assert (=> d!153643 e!807483))

(declare-fun c!132255 () Bool)

(assert (=> d!153643 (= c!132255 (and (is-Intermediate!11317 lt!629670) (undefined!12129 lt!629670)))))

(declare-fun e!807485 () SeekEntryResult!11317)

(assert (=> d!153643 (= lt!629670 e!807485)))

(declare-fun c!132256 () Bool)

(assert (=> d!153643 (= c!132256 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!629669 () (_ BitVec 64))

(assert (=> d!153643 (= lt!629669 (select (arr!47038 lt!629566) index!585))))

(assert (=> d!153643 (validMask!0 mask!2608)))

(assert (=> d!153643 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629565 lt!629566 mask!2608) lt!629670)))

(declare-fun b!1430205 () Bool)

(assert (=> b!1430205 (and (bvsge (index!47662 lt!629670) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629670) (size!47588 lt!629566)))))

(declare-fun res!964682 () Bool)

(assert (=> b!1430205 (= res!964682 (= (select (arr!47038 lt!629566) (index!47662 lt!629670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430205 (=> res!964682 e!807484)))

(declare-fun b!1430206 () Bool)

(assert (=> b!1430206 (= e!807485 (Intermediate!11317 true index!585 x!605))))

(declare-fun b!1430207 () Bool)

(assert (=> b!1430207 (and (bvsge (index!47662 lt!629670) #b00000000000000000000000000000000) (bvslt (index!47662 lt!629670) (size!47588 lt!629566)))))

