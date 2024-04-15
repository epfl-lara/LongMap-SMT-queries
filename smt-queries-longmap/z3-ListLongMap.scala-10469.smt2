; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123080 () Bool)

(assert start!123080)

(declare-fun b!1427307 () Bool)

(declare-fun res!962390 () Bool)

(declare-fun e!806171 () Bool)

(assert (=> b!1427307 (=> (not res!962390) (not e!806171))))

(declare-datatypes ((array!97296 0))(
  ( (array!97297 (arr!46963 (Array (_ BitVec 32) (_ BitVec 64))) (size!47515 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97296)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427307 (= res!962390 (validKeyInArray!0 (select (arr!46963 a!2831) j!81)))))

(declare-fun b!1427308 () Bool)

(declare-fun res!962393 () Bool)

(assert (=> b!1427308 (=> (not res!962393) (not e!806171))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427308 (= res!962393 (validKeyInArray!0 (select (arr!46963 a!2831) i!982)))))

(declare-fun b!1427309 () Bool)

(declare-fun res!962397 () Bool)

(declare-fun e!806172 () Bool)

(assert (=> b!1427309 (=> (not res!962397) (not e!806172))))

(declare-datatypes ((SeekEntryResult!11269 0))(
  ( (MissingZero!11269 (index!47468 (_ BitVec 32))) (Found!11269 (index!47469 (_ BitVec 32))) (Intermediate!11269 (undefined!12081 Bool) (index!47470 (_ BitVec 32)) (x!129096 (_ BitVec 32))) (Undefined!11269) (MissingVacant!11269 (index!47471 (_ BitVec 32))) )
))
(declare-fun lt!628362 () SeekEntryResult!11269)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!628364 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628363 () array!97296)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97296 (_ BitVec 32)) SeekEntryResult!11269)

(assert (=> b!1427309 (= res!962397 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628364 lt!628363 mask!2608) lt!628362))))

(declare-fun b!1427310 () Bool)

(declare-fun res!962400 () Bool)

(assert (=> b!1427310 (=> (not res!962400) (not e!806171))))

(assert (=> b!1427310 (= res!962400 (and (= (size!47515 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47515 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47515 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427311 () Bool)

(declare-fun res!962398 () Bool)

(assert (=> b!1427311 (=> (not res!962398) (not e!806171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97296 (_ BitVec 32)) Bool)

(assert (=> b!1427311 (= res!962398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun e!806173 () Bool)

(declare-fun b!1427312 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97296 (_ BitVec 32)) SeekEntryResult!11269)

(assert (=> b!1427312 (= e!806173 (= (seekEntryOrOpen!0 (select (arr!46963 a!2831) j!81) a!2831 mask!2608) (Found!11269 j!81)))))

(declare-fun b!1427313 () Bool)

(declare-fun res!962394 () Bool)

(assert (=> b!1427313 (=> (not res!962394) (not e!806171))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427313 (= res!962394 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47515 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47515 a!2831))))))

(declare-fun res!962391 () Bool)

(assert (=> start!123080 (=> (not res!962391) (not e!806171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123080 (= res!962391 (validMask!0 mask!2608))))

(assert (=> start!123080 e!806171))

(assert (=> start!123080 true))

(declare-fun array_inv!36196 (array!97296) Bool)

(assert (=> start!123080 (array_inv!36196 a!2831)))

(declare-fun b!1427314 () Bool)

(declare-fun res!962395 () Bool)

(assert (=> b!1427314 (=> (not res!962395) (not e!806171))))

(declare-datatypes ((List!33551 0))(
  ( (Nil!33548) (Cons!33547 (h!34855 (_ BitVec 64)) (t!48237 List!33551)) )
))
(declare-fun arrayNoDuplicates!0 (array!97296 (_ BitVec 32) List!33551) Bool)

(assert (=> b!1427314 (= res!962395 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33548))))

(declare-fun b!1427315 () Bool)

(declare-fun e!806174 () Bool)

(assert (=> b!1427315 (= e!806171 e!806174)))

(declare-fun res!962401 () Bool)

(assert (=> b!1427315 (=> (not res!962401) (not e!806174))))

(declare-fun lt!628360 () SeekEntryResult!11269)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427315 (= res!962401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46963 a!2831) j!81) mask!2608) (select (arr!46963 a!2831) j!81) a!2831 mask!2608) lt!628360))))

(assert (=> b!1427315 (= lt!628360 (Intermediate!11269 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427316 () Bool)

(assert (=> b!1427316 (= e!806172 (not true))))

(assert (=> b!1427316 e!806173))

(declare-fun res!962389 () Bool)

(assert (=> b!1427316 (=> (not res!962389) (not e!806173))))

(assert (=> b!1427316 (= res!962389 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48123 0))(
  ( (Unit!48124) )
))
(declare-fun lt!628361 () Unit!48123)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48123)

(assert (=> b!1427316 (= lt!628361 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427317 () Bool)

(assert (=> b!1427317 (= e!806174 e!806172)))

(declare-fun res!962399 () Bool)

(assert (=> b!1427317 (=> (not res!962399) (not e!806172))))

(assert (=> b!1427317 (= res!962399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628364 mask!2608) lt!628364 lt!628363 mask!2608) lt!628362))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427317 (= lt!628362 (Intermediate!11269 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427317 (= lt!628364 (select (store (arr!46963 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427317 (= lt!628363 (array!97297 (store (arr!46963 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47515 a!2831)))))

(declare-fun b!1427318 () Bool)

(declare-fun res!962396 () Bool)

(assert (=> b!1427318 (=> (not res!962396) (not e!806172))))

(assert (=> b!1427318 (= res!962396 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46963 a!2831) j!81) a!2831 mask!2608) lt!628360))))

(declare-fun b!1427319 () Bool)

(declare-fun res!962392 () Bool)

(assert (=> b!1427319 (=> (not res!962392) (not e!806172))))

(assert (=> b!1427319 (= res!962392 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123080 res!962391) b!1427310))

(assert (= (and b!1427310 res!962400) b!1427308))

(assert (= (and b!1427308 res!962393) b!1427307))

(assert (= (and b!1427307 res!962390) b!1427311))

(assert (= (and b!1427311 res!962398) b!1427314))

(assert (= (and b!1427314 res!962395) b!1427313))

(assert (= (and b!1427313 res!962394) b!1427315))

(assert (= (and b!1427315 res!962401) b!1427317))

(assert (= (and b!1427317 res!962399) b!1427318))

(assert (= (and b!1427318 res!962396) b!1427309))

(assert (= (and b!1427309 res!962397) b!1427319))

(assert (= (and b!1427319 res!962392) b!1427316))

(assert (= (and b!1427316 res!962389) b!1427312))

(declare-fun m!1317207 () Bool)

(assert (=> b!1427318 m!1317207))

(assert (=> b!1427318 m!1317207))

(declare-fun m!1317209 () Bool)

(assert (=> b!1427318 m!1317209))

(declare-fun m!1317211 () Bool)

(assert (=> b!1427309 m!1317211))

(assert (=> b!1427315 m!1317207))

(assert (=> b!1427315 m!1317207))

(declare-fun m!1317213 () Bool)

(assert (=> b!1427315 m!1317213))

(assert (=> b!1427315 m!1317213))

(assert (=> b!1427315 m!1317207))

(declare-fun m!1317215 () Bool)

(assert (=> b!1427315 m!1317215))

(declare-fun m!1317217 () Bool)

(assert (=> b!1427317 m!1317217))

(assert (=> b!1427317 m!1317217))

(declare-fun m!1317219 () Bool)

(assert (=> b!1427317 m!1317219))

(declare-fun m!1317221 () Bool)

(assert (=> b!1427317 m!1317221))

(declare-fun m!1317223 () Bool)

(assert (=> b!1427317 m!1317223))

(assert (=> b!1427312 m!1317207))

(assert (=> b!1427312 m!1317207))

(declare-fun m!1317225 () Bool)

(assert (=> b!1427312 m!1317225))

(declare-fun m!1317227 () Bool)

(assert (=> b!1427308 m!1317227))

(assert (=> b!1427308 m!1317227))

(declare-fun m!1317229 () Bool)

(assert (=> b!1427308 m!1317229))

(declare-fun m!1317231 () Bool)

(assert (=> b!1427316 m!1317231))

(declare-fun m!1317233 () Bool)

(assert (=> b!1427316 m!1317233))

(declare-fun m!1317235 () Bool)

(assert (=> start!123080 m!1317235))

(declare-fun m!1317237 () Bool)

(assert (=> start!123080 m!1317237))

(declare-fun m!1317239 () Bool)

(assert (=> b!1427311 m!1317239))

(assert (=> b!1427307 m!1317207))

(assert (=> b!1427307 m!1317207))

(declare-fun m!1317241 () Bool)

(assert (=> b!1427307 m!1317241))

(declare-fun m!1317243 () Bool)

(assert (=> b!1427314 m!1317243))

(check-sat (not b!1427317) (not b!1427314) (not b!1427311) (not start!123080) (not b!1427315) (not b!1427316) (not b!1427307) (not b!1427318) (not b!1427309) (not b!1427308) (not b!1427312))
(check-sat)
